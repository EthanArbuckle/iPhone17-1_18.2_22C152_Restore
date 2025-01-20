@interface SAAnswerDomainObject
+ (id)domainObject;
- (NSArray)linkedAnswerGroups;
- (NSArray)structuredAnswers;
- (NSString)category;
- (SAAnswerDirectAnswer)directAnswer;
- (SAUIAppPunchOut)appPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppPunchOut:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDirectAnswer:(id)a3;
- (void)setLinkedAnswerGroups:(id)a3;
- (void)setStructuredAnswers:(id)a3;
@end

@implementation SAAnswerDomainObject

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"DomainObject";
}

+ (id)domainObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAppPunchOut)appPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"appPunchOut");
}

- (void)setAppPunchOut:(id)a3
{
}

- (NSString)category
{
  return (NSString *)[(AceObject *)self propertyForKey:@"category"];
}

- (void)setCategory:(id)a3
{
}

- (SAAnswerDirectAnswer)directAnswer
{
  return (SAAnswerDirectAnswer *)AceObjectAceObjectForProperty(self, @"directAnswer");
}

- (void)setDirectAnswer:(id)a3
{
}

- (NSArray)linkedAnswerGroups
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"linkedAnswerGroups", v3);
}

- (void)setLinkedAnswerGroups:(id)a3
{
}

- (NSArray)structuredAnswers
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"structuredAnswers", &unk_1EFDAC028);
}

- (void)setStructuredAnswers:(id)a3
{
}

@end