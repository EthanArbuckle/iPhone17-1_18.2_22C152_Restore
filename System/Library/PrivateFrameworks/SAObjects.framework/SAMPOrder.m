@interface SAMPOrder
+ (id)order;
- (BOOL)descending;
- (NSString)mediaItemProperty;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDescending:(BOOL)a3;
- (void)setMediaItemProperty:(id)a3;
@end

@implementation SAMPOrder

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Order";
}

+ (id)order
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)descending
{
  return AceObjectBoolForProperty(self, @"descending");
}

- (void)setDescending:(BOOL)a3
{
}

- (NSString)mediaItemProperty
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mediaItemProperty"];
}

- (void)setMediaItemProperty:(id)a3
{
}

@end