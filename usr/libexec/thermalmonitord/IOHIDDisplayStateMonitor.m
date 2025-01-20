@interface IOHIDDisplayStateMonitor
- (IOHIDDisplayStateMonitor)initWithTargetQueue:(id)a3;
- (OS_dispatch_queue)targetQueue;
- (id)monitorDisplayOnStateForReason:(id)a3 handler:(id)a4;
- (void)setTargetQueue:(id)a3;
@end

@implementation IOHIDDisplayStateMonitor

- (IOHIDDisplayStateMonitor)initWithTargetQueue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IOHIDDisplayStateMonitor;
  result = [(IOHIDDisplayStateMonitor *)&v5 init];
  if (result) {
    result->_targetQueue = (OS_dispatch_queue *)a3;
  }
  return result;
}

- (id)monitorDisplayOnStateForReason:(id)a3 handler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002C4DC;
  v5[3] = &unk_100085D10;
  v5[4] = a4;
  return +[DarwinNotificationWatcher monitorNotificationKey:@"com.apple.iokit.hid.displayStatus" forReason:a3 queue:[(IOHIDDisplayStateMonitor *)self targetQueue] handler:v5];
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
}

@end