@interface SALocalSearchAddItemToMapCache
+ (id)addItemToMapCache;
- (BOOL)requiresResponse;
- (SALocalSearchMapItem)mapItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMapItem:(id)a3;
@end

@implementation SALocalSearchAddItemToMapCache

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"AddItemToMapCache";
}

+ (id)addItemToMapCache
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocalSearchMapItem)mapItem
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, @"mapItem");
}

- (void)setMapItem:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end