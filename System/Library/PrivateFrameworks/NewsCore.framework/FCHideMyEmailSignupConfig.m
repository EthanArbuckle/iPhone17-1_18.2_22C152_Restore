@interface FCHideMyEmailSignupConfig
+ (id)defaultConfig;
- (BOOL)isEnabled;
- (BOOL)useChannelFont;
- (FCConfigHyperlinkText)policyText;
- (FCContentColorPair)backgroundColor;
- (FCContentColorPair)primaryColor;
- (FCContentColorPair)secondaryColor;
- (FCContentColorPair)tertiaryColor;
- (FCHideMyEmailSignupConfig)initWithConfigDictionary:(id)a3;
- (NSString)ctaButtonText;
- (NSString)headline;
- (NSString)subheadline;
- (double)headlineLineSpacing;
- (id)initDefault;
@end

@implementation FCHideMyEmailSignupConfig

- (FCHideMyEmailSignupConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)FCHideMyEmailSignupConfig;
  v5 = [(FCHideMyEmailSignupConfig *)&v36 init];
  if (v5)
  {
    v5->_isEnabled = FCAppConfigurationBoolValue(v4, @"isEnabled", 0);
    v6 = +[FCHideMyEmailSignupConfig defaultConfig];
    v7 = [v6 headline];
    uint64_t v8 = FCAppConfigurationStringValue(v4, @"headline", v7);
    headline = v5->_headline;
    v5->_headline = (NSString *)v8;

    v5->_headlineLineSpacing = FCAppConfigurationDoubleValue(v4, @"headlineLineSpacing", 1.0);
    v10 = +[FCHideMyEmailSignupConfig defaultConfig];
    v11 = [v10 subheadline];
    uint64_t v12 = FCAppConfigurationStringValue(v4, @"subheadline", v11);
    subheadline = v5->_subheadline;
    v5->_subheadline = (NSString *)v12;

    v14 = +[FCHideMyEmailSignupConfig defaultConfig];
    v15 = [v14 ctaButtonText];
    uint64_t v16 = FCAppConfigurationStringValue(v4, @"ctaButtonText", v15);
    ctaButtonText = v5->_ctaButtonText;
    v5->_ctaButtonText = (NSString *)v16;

    v18 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"policyText", 0);
    if (v18)
    {
      v19 = [[FCConfigHyperlinkText alloc] initWithConfigDictionary:v18];
      policyText = v5->_policyText;
      v5->_policyText = v19;
    }
    else
    {
      policyText = +[FCHideMyEmailSignupConfig defaultConfig];
      uint64_t v21 = [policyText policyText];
      v22 = v5->_policyText;
      v5->_policyText = (FCConfigHyperlinkText *)v21;
    }
    v5->_useChannelFont = FCAppConfigurationBoolValue(v4, @"useChannelFont", 1);
    v23 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"primaryColor", 0);
    uint64_t v24 = +[FCContentColorPair colorPairWithDictionary:v23];
    primaryColor = v5->_primaryColor;
    v5->_primaryColor = (FCContentColorPair *)v24;

    v26 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"secondaryColor", 0);
    uint64_t v27 = +[FCContentColorPair colorPairWithDictionary:v26];
    secondaryColor = v5->_secondaryColor;
    v5->_secondaryColor = (FCContentColorPair *)v27;

    v29 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"tertiaryColor", 0);
    uint64_t v30 = +[FCContentColorPair colorPairWithDictionary:v29];
    tertiaryColor = v5->_tertiaryColor;
    v5->_tertiaryColor = (FCContentColorPair *)v30;

    v32 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"backgroundColor", 0);
    uint64_t v33 = +[FCContentColorPair colorPairWithDictionary:v32];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (FCContentColorPair *)v33;
  }
  return v5;
}

+ (id)defaultConfig
{
  if (qword_1EB5D1560 != -1) {
    dispatch_once(&qword_1EB5D1560, &__block_literal_global_70);
  }
  v2 = (void *)_MergedGlobals_169;
  return v2;
}

- (NSString)subheadline
{
  return self->_subheadline;
}

- (NSString)headline
{
  return self->_headline;
}

- (NSString)ctaButtonText
{
  return self->_ctaButtonText;
}

uint64_t __42__FCHideMyEmailSignupConfig_defaultConfig__block_invoke()
{
  id v0 = [[FCHideMyEmailSignupConfig alloc] initDefault];
  uint64_t v1 = _MergedGlobals_169;
  _MergedGlobals_169 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)initDefault
{
  v11.receiver = self;
  v11.super_class = (Class)FCHideMyEmailSignupConfig;
  v2 = [(FCHideMyEmailSignupConfig *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_isEnabled = 1;
    headline = v2->_headline;
    v2->_headline = (NSString *)@"Your subscription includes access on the publisher’s website.";

    subheadline = v3->_subheadline;
    v3->_headlineLineSpacing = 1.0;
    v3->_subheadline = (NSString *)@"The publisher will contact you with additional details. You can share your email address or keep it private.";

    ctaButtonText = v3->_ctaButtonText;
    v3->_ctaButtonText = (NSString *)@"Continue";

    v7 = [FCConfigHyperlinkText alloc];
    uint64_t v8 = [(FCConfigHyperlinkText *)v7 initWithText:@"The publisher may use the information you choose to share in accordance with their privacy policy." links:MEMORY[0x1E4F1CBF0]];
    policyText = v3->_policyText;
    v3->_policyText = (FCConfigHyperlinkText *)v8;

    v3->_useChannelFont = 1;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_policyText, 0);
  objc_storeStrong((id *)&self->_ctaButtonText, 0);
  objc_storeStrong((id *)&self->_subheadline, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (double)headlineLineSpacing
{
  return self->_headlineLineSpacing;
}

- (FCConfigHyperlinkText)policyText
{
  return self->_policyText;
}

- (BOOL)useChannelFont
{
  return self->_useChannelFont;
}

- (FCContentColorPair)primaryColor
{
  return self->_primaryColor;
}

- (FCContentColorPair)secondaryColor
{
  return self->_secondaryColor;
}

- (FCContentColorPair)tertiaryColor
{
  return self->_tertiaryColor;
}

- (FCContentColorPair)backgroundColor
{
  return self->_backgroundColor;
}

@end