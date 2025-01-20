@interface SKIMessagesInvocation
+ (id)announceMessagesRequestFromAnnounceDirectInvocationPayload:(id)a3;
+ (id)announcePayloadFromUserData:(id)a3;
+ (id)beginSiriRequestForApp:(id)a3;
+ (id)composeNewMessageRequestInApp:(id)a3;
+ (id)composeNewMessageRequestToContact:(id)a3 phoneNumber:(id)a4 emailAddress:(id)a5 inApp:(id)a6;
+ (id)composeNewMessageRequestToHandles:(id)a3 inApp:(id)a4;
+ (id)composeReplyRequestToConversationIdentifier:(id)a3 inApp:(id)a4;
+ (id)makeParameterMetadataForIntent:(id)a3;
+ (id)makeParameterMetadataForParameterNamed:(id)a3;
+ (id)readMessagesRequestFromConversationIdentifier:(id)a3 inApp:(id)a4;
+ (id)readMessagesRequestFromNotificationIdentifier:(id)a3 fromApp:(id)a4;
+ (id)sendMessageFromInteractiveSnippetWithUpdatedContent:(id)a3 withContext:(id)a4;
+ (id)updateMessageContentFromInteractiveSnippet:(id)a3 withContext:(id)a4;
@end

@implementation SKIMessagesInvocation

+ (id)announceMessagesRequestFromAnnounceDirectInvocationPayload:(id)a3
{
  id v3 = a3;
  v4 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v5 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.AnnounceMessage"];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  v7 = [v3 notificationIdentifier];
  if ([v7 length]) {
    [v6 setValue:v7 forKey:@"notificationIdentifier"];
  }
  v8 = [v3 appBundleId];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    v10 = [v3 appBundleId];
    [v6 setValue:v10 forKey:@"appBundleId"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  [v6 setValue:v11 forKey:@"synchronousBurstIndex"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isMediaPlaying"));
  [v6 setValue:v12 forKey:@"isMediaPlaying"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  [v6 setValue:v13 forKey:@"announcePlatform"];

  id v20 = 0;
  v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v20];
  id v15 = v20;
  if (v14)
  {
    [v6 setValue:v14 forKey:@"announcePayload"];
  }
  else
  {
    v16 = SKIDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[SKIMessagesInvocation announceMessagesRequestFromAnnounceDirectInvocationPayload:]((uint64_t)v15, v16);
    }
  }
  [(SKIDirectInvocationPayload *)v5 setUserData:v6];
  v17 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v4 payload:v5];
  v18 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v17];

  return v18;
}

+ (id)announcePayloadFromUserData:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"announcePayload"];
  id v8 = 0;
  v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = SKIDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SKIMessagesInvocation announcePayloadFromUserData:]((uint64_t)v5, v6);
    }
  }

  return v4;
}

+ (id)readMessagesRequestFromNotificationIdentifier:(id)a3 fromApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  if ([v5 length]) {
    [v8 setValue:v5 forKey:@"notificationIdentifier"];
  }
  if ([v6 length]) {
    [v8 setValue:v6 forKey:@"appBundleId"];
  }
  uint64_t v9 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.ReadFromNotification"];
  [(SKIDirectInvocationPayload *)v9 setUserData:v8];
  v10 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v7 payload:v9];
  v11 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v10];

  return v11;
}

+ (id)readMessagesRequestFromConversationIdentifier:(id)a3 inApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  if ([v5 length]) {
    [v8 setValue:v5 forKey:@"conversationIdentifier"];
  }
  if ([v6 length]) {
    [v8 setValue:v6 forKey:@"appBundleId"];
  }
  uint64_t v9 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.ReadFromConversation"];
  [(SKIDirectInvocationPayload *)v9 setUserData:v8];
  v10 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v7 payload:v9];
  v11 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v10];

  return v11;
}

+ (id)composeNewMessageRequestInApp:(id)a3
{
  id v3 = a3;
  v4 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
  if ([v3 length]) {
    [v5 setValue:v3 forKey:@"appBundleId"];
  }
  id v6 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.NewMessage"];
  [(SKIDirectInvocationPayload *)v6 setUserData:v5];
  v7 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v4 payload:v6];
  id v8 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v7];

  return v8;
}

+ (id)composeNewMessageRequestToContact:(id)a3 phoneNumber:(id)a4 emailAddress:(id)a5 inApp:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  v14 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  if ([v12 length]) {
    [v14 setValue:v12 forKey:@"appBundleId"];
  }
  if ([v9 length]) {
    [v14 setValue:v9 forKey:@"contactName"];
  }
  if ([v10 length]) {
    [v14 setValue:v10 forKey:@"contactPhoneNumber"];
  }
  if ([v11 length]) {
    [v14 setValue:v11 forKey:@"contactEmailAddress"];
  }
  id v15 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.NewMessageToContact"];
  [(SKIDirectInvocationPayload *)v15 setUserData:v14];
  v16 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v13 payload:v15];
  v17 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v16];

  return v17;
}

+ (id)composeNewMessageRequestToHandles:(id)a3 inApp:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v22 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = [v12 value];
        v29 = v13;
        v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "type"));
        v30 = v14;
        id v15 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        [v6 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v9);
  }

  v27[0] = @"appBundleId";
  v27[1] = @"handles";
  v28[0] = v22;
  v28[1] = v6;
  v16 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v17 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.NewMessageToHandles"];
  [(SKIDirectInvocationPayload *)v17 setUserData:v16];
  v18 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  v19 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v18 payload:v17];
  id v20 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v19];

  return v20;
}

+ (id)composeReplyRequestToConversationIdentifier:(id)a3 inApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  if ([v5 length]) {
    [v8 setValue:v5 forKey:@"conversationIdentifier"];
  }
  if ([v6 length]) {
    [v8 setValue:v6 forKey:@"appBundleId"];
  }
  uint64_t v9 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.NewMessageToConversation"];
  [(SKIDirectInvocationPayload *)v9 setUserData:v8];
  uint64_t v10 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v7 payload:v9];
  id v11 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v10];

  return v11;
}

+ (id)updateMessageContentFromInteractiveSnippet:(id)a3 withContext:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.messages.MessageContentChangedViaSnippet"];
  id v12 = @"content";
  v13[0] = v6;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [(SKIDirectInvocationPayload *)v7 setUserData:v8];

  uint64_t v9 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v5 payload:v7];

  uint64_t v10 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v9];

  return v10;
}

+ (id)sendMessageFromInteractiveSnippetWithUpdatedContent:(id)a3 withContext:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.messages.MessageSendViaSnippet"];
  id v12 = @"content";
  v13[0] = v6;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [(SKIDirectInvocationPayload *)v7 setUserData:v8];

  uint64_t v9 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v5 payload:v7];

  uint64_t v10 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v9];

  return v10;
}

+ (id)beginSiriRequestForApp:(id)a3
{
  id v3 = a3;
  v4 = [[SKIMessagesGatekeeperPayload alloc] initWithAppBundleId:v3];

  id v5 = [(SKIMessagesGatekeeperPayload *)v4 invocationPayload];

  id v6 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  id v7 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v6 payload:v5];
  uint64_t v8 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v7];

  return v8;
}

+ (id)makeParameterMetadataForIntent:(id)a3
{
  v12[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"recipient"];
    v12[0] = v4;
    id v5 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"speakableGroupName"];
    v12[1] = v5;
    id v6 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"outgoingMessageType"];
    v12[2] = v6;
    id v7 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"content"];
    v12[3] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
LABEL_5:

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"recipient"];
    id v5 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"speakableGroupName", v4];
    v11[1] = v5;
    id v6 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"sender"];
    v11[2] = v6;
    id v7 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"attribute"];
    v11[3] = v7;
    uint64_t v9 = +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:@"dateTimeRange"];
    v11[4] = v9;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];

    goto LABEL_5;
  }
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
LABEL_7:

  return v8;
}

+ (id)makeParameterMetadataForParameterNamed:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F64A30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setParameterName:v4];

  [v5 setShouldResolve:1];

  return v5;
}

+ (void)announceMessagesRequestFromAnnounceDirectInvocationPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D851000, a2, OS_LOG_TYPE_ERROR, "error archiving SKIAnnounceNotificationDirectInvocationPayload for SKIMessagesInvocation: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)announcePayloadFromUserData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D851000, a2, OS_LOG_TYPE_ERROR, "error unarchiving SKIAnnounceNotificationDirectInvocationPayload from userData for SKIMessagesInvocation: %@", (uint8_t *)&v2, 0xCu);
}

@end