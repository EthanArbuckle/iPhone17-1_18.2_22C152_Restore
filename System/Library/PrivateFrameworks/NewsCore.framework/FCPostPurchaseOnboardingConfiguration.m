@interface FCPostPurchaseOnboardingConfiguration
- (BOOL)isEqual:(id)a3;
- (FCPostPurchaseOnboardingConfiguration)init;
- (FCPostPurchaseOnboardingConfiguration)initWithConfigDictionary:(id)a3;
- (FCPostPurchaseOnboardingConfiguration)initWithPostPurchaseOnboardingStep:(unint64_t)a3 landingPageArticleID:(id)a4 callToActionText:(id)a5 deepLinkURL:(id)a6;
- (NSString)callToActionText;
- (NSString)landingPageArticleID;
- (NSURL)deepLinkURL;
- (unint64_t)hash;
- (unint64_t)postPurchaseOnboardingStep;
- (void)setCallToActionText:(id)a3;
- (void)setDeepLinkURL:(id)a3;
- (void)setLandingPageArticleID:(id)a3;
- (void)setPostPurchaseOnboardingStep:(unint64_t)a3;
@end

@implementation FCPostPurchaseOnboardingConfiguration

- (FCPostPurchaseOnboardingConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPostPurchaseOnboardingConfiguration init]";
    __int16 v9 = 2080;
    v10 = "FCPostPurchaseOnboardingConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPostPurchaseOnboardingConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPostPurchaseOnboardingConfiguration)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"data", 0);
  id v6 = FCAppConfigurationStringValue(v4, @"type", 0);

  uint64_t v7 = FCPostPurchaseOnboardingStepWithValue(v6);
  v8 = FCAppConfigurationStringValue(v5, @"articleID", 0);
  __int16 v9 = FCAppConfigurationStringValue(v5, @"ctaText", 0);
  v10 = FCAppConfigurationURLValue(v5, @"url");
  __int16 v11 = [(FCPostPurchaseOnboardingConfiguration *)self initWithPostPurchaseOnboardingStep:v7 landingPageArticleID:v8 callToActionText:v9 deepLinkURL:v10];

  return v11;
}

- (FCPostPurchaseOnboardingConfiguration)initWithPostPurchaseOnboardingStep:(unint64_t)a3 landingPageArticleID:(id)a4 callToActionText:(id)a5 deepLinkURL:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FCPostPurchaseOnboardingConfiguration;
  __int16 v13 = [(FCPostPurchaseOnboardingConfiguration *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_postPurchaseOnboardingStep = a3;
    uint64_t v15 = [v10 copy];
    landingPageArticleID = v14->_landingPageArticleID;
    v14->_landingPageArticleID = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    callToActionText = v14->_callToActionText;
    v14->_callToActionText = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    deepLinkURL = v14->_deepLinkURL;
    v14->_deepLinkURL = (NSURL *)v19;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6
    && (unint64_t v7 = [(FCPostPurchaseOnboardingConfiguration *)self postPurchaseOnboardingStep],
        v7 == [v6 postPurchaseOnboardingStep]))
  {
    v8 = (void *)MEMORY[0x1E4FBA8A8];
    __int16 v9 = [(FCPostPurchaseOnboardingConfiguration *)self landingPageArticleID];
    id v10 = [v6 landingPageArticleID];
    if (objc_msgSend(v8, "nf_object:isEqualToObject:", v9, v10))
    {
      id v11 = (void *)MEMORY[0x1E4FBA8A8];
      id v12 = [(FCPostPurchaseOnboardingConfiguration *)self callToActionText];
      __int16 v13 = [v6 callToActionText];
      if (objc_msgSend(v11, "nf_object:isEqualToObject:", v12, v13))
      {
        v14 = (void *)MEMORY[0x1E4FBA8A8];
        uint64_t v15 = [(FCPostPurchaseOnboardingConfiguration *)self deepLinkURL];
        v16 = [v6 deepLinkURL];
        char v17 = objc_msgSend(v14, "nf_object:isEqualToObject:", v15, v16);
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCPostPurchaseOnboardingConfiguration postPurchaseOnboardingStep](self, "postPurchaseOnboardingStep"));
  uint64_t v4 = [v3 hash];
  v5 = [(FCPostPurchaseOnboardingConfiguration *)self landingPageArticleID];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = [(FCPostPurchaseOnboardingConfiguration *)self callToActionText];
  uint64_t v8 = v6 ^ [v7 hash];
  __int16 v9 = [(FCPostPurchaseOnboardingConfiguration *)self deepLinkURL];
  unint64_t v10 = v8 ^ [v9 hash] ^ v4;

  return v10;
}

- (unint64_t)postPurchaseOnboardingStep
{
  return self->_postPurchaseOnboardingStep;
}

- (void)setPostPurchaseOnboardingStep:(unint64_t)a3
{
  self->_postPurchaseOnboardingStep = a3;
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
}

- (NSString)callToActionText
{
  return self->_callToActionText;
}

- (void)setCallToActionText:(id)a3
{
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void)setDeepLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_callToActionText, 0);
  objc_storeStrong((id *)&self->_landingPageArticleID, 0);
}

@end