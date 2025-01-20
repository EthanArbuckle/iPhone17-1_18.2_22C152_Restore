@interface SAMPTitleCollection
+ (id)titleCollection;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPTitleCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"TitleCollection";
}

+ (id)titleCollection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end