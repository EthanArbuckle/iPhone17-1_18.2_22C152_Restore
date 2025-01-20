@interface ATSSymbolicationProvider
- (BOOL)shouldAmendWithFile:(ktrace_file *)a3 error:(id *)a4;
- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6;
- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4;
- (id)describeChunk:(ktrace_chunk *)a3;
- (void)configurePostprocessingWithSession:(ktrace_session *)a3;
- (void)dealloc;
- (void)postprocessingCompleteWithFile:(ktrace_file *)a3;
- (void)willFinishWithCatalog:(ktrace_catalog *)a3 file:(ktrace_file *)a4;
@end

@implementation ATSSymbolicationProvider

- (void)dealloc
{
  ats_destroy_symbolication_config();
  v3.receiver = self;
  v3.super_class = (Class)ATSSymbolicationProvider;
  [(ATSSymbolicationProvider *)&v3 dealloc];
}

- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  symbolication_config = (ats_symbolication_config *)ats_create_symbolication_config();
  self->_symbolicationConfig = symbolication_config;
  unsigned __int8 v13 = 1;
  symbolication_config->var4 = 1;
  objc_storeStrong((id *)&self->_logger, a3);
  objc_storeStrong((id *)&qword_8408, self->_logger);
  self->_symbolicationConfig->var5 = sub_345C;
  if (!v11) {
    goto LABEL_19;
  }
  v14 = [v11 objectForKeyedSubscript:@"fetch-instructions"];

  if (v14)
  {
    self->_symbolicationConfig->var2 = 0;
    v15 = [v11 objectForKeyedSubscript:@"fetch-instructions"];
    if ([v15 isEqualToString:@"active-symbols"])
    {
      unsigned int v16 = 1;
    }
    else
    {
      if (![v15 isEqualToString:@"all"])
      {
LABEL_8:

        goto LABEL_9;
      }
      unsigned int v16 = 2;
    }
    self->_symbolicationConfig->var0 = v16;
    goto LABEL_8;
  }
LABEL_9:
  v17 = [v11 objectForKeyedSubscript:@"dsym-path"];

  if (v17)
  {
    self->_symbolicationConfig->var2 = 1;
    v18 = [v11 objectForKeyedSubscript:@"dsym-path"];
    self->_symbolicationConfig->var1 = 1;
    v19 = (char *)[v18 length];
    if (v19) {
      v19 = (char *)[v18 UTF8String];
    }
    self->_symbolicationConfig->var3 = v19;
  }
  v20 = [v11 objectForKeyedSubscript:@"method"];

  unsigned __int8 v13 = 1;
  if (v20)
  {
    self->_symbolicationConfig->var2 = 1;
    v21 = [v11 objectForKeyedSubscript:@"method"];
    unsigned __int8 v13 = [v21 isEqualToString:@"download"];
    if (v13)
    {
      self->_symbolicationConfig->var1 = 2;
    }
    else if (a6)
    {
      sub_34C8(@"Unrecognized symbolication method option: %@", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_19:

  return v13;
}

- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)shouldAmendWithFile:(ktrace_file *)a3 error:(id *)a4
{
  symbolicationConfig = self->_symbolicationConfig;
  if (symbolicationConfig->var2 != 1) {
    *(void *)&symbolicationConfig->var1 = 0x100000000;
  }
  if (a4)
  {
    sub_34C8(@"Amending symbolication is not supported on this platform. Run this command on the host.", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)configurePostprocessingWithSession:(ktrace_session *)a3
{
}

- (void)postprocessingCompleteWithFile:(ktrace_file *)a3
{
  if (self->_symbolicationConfig->var2 == 1) {
    _ats_postprocessing_complete(a3, a2);
  }
}

- (void)willFinishWithCatalog:(ktrace_catalog *)a3 file:(ktrace_file *)a4
{
  if (!self->_symbolicationConfig->var2) {
    _ats_postprocessing_complete(a4, a2);
  }
}

- (id)describeChunk:(ktrace_chunk *)a3
{
  if (ktrace_chunk_tag() == 20583) {
    return @"symbols";
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end