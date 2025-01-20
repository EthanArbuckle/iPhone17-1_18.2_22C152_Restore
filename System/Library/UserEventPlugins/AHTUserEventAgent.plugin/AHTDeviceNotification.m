@interface AHTDeviceNotification
- (BOOL)startWithDispatchQueue:(id)a3 error:(id *)a4;
- (BOOL)startWithRunLoop:(id)a3 error:(id *)a4;
- (BOOL)stop:(id *)a3;
- (IONotificationPort)port;
- (NSRunLoop)runLoop;
- (OS_dispatch_queue)dispatchQueue;
- (__CFRunLoopSource)runLoopSource;
- (void)dealloc;
- (void)setDispatchQueue:(id)a3;
- (void)setPort:(IONotificationPort *)a3;
- (void)setRunLoop:(id)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
@end

@implementation AHTDeviceNotification

- (void)dealloc
{
  [(AHTDeviceNotification *)self stop:0];
  v3.receiver = self;
  v3.super_class = (Class)AHTDeviceNotification;
  [(AHTDeviceNotification *)&v3 dealloc];
}

- (BOOL)startWithRunLoop:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(AHTDeviceNotification *)self runLoop];

  if (v7)
  {
    uint64_t v8 = 3758097109;
LABEL_3:
    BOOL v9 = +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:v8 error:a4];
    goto LABEL_4;
  }
  if (!v6)
  {
    uint64_t v8 = 3758097090;
    goto LABEL_3;
  }
  v11 = IONotificationPortCreate(0);
  if (!v11)
  {
    uint64_t v8 = 3758097086;
    goto LABEL_3;
  }
  v12 = v11;
  RunLoopSource = IONotificationPortGetRunLoopSource(v11);
  if (RunLoopSource)
  {
    v14 = RunLoopSource;
    CFRunLoopAddSource((CFRunLoopRef)[v6 getCFRunLoop], RunLoopSource, kCFRunLoopDefaultMode);
    [(AHTDeviceNotification *)self setPort:v12];
    [(AHTDeviceNotification *)self setRunLoop:v6];
    [(AHTDeviceNotification *)self setRunLoopSource:v14];
    BOOL v9 = 1;
  }
  else
  {
    +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:3758097097 error:a4];
    IONotificationPortDestroy(v12);
    BOOL v9 = 0;
  }
LABEL_4:

  return v9;
}

- (BOOL)startWithDispatchQueue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(AHTDeviceNotification *)self dispatchQueue];

  if (v7)
  {
    uint64_t v8 = 3758097109;
  }
  else if (v6)
  {
    v11 = IONotificationPortCreate(0);
    if (v11)
    {
      v12 = v11;
      IONotificationPortSetDispatchQueue(v11, v6);
      [(AHTDeviceNotification *)self setPort:v12];
      [(AHTDeviceNotification *)self setDispatchQueue:v6];
      BOOL v9 = 1;
      goto LABEL_4;
    }
    uint64_t v8 = 3758097086;
  }
  else
  {
    uint64_t v8 = 3758097090;
  }
  BOOL v9 = +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:v8 error:a4];
LABEL_4:

  return v9;
}

- (BOOL)stop:(id *)a3
{
  v5 = [(AHTDeviceNotification *)self runLoop];
  if (v5)
  {

LABEL_4:
    v7 = [(AHTDeviceNotification *)self runLoop];

    if (v7)
    {
      uint64_t v8 = [(AHTDeviceNotification *)self runLoop];
      CFRunLoopRemoveSource((CFRunLoopRef)[v8 getCFRunLoop], -[AHTDeviceNotification runLoopSource](self, "runLoopSource"), kCFRunLoopDefaultMode);
    }
    IONotificationPortDestroy([(AHTDeviceNotification *)self port]);
    [(AHTDeviceNotification *)self setRunLoopSource:0];
    [(AHTDeviceNotification *)self setRunLoop:0];
    [(AHTDeviceNotification *)self setPort:0];
    [(AHTDeviceNotification *)self setDispatchQueue:0];
    return 1;
  }
  id v6 = [(AHTDeviceNotification *)self dispatchQueue];

  if (v6) {
    goto LABEL_4;
  }

  return +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:3758097101 error:a3];
}

- (IONotificationPort)port
{
  return self->_port;
}

- (void)setPort:(IONotificationPort *)a3
{
  self->_port = a3;
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setRunLoop:(id)a3
{
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_runLoop, 0);
}

@end