@interface SASurfStatus
+ (id)surfStatus;
- (NSString)currentState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCurrentState:(id)a3;
@end

@implementation SASurfStatus

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SurfStatus";
}

+ (id)surfStatus
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)currentState
{
  return (NSString *)[(AceObject *)self propertyForKey:@"currentState"];
}

- (void)setCurrentState:(id)a3
{
}

@end