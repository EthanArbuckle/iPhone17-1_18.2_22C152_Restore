@interface CDRestrictedAccesssDidFinishAuthRequest
- (BOOL)isApproved;
- (CDRestrictedAccesssDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setApproved:(BOOL)a3;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setError:(id)a3;
@end

@implementation CDRestrictedAccesssDidFinishAuthRequest

- (CDRestrictedAccesssDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDRestrictedAccesssDidFinishAuthRequest;
  v5 = [(CDRestrictedAccesssDidFinishAuthRequest *)&v15 init];
  if (v5)
  {
    v5->_approved = CFDictionaryGetInt64() != 0;
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"authError", (uint64_t)v6);
    error = v5->_error;
    v5->_error = (NSError *)v7;

    v9 = NSDictionaryGetNSNumber();
    v5->_deviceFlags = (unint64_t)[v9 unsignedIntegerValue];

    CFStringGetTypeID();
    v10 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v10;

    CFStringGetTypeID();
    v12 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = v12;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithBool:self->_approved];
  [v3 setObject:v4 forKeyedSubscript:@"authResponse"];

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
  id v4 = [v3 appendBool:self->_approved withName:@"approved"];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (BOOL)isApproved
{
  return self->_approved;
}

- (void)setApproved:(BOOL)a3
{
  self->_approved = a3;
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
}

@end