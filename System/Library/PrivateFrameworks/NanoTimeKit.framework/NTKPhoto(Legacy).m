@interface NTKPhoto(Legacy)
@end

@implementation NTKPhoto(Legacy)

- (void)initWithLegacySidecar:()Legacy .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v6 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "%@: cannot read photo info from %@", v7, 0x16u);
}

- (void)initWithLegacySidecar:()Legacy .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "_imagePixelSizeFromFile: cannot create ImageSourceRef for %@", v2, v3, v4, v5, v6);
}

- (void)initWithLegacySidecar:()Legacy .cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "_imagePixelSizeFromFile: cannot get ImageSource properties for %@", v2, v3, v4, v5, v6);
}

@end