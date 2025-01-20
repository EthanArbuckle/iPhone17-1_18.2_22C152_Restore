@interface CLTrackingAvoidanceAISFetchRecord
- (BOOL)allSuccess;
- (CLTrackingAvoidanceAISFetchRecord)initWithUUID:(id)a3 deviceType:(unint64_t)a4;
- (NSUUID)identifier;
- (OS_dispatch_group)fetchGroup;
- (TAAccessoryInformation)accessoryInfo;
- (id)timoutBlock;
- (void)dealloc;
- (void)setAccessoryInfo:(id)a3;
- (void)setAllSuccess:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setTimoutBlock:(id)a3;
@end

@implementation CLTrackingAvoidanceAISFetchRecord

- (CLTrackingAvoidanceAISFetchRecord)initWithUUID:(id)a3 deviceType:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CLTrackingAvoidanceAISFetchRecord;
  v6 = [(CLTrackingAvoidanceAISFetchRecord *)&v12 init];
  v7 = v6;
  if (v6)
  {
    [(CLTrackingAvoidanceAISFetchRecord *)v6 setIdentifier:a3];
    NSSelectorFromString(&CFSTR("initWithDeviceUUID:deviceType:productData:manufacturerName: modelName:firmwareVersion:accessor"
                                "yCategory:accessoryCapabilities:serialNumber:protocolImplementation:networkID:batteryType:batteryLevel:").isa);
    char v8 = objc_opt_respondsToSelector();
    id v9 = objc_alloc((Class)TAAccessoryInformation);
    if (v8) {
      v10 = (TAAccessoryInformation *)[v9 initWithDeviceUUID:a3 deviceType:a4 productData:0 manufacturerName:0 modelName:0 firmwareVersion:0 accessoryCategory:0 accessoryCapabilities:0 serialNumber:0 protocolImplementation:0 networkID:0 batteryType:0 batteryLevel:0];
    }
    else {
      v10 = (TAAccessoryInformation *)[v9 initWithDeviceUUID:a3 deviceType:a4 productData:0 manufacturerName:0 modelName:0 firmwareVersion:0 accessoryCategory:0 accessoryCapabilities:0];
    }
    v7->_accessoryInfo = v10;
    v7->_fetchGroup = (OS_dispatch_group *)dispatch_group_create();
    v7->_allSuccess = 1;
  }
  return v7;
}

- (void)dealloc
{
  self->_identifier = 0;
  self->_accessoryInfo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLTrackingAvoidanceAISFetchRecord;
  [(CLTrackingAvoidanceAISFetchRecord *)&v3 dealloc];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void)setAccessoryInfo:(id)a3
{
}

- (id)timoutBlock
{
  return self->_timoutBlock;
}

- (void)setTimoutBlock:(id)a3
{
  self->_timoutBlock = a3;
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (BOOL)allSuccess
{
  return self->_allSuccess;
}

- (void)setAllSuccess:(BOOL)a3
{
  self->_allSuccess = a3;
}

@end