@interface TURTCCallReporter
- (NSMutableDictionary)callUUIDToConversation;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TURTCCallReporter)initWithCallCenter:(id)a3;
- (id)clientName:(id)a3;
- (id)reportingSessionForCall:(id)a3 withConversation:(id)a4;
- (id)rtcCallInfoDictionary:(id)a3 withConversation:(id)a4;
- (id)serviceName:(id)a3 withConversation:(id)a4;
- (void)callStatusChangedNotification:(id)a3;
- (void)report:(id)a3 withConversation:(id)a4;
@end

@implementation TURTCCallReporter

- (TURTCCallReporter)initWithCallCenter:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TURTCCallReporter;
  v6 = [(TURTCCallReporter *)&v13 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.rtcreporting", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    callUUIDToConversation = v6->_callUUIDToConversation;
    v6->_callUUIDToConversation = v9;

    objc_storeStrong((id *)&v6->_callCenter, a3);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel_callStatusChangedNotification_ name:@"TUCallCenterCallStatusChangedNotification" object:0];
    [v11 addObserver:v6 selector:sel_callStatusChangedNotification_ name:@"TUCallCenterVideoCallStatusChangedNotification" object:0];
  }
  return v6;
}

- (void)callStatusChangedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2112;
    id v23 = v4;
    id v6 = v21;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "RTCReporter: %@ is handling %@", buf, 0x16u);
  }
  dispatch_queue_t v7 = [v4 object];
  v8 = [v7 callUUID];

  if (!v8)
  {
    v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v7;
      id v12 = v11;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "%@ is ignoring notification because callUUID is nil: %@", buf, 0x16u);
    }
    goto LABEL_12;
  }
  if ([v7 status] != 6)
  {
    if (![v7 isConversation]) {
      goto LABEL_13;
    }
    objc_super v13 = [(TURTCCallReporter *)self callCenter];
    v10 = [v13 activeConversationForCall:v7];

    if (v10)
    {
      v14 = [(TURTCCallReporter *)self queue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__TURTCCallReporter_callStatusChangedNotification___block_invoke_2;
      v15[3] = &unk_1E58E6258;
      v15[4] = self;
      id v16 = v7;
      v17 = v10;
      dispatch_async(v14, v15);
    }
LABEL_12:

    goto LABEL_13;
  }
  if ([v7 disconnectedReason] == 11)
  {
    v9 = [(TURTCCallReporter *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__TURTCCallReporter_callStatusChangedNotification___block_invoke;
    block[3] = &unk_1E58E5C08;
    block[4] = self;
    id v19 = v7;
    dispatch_async(v9, block);
  }
LABEL_13:
}

void __51__TURTCCallReporter_callStatusChangedNotification___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 callUUIDToConversation];
  id v5 = [*(id *)(a1 + 40) callUUID];
  id v6 = [v4 objectForKeyedSubscript:v5];
  [v2 report:v3 withConversation:v6];

  id v8 = [*(id *)(a1 + 32) callUUIDToConversation];
  dispatch_queue_t v7 = [*(id *)(a1 + 40) callUUID];
  [v8 setObject:0 forKeyedSubscript:v7];
}

void __51__TURTCCallReporter_callStatusChangedNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) callUUIDToConversation];
  uint64_t v3 = [*(id *)(a1 + 40) callUUID];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (void)report:(id)a3 withConversation:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TURTCCallReporter *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(TURTCCallReporter *)self reportingSessionForCall:v7 withConversation:v6];
  v10 = [(TURTCCallReporter *)self rtcCallInfoDictionary:v7 withConversation:v6];

  v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "RTCReporter: Reporting message with session %@ userInfo %@", buf, 0x16u);
  }

  id v14 = 0;
  [v9 sendMessageWithDictionary:v10 error:&v14];
  id v12 = v14;
  if (v12)
  {
    objc_super v13 = TUDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] RTCReporter: Error while sending message with error: %@", buf, 0xCu);
    }
  }
}

- (id)rtcCallInfoDictionary:(id)a3 withConversation:(id)a4
{
  v76[10] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TURTCCallReporter *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1E4F1CA60];
  v75[0] = *MEMORY[0x1E4F94690];
  v10 = [(TURTCCallReporter *)self serviceName:v6 withConversation:v7];
  v76[0] = v10;
  v75[1] = @"callUUID";
  v11 = [v6 callUUID];
  v76[1] = v11;
  v75[2] = @"endReason";
  id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "disconnectedReason"));
  v76[2] = v12;
  v75[3] = @"incoming";
  int v13 = [v6 isIncoming];
  uint64_t v14 = MEMORY[0x1E4F1CC28];
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  if (v13) {
    uint64_t v16 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v16 = MEMORY[0x1E4F1CC28];
  }
  v76[3] = v16;
  v75[4] = @"connected";
  if ([v6 isConnected]) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v14;
  }
  v76[4] = v17;
  v75[5] = @"currentlyGrouped";
  if ([v6 isConferenced]) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = v14;
  }
  v76[5] = v18;
  v75[6] = @"relay";
  if ([v6 isHostedOnCurrentDevice]) {
    uint64_t v19 = v14;
  }
  else {
    uint64_t v19 = v15;
  }
  v76[6] = v19;
  v75[7] = @"isConversation";
  if ([v6 isConversation]) {
    uint64_t v20 = v15;
  }
  else {
    uint64_t v20 = v14;
  }
  v76[7] = v20;
  v75[8] = @"fromLink";
  if ([v6 joinedFromLink]) {
    uint64_t v21 = v15;
  }
  else {
    uint64_t v21 = v14;
  }
  v76[8] = v21;
  v75[9] = @"originatingUIType";
  __int16 v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "originatingUIType"));
  v76[9] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:10];
  uint64_t v24 = [v9 dictionaryWithDictionary:v23];

  v25 = [v6 provider];
  char v26 = [v25 isTelephonyProvider];

  if ((v26 & 1) == 0)
  {
    v27 = NSNumber;
    [v6 callDuration];
    v29 = [v27 numberWithDouble:v28 * 1000.0];
    [v24 setObject:v29 forKeyedSubscript:@"durationMs"];

    v30 = [v6 dateSentInvitation];

    if (v30)
    {
      v31 = NSNumber;
      v32 = [v6 dateSentInvitation];
      v33 = [v6 dateCreated];
      [v32 timeIntervalSinceDate:v33];
      v35 = [v31 numberWithDouble:v34 * 1000.0];
      [v24 setObject:v35 forKeyedSubscript:@"setupTimeMs"];

      uint64_t v36 = [v6 dateConnected];
      if (v36)
      {
        v37 = (void *)v36;
        v38 = [v6 dateStartedConnecting];

        if (v38)
        {
          v39 = NSNumber;
          v40 = [v6 dateConnected];
          v41 = [v6 dateStartedConnecting];
          [v40 timeIntervalSinceDate:v41];
          v43 = [v39 numberWithDouble:v42 * 1000.0];
          [v24 setObject:v43 forKeyedSubscript:@"connectionTimeMs"];
        }
      }
      v44 = [v7 report];
      v45 = [v44 timebase];

      if (v45)
      {
        v46 = [v6 dateEnded];
        v47 = v46;
        if (v46)
        {
          id v48 = v46;
        }
        else
        {
          id v48 = [MEMORY[0x1E4F1C9C8] now];
        }
        v58 = v48;

        v59 = NSNumber;
        v60 = [v6 dateConnected];
        v61 = [v7 report];
        v62 = [v61 timebase];
        [v60 timeIntervalSinceDate:v62];
        v63 = objc_msgSend(v59, "numberWithDouble:");
        [v24 setObject:v63 forKeyedSubscript:@"relativeStart"];

        v64 = NSNumber;
        v65 = [v7 report];
        v66 = [v65 timebase];
        [v58 timeIntervalSinceDate:v66];
        v67 = objc_msgSend(v64, "numberWithDouble:");
        [v24 setObject:v67 forKeyedSubscript:@"relativeEnd"];
      }
      v57 = [v7 report];
      v68 = [v57 conversationID];
      v69 = [v68 UUIDString];
      [v24 setObject:v69 forKeyedSubscript:@"CID"];
    }
    else
    {
      [v6 callDuration];
      if (v49 > 10.0)
      {
        [v6 callDuration];
        if (v50 <= 30.0)
        {
          v55 = &unk_1EED24180;
        }
        else
        {
          [v6 callDuration];
          if (v51 <= 60.0)
          {
            v55 = &unk_1EED24198;
          }
          else
          {
            [v6 callDuration];
            if (v52 <= 300.0)
            {
              v55 = &unk_1EED241B0;
            }
            else
            {
              [v6 callDuration];
              if (v53 <= 1800.0)
              {
                v55 = &unk_1EED241C8;
              }
              else
              {
                [v6 callDuration];
                if (v54 <= 3600.0) {
                  v55 = &unk_1EED241E0;
                }
                else {
                  v55 = &unk_1EED241F8;
                }
              }
            }
          }
        }
        [v24 setObject:v55 forKeyedSubscript:@"bucketedDuration"];
        goto LABEL_39;
      }
      v56 = NSNumber;
      [v6 callDuration];
      v57 = objc_msgSend(v56, "numberWithDouble:");
      [v24 setObject:v57 forKeyedSubscript:@"bucketedDuration"];
    }
  }
LABEL_39:
  uint64_t v70 = *MEMORY[0x1E4F94640];
  v73[0] = *MEMORY[0x1E4F94628];
  v73[1] = v70;
  v74[0] = &unk_1EED24210;
  v74[1] = &unk_1EED24228;
  v73[2] = *MEMORY[0x1E4F94638];
  v74[2] = v24;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];

  return v71;
}

- (id)reportingSessionForCall:(id)a3 withConversation:(id)a4
{
  v37[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(TURTCCallReporter *)self queue];
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v11 = *MEMORY[0x1E4F94660];
  v36[0] = *MEMORY[0x1E4F94658];
  v36[1] = v11;
  v37[0] = &unk_1EED24240;
  v37[1] = @"0.1";
  v36[2] = *MEMORY[0x1E4F94680];
  if (v8)
  {
    id v4 = [v8 UUID];
    [v4 UUIDString];
  }
  else
  {
    [v7 callUUID];
  id v12 = };
  uint64_t v13 = *MEMORY[0x1E4F94648];
  v37[2] = v12;
  v37[3] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = *MEMORY[0x1E4F94650];
  v36[3] = v13;
  v36[4] = v14;
  v37[4] = @"com.apple.TelephonyUtilities";
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];
  uint64_t v16 = [v10 dictionaryWithDictionary:v15];

  if (v8)
  {

    id v12 = v4;
  }

  uint64_t v17 = [v8 report];

  if (v17)
  {
    uint64_t v18 = [v8 report];
    uint64_t v19 = [v18 conversationID];
    uint64_t v20 = [v19 UUIDString];
    [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F94678]];
  }
  uint64_t v21 = [(TURTCCallReporter *)self clientName:v7];
  __int16 v22 = [(TURTCCallReporter *)self serviceName:v7 withConversation:v8];
  uint64_t v23 = *MEMORY[0x1E4F94690];
  v34[0] = *MEMORY[0x1E4F94688];
  v34[1] = v23;
  v35[0] = v21;
  v35[1] = v22;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F94620]) initWithSessionInfo:v16 userInfo:v24 frameworksToCheck:0];
  char v26 = TUDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412802;
    v29 = v25;
    __int16 v30 = 2112;
    v31 = v16;
    __int16 v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "RTCReporter: Created reporting session %@ with sessionInfo: %@, userInfo: %@", (uint8_t *)&v28, 0x20u);
  }

  [v25 startConfigurationWithCompletionHandler:&__block_literal_global_30];

  return v25;
}

void __62__TURTCCallReporter_reportingSessionForCall_withConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "RTCReporter: Received backends %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)clientName:(id)a3
{
  id v4 = a3;
  id v5 = [(TURTCCallReporter *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 provider];
  id v7 = @"telephonyutilities";
  if ([v6 isFaceTimeProvider] && objc_msgSend(v4, "isConversation")) {
    id v7 = @"multiwayconference";
  }
  id v8 = v7;

  return v8;
}

- (id)serviceName:(id)a3 withConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TURTCCallReporter *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [v6 provider];
  int v10 = [v9 isFaceTimeProvider];

  if (v10)
  {
    if ([v6 isConversation])
    {
      if ([v7 isOneToOneModeEnabled]) {
        uint64_t v11 = @"twoway";
      }
      else {
        uint64_t v11 = @"session";
      }
    }
    else
    {
      uint64_t v11 = @"com.apple.telephonyutilites.facetime";
    }
  }
  else
  {
    uint64_t v11 = @"com.apple.telephonyutilites.phone";
  }

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)callUUIDToConversation
{
  return self->_callUUIDToConversation;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_callUUIDToConversation, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end