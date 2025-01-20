@interface SANPRemoveOutputDevicesFromGroup
+ (id)removeOutputDevicesFromGroup;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSString)groupID;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGroupID:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
@end

@implementation SANPRemoveOutputDevicesFromGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"RemoveOutputDevicesFromGroup";
}

+ (id)removeOutputDevicesFromGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)groupID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupID"];
}

- (void)setGroupID:(id)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end