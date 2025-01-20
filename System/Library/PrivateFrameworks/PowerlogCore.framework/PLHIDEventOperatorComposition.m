@interface PLHIDEventOperatorComposition
- (PLHIDEventOperatorComposition)initWithOperator:(id)a3 forUsagePage:(unint64_t)a4 andUsage:(unint64_t)a5 withBlock:(id)a6;
- (PLOperator)operator;
- (__IOHIDEventSystemClient)eventSystemClient;
- (id)operatorBlock;
- (void)handleEvent:(__IOHIDEvent *)a3;
- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)setOperator:(id)a3;
- (void)setOperatorBlock:(id)a3;
@end

@implementation PLHIDEventOperatorComposition

- (PLHIDEventOperatorComposition)initWithOperator:(id)a3 forUsagePage:(unint64_t)a4 andUsage:(unint64_t)a5 withBlock:(id)a6
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PLHIDEventOperatorComposition;
  v12 = [(PLHIDEventOperatorComposition *)&v21 init];
  v13 = v12;
  if (v12)
  {
    if (!v12->_eventSystemClient) {
      v12->_eventSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    }
    uint64_t v14 = MEMORY[0x1C1869370](v11);
    id operatorBlock = v13->_operatorBlock;
    v13->_id operatorBlock = (id)v14;

    v16 = [v10 workQueue];
    IOHIDEventSystemClientScheduleWithDispatchQueue();

    v22[0] = @"DeviceUsagePage";
    v17 = [NSNumber numberWithUnsignedInteger:a4];
    v22[1] = @"DeviceUsage";
    v23[0] = v17;
    v18 = [NSNumber numberWithUnsignedInteger:a5];
    v23[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

    IOHIDEventSystemClientSetMatching();
    IOHIDEventSystemClientRegisterEventBlock();
  }
  return v13;
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  id operatorBlock = (void (**)(id, __IOHIDEvent *))self->_operatorBlock;
  if (operatorBlock) {
    operatorBlock[2](operatorBlock, a3);
  }
}

- (__IOHIDEventSystemClient)eventSystemClient
{
  return self->_eventSystemClient;
}

- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_eventSystemClient = a3;
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (void)setOperatorBlock:(id)a3
{
}

- (PLOperator)operator
{
  return (PLOperator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOperator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong(&self->_operatorBlock, 0);
}

@end