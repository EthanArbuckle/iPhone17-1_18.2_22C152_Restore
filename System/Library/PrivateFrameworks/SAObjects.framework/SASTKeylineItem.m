@interface SASTKeylineItem
+ (id)keylineItem;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASTKeylineItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"KeylineItem";
}

+ (id)keylineItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end