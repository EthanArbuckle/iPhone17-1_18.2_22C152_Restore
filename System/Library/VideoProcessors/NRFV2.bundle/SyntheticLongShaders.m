@interface SyntheticLongShaders
+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3;
- (SyntheticLongShaders)initWithMetal:(id)a3;
- (id)getKernel:(int)a3;
- (id)getKernel:(int)a3 configFlags:(unsigned int)a4;
@end

@implementation SyntheticLongShaders

- (id)getKernel:(int)a3
{
  if (a3)
  {
    v4 = 0;
  }
  else
  {
    v4 = self->_kernel[0];
  }
  return v4;
}

- (id)getKernel:(int)a3 configFlags:(unsigned int)a4
{
  v6 = 0;
  if (a3 <= 2 && a4 <= 0xFF) {
    v6 = self->_kernelWithFunctionConstant[(unint64_t)a3][a4];
  }
  return v6;
}

+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3
{
  return (~a3 & 3) != 0 && (~a3 & 0xC) != 0;
}

- (SyntheticLongShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SyntheticLongShaders;
  v5 = [(SyntheticLongShaders *)&v33 init];
  if (!v5) {
    goto LABEL_16;
  }
  v8 = objc_opt_new();
  if (!v8)
  {
    FigDebugAssert3();
LABEL_19:

    v29 = 0;
    goto LABEL_17;
  }
  v31 = v5;
  uint64_t v9 = 0;
  v10 = (void **)v5->_kernelWithFunctionConstant[0];
  do
  {
    if (objc_msgSend_isValidFunctionConstantCombo_(SyntheticLongShaders, v6, v9, v7))
    {
      objc_msgSend_reset(v8, v6, v11, v7);
      for (uint64_t i = 0; i != 8; ++i)
      {
        char v32 = (v9 >> i) & 1;
        objc_msgSend_setConstantValue_type_atIndex_(v8, v6, (uint64_t)&v32, 53, i);
      }
      uint64_t v13 = 0;
      v14 = v10;
      do
      {
        if (v9 == (dword_263117DD0[v13] & v9))
        {
          v15 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)off_2655C3538[v13], v7);
          uint64_t v17 = objc_msgSend_computePipelineStateFor_constants_(v4, v16, (uint64_t)v15, (uint64_t)v8);
          v18 = *v14;
          *v14 = (void *)v17;

          if (!*v14)
          {
            FigDebugAssert3();
            FigSignalErrorAt();

            v5 = v31;
            goto LABEL_19;
          }
        }
        ++v13;
        v14 += 256;
      }
      while (v13 != 3);
    }
    ++v9;
    ++v10;
  }
  while (v9 != 256);
  v19 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"kernelDownSample", v7);
  v23 = objc_msgSend_library(v4, v20, v21, v22);
  v25 = objc_msgSend_newFunctionWithName_constantValues_error_(v23, v24, (uint64_t)v19, (uint64_t)v8, 0);

  if (!v25)
  {
    FigDebugAssert3();
    v5 = v31;
LABEL_23:
    FigSignalErrorAt();

    goto LABEL_19;
  }
  uint64_t v27 = objc_msgSend_computePipelineStateFor_constants_(v4, v26, (uint64_t)v19, (uint64_t)v8);
  v5 = v31;
  v28 = v31->_kernel[0];
  v31->_kernel[0] = (MTLComputePipelineState *)v27;

  if (!v31->_kernel[0])
  {
    FigDebugAssert3();
    goto LABEL_23;
  }

LABEL_16:
  v29 = v5;
LABEL_17:

  return v29;
}

- (void).cxx_destruct
{
  uint64_t v3 = (id *)&self->_kernelWithFunctionConstant[2][255];
  uint64_t v4 = -6144;
  do
  {
    objc_storeStrong(v3--, 0);
    v4 += 8;
  }
  while (v4);

  objc_storeStrong((id *)self->_kernel, 0);
}

@end