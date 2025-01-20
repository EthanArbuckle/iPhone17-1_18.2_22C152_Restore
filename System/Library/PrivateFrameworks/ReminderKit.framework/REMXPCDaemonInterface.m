@interface REMXPCDaemonInterface
+ (NSXPCInterface)interface;
@end

@implementation REMXPCDaemonInterface

+ (NSXPCInterface)interface
{
  if (interface_onceToken_3 != -1) {
    dispatch_once(&interface_onceToken_3, &__block_literal_global_29);
  }
  v2 = (void *)interface_sInterface;

  return (NSXPCInterface *)v2;
}

void __34__REMXPCDaemonInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F139A610];
  v1 = (void *)interface_sInterface;
  interface_sInterface = v0;

  v2 = (void *)interface_sInterface;
  v3 = +[REMXPCChangeTrackingPerformerInterface interface];
  [v2 setInterface:v3 forSelector:sel_changeTrackingPerformerWithStoreContainerToken_reason_completion_ argumentIndex:0 ofReply:1];

  v4 = (void *)interface_sInterface;
  v5 = +[REMXPCDebugPerformerInterface interface];
  [v4 setInterface:v5 forSelector:sel_debugPerformerWithStoreContainerToken_reason_completion_ argumentIndex:0 ofReply:1];

  v6 = (void *)interface_sInterface;
  v7 = +[REMXPCStorePerformerInterface interface];
  [v6 setInterface:v7 forSelector:sel_storePerformerWithProcessName_storeContainerToken_reason_completion_ argumentIndex:0 ofReply:1];

  v8 = (void *)interface_sInterface;
  v9 = +[REMXPCSyncInterfacePerformerInterface interface];
  [v8 setInterface:v9 forSelector:sel_syncInterfacePerformerWithReason_completion_ argumentIndex:0 ofReply:1];

  v10 = (void *)interface_sInterface;
  id v11 = +[REMXPCIndexingPerformerInterface interface];
  [v10 setInterface:v11 forSelector:sel_indexingPerformerWithReason_completion_ argumentIndex:0 ofReply:1];
}

@end