@interface FCSportsFavoritesSyncModalConfig
- (FCSportsFavoritesSyncModalConfig)initWithConfigDictionary:(id)a3;
- (NSString)bodyText;
- (NSString)titleText;
@end

@implementation FCSportsFavoritesSyncModalConfig

- (FCSportsFavoritesSyncModalConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCSportsFavoritesSyncModalConfig;
  v5 = [(FCSportsFavoritesSyncModalConfig *)&v11 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"titleText", 0);
    titleText = v5->_titleText;
    v5->_titleText = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationStringValue(v4, @"bodyText", 0);
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v8;
  }
  return v5;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end