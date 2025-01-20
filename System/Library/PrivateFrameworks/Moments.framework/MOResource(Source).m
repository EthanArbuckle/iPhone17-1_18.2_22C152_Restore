@interface MOResource(Source)
- (void)sourceAppBundleIds;
@end

@implementation MOResource(Source)

- (void)sourceAppBundleIds
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "[MOResourceTypeMedia] Error when serialization to dictionary, %@", (uint8_t *)&v2, 0xCu);
}

@end