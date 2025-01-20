@interface WFPrivateAddressConfig
- (BOOL)isCarrierBundleBased;
- (BOOL)isEqual:(id)a3;
- (NSString)ssid;
- (WFPrivateAddressConfig)initWithPrivateAddressConfigDictionary:(id)a3 ssid:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)disabledReason;
- (unint64_t)hash;
- (void)setCarrierBundleBased:(BOOL)a3;
- (void)setDisabledReason:(unint64_t)a3;
- (void)setSsid:(id)a3;
@end

@implementation WFPrivateAddressConfig

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    objc_msgSend(v5, "setDisabledReason:", -[WFPrivateAddressConfig disabledReason](self, "disabledReason"));
    objc_msgSend(v5, "setCarrierBundleBased:", -[WFPrivateAddressConfig isCarrierBundleBased](self, "isCarrierBundleBased"));
    v6 = [(WFPrivateAddressConfig *)self ssid];
    v7 = (void *)[v6 copyWithZone:a3];
    [v5 setSsid:v7];
  }
  return v5;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (void)setDisabledReason:(unint64_t)a3
{
  self->_disabledReason = a3;
}

- (void)setCarrierBundleBased:(BOOL)a3
{
  self->_carrierBundleBased = a3;
}

- (BOOL)isCarrierBundleBased
{
  return self->_carrierBundleBased;
}

- (unint64_t)disabledReason
{
  return self->_disabledReason;
}

- (WFPrivateAddressConfig)initWithPrivateAddressConfigDictionary:(id)a3 ssid:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || ![v6 count]) {
    goto LABEL_34;
  }
  if (!v7)
  {
    v27 = WFLogForCategory(0);
    os_log_type_t v28 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v27 && os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
      _os_log_impl(&dword_226071000, v27, v28, "%s: ssid is null", buf, 0xCu);
    }

    goto LABEL_34;
  }
  v30.receiver = self;
  v30.super_class = (Class)WFPrivateAddressConfig;
  v8 = [(WFPrivateAddressConfig *)&v30 init];
  self = v8;
  if (!v8)
  {
LABEL_34:

    self = 0;
    goto LABEL_35;
  }
  p_ssid = &v8->_ssid;
  objc_storeStrong((id *)&v8->_ssid, a4);
  v10 = WFLogForCategory(0);
  os_log_type_t v11 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v10 && os_log_type_enabled(v10, v11))
  {
    v12 = *p_ssid;
    *(_DWORD *)buf = 136315650;
    v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
    __int16 v33 = 2112;
    *(void *)v34 = v12;
    *(_WORD *)&v34[8] = 2112;
    *(void *)&v34[10] = v6;
    _os_log_impl(&dword_226071000, v10, v11, "%s: %@ private address config: %@", buf, 0x20u);
  }

  uint64_t v13 = *MEMORY[0x263F55F18];
  v14 = [v6 objectForKeyedSubscript:*MEMORY[0x263F55F18]];

  if (v14)
  {
    v15 = [v6 objectForKeyedSubscript:v13];
    self->_carrierBundleBased = [v15 BOOLValue];
  }
  uint64_t v16 = *MEMORY[0x263F55F00];
  v17 = [v6 objectForKeyedSubscript:*MEMORY[0x263F55F00]];

  if (v17)
  {
    v18 = [v6 objectForKeyedSubscript:v16];
    int v19 = [v18 intValue];

    switch(v19)
    {
      case 1:
        if (self->_carrierBundleBased) {
          unint64_t v20 = 3;
        }
        else {
          unint64_t v20 = 4;
        }
        break;
      case 2:
      case 4:
        unint64_t v20 = 2;
        break;
      case 3:
        unint64_t v20 = 1;
        break;
      default:
        unint64_t v20 = 0;
        break;
    }
    v21 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v21 && os_log_type_enabled(v21, v24))
    {
      uint64_t v25 = (uint64_t)*(&off_26478F8F8 + v20);
      v26 = *p_ssid;
      *(_DWORD *)buf = 136315906;
      v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = v19;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v25;
      *(_WORD *)&v34[14] = 2112;
      *(void *)&v34[16] = v26;
      _os_log_impl(&dword_226071000, v21, v24, "%s: disable reason: %d (%@) for %@", buf, 0x26u);
    }
  }
  else
  {
    v21 = WFLogForCategory(0);
    uint64_t v22 = OSLogForWFLogLevel(4uLL);
    unint64_t v20 = 0;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v21)
    {
      if (os_log_type_enabled(v21, (os_log_type_t)v22))
      {
        v23 = *p_ssid;
        *(_DWORD *)buf = 136315394;
        v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
        __int16 v33 = 2112;
        *(void *)v34 = v23;
        _os_log_impl(&dword_226071000, v21, (os_log_type_t)v22, "%s: missing disabled reason key for %@, defaulting to none", buf, 0x16u);
      }
      unint64_t v20 = 0;
    }
  }

  self->_disabledReason = v20;
LABEL_35:

  return self;
}

- (unint64_t)hash
{
  v3 = [(WFPrivateAddressConfig *)self ssid];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(WFPrivateAddressConfig *)self disabledReason] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 ssid];
    id v7 = [(WFPrivateAddressConfig *)self ssid];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [v5 disabledReason];
      BOOL v9 = v8 == [(WFPrivateAddressConfig *)self disabledReason];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(WFPrivateAddressConfig *)self ssid];
  unint64_t v7 = [(WFPrivateAddressConfig *)self disabledReason];
  if (v7 > 4) {
    uint64_t v8 = @"unknown";
  }
  else {
    uint64_t v8 = *(&off_26478F8F8 + v7);
  }
  BOOL v9 = [v3 stringWithFormat:@"<%@ : %p %@ disabled reason: %@>", v5, self, v6, v8];

  return v9;
}

@end