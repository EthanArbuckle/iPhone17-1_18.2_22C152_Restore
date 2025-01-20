@interface SAConstraintSupport
+ (id)constraintSupport;
- (NSString)property;
- (SASupportCondition)condition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCondition:(id)a3;
- (void)setProperty:(id)a3;
@end

@implementation SAConstraintSupport

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ConstraintSupport";
}

+ (id)constraintSupport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASupportCondition)condition
{
  return (SASupportCondition *)AceObjectAceObjectForProperty(self, @"condition");
}

- (void)setCondition:(id)a3
{
}

- (NSString)property
{
  return (NSString *)[(AceObject *)self propertyForKey:@"property"];
}

- (void)setProperty:(id)a3
{
}

@end