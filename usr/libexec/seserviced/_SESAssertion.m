@interface _SESAssertion
+ (id)validateEntitlements:(id)a3 appletIdentifier:(id)a4;
- (NSXPCConnection)connection;
- (_SESAssertion)initWithRemoteObject:(id)a3 keyIdentifier:(id)a4 appletIdentifier:(id)a5 options:(id)a6 queue:(id)a7;
- (id)didEndCallback;
- (id)start;
- (void)invalidate:(id)a3;
- (void)invalidateInternal;
- (void)setConnection:(id)a3;
- (void)setDidEndCallback:(id)a3;
- (void)stop;
@end

@implementation _SESAssertion

- (_SESAssertion)initWithRemoteObject:(id)a3 keyIdentifier:(id)a4 appletIdentifier:(id)a5 options:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_SESAssertion;
  v18 = [(_SESAssertion *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(&v18->_remoteObject, a3);
    objc_storeStrong((id *)&v19->_queue, a7);
    uint64_t v20 = [v14 hexStringAsData];
    keyIdentifier = v19->_keyIdentifier;
    v19->_keyIdentifier = (NSData *)v20;

    uint64_t v22 = [v15 hexStringAsData];
    appletIdentifier = v19->_appletIdentifier;
    v19->_appletIdentifier = (NSData *)v22;

    objc_storeStrong((id *)&v19->_options, a6);
    uint64_t v24 = +[NSString stringWithFormat:@"%@", v19];
    assertionID = v19->_assertionID;
    v19->_assertionID = (NSString *)v24;
  }
  return v19;
}

+ (id)validateEntitlements:(id)a3 appletIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 hexStringAsData];
  v8 = +[_SESSessionClientInfo withConnection:v6];

  v9 = [@"A000000809434343444B417631" hexStringAsData];
  if ([v9 isEqualToData:v7])
  {
    unsigned __int8 v10 = [v8 dckSessionEntitlement];

    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  v11 = [@"A000000909ACCE5501" hexStringAsData];
  if ([v11 isEqualToData:v7])
  {
    unsigned __int8 v12 = [v8 acwgSessionEntitlement];

    if (v12)
    {
LABEL_7:
      id v13 = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v14 = SESDefaultLogObject();
  id v16 = [v8 clientName];
  id v13 = SESCreateAndLogError();

LABEL_10:

  return v13;
}

- (id)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SESAssertion start %@", buf, 0xCu);
  }

  v4 = [@"A000000809434343444B417631" hexStringAsData];
  unsigned int v5 = [v4 isEqualToData:self->_appletIdentifier];

  if (!v5)
  {
    v11 = [@"A000000909ACCE5501" hexStringAsData];
    unsigned int v12 = [v11 isEqualToData:self->_appletIdentifier];

    if (!v12)
    {
LABEL_9:
      id v13 = (OS_os_transaction *)os_transaction_create();
      id v14 = 0;
      keepAlive = self->_keepAlive;
      self->_keepAlive = v13;
      goto LABEL_10;
    }
    keepAlive = +[LyonExternal shared];
    [keepAlive updatePassSelectionState:1];
LABEL_8:

    goto LABEL_9;
  }
  id v6 = &off_100450000;
  v7 = +[AlishaExternal shared];
  keepAlive = [v7 getEndpointWithKeyIdentifier:self->_keyIdentifier];

  v9 = [keepAlive bleUUID];

  if (v9)
  {
    unsigned __int8 v10 = +[AlishaExternal shared];
    [v10 onAssertionAcquiredWithIdentifier:self->_assertionID for:self->_keyIdentifier];

    goto LABEL_8;
  }
  id v16 = SESDefaultLogObject();
  if (keepAlive)
  {
    id v6 = [keepAlive bleUUID];
  }
  id v17 = [(NSData *)self->_keyIdentifier asHexString];
  id v14 = SESCreateAndLogError();

  if (keepAlive) {
LABEL_10:
  }

  return v14;
}

- (void)stop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_remoteObject) {
    return;
  }
  v3 = [@"A000000809434343444B417631" hexStringAsData];
  unsigned int v4 = [v3 isEqualToData:self->_appletIdentifier];

  if (v4)
  {
    unsigned int v5 = +[AlishaExternal shared];
    [v5 onAssertionReleasedWithIdentifier:self->_assertionID for:self->_keyIdentifier];
  }
  else
  {
    id v6 = [@"A000000909ACCE5501" hexStringAsData];
    unsigned int v7 = [v6 isEqualToData:self->_appletIdentifier];

    if (!v7) {
      goto LABEL_7;
    }
    unsigned int v5 = +[LyonExternal shared];
    [v5 updatePassSelectionState:0];
  }

LABEL_7:
  keepAlive = self->_keepAlive;
  self->_keepAlive = 0;

  id remoteObject = self->_remoteObject;
  self->_id remoteObject = 0;

  didEndCallback = (void (**)(id, _SESAssertion *))self->_didEndCallback;
  if (didEndCallback)
  {
    didEndCallback[2](didEndCallback, self);
    id v11 = self->_didEndCallback;
    self->_didEndCallback = 0;
  }
}

- (void)invalidateInternal
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SESAssertion invalidateInternal %@", (uint8_t *)&v4, 0xCu);
  }

  [self->_remoteObject didInvalidate];
  [(_SESAssertion *)self stop];
}

- (void)invalidate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000653D4;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnection:(id)a3
{
}

- (id)didEndCallback
{
  return self->_didEndCallback;
}

- (void)setDidEndCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEndCallback, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_assertionID, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_remoteObject, 0);
}

@end