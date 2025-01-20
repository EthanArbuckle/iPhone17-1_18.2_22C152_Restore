@interface MBPowerAssertion
- (MBPowerAssertion)initWithName:(id)a3 timeout:(double)a4;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (double)timeout;
- (unsigned)assertionID;
- (void)_drop;
- (void)dealloc;
- (void)drop;
- (void)hold;
- (void)setAssertionID:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation MBPowerAssertion

- (MBPowerAssertion)initWithName:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MBPowerAssertion;
  v8 = [(MBPowerAssertion *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_timeout = a4;
    v10 = (objc_class *)objc_opt_class();
    Name = class_getName(v10);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(Name, v12);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

    v9->_assertionID = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(MBPowerAssertion *)self _drop];
  v3.receiver = self;
  v3.super_class = (Class)MBPowerAssertion;
  [(MBPowerAssertion *)&v3 dealloc];
}

- (void)hold
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002AEF74;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_drop
{
  IOPMAssertionID assertionID = self->_assertionID;
  if (assertionID)
  {
    IOReturn v4 = IOPMAssertionRelease(assertionID);
    v5 = MBGetDefaultLog();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        unsigned int v8 = self->_assertionID;
        *(_DWORD *)buf = 138413058;
        CFStringRef v12 = @"NoIdleSleepAssertion";
        __int16 v13 = 2112;
        v14 = name;
        __int16 v15 = 1024;
        unsigned int v16 = v8;
        __int16 v17 = 1024;
        IOReturn v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to drop \"%@\", n:\"%@\", id:%i - IOPMAssertionRelease() returned %#x", buf, 0x22u);
        _MBLog();
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v9 = self->_name;
        unsigned int v10 = self->_assertionID;
        *(_DWORD *)buf = 138412802;
        CFStringRef v12 = @"NoIdleSleepAssertion";
        __int16 v13 = 2112;
        v14 = v9;
        __int16 v15 = 1024;
        unsigned int v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Dropped \"%@\", n:\"%@\", id:%i", buf, 0x1Cu);
        _MBLog();
      }

      self->_IOPMAssertionID assertionID = 0;
    }
  }
}

- (void)drop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002AF460;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_IOPMAssertionID assertionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end