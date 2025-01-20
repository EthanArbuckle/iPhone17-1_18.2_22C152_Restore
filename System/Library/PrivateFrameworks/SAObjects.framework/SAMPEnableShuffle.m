@interface SAMPEnableShuffle
+ (id)enableShuffle;
- (BOOL)enable;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEnable:(BOOL)a3;
@end

@implementation SAMPEnableShuffle

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"EnableShuffle";
}

+ (id)enableShuffle
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)enable
{
  return AceObjectBoolForProperty(self, @"enable");
}

- (void)setEnable:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end