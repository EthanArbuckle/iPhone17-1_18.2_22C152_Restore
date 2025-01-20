@interface WCM_P2PAWDLController
- (BOOL)mAwdlEnabled;
- (BOOL)mRealTimeAwdlTrafficEnabled;
- (WCM_P2PAWDLController)init;
- (void)dealloc;
- (void)handleAWDLOn:(id)a3;
- (void)handleAWDLRealTimeMode:(BOOL)a3;
- (void)handleDisconnection:(id)a3;
- (void)handleMessage:(id)a3;
- (void)setMAwdlEnabled:(BOOL)a3;
- (void)setMRealTimeAwdlTrafficEnabled:(BOOL)a3;
@end

@implementation WCM_P2PAWDLController

- (WCM_P2PAWDLController)init
{
  v7.receiver = self;
  v7.super_class = (Class)WCM_P2PAWDLController;
  v2 = [(WCM_Controller *)&v7 init];
  v3 = v2;
  if (v2)
  {
    BYTE4(v2->awdlStateMonitor) = 0;
    +[WCM_Logging logLevel:2 message:@"Creating AWDL State Monitor"];
    BYTE5(v3->awdlStateMonitor) = 0;
    id v4 = objc_alloc_init((Class)WiFiP2PAWDLStateMonitor);
    *(void *)(&v3->super.mProcessId + 1) = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100087618;
    v6[3] = &unk_10020DFD0;
    v6[4] = v3;
    [v4 setRealtimeModeUpdatedHandler:v6];
  }
  [*(id *)(&v3->super.mProcessId + 1) beginMonitoring];
  +[WCM_Logging logLevel:2 message:@"P2PAWDLController Init"];
  return v3;
}

- (void)dealloc
{
  [*(id *)(&self->super.mProcessId + 1) endMonitoring];

  v3.receiver = self;
  v3.super_class = (Class)WCM_P2PAWDLController;
  [(WCM_Controller *)&v3 dealloc];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:2, @"Received P2PAWDL message-id: %lld", uint64 message];
    if (uint64 == 2700)
    {
      [(WCM_P2PAWDLController *)self handleAWDLOn:a3];
    }
    else
    {
      +[WCM_Logging logLevel:0, @"P2P AWDL controller dropping message-id %lld", uint64 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Received empty P2PAWDL messageId."];
  }
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"P2PAWDLController handleDisconnection"];
  [(WCM_P2PAWDLController *)self setMAwdlEnabled:0];
  [(WCM_P2PAWDLController *)self setMRealTimeAwdlTrafficEnabled:0];
  [*(id *)(&self->super.mProcessId + 1) endMonitoring];

  *(void *)(&self->super.mProcessId + 1) = 0;
  id v4 = +[WCM_PolicyManager singleton];

  [v4 updateControllerState:2702];
}

- (void)handleAWDLRealTimeMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WCM_P2PAWDLController *)self mRealTimeAwdlTrafficEnabled] != a3)
  {
    +[WCM_Logging logLevel:2, @"Real Time AWDL State changed (%d -> %d)", [(WCM_P2PAWDLController *)self mRealTimeAwdlTrafficEnabled], v3 message];
    [(WCM_P2PAWDLController *)self setMRealTimeAwdlTrafficEnabled:v3];
    id v5 = +[WCM_PolicyManager singleton];
    [v5 updateControllerState:2702];
  }
}

- (void)handleAWDLOn:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "kMessageArgs");
  BOOL v5 = xpc_dictionary_get_BOOL(dictionary, "kWCMP2PAWDLOn");
  +[WCM_Logging logLevel:2, @"Received from P2P AWDL Controller AWDLOn:(%d -> %d)", [(WCM_P2PAWDLController *)self mAwdlEnabled], v5 message];
  if (v5 != [(WCM_P2PAWDLController *)self mAwdlEnabled])
  {
    [(WCM_P2PAWDLController *)self setMAwdlEnabled:v5];
    id v6 = +[WCM_PolicyManager singleton];
    [v6 updateControllerState:2702];
  }
}

- (BOOL)mAwdlEnabled
{
  return BYTE4(self->awdlStateMonitor);
}

- (void)setMAwdlEnabled:(BOOL)a3
{
  BYTE4(self->awdlStateMonitor) = a3;
}

- (BOOL)mRealTimeAwdlTrafficEnabled
{
  return BYTE5(self->awdlStateMonitor);
}

- (void)setMRealTimeAwdlTrafficEnabled:(BOOL)a3
{
  BYTE5(self->awdlStateMonitor) = a3;
}

@end