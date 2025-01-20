@interface CDLearnMoreDidFinishRequest
- (CDLearnMoreDidFinishRequest)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation CDLearnMoreDidFinishRequest

- (CDLearnMoreDidFinishRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDLearnMoreDidFinishRequest;
  v5 = [(CDLearnMoreDidFinishRequest *)&v12 init];
  if (v5)
  {
    v6 = NSDictionaryGetNSNumber();
    v5->_deviceFlags = (unint64_t)[v6 unsignedIntegerValue];

    CFStringGetTypeID();
    v7 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v7;

    CFStringGetTypeID();
    v9 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = v9;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedInteger:self->_deviceFlags];
  [v3 setObject:v4 forKeyedSubscript:@"deviceFlags"];

  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = CUPrintFlags64();
  [v3 appendString:v4 withName:@"deviceFlags"];

  [v3 appendString:self->_deviceModel withName:@"deviceModel" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v5 = [v3 build];

  return (NSString *)v5;
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
}

@end