@interface SADeviceCarDNDHintContext
+ (id)carDNDHintContext;
- (NSString)utteranceDomainIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUtteranceDomainIdentifier:(id)a3;
@end

@implementation SADeviceCarDNDHintContext

- (id)groupIdentifier
{
  return @"com.apple.ace.device";
}

- (id)encodedClassName
{
  return @"CarDNDHintContext";
}

+ (id)carDNDHintContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)utteranceDomainIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utteranceDomainIdentifier"];
}

- (void)setUtteranceDomainIdentifier:(id)a3
{
}

@end