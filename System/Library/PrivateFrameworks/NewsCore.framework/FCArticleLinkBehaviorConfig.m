@interface FCArticleLinkBehaviorConfig
- (BOOL)lohAnimationCompletesInArticle;
- (BOOL)lohAnimationEnabled;
- (BOOL)openArticlesAsModals;
- (FCArticleLinkBehaviorConfig)initWithConfigDictionary:(id)a3;
- (NSString)animationBody;
- (NSString)animationTitleLine1;
- (NSString)animationTitleLine2;
- (int)animationCampaignVersion;
- (int)animationMaxCount;
- (int64_t)animationQuiescenceInterval;
@end

@implementation FCArticleLinkBehaviorConfig

- (FCArticleLinkBehaviorConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCArticleLinkBehaviorConfig;
  v5 = [(FCArticleLinkBehaviorConfig *)&v19 init];
  if (v5)
  {
    v5->_openArticlesAsModals = FCAppConfigurationBoolValue(v4, @"openArticlesAsModals", 0);
    v5->_lohAnimationEnabled = FCAppConfigurationBoolValue(v4, @"lohAnimationEnabled", 0);
    v5->_lohAnimationCompletesInArticle = FCAppConfigurationBoolValue(v4, @"lohAnimationCompletesInArticle", 0);
    v6 = FCBundle();
    v7 = [v6 localizedStringForKey:@"Welcome to" value:&stru_1EF8299B8 table:0];
    uint64_t v8 = FCAppConfigurationStringValue(v4, @"animationTitleLine1", v7);
    animationTitleLine1 = v5->_animationTitleLine1;
    v5->_animationTitleLine1 = (NSString *)v8;

    v10 = FCBundle();
    v11 = [v10 localizedStringForKey:@"Apple News" value:&stru_1EF8299B8 table:0];
    uint64_t v12 = FCAppConfigurationStringValue(v4, @"animationTitleLine2", v11);
    animationTitleLine2 = v5->_animationTitleLine2;
    v5->_animationTitleLine2 = (NSString *)v12;

    v14 = FCBundle();
    v15 = [v14 localizedStringForKey:@"All your news, all in one app.", &stru_1EF8299B8, 0 value table];
    uint64_t v16 = FCAppConfigurationStringValue(v4, @"animationBody", v15);
    animationBody = v5->_animationBody;
    v5->_animationBody = (NSString *)v16;

    v5->_animationMaxCount = FCAppConfigurationIntegerValue(v4, @"animationMaxCount", 3);
    v5->_animationQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"animationQuiescenceInterval", 172800);
    v5->_animationCampaignVersion = FCAppConfigurationIntegerValue(v4, @"animationCampaignVersion", 0);
  }

  return v5;
}

- (BOOL)openArticlesAsModals
{
  return self->_openArticlesAsModals;
}

- (BOOL)lohAnimationEnabled
{
  return self->_lohAnimationEnabled;
}

- (BOOL)lohAnimationCompletesInArticle
{
  return self->_lohAnimationCompletesInArticle;
}

- (NSString)animationTitleLine1
{
  return self->_animationTitleLine1;
}

- (NSString)animationTitleLine2
{
  return self->_animationTitleLine2;
}

- (NSString)animationBody
{
  return self->_animationBody;
}

- (int64_t)animationQuiescenceInterval
{
  return self->_animationQuiescenceInterval;
}

- (int)animationMaxCount
{
  return self->_animationMaxCount;
}

- (int)animationCampaignVersion
{
  return self->_animationCampaignVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationBody, 0);
  objc_storeStrong((id *)&self->_animationTitleLine2, 0);
  objc_storeStrong((id *)&self->_animationTitleLine1, 0);
}

@end