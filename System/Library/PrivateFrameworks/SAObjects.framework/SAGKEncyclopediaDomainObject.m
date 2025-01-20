@interface SAGKEncyclopediaDomainObject
+ (id)encyclopediaDomainObject;
- (NSArray)linkedAnswerGroups;
- (NSArray)structuredAnswers;
- (NSString)name;
- (NSString)nameAnnotation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLinkedAnswerGroups:(id)a3;
- (void)setName:(id)a3;
- (void)setNameAnnotation:(id)a3;
- (void)setStructuredAnswers:(id)a3;
@end

@implementation SAGKEncyclopediaDomainObject

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"EncyclopediaDomainObject";
}

+ (id)encyclopediaDomainObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)linkedAnswerGroups
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"linkedAnswerGroups", v3);
}

- (void)setLinkedAnswerGroups:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSString)nameAnnotation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nameAnnotation"];
}

- (void)setNameAnnotation:(id)a3
{
}

- (NSArray)structuredAnswers
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"structuredAnswers", &unk_1EFDAFC68);
}

- (void)setStructuredAnswers:(id)a3
{
}

@end