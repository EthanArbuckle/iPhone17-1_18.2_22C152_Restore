@interface BTServicesXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BTAudioSession)audioSession;
- (BTServicesDaemon)daemon;
- (BTShareAudioSessionDaemon)shareAudioSession;
- (BTSmartRoutingDaemon)smartRoutingSession;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (void)_diagnosticControlShareAudioBanner;
- (void)audioRoutingRequest:(id)a3 responseHandler:(id)a4;
- (void)audioSessionActivate:(id)a3 completion:(id)a4;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)setAudioSession:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setShareAudioSession:(id)a3;
- (void)setSmartRoutingSession:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4;
- (void)shareAudioUserConfirmed:(BOOL)a3;
- (void)xpcConnectionInvalidated;
@end

@implementation BTServicesXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.BluetoothServices"];
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100261638 <= 90 && (dword_100261638 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (a3)
    {
      BTErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v8;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)xpcConnectionInvalidated
{
  v3 = self->_audioSession;
  if (v3)
  {
    if (dword_100261638 < 31 && (dword_100261638 != -1 || _LogCategory_Initialize()))
    {
      v9 = v3;
      LogPrintF();
    }
    [(BTAudioSession *)v3 invalidate];
    audioSession = self->_audioSession;
    self->_audioSession = 0;
  }
  v5 = self->_shareAudioSession;
  v6 = v5;
  if (v5)
  {
    v10 = v5;
    if (dword_100261638 < 31)
    {
      if (dword_100261638 != -1 || (int v7 = _LogCategory_Initialize(), v6 = v10, v7))
      {
        v9 = (BTAudioSession *)v6;
        LogPrintF();
        v6 = v10;
      }
    }
    [(BTShareAudioSessionDaemon *)v6 invalidate];
    shareAudioSession = self->_shareAudioSession;
    self->_shareAudioSession = 0;

    v6 = v10;
  }

  _objc_release_x1(v5, v6);
}

- (void)audioRoutingRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  smartRoutingSession = self->_smartRoutingSession;
  if (smartRoutingSession
    || (+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon], v9 = (BTSmartRoutingDaemon *)objc_claimAutoreleasedReturnValue(), v10 = self->_smartRoutingSession, self->_smartRoutingSession = v9, v10, (smartRoutingSession = self->_smartRoutingSession) != 0))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009E99C;
    v11[3] = &unk_100235BF0;
    id v12 = v7;
    [(BTSmartRoutingDaemon *)smartRoutingSession _smartRoutingAudioRoutingRequest:v6 withResponseHandler:v11];
  }
}

- (void)audioSessionActivate:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_audioSession, a3);
  if (!self->_smartRoutingSession)
  {
    id v8 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
    smartRoutingSession = self->_smartRoutingSession;
    self->_smartRoutingSession = v8;
  }
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100099E7C;
  v30 = sub_100099E8C;
  id v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10009EE44;
  v23[3] = &unk_1002330A0;
  v25 = &v26;
  id v7 = a4;
  id v24 = v7;
  id v8 = objc_retainBlock(v23);
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
  {
    id v21 = v6;
    LogPrintF();
  }
  v9 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  unsigned __int8 v10 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v21);
  objc_storeStrong(v9, obj);
  if (v10)
  {
    CFStringGetTypeID();
    v11 = CFDictionaryGetTypedValue();
    id v12 = v11;
    if (!v11)
    {
      id v20 = (id)BTErrorF();
      goto LABEL_22;
    }
    if ([v11 caseInsensitiveCompare:@"FWCrashed"])
    {
      if ([v12 caseInsensitiveCompare:@"HIDLagDetected"])
      {
        if ([v12 caseInsensitiveCompare:@"IgnoreBTRestart"])
        {
          if (![v12 caseInsensitiveCompare:@"shNote"])
          {
            [(BTServicesXPCConnection *)self _diagnosticControlShareAudioBanner];
LABEL_21:
            (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSDictionary0__struct, 0);
LABEL_22:

            goto LABEL_23;
          }
          if ([v12 caseInsensitiveCompare:@"HIDIntervalUpdated"])
          {
            v13 = +[BTIdentityDaemon sharedBTIdentityDaemon];
            unsigned __int8 v14 = [v13 diagnosticControl:v6 completion:v7];

            if ((v14 & 1) == 0)
            {
              v15 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
              unsigned __int8 v16 = [v15 diagnosticControl:v6 completion:v7];

              if ((v16 & 1) == 0)
              {
                uint64_t v17 = BTErrorF();
                v18 = (void *)v27[5];
                v27[5] = v17;
              }
            }
            goto LABEL_22;
          }
          v19 = +[BTServicesDaemon sharedBTServicesDaemon];
          [v19 _showHIDIntervalBannerIfEnabled:v6];
        }
        else
        {
          v19 = +[BTServicesDaemon sharedBTServicesDaemon];
          [v19 setIgnoreBTRestart:1];
        }
      }
      else
      {
        v19 = +[BTServicesDaemon sharedBTServicesDaemon];
        [v19 _showHIDLagBannerIfEnabled:v6];
      }
    }
    else
    {
      v19 = +[BTServicesDaemon sharedBTServicesDaemon];
      [v19 showCrashBannerIfNeeded:v6];
    }

    goto LABEL_21;
  }
LABEL_23:
  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(&v26, 8);
}

- (void)_diagnosticControlShareAudioBanner
{
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = objc_alloc_init((Class)CUUserNotificationSession);
  [v3 setBundleID:@"com.apple.ShareAudioNotifications"];
  [v3 setCategoryID:@"ShareAudioCategoryID"];
  [v3 setDispatchQueue:self->_dispatchQueue];
  [v3 setFlags:1];
  [v3 setTitleKey:@"Apple TV"];
  [v3 setBodyKey:@"SHARE_AUDIO_BODY_FORMAT"];
  [v3 setBodyArguments:&off_100244970];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009F0D0;
  v5[3] = &unk_100235B50;
  v5[4] = v3;
  [v3 setActionHandler:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009F198;
  v4[3] = &unk_100232710;
  v4[4] = v3;
  [v3 addActionWithIdentifier:@"ShareAudioActionIDConnect" title:@"SHARE_AUDIO_BUTTON" flags:0 handler:v4];
  [v3 activate];
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100099E7C;
  id v24 = sub_100099E8C;
  id v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009F4C8;
  v17[3] = &unk_1002330A0;
  v19 = &v20;
  id v7 = a4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
  {
    id v14 = v6;
    LogPrintF();
  }
  v9 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v10 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v14);
  objc_storeStrong(v9, obj);
  if (v10)
  {
    v15 = CUDescriptionWithLevel();
    NSAppendPrintF();
    v11 = (__CFString *)0;

    if (v11) {
      CFStringRef v12 = v11;
    }
    else {
      CFStringRef v12 = @"None\n";
    }
    CFStringRef v26 = @"_output";
    CFStringRef v27 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, v15);
    (*((void (**)(id, void *, void))v7 + 2))(v7, v13, 0);
  }
  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(&v20, 8);
}

- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  CFStringRef v27 = sub_100099E7C;
  uint64_t v28 = sub_100099E8C;
  id v29 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009F8B4;
  v20[3] = &unk_100235208;
  v23 = &v24;
  id v8 = v6;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  unsigned __int8 v10 = objc_retainBlock(v20);
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v8;
    LogPrintF();
  }
  v11 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  unsigned __int8 v12 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v17);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    if (self->_shareAudioSession)
    {
      uint64_t v16 = NSErrorF();
      v13 = (BTShareAudioSessionDaemon *)v25[5];
      v25[5] = v16;
    }
    else
    {
      v13 = objc_alloc_init(BTShareAudioSessionDaemon);
      objc_storeStrong((id *)&self->_shareAudioSession, v13);
      id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create("BTShareAudioSessionDaemon", v14);
      [(BTShareAudioSessionDaemon *)v13 setDispatchQueue:v15];

      -[BTShareAudioSessionDaemon setMode:](v13, "setMode:", [v8 mode]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10009F98C;
      v18[3] = &unk_100235BC8;
      v18[4] = self;
      v18[5] = v13;
      [(BTShareAudioSessionDaemon *)v13 setProgressHandler:v18];
      [(BTShareAudioSessionDaemon *)v13 activate];
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v24, 8);
}

- (void)shareAudioUserConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100099E7C;
  uint64_t v20 = sub_100099E8C;
  id v21 = 0;
  v5 = self->_shareAudioSession;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009FCCC;
  v15[3] = &unk_100232B20;
  v15[4] = v5;
  v15[5] = &v16;
  id v6 = objc_retainBlock(v15);
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
  {
    id v7 = "no";
    if (v3) {
      id v7 = "yes";
    }
    unsigned __int8 v12 = v7;
    v13 = v5;
    LogPrintF();
  }
  id v8 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  unsigned __int8 v9 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v12, v13);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    if (v5)
    {
      [(BTShareAudioSessionDaemon *)v5 userConfirmed:v3];
    }
    else
    {
      uint64_t v10 = NSErrorF();
      v11 = (void *)v17[5];
      v17[5] = v10;
    }
  }
  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v16, 8);
}

- (BTAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (BTServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (BTShareAudioSessionDaemon)shareAudioSession
{
  return self->_shareAudioSession;
}

- (void)setShareAudioSession:(id)a3
{
}

- (BTSmartRoutingDaemon)smartRoutingSession
{
  return self->_smartRoutingSession;
}

- (void)setSmartRoutingSession:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_smartRoutingSession, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);

  objc_storeStrong((id *)&self->_audioSession, 0);
}

@end