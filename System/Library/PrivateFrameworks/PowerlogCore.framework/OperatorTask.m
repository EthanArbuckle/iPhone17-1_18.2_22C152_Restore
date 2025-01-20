@interface OperatorTask
- (OS_dispatch_queue)operatorQueue;
- (OperatorTask)initWithQueue:(id)a3 withBlock:(id)a4;
- (id)operatorBlock;
- (void)setOperatorBlock:(id)a3;
- (void)setOperatorQueue:(id)a3;
@end

@implementation OperatorTask

- (OperatorTask)initWithQueue:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OperatorTask;
  v9 = [(OperatorTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operatorQueue, a3);
    uint64_t v11 = MEMORY[0x1C1869370](v8);
    id operatorBlock = v10->_operatorBlock;
    v10->_id operatorBlock = (id)v11;
  }
  return v10;
}

- (OS_dispatch_queue)operatorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperatorQueue:(id)a3
{
}

- (id)operatorBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOperatorBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_operatorQueue, 0);
}

@end