import math

import torch
import torch.nn as nn
import torch.nn.functional as F

from torch.autograd import Variable
x = torch.randn(2,1,7,3)
print(x.shape)
conv = nn.Conv2d(1,8,(2,3),True)
res = conv(x)
print(res)
print(res.shape)