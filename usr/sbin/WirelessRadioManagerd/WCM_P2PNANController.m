@interface WCM_P2PNANController
- (BOOL)mNanEnabled;
- (WCM_P2PNANController)init;
- (void)dealloc;
- (void)handleDisconnection:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handleNANOn:(id)a3;
- (void)setMNanEnabled:(BOOL)a3;
@end

@implementation WCM_P2PNANController

- (WCM_P2PNANController)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_P2PNANController;
  v2 = [(WCM_Controller *)&v5 init];
  v3 = v2;
  if (v2) {
    *((unsigned char *)&v2->super.mProcessId + 4) = 0;
  }
  +[WCM_Logging logLevel:2 message:@"P2PNANController Init"];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCM_P2PNANController;
  [(WCM_Controller *)&v2 dealloc];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:2, @"Received P2PNAN message-id: %lld", uint64 message];
    if (uint64 == 2701)
    {
      [(WCM_P2PNANController *)self handleNANOn:a3];
    }
    else
    {
      +[WCM_Logging logLevel:0, @"P2P NAN controller dropping message-id %lld", uint64 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Received empty P2PNAN messageId."];
  }
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"P2PNANController handleDisconnection"];
  [(WCM_P2PNANController *)self setMNanEnabled:0];
  id v4 = +[WCM_PolicyManager singleton];

  [v4 updateControllerState:2703];
}

- (void)handleNANOn:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "kMessageArgs");
  BOOL v5 = xpc_dictionary_get_BOOL(dictionary, "kWCMP2PNANOn");
  +[WCM_Logging logLevel:2, @"Received from P2P NAN Controller NANOn:(%d -> %d)", [(WCM_P2PNANController *)self mNanEnabled], v5 message];
  if (v5 != [(WCM_P2PNANController *)self mNanEnabled])
  {
    [(WCM_P2PNANController *)self setMNanEnabled:v5];
    id v6 = +[WCM_PolicyManager singleton];
    [v6 updateControllerState:2703];
  }
}

- (BOOL)mNanEnabled
{
  return *((unsigned char *)&self->super.mProcessId + 4);
}

- (void)setMNanEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 4) = a3;
}

@end