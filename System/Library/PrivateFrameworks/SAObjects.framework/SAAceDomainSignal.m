@interface SAAceDomainSignal
+ (id)aceDomainSignal;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)appIdHints;
- (NSString)domain;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppIdHints:(id)a3;
- (void)setDomain:(id)a3;
@end

@implementation SAAceDomainSignal

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceDomainSignal";
}

+ (id)aceDomainSignal
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appIdHints
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"appIdHints"];
}

- (void)setAppIdHints:(id)a3
{
}

- (NSString)domain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domain"];
}

- (void)setDomain:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end