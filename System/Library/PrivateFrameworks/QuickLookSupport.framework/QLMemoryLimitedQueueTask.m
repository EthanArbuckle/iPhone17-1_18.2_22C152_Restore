@interface QLMemoryLimitedQueueTask
- (QLMemoryLimitedQueueTask)initWithBlock:(id)a3 expectedMemoryConsumption:(unint64_t)a4;
- (id)block;
- (unint64_t)expectedMemoryConsumption;
@end

@implementation QLMemoryLimitedQueueTask

- (QLMemoryLimitedQueueTask)initWithBlock:(id)a3 expectedMemoryConsumption:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLMemoryLimitedQueueTask;
  v7 = [(QLMemoryLimitedQueueTask *)&v11 init];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x21D45D660](v6);
    id block = v7->_block;
    v7->_id block = (id)v8;

    v7->_expectedMemoryConsumption = a4;
  }

  return v7;
}

- (unint64_t)expectedMemoryConsumption
{
  return self->_expectedMemoryConsumption;
}

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end