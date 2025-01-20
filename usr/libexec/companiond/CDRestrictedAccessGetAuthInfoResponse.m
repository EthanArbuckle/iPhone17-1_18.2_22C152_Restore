@interface CDRestrictedAccessGetAuthInfoResponse
- (CDRestrictedAccessGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)currentUserName;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (int64_t)restrictionType;
- (void)setCurrentUserName:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setRestrictionType:(int64_t)a3;
@end

@implementation CDRestrictedAccessGetAuthInfoResponse

- (CDRestrictedAccessGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDRestrictedAccessGetAuthInfoResponse;
  v5 = [(CDRestrictedAccessGetAuthInfoResponse *)&v14 init];
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

    CFStringGetTypeID();
    v10 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    currentUserName = v5->_currentUserName;
    v5->_currentUserName = v10;

    v12 = NSDictionaryGetNSNumber();
    v5->_restrictionType = (int64_t)[v12 integerValue];
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  [v3 setObject:self->_currentUserName forKeyedSubscript:@"currentUserName"];
  id v4 = +[NSNumber numberWithInteger:self->_restrictionType];
  [v3 setObject:v4 forKeyedSubscript:@"restrictionType"];

  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  [v3 appendString:self->_currentUserName withName:@"currentUserName" skipIfEmpty:1];
  id v4 = [v3 appendInteger:self->_restrictionType withName:@"restrictionType"];
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

- (NSString)currentUserName
{
  return self->_currentUserName;
}

- (void)setCurrentUserName:(id)a3
{
}

- (int64_t)restrictionType
{
  return self->_restrictionType;
}

- (void)setRestrictionType:(int64_t)a3
{
  self->_restrictionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end