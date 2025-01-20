@interface SDShareSheetRecipientServer
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)activate;
- (void)invalidate;
- (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4;
- (void)requestRecipientsForSessionID:(id)a3 completionHandler:(id)a4;
@end

@implementation SDShareSheetRecipientServer

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetRecipientServer;
  [(SDXPCDaemon *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetRecipientServer;
  [(SDXPCDaemon *)&v2 _invalidate];
}

- (id)machServiceName
{
  return @"com.apple.sharing.sharesheetrecipients";
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"com.apple.sharesheet.recipients"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 BOOLValue])
  {
    v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      unsigned int v9 = [v3 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Allowing connection from pid %d to sharingd recipient server", (uint8_t *)&v8, 8u);
    }
    BOOL v6 = 1;
  }
  else
  {
    v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      unsigned int v9 = [v3 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "process %d tried to connect to the sharingd recipient server, but it was not entitled!", (uint8_t *)&v8, 8u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIActivityRecipientInterface];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIActivityRecipientInterface];
}

- (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SDShareSheetSlotManager sharedManager];
  [v7 requestMessagesRecipientInfoForSessionID:v6 completionHandler:v5];
}

- (void)requestRecipientsForSessionID:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = +[SDShareSheetSlotManager sharedManager];
    int v8 = [v9 recipientHandlesForSessionID:v7];

    (*((void (**)(id, void *))a4 + 2))(v6, v8);
  }
}

@end