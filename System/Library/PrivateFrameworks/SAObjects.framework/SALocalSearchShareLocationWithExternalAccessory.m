@interface SALocalSearchShareLocationWithExternalAccessory
+ (id)shareLocationWithExternalAccessory;
- (BOOL)requiresResponse;
- (BOOL)useNavigationDestination;
- (SALocalSearchMapItem)mapItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMapItem:(id)a3;
- (void)setUseNavigationDestination:(BOOL)a3;
@end

@implementation SALocalSearchShareLocationWithExternalAccessory

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ShareLocationWithExternalAccessory";
}

+ (id)shareLocationWithExternalAccessory
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

- (BOOL)useNavigationDestination
{
  return AceObjectBoolForProperty(self, @"useNavigationDestination");
}

- (void)setUseNavigationDestination:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end