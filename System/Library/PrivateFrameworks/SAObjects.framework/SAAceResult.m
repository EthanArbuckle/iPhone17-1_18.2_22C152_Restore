@interface SAAceResult
+ (id)aceResult;
- (SAAceSerializable)result;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResult:(id)a3;
@end

@implementation SAAceResult

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceResult";
}

+ (id)aceResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAceSerializable)result
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"result");
}

- (void)setResult:(id)a3
{
}

@end