@interface SKIPhoneInvocation
+ (id)announceDropInCallForType:(int64_t)a3;
+ (id)announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:(id)a3;
+ (id)announceHomeAnnouncementRequestFromApp:(id)a3 withAnnouncementIdentifier:(id)a4 withUserNotificationType:(int64_t)a5 synchronousBurstIndex:(id)a6;
+ (id)announceIncomingCallNotificationRequest:(id)a3;
+ (id)announceIncomingCallerRequestForCallID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleId:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9 isBobbleCapableAnnouncement:(BOOL)a10;
+ (id)announceIncomingCallerRequestForCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleId:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9;
+ (id)announcePayloadFromUserData:(id)a3;
+ (id)announceVoicemailRequestForAnnounceDirectInvocationPayload:(id)a3;
+ (id)readHomeAnnouncementRequestFromApp:(id)a3;
+ (id)startPhoneCallRequestFromApp:(id)a3;
@end

@implementation SKIPhoneInvocation

+ (id)announceHomeAnnouncementRequestFromApp:(id)a3 withAnnouncementIdentifier:(id)a4 withUserNotificationType:(int64_t)a5 synchronousBurstIndex:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.homeCommunication.announce.notification"];
  v13 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v9 length]) {
    [v13 setObject:v9 forKeyedSubscript:@"appBundleId"];
  }
  if ([v10 length]) {
    [v13 setObject:v10 forKeyedSubscript:@"announcementId"];
  }
  v14 = [NSNumber numberWithInteger:a5];
  [v13 setObject:v14 forKeyedSubscript:@"notificationType"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v13 setObject:v11 forKeyedSubscript:@"synchronousBurstIndex"];
  }
  [(SKIDirectInvocationPayload *)v12 setUserData:v13];
  v15 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v16 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v15 payload:v12];
  v17 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v16];

  return v17;
}

+ (id)readHomeAnnouncementRequestFromApp:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.homeCommunication.read"];
  if ([v3 length])
  {
    id v10 = @"appBundleId";
    v11[0] = v3;
    v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [(SKIDirectInvocationPayload *)v4 setUserData:v5];
  }
  v6 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  v7 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v6 payload:v4];
  v8 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v7];

  return v8;
}

+ (id)announceIncomingCallerRequestForCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleId:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9
{
  LOWORD(v10) = a9;
  return (id)objc_msgSend(a1, "announceIncomingCallerRequestForCallID:callProviderIdentifier:callProviderBundleId:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:isBobbleCapableAnnouncement:", a3, a4, a5, a6, a7, a8, v10);
}

+ (id)announceIncomingCallerRequestForCallID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleId:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9 isBobbleCapableAnnouncement:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v15 = a10;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v31 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v21 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.phone.identifyIncomingCaller"];
  v22 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:9];
  if ([v16 length]) {
    [v22 setValue:v16 forKey:@"callUUID"];
  }
  if ([v17 length]) {
    [v22 setValue:v17 forKey:@"callProviderIdentifier"];
  }
  if ([v18 length]) {
    [v22 setValue:v18 forKey:@"callProviderBundleId"];
  }
  if ([v19 count]) {
    [v22 setValue:v19 forKey:@"callerContactIdentifiers"];
  }
  if (v20)
  {
    v23 = [v20 value];
    [v22 setValue:v23 forKey:@"handleValue"];

    v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "type"));
    [v22 setValue:v24 forKey:@"handleType"];

    BOOL v15 = a10;
  }
  v25 = [NSNumber numberWithBool:v10];
  [v22 setValue:v25 forKey:@"isVideo"];

  v26 = [NSNumber numberWithBool:a9];
  [v22 setValue:v26 forKey:@"isCallerIDBlocked"];

  v27 = [NSNumber numberWithBool:v15];
  [v22 setValue:v27 forKey:@"isBobbleCapableAnnouncement"];

  [(SKIDirectInvocationPayload *)v21 setUserData:v22];
  v28 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v31 payload:v21];
  v29 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v28];

  return v29;
}

+ (id)announceIncomingCallNotificationRequest:(id)a3
{
  id v3 = a3;
  v4 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v5 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.phone.announceIncomingCallNotification"];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:8];
  v7 = [v3 notification];

  if (v7)
  {
    v8 = (void *)MEMORY[0x263F08910];
    id v9 = [v3 notification];
    id v31 = 0;
    BOOL v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v31];
    id v11 = v31;

    if (v11)
    {
      v12 = SKIDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[SKIPhoneInvocation announceIncomingCallNotificationRequest:]();
      }
    }
    [v6 setValue:v10 forKey:@"notification"];
  }
  v13 = [v3 appBundleId];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    BOOL v15 = [v3 appBundleId];
    [v6 setValue:v15 forKey:@"appBundleId"];
  }
  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  [v6 setValue:v16 forKey:@"synchronousBurstIndex"];

  id v17 = [v3 appBundleIdOfLastAnnouncement];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    id v19 = [v3 appBundleIdOfLastAnnouncement];
    [v6 setValue:v19 forKey:@"appBundleIdOfLastAnnouncement"];
  }
  id v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  [v6 setValue:v20 forKey:@"isSameTypeAsLastAnnouncement"];

  v21 = NSNumber;
  [v3 timeSinceLastAnnouncement];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  [v6 setValue:v22 forKey:@"timeSinceLastAnnouncement"];

  v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  [v6 setValue:v23 forKey:@"announcePlatform"];

  id v30 = 0;
  v24 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v30];
  id v25 = v30;
  if (v24)
  {
    [v6 setValue:v24 forKey:@"announcePayload"];
  }
  else
  {
    v26 = SKIDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[SKIPhoneInvocation announceIncomingCallNotificationRequest:]();
    }
  }
  [(SKIDirectInvocationPayload *)v5 setUserData:v6];
  v27 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v4 payload:v5];
  v28 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v27];

  return v28;
}

+ (id)startPhoneCallRequestFromApp:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.phone.startPhoneCall"];
  if ([v3 length])
  {
    BOOL v10 = @"appBundleId";
    v11[0] = v3;
    v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [(SKIDirectInvocationPayload *)v4 setUserData:v5];
  }
  v6 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  v7 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v6 payload:v4];
  v8 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v7];

  return v8;
}

+ (id)announceVoicemailRequestForAnnounceDirectInvocationPayload:(id)a3
{
  id v3 = a3;
  id v30 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v4 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.phone.announceVoicemail"];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:9];
  v6 = [v3 notification];
  v7 = [v6 request];
  v8 = [v7 content];

  v29 = v8;
  id v9 = [v8 userInfo];
  uint64_t v10 = [v9 valueForKey:@"VMVoicemailIdentifier"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v5 setValue:v10 forKey:@"VMVoicemailIdentifier"];
  }
  id v11 = [v9 valueForKey:@"MessageIdentifier"];
  if ([v11 length]) {
    [v5 setValue:v11 forKey:@"MessageIdentifier"];
  }
  v27 = v11;
  v28 = (void *)v10;
  v12 = [v9 valueForKey:@"contactInfo"];
  if ([v12 length]) {
    [v5 setValue:v12 forKey:@"contactInfo"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  [v5 setValue:v13 forKey:@"synchronousBurstIndex"];

  uint64_t v14 = [v3 appBundleIdOfLastAnnouncement];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    id v16 = [v3 appBundleIdOfLastAnnouncement];
    [v5 setValue:v16 forKey:@"appBundleIdOfLastAnnouncement"];
  }
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  [v5 setValue:v17 forKey:@"isSameTypeAsLastAnnouncement"];

  uint64_t v18 = NSNumber;
  [v3 timeSinceLastAnnouncement];
  id v19 = objc_msgSend(v18, "numberWithDouble:");
  [v5 setValue:v19 forKey:@"timeSinceLastAnnouncement"];

  id v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  [v5 setValue:v20 forKey:@"announcePlatform"];

  id v31 = 0;
  v21 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v31];
  id v22 = v31;
  if (v21)
  {
    [v5 setValue:v21 forKey:@"announcePayload"];
  }
  else
  {
    v23 = SKIDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[SKIPhoneInvocation announceIncomingCallNotificationRequest:]();
    }
  }
  [(SKIDirectInvocationPayload *)v4 setUserData:v5];
  v24 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v30 payload:v4];
  id v25 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v24];

  return v25;
}

+ (id)announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v5 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.phone.announceGroupFaceTimeInvite"];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:11];
  v7 = [v3 notification];
  v8 = [v7 request];

  id v9 = [v8 content];
  uint64_t v10 = [v9 userInfo];
  id v11 = [v10 valueForKey:@"remoteParticipantHandles"];
  if ([v11 count]) {
    [v6 setValue:v11 forKey:@"remoteParticipantHandles"];
  }
  v37 = v10;
  v12 = [v10 valueForKey:@"activeParticipantHandles"];
  if ([v12 count]) {
    [v6 setValue:v12 forKey:@"activeParticipantHandles"];
  }
  v36 = v12;
  v13 = [v9 defaultActionURL];
  uint64_t v14 = [v13 absoluteString];

  if ([v14 length]) {
    [v6 setValue:v14 forKey:@"defaultActionURL"];
  }
  uint64_t v15 = [v9 subtitle];
  if ([v15 length]) {
    [v6 setValue:v15 forKey:@"subtitle"];
  }
  v35 = v14;
  v38 = v9;
  v39 = v8;
  id v16 = [v8 identifier];
  if ([v16 length]) {
    [v6 setValue:v16 forKey:@"identifier"];
  }
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  [v6 setValue:v17 forKey:@"synchronousBurstIndex"];

  uint64_t v18 = [v3 appBundleIdOfLastAnnouncement];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    id v20 = [v3 appBundleIdOfLastAnnouncement];
    [v6 setValue:v20 forKey:@"appBundleIdOfLastAnnouncement"];
  }
  v34 = v16;
  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  [v6 setValue:v21 forKey:@"isSameTypeAsLastAnnouncement"];

  id v22 = NSNumber;
  [v3 timeSinceLastAnnouncement];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  [v6 setValue:v23 forKey:@"timeSinceLastAnnouncement"];

  v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  [v6 setValue:v24 forKey:@"announcePlatform"];

  id v40 = 0;
  id v25 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v40];
  id v26 = v40;
  v27 = v15;
  if (v25)
  {
    v28 = v11;
    [v6 setValue:v25 forKey:@"announcePayload"];
  }
  else
  {
    v29 = SKIDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[SKIPhoneInvocation announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:]();
    }
    v28 = v11;
  }
  [(SKIDirectInvocationPayload *)v5 setUserData:v6];
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v4 payload:v5];
  v31 = id v30 = (void *)v4;
  v32 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v31];

  return v32;
}

+ (id)announceDropInCallForType:(int64_t)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.phone.announceCallBell"];
  if (a3)
  {
    id v11 = @"announcementType";
    v5 = [NSNumber numberWithInteger:a3];
    v12[0] = v5;
    v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(SKIDirectInvocationPayload *)v4 setUserData:v6];
  }
  v7 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v8 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v7 payload:v4];
  id v9 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v8];

  return v9;
}

+ (id)announcePayloadFromUserData:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"announcePayload"];
  id v8 = 0;
  uint64_t v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = SKIDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SKIPhoneInvocation announcePayloadFromUserData:]();
    }
  }

  return v4;
}

+ (void)announceIncomingCallNotificationRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "error archiving SKIAnnounceNotificationDirectInvocationPayload for SKIPhoneInvocation: %@", v2, v3, v4, v5, v6);
}

+ (void)announceIncomingCallNotificationRequest:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "Error archiving UNNotification %@", v2, v3, v4, v5, v6);
}

+ (void)announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "error archving SKIAnnounceNotificationDirectInvocationPayload for SKIPhoneInvocation: %@", v2, v3, v4, v5, v6);
}

+ (void)announcePayloadFromUserData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "error unarchiving SKIAnnounceNotificationDirectInvocationPayload from userData for SKIPhoneInvocation: %@", v2, v3, v4, v5, v6);
}

@end