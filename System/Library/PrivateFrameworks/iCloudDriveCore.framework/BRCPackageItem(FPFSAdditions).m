@interface BRCPackageItem(FPFSAdditions)
@end

@implementation BRCPackageItem(FPFSAdditions)

- (void)_initWithURL:()FPFSAdditions inPackage:forItem:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_23FA42000, v1, (os_log_type_t)0x90u, "[ERROR] Failed to get canonical path for pkg item in %@%@", v2, 0x16u);
}

@end