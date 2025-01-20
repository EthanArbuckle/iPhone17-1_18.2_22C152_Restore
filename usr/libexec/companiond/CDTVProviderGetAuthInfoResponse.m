@interface CDTVProviderGetAuthInfoResponse
- (CDTVProviderGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (NSString)providerName;
- (NSURL)providerURL;
- (id)makeRapportDictionary;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setProviderURL:(id)a3;
@end

@implementation CDTVProviderGetAuthInfoResponse

- (CDTVProviderGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CDTVProviderGetAuthInfoResponse;
  v5 = [(CDTVProviderGetAuthInfoResponse *)&v16 init];
  if (v5)
  {
    CFStringGetTypeID();
    v6 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v6;

    CFStringGetTypeID();
    v8 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = v8;

    v10 = self;
    uint64_t v11 = sub_10001CD14(v4, @"tvProviderURL", (uint64_t)v10);
    providerURL = v5->_providerURL;
    v5->_providerURL = (NSURL *)v11;

    CFStringGetTypeID();
    v13 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    providerName = v5->_providerName;
    v5->_providerName = v13;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v4 = sub_10001D014((uint64_t)self->_providerURL);
  [v3 setObject:v4 forKeyedSubscript:@"tvProviderURL"];

  [v3 setObject:self->_providerName forKeyedSubscript:@"tvProviderName"];
  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v4 = [v3 appendObject:self->_providerURL withName:@"providerURL"];
  [v3 appendString:self->_providerName withName:@"providerName"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (void)setProviderURL:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end