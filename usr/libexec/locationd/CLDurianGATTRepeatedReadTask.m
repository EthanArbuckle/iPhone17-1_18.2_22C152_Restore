@interface CLDurianGATTRepeatedReadTask
- (CLDurianGATTRepeatedReadTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5;
- (int64_t)timeoutSeconds;
- (void)appendRecievedData:(id)a3;
@end

@implementation CLDurianGATTRepeatedReadTask

- (CLDurianGATTRepeatedReadTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianGATTRepeatedReadTask;
  return [(CLDurianGATTTask *)&v6 initWithCommand:a3 serviceUUID:a4 characteristicUUID:a5 payload:0];
}

- (void)appendRecievedData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianGATTRepeatedReadTask;
  [(CLDurianGATTTask *)&v3 appendPayloadData:a3];
}

- (int64_t)timeoutSeconds
{
  return 120;
}

@end