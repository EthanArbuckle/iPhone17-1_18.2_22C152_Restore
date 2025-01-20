@interface SACFMEmojiParseChunk
+ (id)emojiParseChunk;
- (NSArray)inflectedEmojiList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)emojiCount;
- (void)setEmojiCount:(int64_t)a3;
- (void)setInflectedEmojiList:(id)a3;
@end

@implementation SACFMEmojiParseChunk

- (id)groupIdentifier
{
  return @"com.apple.ace.client.local.messages";
}

- (id)encodedClassName
{
  return @"EmojiParseChunk";
}

+ (id)emojiParseChunk
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)emojiCount
{
  return AceObjectIntegerForProperty(self, @"emojiCount");
}

- (void)setEmojiCount:(int64_t)a3
{
}

- (NSArray)inflectedEmojiList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"inflectedEmojiList", v3);
}

- (void)setInflectedEmojiList:(id)a3
{
}

@end