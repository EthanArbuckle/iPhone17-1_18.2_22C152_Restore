@interface WCM_UCMClientController
- (int)getMyClientType;
- (void)handleMessage:(id)a3;
@end

@implementation WCM_UCMClientController

- (int)getMyClientType
{
  +[WCM_Logging logLevel:2, @"getMyClientType,myProcessID: %d", [(WCM_Controller *)self getProcessId] message];
  unsigned int v3 = [(WCM_Controller *)self getProcessId] - 35;
  if (v3 < 8 && ((0xE1u >> v3) & 1) != 0) {
    return dword_1001EB0F0[v3];
  }
  +[WCM_Logging logLevel:2 message:@"myClientType: UCMClientUnknown"];
  return 0;
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:2, @"Received UCMClient message-id: %lld", uint64 message];
    switch(uint64)
    {
      case 0xAF2uLL:
        id v5 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];
        [v5 getHomeKitBtLoad:a3];
        break;
      case 0xAF3uLL:
      case 0xAF6uLL:
        goto LABEL_13;
      case 0xAF4uLL:
        id v8 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];
        [v8 enableHomeKitTimer:a3];
        break;
      case 0xAF5uLL:
        id v9 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];
        [v9 enableFrequencyUpdatesForMic:a3];
        break;
      case 0xAF7uLL:
        id v10 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];
        [v10 enableULFrequencyUpdates:a3];
        break;
      default:
        if (uint64 == 2300)
        {
          id v6 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];
          [v6 postBTConnectedDevices:v7];
        }
        else
        {
LABEL_13:
          +[WCM_Logging logLevel:0, @"UCMClient controller dropping message-id %lld", uint64 message];
        }
        break;
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Received empty UCMClient messageId."];
  }
}

@end