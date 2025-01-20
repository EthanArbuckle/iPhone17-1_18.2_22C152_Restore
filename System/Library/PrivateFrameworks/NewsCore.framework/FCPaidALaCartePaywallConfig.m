@interface FCPaidALaCartePaywallConfig
- (BOOL)isEqual:(id)a3;
- (FCPaidALaCartePaywallConfig)init;
- (FCPaidALaCartePaywallConfig)initWithChannelID:(id)a3 channelPaywallTitle:(id)a4 hardPaywallTitle:(id)a5 leakyPaywallTitle:(id)a6 promotionalPaywallTitle:(id)a7;
- (FCPaidALaCartePaywallConfig)initWithChannelID:(id)a3 configDictionary:(id)a4;
- (NSString)channelID;
- (NSString)channelId;
- (NSString)channelPaywallTitle;
- (NSString)hardPaywallTitle;
- (NSString)leakyPaywallTitle;
- (NSString)promotionalPaywallTitle;
- (unint64_t)hash;
- (void)setChannelId:(id)a3;
- (void)setChannelPaywallTitle:(id)a3;
- (void)setHardPaywallTitle:(id)a3;
- (void)setLeakyPaywallTitle:(id)a3;
- (void)setPromotionalPaywallTitle:(id)a3;
@end

@implementation FCPaidALaCartePaywallConfig

- (FCPaidALaCartePaywallConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPaidALaCartePaywallConfig init]";
    __int16 v9 = 2080;
    v10 = "FCPaidALaCartePaywallConfig.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPaidALaCartePaywallConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPaidALaCartePaywallConfig)initWithChannelID:(id)a3 configDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = FCAppConfigurationStringValue(v6, @"channelPaywall", 0);
  __int16 v9 = FCAppConfigurationStringValue(v6, @"hardPaywall", 0);
  v10 = FCAppConfigurationStringValue(v6, @"leakyPaywall", 0);
  __int16 v11 = FCAppConfigurationStringValue(v6, @"promotionalPaywall", 0);

  int v12 = [(FCPaidALaCartePaywallConfig *)self initWithChannelID:v7 channelPaywallTitle:v8 hardPaywallTitle:v9 leakyPaywallTitle:v10 promotionalPaywallTitle:v11];
  return v12;
}

- (FCPaidALaCartePaywallConfig)initWithChannelID:(id)a3 channelPaywallTitle:(id)a4 hardPaywallTitle:(id)a5 leakyPaywallTitle:(id)a6 promotionalPaywallTitle:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FCPaidALaCartePaywallConfig;
  v17 = [(FCPaidALaCartePaywallConfig *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    channelID = v17->_channelID;
    v17->_channelID = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    channelPaywallTitle = v17->_channelPaywallTitle;
    v17->_channelPaywallTitle = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    hardPaywallTitle = v17->_hardPaywallTitle;
    v17->_hardPaywallTitle = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    leakyPaywallTitle = v17->_leakyPaywallTitle;
    v17->_leakyPaywallTitle = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    promotionalPaywallTitle = v17->_promotionalPaywallTitle;
    v17->_promotionalPaywallTitle = (NSString *)v26;
  }
  return v17;
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
    id v7 = (void *)MEMORY[0x1E4FBA8A8];
    v8 = [(FCPaidALaCartePaywallConfig *)self channelId];
    __int16 v9 = [v6 channelID];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E4FBA8A8];
      __int16 v11 = [(FCPaidALaCartePaywallConfig *)self channelPaywallTitle];
      id v12 = [v6 channelPaywallTitle];
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        id v13 = (void *)MEMORY[0x1E4FBA8A8];
        id v14 = [(FCPaidALaCartePaywallConfig *)self hardPaywallTitle];
        id v15 = [v6 hardPaywallTitle];
        if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
        {
          uint64_t v26 = v14;
          id v16 = (void *)MEMORY[0x1E4FBA8A8];
          uint64_t v17 = [(FCPaidALaCartePaywallConfig *)self leakyPaywallTitle];
          uint64_t v18 = [v6 leakyPaywallTitle];
          v27 = (void *)v17;
          uint64_t v19 = v17;
          uint64_t v20 = (void *)v18;
          if (objc_msgSend(v16, "nf_object:isEqualToObject:", v19, v18))
          {
            v25 = (void *)MEMORY[0x1E4FBA8A8];
            v21 = [(FCPaidALaCartePaywallConfig *)self promotionalPaywallTitle];
            uint64_t v22 = [v6 promotionalPaywallTitle];
            char v23 = objc_msgSend(v25, "nf_object:isEqualToObject:", v21, v22);
          }
          else
          {
            char v23 = 0;
          }

          id v14 = v26;
        }
        else
        {
          char v23 = 0;
        }
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }
  else
  {
    char v23 = 0;
  }

  return v23;
}

- (unint64_t)hash
{
  v3 = [(FCPaidALaCartePaywallConfig *)self channelId];
  uint64_t v4 = [v3 hash];
  v5 = [(FCPaidALaCartePaywallConfig *)self channelPaywallTitle];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(FCPaidALaCartePaywallConfig *)self hardPaywallTitle];
  uint64_t v8 = [v7 hash];
  __int16 v9 = [(FCPaidALaCartePaywallConfig *)self leakyPaywallTitle];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  __int16 v11 = [(FCPaidALaCartePaywallConfig *)self promotionalPaywallTitle];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)channelPaywallTitle
{
  return self->_channelPaywallTitle;
}

- (void)setChannelPaywallTitle:(id)a3
{
}

- (NSString)hardPaywallTitle
{
  return self->_hardPaywallTitle;
}

- (void)setHardPaywallTitle:(id)a3
{
}

- (NSString)leakyPaywallTitle
{
  return self->_leakyPaywallTitle;
}

- (void)setLeakyPaywallTitle:(id)a3
{
}

- (NSString)promotionalPaywallTitle
{
  return self->_promotionalPaywallTitle;
}

- (void)setPromotionalPaywallTitle:(id)a3
{
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelId, 0);
  objc_storeStrong((id *)&self->_promotionalPaywallTitle, 0);
  objc_storeStrong((id *)&self->_leakyPaywallTitle, 0);
  objc_storeStrong((id *)&self->_hardPaywallTitle, 0);
  objc_storeStrong((id *)&self->_channelPaywallTitle, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

@end