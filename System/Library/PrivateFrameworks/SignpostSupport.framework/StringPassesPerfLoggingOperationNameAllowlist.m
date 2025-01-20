@interface StringPassesPerfLoggingOperationNameAllowlist
@end

@implementation StringPassesPerfLoggingOperationNameAllowlist

void ___StringPassesPerfLoggingOperationNameAllowlist_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  SignpostReporterMacOsPerfLoggingOperationNameAllowlist();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 setWithArray:v3];
  v2 = (void *)_StringPassesPerfLoggingOperationNameAllowlist_allowlistedOperationNameStringsSet;
  _StringPassesPerfLoggingOperationNameAllowlist_allowlistedOperationNameStringsSet = v1;
}

@end