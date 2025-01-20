@interface SAPhoneHangUpResponse
+ (id)hangUpResponse;
- (BOOL)activeCallRemaining;
- (BOOL)requiresResponse;
- (NSString)phoneHangUpCallType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActiveCallRemaining:(BOOL)a3;
- (void)setPhoneHangUpCallType:(id)a3;
@end

@implementation SAPhoneHangUpResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"HangUpResponse";
}

+ (id)hangUpResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)activeCallRemaining
{
  return AceObjectBoolForProperty(self, @"activeCallRemaining");
}

- (void)setActiveCallRemaining:(BOOL)a3
{
}

- (NSString)phoneHangUpCallType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phoneHangUpCallType"];
}

- (void)setPhoneHangUpCallType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end