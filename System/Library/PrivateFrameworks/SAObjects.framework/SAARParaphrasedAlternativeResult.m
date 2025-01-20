@interface SAARParaphrasedAlternativeResult
+ (id)paraphrasedAlternativeResult;
- (NSString)displayText;
- (NSString)paraphrasedIntent;
- (SAClientBoundCommand)command;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommand:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setParaphrasedIntent:(id)a3;
@end

@implementation SAARParaphrasedAlternativeResult

- (id)groupIdentifier
{
  return @"com.apple.ace.alternatives";
}

- (id)encodedClassName
{
  return @"ParaphrasedAlternativeResult";
}

+ (id)paraphrasedAlternativeResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAClientBoundCommand)command
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, @"command");
}

- (void)setCommand:(id)a3
{
}

- (NSString)displayText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayText"];
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)paraphrasedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"paraphrasedIntent"];
}

- (void)setParaphrasedIntent:(id)a3
{
}

@end