@interface FCSIWAPurchaseConfig
- (BOOL)isEnabled;
- (FCSIWAPurchaseConfig)initWithClientIdentifier:(id)a3 teamIdentifier:(id)a4;
- (FCSIWAPurchaseConfig)initWithConfigDictionary:(id)a3;
- (NSString)clientIdentifier;
- (NSString)teamIdentifier;
@end

@implementation FCSIWAPurchaseConfig

- (FCSIWAPurchaseConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCSIWAPurchaseConfig;
  v5 = [(FCSIWAPurchaseConfig *)&v11 init];
  if (v5)
  {
    v5->_isEnabled = FCAppConfigurationBoolValue(v4, @"isEnabled", 0);
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"clientIdentifier", 0);
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationStringValue(v4, @"teamIdentifier", 0);
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (FCSIWAPurchaseConfig)initWithClientIdentifier:(id)a3 teamIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCSIWAPurchaseConfig;
  v9 = [(FCSIWAPurchaseConfig *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_isEnabled = 1;
    objc_storeStrong((id *)&v9->_clientIdentifier, a3);
    objc_storeStrong((id *)&v10->_teamIdentifier, a4);
  }

  return v10;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

@end