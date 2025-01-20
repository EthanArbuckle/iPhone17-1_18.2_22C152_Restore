@interface CDStoreAuthenticationDidFinishAuthRequest
- (AMSDelegateAuthenticateResult)authenticationResult;
- (CDStoreAuthenticationDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setAuthenticationResult:(id)a3;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setError:(id)a3;
@end

@implementation CDStoreAuthenticationDidFinishAuthRequest

- (CDStoreAuthenticationDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDStoreAuthenticationDidFinishAuthRequest;
  v5 = [(CDStoreAuthenticationDidFinishAuthRequest *)&v18 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"storeAuthenticationResult", (uint64_t)v6);
    authenticationResult = v5->_authenticationResult;
    v5->_authenticationResult = (AMSDelegateAuthenticateResult *)v7;

    v9 = self;
    uint64_t v10 = sub_10001CD14(v4, @"authError", (uint64_t)v9);
    error = v5->_error;
    v5->_error = (NSError *)v10;

    v12 = NSDictionaryGetNSNumber();
    v5->_deviceFlags = (unint64_t)[v12 unsignedIntegerValue];

    CFStringGetTypeID();
    v13 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v13;

    CFStringGetTypeID();
    v15 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = v15;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = sub_10001D014((uint64_t)self->_authenticationResult);
  [v3 setObject:v4 forKeyedSubscript:@"storeAuthenticationResult"];

  v5 = sub_10001D014((uint64_t)self->_error);
  [v3 setObject:v5 forKeyedSubscript:@"authError"];

  v6 = +[NSNumber numberWithUnsignedInteger:self->_deviceFlags];
  [v3 setObject:v6 forKeyedSubscript:@"deviceFlags"];

  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v7 = [v3 copy];

  return v7;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_authenticationResult withName:@"authenticationResult" skipIfNil:1];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  v6 = CUPrintFlags64();
  [v3 appendString:v6 withName:@"deviceFlags"];

  [v3 appendString:self->_deviceModel withName:@"deviceModel" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (AMSDelegateAuthenticateResult)authenticationResult
{
  return self->_authenticationResult;
}

- (void)setAuthenticationResult:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_deviceFlags = a3;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
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
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_authenticationResult, 0);
}

@end