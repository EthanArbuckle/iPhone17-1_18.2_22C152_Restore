@interface SAAceListResult
+ (id)aceListResult;
- (NSArray)result;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResult:(id)a3;
@end

@implementation SAAceListResult

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceListResult";
}

+ (id)aceListResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)result
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"result", &unk_1EFD72F00);
}

- (void)setResult:(id)a3
{
}

@end