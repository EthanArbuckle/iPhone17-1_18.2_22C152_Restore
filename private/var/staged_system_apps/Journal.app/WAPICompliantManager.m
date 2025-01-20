@interface WAPICompliantManager
+ (BOOL)regionReferenceWiFiAsWLAN;
@end

@implementation WAPICompliantManager

+ (BOOL)regionReferenceWiFiAsWLAN
{
  return _MGGetBoolAnswer(@"wapi", a2);
}

@end