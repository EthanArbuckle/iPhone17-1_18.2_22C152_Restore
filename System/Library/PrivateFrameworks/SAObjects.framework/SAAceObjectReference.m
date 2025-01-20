@interface SAAceObjectReference
+ (id)aceObjectReference;
- (NSString)referenceIdentifier;
- (NSString)referenceType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReferenceIdentifier:(id)a3;
- (void)setReferenceType:(id)a3;
@end

@implementation SAAceObjectReference

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceObjectReference";
}

+ (id)aceObjectReference
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)referenceIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"referenceIdentifier"];
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (NSString)referenceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"referenceType"];
}

- (void)setReferenceType:(id)a3
{
}

@end