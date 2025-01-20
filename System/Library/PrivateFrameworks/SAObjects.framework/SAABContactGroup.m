@interface SAABContactGroup
+ (id)contactGroup;
- (NSString)groupName;
- (SASource)groupSource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGroupName:(id)a3;
- (void)setGroupSource:(id)a3;
@end

@implementation SAABContactGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"ContactGroup";
}

+ (id)contactGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)groupName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupName"];
}

- (void)setGroupName:(id)a3
{
}

- (SASource)groupSource
{
  return (SASource *)AceObjectAceObjectForProperty(self, @"groupSource");
}

- (void)setGroupSource:(id)a3
{
}

@end