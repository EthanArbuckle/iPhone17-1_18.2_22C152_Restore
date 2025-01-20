@interface RawDFSyntheticLongShaders
+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3;
- (RawDFSyntheticLongShaders)initWithMetal:(id)a3;
- (id)getKernel:(int)a3;
- (id)getKernel:(int)a3 configFlags:(unsigned int)a4;
@end

@implementation RawDFSyntheticLongShaders

- (RawDFSyntheticLongShaders)initWithMetal:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RawDFSyntheticLongShaders;
  v5 = [(RawDFSyntheticLongShaders *)&v19 init];
  if (v5)
  {
    v6 = objc_opt_new();
    if (v6)
    {
      uint64_t v7 = 0;
      v18 = v5;
      v8 = (void **)v5->_kernelWithFunctionConstant[0];
      while (!+[RawDFSyntheticLongShaders isValidFunctionConstantCombo:v7])
      {
LABEL_8:
        ++v7;
        ++v8;
        if (v7 == 4)
        {

          v5 = v18;
          goto LABEL_10;
        }
      }
      [v6 reset];
      v20[0] = v7 & 1;
      [v6 setConstantValue:v20 type:53 atIndex:0];
      v20[0] = (v7 & 2) != 0;
      [v6 setConstantValue:v20 type:53 atIndex:1];
      uint64_t v9 = 0;
      v10 = v8;
      while (1)
      {
        v11 = objc_msgSend(NSString, "stringWithFormat:", @"RawDFSyntheticLong::%s", cKernelWithFunctionConstantsName[v9]);
        uint64_t v12 = [v4 computePipelineStateFor:v11 constants:v6];
        v13 = *v10;
        *v10 = (void *)v12;

        if (!*v10) {
          break;
        }

        ++v9;
        v10 += 4;
        if (v9 == 4) {
          goto LABEL_8;
        }
      }
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      v5 = v18;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v14 = 0;
  }
  else
  {
LABEL_10:
    v14 = v5;
  }

  return v14;
}

+ (BOOL)isValidFunctionConstantCombo:(unsigned int)a3
{
  return 1;
}

- (id)getKernel:(int)a3
{
  return 0;
}

- (id)getKernel:(int)a3 configFlags:(unsigned int)a4
{
  if ((a4 | a3) > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = self->_kernelWithFunctionConstant[a3][a4];
  }
  return v5;
}

- (void).cxx_destruct
{
  uint64_t v3 = 128;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end