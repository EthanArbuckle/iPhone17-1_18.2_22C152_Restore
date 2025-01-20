@interface CDSystemAuthenticationGetAuthInfoResponse
- (CDSystemAuthenticationGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation CDSystemAuthenticationGetAuthInfoResponse

- (CDSystemAuthenticationGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDSystemAuthenticationGetAuthInfoResponse;
  v5 = [(CDSystemAuthenticationGetAuthInfoResponse *)&v11 init];
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
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v4 = [v3 copy];

  return v4;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v4 = [v3 build];

  return (NSString *)v4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end