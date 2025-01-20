@interface PRXNavigationController
- (BOOL)_canShowWhileLocked;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation PRXNavigationController

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v5 = PRXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PRXNavigationController preferredContentSizeDidChangeForChildContentContainer:]((uint64_t)v4, v5);
  }

  v6 = [(PRXNavigationController *)self topViewController];
  v7 = v6;
  if (!v6 || [v6 isEqual:v4])
  {
    [v4 preferredContentSize];
    -[PRXNavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C6D2000, a2, OS_LOG_TYPE_DEBUG, "preferredContentSizeDidChangeForChildContentContainer: %@", (uint8_t *)&v2, 0xCu);
}

@end