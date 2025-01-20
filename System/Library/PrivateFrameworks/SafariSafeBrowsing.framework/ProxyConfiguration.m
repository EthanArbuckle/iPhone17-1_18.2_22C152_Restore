@interface ProxyConfiguration
+ (BOOL)shouldRetryForError:(id)a3;
+ (id)currentVersion;
- (NSDictionary)deviceIdentificationToken;
- (NSDictionary)proxy;
- (ProxyConfiguration)initWithDeviceIdentificationToken:(id)a3;
- (void)applyToRequest:(id)a3;
@end

@implementation ProxyConfiguration

+ (id)currentVersion
{
  return @"v1";
}

+ (BOOL)shouldRetryForError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263EFC6F0]]) {
    BOOL v5 = [v3 code] == 310;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (ProxyConfiguration)initWithDeviceIdentificationToken:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ProxyConfiguration;
  v6 = [(ProxyConfiguration *)&v14 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (Backend::Google::SSBUtilities::shouldConsultWithTencent((Backend::Google::SSBUtilities *)v6))
    {
      v8 = 0;
    }
    else
    {
      v9 = +[RemoteConfigurationController sharedController];
      v10 = [v9 googleProviderConfiguration];
      char v11 = [v10 proxyOff];

      if (v11)
      {
        v8 = 0;
      }
      else
      {
        proxy = v7->_proxy;
        v7->_proxy = (NSDictionary *)&unk_26BE0FC08;

        objc_storeStrong((id *)&v7->_deviceIdentificationToken, a3);
        v8 = v7;
      }
    }
  }

  return v8;
}

- (void)applyToRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ProxyConfiguration *)self proxy];

  if (v5)
  {
    v6 = [(ProxyConfiguration *)self proxy];
    CFURLRequestSetProxySettings();
  }
  v7 = [(ProxyConfiguration *)self deviceIdentificationToken];

  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [(ProxyConfiguration *)self deviceIdentificationToken];
    v9 = [v8 allKeys];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_super v14 = [(ProxyConfiguration *)self deviceIdentificationToken];
            v15 = [v14 objectForKeyedSubscript:v13];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v4 setValue:v15 forHTTPHeaderField:v13];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (NSDictionary)proxy
{
  return self->_proxy;
}

- (NSDictionary)deviceIdentificationToken
{
  return self->_deviceIdentificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentificationToken, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

@end