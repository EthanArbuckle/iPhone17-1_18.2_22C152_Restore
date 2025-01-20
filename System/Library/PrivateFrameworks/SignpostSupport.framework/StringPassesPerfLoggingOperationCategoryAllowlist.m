@interface StringPassesPerfLoggingOperationCategoryAllowlist
@end

@implementation StringPassesPerfLoggingOperationCategoryAllowlist

void ___StringPassesPerfLoggingOperationCategoryAllowlist_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 setWithArray:v3];
  v2 = (void *)_StringPassesPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryStringsSet;
  _StringPassesPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryStringsSet = v1;
}

@end