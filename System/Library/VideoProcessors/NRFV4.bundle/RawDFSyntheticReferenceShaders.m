@interface RawDFSyntheticReferenceShaders
+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3;
- (RawDFSyntheticReferenceShaders)initWithMetal:(id)a3;
- (id)getKernel:(int)a3;
- (id)getKernel:(int)a3 configFlags:(unsigned int)a4;
@end

@implementation RawDFSyntheticReferenceShaders

- (RawDFSyntheticReferenceShaders)initWithMetal:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RawDFSyntheticReferenceShaders;
  v5 = [(RawDFSyntheticReferenceShaders *)&v23 init];
  if (v5)
  {
    v6 = objc_opt_new();
    if (v6)
    {
      uint64_t v7 = 0;
      kernelWithFunctionConstant = v5->_kernelWithFunctionConstant;
      do
      {
        if (+[RawDFSyntheticReferenceShaders isValidFunctionConstantCombo:v7])
        {
          [v6 reset];
          v24[0] = v7 & 1;
          [v6 setConstantValue:v24 type:53 atIndex:0];
          v24[0] = (v7 & 2) != 0;
          [v6 setConstantValue:v24 type:53 atIndex:1];
          v9 = objc_msgSend(NSString, "stringWithFormat:", @"RawDFSyntheticReference::%s", "kernelRawDFDeepShadowRecovery");
          uint64_t v10 = [v4 computePipelineStateFor:v9 constants:v6];
          v11 = (*kernelWithFunctionConstant)[v7];
          (*kernelWithFunctionConstant)[v7] = (MTLComputePipelineState *)v10;

          if (!(*kernelWithFunctionConstant)[v7])
          {
            v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_17;
          }
        }
        ++v7;
      }
      while (v7 != 4);
      uint64_t v12 = 0;
      kernel = v5->_kernel;
      char v14 = 1;
      while (1)
      {
        char v15 = v14;
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"RawDFSyntheticReference::%s", cKernelName_0[v12]);
        uint64_t v17 = [v4 computePipelineStateFor:v16 constants:v6];
        v18 = kernel[v12];
        kernel[v12] = (MTLComputePipelineState *)v17;

        if (!kernel[v12]) {
          break;
        }

        char v14 = 0;
        uint64_t v12 = 1;
        if ((v15 & 1) == 0)
        {

          goto LABEL_12;
        }
      }
      v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }

LABEL_17:
    v19 = 0;
  }
  else
  {
LABEL_12:
    v19 = v5;
  }

  return v19;
}

+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3
{
  return (~a3 & 3) != 0;
}

- (id)getKernel:(int)a3
{
  if (a3 > 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = self->_kernel[a3];
  }
  return v4;
}

- (id)getKernel:(int)a3 configFlags:(unsigned int)a4
{
  v6 = 0;
  if (!a3 && a4 <= 3) {
    v6 = self->_kernelWithFunctionConstant[0][a4];
  }
  return v6;
}

- (void).cxx_destruct
{
  for (uint64_t i = 48; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end