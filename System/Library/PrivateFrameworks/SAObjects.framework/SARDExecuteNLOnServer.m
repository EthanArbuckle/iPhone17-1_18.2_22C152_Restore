@interface SARDExecuteNLOnServer
- (BOOL)requiresResponse;
- (NSArray)aceDelegatedUserDialogActList;
- (NSDictionary)preITNRecognitionSausageMap;
- (NSDictionary)recognitionSausageMap;
- (NSDictionary)requestExecutionParameters;
- (NSString)directAction;
- (NSString)requestType;
- (NSString)resultCandidateId;
- (NSString)utterance;
- (SASRecognition)recognitionSausage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceDelegatedUserDialogActList:(id)a3;
- (void)setDirectAction:(id)a3;
- (void)setPreITNRecognitionSausageMap:(id)a3;
- (void)setRecognitionSausage:(id)a3;
- (void)setRecognitionSausageMap:(id)a3;
- (void)setRequestExecutionParameters:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation SARDExecuteNLOnServer

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"ExecuteNLOnServer";
}

- (NSArray)aceDelegatedUserDialogActList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"aceDelegatedUserDialogActList", v3);
}

- (void)setAceDelegatedUserDialogActList:(id)a3
{
}

- (NSString)directAction
{
  return (NSString *)[(AceObject *)self propertyForKey:@"directAction"];
}

- (void)setDirectAction:(id)a3
{
}

- (NSDictionary)preITNRecognitionSausageMap
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"preITNRecognitionSausageMap", v3);
}

- (void)setPreITNRecognitionSausageMap:(id)a3
{
}

- (SASRecognition)recognitionSausage
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"recognitionSausage");
}

- (void)setRecognitionSausage:(id)a3
{
}

- (NSDictionary)recognitionSausageMap
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"recognitionSausageMap", v3);
}

- (void)setRecognitionSausageMap:(id)a3
{
}

- (NSDictionary)requestExecutionParameters
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"requestExecutionParameters"];
}

- (void)setRequestExecutionParameters:(id)a3
{
}

- (NSString)requestType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestType"];
}

- (void)setRequestType:(id)a3
{
}

- (NSString)resultCandidateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultCandidateId"];
}

- (void)setResultCandidateId:(id)a3
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