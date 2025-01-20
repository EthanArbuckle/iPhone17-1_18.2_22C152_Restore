@interface APQueue
- (APQueue)init;
- (APUnfairLock)lock;
- (NSMutableArray)container;
- (id)dequeue;
- (void)enqueue:(id)a3;
- (void)setContainer:(id)a3;
- (void)setLock:(id)a3;
@end

@implementation APQueue

- (APQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)APQueue;
  v2 = [(APQueue *)&v8 init];
  if (v2)
  {
    v3 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = +[NSMutableArray array];
    container = v2->_container;
    v2->_container = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)enqueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APQueue *)self lock];
  [v5 lock];

  v6 = [(APQueue *)self container];
  [v6 addObject:v4];

  id v7 = [(APQueue *)self lock];
  [v7 unlock];
}

- (id)dequeue
{
  v3 = [(APQueue *)self lock];
  [v3 lock];

  id v4 = [(APQueue *)self container];
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [(APQueue *)self container];
    [v6 removeObjectAtIndex:0];
  }
  id v7 = [(APQueue *)self lock];
  [v7 unlock];

  return v5;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMutableArray)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end