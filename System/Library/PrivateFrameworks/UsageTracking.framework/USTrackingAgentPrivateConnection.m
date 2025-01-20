@interface USTrackingAgentPrivateConnection
+ (BOOL)connectionHasFamilyControlsEntitlement:(id)a3;
+ (BOOL)connectionHasPrivateEntitlement:(id)a3;
+ (id)newConnection;
+ (id)newInterface;
@end

@implementation USTrackingAgentPrivateConnection

+ (id)newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.UsageTrackingAgent.private" options:4096];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C997CA8];
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_fetchReportsDuringInterval_partitionInterval_replyHandler_ argumentIndex:1 ofReply:1];
  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);

  [v2 setClasses:v10 forSelector:sel_fetchReportsDuringInterval_partitionInterval_replyHandler_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v10 forSelector:sel_fetchReportsDuringInterval_partitionInterval_replyHandler_ argumentIndex:2 ofReply:1];
  id v11 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_replyHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (BOOL)connectionHasPrivateEntitlement:(id)a3
{
  id v3 = [a3 valueForEntitlement:@"com.apple.private.usage-tracking"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)connectionHasFamilyControlsEntitlement:(id)a3
{
  id v3 = [a3 valueForEntitlement:@"com.apple.developer.family-controls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end