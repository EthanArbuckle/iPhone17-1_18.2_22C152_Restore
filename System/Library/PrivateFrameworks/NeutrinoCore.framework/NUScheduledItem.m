@interface NUScheduledItem
- (NUScheduledItem)initWithScheduledTime:(unint64_t)a3 queue:(id)a4 block:(id)a5;
- (OS_dispatch_queue)queue;
- (id)block;
- (int64_t)compare:(id)a3;
- (unint64_t)scheduledTime;
- (void)dispatch;
@end

@implementation NUScheduledItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)block
{
  return objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)scheduledTime
{
  return self->_scheduledTime;
}

- (void)dispatch
{
}

- (int64_t)compare:(id)a3
{
  unint64_t v4 = [a3 scheduledTime];
  unint64_t v5 = [(NUScheduledItem *)self scheduledTime];
  if (v4 <= v5) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = -1;
  }
  if (v4 < v5) {
    return 1;
  }
  else {
    return v6;
  }
}

- (NUScheduledItem)initWithScheduledTime:(unint64_t)a3 queue:(id)a4 block:(id)a5
{
  v8 = (OS_dispatch_queue *)a4;
  v16.receiver = self;
  v16.super_class = (Class)NUScheduledItem;
  id v9 = a5;
  v10 = [(NUScheduledItem *)&v16 init];
  queue = v10->_queue;
  v10->_scheduledTime = a3;
  v10->_queue = v8;
  v12 = v8;

  uint64_t v13 = MEMORY[0x1AD0FAD00](v9);
  id block = v10->_block;
  v10->_id block = (id)v13;

  return v10;
}

@end