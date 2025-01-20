@interface SAErrorIndicatorStatus
+ (id)errorIndicatorStatus;
- (BOOL)deviceFixingProblems;
- (NSArray)values;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDeviceFixingProblems:(BOOL)a3;
- (void)setValues:(id)a3;
@end

@implementation SAErrorIndicatorStatus

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ErrorIndicatorStatus";
}

+ (id)errorIndicatorStatus
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)deviceFixingProblems
{
  return AceObjectBoolForProperty(self, @"deviceFixingProblems");
}

- (void)setDeviceFixingProblems:(BOOL)a3
{
}

- (NSArray)values
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"values"];
}

- (void)setValues:(id)a3
{
}

@end