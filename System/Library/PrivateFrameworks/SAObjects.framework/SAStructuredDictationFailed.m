@interface SAStructuredDictationFailed
+ (id)structuredDictationFailed;
- (BOOL)requiresResponse;
- (NSString)dialogIdentifier;
- (NSString)recognition;
- (NSString)userFacingReasonDescription;
- (NSString)userFacingReasonTitle;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)errorCode;
- (void)setDialogIdentifier:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setRecognition:(id)a3;
- (void)setUserFacingReasonDescription:(id)a3;
- (void)setUserFacingReasonTitle:(id)a3;
@end

@implementation SAStructuredDictationFailed

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StructuredDictationFailed";
}

+ (id)structuredDictationFailed
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)dialogIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogIdentifier"];
}

- (void)setDialogIdentifier:(id)a3
{
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, @"errorCode");
}

- (void)setErrorCode:(int64_t)a3
{
}

- (NSString)recognition
{
  return (NSString *)[(AceObject *)self propertyForKey:@"recognition"];
}

- (void)setRecognition:(id)a3
{
}

- (NSString)userFacingReasonDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userFacingReasonDescription"];
}

- (void)setUserFacingReasonDescription:(id)a3
{
}

- (NSString)userFacingReasonTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userFacingReasonTitle"];
}

- (void)setUserFacingReasonTitle:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end