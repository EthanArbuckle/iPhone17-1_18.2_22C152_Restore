@interface SDAirDropListener
- (BOOL)contactsOnly;
- (NSString)description;
- (SDAirDropListener)init;
- (SDAirDropListenerDelegate)delegate;
- (void)dealloc;
- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)setContactsOnly:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropListener

- (SDAirDropListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAirDropListener;
  v2 = [(SDAirDropListener *)&v6 init];
  v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0;
  }
  return v3;
}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (a4 == 12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained listener:self informationDidChange:v10];
LABEL_9:

    goto LABEL_16;
  }
  if (a4 == 10)
  {
    v21 = airdrop_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "kSFOperationEventErrorOccurred", (uint8_t *)v25, 2u);
    }

    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = [v10 objectForKeyedSubscript:kSFOperationErrorKey];
    [v22 listener:self didReceiveError:v23];

    goto LABEL_13;
  }
  if (a4 != 1)
  {
LABEL_13:
    v24 = airdrop_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000C138C(a4, (uint64_t)v10, v24);
    }

    goto LABEL_16;
  }
  uint64_t v11 = kSFOperationHTTPServerConnectionKey;
  v12 = [v9 objectForKeyedSubscript:kSFOperationHTTPServerConnectionKey];

  if (v12)
  {
    v13 = +[NSUUID UUID];
    WeakRetained = [v13 UUIDString];

    uint64_t v15 = kSFOperationContactsOnlyKey;
    v16 = [v10 objectForKeyedSubscript:kSFOperationContactsOnlyKey];
    v17 = [SDNetworkOperation alloc];
    v18 = [(SDNetworkOperation *)v17 initWithKind:kSFOperationKindReceiver];
    v19 = v18;
    if (v16) {
      [(SDNetworkOperation *)v18 setProperty:v16 forKey:v15];
    }
    [(SDNetworkOperation *)v19 setProperty:v12 forKey:v11];
    [(SDNetworkOperation *)v19 setProperty:WeakRetained forKey:kSFOperationSessionIDKey];
    [(SDNetworkOperation *)v19 setObjectKey:WeakRetained];
    [(SDNetworkOperation *)v19 resume];
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 listener:self didReceiveNewRequest:v19];

    goto LABEL_9;
  }
LABEL_16:
}

- (void)start
{
  if (!self->_listener)
  {
    v3 = [SDNetworkOperation alloc];
    v4 = [(SDNetworkOperation *)v3 initWithKind:kSFOperationKindListener];
    listener = self->_listener;
    self->_listener = v4;

    [(SDNetworkOperation *)self->_listener setDelegate:self];
    objc_super v6 = self->_listener;
    [(SDNetworkOperation *)v6 resume];
  }
}

- (void)stop
{
  listener = self->_listener;
  if (listener)
  {
    [(SDNetworkOperation *)listener setDelegate:0];
    [(SDNetworkOperation *)self->_listener invalidate];
    v4 = self->_listener;
    self->_listener = 0;
  }
}

- (void)dealloc
{
  [(SDAirDropListener *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropListener;
  [(SDAirDropListener *)&v3 dealloc];
}

- (NSString)description
{
  listener = self->_listener;
  if (listener)
  {
    v5 = [(SDNetworkOperation *)listener description];
    NSAppendPrintF();
    id v3 = 0;
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)contactsOnly
{
  return self->_contactsOnly;
}

- (void)setContactsOnly:(BOOL)a3
{
  self->_contactsOnly = a3;
}

- (SDAirDropListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end