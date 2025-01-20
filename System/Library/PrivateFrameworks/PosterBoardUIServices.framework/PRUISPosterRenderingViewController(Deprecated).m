@interface PRUISPosterRenderingViewController(Deprecated)
@end

@implementation PRUISPosterRenderingViewController(Deprecated)

- (void)_cachedImageForRequest:()Deprecated .cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_25A03F000, v0, OS_LOG_TYPE_ERROR, "Error fetching latest snapshot bundle: %{public}@", v1, 0xCu);
}

@end