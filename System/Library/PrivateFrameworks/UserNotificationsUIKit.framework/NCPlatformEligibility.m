@interface NCPlatformEligibility
+ (BOOL)areGenerativeModelsAvailable;
- (NCPlatformEligibility)init;
@end

@implementation NCPlatformEligibility

+ (BOOL)areGenerativeModelsAvailable
{
  return MEMORY[0x1D947FDA0](a1, a2) & 1;
}

- (NCPlatformEligibility)init
{
  v3.receiver = self;
  v3.super_class = (Class)NCPlatformEligibility;
  return [(NCPlatformEligibility *)&v3 init];
}

@end