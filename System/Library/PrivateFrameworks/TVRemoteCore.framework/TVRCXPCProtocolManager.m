@interface TVRCXPCProtocolManager
+ (id)requestInterface;
+ (id)responseInterface;
@end

@implementation TVRCXPCProtocolManager

+ (id)requestInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA74BF8];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_fetchActiveMREndpointUIDWithCompletion_ argumentIndex:0 ofReply:1];
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_sendEvent_toDeviceWithIdentifier_options_response_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_sendEvent_toDeviceWithIdentifier_options_response_ argumentIndex:0 ofReply:1];
  v7 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v7 forSelector:sel_playItem_deviceIdentifier_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)responseInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA7EBF0];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_deviceUpdatedState_ argumentIndex:0 ofReply:0];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_deviceQueryUpdatedDiscoveredDevices_ argumentIndex:0 ofReply:0];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_suggestedDevices_ argumentIndex:0 ofReply:0];

  return v2;
}

@end