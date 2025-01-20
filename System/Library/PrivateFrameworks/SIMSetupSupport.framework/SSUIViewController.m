@interface SSUIViewController
- (void)viewDidLoad;
@end

@implementation SSUIViewController

- (void)viewDidLoad
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "-[SSUIViewController viewDidLoad]";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]no delegate for view controller : %@ @%s", v1, 0x16u);
}

@end