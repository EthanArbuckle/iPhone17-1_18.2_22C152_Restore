@interface RPSiriDaemon
- (BOOL)activateAndReturnError:(id *)a3;
- (RPMessageable)messenger;
- (RPSiriDaemon)init;
- (void)_handleSiriAudio:(id)a3;
- (void)_handleSiriStart:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleSiriStartWhileRecording:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleSiriStop:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)invalidate;
- (void)setMessenger:(id)a3;
@end

@implementation RPSiriDaemon

- (RPSiriDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPSiriDaemon;
  v2 = [(RPSiriDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_messenger;
  if (v7)
  {
    if (dword_100142940 <= 30 && (dword_100142940 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v15 = @"statusFlags";
    v16 = &off_10012B360;
    v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BD098;
    v14[3] = &unk_100122C00;
    v14[4] = self;
    [(RPMessageable *)v7 registerEventID:@"_siA" options:v9 handler:v14];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000BD0A4;
    v13[3] = &unk_100121CA0;
    v13[4] = self;
    [(RPMessageable *)v7 registerRequestID:@"_siriStart" options:v9 handler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BD15C;
    v12[3] = &unk_100121CA0;
    v12[4] = self;
    [(RPMessageable *)v7 registerRequestID:@"_siriStop" options:v9 handler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000BD170;
    v11[3] = &unk_100121CA0;
    v11[4] = self;
    [(RPMessageable *)v7 registerRequestID:@"_siriStartWhileRecording" options:v9 handler:v11];
  }
  else
  {
    v8 = RPErrorF();
    if (dword_100142940 <= 90 && (dword_100142940 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a3) {
      *a3 = v8;
    }
  }
  return v7 != 0;
}

- (void)invalidate
{
  if (dword_100142940 <= 30 && (dword_100142940 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPSiriAudioSession *)self->_siriAudioSession invalidate];
  siriAudioSession = self->_siriAudioSession;
  self->_siriAudioSession = 0;

  [(RPMessageable *)self->_messenger deregisterEventID:@"_siA"];
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_siriStart"];
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_siriStop"];
  messenger = self->_messenger;
  self->_messenger = 0;
}

- (void)_handleSiriAudio:(id)a3
{
  id v4 = a3;
  siriAudioSession = self->_siriAudioSession;
  if (siriAudioSession)
  {
    id v7 = v4;
    -[RPSiriAudioSession receivedSiriAudioEvent:](siriAudioSession, "receivedSiriAudioEvent:");
LABEL_3:
    id v4 = v7;
    goto LABEL_8;
  }
  if (dword_100142940 <= 60)
  {
    id v7 = v4;
    if (dword_100142940 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v7, v6))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:
}

- (void)_handleSiriStart:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v6 = a5;
  RPErrorF();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, id))a5 + 2))(v6, 0, 0, v7);
}

- (void)_handleSiriStop:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  if (dword_100142940 <= 30 && (dword_100142940 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*((void (**)(id, void *, void, void))v8 + 2))(v8, &__NSDictionary0__struct, 0, 0);
}

- (void)_handleSiriStartWhileRecording:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  if (dword_100142940 <= 30 && (dword_100142940 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v9 = RPErrorF();
  (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v9);
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_siriSenderIDS, 0);
  objc_storeStrong((id *)&self->_siriAudioSession, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end