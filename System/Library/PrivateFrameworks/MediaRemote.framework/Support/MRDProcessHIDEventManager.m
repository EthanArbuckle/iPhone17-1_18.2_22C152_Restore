@interface MRDProcessHIDEventManager
- (MRDProcessHIDEventManager)initWithBundleID:(id)a3 processID:(int)a4;
- (NSString)bundleID;
- (int)processID;
- (void)dispatchHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation MRDProcessHIDEventManager

- (MRDProcessHIDEventManager)initWithBundleID:(id)a3 processID:(int)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRDProcessHIDEventManager;
  v7 = [(MRDProcessHIDEventManager *)&v16 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    bundleID = v7->_bundleID;
    v7->_bundleID = v8;

    v7->_processID = a4;
    v10 = (objc_class *)objc_opt_class();
    Name = class_getName(v10);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(Name, v12);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (void)dispatchHIDEvent:(__IOHIDEvent *)a3
{
  CFRetain(a3);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B924;
  block[3] = &unk_1004171F0;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)processID
{
  return self->_processID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end