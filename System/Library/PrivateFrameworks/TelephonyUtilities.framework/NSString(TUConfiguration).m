@interface NSString(TUConfiguration)
+ (uint64_t)tu_stringWithTUConfigurationAnnounceCalls:()TUConfiguration;
@end

@implementation NSString(TUConfiguration)

+ (uint64_t)tu_stringWithTUConfigurationAnnounceCalls:()TUConfiguration
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_1E58E8BE8 + a3);
  }
}

@end