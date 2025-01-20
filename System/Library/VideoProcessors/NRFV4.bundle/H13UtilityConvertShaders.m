@interface H13UtilityConvertShaders
- (H13UtilityConvertShaders)initWithMetalContext:(id)a3 inputPixelFormat:(int)a4 outputPixelFormat:(int)a5;
- (MTLComputePipelineState)convert;
- (int)inputTexIndex;
- (int)outputTexIndex;
@end

@implementation H13UtilityConvertShaders

- (H13UtilityConvertShaders)initWithMetalContext:(id)a3 inputPixelFormat:(int)a4 outputPixelFormat:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v9 = convertSoftISPPixelFormatToShaderInt(v6);
  unsigned int v23 = v9;
  unsigned int v10 = convertSoftISPPixelFormatToShaderInt(v5);
  unsigned int v22 = v10;
  if (!v8
    || !v9
    || (unsigned int v11 = v10) == 0
    || (v21.receiver = self,
        v21.super_class = (Class)H13UtilityConvertShaders,
        v12 = [(H13UtilityConvertShaders *)&v21 init],
        (self = v12) == 0))
  {
    FigDebugAssert3();
    goto LABEL_23;
  }
  v13 = 0;
  if (v9 <= 0x1F)
  {
    if (((1 << v9) & 0xC0000C) != 0)
    {
      int v14 = 1;
    }
    else if (((1 << v9) & 0xC0000C00) != 0)
    {
      int v14 = 2;
    }
    else
    {
      if (((1 << v9) & 0x200002) == 0) {
        goto LABEL_21;
      }
      int v14 = 0;
    }
    v13 = 0;
    v12->_inputTexIndex = v14;
    if (v11 <= 0x1F)
    {
      if (((1 << v11) & 0xC0000C) != 0)
      {
        v15 = @"H13Utility::convertToUInt";
        int v16 = 11;
        goto LABEL_19;
      }
      if (((1 << v11) & 0xC0000C00) != 0)
      {
        v15 = @"H13Utility::convertToFloat";
        int v16 = 12;
LABEL_19:
        v12->_outputTexIndex = v16;
        id v17 = objc_alloc_init(MEMORY[0x263F128B0]);
        [v17 setConstantValue:&v23 type:29 atIndex:0];
        [v17 setConstantValue:&v22 type:29 atIndex:1];
        v18 = [v8 computePipelineStateFor:v15 constants:v17];
        convert = self->_convert;
        self->_convert = v18;

        if (self->_convert)
        {
          self = self;

          v13 = self;
          goto LABEL_21;
        }
        FigDebugAssert3();

LABEL_23:
        v13 = 0;
        goto LABEL_21;
      }
      if (((1 << v11) & 0x200002) != 0)
      {
        v15 = @"H13Utility::convertToInt";
        int v16 = 10;
        goto LABEL_19;
      }
    }
  }
LABEL_21:

  return v13;
}

- (MTLComputePipelineState)convert
{
  return self->_convert;
}

- (int)inputTexIndex
{
  return self->_inputTexIndex;
}

- (int)outputTexIndex
{
  return self->_outputTexIndex;
}

- (void).cxx_destruct
{
}

@end