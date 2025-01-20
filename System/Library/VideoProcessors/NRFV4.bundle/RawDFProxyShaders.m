@interface RawDFProxyShaders
- (RawDFProxyShaders)initWithMetal:(id)a3;
- (id)getKernel:(int)a3;
@end

@implementation RawDFProxyShaders

- (id)getKernel:(int)a3
{
  if (a3 > 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = self->_kernel[a3];
  }
  return v4;
}

- (RawDFProxyShaders)initWithMetal:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RawDFProxyShaders;
  v5 = [(RawDFProxyShaders *)&v17 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    kernel = v5->_kernel;
    char v9 = 1;
    while (1)
    {
      char v10 = v9;
      v11 = [NSString stringWithUTF8String:cKernelName[v7]];
      uint64_t v12 = [v4 computePipelineStateFor:v11 constants:0];
      v13 = kernel[v7];
      kernel[v7] = (MTLComputePipelineState *)v12;

      if (!kernel[v7]) {
        break;
      }

      char v9 = 0;
      uint64_t v7 = 1;
      if ((v10 & 1) == 0) {
        goto LABEL_5;
      }
    }
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v14 = 0;
  }
  else
  {
LABEL_5:
    v14 = v6;
  }

  return v14;
}

- (void).cxx_destruct
{
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end