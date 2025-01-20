@interface BRCStageRegistry(FPFSAdditions)
@end

@implementation BRCStageRegistry(FPFSAdditions)

- (void)saveXattrsForURL:()FPFSAdditions withMaximumSize:xattrSignature:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] unable to load the xattrs: %@%@", (void)v3, DWORD2(v3));
}

- (void)unlinkLiveStageFilename:()FPFSAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Got a nil live stage filename to unlink%@", (uint8_t *)&v2, 0xCu);
}

- (void)unlinkLiveStageFilename:()FPFSAdditions .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Unlinking %@ in live stage%@", (void)v3, DWORD2(v3));
}

- (void)rescueUnuploadedFile:()FPFSAdditions error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] FileID %llu is already on the upload stage directory%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end