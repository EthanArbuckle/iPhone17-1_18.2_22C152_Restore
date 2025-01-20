@interface SASetRestrictedAppContext
+ (id)setRestrictedAppContext;
- (BOOL)requiresResponse;
- (NSArray)previewRestrictedApps;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPreviewRestrictedApps:(id)a3;
@end

@implementation SASetRestrictedAppContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetRestrictedAppContext";
}

+ (id)setRestrictedAppContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)previewRestrictedApps
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"previewRestrictedApps"];
}

- (void)setPreviewRestrictedApps:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end