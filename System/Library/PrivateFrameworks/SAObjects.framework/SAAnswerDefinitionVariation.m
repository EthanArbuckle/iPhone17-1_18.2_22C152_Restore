@interface SAAnswerDefinitionVariation
+ (id)definitionVariation;
- (NSArray)examples;
- (NSString)variation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExamples:(id)a3;
- (void)setVariation:(id)a3;
@end

@implementation SAAnswerDefinitionVariation

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"DefinitionVariation";
}

+ (id)definitionVariation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)examples
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"examples"];
}

- (void)setExamples:(id)a3
{
}

- (NSString)variation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"variation"];
}

- (void)setVariation:(id)a3
{
}

@end