@interface SASAcousticFeature
+ (id)acousticFeature;
- (NSArray)acousticFeaturePerFrame;
- (NSNumber)frameDuration;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAcousticFeaturePerFrame:(id)a3;
- (void)setFrameDuration:(id)a3;
@end

@implementation SASAcousticFeature

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"AcousticFeature";
}

+ (id)acousticFeature
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)acousticFeaturePerFrame
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"acousticFeaturePerFrame"];
}

- (void)setAcousticFeaturePerFrame:(id)a3
{
}

- (NSNumber)frameDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"frameDuration"];
}

- (void)setFrameDuration:(id)a3
{
}

@end