@interface SAUSSection
+ (id)section;
- (NSArray)cardResults;
- (NSArray)genericResults;
- (NSString)sectionTitle;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCardResults:(id)a3;
- (void)setGenericResults:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setSectionTitle:(id)a3;
@end

@implementation SAUSSection

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"Section";
}

+ (id)section
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)cardResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"cardResults", v3);
}

- (void)setCardResults:(id)a3
{
}

- (NSArray)genericResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"genericResults", v3);
}

- (void)setGenericResults:(id)a3
{
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

- (NSString)sectionTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sectionTitle"];
}

- (void)setSectionTitle:(id)a3
{
}

@end