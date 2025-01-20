@interface NSString(TPSCallingLineIdRestrictionAdditions)
+ (id)tps_stringWithTPSCallingLineIdRestrictionState:()TPSCallingLineIdRestrictionAdditions;
@end

@implementation NSString(TPSCallingLineIdRestrictionAdditions)

+ (id)tps_stringWithTPSCallingLineIdRestrictionState:()TPSCallingLineIdRestrictionAdditions
{
  if (a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)[[NSString alloc] initWithUTF8String:off_1E6EB2570[a3]];
  }
  return v4;
}

@end