@interface HAPCharacteristicConfigurationRequestTuple
+ (id)configurationTupleForCharacteristic:(id)a3 broadcastEnable:(BOOL)a4 broadcastInterval:(unint64_t)a5;
- (BOOL)broadcastEnable;
- (HAPCharacteristic)characteristic;
- (unint64_t)broadcastInterval;
- (void)setBroadcastEnable:(BOOL)a3;
- (void)setBroadcastInterval:(unint64_t)a3;
- (void)setCharacteristic:(id)a3;
@end

@implementation HAPCharacteristicConfigurationRequestTuple

+ (id)configurationTupleForCharacteristic:(id)a3 broadcastEnable:(BOOL)a4 broadcastInterval:(unint64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(HAPCharacteristicConfigurationRequestTuple);
  v9 = v8;
  if (v8)
  {
    [(HAPCharacteristicConfigurationRequestTuple *)v8 setCharacteristic:v7];
    [(HAPCharacteristicConfigurationRequestTuple *)v9 setBroadcastEnable:v6];
    [(HAPCharacteristicConfigurationRequestTuple *)v9 setBroadcastInterval:a5];
  }

  return v9;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
}

- (BOOL)broadcastEnable
{
  return self->_broadcastEnable;
}

- (void)setBroadcastEnable:(BOOL)a3
{
  self->_broadcastEnable = a3;
}

- (unint64_t)broadcastInterval
{
  return self->_broadcastInterval;
}

- (void)setBroadcastInterval:(unint64_t)a3
{
  self->_broadcastInterval = a3;
}

- (void).cxx_destruct
{
}

@end