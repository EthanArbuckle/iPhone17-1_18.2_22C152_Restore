@interface SARecordActivity
+ (id)recordActivity;
- (BOOL)requiresResponse;
- (SAActivityObject)activity;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivity:(id)a3;
@end

@implementation SARecordActivity

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RecordActivity";
}

+ (id)recordActivity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAActivityObject)activity
{
  return (SAActivityObject *)AceObjectAceObjectForProperty(self, @"activity");
}

- (void)setActivity:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end