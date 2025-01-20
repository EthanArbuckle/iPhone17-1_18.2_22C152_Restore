@interface PTCinematographyFrame(Private)
- (void)focusOnNothing;
@end

@implementation PTCinematographyFrame(Private)

- (void)_initWithCinematographyDictionary:()Private .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "warning: no detection found from legacy coefficients dictionary %@", (uint8_t *)&v2, 0xCu);
}

- (void)focusOnNothing
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "error: focusing on nothing", v1, 2u);
}

@end