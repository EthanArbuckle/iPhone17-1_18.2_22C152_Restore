@interface FCPaywallConfiguration
+ (id)defaultArticleHardPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultArticleSharedHardPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultArticleSharedSoftPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultArticleSoftPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultAudioArticleHardPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultAudioArticleSharedHardPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultAudioArticleSoftPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultAudioPaywallDescription;
+ (id)defaultAudioPaywallTitle;
+ (id)defaultChannelSoftPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultDeferredPaywallTopOffsetConfiguration;
+ (id)defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultPDFHardPaywallWithLandingPageArticleID:(id)a3;
+ (id)defaultPaywallDescription;
+ (id)defaultPaywallTitle;
+ (id)defaultPaywallTopOffsetConfiguration;
+ (id)defaultSmallPaywallTitle;
- (BOOL)externalOverridesEnabled;
- (BOOL)isEqual:(id)a3;
- (FCPaywallConfiguration)init;
- (FCPaywallConfiguration)initWithConfigDictionary:(id)a3;
- (FCPaywallConfiguration)initWithPaywallType:(unint64_t)a3 title:(id)a4 descriptionTrial:(id)a5 descriptionNonTrial:(id)a6 learnMoreTitle:(id)a7 learnMoreURL:(id)a8 offersLinkTitle:(id)a9 offersLinkURL:(id)a10 offersLinkTargetType:(unint64_t)a11 externalOverridesEnabled:(BOOL)a12 subscriptionButtonConfig:(id)a13 visualSpecConfig:(id)a14 paywallTopOffsetConfig:(id)a15;
- (FCPaywallTopOffsetConfiguration)paywallTopOffsetConfig;
- (FCPaywallVisualSpecConfiguration)visualSpecConfig;
- (FCSubscriptionButtonConfiguration)subscriptionButtonConfig;
- (NSString)descriptionNonTrial;
- (NSString)descriptionTrial;
- (NSString)learnMoreTitle;
- (NSString)offersLinkTitle;
- (NSString)title;
- (NSURL)learnMoreURL;
- (NSURL)offersLinkURL;
- (unint64_t)hash;
- (unint64_t)offersLinkTargetType;
- (unint64_t)paywallType;
- (void)setDescriptionNonTrial:(id)a3;
- (void)setDescriptionTrial:(id)a3;
- (void)setLearnMoreTitle:(id)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setOffersLinkTargetType:(unint64_t)a3;
- (void)setOffersLinkTitle:(id)a3;
- (void)setOffersLinkURL:(id)a3;
- (void)setPaywallType:(unint64_t)a3;
- (void)setSubscriptionButtonConfig:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisualSpecConfig:(id)a3;
@end

@implementation FCPaywallConfiguration

- (FCPaywallConfiguration)initWithConfigDictionary:(id)a3
{
  id v3 = a3;
  v24 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"subscriptionButton", 0);
  v19 = [[FCSubscriptionButtonConfiguration alloc] initWithConfigDictionary:v24];
  v23 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"visualSpecification", 0);
  v14 = [[FCPaywallVisualSpecConfiguration alloc] initWithConfigDictionary:v23];
  v4 = [[FCPaywallTopOffsetConfiguration alloc] initWithConfigDictionary:v3];
  v20 = FCAppConfigurationStringValue(v3, @"paywallType", 0);
  uint64_t v18 = FCPaywallTypeForValue(v20);
  v17 = FCAppConfigurationStringValue(v3, @"title", 0);
  v16 = FCAppConfigurationStringValue(v3, @"descriptionTrial", 0);
  v15 = FCAppConfigurationStringValue(v3, @"descriptionNonTrial", 0);
  v5 = FCAppConfigurationStringValue(v3, @"learnMoreTitle", 0);
  v6 = FCAppConfigurationURLValue(v3, @"learnMoreURL");
  v7 = FCAppConfigurationStringValue(v3, @"offersLinkTitle", 0);
  v8 = FCAppConfigurationURLValue(v3, @"offersLinkURL");
  v9 = FCAppConfigurationStringValue(v3, @"offersLinkTargetType", 0);
  uint64_t v10 = FCPaywallOffersLinkTargetTypeForValue(v9);
  char v11 = FCAppConfigurationBoolValue(v3, @"externalOverridesEnabled", 0);

  LOBYTE(v13) = v11;
  v22 = [(FCPaywallConfiguration *)self initWithPaywallType:v18 title:v17 descriptionTrial:v16 descriptionNonTrial:v15 learnMoreTitle:v5 learnMoreURL:v6 offersLinkTitle:v7 offersLinkURL:v8 offersLinkTargetType:v10 externalOverridesEnabled:v13 subscriptionButtonConfig:v19 visualSpecConfig:v14 paywallTopOffsetConfig:v4];

  return v22;
}

- (FCPaywallConfiguration)initWithPaywallType:(unint64_t)a3 title:(id)a4 descriptionTrial:(id)a5 descriptionNonTrial:(id)a6 learnMoreTitle:(id)a7 learnMoreURL:(id)a8 offersLinkTitle:(id)a9 offersLinkURL:(id)a10 offersLinkTargetType:(unint64_t)a11 externalOverridesEnabled:(BOOL)a12 subscriptionButtonConfig:(id)a13 visualSpecConfig:(id)a14 paywallTopOffsetConfig:(id)a15
{
  id v19 = a4;
  id v20 = a5;
  id v48 = a6;
  id v21 = a7;
  id v22 = a8;
  v23 = v20;
  id v24 = a9;
  id v25 = a10;
  id v47 = a13;
  id v26 = a14;
  id v27 = a15;
  v49.receiver = self;
  v49.super_class = (Class)FCPaywallConfiguration;
  v28 = [(FCPaywallConfiguration *)&v49 init];
  v29 = v28;
  if (v28)
  {
    v28->_paywallType = a3;
    uint64_t v30 = [v19 copy];
    title = v29->_title;
    v29->_title = (NSString *)v30;

    uint64_t v32 = [v23 copy];
    descriptionTrial = v29->_descriptionTrial;
    v29->_descriptionTrial = (NSString *)v32;

    uint64_t v34 = [v48 copy];
    descriptionNonTrial = v29->_descriptionNonTrial;
    v29->_descriptionNonTrial = (NSString *)v34;

    uint64_t v36 = [v21 copy];
    learnMoreTitle = v29->_learnMoreTitle;
    v29->_learnMoreTitle = (NSString *)v36;

    uint64_t v38 = [v22 copy];
    learnMoreURL = v29->_learnMoreURL;
    v29->_learnMoreURL = (NSURL *)v38;

    uint64_t v40 = [v24 copy];
    offersLinkTitle = v29->_offersLinkTitle;
    v29->_offersLinkTitle = (NSString *)v40;

    uint64_t v42 = [v25 copy];
    offersLinkURL = v29->_offersLinkURL;
    v29->_offersLinkURL = (NSURL *)v42;

    v29->_offersLinkTargetType = a11;
    v29->_externalOverridesEnabled = a12;
    objc_storeStrong((id *)&v29->_subscriptionButtonConfig, a13);
    objc_storeStrong((id *)&v29->_visualSpecConfig, a14);
    objc_storeStrong((id *)&v29->_paywallTopOffsetConfig, a15);
  }

  return v29;
}

- (FCPaywallConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPaywallConfiguration init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCPaywallConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPaywallConfiguration init]"];
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

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FBA8A8];
    v8 = [(FCPaywallConfiguration *)self title];
    __int16 v9 = [v6 title];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBA8A8];
      __int16 v11 = [(FCPaywallConfiguration *)self descriptionTrial];
      int v12 = [v6 descriptionTrial];
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        __int16 v13 = (void *)MEMORY[0x1E4FBA8A8];
        v14 = [(FCPaywallConfiguration *)self descriptionNonTrial];
        uint64_t v15 = [v6 descriptionNonTrial];
        if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
        {
          v43 = v14;
          v16 = (void *)MEMORY[0x1E4FBA8A8];
          v17 = [(FCPaywallConfiguration *)self learnMoreTitle];
          uint64_t v44 = [v6 learnMoreTitle];
          if (objc_msgSend(v16, "nf_object:isEqualToObject:", v17))
          {
            uint64_t v40 = v17;
            uint64_t v18 = (void *)MEMORY[0x1E4FBA8A8];
            uint64_t v19 = [(FCPaywallConfiguration *)self learnMoreURL];
            v41 = [v6 learnMoreURL];
            uint64_t v42 = (void *)v19;
            if (objc_msgSend(v18, "nf_object:isEqualToObject:", v19))
            {
              id v20 = (void *)MEMORY[0x1E4FBA8A8];
              uint64_t v21 = [(FCPaywallConfiguration *)self offersLinkTitle];
              uint64_t v38 = [v6 offersLinkTitle];
              v39 = (void *)v21;
              if (objc_msgSend(v20, "nf_object:isEqualToObject:", v21))
              {
                id v22 = (void *)MEMORY[0x1E4FBA8A8];
                uint64_t v23 = [(FCPaywallConfiguration *)self offersLinkURL];
                uint64_t v36 = [v6 offersLinkURL];
                v37 = (void *)v23;
                if (objc_msgSend(v22, "nf_object:isEqualToObject:", v23)
                  && (unint64_t v24 = [(FCPaywallConfiguration *)self offersLinkTargetType],
                      v24 == [v6 offersLinkTargetType])
                  && (unint64_t v25 = [(FCPaywallConfiguration *)self paywallType],
                      v25 == [v6 paywallType])
                  && (int v26 = [(FCPaywallConfiguration *)self externalOverridesEnabled],
                      v26 == [v6 externalOverridesEnabled]))
                {
                  uint64_t v30 = (void *)MEMORY[0x1E4FBA8A8];
                  v31 = [(FCPaywallConfiguration *)self subscriptionButtonConfig];
                  v35 = [v6 subscriptionButtonConfig];
                  if (objc_msgSend(v30, "nf_object:isEqualToObject:", v31))
                  {
                    uint64_t v34 = (void *)MEMORY[0x1E4FBA8A8];
                    uint64_t v32 = [(FCPaywallConfiguration *)self visualSpecConfig];
                    v33 = [v6 visualSpecConfig];
                    char v27 = objc_msgSend(v34, "nf_object:isEqualToObject:", v32, v33);
                  }
                  else
                  {
                    char v27 = 0;
                  }
                  v17 = v40;
                  v28 = (void *)v44;

                  v14 = v43;
                }
                else
                {
                  char v27 = 0;
                  v17 = v40;
                  v14 = v43;
                  v28 = (void *)v44;
                }
              }
              else
              {
                char v27 = 0;
                v17 = v40;
                v14 = v43;
                v28 = (void *)v44;
              }
            }
            else
            {
              char v27 = 0;
              v17 = v40;
              v14 = v43;
              v28 = (void *)v44;
            }
          }
          else
          {
            char v27 = 0;
            v14 = v43;
            v28 = (void *)v44;
          }
        }
        else
        {
          char v27 = 0;
        }
      }
      else
      {
        char v27 = 0;
      }
    }
    else
    {
      char v27 = 0;
    }
  }
  else
  {
    char v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  unint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCPaywallConfiguration paywallType](self, "paywallType"));
  uint64_t v3 = [v25 hash];
  unint64_t v24 = [(FCPaywallConfiguration *)self title];
  uint64_t v4 = [v24 hash];
  uint64_t v23 = [(FCPaywallConfiguration *)self descriptionTrial];
  uint64_t v5 = v4 ^ [v23 hash];
  id v6 = [(FCPaywallConfiguration *)self descriptionNonTrial];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(FCPaywallConfiguration *)self learnMoreTitle];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = [(FCPaywallConfiguration *)self learnMoreURL];
  uint64_t v11 = v9 ^ [v10 hash];
  int v12 = [(FCPaywallConfiguration *)self offersLinkTitle];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  v14 = [(FCPaywallConfiguration *)self offersLinkURL];
  uint64_t v15 = [v14 hash];
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCPaywallConfiguration offersLinkTargetType](self, "offersLinkTargetType"));
  uint64_t v17 = v13 ^ v15 ^ [v16 hash];
  uint64_t v18 = [(FCPaywallConfiguration *)self subscriptionButtonConfig];
  uint64_t v19 = [v18 hash];
  id v20 = [(FCPaywallConfiguration *)self visualSpecConfig];
  unint64_t v21 = v17 ^ v19 ^ [v20 hash];

  return v21;
}

+ (id)defaultArticleHardPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__FCPaywallConfiguration_defaultArticleHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D13E0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D13E0, block);
  }
  id v6 = (id)_MergedGlobals_168;

  return v6;
}

void __76__FCPaywallConfiguration_defaultArticleHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v10 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration];
  uint64_t v4 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  id v5 = [FCPaywallConfiguration alloc];
  id v6 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v9) = 0;
  uint64_t v7 = [(FCPaywallConfiguration *)v5 initWithPaywallType:1 title:v10 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v9 subscriptionButtonConfig:v4 visualSpecConfig:v6 paywallTopOffsetConfig:v3];
  v8 = (void *)_MergedGlobals_168;
  _MergedGlobals_168 = v7;
}

+ (id)defaultArticleSharedHardPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__FCPaywallConfiguration_defaultArticleSharedHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D13F0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D13F0, block);
  }
  id v6 = (id)qword_1EB5D13E8;

  return v6;
}

void __82__FCPaywallConfiguration_defaultArticleSharedHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v10 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration];
  uint64_t v4 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  id v5 = [FCPaywallConfiguration alloc];
  id v6 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v9) = 0;
  uint64_t v7 = [(FCPaywallConfiguration *)v5 initWithPaywallType:2 title:v10 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v9 subscriptionButtonConfig:v4 visualSpecConfig:v6 paywallTopOffsetConfig:v3];
  v8 = (void *)qword_1EB5D13E8;
  qword_1EB5D13E8 = v7;
}

+ (id)defaultArticleSoftPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__FCPaywallConfiguration_defaultArticleSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1400;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1400, block);
  }
  id v6 = (id)qword_1EB5D13F8;

  return v6;
}

void __76__FCPaywallConfiguration_defaultArticleSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:3 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D13F8;
  qword_1EB5D13F8 = v6;
}

+ (id)defaultArticleSharedSoftPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__FCPaywallConfiguration_defaultArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1410;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1410, block);
  }
  id v6 = (id)qword_1EB5D1408;

  return v6;
}

void __82__FCPaywallConfiguration_defaultArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:4 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D1408;
  qword_1EB5D1408 = v6;
}

+ (id)defaultChannelSoftPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__FCPaywallConfiguration_defaultChannelSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1420;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1420, block);
  }
  id v6 = (id)qword_1EB5D1418;

  return v6;
}

void __76__FCPaywallConfiguration_defaultChannelSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  v2 = FCBundle();
  id v10 = [v2 localizedStringForKey:@"Read ${channelName} and your favorite magazines and newspapers." value:&stru_1EF8299B8 table:0];

  id v3 = +[FCPaywallConfiguration defaultPaywallDescription];
  uint64_t v4 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  id v5 = [FCPaywallConfiguration alloc];
  id v6 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v9) = 0;
  uint64_t v7 = [(FCPaywallConfiguration *)v5 initWithPaywallType:5 title:v10 descriptionTrial:v3 descriptionNonTrial:v3 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v9 subscriptionButtonConfig:v4 visualSpecConfig:v6 paywallTopOffsetConfig:0];
  uint64_t v8 = (void *)qword_1EB5D1418;
  qword_1EB5D1418 = v7;
}

+ (id)defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1430;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1430, block);
  }
  id v6 = (id)qword_1EB5D1428;

  return v6;
}

void __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultSmallPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationSmall];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:6 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D1428;
  qword_1EB5D1428 = v6;
}

+ (id)defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1440;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1440, block);
  }
  id v6 = (id)qword_1EB5D1438;

  return v6;
}

void __94__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationMedium];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:7 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D1438;
  qword_1EB5D1438 = v6;
}

+ (id)defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1450;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1450, block);
  }
  id v6 = (id)qword_1EB5D1448;

  return v6;
}

void __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationLarge];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:8 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D1448;
  qword_1EB5D1448 = v6;
}

+ (id)defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1460;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1460, block);
  }
  id v6 = (id)qword_1EB5D1458;

  return v6;
}

void __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultSmallPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationSmall];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:9 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D1458;
  qword_1EB5D1458 = v6;
}

+ (id)defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1470;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1470, block);
  }
  id v6 = (id)qword_1EB5D1468;

  return v6;
}

void __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationLarge];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:10 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D1468;
  qword_1EB5D1468 = v6;
}

+ (id)defaultPDFHardPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__FCPaywallConfiguration_defaultPDFHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1480;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1480, block);
  }
  id v6 = (id)qword_1EB5D1478;

  return v6;
}

void __72__FCPaywallConfiguration_defaultPDFHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v10 = +[FCPaywallConfiguration defaultPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultPaywallDescription];
  id v3 = +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration];
  uint64_t v4 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  id v5 = [FCPaywallConfiguration alloc];
  id v6 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v9) = 0;
  uint64_t v7 = [(FCPaywallConfiguration *)v5 initWithPaywallType:11 title:v10 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v9 subscriptionButtonConfig:v4 visualSpecConfig:v6 paywallTopOffsetConfig:v3];
  uint64_t v8 = (void *)qword_1EB5D1478;
  qword_1EB5D1478 = v7;
}

+ (id)defaultAudioArticleHardPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__FCPaywallConfiguration_defaultAudioArticleHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D1490;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1490, block);
  }
  id v6 = (id)qword_1EB5D1488;

  return v6;
}

void __81__FCPaywallConfiguration_defaultAudioArticleHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v10 = +[FCPaywallConfiguration defaultAudioPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultAudioPaywallDescription];
  id v3 = +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration];
  uint64_t v4 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  id v5 = [FCPaywallConfiguration alloc];
  id v6 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v9) = 0;
  uint64_t v7 = [(FCPaywallConfiguration *)v5 initWithPaywallType:1 title:v10 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v9 subscriptionButtonConfig:v4 visualSpecConfig:v6 paywallTopOffsetConfig:v3];
  uint64_t v8 = (void *)qword_1EB5D1488;
  qword_1EB5D1488 = v7;
}

+ (id)defaultAudioArticleSharedHardPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__FCPaywallConfiguration_defaultAudioArticleSharedHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D14A0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D14A0, block);
  }
  id v6 = (id)qword_1EB5D1498;

  return v6;
}

void __87__FCPaywallConfiguration_defaultAudioArticleSharedHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v10 = +[FCPaywallConfiguration defaultAudioPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultAudioPaywallDescription];
  id v3 = +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration];
  uint64_t v4 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  id v5 = [FCPaywallConfiguration alloc];
  id v6 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v9) = 0;
  uint64_t v7 = [(FCPaywallConfiguration *)v5 initWithPaywallType:2 title:v10 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v9 subscriptionButtonConfig:v4 visualSpecConfig:v6 paywallTopOffsetConfig:v3];
  uint64_t v8 = (void *)qword_1EB5D1498;
  qword_1EB5D1498 = v7;
}

+ (id)defaultAudioArticleSoftPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__FCPaywallConfiguration_defaultAudioArticleSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D14B0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D14B0, block);
  }
  id v6 = (id)qword_1EB5D14A8;

  return v6;
}

void __81__FCPaywallConfiguration_defaultAudioArticleSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultAudioPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultAudioPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:3 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D14A8;
  qword_1EB5D14A8 = v6;
}

+ (id)defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__FCPaywallConfiguration_defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D14C0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D14C0, block);
  }
  id v6 = (id)qword_1EB5D14B8;

  return v6;
}

void __87__FCPaywallConfiguration_defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultAudioPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultAudioPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:4 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D14B8;
  qword_1EB5D14B8 = v6;
}

+ (id)defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D14D0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D14D0, block);
  }
  id v6 = (id)qword_1EB5D14C8;

  return v6;
}

void __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultAudioPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultAudioPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultAudioFeedPaywallVisualSpecConfigurationSmall];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:12 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D14C8;
  qword_1EB5D14C8 = v6;
}

+ (id)defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E5B4C018;
  id v9 = v3;
  uint64_t v4 = qword_1EB5D14E0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D14E0, block);
  }
  id v6 = (id)qword_1EB5D14D8;

  return v6;
}

void __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v9 = +[FCPaywallConfiguration defaultAudioPaywallTitle];
  v2 = +[FCPaywallConfiguration defaultAudioPaywallDescription];
  id v3 = +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:*(void *)(a1 + 32)];
  uint64_t v4 = [FCPaywallConfiguration alloc];
  id v5 = +[FCPaywallVisualSpecConfiguration defaultAudioFeedPaywallVisualSpecConfigurationSmall];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(FCPaywallConfiguration *)v4 initWithPaywallType:12 title:v9 descriptionTrial:v2 descriptionNonTrial:v2 learnMoreTitle:0 learnMoreURL:0 offersLinkTitle:0 offersLinkURL:0 offersLinkTargetType:0 externalOverridesEnabled:v8 subscriptionButtonConfig:v3 visualSpecConfig:v5 paywallTopOffsetConfig:0];
  uint64_t v7 = (void *)qword_1EB5D14D8;
  qword_1EB5D14D8 = v6;
}

+ (id)defaultSmallPaywallTitle
{
  if (qword_1EB5D14F0 != -1) {
    dispatch_once(&qword_1EB5D14F0, &__block_literal_global_65);
  }
  v2 = (void *)qword_1EB5D14E8;
  return v2;
}

void __50__FCPaywallConfiguration_defaultSmallPaywallTitle__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"Get your favorite magazines and newspapers.\nAll for one price." value:&stru_1EF8299B8 table:0];
  v1 = (void *)qword_1EB5D14E8;
  qword_1EB5D14E8 = v0;
}

+ (id)defaultPaywallTitle
{
  if (qword_1EB5D1500 != -1) {
    dispatch_once(&qword_1EB5D1500, &__block_literal_global_110);
  }
  id v2 = (void *)qword_1EB5D14F8;
  return v2;
}

void __45__FCPaywallConfiguration_defaultPaywallTitle__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"Get your favorite magazines and newspapers. All for one price." value:&stru_1EF8299B8 table:0];
  v1 = (void *)qword_1EB5D14F8;
  qword_1EB5D14F8 = v0;
}

+ (id)defaultPaywallDescription
{
  if (qword_1EB5D1510 != -1) {
    dispatch_once(&qword_1EB5D1510, &__block_literal_global_115);
  }
  id v2 = (void *)qword_1EB5D1508;
  return v2;
}

void __51__FCPaywallConfiguration_defaultPaywallDescription__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"No commitment. Plan auto-renews until canceled." value:&stru_1EF8299B8 table:0];
  v1 = (void *)qword_1EB5D1508;
  qword_1EB5D1508 = v0;
}

+ (id)defaultAudioPaywallTitle
{
  if (qword_1EB5D1520 != -1) {
    dispatch_once(&qword_1EB5D1520, &__block_literal_global_120);
  }
  id v2 = (void *)qword_1EB5D1518;
  return v2;
}

void __50__FCPaywallConfiguration_defaultAudioPaywallTitle__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"Listen to stories from top magazines and leading newspapers." value:&stru_1EF8299B8 table:0];
  v1 = (void *)qword_1EB5D1518;
  qword_1EB5D1518 = v0;
}

+ (id)defaultAudioPaywallDescription
{
  if (qword_1EB5D1530 != -1) {
    dispatch_once(&qword_1EB5D1530, &__block_literal_global_125);
  }
  id v2 = (void *)qword_1EB5D1528;
  return v2;
}

void __56__FCPaywallConfiguration_defaultAudioPaywallDescription__block_invoke()
{
  FCBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 localizedStringForKey:@"No commitment. Plan auto-renews until canceled." value:&stru_1EF8299B8 table:0];
  v1 = (void *)qword_1EB5D1528;
  qword_1EB5D1528 = v0;
}

+ (id)defaultPaywallTopOffsetConfiguration
{
  if (qword_1EB5D1540 != -1) {
    dispatch_once(&qword_1EB5D1540, &__block_literal_global_127);
  }
  id v2 = (void *)qword_1EB5D1538;
  return v2;
}

uint64_t __62__FCPaywallConfiguration_defaultPaywallTopOffsetConfiguration__block_invoke()
{
  uint64_t v0 = [[FCPaywallTopOffsetConfiguration alloc] initWithCompactPortraitTopOffsetRatio:0.1 compactLandscapeTopOffsetRatio:0.1 regularPortraitTopOffsetRatio:0.0 regularLandscapeTopOffsetRatio:0.3];
  uint64_t v1 = qword_1EB5D1538;
  qword_1EB5D1538 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)defaultDeferredPaywallTopOffsetConfiguration
{
  if (qword_1EB5D1550 != -1) {
    dispatch_once(&qword_1EB5D1550, &__block_literal_global_129);
  }
  id v2 = (void *)qword_1EB5D1548;
  return v2;
}

uint64_t __70__FCPaywallConfiguration_defaultDeferredPaywallTopOffsetConfiguration__block_invoke()
{
  uint64_t v0 = [[FCPaywallTopOffsetConfiguration alloc] initWithCompactPortraitTopOffsetRatio:0.1 compactLandscapeTopOffsetRatio:0.7 regularPortraitTopOffsetRatio:0.2 regularLandscapeTopOffsetRatio:0.7];
  uint64_t v1 = qword_1EB5D1548;
  qword_1EB5D1548 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)paywallType
{
  return self->_paywallType;
}

- (void)setPaywallType:(unint64_t)a3
{
  self->_paywallType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)descriptionTrial
{
  return self->_descriptionTrial;
}

- (void)setDescriptionTrial:(id)a3
{
}

- (NSString)descriptionNonTrial
{
  return self->_descriptionNonTrial;
}

- (void)setDescriptionNonTrial:(id)a3
{
}

- (NSString)learnMoreTitle
{
  return self->_learnMoreTitle;
}

- (void)setLearnMoreTitle:(id)a3
{
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (NSString)offersLinkTitle
{
  return self->_offersLinkTitle;
}

- (void)setOffersLinkTitle:(id)a3
{
}

- (NSURL)offersLinkURL
{
  return self->_offersLinkURL;
}

- (void)setOffersLinkURL:(id)a3
{
}

- (unint64_t)offersLinkTargetType
{
  return self->_offersLinkTargetType;
}

- (void)setOffersLinkTargetType:(unint64_t)a3
{
  self->_offersLinkTargetType = a3;
}

- (BOOL)externalOverridesEnabled
{
  return self->_externalOverridesEnabled;
}

- (FCSubscriptionButtonConfiguration)subscriptionButtonConfig
{
  return self->_subscriptionButtonConfig;
}

- (void)setSubscriptionButtonConfig:(id)a3
{
}

- (FCPaywallVisualSpecConfiguration)visualSpecConfig
{
  return self->_visualSpecConfig;
}

- (void)setVisualSpecConfig:(id)a3
{
}

- (FCPaywallTopOffsetConfiguration)paywallTopOffsetConfig
{
  return self->_paywallTopOffsetConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paywallTopOffsetConfig, 0);
  objc_storeStrong((id *)&self->_visualSpecConfig, 0);
  objc_storeStrong((id *)&self->_subscriptionButtonConfig, 0);
  objc_storeStrong((id *)&self->_offersLinkURL, 0);
  objc_storeStrong((id *)&self->_offersLinkTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_learnMoreTitle, 0);
  objc_storeStrong((id *)&self->_descriptionNonTrial, 0);
  objc_storeStrong((id *)&self->_descriptionTrial, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end