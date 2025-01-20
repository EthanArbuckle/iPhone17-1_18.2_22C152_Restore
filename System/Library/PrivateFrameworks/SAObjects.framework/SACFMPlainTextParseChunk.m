@interface SACFMPlainTextParseChunk
+ (id)plainTextParseChunk;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SACFMPlainTextParseChunk

- (id)groupIdentifier
{
  return @"com.apple.ace.client.local.messages";
}

- (id)encodedClassName
{
  return @"PlainTextParseChunk";
}

+ (id)plainTextParseChunk
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end