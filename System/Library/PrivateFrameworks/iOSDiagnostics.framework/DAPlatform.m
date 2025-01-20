@interface DAPlatform
+ (id)currentPlatform;
@end

@implementation DAPlatform

+ (id)currentPlatform
{
  return +[DAPlatform_iOS_NonUI sharedInstance];
}

@end