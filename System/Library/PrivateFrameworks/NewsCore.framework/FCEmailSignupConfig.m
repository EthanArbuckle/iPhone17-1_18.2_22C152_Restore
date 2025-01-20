@interface FCEmailSignupConfig
- (FCEmailSignupConfig)initWithConfigDictionary:(id)a3;
- (NSString)alertAcceptActionTitle;
- (NSString)alertDeclineActionTitle;
- (NSString)alertEmailAvailableMessage;
- (NSString)alertEmailUnavailableMessage;
- (NSString)alertTitle;
- (NSString)landingPageArticleID;
- (unint64_t)emailSignupStyle;
- (void)setAlertAcceptActionTitle:(id)a3;
- (void)setAlertDeclineActionTitle:(id)a3;
- (void)setAlertEmailAvailableMessage:(id)a3;
- (void)setAlertEmailUnavailableMessage:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setEmailSignupStyle:(unint64_t)a3;
- (void)setLandingPageArticleID:(id)a3;
@end

@implementation FCEmailSignupConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertDeclineActionTitle, 0);
  objc_storeStrong((id *)&self->_alertAcceptActionTitle, 0);
  objc_storeStrong((id *)&self->_alertEmailUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_alertEmailAvailableMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_landingPageArticleID, 0);
}

- (FCEmailSignupConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCEmailSignupConfig;
  v5 = [(FCEmailSignupConfig *)&v20 init];
  if (v5)
  {
    v6 = FCAppConfigurationStringValue(v4, @"emailSignupStyle", 0);
    v5->_emailSignupStyle = FCEmailSignupStyleForValue(v6);

    uint64_t v7 = FCAppConfigurationStringValue(v4, @"landingPageArticleID", &stru_1EF8299B8);
    landingPageArticleID = v5->_landingPageArticleID;
    v5->_landingPageArticleID = (NSString *)v7;

    uint64_t v9 = FCAppConfigurationStringValue(v4, @"alertTitle", &stru_1EF8299B8);
    alertTitle = v5->_alertTitle;
    v5->_alertTitle = (NSString *)v9;

    uint64_t v11 = FCAppConfigurationStringValue(v4, @"alertEmailAvailableMessage", &stru_1EF8299B8);
    alertEmailAvailableMessage = v5->_alertEmailAvailableMessage;
    v5->_alertEmailAvailableMessage = (NSString *)v11;

    uint64_t v13 = FCAppConfigurationStringValue(v4, @"alertEmailUnavailableMessage", &stru_1EF8299B8);
    alertEmailUnavailableMessage = v5->_alertEmailUnavailableMessage;
    v5->_alertEmailUnavailableMessage = (NSString *)v13;

    uint64_t v15 = FCAppConfigurationStringValue(v4, @"alertAcceptActionTitle", &stru_1EF8299B8);
    alertAcceptActionTitle = v5->_alertAcceptActionTitle;
    v5->_alertAcceptActionTitle = (NSString *)v15;

    uint64_t v17 = FCAppConfigurationStringValue(v4, @"alertDeclineActionTitle", &stru_1EF8299B8);
    alertDeclineActionTitle = v5->_alertDeclineActionTitle;
    v5->_alertDeclineActionTitle = (NSString *)v17;
  }
  return v5;
}

- (unint64_t)emailSignupStyle
{
  return self->_emailSignupStyle;
}

- (void)setEmailSignupStyle:(unint64_t)a3
{
  self->_emailSignupStyle = a3;
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertEmailAvailableMessage
{
  return self->_alertEmailAvailableMessage;
}

- (void)setAlertEmailAvailableMessage:(id)a3
{
}

- (NSString)alertEmailUnavailableMessage
{
  return self->_alertEmailUnavailableMessage;
}

- (void)setAlertEmailUnavailableMessage:(id)a3
{
}

- (NSString)alertAcceptActionTitle
{
  return self->_alertAcceptActionTitle;
}

- (void)setAlertAcceptActionTitle:(id)a3
{
}

- (NSString)alertDeclineActionTitle
{
  return self->_alertDeclineActionTitle;
}

- (void)setAlertDeclineActionTitle:(id)a3
{
}

@end