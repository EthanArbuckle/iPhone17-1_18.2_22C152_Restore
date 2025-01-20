@interface SXStripGalleryComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (id)accessibilityContextualLabel;
- (id)accessibilityCustomRotorMembership;
- (id)layoutRules;
@end

@implementation SXStripGalleryComponentClassification

+ (id)typeString
{
  return @"strip_gallery";
}

+ (int)role
{
  return 31;
}

+ (id)roleString
{
  return @"gallery";
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Gallery" value:&stru_26D5311C0 table:0];

  return v3;
}

- (id)accessibilityCustomRotorMembership
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[SXAXCustomRotorDefinition audioVideoRotor]();
  v4 = +[SXAXCustomRotor rotorWithName:v3];
  v5 = [v2 setWithObject:v4];

  return v5;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules fullWidthLayoutRules];
}

@end