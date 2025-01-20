@interface SXLinkButtonComponentClassification
+ (id)roleString;
+ (int)role;
- (id)accessibilityContextualLabel;
@end

@implementation SXLinkButtonComponentClassification

+ (id)roleString
{
  return @"link_button";
}

+ (int)role
{
  return 42;
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Link Button" value:&stru_26D5311C0 table:0];

  return v3;
}

@end