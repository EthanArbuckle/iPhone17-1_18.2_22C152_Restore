@interface ASKMobileGestalt
+ (BOOL)wapiCapability;
@end

@implementation ASKMobileGestalt

+ (BOOL)wapiCapability
{
  return _MGGetBoolAnswer(@"wapi", a2);
}

@end