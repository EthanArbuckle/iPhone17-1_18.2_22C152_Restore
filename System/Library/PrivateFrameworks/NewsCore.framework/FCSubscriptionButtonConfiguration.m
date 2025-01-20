@interface FCSubscriptionButtonConfiguration
+ (id)defaultAmsSheetTargetSubscriptionButton;
+ (id)defaultArticleSubscriptionButtonWithLandingPageArticleID:(id)a3;
+ (id)defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:(id)a3;
+ (id)defaultLandingPageSubscriptionButtonWithLandingPageArticleID:(id)a3;
+ (id)defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:(id)a3;
+ (id)defaultNonTrialText;
+ (id)defaultOsloSheetTargetSubscriptionButton;
+ (id)defaultSubscriptionButtonText;
+ (id)defaultTrialText;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDismissLandingPagePostPurchase;
- (FCColor)buttonColor;
- (FCColor)buttonTextColor;
- (FCSubscriptionButtonConfiguration)init;
- (FCSubscriptionButtonConfiguration)initWithConfigDictionary:(id)a3;
- (FCSubscriptionButtonConfiguration)initWithSubscriptionButtonType:(unint64_t)a3 trialText:(id)a4 nonTrialText:(id)a5 buttonColor:(id)a6 buttonTextColor:(id)a7 targetType:(unint64_t)a8 postPurchaseActionType:(unint64_t)a9 postPurchaseURL:(id)a10 landingPageArticleID:(id)a11 dismissLandingPagePostPurchase:(BOOL)a12;
- (NSString)landingPageArticleID;
- (NSString)nonTrialText;
- (NSString)trialText;
- (NSURL)postPurchaseURL;
- (unint64_t)hash;
- (unint64_t)postPurchaseActionType;
- (unint64_t)subscriptionButtonType;
- (unint64_t)targetType;
- (void)setButtonColor:(id)a3;
- (void)setButtonTextColor:(id)a3;
- (void)setDismissLandingPagePostPurchase:(BOOL)a3;
- (void)setLandingPageArticleID:(id)a3;
- (void)setNonTrialText:(id)a3;
- (void)setPostPurchaseActionType:(unint64_t)a3;
- (void)setPostPurchaseURL:(id)a3;
- (void)setSubscriptionButtonType:(unint64_t)a3;
- (void)setTargetType:(unint64_t)a3;
- (void)setTrialText:(id)a3;
@end

@implementation FCSubscriptionButtonConfiguration

- (FCSubscriptionButtonConfiguration)initWithConfigDictionary:(id)a3
{
  id v3 = a3;
  v22 = FCAppConfigurationStringValue(v3, @"subscriptionButtonType", 0);
  uint64_t v19 = FCSubscriptionButtonTypeWithValue(v22);
  v18 = FCAppConfigurationStringValue(v3, @"trialText", 0);
  v17 = FCAppConfigurationStringValue(v3, @"nonTrialText", 0);
  v20 = FCAppConfigurationStringValue(v3, @"buttonColor", 0);
  v16 = +[FCColor nullableColorWithHexString:v20];
  v4 = FCAppConfigurationStringValue(v3, @"buttonTextColor", 0);
  v5 = +[FCColor nullableColorWithHexString:v4];
  v6 = FCAppConfigurationStringValue(v3, @"targetType", 0);
  uint64_t v7 = FCTargetTypeWithValue(v6);
  v8 = FCAppConfigurationStringValue(v3, @"postPurchaseActionType", 0);
  BOOL v9 = FCPostPurchaseActionTypeWithValue(v8);
  v10 = FCAppConfigurationURLValue(v3, @"postPurchaseURL");
  v11 = FCAppConfigurationStringValue(v3, @"landingPageArticleID", 0);
  char v12 = FCAppConfigurationBoolValue(v3, @"dismissLandingPagePostPurchase", 0);

  LOBYTE(v15) = v12;
  v13 = [(FCSubscriptionButtonConfiguration *)self initWithSubscriptionButtonType:v19 trialText:v18 nonTrialText:v17 buttonColor:v16 buttonTextColor:v5 targetType:v7 postPurchaseActionType:v9 postPurchaseURL:v10 landingPageArticleID:v11 dismissLandingPagePostPurchase:v15];

  return v13;
}

- (FCSubscriptionButtonConfiguration)initWithSubscriptionButtonType:(unint64_t)a3 trialText:(id)a4 nonTrialText:(id)a5 buttonColor:(id)a6 buttonTextColor:(id)a7 targetType:(unint64_t)a8 postPurchaseActionType:(unint64_t)a9 postPurchaseURL:(id)a10 landingPageArticleID:(id)a11 dismissLandingPagePostPurchase:(BOOL)a12
{
  id v17 = a4;
  id v18 = a5;
  id v34 = a6;
  id v19 = a7;
  id v20 = a10;
  id v21 = a11;
  v35.receiver = self;
  v35.super_class = (Class)FCSubscriptionButtonConfiguration;
  v22 = [(FCSubscriptionButtonConfiguration *)&v35 init];
  v23 = v22;
  if (v22)
  {
    v22->_subscriptionButtonType = a3;
    uint64_t v24 = [v17 copy];
    trialText = v23->_trialText;
    v23->_trialText = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    nonTrialText = v23->_nonTrialText;
    v23->_nonTrialText = (NSString *)v26;

    objc_storeStrong((id *)&v23->_buttonColor, a6);
    objc_storeStrong((id *)&v23->_buttonTextColor, a7);
    v23->_targetType = a8;
    v23->_postPurchaseActionType = a9;
    uint64_t v28 = [v20 copy];
    postPurchaseURL = v23->_postPurchaseURL;
    v23->_postPurchaseURL = (NSURL *)v28;

    uint64_t v30 = [v21 copy];
    landingPageArticleID = v23->_landingPageArticleID;
    v23->_landingPageArticleID = (NSString *)v30;

    v23->_dismissLandingPagePostPurchase = a12;
  }

  return v23;
}

- (FCSubscriptionButtonConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCSubscriptionButtonConfiguration init]";
    __int16 v9 = 2080;
    v10 = "FCSubscriptionButtonConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 35;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCSubscriptionButtonConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
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
    && (unint64_t v7 = [(FCSubscriptionButtonConfiguration *)self subscriptionButtonType],
        v7 == [v6 subscriptionButtonType])
    && (unint64_t v8 = -[FCSubscriptionButtonConfiguration targetType](self, "targetType"), v8 == [v6 targetType])
    && (unint64_t v9 = [(FCSubscriptionButtonConfiguration *)self postPurchaseActionType],
        v9 == [v6 postPurchaseActionType])
    && (int v10 = -[FCSubscriptionButtonConfiguration shouldDismissLandingPagePostPurchase](self, "shouldDismissLandingPagePostPurchase"), v10 == [v6 shouldDismissLandingPagePostPurchase]))
  {
    __int16 v13 = (void *)MEMORY[0x1E4FBA8A8];
    v14 = [(FCSubscriptionButtonConfiguration *)self trialText];
    uint64_t v15 = [v6 trialText];
    if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
    {
      v16 = (void *)MEMORY[0x1E4FBA8A8];
      id v17 = [(FCSubscriptionButtonConfiguration *)self nonTrialText];
      id v18 = [v6 nonTrialText];
      if (objc_msgSend(v16, "nf_object:isEqualToObject:", v17, v18))
      {
        id v19 = (void *)MEMORY[0x1E4FBA8A8];
        id v20 = [(FCSubscriptionButtonConfiguration *)self postPurchaseURL];
        id v21 = [v6 postPurchaseURL];
        if (objc_msgSend(v19, "nf_object:isEqualToObject:", v20, v21))
        {
          uint64_t v24 = (void *)MEMORY[0x1E4FBA8A8];
          v22 = [(FCSubscriptionButtonConfiguration *)self landingPageArticleID];
          v23 = [v6 landingPageArticleID];
          char v11 = objc_msgSend(v24, "nf_object:isEqualToObject:", v22, v23);
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCSubscriptionButtonConfiguration subscriptionButtonType](self, "subscriptionButtonType"));
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCSubscriptionButtonConfiguration targetType](self, "targetType"));
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCSubscriptionButtonConfiguration postPurchaseActionType](self, "postPurchaseActionType"));
  uint64_t v8 = [v7 hash];
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[FCSubscriptionButtonConfiguration shouldDismissLandingPagePostPurchase](self, "shouldDismissLandingPagePostPurchase"));
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  char v11 = [(FCSubscriptionButtonConfiguration *)self trialText];
  uint64_t v12 = [v11 hash];
  __int16 v13 = [(FCSubscriptionButtonConfiguration *)self nonTrialText];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(FCSubscriptionButtonConfiguration *)self postPurchaseURL];
  uint64_t v16 = v14 ^ [v15 hash];
  id v17 = [(FCSubscriptionButtonConfiguration *)self landingPageArticleID];
  unint64_t v18 = v10 ^ v16 ^ [v17 hash];

  return v18;
}

+ (id)defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__FCSubscriptionButtonConfiguration_defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1690;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1690, block);
  }
  id v6 = (id)_MergedGlobals_179;

  return v6;
}

void __104__FCSubscriptionButtonConfiguration_defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText];
  v2 = +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText];
  id v3 = [FCSubscriptionButtonConfiguration alloc];
  uint64_t v4 = +[FCColor whiteColor];
  id v5 = +[FCColor blackColor];
  LOBYTE(v8) = 1;
  uint64_t v6 = [(FCSubscriptionButtonConfiguration *)v3 initWithSubscriptionButtonType:0 trialText:v9 nonTrialText:v2 buttonColor:v4 buttonTextColor:v5 targetType:1 postPurchaseActionType:0 postPurchaseURL:0 landingPageArticleID:*(void *)(a1 + 32) dismissLandingPagePostPurchase:v8];
  unint64_t v7 = (void *)_MergedGlobals_179;
  _MergedGlobals_179 = v6;
}

+ (id)defaultOsloSheetTargetSubscriptionButton
{
  if (qword_1EB5D16A0 != -1) {
    dispatch_once(&qword_1EB5D16A0, &__block_literal_global_94);
  }
  v2 = (void *)qword_1EB5D1698;
  return v2;
}

void __77__FCSubscriptionButtonConfiguration_defaultOsloSheetTargetSubscriptionButton__block_invoke()
{
  id v7 = +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText];
  v0 = +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText];
  v1 = [FCSubscriptionButtonConfiguration alloc];
  v2 = +[FCColor whiteColor];
  id v3 = +[FCColor blackColor];
  LOBYTE(v6) = 1;
  uint64_t v4 = [(FCSubscriptionButtonConfiguration *)v1 initWithSubscriptionButtonType:0 trialText:v7 nonTrialText:v0 buttonColor:v2 buttonTextColor:v3 targetType:2 postPurchaseActionType:0 postPurchaseURL:0 landingPageArticleID:0 dismissLandingPagePostPurchase:v6];
  id v5 = (void *)qword_1EB5D1698;
  qword_1EB5D1698 = v4;
}

+ (id)defaultAmsSheetTargetSubscriptionButton
{
  if (qword_1EB5D16B0 != -1) {
    dispatch_once(&qword_1EB5D16B0, &__block_literal_global_66_1);
  }
  v2 = (void *)qword_1EB5D16A8;
  return v2;
}

void __76__FCSubscriptionButtonConfiguration_defaultAmsSheetTargetSubscriptionButton__block_invoke()
{
  id v7 = +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText];
  v0 = +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText];
  v1 = [FCSubscriptionButtonConfiguration alloc];
  v2 = +[FCColor whiteColor];
  id v3 = +[FCColor blackColor];
  LOBYTE(v6) = 1;
  uint64_t v4 = [(FCSubscriptionButtonConfiguration *)v1 initWithSubscriptionButtonType:0 trialText:v7 nonTrialText:v0 buttonColor:v2 buttonTextColor:v3 targetType:3 postPurchaseActionType:0 postPurchaseURL:0 landingPageArticleID:0 dismissLandingPagePostPurchase:v6];
  id v5 = (void *)qword_1EB5D16A8;
  qword_1EB5D16A8 = v4;
}

+ (id)defaultArticleSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__FCSubscriptionButtonConfiguration_defaultArticleSubscriptionButtonWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D16C0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D16C0, block);
  }
  id v6 = (id)qword_1EB5D16B8;

  return v6;
}

void __94__FCSubscriptionButtonConfiguration_defaultArticleSubscriptionButtonWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  v2 = [FCSubscriptionButtonConfiguration alloc];
  id v9 = +[FCSubscriptionButtonConfiguration defaultTrialText];
  id v3 = +[FCSubscriptionButtonConfiguration defaultNonTrialText];
  uint64_t v4 = +[FCColor whiteColor];
  id v5 = +[FCColor blackColor];
  LOBYTE(v8) = 1;
  uint64_t v6 = [(FCSubscriptionButtonConfiguration *)v2 initWithSubscriptionButtonType:1 trialText:v9 nonTrialText:v3 buttonColor:v4 buttonTextColor:v5 targetType:1 postPurchaseActionType:0 postPurchaseURL:0 landingPageArticleID:v1 dismissLandingPagePostPurchase:v8];
  id v7 = (void *)qword_1EB5D16B8;
  qword_1EB5D16B8 = v6;
}

+ (id)defaultLandingPageSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  if (qword_1EB5D16D0 != -1) {
    dispatch_once(&qword_1EB5D16D0, &__block_literal_global_68);
  }
  id v3 = (void *)qword_1EB5D16C8;
  return v3;
}

void __98__FCSubscriptionButtonConfiguration_defaultLandingPageSubscriptionButtonWithLandingPageArticleID___block_invoke()
{
  v0 = [FCSubscriptionButtonConfiguration alloc];
  id v7 = +[FCSubscriptionButtonConfiguration defaultTrialText];
  id v1 = +[FCSubscriptionButtonConfiguration defaultNonTrialText];
  v2 = +[FCColor whiteColor];
  id v3 = +[FCColor blackColor];
  LOBYTE(v6) = 1;
  uint64_t v4 = [(FCSubscriptionButtonConfiguration *)v0 initWithSubscriptionButtonType:2 trialText:v7 nonTrialText:v1 buttonColor:v2 buttonTextColor:v3 targetType:2 postPurchaseActionType:0 postPurchaseURL:0 landingPageArticleID:0 dismissLandingPagePostPurchase:v6];
  id v5 = (void *)qword_1EB5D16C8;
  qword_1EB5D16C8 = v4;
}

+ (id)defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__FCSubscriptionButtonConfiguration_defaultIssueCoverSubscriptionButtonWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D16E0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D16E0, block);
  }
  id v6 = (id)qword_1EB5D16D8;

  return v6;
}

void __97__FCSubscriptionButtonConfiguration_defaultIssueCoverSubscriptionButtonWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  v2 = [FCSubscriptionButtonConfiguration alloc];
  id v9 = +[FCSubscriptionButtonConfiguration defaultTrialText];
  id v3 = +[FCSubscriptionButtonConfiguration defaultNonTrialText];
  uint64_t v4 = +[FCColor whiteColor];
  id v5 = +[FCColor blackColor];
  LOBYTE(v8) = 1;
  uint64_t v6 = [(FCSubscriptionButtonConfiguration *)v2 initWithSubscriptionButtonType:3 trialText:v9 nonTrialText:v3 buttonColor:v4 buttonTextColor:v5 targetType:1 postPurchaseActionType:0 postPurchaseURL:0 landingPageArticleID:v1 dismissLandingPagePostPurchase:v8];
  id v7 = (void *)qword_1EB5D16D8;
  qword_1EB5D16D8 = v6;
}

+ (id)defaultSubscriptionButtonText
{
  if (qword_1EB5D16F0 != -1) {
    dispatch_once(&qword_1EB5D16F0, &__block_literal_global_70_1);
  }
  v2 = (void *)qword_1EB5D16E8;
  return v2;
}

void __66__FCSubscriptionButtonConfiguration_defaultSubscriptionButtonText__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"GET STARTED" value:&stru_1EF8299B8 table:0];
  id v1 = (void *)qword_1EB5D16E8;
  qword_1EB5D16E8 = v0;
}

+ (id)defaultTrialText
{
  if (qword_1EB5D1700 != -1) {
    dispatch_once(&qword_1EB5D1700, &__block_literal_global_78_0);
  }
  id v2 = (void *)qword_1EB5D16F8;
  return v2;
}

void __53__FCSubscriptionButtonConfiguration_defaultTrialText__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"TRY IT FREE" value:&stru_1EF8299B8 table:0];
  id v1 = (void *)qword_1EB5D16F8;
  qword_1EB5D16F8 = v0;
}

+ (id)defaultNonTrialText
{
  if (qword_1EB5D1710 != -1) {
    dispatch_once(&qword_1EB5D1710, &__block_literal_global_83_0);
  }
  id v2 = (void *)qword_1EB5D1708;
  return v2;
}

void __56__FCSubscriptionButtonConfiguration_defaultNonTrialText__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"START READING" value:&stru_1EF8299B8 table:0];
  id v1 = (void *)qword_1EB5D1708;
  qword_1EB5D1708 = v0;
}

- (unint64_t)subscriptionButtonType
{
  return self->_subscriptionButtonType;
}

- (void)setSubscriptionButtonType:(unint64_t)a3
{
  self->_subscriptionButtonType = a3;
}

- (NSString)trialText
{
  return self->_trialText;
}

- (void)setTrialText:(id)a3
{
}

- (NSString)nonTrialText
{
  return self->_nonTrialText;
}

- (void)setNonTrialText:(id)a3
{
}

- (unint64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(unint64_t)a3
{
  self->_targetType = a3;
}

- (unint64_t)postPurchaseActionType
{
  return self->_postPurchaseActionType;
}

- (void)setPostPurchaseActionType:(unint64_t)a3
{
  self->_postPurchaseActionType = a3;
}

- (NSURL)postPurchaseURL
{
  return self->_postPurchaseURL;
}

- (void)setPostPurchaseURL:(id)a3
{
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
}

- (FCColor)buttonColor
{
  return self->_buttonColor;
}

- (void)setButtonColor:(id)a3
{
}

- (FCColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
}

- (BOOL)shouldDismissLandingPagePostPurchase
{
  return self->_dismissLandingPagePostPurchase;
}

- (void)setDismissLandingPagePostPurchase:(BOOL)a3
{
  self->_dismissLandingPagePostPurchase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
  objc_storeStrong((id *)&self->_landingPageArticleID, 0);
  objc_storeStrong((id *)&self->_postPurchaseURL, 0);
  objc_storeStrong((id *)&self->_nonTrialText, 0);
  objc_storeStrong((id *)&self->_trialText, 0);
}

@end