@interface SyntheticReferenceShaders
+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3;
- (SyntheticReferenceShaders)initWithMetal:(id)a3;
- (id)getKernel:(int)a3;
- (id)getKernel:(int)a3 configFlags:(unsigned int)a4;
@end

@implementation SyntheticReferenceShaders

- (id)getKernel:(int)a3
{
  return 0;
}

- (id)getKernel:(int)a3 configFlags:(unsigned int)a4
{
  v6 = 0;
  if (a3 <= 4 && a4 <= 0xF) {
    v6 = self->_kernelWithFunctionConstant[(unint64_t)a3][a4];
  }
  return v6;
}

+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3
{
  return (~a3 & 3) != 0;
}

- (SyntheticReferenceShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SyntheticReferenceShaders;
  v5 = [(SyntheticReferenceShaders *)&v23 init];
  if (v5)
  {
    v8 = objc_opt_new();
    if (v8)
    {
      v21 = v5;
      uint64_t v9 = 0;
      v10 = (void **)v5->_kernelWithFunctionConstant[0];
      while (!objc_msgSend_isValidFunctionConstantCombo_(SyntheticReferenceShaders, v6, v9, v7))
      {
LABEL_10:
        ++v9;
        ++v10;
        if (v9 == 16)
        {

          v5 = v21;
          goto LABEL_12;
        }
      }
      objc_msgSend_reset(v8, v6, v11, v7);
      for (uint64_t i = 0; i != 4; ++i)
      {
        char v22 = (v9 >> i) & 1;
        objc_msgSend_setConstantValue_type_atIndex_(v8, v6, (uint64_t)&v22, 53, i);
      }
      uint64_t v13 = 0;
      v14 = v10;
      while (1)
      {
        v15 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)off_2655C34A8[v13], v7);
        uint64_t v17 = objc_msgSend_computePipelineStateFor_constants_(v4, v16, (uint64_t)v15, (uint64_t)v8);
        v18 = *v14;
        *v14 = (void *)v17;

        if (!*v14) {
          break;
        }

        ++v13;
        v14 += 16;
        if (v13 == 5) {
          goto LABEL_10;
        }
      }
      FigDebugAssert3();
      FigSignalErrorAt();

      v5 = v21;
    }
    else
    {
      FigDebugAssert3();
    }

    v19 = 0;
  }
  else
  {
LABEL_12:
    v19 = v5;
  }

  return v19;
}

- (void).cxx_destruct
{
  uint64_t v3 = 640;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end