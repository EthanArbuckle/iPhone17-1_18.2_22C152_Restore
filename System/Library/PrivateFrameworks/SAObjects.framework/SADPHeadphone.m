@interface SADPHeadphone
+ (id)headphone;
- (BOOL)inOrOverEar;
- (NSString)position;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInOrOverEar:(BOOL)a3;
- (void)setPosition:(id)a3;
@end

@implementation SADPHeadphone

- (id)groupIdentifier
{
  return @"com.apple.ace.devicePlaySound";
}

- (id)encodedClassName
{
  return @"Headphone";
}

+ (id)headphone
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)inOrOverEar
{
  return AceObjectBoolForProperty(self, @"inOrOverEar");
}

- (void)setInOrOverEar:(BOOL)a3
{
}

- (NSString)position
{
  return (NSString *)[(AceObject *)self propertyForKey:@"position"];
}

- (void)setPosition:(id)a3
{
}

@end