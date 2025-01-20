@interface STSXPClientNotification
- (void)dealloc;
- (void)getRemoteTransceiverProxyXPCEndpointWithType:(unint64_t)a3 callback:(id)a4;
- (void)iso18013ReaderSendSessionData:(id)a3 status:(id)a4 callback:(id)a5;
- (void)iso18013ReaderSendSessionEstablishment:(id)a3 callback:(id)a4;
- (void)sendConnectionHandoverCompleted;
- (void)sendConnectionHandoverStarted;
- (void)sendCredentialSelect:(id)a3 callback:(id)a4;
- (void)sendRawDataToAlternativeCarrier:(id)a3 callback:(id)a4;
- (void)setRequestHandoverConfirmation:(BOOL)a3;
- (void)startHandoffWithCompletion:(id)a3;
@end

@implementation STSXPClientNotification

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (STSXPClientNotification *)self->_xpc;
  }
  [(STSXPClientNotification *)self invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)STSXPClientNotification;
  [(STSXPClientNotification *)&v3 dealloc];
}

- (void)sendRawDataToAlternativeCarrier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPClientNotification sendRawDataToAlternativeCarrier:callback:]", 178, self, @"data: %@", v8, v9, (uint64_t)v6);
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_alternativeCarrier)) != 0)
  {
    v13 = WeakRetained;
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E2A0;
    v16[3] = &unk_100054A48;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    id v17 = v7;
    [v13 altCarrierSendData:v6 completion:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification sendRawDataToAlternativeCarrier:callback:]", 194, self, @"AC not initialized", v10, v11, v15);
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id location = off_100066160;
    v14 = +[NSDictionary dictionaryWithObjects:&location forKeys:&v19 count:1];
    v13 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v14];

    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

- (void)sendConnectionHandoverStarted
{
  v2 = +[NSDate now];
  CFStringRef v5 = @"handoverStartEventTime";
  id v6 = v2;
  objc_super v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v4 = +[STSAnalyticsLogger sharedCALogger];
  [v4 postISOHandoverEvent:v3 prepOnly:1];
}

- (void)sendConnectionHandoverCompleted
{
  v2 = +[NSDate now];
  CFStringRef v5 = @"handoverEndEventTime";
  id v6 = v2;
  objc_super v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v4 = +[STSAnalyticsLogger sharedCALogger];
  [v4 postISOHandoverEvent:v3 prepOnly:0];
}

- (void)getRemoteTransceiverProxyXPCEndpointWithType:(unint64_t)a3 callback:(id)a4
{
  id v6 = (void (**)(id, STSXPClientNotification *))a4;
  uint64_t v8 = v6;
  if (!a3)
  {
    if (self)
    {
      p_nfcReaderProxyConnection = &self->_nfcReaderProxyConnection;
      goto LABEL_7;
    }
LABEL_8:
    v8[2](v8, self);

    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (self)
    {
      p_nfcReaderProxyConnection = &self->_seProxyConnection;
LABEL_7:
      self = (STSXPClientNotification *)objc_loadWeakRetained((id *)p_nfcReaderProxyConnection);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v6[2](v6, 0);
LABEL_10:
}

- (void)sendCredentialSelect:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPClientNotification sendCredentialSelect:callback:]", 252, self, &stru_100055900, v8, v9, v11);
  if (self) {
    self = (STSXPClientNotification *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000E704;
  v12[3] = &unk_100054A70;
  id v13 = v7;
  id v10 = v7;
  [(STSXPClientNotification *)self receivedCredentialSelection:v6 callback:v12];
}

- (void)iso18013ReaderSendSessionEstablishment:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPClientNotification iso18013ReaderSendSessionEstablishment:callback:]", 266, self, &stru_100055900, v8, v9, v18);
  if (!self
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_alternativeCarrier), WeakRetained,
                                                                                !WeakRetained))
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification iso18013ReaderSendSessionEstablishment:callback:]", 268, self, @"AC not initialized", v10, v11, v19);
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = off_100066160;
    v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v17 = 2;
LABEL_7:
    uint64_t v15 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:v17 userInfo:v16];

    v7[2](v7, v15);
    goto LABEL_8;
  }
  if (![v6 length])
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification iso18013ReaderSendSessionEstablishment:callback:]", 274, self, @"SessionEstablishment is empty", v13, v14, v19);
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = off_100066168;
    v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v17 = 3;
    goto LABEL_7;
  }
  uint64_t v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [v15 iso18013ReaderSendSessionEstablishment:v6 callback:v7];
LABEL_8:
}

- (void)iso18013ReaderSendSessionData:(id)a3 status:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPClientNotification iso18013ReaderSendSessionData:status:callback:]", 285, self, &stru_100055900, v11, v12, v18);
  if (self && (id v15 = objc_loadWeakRetained((id *)&self->_alternativeCarrier), v15, v15))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained iso18013ReaderSendSessionData:v8 status:v9 callback:v10];
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification iso18013ReaderSendSessionData:status:callback:]", 287, self, @"AC not initialized", v13, v14, v19);
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = off_100066160;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id WeakRetained = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v17];

    v10[2](v10, WeakRetained);
  }
}

- (void)setRequestHandoverConfirmation:(BOOL)a3
{
  BOOL v3 = a3;
  if (self) {
    self = (STSXPClientNotification *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  v4 = self;
  [(STSXPClientNotification *)self setRequestHandoverConfirmation:v3];
}

- (void)startHandoffWithCompletion:(id)a3
{
  CFStringRef v5 = (void (**)(id, void *))a3;
  if (self) {
    self = (STSXPClientNotification *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  v4 = [(STSXPClientNotification *)self startHandoff];
  v5[2](v5, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpc, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_destroyWeak((id *)&self->_nfcReaderProxyConnection);
  objc_destroyWeak((id *)&self->_seProxyConnection);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_alternativeCarrier);
}

@end