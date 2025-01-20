@interface SAUIShowFullScreenEffect
+ (id)showFullScreenEffect;
- (BOOL)requiresResponse;
- (NSString)fullScreenEffectType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFullScreenEffectType:(id)a3;
@end

@implementation SAUIShowFullScreenEffect

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ShowFullScreenEffect";
}

+ (id)showFullScreenEffect
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)fullScreenEffectType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fullScreenEffectType"];
}

- (void)setFullScreenEffectType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end