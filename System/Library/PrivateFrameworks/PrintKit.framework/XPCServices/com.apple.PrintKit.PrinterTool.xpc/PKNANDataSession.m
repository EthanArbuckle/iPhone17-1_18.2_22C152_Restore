@interface PKNANDataSession
- ($73F895DBD1999BB8C4FC3321EA55D21E)peerAddress;
- (NSString)debugDescription;
- (NSString)label;
- (NSString)passphrase;
- (OS_dispatch_queue)dispatchQueue;
- (PKNANDataSession)init;
- (PKNANEndpoint)peerEndpoint;
- (id)queue;
- (id)terminationHandler;
- (unsigned)trafficFlags;
- (void)activateWithCompletion:(id)a3;
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPassphrase:(id)a3;
- (void)setPeerEndpoint:(id)a3;
- (void)setTerminationHandler:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
@end

@implementation PKNANDataSession

- (PKNANDataSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKNANDataSession;
  return [(PKNANDataSession *)&v3 init];
}

- (id)queue
{
  objc_super v3 = [(PKNANDataSession *)self dispatchQueue];

  if (v3)
  {
    v4 = [(PKNANDataSession *)self dispatchQueue];
  }
  else
  {
    v4 = &_dispatch_main_q;
    id v5 = &_dispatch_main_q;
  }

  return v4;
}

- (NSString)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)PKNANDataSession;
  objc_super v3 = [(PKNANDataSession *)&v7 debugDescription];
  v4 = [(WiFiAwareDataSession *)self->_dataSession debugDescription];
  id v5 = +[NSString stringWithFormat:@"%@ { %@ }", v3, v4];

  return (NSString *)v5;
}

- (void)dataSessionRequestStarted:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(@"%@: %@", self, v4);
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  v6 = NSStringFromSelector(a2);
  NSLog(@"%@: %@", self, v6);

  id v7 = objc_retainBlock(self->_activateHandler);
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = 0;

  if (v7)
  {
    CFStringRef v17 = @"WiFiP2PError";
    v9 = +[NSNumber numberWithInteger:a4];
    v18 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:14 userInfo:v10];

    v12 = [(PKNANDataSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000302BC;
    block[3] = &unk_100095B70;
    id v15 = v11;
    id v16 = v7;
    id v13 = v11;
    dispatch_async(v12, block);
  }
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = NSStringFromSelector(a2);
  NSLog(@"%@: %@", self, v11);

  objc_storeStrong((id *)&self->_peerDataAddress, a4);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, a5);
  id v12 = objc_retainBlock(self->_activateHandler);
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = 0;

  if (v12)
  {
    v14 = [(PKNANDataSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030428;
    block[3] = &unk_100095820;
    id v16 = v12;
    dispatch_async(v14, block);
  }
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v7 = a3;
  v8 = NSStringFromSelector(a2);
  NSLog(@"%@: %@ - %d", self, v8, a4);

  [v7 setDelegate:0];
  CFStringRef v24 = @"WiFiAwareTerminationReason";
  id v9 = +[NSNumber numberWithInteger:a4];
  v25 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:14 userInfo:v10];

  if (self->_activateHandler)
  {
    NSLog(@"terminated without activation, so not sending to termination handler");
    id v12 = objc_retainBlock(self->_activateHandler);
    id activateHandler = self->_activateHandler;
    self->_id activateHandler = 0;

    if (v12)
    {
      v14 = [(PKNANDataSession *)self queue];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100030724;
      v21[3] = &unk_100095B70;
      id v15 = &v23;
      id v12 = v12;
      id v23 = v12;
      id v16 = &v22;
      id v22 = v11;
      CFStringRef v17 = v21;
LABEL_6:
      dispatch_async(v14, v17);
    }
  }
  else
  {
    id v12 = [(PKNANDataSession *)self terminationHandler];
    if (v12)
    {
      v14 = [(PKNANDataSession *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100030738;
      block[3] = &unk_100095B70;
      id v15 = &v20;
      id v12 = v12;
      id v20 = v12;
      id v16 = &v19;
      id v19 = v11;
      CFStringRef v17 = block;
      goto LABEL_6;
    }
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v16 = a3;
  id v4 = [(PKNANDataSession *)self passphrase];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = objc_alloc((Class)WiFiAwareDataSession);
    id v7 = [(PKNANDataSession *)self peerEndpoint];
    v8 = [v7 discoveryResult];
    id v9 = [(PKNANDataSession *)self passphrase];
    id v10 = (WiFiAwareDataSession *)[v6 initWithDiscoveryResult:v8 serviceType:0 serviceSpecificInfo:0 passphrase:v9];
    dataSession = self->_dataSession;
    self->_dataSession = v10;
  }
  else
  {
    id v12 = objc_alloc((Class)WiFiAwareDataSession);
    id v7 = [(PKNANDataSession *)self peerEndpoint];
    v8 = [v7 discoveryResult];
    id v13 = (WiFiAwareDataSession *)[v12 initWithDiscoveryResult:v8 serviceType:0 serviceSpecificInfo:0];
    id v9 = self->_dataSession;
    self->_dataSession = v13;
  }

  [(WiFiAwareDataSession *)self->_dataSession setDelegate:self];
  id v14 = objc_retainBlock(v16);
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = v14;

  [(WiFiAwareDataSession *)self->_dataSession start];
}

- ($73F895DBD1999BB8C4FC3321EA55D21E)peerAddress
{
  retstr->var0 = 0uLL;
  retstr->var2.sin6_scope_id = 0;
  *(void *)&retstr->var2.sin6_addr.__u6_addr32[2] = 0;
  *(_WORD *)&retstr->var0.sa_len = 7708;
  id v5 = [(WiFiMACAddress *)self->_peerDataAddress ipv6LinkLocalAddress];
  retstr->var2.sin6_addr = *(in6_addr *)[v5 bytes];

  retstr->var2.sin6_scope_id = [(WiFiAwareDataSession *)self->_dataSession localInterfaceIndex];
  result = ($73F895DBD1999BB8C4FC3321EA55D21E *)[(WiFiAwarePublishDatapathServiceSpecificInfo *)self->_serviceSpecificInfo servicePort];
  retstr->var1.sin_port = __rev16(result);
  return result;
}

- (void)invalidate
{
  dataSession = self->_dataSession;
  if (dataSession)
  {
    [(WiFiAwareDataSession *)dataSession stop];
    [(WiFiAwareDataSession *)self->_dataSession setDelegate:0];
    id v4 = self->_dataSession;
    self->_dataSession = 0;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLabel:(id)a3
{
}

- (PKNANEndpoint)peerEndpoint
{
  return (PKNANEndpoint *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPeerEndpoint:(id)a3
{
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (id)terminationHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setTerminationHandler:(id)a3
{
}

- (NSString)passphrase
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPassphrase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong(&self->_terminationHandler, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_peerDataAddress, 0);
  objc_storeStrong(&self->_activateHandler, 0);

  objc_storeStrong((id *)&self->_dataSession, 0);
}

@end