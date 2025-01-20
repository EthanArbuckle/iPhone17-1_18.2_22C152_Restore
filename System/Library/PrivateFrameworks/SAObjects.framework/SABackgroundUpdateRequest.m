@interface SABackgroundUpdateRequest
+ (id)backgroundUpdateRequest;
- (BOOL)requiresResponse;
- (SAAceSerializable)attachment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttachment:(id)a3;
@end

@implementation SABackgroundUpdateRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"BackgroundUpdateRequest";
}

+ (id)backgroundUpdateRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAceSerializable)attachment
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"attachment");
}

- (void)setAttachment:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end