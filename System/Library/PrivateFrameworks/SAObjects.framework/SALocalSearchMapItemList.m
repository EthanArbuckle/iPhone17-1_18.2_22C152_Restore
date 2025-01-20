@interface SALocalSearchMapItemList
+ (id)mapItemList;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALocalSearchMapItemList

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"MapItemList";
}

+ (id)mapItemList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end