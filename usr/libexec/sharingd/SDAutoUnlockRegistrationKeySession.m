@interface SDAutoUnlockRegistrationKeySession
- (BOOL)isLocallyGenerated;
- (NSData)requestData;
- (void)handleStepData:(id)a3;
- (void)onQueue_start;
- (void)sendStepData:(id)a3 type:(unsigned __int16)a4 errorCode:(int64_t)a5;
- (void)setLocallyGenerated:(BOOL)a3;
- (void)setRequestData:(id)a3;
- (void)start;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
@end

@implementation SDAutoUnlockRegistrationKeySession

- (void)start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141B80;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onQueue_start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [SDAutoUnlockDeviceRegistrationRequest alloc];
  v5 = [(SDAutoUnlockRegistrationKeySession *)self requestData];
  v6 = [(SDAutoUnlockDeviceRegistrationRequest *)v4 initWithData:v5];

  if (v6 || [(SDAutoUnlockRegistrationKeySession *)self isLocallyGenerated])
  {
    v7 = +[SDStatusMonitor sharedMonitor];
    unsigned int v8 = [v7 deviceKeyBagUnlocked];

    if (v8)
    {
      v9 = +[SDAutoUnlockAKSManager sharedManager];
      v10 = [(SDAutoUnlockPairingSession *)self deviceID];
      v11 = [v9 aksRegistrationSessionForDeviceID:v10 originator:1];
      [(SDAutoUnlockPairingSession *)self setAksSession:v11];

      v12 = [(SDAutoUnlockPairingSession *)self aksSession];
      LODWORD(v10) = [v12 sessionIsValid];

      if (v10)
      {
        v13 = [(SDAutoUnlockPairingSession *)self aksSession];
        id v23 = 0;
        unsigned int v14 = [v13 stepSessionWithData:0 outputData:&v23];
        v15 = v23;

        if (v14)
        {
          unsigned int v16 = [(SDAutoUnlockRegistrationKeySession *)self isLocallyGenerated];
          unsigned int v17 = [(SDAutoUnlockRegistrationKeySession *)self isLocallyGenerated];
          v18 = (uint64_t *)&unk_10076D990;
          if (!v17) {
            v18 = &qword_10076D988;
          }
          double v19 = *(double *)v18;
          if (v16) {
            uint64_t v20 = 505;
          }
          else {
            uint64_t v20 = 502;
          }
          [(SDAutoUnlockRegistrationKeySession *)self sendStepData:v15 type:v20 errorCode:0];
          [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(v19)];
          goto LABEL_27;
        }
        v22 = auto_unlock_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1001424F8();
        }
      }
      else
      {
        v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10014252C();
        }
      }
      uint64_t v21 = 101;
    }
    else
    {
      v15 = auto_unlock_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100142560();
      }
      uint64_t v21 = 102;
    }
  }
  else
  {
    v15 = auto_unlock_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100142594();
    }
    uint64_t v21 = 212;
  }

  if (![(SDAutoUnlockRegistrationKeySession *)self isLocallyGenerated])
  {
    [(SDAutoUnlockRegistrationKeySession *)self sendStepData:0 type:502 errorCode:v21];
    [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(20.0)];
  }
  v15 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:v21 userInfo:0];
  [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:v15];
LABEL_27:
}

- (void)sendStepData:(id)a3 type:(unsigned __int16)a4 errorCode:(int64_t)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(SDAutoUnlockDeviceRegistrationStep);
  [(SDAutoUnlockDeviceRegistrationStep *)v9 setStepData:v8];

  [(SDAutoUnlockDeviceRegistrationStep *)v9 setErrorCode:a5];
  v10 = +[SDAutoUnlockTransport sharedTransport];
  v11 = [(SDAutoUnlockDeviceRegistrationStep *)v9 data];
  v12 = [(SDAutoUnlockPairingSession *)self deviceID];
  v13 = [(SDAutoUnlockPairingSession *)self sessionID];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100141FBC;
  v14[3] = &unk_1008CA5A8;
  v14[4] = self;
  [v10 sendPayload:v11 toDevice:v12 type:v6 sessionID:v13 timeout:&off_100902CA0 errorHandler:v14];
}

- (void)handleStepData:(id)a3
{
  id v4 = a3;
  v5 = [[SDAutoUnlockDeviceRegistrationStep alloc] initWithData:v4];

  uint64_t v6 = [(SDAutoUnlockDeviceRegistrationStep *)v5 stepData];

  if (!v6)
  {
    v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001425C8();
    }
    uint64_t v17 = 211;
    goto LABEL_19;
  }
  v7 = +[SDStatusMonitor sharedMonitor];
  unsigned int v8 = [v7 deviceKeyBagUnlocked];

  if (!v8)
  {
    v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100142560();
    }
    uint64_t v17 = 102;
    goto LABEL_19;
  }
  v9 = [(SDAutoUnlockPairingSession *)self aksSession];
  v10 = [(SDAutoUnlockDeviceRegistrationStep *)v5 stepData];
  id v20 = 0;
  unsigned int v11 = [v9 stepSessionWithData:v10 outputData:&v20];
  v12 = v20;

  if (!v11)
  {
    v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001424F8();
    }
    goto LABEL_18;
  }
  v13 = [(SDAutoUnlockPairingSession *)self aksSession];
  unsigned int v14 = [v13 confirmSession];

  if (!v14)
  {
    v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001425FC();
    }
LABEL_18:

    uint64_t v17 = 101;
LABEL_19:

    [(SDAutoUnlockRegistrationKeySession *)self sendStepData:0 type:504 errorCode:v17];
    [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(20.0)];
    v12 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:v17 userInfo:0];
    [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:v12];
    goto LABEL_20;
  }
  v15 = objc_alloc_init(SDAutoUnlockDeviceRegistrationStep);
  [(SDAutoUnlockDeviceRegistrationStep *)v15 setStepData:v12];
  [(SDAutoUnlockRegistrationKeySession *)self sendStepData:v12 type:504 errorCode:0];
  [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
  unsigned int v16 = auto_unlock_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Successfully registered local device", v19, 2u);
  }

  [(SDAutoUnlockRegistrationSession *)self notifyDelegateWithError:0];
LABEL_20:
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v8 = a4;
  v9 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100142414;
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

- (BOOL)isLocallyGenerated
{
  return self->_locallyGenerated;
}

- (void)setLocallyGenerated:(BOOL)a3
{
  self->_locallyGenerated = a3;
}

- (void).cxx_destruct
{
}

@end