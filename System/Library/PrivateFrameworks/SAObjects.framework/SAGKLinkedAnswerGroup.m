@interface SAGKLinkedAnswerGroup
+ (id)linkedAnswerGroup;
- (NSArray)linkedAnswers;
- (NSNumber)numberOfResults;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLinkedAnswers:(id)a3;
- (void)setNumberOfResults:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAGKLinkedAnswerGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"LinkedAnswerGroup";
}

+ (id)linkedAnswerGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)linkedAnswers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"linkedAnswers", v3);
}

- (void)setLinkedAnswers:(id)a3
{
}

- (NSNumber)numberOfResults
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"numberOfResults"];
}

- (void)setNumberOfResults:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end