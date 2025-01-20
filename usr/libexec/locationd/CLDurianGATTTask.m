@interface CLDurianGATTTask
- (BOOL)doneSendingPayload;
- (CBCharacteristic)characteristic;
- (CBUUID)characteristicUUID;
- (CBUUID)serviceUUID;
- (CLDurianGATTTask)init;
- (CLDurianGATTTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5 payload:(id)a6;
- (NSData)characteristicPayload;
- (id)nextPacketOfMaxSize:(unint64_t)a3;
- (void)appendPayloadData:(id)a3;
- (void)dealloc;
- (void)setCharacteristic:(id)a3;
- (void)setPayloadData:(id)a3;
@end

@implementation CLDurianGATTTask

- (CLDurianGATTTask)init
{
  return 0;
}

- (CLDurianGATTTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5 payload:(id)a6
{
  if ([a3 opcode] == 219) {
    uint64_t v11 = -7;
  }
  else {
    uint64_t v11 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)CLDurianGATTTask;
  v12 = [(CLDurianTask *)&v15 initWithCommand:a3 desiredLatency:v11 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
  if (v12)
  {
    v12->_serviceUUID = (CBUUID *)a4;
    v12->_characteristicUUID = (CBUUID *)a5;
    if (a6) {
      v13 = (NSMutableData *)[a6 mutableCopy];
    }
    else {
      v13 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    }
    v12->_payload = v13;
  }
  return v12;
}

- (NSData)characteristicPayload
{
  return &self->_payload->super;
}

- (void)appendPayloadData:(id)a3
{
  if ([a3 length])
  {
    payload = self->_payload;
    [(NSMutableData *)payload appendData:a3];
  }
}

- (void)setPayloadData:(id)a3
{
  self->_payload = (NSMutableData *)[a3 copy];
}

- (id)nextPacketOfMaxSize:(unint64_t)a3
{
  char v14 = 0;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v6 = [(NSMutableData *)self->_payload length];
    *(_DWORD *)buf = 68289539;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2049;
    NSUInteger v20 = v6;
    __int16 v21 = 2049;
    unint64_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate nextPacketOfMaxSize \", \"PayloadBytesLeftToSend\":%{private}lu, \"maxPacketSize\":%{private}lu}", buf, 0x26u);
  }
  unint64_t v7 = a3 - 1;
  if ([(NSMutableData *)self->_payload length] <= v7)
  {
    unint64_t v7 = [(NSMutableData *)self->_payload length];
    char v14 = 1;
  }
  id v8 = [objc_alloc((Class)NSMutableData) initWithBytes:&v14 length:1];
  [v8 appendData:[self->_payload subdataWithRange:0, v7]];
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_payload, "replaceBytesInRange:withBytes:length:", 0, v7, 0, 0);
  id v9 = [objc_alloc((Class)NSData) initWithData:v8];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 length];
    *(_DWORD *)buf = 68289795;
    int v16 = 0;
    if (v14) {
      v12 = "LAST fragment";
    }
    else {
      v12 = "fragment";
    }
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2049;
    NSUInteger v20 = (NSUInteger)v11;
    __int16 v21 = 2113;
    unint64_t v22 = (unint64_t)v9;
    __int16 v23 = 2081;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate nextPacketOfMaxSize \", \"packetLength\":%{private}lu, \"packetToSend\":%{private, location:escape_only}@, \"Sending\":%{private, location:escape_only}s}", buf, 0x30u);
  }
  return v9;
}

- (BOOL)doneSendingPayload
{
  return [(NSMutableData *)self->_payload length] == 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianGATTTask;
  [(CLDurianTask *)&v3 dealloc];
}

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (CBUUID)characteristicUUID
{
  return self->_characteristicUUID;
}

- (CBCharacteristic)characteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCharacteristic:(id)a3
{
}

@end