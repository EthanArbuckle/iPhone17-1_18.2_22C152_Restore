@interface SARDRunPOMMESRequest
- (BOOL)requiresResponse;
- (NSData)nlFallbackParse;
- (NSData)nlUserParses;
- (NSString)requestType;
- (NSString)responseVariantResult;
- (NSString)userId;
- (NSString)userIdentityClassification;
- (NSString)utterance;
- (SASRecognition)recognition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNlFallbackParse:(id)a3;
- (void)setNlUserParses:(id)a3;
- (void)setRecognition:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setResponseVariantResult:(id)a3;
- (void)setUserId:(id)a3;
- (void)setUserIdentityClassification:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation SARDRunPOMMESRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"RunPOMMESRequest";
}

- (NSData)nlFallbackParse
{
  return (NSData *)[(AceObject *)self propertyForKey:@"nlFallbackParse"];
}

- (void)setNlFallbackParse:(id)a3
{
}

- (NSData)nlUserParses
{
  return (NSData *)[(AceObject *)self propertyForKey:@"nlUserParses"];
}

- (void)setNlUserParses:(id)a3
{
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"recognition");
}

- (void)setRecognition:(id)a3
{
}

- (NSString)requestType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestType"];
}

- (void)setRequestType:(id)a3
{
}

- (NSString)responseVariantResult
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseVariantResult"];
}

- (void)setResponseVariantResult:(id)a3
{
}

- (NSString)userId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userId"];
}

- (void)setUserId:(id)a3
{
}

- (NSString)userIdentityClassification
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userIdentityClassification"];
}

- (void)setUserIdentityClassification:(id)a3
{
}

- (NSString)utterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utterance"];
}

- (void)setUtterance:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end