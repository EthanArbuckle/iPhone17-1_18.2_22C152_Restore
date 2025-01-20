@interface SACFMNumericallyInflectedEmojiName
+ (id)numericallyInflectedEmojiName;
- (NSString)withEmoji;
- (NSString)withoutEmoji;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWithEmoji:(id)a3;
- (void)setWithoutEmoji:(id)a3;
@end

@implementation SACFMNumericallyInflectedEmojiName

- (id)groupIdentifier
{
  return @"com.apple.ace.client.local.messages";
}

- (id)encodedClassName
{
  return @"NumericallyInflectedEmojiName";
}

+ (id)numericallyInflectedEmojiName
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)withEmoji
{
  return (NSString *)[(AceObject *)self propertyForKey:@"withEmoji"];
}

- (void)setWithEmoji:(id)a3
{
}

- (NSString)withoutEmoji
{
  return (NSString *)[(AceObject *)self propertyForKey:@"withoutEmoji"];
}

- (void)setWithoutEmoji:(id)a3
{
}

@end