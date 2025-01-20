@interface FCCampaignReferralConfig
- (FCCampaignReferralConfig)initWithCampaignID:(id)a3 configDictionary:(id)a4;
- (NSArray)autoFavoriteTagIDs;
- (NSString)campaignID;
- (void)setAutoFavoriteTagIDs:(id)a3;
- (void)setCampaignID:(id)a3;
@end

@implementation FCCampaignReferralConfig

- (FCCampaignReferralConfig)initWithCampaignID:(id)a3 configDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCCampaignReferralConfig;
  v9 = [(FCCampaignReferralConfig *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_campaignID, a3);
    uint64_t v11 = FCAppConfigurationArrayValueWithDefaultValue(v8, @"autoFavoriteTagIds", 0);
    autoFavoriteTagIDs = v10->_autoFavoriteTagIDs;
    v10->_autoFavoriteTagIDs = (NSArray *)v11;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_campaignID, 0);
}

- (NSString)campaignID
{
  return self->_campaignID;
}

- (void)setCampaignID:(id)a3
{
}

- (NSArray)autoFavoriteTagIDs
{
  return self->_autoFavoriteTagIDs;
}

- (void)setAutoFavoriteTagIDs:(id)a3
{
}

@end