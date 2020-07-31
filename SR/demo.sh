#SR for train
cd Train/


python main.py --template SR--save SR_X2 --scale 2 --reset --save_results --patch_size 96 --ext sep_set


python main.py --template SR--save SR_X3 --scale 3 --reset --save_results --patch_size 144 --ext sep_set

# SR x4  LR: 48 * 48  HR: 192 * 192
python main.py --template SR--save SR_X4 --scale 4 --reset --save_results --patch_size 192 --ext sep_set




#SR for test
cd Test/code/


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