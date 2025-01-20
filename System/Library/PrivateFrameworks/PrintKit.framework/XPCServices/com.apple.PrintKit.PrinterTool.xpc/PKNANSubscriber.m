@interface PKNANSubscriber
- (NSString)debugDescription;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (PKNANSubscriber)init;
- (id)endpointChangedHandler;
- (id)endpointFoundHandler;
- (id)endpointLostHandler;
- (id)queue;
- (id)receiveHandler;
- (int)changeFlags;
- (int)controlFlags;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setChangeFlags:(int)a3;
- (void)setControlFlags:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpointChangedHandler:(id)a3;
- (void)setEndpointFoundHandler:(id)a3;
- (void)setEndpointLostHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setReceiveHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)subscriber:(id)a3 receivedMessage:(id)a4 fromPublishID:(unsigned __int8)a5 address:(id)a6;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberStarted:(id)a3;
@end

@implementation PKNANSubscriber

- (PKNANSubscriber)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKNANSubscriber;
  v2 = [(PKNANSubscriber *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    endpoints = v2->_endpoints;
    v2->_endpoints = (NSMutableSet *)v3;
  }
  return v2;
}

- (NSString)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)PKNANSubscriber;
  uint64_t v3 = [(PKNANSubscriber *)&v9 debugDescription];
  id v4 = [(NSMutableSet *)self->_endpoints count];
  v5 = [(NSMutableSet *)self->_endpoints debugDescription];
  objc_super v6 = [(WiFiAwareSubscriber *)self->_subscriber debugDescription];
  v7 = +[NSString stringWithFormat:@"%@ { %d endpoints - %@, %@ }", v3, v4, v5, v6];

  return (NSString *)v7;
}

- (id)queue
{
  uint64_t v3 = [(PKNANSubscriber *)self dispatchQueue];

  if (v3)
  {
    id v4 = [(PKNANSubscriber *)self dispatchQueue];
  }
  else
  {
    id v4 = &_dispatch_main_q;
    id v5 = &_dispatch_main_q;
  }

  return v4;
}

- (void)subscriberStarted:(id)a3
{
  id v5 = a3;
  objc_super v6 = NSStringFromSelector(a2);
  NSLog(@"%@: %@ %@", self, v6, v5);

  id v7 = objc_retainBlock(self->_activateHandler);
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = 0;

  if (v7)
  {
    objc_super v9 = [(PKNANSubscriber *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030DCC;
    block[3] = &unk_100095820;
    id v11 = v7;
    dispatch_async(v9, block);
  }
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  objc_super v6 = NSStringFromSelector(a2);
  NSLog(@"%@: %@ - %d", self, v6, a4);

  id v7 = objc_retainBlock(self->_activateHandler);
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = 0;

  if (v7)
  {
    CFStringRef v17 = @"WiFiP2PError";
    objc_super v9 = +[NSNumber numberWithInteger:a4];
    v18 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:14 userInfo:v10];

    v12 = [(PKNANSubscriber *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030FE4;
    block[3] = &unk_100095B70;
    id v15 = v11;
    id v16 = v7;
    id v13 = v11;
    dispatch_async(v12, block);
  }
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v7 = a3;
  objc_super v6 = NSStringFromSelector(a2);
  NSLog(@"%@: %@", self, v6);

  if (self->_activateHandler) {
    __assert_rtn("-[PKNANSubscriber subscriber:terminatedWithReason:]", "PKNan.mm", 293, "_activateHandler == nil");
  }
  [v7 setDelegate:0];
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  unsigned int v25 = a4;
  id v23 = a5;
  id v7 = NSStringFromSelector(a2);
  NSLog(@"%@: %@", self, v7);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = self;
  obj = self->_endpoints;
  id v8 = [(NSMutableSet *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      v12 = [v11 discoveryResult];
      if ([v12 publishID] == v25)
      {
        id v13 = [v11 discoveryResult];
        v14 = [v13 publisherAddress];
        id v15 = [v14 data];
        id v16 = [v23 data];
        unsigned __int8 v17 = [v15 isEqualToData:v16];

        if (v17)
        {
          id v18 = v11;

          if (!v18) {
            goto LABEL_17;
          }
          v19 = [(PKNANSubscriber *)v22 endpointLostHandler];
          if (v19)
          {
            v20 = [(PKNANSubscriber *)v22 queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100031410;
            block[3] = &unk_100095B70;
            id v28 = v19;
            id v27 = v18;
            dispatch_async(v20, block);
          }
          [(NSMutableSet *)v22->_endpoints removeObject:v18];

          v21 = v23;
          goto LABEL_18;
        }
      }
      else
      {
      }
      if (v8 == (id)++v10)
      {
        id v8 = [(NSMutableSet *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

LABEL_17:
  v21 = v23;
  NSLog(@"Can't find endpoint publish id %d, addr %@", v25, v23);
LABEL_18:
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6 = a4;
  id v7 = NSStringFromSelector(a2);
  id v8 = [v6 debugDescription];
  NSLog(@"%@: %@ - %@", self, v7, v8);

  uint64_t v9 = [[PKNANEndpoint alloc] initWithDiscoveryResult:v6];
  [(NSMutableSet *)self->_endpoints addObject:v9];
  uint64_t v10 = [(PKNANSubscriber *)self endpointFoundHandler];
  if (v10)
  {
    id v11 = [(PKNANSubscriber *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003159C;
    block[3] = &unk_100095B70;
    id v14 = v10;
    id v13 = v9;
    dispatch_async(v11, block);
  }
}

- (void)subscriber:(id)a3 receivedMessage:(id)a4 fromPublishID:(unsigned __int8)a5 address:(id)a6
{
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(@"%@: %@", self, v7);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = v4;

  id v6 = objc_alloc((Class)WiFiAwareSubscribeConfiguration);
  id v7 = [(PKNANSubscriber *)self serviceType];
  id v10 = [v6 initWithServiceName:v7];

  if ([(PKNANSubscriber *)self controlFlags]) {
    [v10 setAuthenticationType:0];
  }
  id v8 = (WiFiAwareSubscriber *)[objc_alloc((Class)WiFiAwareSubscriber) initWithConfiguration:v10];
  subscriber = self->_subscriber;
  self->_subscriber = v8;

  [(WiFiAwareSubscriber *)self->_subscriber setDelegate:self];
  [(WiFiAwareSubscriber *)self->_subscriber start];
}

- (void)invalidate
{
  subscriber = self->_subscriber;
  if (subscriber)
  {
    [(WiFiAwareSubscriber *)subscriber stop];
    [(WiFiAwareSubscriber *)self->_subscriber setDelegate:0];
    id v4 = self->_subscriber;
    self->_subscriber = 0;
  }
}

- (int)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(int)a3
{
  self->_changeFlags = a3;
}

- (int)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLabel:(id)a3
{
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServiceType:(id)a3
{
}

- (id)endpointFoundHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setEndpointFoundHandler:(id)a3
{
}

- (id)endpointLostHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setEndpointLostHandler:(id)a3
{
}

- (id)endpointChangedHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setEndpointChangedHandler:(id)a3
{
}

- (id)receiveHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setReceiveHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveHandler, 0);
  objc_storeStrong(&self->_endpointChangedHandler, 0);
  objc_storeStrong(&self->_endpointLostHandler, 0);
  objc_storeStrong(&self->_endpointFoundHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong(&self->_activateHandler, 0);

  objc_storeStrong((id *)&self->_subscriber, 0);
}

@end