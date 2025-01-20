@interface TPSPersonaUtilities
+ (void)_adoptPersonaForContainerLookupIfNeeded;
@end

@implementation TPSPersonaUtilities

+ (void)_adoptPersonaForContainerLookupIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_ERROR, "Failed adopting persona with error: %@", (uint8_t *)&v2, 0xCu);
}

@end