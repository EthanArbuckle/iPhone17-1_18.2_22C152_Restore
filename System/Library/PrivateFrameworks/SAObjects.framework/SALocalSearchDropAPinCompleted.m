@interface SALocalSearchDropAPinCompleted
+ (id)dropAPinCompleted;
- (BOOL)requiresResponse;
- (SALocalSearchMapItem)mapItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMapItem:(id)a3;
@end

@implementation SALocalSearchDropAPinCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"DropAPinCompleted";
}

+ (id)dropAPinCompleted
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
  return 0;
}

@end