@interface SAGuidanceCheckForGuideUpdateContext
+ (id)checkForGuideUpdateContext;
- (NSArray)supportedFeatures;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSupportedFeatures:(id)a3;
@end

@implementation SAGuidanceCheckForGuideUpdateContext

- (id)groupIdentifier
{
  return @"com.apple.ace.guidance";
}

- (id)encodedClassName
{
  return @"CheckForGuideUpdateContext";
}

+ (id)checkForGuideUpdateContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)supportedFeatures
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"supportedFeatures"];
}

- (void)setSupportedFeatures:(id)a3
{
}

@end