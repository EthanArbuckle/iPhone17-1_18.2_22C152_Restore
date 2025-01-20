@interface SASmsGroupName
+ (id)groupName;
- (NSString)groupName;
- (NSString)groupNameId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGroupName:(id)a3;
- (void)setGroupNameId:(id)a3;
@end

@implementation SASmsGroupName

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"GroupName";
}

+ (id)groupName
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

- (NSString)groupNameId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupNameId"];
}

- (void)setGroupNameId:(id)a3
{
}

@end