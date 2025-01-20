@interface SAGKSpeakableAnswer
+ (id)speakableAnswer;
- (NSDictionary)parameters;
- (NSString)templateName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setParameters:(id)a3;
- (void)setTemplateName:(id)a3;
@end

@implementation SAGKSpeakableAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"SpeakableAnswer";
}

+ (id)speakableAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)parameters
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"parameters"];
}

- (void)setParameters:(id)a3
{
}

- (NSString)templateName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"templateName"];
}

- (void)setTemplateName:(id)a3
{
}

@end