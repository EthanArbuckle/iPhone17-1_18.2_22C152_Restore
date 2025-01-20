@interface SAUIFeedbackForm
- (NSString)domain;
- (NSString)input;
- (NSString)output;
- (NSString)subFeature;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomain:(id)a3;
- (void)setInput:(id)a3;
- (void)setOutput:(id)a3;
- (void)setSubFeature:(id)a3;
@end

@implementation SAUIFeedbackForm

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"FeedbackForm";
}

- (NSString)domain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domain"];
}

- (void)setDomain:(id)a3
{
}

- (NSString)input
{
  return (NSString *)[(AceObject *)self propertyForKey:@"input"];
}

- (void)setInput:(id)a3
{
}

- (NSString)output
{
  return (NSString *)[(AceObject *)self propertyForKey:@"output"];
}

- (void)setOutput:(id)a3
{
}

- (NSString)subFeature
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subFeature"];
}

- (void)setSubFeature:(id)a3
{
}

@end