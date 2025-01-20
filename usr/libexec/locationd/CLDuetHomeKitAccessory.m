@interface CLDuetHomeKitAccessory
- (CLDuetHomeKitAccessory)initWithHomeUUID:(id)a3 accessoryUUID:(id)a4 accessoryName:(id)a5 serviceName:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 clientName:(id)a9 source:(id)a10 serviceUUID:(id)a11 triggerLocalizationScan:(id)a12 triggerRecordingScan:(id)a13;
- (NSNumber)triggerLocalizationScan;
- (NSNumber)triggerRecordingScan;
- (NSString)accessoryName;
- (NSString)accessoryUUID;
- (NSString)characteristicType;
- (NSString)clientName;
- (NSString)homeUUID;
- (NSString)serviceName;
- (NSString)serviceType;
- (NSString)serviceUUID;
- (NSString)source;
- (void)dealloc;
- (void)setAccessoryName:(id)a3;
- (void)setAccessoryUUID:(id)a3;
- (void)setCharacteristicType:(id)a3;
- (void)setClientName:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setServiceUUID:(id)a3;
- (void)setSource:(id)a3;
- (void)setTriggerLocalizationScan:(id)a3;
- (void)setTriggerRecordingScan:(id)a3;
@end

@implementation CLDuetHomeKitAccessory

- (CLDuetHomeKitAccessory)initWithHomeUUID:(id)a3 accessoryUUID:(id)a4 accessoryName:(id)a5 serviceName:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 clientName:(id)a9 source:(id)a10 serviceUUID:(id)a11 triggerLocalizationScan:(id)a12 triggerRecordingScan:(id)a13
{
  v22.receiver = self;
  v22.super_class = (Class)CLDuetHomeKitAccessory;
  v19 = [(CLDuetHomeKitAccessory *)&v22 init];
  v20 = v19;
  if (v19)
  {
    [(CLDuetHomeKitAccessory *)v19 setHomeUUID:a3];
    [(CLDuetHomeKitAccessory *)v20 setAccessoryUUID:a4];
    [(CLDuetHomeKitAccessory *)v20 setAccessoryName:a5];
    [(CLDuetHomeKitAccessory *)v20 setServiceName:a6];
    [(CLDuetHomeKitAccessory *)v20 setServiceType:a7];
    [(CLDuetHomeKitAccessory *)v20 setCharacteristicType:a8];
    [(CLDuetHomeKitAccessory *)v20 setClientName:a9];
    [(CLDuetHomeKitAccessory *)v20 setSource:a10];
    [(CLDuetHomeKitAccessory *)v20 setServiceUUID:a11];
    [(CLDuetHomeKitAccessory *)v20 setTriggerLocalizationScan:a12];
    [(CLDuetHomeKitAccessory *)v20 setTriggerRecordingScan:a13];
  }
  return v20;
}

- (void)dealloc
{
  [(CLDuetHomeKitAccessory *)self setHomeUUID:0];
  [(CLDuetHomeKitAccessory *)self setAccessoryUUID:0];
  [(CLDuetHomeKitAccessory *)self setAccessoryName:0];
  [(CLDuetHomeKitAccessory *)self setServiceName:0];
  [(CLDuetHomeKitAccessory *)self setServiceType:0];
  [(CLDuetHomeKitAccessory *)self setCharacteristicType:0];
  [(CLDuetHomeKitAccessory *)self setClientName:0];
  [(CLDuetHomeKitAccessory *)self setSource:0];
  [(CLDuetHomeKitAccessory *)self setServiceUUID:0];
  [(CLDuetHomeKitAccessory *)self setTriggerLocalizationScan:0];
  [(CLDuetHomeKitAccessory *)self setTriggerRecordingScan:0];
  v3.receiver = self;
  v3.super_class = (Class)CLDuetHomeKitAccessory;
  [(CLDuetHomeKitAccessory *)&v3 dealloc];
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSString)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void)setCharacteristicType:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
}

- (NSNumber)triggerLocalizationScan
{
  return self->_triggerLocalizationScan;
}

- (void)setTriggerLocalizationScan:(id)a3
{
}

- (NSNumber)triggerRecordingScan
{
  return self->_triggerRecordingScan;
}

- (void)setTriggerRecordingScan:(id)a3
{
}

@end