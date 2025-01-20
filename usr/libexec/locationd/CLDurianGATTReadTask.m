@interface CLDurianGATTReadTask
- (CLDurianGATTReadTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5;
- (void)setReadData:(id)a3;
@end

@implementation CLDurianGATTReadTask

- (CLDurianGATTReadTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianGATTReadTask;
  return [(CLDurianGATTTask *)&v6 initWithCommand:a3 serviceUUID:a4 characteristicUUID:a5 payload:0];
}

- (void)setReadData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianGATTReadTask;
  [(CLDurianGATTTask *)&v3 setPayloadData:a3];
}

@end