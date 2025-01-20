@interface SDAutoUnlockRegistrationLockSession
- (NSData)requestData;
- (SDAutoUnlockRegistrationLockSession)initWithDevice:(id)a3 sessionID:(id)a4;
- (int64_t)state;
- (void)handleFinalize:(id)a3;
- (void)handleInitialResponse:(id)a3;
- (void)onQueue_start;
- (void)sendInitialRequest;
- (void)setRequestData:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
@end

@implementation SDAutoUnlockRegistrationLockSession

- (SDAutoUnlockRegistrationLockSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SDAutoUnlockRegistrationLockSession;
  result = [(SDAutoUnlockPairingSession *)&v5 initWithDevice:a3 sessionID:a4];
  if (result) {
    result->_state = 0;
  }
  return result;
}

- (void)start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100233C14;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onQueue_start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(SDAutoUnlockRegistrationLockSession *)self requestData];

  if (v4)
  {
    id v5 = [(SDAutoUnlockRegistrationLockSession *)self requestData];
    [(SDAutoUnlockRegistrationLockSession *)self handleInitialResponse:v5];
  }
  else
  {
    [(SDAutoUnlockRegistrationLockSession *)self sendInitialRequest];
  }
}

- (void)sendInitialRequest
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(SDAutoUnlockDeviceRegistrationRequest);
  id v5 = +[SDAutoUnlockTransport sharedTransport];
  v6 = [(SDAutoUnlockDeviceRegistrationRequest *)v4 data];
  v7 = [(SDAutoUnlockPairingSession *)self deviceID];
  v8 = [(SDAutoUnlockPairingSession *)self sessionID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100233E00;
  v9[3] = &unk_1008CA5A8;
  v9[4] = self;
  [v5 sendPayload:v6 toDevice:v7 type:501 sessionID:v8 timeout:&off_100903318 errorHandler:v9];

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(20.0)];
}

- (void)handleInitialResponse:(id)a3
{
  id v4 = a3;
  id v5 = [[SDAutoUnlockDeviceRegistrationStep alloc] initWithData:v4];

  if ([(SDAutoUnlockDeviceRegistrationStep *)v5 errorCode])
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = [(SDAutoUnlockDeviceRegistrationStep *)v5 errorCode];
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"Error during registration";
    v8 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v9 = +[NSError errorWithDomain:v6 code:v7 userInfo:v8];
    [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:v9];
  }
  else if ([(SDAutoUnlockDeviceRegistrationStep *)v5 hasStepData])
  {
    v10 = +[SDAutoUnlockAKSManager sharedManager];
    v11 = [(SDAutoUnlockPairingSession *)self deviceID];
    v12 = [v10 aksRegistrationSessionForDeviceID:v11 originator:0];
    [(SDAutoUnlockPairingSession *)self setAksSession:v12];

    v13 = [(SDAutoUnlockPairingSession *)self aksSession];
    LODWORD(v11) = [v13 sessionIsValid];

    if (v11)
    {
      v14 = [(SDAutoUnlockPairingSession *)self aksSession];
      v15 = [(SDAutoUnlockDeviceRegistrationStep *)v5 stepData];
      id v28 = 0;
      unsigned int v16 = [v14 stepSessionWithData:v15 outputData:&v28];
      id v17 = v28;

      if (v16)
      {
        v18 = objc_alloc_init(SDAutoUnlockDeviceRegistrationStep);
        [(SDAutoUnlockDeviceRegistrationStep *)v18 setStepData:v17];
        v19 = +[SDAutoUnlockTransport sharedTransport];
        v20 = [(SDAutoUnlockDeviceRegistrationStep *)v18 data];
        v21 = [(SDAutoUnlockPairingSession *)self deviceID];
        v22 = [(SDAutoUnlockPairingSession *)self sessionID];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100234294;
        v27[3] = &unk_1008CA5A8;
        v27[4] = self;
        [v19 sendPayload:v20 toDevice:v21 type:503 sessionID:v22 timeout:&off_100903318 errorHandler:v27];

        [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(20.0)];
      }
      else
      {
        v18 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:101 userInfo:0];
        [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:v18];
      }
    }
    else
    {
      v26 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:101 userInfo:0];
      [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:v26];
    }
  }
  else
  {
    uint64_t v23 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"Registration Token missing";
    v24 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v25 = +[NSError errorWithDomain:v23 code:211 userInfo:v24];
    [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:v25];
  }
}

- (void)handleFinalize:(id)a3
{
  id v4 = a3;
  id v5 = [[SDAutoUnlockDeviceRegistrationStep alloc] initWithData:v4];

  if (![(SDAutoUnlockDeviceRegistrationStep *)v5 errorCode])
  {
    if ([(SDAutoUnlockDeviceRegistrationStep *)v5 hasStepData])
    {
      v10 = [(SDAutoUnlockPairingSession *)self aksSession];
      v11 = [(SDAutoUnlockDeviceRegistrationStep *)v5 stepData];
      unsigned int v12 = [v10 stepSessionWithData:v11 outputData:0];

      if (v12)
      {
        v13 = [(SDAutoUnlockPairingSession *)self aksSession];
        id v14 = [v13 finalizeRegistration];

        if (!v14)
        {
          v22 = +[SDAutoUnlockAKSManager sharedManager];
          uint64_t v23 = [(SDAutoUnlockPairingSession *)self deviceID];
          v8 = [v22 remoteLTKForDeviceID:v23];

          uint64_t v24 = sub_10001D4C4(v8);
          v25 = auto_unlock_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = sub_10001D9A8(v24);
            int v27 = 138412290;
            id v28 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device has been registered (peer state is %@)", (uint8_t *)&v27, 0xCu);
          }
          v20 = self;
          v21 = 0;
          goto LABEL_17;
        }
        v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100234914((uint64_t)v14, v15);
        }
      }
      else
      {
        v19 = auto_unlock_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10023498C(v19);
        }
      }
      uint64_t v17 = SFAutoUnlockErrorDomain;
      uint64_t v18 = 101;
    }
    else
    {
      unsigned int v16 = auto_unlock_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1002349D0(v16);
      }

      uint64_t v17 = SFAutoUnlockErrorDomain;
      uint64_t v18 = 211;
    }
    v8 = +[NSError errorWithDomain:v17 code:v18 userInfo:0];
    v20 = self;
    v21 = v8;
LABEL_17:
    [(SDAutoUnlockRegistrationSession *)v20 notifyDelegateWithError:v21];
    goto LABEL_18;
  }
  uint64_t v6 = SFAutoUnlockErrorDomain;
  uint64_t v7 = [(SDAutoUnlockDeviceRegistrationStep *)v5 errorCode];
  NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
  CFStringRef v30 = @"Error during registration";
  v8 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v9 = +[NSError errorWithDomain:v6 code:v7 userInfo:v8];
  [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:v9];

LABEL_18:
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v8 = a4;
  v9 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100234758;
  block[3] = &unk_1008CBDF8;
  unsigned __int16 v13 = a5;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end