@interface CDStoreAuthenticationGetAuthInfoResponse
- (AMSDelegateAuthenticateRequest)authenticationRequest;
- (CDStoreAuthenticationGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (void)setAuthenticationRequest:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation CDStoreAuthenticationGetAuthInfoResponse

- (CDStoreAuthenticationGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDStoreAuthenticationGetAuthInfoResponse;
  v5 = [(CDStoreAuthenticationGetAuthInfoResponse *)&v14 init];
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
    uint64_t v11 = sub_10001CD14(v4, @"storeAuthenticationRequest", (uint64_t)v10);
    authenticationRequest = v5->_authenticationRequest;
    v5->_authenticationRequest = (AMSDelegateAuthenticateRequest *)v11;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v4 = sub_10001D014((uint64_t)self->_authenticationRequest);
  [v3 setObject:v4 forKeyedSubscript:@"storeAuthenticationRequest"];

  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v4 = [v3 appendObject:self->_authenticationRequest withName:@"authenticationRequest" skipIfNil:1];
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

- (AMSDelegateAuthenticateRequest)authenticationRequest
{
  return self->_authenticationRequest;
}

- (void)setAuthenticationRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationRequest, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end