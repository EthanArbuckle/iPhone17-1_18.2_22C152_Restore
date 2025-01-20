@interface HAPCharacteristicWriteRequestTuple
+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8;
+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8 contextData:(id)a9;
- (BOOL)includeResponseValue;
- (BOOL)timedWrite;
- (HAPCharacteristic)characteristic;
- (NSData)authorizationData;
- (NSData)contextData;
- (NSNumber)enableEvents;
- (id)value;
- (unint64_t)writeType;
- (void)setAuthorizationData:(id)a3;
- (void)setCharacteristic:(id)a3;
- (void)setContextData:(id)a3;
- (void)setEnableEvents:(id)a3;
- (void)setIncludeResponseValue:(BOOL)a3;
- (void)setTimedWrite:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setWriteType:(unint64_t)a3;
@end

@implementation HAPCharacteristicWriteRequestTuple

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8
{
  return [a1 writeRequestTupleForCharacteristic:a3 value:a4 authorizationData:a5 timedWrite:a6 responseValue:a7 type:a8 contextData:0];
}

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8 contextData:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  v18 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  v19 = v18;
  if (v18)
  {
    [(HAPCharacteristicWriteRequestTuple *)v18 setCharacteristic:v14];
    [(HAPCharacteristicWriteRequestTuple *)v19 setValue:v15];
    [(HAPCharacteristicWriteRequestTuple *)v19 setAuthorizationData:v16];
    [(HAPCharacteristicWriteRequestTuple *)v19 setTimedWrite:v11];
    [(HAPCharacteristicWriteRequestTuple *)v19 setIncludeResponseValue:v10];
    [(HAPCharacteristicWriteRequestTuple *)v19 setWriteType:a8];
    [(HAPCharacteristicWriteRequestTuple *)v19 setContextData:v17];
  }

  return v19;
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

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (void)setAuthorizationData:(id)a3
{
}

- (BOOL)timedWrite
{
  return self->_timedWrite;
}

- (void)setTimedWrite:(BOOL)a3
{
  self->_timedWrite = a3;
}

- (unint64_t)writeType
{
  return self->_writeType;
}

- (void)setWriteType:(unint64_t)a3
{
  self->_writeType = a3;
}

- (BOOL)includeResponseValue
{
  return self->_includeResponseValue;
}

- (void)setIncludeResponseValue:(BOOL)a3
{
  self->_includeResponseValue = a3;
}

- (NSNumber)enableEvents
{
  return self->_enableEvents;
}

- (void)setEnableEvents:(id)a3
{
}

- (NSData)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_enableEvents, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end