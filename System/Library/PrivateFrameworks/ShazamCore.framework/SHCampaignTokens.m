@interface SHCampaignTokens
- (NSDictionary)campaignTokens;
- (SHCampaignTokens)initWithConfiguration:(id)a3;
- (id)tokenForClientIdentifier:(id)a3;
@end

@implementation SHCampaignTokens

- (SHCampaignTokens)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHCampaignTokens;
  v6 = [(SHCampaignTokens *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_campaignTokens, a3);
  }

  return v7;
}

- (id)tokenForClientIdentifier:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@.%@", @"itsct", a3];
  id v5 = [(SHCampaignTokens *)self campaignTokens];
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = v6;
  if (!v6) {
    v6 = @"bglsk";
  }
  v8 = v6;

  return v8;
}

- (NSDictionary)campaignTokens
{
  return self->_campaignTokens;
}

- (void).cxx_destruct
{
}

@end