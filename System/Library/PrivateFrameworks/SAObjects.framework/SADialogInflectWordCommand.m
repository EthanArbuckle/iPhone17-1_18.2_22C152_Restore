@interface SADialogInflectWordCommand
+ (id)inflectWordCommand;
- (BOOL)defaultToSemantic;
- (BOOL)requiresResponse;
- (NSArray)constraints;
- (NSString)label;
- (NSString)locale;
- (NSString)semanticFeatureName;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConstraints:(id)a3;
- (void)setDefaultToSemantic:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLocale:(id)a3;
- (void)setSemanticFeatureName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SADialogInflectWordCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.dialog";
}

- (id)encodedClassName
{
  return @"InflectWordCommand";
}

+ (id)inflectWordCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)constraints
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"constraints"];
}

- (void)setConstraints:(id)a3
{
}

- (BOOL)defaultToSemantic
{
  return AceObjectBoolForProperty(self, @"defaultToSemantic");
}

- (void)setDefaultToSemantic:(BOOL)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSString)locale
{
  return (NSString *)[(AceObject *)self propertyForKey:@"locale"];
}

- (void)setLocale:(id)a3
{
}

- (NSString)semanticFeatureName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"semanticFeatureName"];
}

- (void)setSemanticFeatureName:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end