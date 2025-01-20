@interface ProviderConfiguration
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)malwareThreatTypeOff;
- (BOOL)providerOff;
- (BOOL)proxyOff;
- (BOOL)socialEngineeringThreatTypeOff;
- (BOOL)unwantedSoftwareThreatTypeOff;
- (NSDictionary)configuration;
- (ProviderConfiguration)init;
- (ProviderConfiguration)initWithConfiguration:(id)a3;
- (void)_configureToBeOff;
- (void)_configureToUseDefaultValues;
- (void)_parseConfiguration:(id)a3;
- (void)setProviderOff:(BOOL)a3;
@end

@implementation ProviderConfiguration

- (ProviderConfiguration)init
{
  return 0;
}

- (ProviderConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProviderConfiguration;
  v5 = [(ProviderConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;

    [(ProviderConfiguration *)v5 _parseConfiguration:v4];
    v8 = v5;
  }

  return v5;
}

- (BOOL)providerOff
{
  if (self->_providerOff) {
    return 1;
  }
  if (self->_socialEngineeringThreatTypeOff && self->_malwareThreatTypeOff) {
    return self->_unwantedSoftwareThreatTypeOff;
  }
  return 0;
}

- (void)_configureToUseDefaultValues
{
  *(_WORD *)&self->_socialEngineeringThreatTypeOff = 0;
  self->_unwantedSoftwareThreatTypeOff = 0;
}

- (void)_configureToBeOff
{
  *(_WORD *)&self->_socialEngineeringThreatTypeOff = 257;
  self->_unwantedSoftwareThreatTypeOff = 1;
}

- (void)_parseConfiguration:(id)a3
{
  id v4 = a3;
  self->_proxyOff = 0;
  id v12 = v4;
  if (v4)
  {
    v5 = [v4 objectForKey:@"Proxy Versions To Turn Off"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = +[ProxyConfiguration currentVersion];
      int v7 = [v5 containsObject:v6];

      if (v7) {
        self->_proxyOff = 1;
      }
    }
    uint64_t isKindOfClass = [v12 objectForKey:@"Regions To Turn Off"];
    v9 = (void *)isKindOfClass;
    if (isKindOfClass && (objc_opt_class(), uint64_t isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0))
    {
      [(ProviderConfiguration *)self _configureToUseDefaultValues];
    }
    else
    {
      objc_super v10 = Backend::Google::SSBUtilities::currentCountryCode((Backend::Google::SSBUtilities *)isKindOfClass);
      if (v10 && (!v9 || ([v9 containsObject:v10] & 1) != 0))
      {
        v11 = [v12 objectForKey:@"Threat Types To Turn Off"];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v11 containsObject:@"Social Engineering"]) {
              self->_socialEngineeringThreatTypeOff = 1;
            }
            if ([v11 containsObject:@"Malware"]) {
              self->_malwareThreatTypeOff = 1;
            }
            if ([v11 containsObject:@"Unwanted Software"]) {
              self->_unwantedSoftwareThreatTypeOff = 1;
            }
          }
          else
          {
            [(ProviderConfiguration *)self _configureToUseDefaultValues];
          }
        }
        else
        {
          [(ProviderConfiguration *)self _configureToBeOff];
        }
      }
      else
      {
        [(ProviderConfiguration *)self _configureToUseDefaultValues];
      }
    }
  }
  else
  {
    [(ProviderConfiguration *)self _configureToUseDefaultValues];
  }
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  configuration = self->_configuration;
  BOOL v6 = !(v4 | (unint64_t)configuration)
    || v4 && [(NSDictionary *)configuration isEqualToDictionary:v4];

  return v6;
}

- (void)setProviderOff:(BOOL)a3
{
  self->_providerOff = a3;
}

- (BOOL)socialEngineeringThreatTypeOff
{
  return self->_socialEngineeringThreatTypeOff;
}

- (BOOL)malwareThreatTypeOff
{
  return self->_malwareThreatTypeOff;
}

- (BOOL)unwantedSoftwareThreatTypeOff
{
  return self->_unwantedSoftwareThreatTypeOff;
}

- (BOOL)proxyOff
{
  return self->_proxyOff;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end