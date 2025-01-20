@interface SASyncGroupChecksum
+ (id)groupChecksum;
- (NSString)domainObjectClass;
- (NSString)identifierChecksum;
- (SASyncAnchor)syncAnchor;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setDomainObjectClass:(id)a3;
- (void)setIdentifierChecksum:(id)a3;
- (void)setSyncAnchor:(id)a3;
@end

@implementation SASyncGroupChecksum

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"GroupChecksum";
}

+ (id)groupChecksum
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, @"count");
}

- (void)setCount:(int64_t)a3
{
}

- (NSString)domainObjectClass
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainObjectClass"];
}

- (void)setDomainObjectClass:(id)a3
{
}

- (NSString)identifierChecksum
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifierChecksum"];
}

- (void)setIdentifierChecksum:(id)a3
{
}

- (SASyncAnchor)syncAnchor
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, @"syncAnchor");
}

- (void)setSyncAnchor:(id)a3
{
}

@end