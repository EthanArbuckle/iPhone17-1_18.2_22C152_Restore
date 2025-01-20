@interface UNUserNotificationSettingsService
+ (id)clientInterface;
+ (id)serverInterface;
@end

@implementation UNUserNotificationSettingsService

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)clientInterface___interface;
  return v2;
}

void __52__UNUserNotificationSettingsService_clientInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C638A28];
  v1 = (void *)clientInterface___interface;
  clientInterface___interface = v0;

  v2 = (void *)clientInterface___interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_updateNotificationSourcesWithBundleIdentifiers_ argumentIndex:0 ofReply:0];

  v6 = (void *)clientInterface___interface;
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setClasses:v7 forSelector:sel_updateNotificationSystemSettings_ argumentIndex:0 ofReply:0];
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_52);
  }
  v2 = (void *)serverInterface___interface;
  return v2;
}

void __52__UNUserNotificationSettingsService_serverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C639080];
  v1 = (void *)serverInterface___interface;
  serverInterface___interface = v0;

  v2 = (void *)serverInterface___interface;
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_getNotificationSource_withCompletionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v4 = (void *)serverInterface___interface;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [v4 setClasses:v7 forSelector:sel_getNotificationSource_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v8 = (void *)serverInterface___interface;
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v8 setClasses:v11 forSelector:sel_getNotificationSources_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v12 = (void *)serverInterface___interface;
  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  [v12 setClasses:v16 forSelector:sel_getNotificationSources_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v17 = (void *)serverInterface___interface;
  v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
  [v17 setClasses:v22 forSelector:sel_getNotificationSourcesWithFilter_completionHandler_ argumentIndex:0 ofReply:1];

  v23 = (void *)serverInterface___interface;
  v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v23 setClasses:v24 forSelector:sel_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v25 = (void *)serverInterface___interface;
  v26 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v25 setClasses:v26 forSelector:sel_replaceNotificationSettings_forNotificationSourceIdentifier_ argumentIndex:0 ofReply:0];

  v27 = (void *)serverInterface___interface;
  v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v27 setClasses:v28 forSelector:sel_replaceNotificationSettings_forNotificationSourceIdentifier_ argumentIndex:1 ofReply:0];

  v29 = (void *)serverInterface___interface;
  v30 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v29 setClasses:v30 forSelector:sel_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier_ argumentIndex:0 ofReply:0];

  v31 = (void *)serverInterface___interface;
  v32 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v31 setClasses:v32 forSelector:sel_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier_ argumentIndex:1 ofReply:0];

  v33 = (void *)serverInterface___interface;
  v34 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v33 setClasses:v34 forSelector:sel_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier_ argumentIndex:2 ofReply:0];

  v35 = (void *)serverInterface___interface;
  v36 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v35 setClasses:v36 forSelector:sel_getNotificationSystemSettingsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v37 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  [v37 setClasses:v38 forSelector:sel_setNotificationSystemSettings_ argumentIndex:0 ofReply:0];
}

@end