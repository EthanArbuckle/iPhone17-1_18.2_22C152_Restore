@interface SACFMMessageTextParseChunk
+ (id)messageTextParseChunk;
- (NSString)chunkType;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChunkType:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SACFMMessageTextParseChunk

- (id)groupIdentifier
{
  return @"com.apple.ace.client.local.messages";
}

- (id)encodedClassName
{
  return @"MessageTextParseChunk";
}

+ (id)messageTextParseChunk
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)chunkType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"chunkType"];
}

- (void)setChunkType:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end