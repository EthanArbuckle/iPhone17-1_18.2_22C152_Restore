@interface CLDurianGATTWriteTask
- (CLDurianGATTWriteTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5 payload:(id)a6;
- (int64_t)timeoutSeconds;
@end

@implementation CLDurianGATTWriteTask

- (CLDurianGATTWriteTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5 payload:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CLDurianGATTWriteTask;
  return [(CLDurianGATTTask *)&v7 initWithCommand:a3 serviceUUID:a4 characteristicUUID:a5 payload:a6];
}

- (int64_t)timeoutSeconds
{
  unsigned int v2 = [(CLDurianCommand *)[(CLDurianTask *)self command] opcode] - 2049;
  if (v2 > 0xC) {
    return 60;
  }
  else {
    return qword_101E313C8[(__int16)v2];
  }
}

@end