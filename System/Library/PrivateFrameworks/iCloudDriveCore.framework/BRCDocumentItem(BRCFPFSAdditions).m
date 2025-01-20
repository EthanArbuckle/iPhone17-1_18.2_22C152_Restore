@interface BRCDocumentItem(BRCFPFSAdditions)
@end

@implementation BRCDocumentItem(BRCFPFSAdditions)

- (void)_initFromPQLResultSet:()BRCFPFSAdditions session:db:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: %@ isn't a dictionary!%@", (void)v3, DWORD2(v3));
}

- (void)updateFromServerItem:()BRCFPFSAdditions .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: Server item missing a version %@%@", (void)v3, DWORD2(v3));
}

- (void)updateFromServerItem:()BRCFPFSAdditions .cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isIdleOrRejected%@", v2, v3, v4, v5, v6);
}

- (void)updateFromServerItem:()BRCFPFSAdditions .cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)updateFromServerItem:()BRCFPFSAdditions .cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverItem%@", v2, v3, v4, v5, v6);
}

- (void)cancelDownloadWithEtag:()BRCFPFSAdditions downloadKind:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: downloadKind == BRCDownloadKindLoser%@", v2, v3, v4, v5, v6);
}

@end