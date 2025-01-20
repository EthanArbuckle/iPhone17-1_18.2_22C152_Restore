@interface HAPCharacteristicResponseTuple
+ (id)responseTupleForCharacteristic:(id)a3 error:(id)a4;
- (HAPCharacteristic)characteristic;
- (NSData)notificationContext;
- (NSDate)valueUpdatedTime;
- (NSError)error;
- (NSNumber)stateNumber;
- (id)value;
- (void)setCharacteristic:(id)a3;
- (void)setError:(id)a3;
- (void)setNotificationContext:(id)a3;
- (void)setStateNumber:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueUpdatedTime:(id)a3;
@end

@implementation HAPCharacteristicResponseTuple

+ (id)responseTupleForCharacteristic:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(HAPCharacteristicResponseTuple);
  v8 = v7;
  if (v7)
  {
    [(HAPCharacteristicResponseTuple *)v7 setCharacteristic:v5];
    v9 = [v5 value];
    [(HAPCharacteristicResponseTuple *)v8 setValue:v9];

    v10 = [v5 valueUpdatedTime];
    [(HAPCharacteristicResponseTuple *)v8 setValueUpdatedTime:v10];

    v11 = [v5 stateNumber];
    [(HAPCharacteristicResponseTuple *)v8 setStateNumber:v11];

    v12 = [v5 notificationContext];
    [(HAPCharacteristicResponseTuple *)v8 setNotificationContext:v12];

    [(HAPCharacteristicResponseTuple *)v8 setError:v6];
  }

  return v8;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void)setStateNumber:(id)a3
{
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (void)setValueUpdatedTime:(id)a3
{
}

- (NSData)notificationContext
{
  return self->_notificationContext;
}

- (void)setNotificationContext:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end