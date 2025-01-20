@interface SAAceConfirmationContext
+ (id)aceConfirmationContext;
- (NSString)reason;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReason:(id)a3;
@end

@implementation SAAceConfirmationContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceConfirmationContext";
}

+ (id)aceConfirmationContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)reason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reason"];
}

- (void)setReason:(id)a3
{
}

@end