@interface SBIconBlockedForScreenTimeExpirationLabelAccessoryView
+ (id)labelAccessorySystemImageName;
+ (int64_t)labelAccessorySystemImageScale;
@end

@implementation SBIconBlockedForScreenTimeExpirationLabelAccessoryView

+ (id)labelAccessorySystemImageName
{
  return @"hourglass.tophalf.fill";
}

+ (int64_t)labelAccessorySystemImageScale
{
  return 1;
}

@end