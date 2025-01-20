@interface TRITaskCapabilityUtilities
+ (BOOL)requiredCapabilities:(unint64_t)a3 areSupportedByAllowedCapabilities:(unint64_t)a4;
@end

@implementation TRITaskCapabilityUtilities

+ (BOOL)requiredCapabilities:(unint64_t)a3 areSupportedByAllowedCapabilities:(unint64_t)a4
{
  return (a3 & ~a4) == 0;
}

@end