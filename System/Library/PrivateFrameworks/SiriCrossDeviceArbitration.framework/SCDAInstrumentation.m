@interface SCDAInstrumentation
- (SCDAInstrumentation)init;
- (id)_boostTypeAsString:(unsigned __int8)a3;
- (id)_createSchemaClientEvent:(id)a3;
- (void)_logRequestLinkMessageRequestId:(id)a3 cdaId:(id)a4;
- (void)_sendAndLogClientEvent:(id)a3 stState:(int)a4 atTimestamp:(unint64_t)a5;
- (void)logCDADeviceStateActivityEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDADeviceStateActivityStartedOrChanged:(int)a3 withTrigger:(int)a4 withCdaId:(id)a5 withTimestamp:(unint64_t)a6;
- (void)logCDAElectionAdvertisingEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDAElectionAdvertisingEnding:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDAElectionAdvertisingStarted:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDAElectionAdvertisingStarting:(int)a3 withDelay:(float)a4 withInterval:(float)a5 withVoiceTriggerLatency:(float)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8;
- (void)logCDAElectionDecisionMade:(int)a3 withDecision:(int)a4 withPreviousDecision:(int)a5 timeSincePreviousDecision:(unint64_t)a6 withWinningDevice:(id)a7 withThisDevice:(id)a8 withParticipants:(id)a9 withRawScore:(unsigned int)a10 withBoost:(id)a11 withCdaId:(id)a12 currentRequestId:(id)a13 withTimestamp:(unint64_t)a14;
- (void)logCDAElectionDecisionMadeDebug:(int)a3 withCrossDeviceArbitrationAllowed:(BOOL)a4 advertisementData:(id)a5 withDeviceGroup:(unsigned int)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8;
- (void)logCDAElectionTimerEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)updateBoost:(unsigned __int8)a3 value:(unsigned int)a4;
- (void)updateIsTrump:(BOOL)a3 withReason:(int)a4;
- (void)userFeedbackPublishArbitrationParticipationContext:(id)a3;
@end

@implementation SCDAInstrumentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBoost, 0);
  objc_storeStrong((id *)&self->_arbitrationParticipationController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)userFeedbackPublishArbitrationParticipationContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__SCDAInstrumentation_userFeedbackPublishArbitrationParticipationContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __74__SCDAInstrumentation_userFeedbackPublishArbitrationParticipationContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateBoosts:*(void *)(*(void *)(a1 + 40) + 24) triggerType:*(unsigned int *)(*(void *)(a1 + 40) + 32) lastWin:*(void *)(*(void *)(a1 + 40) + 40) lastDecision:*(void *)(*(void *)(a1 + 40) + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(*(void *)(a1 + 40) + 16);
  return [v3 publishArbitrationParticipationContext:v2];
}

- (void)_logRequestLinkMessageRequestId:(id)a3 cdaId:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__SCDAInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke;
    v11[3] = &unk_2654B7BB8;
    id v12 = v7;
    id v13 = v6;
    dispatch_async(queue, v11);
  }
  else
  {
    v10 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SCDAInstrumentation _logRequestLinkMessageRequestId:cdaId:]";
      _os_log_debug_impl(&dword_25C707000, v10, OS_LOG_TYPE_DEBUG, "%s Skipped emitting RequestLinkEvent as requestId or cdaId is nil", buf, 0xCu);
    }
  }
}

void __61__SCDAInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v3 = objc_alloc(MEMORY[0x263F08C38]);
  id v4 = [*(id *)(a1 + 32) UUIDString];
  v5 = (void *)[v3 initWithUUIDString:v4];
  id v6 = (void *)[v2 initWithNSUUID:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F6EDC0]);
  [v7 setUuid:v6];
  [v7 setComponent:23];
  id v8 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v9 = objc_alloc(MEMORY[0x263F08C38]);
  v10 = [*(id *)(a1 + 40) UUIDString];
  v11 = (void *)[v9 initWithUUIDString:v10];
  id v12 = (void *)[v8 initWithNSUUID:v11];

  id v13 = objc_alloc_init(MEMORY[0x263F6EDC0]);
  [v13 setUuid:v12];
  [v13 setComponent:1];
  id v14 = objc_alloc_init(MEMORY[0x263F6EDB8]);
  [v14 setSource:v7];
  [v14 setTarget:v13];
  v15 = [MEMORY[0x263F6C818] sharedStream];
  [v15 emitMessage:v14];

  uint64_t v16 = SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    int v19 = 136315650;
    v20 = "-[SCDAInstrumentation _logRequestLinkMessageRequestId:cdaId:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    uint64_t v24 = v18;
    _os_log_debug_impl(&dword_25C707000, v16, OS_LOG_TYPE_DEBUG, "%s Emitting Myriad RequestLinkEvent with requestId: %@, cdaId: %@", (uint8_t *)&v19, 0x20u);
  }
}

- (id)_createSchemaClientEvent:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F6DA10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v4];

  id v7 = objc_alloc_init(MEMORY[0x263F6DA18]);
  [v7 setCdaId:v6];
  [v5 setEventMetadata:v7];

  return v5;
}

- (void)updateIsTrump:(BOOL)a3 withReason:(int)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SCDAInstrumentation_updateIsTrump_withReason___block_invoke;
  v5[3] = &unk_2654B73B8;
  v5[4] = self;
  BOOL v7 = a3;
  int v6 = a4;
  dispatch_async(queue, v5);
}

void __48__SCDAInstrumentation_updateIsTrump_withReason___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F6DA88]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v2 setIsTrump:*(unsigned __int8 *)(a1 + 44)];
  [*(id *)(*(void *)(a1 + 32) + 24) setTrumpReason:*(unsigned int *)(a1 + 40)];
  int v6 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *(unsigned __int8 *)(a1 + 44);
    unsigned int v8 = *(_DWORD *)(a1 + 40) - 1;
    if (v8 > 7) {
      id v9 = @"CDATRUMPREASON_UNKNOWN";
    }
    else {
      id v9 = off_2654B74E0[v8];
    }
    int v11 = 136315650;
    id v12 = "-[SCDAInstrumentation updateIsTrump:withReason:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    v10 = v6;
    _os_log_debug_impl(&dword_25C707000, v10, OS_LOG_TYPE_DEBUG, "%s trump: %d, with Reason:%@", (uint8_t *)&v11, 0x1Cu);
  }
}

- (void)updateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__SCDAInstrumentation_updateBoost_value___block_invoke;
  v5[3] = &unk_2654B73B8;
  v5[4] = self;
  unsigned __int8 v7 = a3;
  unsigned int v6 = a4;
  dispatch_async(queue, v5);
}

void __41__SCDAInstrumentation_updateBoost_value___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6DA88]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;
  }
  id v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 44);
    unsigned int v8 = v5;
    id v9 = [v6 _boostTypeAsString:v7];
    int v10 = *(_DWORD *)(a1 + 40);
    int v11 = 136315650;
    id v12 = "-[SCDAInstrumentation updateBoost:value:]_block_invoke";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_debug_impl(&dword_25C707000, v8, OS_LOG_TYPE_DEBUG, "%s boostType: %@, boostValue:%d", (uint8_t *)&v11, 0x1Cu);
  }
  switch(*(unsigned char *)(a1 + 44))
  {
    case 1:
      [*(id *)(*(void *)(a1 + 32) + 24) setDeviceBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 2:
      [*(id *)(*(void *)(a1 + 32) + 24) setRecentUnlockBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 3:
      [*(id *)(*(void *)(a1 + 32) + 24) setRecentRaiseToWakeBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 4:
      [*(id *)(*(void *)(a1 + 32) + 24) setRecentSiriRequestBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 5:
      [*(id *)(*(void *)(a1 + 32) + 24) setRecentMotionBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 6:
      [*(id *)(*(void *)(a1 + 32) + 24) setRecentPlaybackBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 7:
      [*(id *)(*(void *)(a1 + 32) + 24) setRecentAlarmBoost:*(unsigned int *)(a1 + 40)];
      break;
    default:
      return;
  }
}

- (id)_boostTypeAsString:(unsigned __int8)a3
{
  if ((a3 - 1) > 6) {
    return @"SCDABoostTypeUnknown";
  }
  else {
    return off_2654B74A8[(a3 - 1)];
  }
}

- (void)_sendAndLogClientEvent:(id)a3 stState:(int)a4 atTimestamp:(unint64_t)a5
{
  unsigned int v6 = (void *)MEMORY[0x263F6C818];
  id v7 = a3;
  id v8 = [v6 sharedStream];
  [v8 emitMessage:v7 timestamp:a5];
}

- (void)logCDAElectionDecisionMadeDebug:(int)a3 withCrossDeviceArbitrationAllowed:(BOOL)a4 advertisementData:(id)a5 withDeviceGroup:(unsigned int)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8
{
  id v14 = a5;
  id v15 = a7;
  queue = self->_queue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __147__SCDAInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke;
  v19[3] = &unk_2654B7390;
  v19[4] = self;
  id v20 = v15;
  BOOL v25 = a4;
  unsigned int v23 = a6;
  int v24 = a3;
  id v21 = v14;
  unint64_t v22 = a8;
  id v17 = v14;
  id v18 = v15;
  dispatch_async(queue, v19);
}

void __147__SCDAInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA20]);
  [v3 setIsCrossDeviceArbitrationAllowed:*(unsigned __int8 *)(a1 + 72)];
  [v3 setDeviceGroup:*(unsigned int *)(a1 + 64)];
  [v3 setAdvertisementDatas:*(void *)(a1 + 48)];
  [v2 setDebugElectionDecisionMade:v3];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 68) atTimestamp:*(void *)(a1 + 56)];
  uint64_t v4 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    unsigned int v6 = *(_DWORD *)(a1 + 68) - 1;
    if (v6 > 0x11) {
      id v7 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v7 = off_2654B7418[v6];
    }
    int v8 = *(unsigned __int8 *)(a1 + 72);
    int v9 = *(_DWORD *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 48);
    int v12 = 136316418;
    __int16 v13 = "-[SCDAInstrumentation logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:with"
          "DeviceGroup:withCdaId:withTimestamp:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    int v11 = v4;
    _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, arbitrationAllowed: %d, deviceGroup: %d, advertisements: %@", (uint8_t *)&v12, 0x36u);
  }
}

- (void)logCDAElectionDecisionMade:(int)a3 withDecision:(int)a4 withPreviousDecision:(int)a5 timeSincePreviousDecision:(unint64_t)a6 withWinningDevice:(id)a7 withThisDevice:(id)a8 withParticipants:(id)a9 withRawScore:(unsigned int)a10 withBoost:(id)a11 withCdaId:(id)a12 currentRequestId:(id)a13 withTimestamp:(unint64_t)a14
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __224__SCDAInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke;
  block[3] = &unk_2654B7368;
  block[4] = self;
  id v34 = v22;
  int v42 = a4;
  int v43 = a5;
  id v35 = v18;
  id v36 = v19;
  id v37 = v21;
  id v38 = v20;
  unsigned int v44 = a10;
  int v45 = a3;
  unint64_t v40 = a6;
  unint64_t v41 = a14;
  id v39 = v23;
  id v25 = v23;
  id v26 = v20;
  id v27 = v21;
  id v28 = v19;
  id v29 = v18;
  id v30 = v22;
  dispatch_async(queue, block);
}

void __224__SCDAInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA70]);
  [v3 setDecision:*(unsigned int *)(a1 + 104)];
  [v3 setPreviousDecision:*(unsigned int *)(a1 + 108)];
  [v3 setWinningDevice:*(void *)(a1 + 48)];
  [v3 setThisDevice:*(void *)(a1 + 56)];
  [v3 setRawGoodnessScore:*(unsigned int *)(a1 + 112)];
  [v3 setTimeSinceLastDecisionInMs:*(void *)(a1 + 88)];
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4) {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
  }
  [v3 setGoodnessScoreBoosts:v4];
  [v3 setHeardParticipants:*(void *)(a1 + 72)];
  [v2 setElectionDecisionMade:v3];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 116) atTimestamp:*(void *)(a1 + 96)];
  [*(id *)(a1 + 32) _logRequestLinkMessageRequestId:*(void *)(a1 + 80) cdaId:*(void *)(a1 + 40)];
  uint64_t v5 = (id)SCDALogContextAnalytics;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v9 = *(_DWORD *)(a1 + 116) - 1;
    if (v9 > 0x11) {
      uint64_t v10 = @"CDASTATE_UNKNOWN";
    }
    else {
      uint64_t v10 = off_2654B7418[v9];
    }
    v31 = v10;
    int v11 = @"CDADECISION_UNKNOWN";
    int v12 = *(_DWORD *)(a1 + 104);
    int v13 = *(_DWORD *)(a1 + 108);
    if (v12 == 1) {
      __int16 v14 = @"CDADECISION_WIN";
    }
    else {
      __int16 v14 = @"CDADECISION_UNKNOWN";
    }
    if (v12 == 2) {
      uint64_t v15 = @"CDADECISION_LOSS";
    }
    else {
      uint64_t v15 = v14;
    }
    if (v13 == 1) {
      int v11 = @"CDADECISION_WIN";
    }
    if (v13 == 2) {
      int v11 = @"CDADECISION_LOSS";
    }
    id v27 = v11;
    id v28 = v15;
    uint64_t v30 = *(void *)(a1 + 88);
    __int16 v16 = *(void **)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 40);
    int v29 = [v16 goodnessScore];
    id v17 = *(void **)(a1 + 56);
    int v26 = [v17 goodnessScore];
    id v18 = [*(id *)(a1 + 72) debugDescription];
    int v24 = *(_DWORD *)(a1 + 112);
    id v19 = [v3 goodnessScoreBoosts];
    id v20 = [v19 debugDescription];
    id v21 = [v3 goodnessScoreBoosts];
    unsigned int v22 = [v21 trumpReason] - 1;
    if (v22 > 7) {
      id v23 = @"CDATRUMPREASON_UNKNOWN";
    }
    else {
      id v23 = off_2654B74E0[v22];
    }
    *(_DWORD *)buf = 136318466;
    v33 = "-[SCDAInstrumentation logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:w"
          "ithWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimesta"
          "mp:]_block_invoke";
    __int16 v34 = 2112;
    uint64_t v35 = v25;
    __int16 v36 = 2112;
    id v37 = v31;
    __int16 v38 = 2112;
    id v39 = v28;
    __int16 v40 = 2112;
    unint64_t v41 = v27;
    __int16 v42 = 2048;
    uint64_t v43 = v30;
    __int16 v44 = 2112;
    int v45 = v16;
    __int16 v46 = 1024;
    int v47 = v29;
    __int16 v48 = 2112;
    v49 = v17;
    __int16 v50 = 1024;
    int v51 = v26;
    __int16 v52 = 2112;
    v53 = v18;
    __int16 v54 = 1024;
    int v55 = v24;
    __int16 v56 = 2112;
    v57 = v20;
    __int16 v58 = 2112;
    v59 = v23;
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, withDecision: %@, withPreviousDecision: %@, timeSincePreviousDecision: %llu, withWinningDevice: %@ (score: %d), withThisDevice: %@ (score: %d), withParticipants: %@, withRawScore:%u, withBoost:%@, withTrumpReason:%@", buf, 0x82u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v8 = mach_absolute_time();
  *(void *)(*(void *)(a1 + 32) + 48) = v8;
  if (*(_DWORD *)(a1 + 104) == 1) {
    *(void *)(*(void *)(a1 + 32) + 40) = v8;
  }
}

- (void)logCDAElectionTimerEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__SCDAInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_2654B7318;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __72__SCDAInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA78]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  [v2 setElectionTimerEnded:v3];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  uint64_t v4 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    unsigned int v6 = *(_DWORD *)(a1 + 56) - 1;
    if (v6 > 0x11) {
      id v7 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v7 = off_2654B7418[v6];
    }
    int v9 = 136315650;
    id v10 = "-[SCDAInstrumentation logCDAElectionTimerEnded:withCdaId:withTimestamp:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    int v14 = v7;
    id v8 = v4;
    _os_log_debug_impl(&dword_25C707000, v8, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingEnding:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__SCDAInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_2654B7318;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __79__SCDAInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA58]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x263F6DA28]);
  [v4 setStartedOrChanged:v3];
  [v2 setCdaAdvertisingEndChanged:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  uint64_t v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_2654B7418[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[SCDAInstrumentation logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    int v9 = v5;
    _os_log_debug_impl(&dword_25C707000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__SCDAInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_2654B7318;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __78__SCDAInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA50]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x263F6DA28]);
  [v4 setEnded:v3];
  [v2 setCdaAdvertisingEndChanged:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  uint64_t v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_2654B7418[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[SCDAInstrumentation logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    int v9 = v5;
    _os_log_debug_impl(&dword_25C707000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingStarting:(int)a3 withDelay:(float)a4 withInterval:(float)a5 withVoiceTriggerLatency:(float)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8
{
  id v14 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __128__SCDAInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withVoiceTriggerLatency_withCdaId_withTimestamp___block_invoke;
  block[3] = &unk_2654B7340;
  block[4] = self;
  id v18 = v14;
  int v20 = a3;
  float v21 = a4;
  float v22 = a5;
  float v23 = a6;
  unint64_t v19 = a8;
  id v16 = v14;
  dispatch_async(queue, block);
}

void __128__SCDAInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withVoiceTriggerLatency_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA68]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  LODWORD(v4) = *(_DWORD *)(a1 + 60);
  [v3 setAdvertisementDelay:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 64);
  [v3 setAdvertisementInterval:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 68);
  [v3 setVoiceTriggerLatency:v6];
  id v7 = objc_alloc_init(MEMORY[0x263F6DA30]);
  [v7 setStartedOrChanged:v3];
  [v2 setCdaAdvertisingStartChanged:v7];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  id v8 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 56) - 1;
    if (v10 > 0x11) {
      __int16 v11 = @"CDASTATE_UNKNOWN";
    }
    else {
      __int16 v11 = off_2654B7418[v10];
    }
    int v13 = 136315650;
    id v14 = "-[SCDAInstrumentation logCDAElectionAdvertisingStarting:withDelay:withInterval:withVoiceTriggerLatency:withCda"
          "Id:withTimestamp:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v12 = v8;
    _os_log_debug_impl(&dword_25C707000, v12, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v13, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingStarted:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__SCDAInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_2654B7318;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __80__SCDAInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA60]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x263F6DA30]);
  [v4 setEnded:v3];
  [v2 setCdaAdvertisingStartChanged:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  double v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_2654B7418[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[SCDAInstrumentation logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    uint64_t v9 = v5;
    _os_log_debug_impl(&dword_25C707000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDADeviceStateActivityEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__SCDAInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_2654B7318;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __78__SCDAInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA38]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x263F6DA48]);
  [v4 setEnded:v3];
  [v2 setDeviceElectionStateContext:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  double v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_2654B7418[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[SCDAInstrumentation logCDADeviceStateActivityEnded:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    uint64_t v9 = v5;
    _os_log_debug_impl(&dword_25C707000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDADeviceStateActivityStartedOrChanged:(int)a3 withTrigger:(int)a4 withCdaId:(id)a5 withTimestamp:(unint64_t)a6
{
  id v10 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __101__SCDAInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke;
  v13[3] = &unk_2654B72F0;
  v13[4] = self;
  id v14 = v10;
  int v16 = a3;
  int v17 = a4;
  unint64_t v15 = a6;
  id v12 = v10;
  dispatch_async(queue, v13);
}

void __101__SCDAInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263F6DA40]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  if (*(_DWORD *)(a1 + 60))
  {
    objc_msgSend(v3, "setTrigger:");
    *(_DWORD *)(*(void *)(a1 + 32) + 32) = *(_DWORD *)(a1 + 60);
  }
  id v4 = objc_alloc_init(MEMORY[0x263F6DA48]);
  [v4 setStartedOrChanged:v3];
  [v2 setDeviceElectionStateContext:v4];
  double v5 = [MEMORY[0x263F6C818] sharedStream];
  [v5 emitMessage:v2 timestamp:*(void *)(a1 + 48)];

  uint64_t v6 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_2654B7418[v7];
    }
    uint64_t v9 = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 60) - 1;
    if (v10 > 7) {
      __int16 v11 = @"CDATRIGGER_UKNOWN";
    }
    else {
      __int16 v11 = off_2654B73D8[v10];
    }
    int v13 = 136315906;
    id v14 = "-[SCDAInstrumentation logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    int v20 = v11;
    id v12 = v6;
    _os_log_debug_impl(&dword_25C707000, v12, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, trigger: %@", (uint8_t *)&v13, 0x2Au);
  }
}

- (SCDAInstrumentation)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCDAInstrumentation;
  id v2 = [(SCDAInstrumentation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = SCDADispatchSerialQueueWithRelativePriority("com.apple.assistant.myriad.instrumentation", QOS_CLASS_UTILITY, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    if ([MEMORY[0x263F28510] isCrossDeviceArbitrationFeedbackEnabled])
    {
      double v5 = objc_alloc_init(SCDAArbitrationParticipationController);
      arbitrationParticipationController = v2->_arbitrationParticipationController;
      v2->_arbitrationParticipationController = v5;
    }
  }
  return v2;
}

@end