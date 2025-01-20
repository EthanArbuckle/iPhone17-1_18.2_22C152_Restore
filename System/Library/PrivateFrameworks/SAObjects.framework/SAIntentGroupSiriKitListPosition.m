@interface SAIntentGroupSiriKitListPosition
+ (id)siriKitListPosition;
- (NSString)position;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)offset;
- (void)setOffset:(int64_t)a3;
- (void)setPosition:(id)a3;
@end

@implementation SAIntentGroupSiriKitListPosition

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SiriKitListPosition";
}

+ (id)siriKitListPosition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)offset
{
  return AceObjectIntegerForProperty(self, @"offset");
}

- (void)setOffset:(int64_t)a3
{
}

- (NSString)position
{
  return (NSString *)[(AceObject *)self propertyForKey:@"position"];
}

- (void)setPosition:(id)a3
{
}

@end