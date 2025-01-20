@interface NESMFilterSessionStateIdle
- (NESMFilterSessionStateIdle)init;
- (void)enterWithSession:(id)a3;
- (void)handleStartMessage:(id)a3;
@end

@implementation NESMFilterSessionStateIdle

- (void)handleStartMessage:(id)a3
{
  id v13 = a3;
  if (self)
  {
    id Property = objc_getProperty(self, v4, 16, 1);
    BOOL v7 = sub_1000769B4(Property, v6);
    id v9 = objc_getProperty(self, v8, 16, 1);
    if (v7)
    {
LABEL_3:
      uint64_t v10 = 2;
      goto LABEL_6;
    }
    [v9 setLastStopReason:6];
    id v9 = objc_getProperty(self, v11, 16, 1);
  }
  else
  {
    BOOL v12 = sub_1000769B4(0, v4);
    id v9 = 0;
    if (v12) {
      goto LABEL_3;
    }
    [0 setLastStopReason:6];
    id v9 = 0;
  }
  uint64_t v10 = 4;
LABEL_6:
  sub_100075D24((id *)v9, (const char *)v10);
}

- (void)enterWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NESMFilterSessionStateIdle;
  [(NESMFilterSessionState *)&v7 enterWithSession:a3];
  if (self) {
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else {
    id Property = 0;
  }
  v6 = [Property policySession];
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100031C74;
    v8[3] = &unk_1000C5AD0;
    v8[4] = v6;
    sub_10002EC18((uint64_t)NESMPolicyMasterSession, v8);
  }
}

- (NESMFilterSessionStateIdle)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateIdle;
  return [(NESMFilterSessionState *)&v3 initWithType:1 andTimeout:0];
}

@end