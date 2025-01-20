@interface ULXPCProtocols
+ (id)requestInterface;
+ (id)responseInterface;
@end

@implementation ULXPCProtocols

+ (id)requestInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2704DCF20];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_queryServicesWithReply_ argumentIndex:0 ofReply:1];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_exportDatabaseWithReply_ argumentIndex:0 ofReply:1];
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v13 forSelector:sel_requestMicroLocationRecordingScanWithAdditionalInformation_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v13 forSelector:sel_requestCurrentMicroLocationWithAdditionalInformation_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)responseInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2704DCF80];
  [v2 setClass:objc_opt_class() forSelector:sel_didUpdatePrediction_ argumentIndex:0 ofReply:0];

  return v2;
}

@end