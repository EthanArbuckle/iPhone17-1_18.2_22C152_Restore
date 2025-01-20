@interface SAMPGeniusSummonSucceded
+ (id)geniusSummonSucceded;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPGeniusSummonSucceded

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GeniusSummonSucceded";
}

+ (id)geniusSummonSucceded
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end