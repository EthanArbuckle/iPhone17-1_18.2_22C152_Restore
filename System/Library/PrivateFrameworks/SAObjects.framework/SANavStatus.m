@interface SANavStatus
+ (id)navStatus;
- (NSString)statusValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStatusValue:(id)a3;
@end

@implementation SANavStatus

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"NavStatus";
}

+ (id)navStatus
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)statusValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"statusValue"];
}

- (void)setStatusValue:(id)a3
{
}

@end