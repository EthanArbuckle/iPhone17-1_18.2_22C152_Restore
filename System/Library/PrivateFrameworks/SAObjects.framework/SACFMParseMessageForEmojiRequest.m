@interface SACFMParseMessageForEmojiRequest
+ (id)parseMessageForEmojiRequest;
- (BOOL)requiresResponse;
- (NSString)locale;
- (NSString)messageText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocale:(id)a3;
- (void)setMessageText:(id)a3;
@end

@implementation SACFMParseMessageForEmojiRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.client.local.messages";
}

- (id)encodedClassName
{
  return @"ParseMessageForEmojiRequest";
}

+ (id)parseMessageForEmojiRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)locale
{
  return (NSString *)[(AceObject *)self propertyForKey:@"locale"];
}

- (void)setLocale:(id)a3
{
}

- (NSString)messageText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"messageText"];
}

- (void)setMessageText:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end