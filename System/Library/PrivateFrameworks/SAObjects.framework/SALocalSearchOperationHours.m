@interface SALocalSearchOperationHours
+ (id)operationHours;
- (NSDictionary)operationPeriods;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOperationPeriods:(id)a3;
@end

@implementation SALocalSearchOperationHours

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"OperationHours";
}

+ (id)operationHours
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)operationPeriods
{
  return (NSDictionary *)AceObjectProtocolArrayDictionaryForProperty(self, @"operationPeriods", &unk_1EFD99450);
}

- (void)setOperationPeriods:(id)a3
{
}

@end