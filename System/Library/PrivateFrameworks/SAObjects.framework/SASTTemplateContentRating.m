@interface SASTTemplateContentRating
- (NSString)system;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSystem:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SASTTemplateContentRating

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"TemplateContentRating";
}

- (NSString)system
{
  return (NSString *)[(AceObject *)self propertyForKey:@"system"];
}

- (void)setSystem:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end