@interface UARPServiceMonitorMatchingRule
- (UARPServiceMonitorMatchingRule)initWithMatchingRule:(id)a3 delegate:(id)a4;
- (void)dealloc;
- (void)matchingService:(unsigned int)a3;
- (void)start;
- (void)stop;
@end

@implementation UARPServiceMonitorMatchingRule

- (UARPServiceMonitorMatchingRule)initWithMatchingRule:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)UARPServiceMonitorMatchingRule;
  id v8 = [(UARPServiceMonitorMatchingRule *)&v22 init];
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "uarpMonitor");
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    v11 = [v6 identifier];
    id v12 = [v11 copy];
    v13 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v12;

    v14 = [v6 matchingDictionary];
    id v15 = [v14 copy];
    v16 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v15;

    objc_storeStrong((id *)v8 + 8, a4);
    dispatch_queue_t v17 = dispatch_queue_create("UARPUpdaterServiceMonitorMatchingRuleDelegate", 0);
    v18 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v17;

    *((void *)v8 + 4) = IONotificationPortCreate(kIOMasterPortDefault);
    dispatch_queue_t v19 = dispatch_queue_create("UARPUpdaterServiceMonitorMatchingRule", 0);
    v20 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v19;

    IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v8 + 4), *((dispatch_queue_t *)v8 + 5));
  }

  return (UARPServiceMonitorMatchingRule *)v8;
}

- (void)dealloc
{
  notifyPort = self->_notifyPort;
  if (notifyPort) {
    IONotificationPortDestroy(notifyPort);
  }
  io_object_t notifyIterator = self->_notifyIterator;
  if (notifyIterator) {
    IOObjectRelease(notifyIterator);
  }
  v5.receiver = self;
  v5.super_class = (Class)UARPServiceMonitorMatchingRule;
  [(UARPServiceMonitorMatchingRule *)&v5 dealloc];
}

- (void)start
{
  p_io_object_t notifyIterator = &self->_notifyIterator;
  if (!self->_notifyIterator
    && !IOServiceAddMatchingNotification(self->_notifyPort, "IOServiceMatched", (CFDictionaryRef)self->_matchingDictionary, (IOServiceMatchingCallback)sub_100011900, self, p_notifyIterator))
  {
    if (*p_notifyIterator)
    {
      notifyQueue = self->_notifyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001196C;
      block[3] = &unk_1000385A8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)notifyQueue, block);
    }
  }
}

- (void)stop
{
  notifyPort = self->_notifyPort;
  if (notifyPort)
  {
    IONotificationPortDestroy(notifyPort);
    self->_notifyPort = 0;
  }
}

- (void)matchingService:(unsigned int)a3
{
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(a3, &properties, kCFAllocatorDefault, 0);
  if (properties) {
    CFRelease(properties);
  }
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011A58;
  block[3] = &unk_100038748;
  block[4] = self;
  unsigned int v7 = a3;
  dispatch_async((dispatch_queue_t)delegateQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_matchingDictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end