@interface MRDPhoneCallObserver
- (BOOL)callControllerWillHandleCommandForBargeCalls:(id)a3;
- (MRDPhoneCallObserver)init;
- (MRDPhoneCallObserverDelegate)delegate;
- (void)_notifyDelegate:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)handleMediaRemoteCommand:(id)a3 completion:(id)a4;
- (void)numberOfActivePhoneCalls:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRDPhoneCallObserver

- (MRDPhoneCallObserver)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRDPhoneCallObserver;
  v2 = [(MRDPhoneCallObserver *)&v10 init];
  if (v2)
  {
    v3 = (CXCallObserver *)objc_alloc_init((Class)CXCallObserver);
    callObserver = v2->_callObserver;
    v2->_callObserver = v3;

    [(CXCallObserver *)v2->_callObserver setDelegate:v2 queue:&_dispatch_main_q];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaremote.TUCallCenter", v5);

    uint64_t v7 = +[TUCallCenter callCenterWithQueue:v6];
    callCenter = v2->_callCenter;
    v2->_callCenter = (TUCallCenter *)v7;
  }
  return v2;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  objc_msgSend(a4, "UUID", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v6 UUIDString];
  [(MRDPhoneCallObserver *)self _notifyDelegate:v5];
}

- (void)_notifyDelegate:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 phoneCallObserver:self callDidChange:v7];
  }
}

- (void)numberOfActivePhoneCalls:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    char v5 = [(CXCallObserver *)self->_callObserver calls];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (([v11 hasEnded] & 1) == 0) {
            v8 += [v11 isScreening] ^ 1;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    v4[2](v4, v8);
  }
}

- (BOOL)callControllerWillHandleCommandForBargeCalls:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  char v5 = [(TUCallCenter *)self->_callCenter queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011CEA4;
  block[3] = &unk_100419598;
  id v9 = v4;
  objc_super v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)handleMediaRemoteCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSDate now];
  id v9 = objc_alloc((Class)NSMutableString);
  objc_super v10 = [v6 commandID];
  id v11 = [v9 initWithFormat:@"%@<%@>", @"MRDPhoneCallObserver.handleMediaRemoteCommand", v10];

  long long v12 = [v6 playerPath];

  if (v12)
  {
    uint64_t v13 = [v6 playerPath];
    [v11 appendFormat:@" for %@", v13];
  }
  char v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10011D1E0;
  v23[3] = &unk_10041D728;
  id v15 = v6;
  id v24 = v15;
  id v16 = v8;
  id v25 = v16;
  id v17 = v7;
  id v26 = v17;
  v18 = objc_retainBlock(v23);
  char v19 = objc_opt_respondsToSelector();
  callCenter = self->_callCenter;
  if (v19)
  {
    id v21 = [v15 commandType];
    v22 = [v15 routeUID];
    [(TUCallCenter *)callCenter handleMediaRemoteCommand:v21 sourceIdentifier:v22 completion:v18];
  }
  else if (objc_opt_respondsToSelector())
  {
    -[TUCallCenter handleMediaRemoteCommand:completion:](self->_callCenter, "handleMediaRemoteCommand:completion:", [v15 commandType], v18);
  }
}

- (MRDPhoneCallObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDPhoneCallObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callCenter, 0);

  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end