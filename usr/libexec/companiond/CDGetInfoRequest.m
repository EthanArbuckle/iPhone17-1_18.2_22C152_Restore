@interface CDGetInfoRequest
- (CDGetInfoRequest)initWithRapportDictionary:(id)a3;
- (NSData)appleAccountToken;
- (NSData)storeAccountToken;
- (NSString)description;
- (NSString)deviceBuildVersion;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)nonce;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setAppleAccountToken:(id)a3;
- (void)setDeviceBuildVersion:(id)a3;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setNonce:(id)a3;
- (void)setStoreAccountToken:(id)a3;
@end

@implementation CDGetInfoRequest

- (CDGetInfoRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDGetInfoRequest;
  v5 = [(CDGetInfoRequest *)&v20 init];
  if (v5)
  {
    CFDataGetTypeID();
    v6 = (NSData *)[(id)CFDictionaryGetTypedValue() copy];
    storeAccountToken = v5->_storeAccountToken;
    v5->_storeAccountToken = v6;

    CFDataGetTypeID();
    v8 = (NSData *)[(id)CFDictionaryGetTypedValue() copy];
    appleAccountToken = v5->_appleAccountToken;
    v5->_appleAccountToken = v8;

    CFStringGetTypeID();
    v10 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    nonce = v5->_nonce;
    v5->_nonce = v10;

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

    CFStringGetTypeID();
    v17 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceBuildVersion = v5->_deviceBuildVersion;
    v5->_deviceBuildVersion = v17;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_storeAccountToken forKeyedSubscript:@"storeAccountToken"];
  [v3 setObject:self->_appleAccountToken forKeyedSubscript:@"appleAccountToken"];
  [v3 setObject:self->_nonce forKeyedSubscript:@"nonce"];
  id v4 = +[NSNumber numberWithUnsignedInteger:self->_deviceFlags];
  [v3 setObject:v4 forKeyedSubscript:@"deviceFlags"];

  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  [v3 setObject:self->_deviceBuildVersion forKeyedSubscript:@"deviceBuildVersion"];
  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_storeAccountToken withName:@"storeAccountToken" skipIfNil:1];
  id v5 = [v3 appendObject:self->_appleAccountToken withName:@"appleAccountToken" skipIfNil:1];
  [v3 appendString:self->_nonce withName:@"nonce" skipIfEmpty:1];
  v6 = CUPrintFlags64();
  [v3 appendString:v6 withName:@"deviceFlags"];

  [v3 appendString:self->_deviceModel withName:@"deviceModel" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  [v3 appendString:self->_deviceBuildVersion withName:@"deviceBuildVersion" skipIfEmpty:1];
  v7 = [v3 build];

  return (NSString *)v7;
}

- (NSData)storeAccountToken
{
  return self->_storeAccountToken;
}

- (void)setStoreAccountToken:(id)a3
{
}

- (NSData)appleAccountToken
{
  return self->_appleAccountToken;
}

- (void)setAppleAccountToken:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
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

- (NSString)deviceBuildVersion
{
  return self->_deviceBuildVersion;
}

- (void)setDeviceBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceBuildVersion, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_appleAccountToken, 0);

  objc_storeStrong((id *)&self->_storeAccountToken, 0);
}

@end