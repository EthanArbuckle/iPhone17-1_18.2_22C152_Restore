@interface SAARParaphrasedSuggestedResult
+ (id)paraphrasedSuggestedResult;
- (NSString)displayText;
- (SAClientBoundCommand)command;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)rank;
- (void)setCommand:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setRank:(int64_t)a3;
@end

@implementation SAARParaphrasedSuggestedResult

- (id)groupIdentifier
{
  return @"com.apple.ace.alternatives";
}

- (id)encodedClassName
{
  return @"ParaphrasedSuggestedResult";
}

+ (id)paraphrasedSuggestedResult
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

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, @"rank");
}

- (void)setRank:(int64_t)a3
{
}

@end