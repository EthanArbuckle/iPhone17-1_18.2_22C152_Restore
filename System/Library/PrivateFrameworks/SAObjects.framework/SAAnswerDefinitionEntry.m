@interface SAAnswerDefinitionEntry
+ (id)definitionEntry;
- (NSArray)examples;
- (NSArray)variations;
- (NSString)definition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDefinition:(id)a3;
- (void)setExamples:(id)a3;
- (void)setVariations:(id)a3;
@end

@implementation SAAnswerDefinitionEntry

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"DefinitionEntry";
}

+ (id)definitionEntry
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)definition
{
  return (NSString *)[(AceObject *)self propertyForKey:@"definition"];
}

- (void)setDefinition:(id)a3
{
}

- (NSArray)examples
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"examples"];
}

- (void)setExamples:(id)a3
{
}

- (NSArray)variations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"variations", v3);
}

- (void)setVariations:(id)a3
{
}

@end