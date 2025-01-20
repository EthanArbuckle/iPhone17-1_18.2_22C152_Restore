@interface NRMockRegistryClient
+ (Class)xpcConnectionClass;
- (NRMockRegistryClient)init;
@end

@implementation NRMockRegistryClient

- (NRMockRegistryClient)init
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"NRRegistryPlatformSupportsWatch";
  v7[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [(NRRegistryClient *)self initWithParameters:v3];

  return v4;
}

+ (Class)xpcConnectionClass
{
  return (Class)objc_opt_class();
}

@end