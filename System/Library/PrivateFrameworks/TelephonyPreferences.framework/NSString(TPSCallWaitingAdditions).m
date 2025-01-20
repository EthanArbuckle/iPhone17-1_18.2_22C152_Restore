@interface NSString(TPSCallWaitingAdditions)
+ (id)tps_stringWithTPSCallWaitingState:()TPSCallWaitingAdditions;
@end

@implementation NSString(TPSCallWaitingAdditions)

+ (id)tps_stringWithTPSCallWaitingState:()TPSCallWaitingAdditions
{
  if (a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)[[NSString alloc] initWithUTF8String:off_1E6EB2498[a3]];
  }
  return v4;
}

@end