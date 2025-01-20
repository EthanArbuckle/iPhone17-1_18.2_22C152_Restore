@interface BKMainDisplayObserver
- (BKMainDisplayObserver)init;
- (BKSHIDEventDisplay)display;
- (id)displayChangedHandler;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDisplayChangedHandler:(id)a3;
@end

@implementation BKMainDisplayObserver

- (void).cxx_destruct
{
}

- (void)setDisplayChangedHandler:(id)a3
{
}

- (id)displayChangedHandler
{
  return self->_displayChangedHandler;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"BKHIDKVOWindowServerDisplayUUID" && self->_displayChangedHandler)
  {
    v13 = [(BKMainDisplayObserver *)self display];
    (*((void (**)(void))self->_displayChangedHandler + 2))();
    v14 = BKLogEventDelivery();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_mainDisplay changed:%{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BKSHIDEventDisplay)display
{
  v2 = +[BKSHIDEventDisplay builtinDisplay];
  v3 = sub_100010DDC();
  v4 = v3;
  if (v3)
  {
    v5 = [v3 uniqueId];
    if (v5)
    {
      uint64_t v6 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:v5];

      v2 = (void *)v6;
    }
  }

  return (BKSHIDEventDisplay *)v2;
}

- (BKMainDisplayObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKMainDisplayObserver;
  v2 = [(BKMainDisplayObserver *)&v5 init];
  if (v2)
  {
    v3 = +[CADisplay mainDisplay];
    [v3 addObserver:v2 forKeyPath:@"uniqueId" options:0 context:@"BKHIDKVOWindowServerDisplayUUID"];
  }
  return v2;
}

@end