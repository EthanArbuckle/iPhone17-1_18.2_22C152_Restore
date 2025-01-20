@interface SXEmbedVideoComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (id)accessibilityContextualLabel;
- (id)accessibilityCustomRotorMembership;
@end

@implementation SXEmbedVideoComponentClassification

+ (id)typeString
{
  return @"embed_video";
}

+ (int)role
{
  return 10;
}

+ (id)roleString
{
  return @"embedvideo";
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Video" value:&stru_26D5311C0 table:0];

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

@end