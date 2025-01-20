@interface SAStarkSupport
+ (id)starkSupport;
- (NSArray)supportedModes;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSupportedModes:(id)a3;
@end

@implementation SAStarkSupport

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StarkSupport";
}

+ (id)starkSupport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)supportedModes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"supportedModes"];
}

- (void)setSupportedModes:(id)a3
{
}

@end