@interface SXHeading1ComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (id)accessibilityContextualLabel;
- (id)accessibilityCustomRotorMembership;
@end

@implementation SXHeading1ComponentClassification

+ (id)typeString
{
  return @"text";
}

+ (int)role
{
  return 14;
}

+ (id)roleString
{
  return @"heading1";
}

- (id)accessibilityContextualLabel
{
  v2 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26D593D10 numberStyle:0];
  v3 = SXBundle();
  v4 = [v3 localizedStringForKey:@"Heading level %@" value:&stru_26D5311C0 table:0];

  v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, v2);

  return v5;
}

- (id)accessibilityCustomRotorMembership
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[SXAXCustomRotorDefinition headingsRotor]();
  v4 = +[SXAXCustomRotor rotorWithName:v3];
  v5 = [v2 setWithObject:v4];

  return v5;
}

@end