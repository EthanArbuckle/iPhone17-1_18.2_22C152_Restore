@interface SAUIDomainObjectPickerSelection
+ (id)domainObjectPickerSelection;
- (BOOL)requiresResponse;
- (SADomainObject)selectedItem;
- (SAUIDomainObjectPicker)domainObjectPicker;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomainObjectPicker:(id)a3;
- (void)setSelectedItem:(id)a3;
@end

@implementation SAUIDomainObjectPickerSelection

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DomainObjectPickerSelection";
}

+ (id)domainObjectPickerSelection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDomainObjectPicker)domainObjectPicker
{
  return (SAUIDomainObjectPicker *)AceObjectAceObjectForProperty(self, @"domainObjectPicker");
}

- (void)setDomainObjectPicker:(id)a3
{
}

- (SADomainObject)selectedItem
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"selectedItem");
}

- (void)setSelectedItem:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end