@interface TSOBTableWelcomeController
- (CGSize)preferredContentSize;
- (void)viewDidLoad;
@end

@implementation TSOBTableWelcomeController

- (void)viewDidLoad
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "-[TSOBTableWelcomeController viewDidLoad]";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]no delegate for view controller : %@ @%s", v1, 0x16u);
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end