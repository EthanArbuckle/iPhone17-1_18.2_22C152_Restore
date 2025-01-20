@interface PRWirelessProximityAdapter
- (PRWirelessProximityAdapter)initWithQueue:(id)a3;
- (id)wiproxStateHandler;
- (void)enableSPMIMessagingWithHandler:(id)a3;
- (void)querySPMIMessagingStatusWithHandler:(id)a3;
- (void)rangingDidUpdateState:(id)a3;
- (void)setWiproxStateHandler:(id)a3;
@end

@implementation PRWirelessProximityAdapter

- (PRWirelessProximityAdapter)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRWirelessProximityAdapter.m", 18, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PRWirelessProximityAdapter;
  v7 = [(PRWirelessProximityAdapter *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_queue, a3);
    v9 = (WPRanging *)[objc_alloc((Class)WPRanging) initWithDelegate:v8 queue:v8->_queue];
    wpRanging = v8->_wpRanging;
    v8->_wpRanging = v9;
  }
  return v8;
}

- (void)enableSPMIMessagingWithHandler:(id)a3
{
  id v4 = a3;
  wpRanging = self->_wpRanging;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D6EF8;
  v7[3] = &unk_10085EBC0;
  id v8 = v4;
  id v6 = v4;
  [(WPRanging *)wpRanging enableRanging:1 reply:v7];
}

- (void)querySPMIMessagingStatusWithHandler:(id)a3
{
  id v4 = a3;
  wpRanging = self->_wpRanging;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D6FA8;
  v7[3] = &unk_10085EBE8;
  id v8 = v4;
  id v6 = v4;
  [(WPRanging *)wpRanging isRangingEnabledReply:v7];
}

- (void)rangingDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_wiproxStateHandler)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002D706C;
    v7[3] = &unk_10085EC10;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (id)wiproxStateHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setWiproxStateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wiproxStateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_wpRanging, 0);
}

@end