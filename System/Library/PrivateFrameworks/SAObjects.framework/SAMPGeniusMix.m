@interface SAMPGeniusMix
+ (id)geniusMix;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPGeniusMix

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GeniusMix";
}

+ (id)geniusMix
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end