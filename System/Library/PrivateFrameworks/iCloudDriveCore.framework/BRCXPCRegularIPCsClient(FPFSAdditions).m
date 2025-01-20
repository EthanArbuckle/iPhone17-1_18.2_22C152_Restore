@interface BRCXPCRegularIPCsClient(FPFSAdditions)
@end

@implementation BRCXPCRegularIPCsClient(FPFSAdditions)

- (void)accessItemIdentifier:()FPFSAdditions dbAccessKind:synchronouslyIfPossible:LocalItemHandler:ServerItemHandler:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: (localItemHandler || serverItemHandler) && !(localItemHandler && serverItemHandler)%@", v2, v3, v4, v5, v6);
}

- (void)removeFPFSDomain:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Didn't find any FPFS domain to remove for persona = %@%@");
}

- (void)removeFPFSDomain:()FPFSAdditions .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Got an error while looking for the domain: %@%@");
}

- (void)createItemBasedOnTemplate:()FPFSAdditions fields:contents:options:additionalItemAttributes:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: urlWrapper == nil%@", v2, v3, v4, v5, v6);
}

- (void)createItemBasedOnTemplate:()FPFSAdditions fields:contents:options:additionalItemAttributes:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to parse bookmark data on %@%@", v1, 0x16u);
}

- (void)_createFileProvidingRequestOperationOfFileObject:()FPFSAdditions localItem:etagIfLoser:etagToDownload:progress:options:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Got a nil etag for %@ - returning an error to FP%@");
}

- (void)_createFileProvidingRequestOperationOfFileObject:()FPFSAdditions localItem:etagIfLoser:etagToDownload:progress:options:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Item %@ is waiting for re-apply from the server truth%@");
}

- (void)_createFileProvidingRequestOperationOfFileObject:()FPFSAdditions localItem:etagIfLoser:etagToDownload:progress:options:reply:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] We asked FP to reingest item %@, but we still don't have the fileID to upload%@");
}

- (void)reimportItemIdentifier:()FPFSAdditions reply:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Starting BRCXPCClient(FPFS)::reimport%@", v2, v3, v4, v5, v6);
}

- (void)validateConnectionDomainWithDomainIdentifier:()FPFSAdditions databaseID:backChannel:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Extension is using a valid domain ID and database ID, we are open for business...%@", v2, v3, v4, v5, v6);
}

@end