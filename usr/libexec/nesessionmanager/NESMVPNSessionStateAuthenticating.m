@interface NESMVPNSessionStateAuthenticating
- (NESMVPNSessionStateAuthenticating)init;
- (void)enterWithSession:(id)a3;
- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateAuthenticating

- (void)handleTimeout
{
  v11.receiver = self;
  v11.super_class = (Class)NESMVPNSessionStateAuthenticating;
  [(NESMVPNSessionState *)&v11 handleTimeout];
  if (self)
  {
    [objc_getProperty(self, v3, 16, 1) authenticationPlugin];
    v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    sub_100017968(v4, v5);

    [objc_getProperty(self, v6, 16, 1) setLastStopReason:11];
    id Property = objc_getProperty(self, v7, 16, 1);
  }
  else
  {
    v9 = [0 authenticationPlugin];
    sub_100017968(v9, v10);

    [0 setLastStopReason:11];
    id Property = 0;
  }
  [Property setState:5];
}

- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  v40.receiver = self;
  v40.super_class = (Class)NESMVPNSessionStateAuthenticating;
  objc_super v11 = a3;
  [(NESMVPNSessionState *)&v40 handlePlugin:v11 authenticationCompleteWithResults:v10 status:v7 andError:a6];
  sub_100017968(v11, v12);

  if (v7 && !a6)
  {
    if (!v10)
    {
      if (v7 == 2)
      {
        if (self)
        {
          id Property = objc_getProperty(self, v13, 16, 1);
          [Property setLastStopReason:8 v40.receiver, v40.super_class];
          [objc_getProperty(self, v27, 16, 1) setState:5];
          id v29 = objc_getProperty(self, v28, 16, 1);
        }
        else
        {
          [0 setLastStopReason:8 v40.receiver, v40.super_class];
          [0 setState:5];
          id v29 = 0;
        }
        sub_100081564(v29, (id)2);
      }
      goto LABEL_27;
    }
    if (self) {
      id v14 = objc_getProperty(self, v13, 16, 1);
    }
    else {
      id v14 = 0;
    }
    v15 = [v14 extensibleSSOProvider:v40.receiver super_class:v40.super_class];

    if (v15)
    {
      v16 = [v10 objectForKeyedSubscript:@"extensible-sso-credential-certificate"];
      int v17 = isa_nsdata();

      if (!v17)
      {
LABEL_27:
        if (self) {
          id v24 = objc_getProperty(self, v13, 16, 1);
        }
        else {
          id v24 = 0;
        }
        uint64_t v25 = 3;
        goto LABEL_30;
      }
      v19 = [v10 objectForKeyedSubscript:@"extensible-sso-credential-certificate"];
      if (self) {
        id v20 = objc_getProperty(self, v18, 16, 1);
      }
      else {
        id v20 = 0;
      }
      v21 = [v20 protocol];
      [v21 setIdentityReferenceInternal:v19];
    }
    else
    {
      v30 = [v10 objectForKeyedSubscript:@"AuthName"];
      int v31 = isa_nsstring();

      if (v31)
      {
        v33 = [v10 objectForKeyedSubscript:@"AuthName"];
        if (self) {
          id v34 = objc_getProperty(self, v32, 16, 1);
        }
        else {
          id v34 = 0;
        }
        v35 = [v34 connectParameters];
        [v35 setObject:v33 forKeyedSubscript:@"AccountName"];
      }
      v36 = [v10 objectForKeyedSubscript:@"AuthCredentialPassword"];
      int v37 = isa_nsstring();

      if (!v37) {
        goto LABEL_27;
      }
      v19 = [v10 objectForKeyedSubscript:@"AuthCredentialPassword"];
      if (self) {
        id v39 = objc_getProperty(self, v38, 16, 1);
      }
      else {
        id v39 = 0;
      }
      v21 = [v39 connectParameters];
      [v21 setObject:v19 forKeyedSubscript:@"Password"];
    }

    goto LABEL_27;
  }
  if (self)
  {
    id v22 = objc_getProperty(self, v13, 16, 1);
    [v22 setLastStopReason:7 v40.receiver, v40.super_class];
    id v24 = objc_getProperty(self, v23, 16, 1);
  }
  else
  {
    [0 setLastStopReason:7 v40.receiver, v40.super_class];
    id v24 = 0;
  }
  uint64_t v25 = 5;
LABEL_30:
  [v24 setState:v25, v40.receiver, v40.super_class];
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v28.receiver = self;
  v28.super_class = (Class)NESMVPNSessionStateAuthenticating;
  id v9 = a3;
  [(NESMVPNSessionState *)&v28 handlePlugin:v9 didStartWithPID:v5 error:v8];
  if (self) {
    id Property = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id Property = 0;
  }
  [Property authenticationPlugin:v28.receiver super_class:v28.super_class];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v9) {
    goto LABEL_25;
  }
  if ((int)v5 <= 0)
  {
    if (v8)
    {
      id v14 = [v8 domain];
      if ([v14 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v15 = [v8 code];

        if (v15 == (id)2)
        {
          if (self) {
            id v16 = objc_getProperty(self, v13, 16, 1);
          }
          else {
            id v16 = 0;
          }
          uint64_t v17 = 6;
LABEL_15:
          [v16 setLastStopReason:v17];
          if (self) {
            id v19 = objc_getProperty(self, v18, 16, 1);
          }
          else {
            id v19 = 0;
          }
          [v19 setState:5];
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    if (self) {
      id v16 = objc_getProperty(self, v13, 16, 1);
    }
    else {
      id v16 = 0;
    }
    uint64_t v17 = 7;
    goto LABEL_15;
  }
LABEL_18:
  if (self) {
    id v20 = objc_getProperty(self, v13, 16, 1);
  }
  else {
    id v20 = 0;
  }
  id v22 = [v20 authenticationPlugin];
  if (self) {
    id v23 = objc_getProperty(self, v21, 16, 1);
  }
  else {
    id v23 = 0;
  }
  id v24 = [v23 connectParameters];
  uint64_t v25 = v24;
  if (v22)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100018394;
    v30[3] = &unk_1000C6AE0;
    v30[4] = v22;
    id v26 = v24;
    SEL v27 = [v22 remotePluginObjectWithErrorHandler:v30];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001844C;
    v29[3] = &unk_1000C57D8;
    v29[4] = v22;
    [v27 authenticateWithParameters:v26 completionHandler:v29];
  }
LABEL_25:
}

- (void)enterWithSession:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NESMVPNSessionStateAuthenticating;
  [(NESMVPNSessionState *)&v15 enterWithSession:a3];
  if (self)
  {
    if (!objc_msgSend(objc_getProperty(self, v4, 16, 1), "prepareConfigurationForStart"))
    {
LABEL_8:
      [objc_getProperty(self, v5, 16, 1) setLastStopReason:7];
      id Property = objc_getProperty(self, v12, 16, 1);
LABEL_9:
      [Property setState:5];
      return;
    }
    id v6 = objc_getProperty(self, v5, 16, 1);
  }
  else
  {
    unsigned __int8 v14 = [0 prepareConfigurationForStart];
    id v6 = 0;
    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
  }
  id v8 = [v6 authenticationPlugin];
  if (self) {
    id v9 = objc_getProperty(self, v7, 16, 1);
  }
  else {
    id v9 = 0;
  }
  id v10 = [v9 configuration];
  BOOL v11 = sub_10001689C(v8, v10);

  if (!v11)
  {
    if (self) {
      goto LABEL_8;
    }
LABEL_12:
    [0 setLastStopReason:7];
    id Property = 0;
    goto LABEL_9;
  }
}

- (NESMVPNSessionStateAuthenticating)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateAuthenticating;
  return [(NESMVPNSessionState *)&v3 initWithType:7 andTimeout:120];
}

@end