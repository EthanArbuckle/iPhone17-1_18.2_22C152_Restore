@interface USTrackingAgentConnection
+ (id)newConnection;
+ (id)newInterface;
@end

@implementation USTrackingAgentConnection

+ (id)newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.UsageTrackingAgent" options:4096];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C997AB0];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_startMonitoringActivity_withSchedule_events_forClient_withExtension_replyHandler_ argumentIndex:1 ofReply:0];
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "initWithObjects:", v5, v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_startMonitoringActivity_withSchedule_events_forClient_withExtension_replyHandler_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v3 forSelector:sel_fetchScheduleForActivity_withClient_replyHandler_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v7 forSelector:sel_fetchEventsForActivity_withClient_replyHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

@end