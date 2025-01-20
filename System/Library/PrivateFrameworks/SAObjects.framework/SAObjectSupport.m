@interface SAObjectSupport
+ (id)objectSupport;
- (NSArray)supportedProperties;
- (NSString)aceVersion;
- (NSString)classId;
- (NSString)groupId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceVersion:(id)a3;
- (void)setClassId:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setSupportedProperties:(id)a3;
@end

@implementation SAObjectSupport

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ObjectSupport";
}

+ (id)objectSupport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)aceVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"aceVersion"];
}

- (void)setAceVersion:(id)a3
{
}

- (NSString)classId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"classId"];
}

- (void)setClassId:(id)a3
{
}

- (NSString)groupId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupId"];
}

- (void)setGroupId:(id)a3
{
}

- (NSArray)supportedProperties
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"supportedProperties"];
}

- (void)setSupportedProperties:(id)a3
{
}

@end