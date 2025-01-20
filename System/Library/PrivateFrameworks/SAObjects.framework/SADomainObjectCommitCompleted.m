@interface SADomainObjectCommitCompleted
+ (id)domainObjectCommitCompleted;
- (BOOL)requiresResponse;
- (NSURL)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
@end

@implementation SADomainObjectCommitCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectCommitCompleted";
}

+ (id)domainObjectCommitCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end