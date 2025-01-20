@interface SAGuidanceCheckForGuideUpdates
+ (id)checkForGuideUpdates;
- (BOOL)requiresResponse;
- (NSArray)supportedFeatures;
- (NSNumber)currentGuideTag;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCurrentGuideTag:(id)a3;
- (void)setSupportedFeatures:(id)a3;
@end

@implementation SAGuidanceCheckForGuideUpdates

- (id)groupIdentifier
{
  return @"com.apple.ace.guidance";
}

- (id)encodedClassName
{
  return @"CheckForGuideUpdates";
}

+ (id)checkForGuideUpdates
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)currentGuideTag
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"currentGuideTag"];
}

- (void)setCurrentGuideTag:(id)a3
{
}

- (NSArray)supportedFeatures
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"supportedFeatures"];
}

- (void)setSupportedFeatures:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end