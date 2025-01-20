@interface SXChapterComponentClassification
+ (id)roleString;
+ (int)role;
- (id)accessibilityContextualLabel;
@end

@implementation SXChapterComponentClassification

+ (int)role
{
  return 6;
}

+ (id)roleString
{
  return @"chapter";
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Chapter" value:&stru_26D5311C0 table:0];

  return v3;
}

@end