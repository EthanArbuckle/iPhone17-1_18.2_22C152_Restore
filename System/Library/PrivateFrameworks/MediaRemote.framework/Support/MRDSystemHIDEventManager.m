@interface MRDSystemHIDEventManager
- (MRDSystemHIDEventManager)init;
- (void)dealloc;
- (void)dispatchHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation MRDSystemHIDEventManager

- (MRDSystemHIDEventManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MRDSystemHIDEventManager;
  v2 = [(MRDSystemHIDEventManager *)&v9 init];
  if (v2)
  {
    v2->_hidSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->_hidSystemClient);
  v3.receiver = self;
  v3.super_class = (Class)MRDSystemHIDEventManager;
  [(MRDSystemHIDEventManager *)&v3 dealloc];
}

- (void)dispatchHIDEvent:(__IOHIDEvent *)a3
{
  CFRetain(a3);
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003B760;
  v6[3] = &unk_1004165E8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)serialQueue, v6);
}

- (void).cxx_destruct
{
}

@end