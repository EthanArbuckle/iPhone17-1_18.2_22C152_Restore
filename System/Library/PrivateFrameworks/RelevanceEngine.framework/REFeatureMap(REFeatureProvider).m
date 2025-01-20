@interface REFeatureMap(REFeatureProvider)
@end

@implementation REFeatureMap(REFeatureProvider)

- (void)featureValueForName:()REFeatureProvider .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to create multiarray: %@", (uint8_t *)&v2, 0xCu);
}

@end