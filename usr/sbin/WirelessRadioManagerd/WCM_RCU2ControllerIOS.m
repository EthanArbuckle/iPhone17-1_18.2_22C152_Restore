@interface WCM_RCU2ControllerIOS
- (WCM_RCU2ControllerIOS)init;
- (void)dealloc;
- (void)handleMessage:(id)a3;
- (void)handlePowerState:(BOOL)a3;
@end

@implementation WCM_RCU2ControllerIOS

- (WCM_RCU2ControllerIOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_RCU2ControllerIOS;
  v2 = [(WCM_RCU2Controller *)&v5 init];
  +[WCM_Logging logLevel:2 message:@"WCM_RCU2ControllerIOS:Init - Enter"];
  v3 = objc_alloc_init(WCM_CtrXPCClient);
  [(WCM_RCU2Controller *)v2 setThreadClient:v3];

  +[WCM_Logging logLevel:2 message:@"WCM_RCU2ControllerIOS:Init - Exit"];
  return v2;
}

- (void)dealloc
{
  [(WCM_RCU2Controller *)self setThreadClient:0];
  v3.receiver = self;
  v3.super_class = (Class)WCM_RCU2ControllerIOS;
  [(WCM_RCU2Controller *)&v3 dealloc];
}

- (void)handlePowerState:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_RCU2ControllerIOS;
  [(WCM_RCU2Controller *)&v3 handlePowerState:a3];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:2, @"In RCU2 Controller handleMessage messageId = %lld", uint64 message];
  if (uint64 == 1402)
  {
    id v5 = [(WCM_RCU2Controller *)self threadClient];
    [v5 HandleThreadStop];
  }
  else
  {
    if (uint64 != 1401)
    {
      +[WCM_Logging logLevel:0, @"RCU2 controller dropping message-id %lld", uint64 message];
      return;
    }
    id v5 = [(WCM_RCU2Controller *)self threadClient];
    [v5 HandleThreadStart];
  }
}

@end