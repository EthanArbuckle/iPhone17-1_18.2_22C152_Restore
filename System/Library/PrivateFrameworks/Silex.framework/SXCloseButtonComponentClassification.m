@interface SXCloseButtonComponentClassification
+ (id)roleString;
+ (int)role;
- (id)accessibilityContextualLabel;
@end

@implementation SXCloseButtonComponentClassification

+ (int)role
{
  return 41;
}

+ (id)roleString
{
  return @"close_button";
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Close Button" value:&stru_26D5311C0 table:0];

  return v3;
}

@end