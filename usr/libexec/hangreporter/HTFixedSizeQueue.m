@interface HTFixedSizeQueue
- (HTFixedSizeQueue)initWithSize:(unint64_t)a3;
- (NSDateFormatter)dateFormatter;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (id)getDescription:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)insert:(id)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation HTFixedSizeQueue

- (HTFixedSizeQueue)initWithSize:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HTFixedSizeQueue;
  id v4 = [(HTFixedSizeQueue *)&v13 init];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    v7 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 2) = a3;
    *((void *)v4 + 3) = 0;

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v9 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v8;

    dispatch_source_set_event_handler_f(*((dispatch_source_t *)v4 + 4), (dispatch_function_t)sub_10001CD74);
    dispatch_activate(*((dispatch_object_t *)v4 + 4));
    uint64_t v10 = objc_opt_new();
    v11 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v10;

    [*((id *)v4 + 5) setDateFormat:@"yyyy-MM-dd-HH:mm:ss.SSS"];
  }
  return (HTFixedSizeQueue *)v4;
}

- (void)insert:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ((unint64_t)[(NSMutableArray *)self->array count] >= self->_maxSize) {
      [(NSMutableArray *)self->array removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->array addObject:v5];
    id v4 = v5;
  }
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->array count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->array objectAtIndex:a3];
}

- (void)removeObjectsAtIndexes:(id)a3
{
}

- (id)getDescription:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->array objectAtIndex:a3];
  v9[0] = @"processName";
  id v4 = [v3 processName];
  v10[0] = v4;
  v9[1] = @"processID";
  id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 pid]);
  v10[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v6 description];

  return v7;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimer:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->array, 0);
}

@end