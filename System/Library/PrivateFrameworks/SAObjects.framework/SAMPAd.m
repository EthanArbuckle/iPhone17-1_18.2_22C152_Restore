@interface SAMPAd
+ (id)ad;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPAd

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Ad";
}

+ (id)ad
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end