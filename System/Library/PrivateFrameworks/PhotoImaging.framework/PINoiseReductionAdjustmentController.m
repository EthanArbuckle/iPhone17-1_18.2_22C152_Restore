@interface PINoiseReductionAdjustmentController
+ (NSString)amountKey;
@end

@implementation PINoiseReductionAdjustmentController

+ (NSString)amountKey
{
  return (NSString *)@"radius";
}

@end