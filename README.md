# SR_PyTorch
###Here are several image super-resolution reconstruction codes based on deep learning.



All reconstructed SR images can be downloaded from <a href="https://www.jianguoyun.com/p/DSc6bJcQ19ySBxiM_IUBf">here</a> .

All test datasets (Preprocessed HR images) can be downloaded from <a href="https://www.jianguoyun.com/p/DcrVSz0Q19ySBxiTs4oB">here</a>.

All original test datasets (HR images) can be downloaded from <a href="https://www.jianguoyun.com/p/DaSU0L4Q19ySBxi_qJAB">here</a>.





## Prerequisites:
1. Python 3.6
2. PyTorch >= 0.4.0
3. numpy
4. skimage
5. imageio
6. matplotlib
7. tqdm

For more informaiton, please refer to <a href="https://github.com/thstkdgus35/EDSR-PyTorch">EDSR</a> and <a href="https://github.com/yulunzhang/RCAN">RCAN</a>.



## Document
Train/             : all train files

Test/              : all test files

demo.sh        : all running instructions


## Dataset
We used DIV2K dataset to train our model. Please download it from <a href="https://data.vision.ee.ethz.ch/cvl/DIV2K/">here</a>  or  <a href="https://cv.snu.ac.kr/research/EDSR/DIV2K.tar">SNU_CVLab</a>.

Extract the file and put it into the Train/dataset.


## Training

Use --ext sep_reset argument on your first running. 

You can skip the decoding part and use saved binaries with --ext sep argument in second time.
 
```
  cd Train/
  # SR x2  LR: 48 * 48  HR: 96 * 96
  python main.py --template SR --save SR_X2 --scale 2 --reset --save_results --patch_size 96 --ext sep_reset
  
  # SR x3  LR: 48 * 48  HR: 144 * 144
  python main.py --template SR --save SR_X3 --scale 3 --reset --save_results --patch_size 144 --ext sep_reset
  
  # SR x4  LR: 48 * 48  HR: 192 * 192
  python main.py --template SR --save SR_X4 --scale 4 --reset --save_results --patch_size 192 --ext sep_reset

```

## Testing
Using pre-trained model for training, all test datasets must be pretreatment by  Prepare_TestData_HR_LR.m and all pre-trained model should be put into Test/model/ first.

```
#SR x2
python main.py --data_test MyImage --scale 2 --model SR --pre_train ../model/SR_x2.pt --test_only --save_results --chop --save "SR" --testpath ../LR/LRBI --testset Set5

#SR+ x2
python main.py --data_test MyImage --scale 2 --model SR --pre_train ../model/SR_x2.pt --test_only --save_results --chop --self_ensemble --save "SR_plus" --testpath ../LR/LRBI --testset Set5


#SR x3
python main.py --data_test MyImage --scale 3 --model SR --pre_train ../model/SR_x3.pt --test_only --save_results --chop --save "SR" --testpath ../LR/LRBI --testset Set5

#SR+ x3
python main.py --data_test MyImage --scale 3 --model SR --pre_train ../model/SR_x3.pt --test_only --save_results --chop --self_ensemble --save "SR_plus" --testpath ../LR/LRBI --testset Set5


#SR x4
python main.py --data_test MyImage --scale 4 --model SR --pre_train ../model/SR_x4.pt --test_only --save_results --chop --save "SR" --testpath ../LR/LRBI --testset Set5

#SR+ x4
python main.py --data_test MyImage --scale 4 --model SR --pre_train ../model/SR_x4.pt --test_only --save_results --chop --self_ensemble --save "SR_plus" --testpath ../LR/LRBI --testset Set5
```

We also introduce self-ensemble strategy to improve our SR and denote the self-ensembled version as SR+.

More running instructions can be found in demo.sh.


## Performance




## Convergence Analyses




