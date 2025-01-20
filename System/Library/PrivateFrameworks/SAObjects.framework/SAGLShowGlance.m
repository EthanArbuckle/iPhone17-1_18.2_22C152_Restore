@interface SAGLShowGlance
+ (id)showGlance;
- (BOOL)requiresResponse;
- (NSString)bundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBundleId:(id)a3;
@end

@implementation SAGLShowGlance

- (id)groupIdentifier
{
  return @"com.apple.ace.glance";
}

- (id)encodedClassName
{
  return @"ShowGlance";
}

+ (id)showGlance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end