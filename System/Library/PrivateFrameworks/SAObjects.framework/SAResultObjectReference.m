@interface SAResultObjectReference
+ (id)resultObjectReference;
- (NSString)className;
- (NSString)groupName;
- (NSString)referenceId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClassName:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setReferenceId:(id)a3;
@end

@implementation SAResultObjectReference

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ResultObjectReference";
}

+ (id)resultObjectReference
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)className
{
  return (NSString *)[(AceObject *)self propertyForKey:@"className"];
}

- (void)setClassName:(id)a3
{
}

- (NSString)groupName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupName"];
}

- (void)setGroupName:(id)a3
{
}

- (NSString)referenceId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"referenceId"];
}

- (void)setReferenceId:(id)a3
{
}

@end