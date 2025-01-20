@interface PPNeuralNetwork
- (PPNeuralNetwork)initWithData:(id)a3;
- (double)_predict:(int)a3 freeInputsAfterUse:;
- (double)predictWithDoubles:(const double *)a3;
- (double)predictWithFloats:(const float *)a3;
- (float)_runOnInputs:(int)a3 freeInputsAfterUse:;
- (unint64_t)inputSize;
- (unint64_t)outputSize;
- (void)forInputs:(const float *)a3 computeOutputLayer:(float *)a4;
@end

@implementation PPNeuralNetwork

- (void).cxx_destruct
{
}

- (void)forInputs:(const float *)a3 computeOutputLayer:(float *)a4
{
  v6 = -[PPNeuralNetwork _runOnInputs:freeInputsAfterUse:](self, (float *)a3, 0);
  v7 = &self->_layers[self->_nlayers];
  uint64_t var1 = (int)v7[-1].var1;
  int __N = v7[-1].var1;
  if (v7[-1].var6)
  {
    vvexpf(a4, v6, &__N);
    double v9 = 0.0;
    if (__N >= 1)
    {
      v10 = a4;
      uint64_t v11 = __N;
      do
      {
        float v12 = *v10++;
        double v9 = v9 + v12;
        --v11;
      }
      while (v11);
    }
    float v13 = 1.0 / v9;
    cblas_sscal(__N, v13, a4, 1);
  }
  else
  {
    memcpy(a4, v6, 4 * var1);
  }
  free(v6);
}

- (float)_runOnInputs:(int)a3 freeInputsAfterUse:
{
  if (!a1) {
    return 0;
  }
  v3 = a2;
  if (!a1[3]) {
    return a2;
  }
  unint64_t v6 = 0;
  do
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = v7 + 20 * v6;
    if (*(unsigned char *)(v8 + 17)) {
      int v9 = *(_DWORD *)(v7 + 20 * v6);
    }
    else {
      int v9 = 0;
    }
    v10 = (float *)malloc_type_malloc(4 * (v9 + *(_DWORD *)(v8 + 4)), 0x100004052888210uLL);
    if (!v10)
    {
      id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v21);
    }
    __Y = v10;
    memcpy(v10, (const void *)(a1[2] + *(unsigned int *)(a1[4] + 20 * v6 + 12)), 4 * *(unsigned int *)(a1[4] + 20 * v6 + 4));
    cblas_sgemv(CblasRowMajor, CblasNoTrans, *(_DWORD *)(a1[4] + 20 * v6 + 4), *(_DWORD *)(a1[4] + 20 * v6), 1.0, (const float *)(a1[2] + *(unsigned int *)(a1[4] + 20 * v6 + 8)), *(_DWORD *)(a1[4] + 20 * v6), v3, 1, 1.0, __Y, 1);
    uint64_t v12 = a1[4];
    int v13 = *(unsigned __int8 *)(v12 + 20 * v6 + 16);
    if (*(unsigned char *)(v12 + 20 * v6 + 16))
    {
      if (v13 == 1)
      {
        uint64_t v18 = *(unsigned int *)(v12 + 20 * v6 + 4);
        v19 = __Y;
        if (v18)
        {
          do
          {
            float *v19 = tanhf(*v19);
            ++v19;
            --v18;
          }
          while (v18);
        }
      }
      else if (v13 == 2)
      {
        uint64_t v14 = *(unsigned int *)(v12 + 20 * v6 + 4);
        v15 = __Y;
        if (v14)
        {
          do
          {
            float *v15 = fmaxf(*v15, 0.0);
            ++v15;
            --v14;
          }
          while (v14);
        }
      }
    }
    else
    {
      uint64_t v16 = *(unsigned int *)(v12 + 20 * v6 + 4);
      if (v16)
      {
        v17 = __Y;
        do
        {
          float *v17 = 1.0 / (float)(expf(-*v17) + 1.0);
          ++v17;
          --v16;
        }
        while (v16);
      }
    }
    if (*(unsigned char *)(v12 + 20 * v6 + 17)) {
      memcpy(&__Y[*(unsigned int *)(v12 + 20 * v6 + 4)], v3, 4 * *(unsigned int *)(v12 + 20 * v6));
    }
    if (v6 || a3) {
      free(v3);
    }
    ++v6;
    v3 = __Y;
  }
  while (v6 < a1[3]);
  return __Y;
}

- (double)predictWithFloats:(const float *)a3
{
  return -[PPNeuralNetwork _predict:freeInputsAfterUse:](self, (float *)a3, 0);
}

- (double)_predict:(int)a3 freeInputsAfterUse:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[3] - 1;
  int v8 = *(_DWORD *)(v6 + 20 * v7 + 4);
  if (v8 != 1 && (v8 != 2 || !*(unsigned char *)(v6 + 20 * v7 + 18)))
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel__predict_freeInputsAfterUse_, a1, @"PPNeuralNetwork.m", 137, @"Invalid parameter not satisfying: %@", @"_layers[_nlayers-1].outsz == 1 || (_layers[_nlayers-1].outsz == 2 && _layers[_nlayers-1].softmax)" object file lineNumber description];
  }
  v10 = -[PPNeuralNetwork _runOnInputs:freeInputsAfterUse:](a1, a2, a3);
  uint64_t v11 = v10;
  double v12 = *v10;
  if (*(unsigned char *)(a1[4] + 20 * a1[3] - 2))
  {
    double v13 = exp(*v10);
    double v12 = v13 / (v13 + exp(v11[1]));
  }
  free(v11);
  return v12;
}

- (double)predictWithDoubles:(const double *)a3
{
  v5 = (float *)malloc_type_malloc(4 * self->_layers->var0, 0x100004052888210uLL);
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v11);
  }
  uint64_t var0 = self->_layers->var0;
  if (var0)
  {
    uint64_t v7 = v5;
    do
    {
      double v8 = *a3++;
      float v9 = v8;
      *v7++ = v9;
      --var0;
    }
    while (var0);
  }
  return -[PPNeuralNetwork _predict:freeInputsAfterUse:](self, v5, 1);
}

- (unint64_t)outputSize
{
  return self->_layers[self->_nlayers - 1].var1;
}

- (unint64_t)inputSize
{
  return self->_layers->var0;
}

- (PPNeuralNetwork)initWithData:(id)a3
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPNeuralNetwork;
  uint64_t v7 = [(PPNeuralNetwork *)&v13 init];
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    float v9 = (unsigned int *)[v6 bytes];
    unint64_t v10 = *v9;
    v8->_dataBytes = (const char *)v9;
    v8->_nlayers = v10;
    if (!v10)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v8, @"PPNeuralNetwork.m", 55, @"Invalid parameter not satisfying: %@", @"_nlayers > 0" object file lineNumber description];
    }
    v8->_layers = (const $278F8F5807AB85F6E7DDBD32FD86D511 *)(v9 + 1);
  }

  return v8;
}

@end