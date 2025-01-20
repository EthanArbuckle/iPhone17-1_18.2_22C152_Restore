@interface CRLProgress
- (BOOL)isIndeterminate;
- (BOOL)protected_hasProgressObservers;
- (NSString)message;
- (double)maxValue;
- (double)protected_minProgressObserverValueInterval;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (id)initForSubclass;
- (void)protected_progressDidChange;
- (void)removeProgressObserver:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation CRLProgress

- (id)initForSubclass
{
  v12.receiver = self;
  v12.super_class = (Class)CRLProgress;
  v2 = [(CRLProgress *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    progressObservers = v2->_progressObservers;
    v2->_progressObservers = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.freeform.CRLProgressObservers", v5);
    progressObserversQueue = v2->_progressObserversQueue;
    v2->_progressObserversQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.freeform.CRLProgressObserverValue", v8);
    progressObserversValueQueue = v2->_progressObserversValueQueue;
    v2->_progressObserversValueQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (double)value
{
  return NAN;
}

- (double)maxValue
{
  return NAN;
}

- (BOOL)isIndeterminate
{
  return 1;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v5 = 0;
  if (a4 && a5)
  {
    id v9 = a5;
    id v10 = a4;
    v11 = [[CRLProgressObserver alloc] initWithValueInterval:v10 queue:v9 handler:a3];

    progressObserversQueue = self->_progressObserversQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001158D4;
    v14[3] = &unk_1014CBE78;
    v14[4] = self;
    v5 = v11;
    v15 = v5;
    dispatch_async(progressObserversQueue, v14);
  }

  return v5;
}

- (void)removeProgressObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    progressObserversQueue = self->_progressObserversQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100115988;
    v7[3] = &unk_1014CBE78;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(progressObserversQueue, v7);
  }
}

- (void)protected_progressDidChange
{
  progressObserversValueQueue = self->_progressObserversValueQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100115A08;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(progressObserversValueQueue, block);
}

- (BOOL)protected_hasProgressObservers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  progressObserversQueue = self->_progressObserversQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100115C8C;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(progressObserversQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)protected_minProgressObserverValueInterval
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FF0000000000000;
  progressObserversQueue = self->_progressObserversQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100115D7C;
  v5[3] = &unk_1014CB140;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(progressObserversQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_progressObserversValueQueue, 0);
  objc_storeStrong((id *)&self->_progressObserversQueue, 0);

  objc_storeStrong((id *)&self->_progressObservers, 0);
}

@end