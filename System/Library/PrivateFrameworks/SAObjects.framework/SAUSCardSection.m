@interface SAUSCardSection
+ (id)cardSection;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPunchOut:(id)a3;
@end

@implementation SAUSCardSection

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"CardSection";
}

+ (id)cardSection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

@end