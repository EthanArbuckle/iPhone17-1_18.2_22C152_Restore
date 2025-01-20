@interface SKMultiSerialQueue
- (NSMutableArray)queues;
- (SKMultiSerialQueue)initWithName:(id)a3;
- (unsigned)counter;
- (void)dispatchWithBlock:(id)a3;
- (void)dispatchWithGroup:(id)a3 block:(id)a4;
- (void)setCounter:(unsigned int)a3;
- (void)setQueues:(id)a3;
@end

@implementation SKMultiSerialQueue

- (SKMultiSerialQueue)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKMultiSerialQueue;
  v5 = [(SKMultiSerialQueue *)&v11 init];
  if (v5)
  {
    if (qword_100055AD0 != -1) {
      dispatch_once(&qword_100055AD0, &stru_1000490E8);
    }
    int v6 = dword_100055AD8;
    v7 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:dword_100055AD8];
    queues = v5->_queues;
    v5->_queues = v7;

    for (; v6; --v6)
    {
      dispatch_queue_t v9 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
      [(NSMutableArray *)v5->_queues addObject:v9];
    }
    v5->_counter = 0;
  }

  return v5;
}

- (void)dispatchWithBlock:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(SKMultiSerialQueue *)v4 queues];
  int v6 = [v5 objectAtIndexedSubscript:-[SKMultiSerialQueue counter](v4, "counter")];
  dispatch_async(v6, block);

  LODWORD(v6) = [(SKMultiSerialQueue *)v4 counter];
  v7 = [(SKMultiSerialQueue *)v4 queues];
  -[SKMultiSerialQueue setCounter:](v4, "setCounter:", (v6 + 1) % (unint64_t)[v7 count]);

  objc_sync_exit(v4);
}

- (void)dispatchWithGroup:(id)a3 block:(id)a4
{
  group = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(SKMultiSerialQueue *)v7 queues];
  dispatch_queue_t v9 = [v8 objectAtIndexedSubscript:-[SKMultiSerialQueue counter](v7, "counter")];
  dispatch_group_async(group, v9, v6);

  LODWORD(v9) = [(SKMultiSerialQueue *)v7 counter];
  v10 = [(SKMultiSerialQueue *)v7 queues];
  -[SKMultiSerialQueue setCounter:](v7, "setCounter:", (v9 + 1) % (unint64_t)[v10 count]);

  objc_sync_exit(v7);
}

- (NSMutableArray)queues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueues:(id)a3
{
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
}

@end