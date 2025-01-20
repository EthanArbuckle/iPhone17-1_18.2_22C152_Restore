@interface SACFMParseMessageForEmojiResponse
+ (id)parseMessageForEmojiResponse;
- (BOOL)requiresResponse;
- (NSArray)parseChunks;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setParseChunks:(id)a3;
@end

@implementation SACFMParseMessageForEmojiResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.client.local.messages";
}

- (id)encodedClassName
{
  return @"ParseMessageForEmojiResponse";
}

+ (id)parseMessageForEmojiResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)parseChunks
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"parseChunks", v3);
}

- (void)setParseChunks:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end