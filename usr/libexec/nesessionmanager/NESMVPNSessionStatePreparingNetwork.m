@interface NESMVPNSessionStatePreparingNetwork
- (NESMVPNSessionStatePreparingNetwork)init;
- (void)enterWithSession:(id)a3;
- (void)handleNetworkPrepareResult:(id)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStatePreparingNetwork

- (void)handleTimeout
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  [(NESMVPNSessionState *)&v6 handleTimeout];
  if (self)
  {
    [objc_getProperty(self, v3, 16, 1) setLastStopReason:41];
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    [0 setLastStopReason:41];
    id Property = 0;
  }
  [Property setState:5];
}

- (void)handleNetworkPrepareResult:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  -[NESMVPNSessionState handleNetworkPrepareResult:](&v30, "handleNetworkPrepareResult:");
  if (!a3)
  {
    if (self)
    {
      id Property = objc_getProperty(self, v5, 16, 1);
      uint64_t v26 = 4;
LABEL_20:
      [Property setLastStopReason:v26];
      id v24 = objc_getProperty(self, v27, 16, 1);
LABEL_21:
      uint64_t v25 = 5;
      goto LABEL_22;
    }
    uint64_t v29 = 4;
LABEL_31:
    [0 setLastStopReason:v29];
    id v24 = 0;
    goto LABEL_21;
  }
  kdebug_trace();
  if (self)
  {
    unsigned int v7 = [objc_getProperty(self, v6, 16, 1) initializePlugins];
    id Property = objc_getProperty(self, v8, 16, 1);
    if (v7) {
      goto LABEL_4;
    }
    uint64_t v26 = 6;
    goto LABEL_20;
  }
  unsigned __int8 v28 = [0 initializePlugins];
  id Property = 0;
  if ((v28 & 1) == 0)
  {
    uint64_t v29 = 6;
    goto LABEL_31;
  }
LABEL_4:
  uint64_t v10 = [Property authenticationPlugin];
  if (!v10)
  {
LABEL_14:
    if (self) {
      id v24 = objc_getProperty(self, v11, 16, 1);
    }
    else {
      id v24 = 0;
    }
    uint64_t v25 = 3;
    goto LABEL_22;
  }
  v12 = (void *)v10;
  if (self) {
    id v13 = objc_getProperty(self, v11, 16, 1);
  }
  else {
    id v13 = 0;
  }
  uint64_t v14 = [v13 connectParameters];
  if (!v14) {
    goto LABEL_24;
  }
  v16 = (void *)v14;
  if (self) {
    id v17 = objc_getProperty(self, v15, 16, 1);
  }
  else {
    id v17 = 0;
  }
  v18 = [v17 connectParameters];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"Password"];
  if (!v19)
  {

LABEL_24:
    goto LABEL_25;
  }
  v21 = (void *)v19;
  if (self) {
    id v22 = objc_getProperty(self, v20, 16, 1);
  }
  else {
    id v22 = 0;
  }
  v23 = [v22 extensibleSSOProvider];

  if (!v23) {
    goto LABEL_14;
  }
LABEL_25:
  if (self) {
    id v24 = objc_getProperty(self, v11, 16, 1);
  }
  else {
    id v24 = 0;
  }
  uint64_t v25 = 7;
LABEL_22:
  [v24 setState:v25];
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  [(NESMVPNSessionState *)&v5 enterWithSession:v4];
  [v4 prepareNetwork];
}

- (NESMVPNSessionStatePreparingNetwork)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  return [(NESMVPNSessionState *)&v3 initWithType:2 andTimeout:0];
}

@end