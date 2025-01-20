@interface NTNoContentModuleDescriptorsOperation
- (BOOL)validateOperation;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)validateOperation;
@end

@implementation NTNoContentModuleDescriptorsOperation

- (BOOL)validateOperation
{
  v2 = [(NTTodayModuleDescriptorsOperation *)self descriptorsCompletion];

  if (!v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNoContentModuleDescriptorsOperation validateOperation]();
  }
  return v2 != 0;
}

- (void)performOperation
{
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(NTTodayModuleDescriptorsOperation *)self descriptorsCompletion];
  (*((void (**)(id, void, void, id))v5 + 2))(v5, MEMORY[0x263EFFA68], 0, v4);
}

- (void)validateOperation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"module descriptors operation requires completion"];
  int v1 = 136315906;
  v2 = "-[NTNoContentModuleDescriptorsOperation validateOperation]";
  __int16 v3 = 2080;
  id v4 = "NTNoContentModuleDescriptorsOperation.m";
  __int16 v5 = 1024;
  int v6 = 19;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end