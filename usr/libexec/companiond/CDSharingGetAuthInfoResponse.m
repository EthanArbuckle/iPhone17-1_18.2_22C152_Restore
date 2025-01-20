@interface CDSharingGetAuthInfoResponse
- (CDSharingGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSData)requestData;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setRequestData:(id)a3;
@end

@implementation CDSharingGetAuthInfoResponse

- (CDSharingGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDSharingGetAuthInfoResponse;
  v5 = [(CDSharingGetAuthInfoResponse *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"sharingData"];
    requestData = v5->_requestData;
    v5->_requestData = (NSData *)v6;

    CFStringGetTypeID();
    v8 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v8;

    CFStringGetTypeID();
    v10 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = v10;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_requestData forKeyedSubscript:@"sharingData"];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v4 = [v3 copy];

  return v4;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_requestData withName:@"requestData" skipIfNil:1];
  id v5 = [v3 appendObject:self->_deviceClass withName:@"deviceClass" skipIfNil:1];
  id v6 = [v3 appendObject:self->_deviceName withName:@"deviceName" skipIfNil:1];
  v7 = [v3 build];

  return (NSString *)v7;
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

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end