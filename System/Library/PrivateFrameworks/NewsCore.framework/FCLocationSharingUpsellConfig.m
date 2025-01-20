@interface FCLocationSharingUpsellConfig
- (FCLocationSharingUpsellConfig)initWithConfigDictionary:(id)a3;
- (NSString)landingPageArticleID;
- (void)setLandingPageArticleID:(id)a3;
@end

@implementation FCLocationSharingUpsellConfig

- (FCLocationSharingUpsellConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCLocationSharingUpsellConfig;
  v5 = [(FCLocationSharingUpsellConfig *)&v7 init];
  if (v5) {
    v5->_landingPageArticleID = (NSString *)FCAppConfigurationStringValue(v4, @"landingPageArticleId", 0);
  }

  return v5;
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
  self->_landingPageArticleID = (NSString *)a3;
}

@end