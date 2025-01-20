@interface FCNewsTabiPersonalizedPaywallsConfiguration
- (BOOL)omitHardFollows;
- (FCNewsTabiPersonalizedPaywallsConfiguration)init;
- (FCNewsTabiPersonalizedPaywallsConfiguration)initWithDictionary:(id)a3;
- (NSString)channelIDsOutputName;
- (NSString)contextFeatureKey;
- (NSString)scoresOutputName;
- (id)description;
- (void)setChannelIDsOutputName:(id)a3;
- (void)setContextFeatureKey:(id)a3;
- (void)setOmitHardFollows:(BOOL)a3;
- (void)setScoresOutputName:(id)a3;
@end

@implementation FCNewsTabiPersonalizedPaywallsConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiPersonalizedPaywallsConfiguration *)self contextFeatureKey];
  [v3 appendFormat:@"\n\tcontextFeatureKey: %@;", v4];

  v5 = [(FCNewsTabiPersonalizedPaywallsConfiguration *)self channelIDsOutputName];
  [v3 appendFormat:@"\n\tchannelIDsOutputName: %@;", v5];

  objc_msgSend(v3, "appendFormat:", @"\n\tomitHardFollows: %d", -[FCNewsTabiPersonalizedPaywallsConfiguration omitHardFollows](self, "omitHardFollows"));
  v6 = [(FCNewsTabiPersonalizedPaywallsConfiguration *)self scoresOutputName];
  [v3 appendFormat:@"\n\tscoresOutputName: %@;", v6];

  [v3 appendString:@"\n>"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoresOutputName, 0);
  objc_storeStrong((id *)&self->_channelIDsOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

- (FCNewsTabiPersonalizedPaywallsConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"contextFeatureKey", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = FCAppConfigurationStringValue(v4, @"channelIDsOutputName", 0);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = FCAppConfigurationStringValue(v4, @"scoresOutputName", 0);
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
        v18.receiver = self;
        v18.super_class = (Class)FCNewsTabiPersonalizedPaywallsConfiguration;
        v14 = [(FCNewsTabiPersonalizedPaywallsConfiguration *)&v18 init];
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_contextFeatureKey, v6);
          objc_storeStrong((id *)&v15->_channelIDsOutputName, v9);
          v15->_omitHardFollows = FCAppConfigurationBoolValue(v4, @"omitHardFollows", 0);
          objc_storeStrong((id *)&v15->_scoresOutputName, v12);
        }
        self = v15;

        v16 = self;
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)scoresOutputName
{
  return self->_scoresOutputName;
}

- (BOOL)omitHardFollows
{
  return self->_omitHardFollows;
}

- (NSString)contextFeatureKey
{
  return self->_contextFeatureKey;
}

- (NSString)channelIDsOutputName
{
  return self->_channelIDsOutputName;
}

- (FCNewsTabiPersonalizedPaywallsConfiguration)init
{
  return [(FCNewsTabiPersonalizedPaywallsConfiguration *)self initWithDictionary:0];
}

- (void)setContextFeatureKey:(id)a3
{
}

- (void)setChannelIDsOutputName:(id)a3
{
}

- (void)setOmitHardFollows:(BOOL)a3
{
  self->_omitHardFollows = a3;
}

- (void)setScoresOutputName:(id)a3
{
}

@end