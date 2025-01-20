@interface SAGetRequestOrigin
+ (id)getRequestOrigin;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSNumber)maxAge;
- (NSNumber)searchTimeout;
- (NSString)desiredAccuracy;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDesiredAccuracy:(id)a3;
- (void)setMaxAge:(id)a3;
- (void)setSearchTimeout:(id)a3;
@end

@implementation SAGetRequestOrigin

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetRequestOrigin";
}

+ (id)getRequestOrigin
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)desiredAccuracy
{
  return (NSString *)[(AceObject *)self propertyForKey:@"desiredAccuracy"];
}

- (void)setDesiredAccuracy:(id)a3
{
}

- (NSNumber)maxAge
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"maxAge"];
}

- (void)setMaxAge:(id)a3
{
}

- (NSNumber)searchTimeout
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"searchTimeout"];
}

- (void)setSearchTimeout:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end