@interface WFBaseRemoteQuarantineRequest
+ (id)JSONKeyPathsByPropertyKey;
- (NSString)appVersion;
- (NSString)defaultLocalizedDeniedErrorMessage;
- (NSString)defaultLocalizedDeniedErrorTitle;
- (NSString)defaultLocalizedPromptMessage;
- (NSString)defaultLocalizedPromptTitle;
- (NSString)osVersion;
- (NSString)policyFunctionName;
- (NSString)userLocale;
- (WFBaseRemoteQuarantineRequest)init;
- (id)javaScriptCoreRepresentationWithError:(id *)a3;
@end

@implementation WFBaseRemoteQuarantineRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
}

- (NSString)userLocale
{
  return self->_userLocale;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (id)javaScriptCoreRepresentationWithError:(id *)a3
{
  return +[MTLJSONAdapter JSONDictionaryFromModel:self error:a3];
}

- (NSString)defaultLocalizedDeniedErrorMessage
{
  return 0;
}

- (NSString)defaultLocalizedDeniedErrorTitle
{
  return 0;
}

- (NSString)defaultLocalizedPromptMessage
{
  return 0;
}

- (NSString)defaultLocalizedPromptTitle
{
  return 0;
}

- (NSString)policyFunctionName
{
  return (NSString *)&stru_1F229A4D8;
}

- (WFBaseRemoteQuarantineRequest)init
{
  v14.receiver = self;
  v14.super_class = (Class)WFBaseRemoteQuarantineRequest;
  v2 = [(MTLModel *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    appVersion = v2->_appVersion;
    v2->_appVersion = (NSString *)v4;

    v6 = [MEMORY[0x1E4FB46B8] currentDevice];
    uint64_t v7 = [v6 systemVersion];
    osVersion = v2->_osVersion;
    v2->_osVersion = (NSString *)v7;

    v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    uint64_t v10 = [v9 localeIdentifier];
    userLocale = v2->_userLocale;
    v2->_userLocale = (NSString *)v10;

    v12 = v2;
  }

  return v2;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"appVersion";
  v4[1] = @"osVersion";
  v5[0] = @"appVersion";
  v5[1] = @"osVersion";
  v4[2] = @"userLocale";
  v5[2] = @"userLocale";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end