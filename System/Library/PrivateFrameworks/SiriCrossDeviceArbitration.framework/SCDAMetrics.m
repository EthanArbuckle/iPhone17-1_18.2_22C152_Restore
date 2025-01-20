@interface SCDAMetrics
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)isMyriadMetricsMessage:(id)a3;
- (double)getSessionId:(MyriadMetricsDataV2 *)a3;
- (id)_createEndAnalyticContexFromIntermediateContext:(id)a3 forVersion:(unsigned int)a4 sessionId:(double)a5;
- (id)_getElectionParticipantIdWithLowBits:(unint64_t)a3 withHighBits:(unint64_t)a4;
- (id)_getRequestType:(unint64_t)a3;
- (id)getCDASessionId:(MyriadMetricsDataV2 *)a3;
- (id)getDeviceElectionParticipantId:(MyriadMetricsDataV2 *)a3;
- (id)getDeviceRotatedElectionParticipantId:(MyriadMetricsDataV2 *)a3;
- (id)getElectionParticipantId:(MyriadMetricsDataV2 *)a3 forParticipant:(int)a4;
- (int)_getCDASchemaCDATriggerType:(unint64_t)a3;
- (unsigned)getVersion:(MyriadMetricsDataV2 *)a3;
- (void)_decisionMadeContext:(MyriadMetricsDataV2 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6;
- (void)_submitMyriadMetrics:(MyriadMetricsDataV2 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6;
- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 additionalContext:(id)a5 instrumentation:(id)a6 completion:(id)a7;
- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 instrumentation:(id)a5 completion:(id)a6;
@end

@implementation SCDAMetrics

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 additionalContext:(id)a5 instrumentation:(id)a6 completion:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *, void))a7;
  if (v12)
  {
    v17 = [[SCDAAccessoryMetricMessage alloc] initWithMetricData:v13];
    if (v17)
    {
      v18 = v17;
      v19 = (void *)SCDALogContextAnalytics;
      if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        *(_DWORD *)v24 = 136315906;
        *(void *)&v24[4] = "-[SCDAMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instr"
                             "umentation:completion:]";
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = [v18 version];
        __int16 v25 = 2048;
        id v26 = v12;
        __int16 v27 = 2112;
        *(void *)&long long v28 = v14;
        _os_log_impl(&dword_25C707000, v20, OS_LOG_TYPE_INFO, "%s version = %u analytics stream = %p additional = [%@]", v24, 0x26u);
      }
      long long v29 = 0u;
      long long v30 = 0u;
      objc_msgSend(v18, "messageAsStruct", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0);
      [(SCDAMetrics *)self _submitMyriadMetrics:v24 additionalContext:v14 instrumentation:v15 completion:v16];
    }
    else
    {
      v22 = [MEMORY[0x263F087E8] errorWithDomain:@"kSCDAErrorDomain" code:2202 userInfo:0];
      if (v16) {
        v16[2](v16, v22, 0);
      }
      v23 = SCDALogContextAnalytics;
      if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136315138;
        *(void *)&v24[4] = "-[SCDAMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instr"
                             "umentation:completion:]";
        _os_log_error_impl(&dword_25C707000, v23, OS_LOG_TYPE_ERROR, "%s Invalid analytics data received", v24, 0xCu);
      }

      v18 = 0;
    }
  }
  else
  {
    v21 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136315138;
      *(void *)&v24[4] = "-[SCDAMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instrum"
                           "entation:completion:]";
      _os_log_error_impl(&dword_25C707000, v21, OS_LOG_TYPE_ERROR, "%s Invalid analytics stream.", v24, 0xCu);
    }
    v18 = [MEMORY[0x263F087E8] errorWithDomain:@"kSCDAErrorDomain" code:2202 userInfo:0];
    if (v16) {
      v16[2](v16, v18, 0);
    }
  }
}

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
}

- (void)_decisionMadeContext:(MyriadMetricsDataV2 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  v94[3] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, id))a6;
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (a3->version)
    {
      v83 = v11;
      v84 = v9;
      v87 = v10;
      uint64_t electionParticipantCount = a3->electionParticipantCount;
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", electionParticipantCount);
      v15 = unint64_t v14 = 0x263EFF000uLL;
      v86 = v12;
      [v12 setObject:v15 forKey:@"device_count"];

      uint64_t v16 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:electionParticipantCount];
      v17 = (void *)v16;
      uint64_t v85 = electionParticipantCount;
      if (electionParticipantCount >= 0x32) {
        uint64_t v18 = 50;
      }
      else {
        uint64_t v18 = electionParticipantCount;
      }
      v19 = self;
      uint64_t v88 = v18;
      v89 = (void *)v16;
      if (v18)
      {
        uint64_t v20 = 0;
        do
        {
          id v21 = objc_alloc(*(Class *)(v14 + 2464));
          v93[0] = @"dc";
          v22 = [NSNumber numberWithUnsignedChar:a3->electionParticipantDeviceType[v20]];
          v94[0] = v22;
          v93[1] = @"pt";
          v23 = [NSNumber numberWithUnsignedChar:a3->electionParticipantProductType[v20]];
          v94[1] = v23;
          v93[2] = @"goodness";
          v24 = [NSNumber numberWithUnsignedChar:a3->electionParticipantGoodnessScore[v20]];
          v94[2] = v24;
          [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
          v26 = unint64_t v25 = v14;
          __int16 v27 = (void *)[v21 initWithDictionary:v26];

          v19 = self;
          long long v28 = [(SCDAMetrics *)self getElectionParticipantId:a3 forParticipant:v20];
          long long v29 = [v28 UUIDString];
          [v27 setValue:v29 forKey:@"id"];

          unint64_t v14 = v25;
          v17 = v89;
          [v89 addObject:v27];

          ++v20;
        }
        while (v88 != v20);
      }
      long long v30 = v19;
      id v12 = v86;
      [v86 setObject:v17 forKey:@"goodness_scores"];
      if (a3->previousDecision) {
        uint64_t v31 = @"YES";
      }
      else {
        uint64_t v31 = @"NO";
      }
      [v86 setObject:v31 forKey:@"previous_decision"];
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", (unint64_t)a3->previousDecisionTime);
      [v86 setObject:v32 forKey:@"previous_decision_time"];

      if (a3->decision) {
        v33 = @"YES";
      }
      else {
        v33 = @"NO";
      }
      [v86 setObject:v33 forKey:@"decision"];
      if (v85)
      {
        v34 = objc_msgSend(NSString, "stringWithFormat:", @"%hhu", a3->electionParticipantGoodnessScore[0]);
        [v86 setObject:v34 forKey:@"winner_goodness"];

        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a3->electionParticipantDeviceType[0]);
        [v86 setObject:v35 forKey:@"winner_device_class"];

        v36 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a3->electionParticipantProductType[0]);
        [v86 setObject:v36 forKey:@"winner_product_type"];

        v37 = [(SCDAMetrics *)v30 getElectionParticipantId:a3 forParticipant:0];
        v38 = [v37 UUIDString];
        [v86 setValue:v38 forKey:@"winner_election_participant_id"];
      }
      if (a3->homepodInvolved) {
        v39 = @"YES";
      }
      else {
        v39 = @"NO";
      }
      [v86 setObject:v39 forKey:@"homepod_involved"];
      id v9 = v84;
      if (v85 && !a3->decision)
      {
        if (a3->electionParticipantGoodnessScore[0] == 255) {
          v40 = @"YES";
        }
        else {
          v40 = @"NO";
        }
        [v86 setObject:v40 forKey:@"winner_sent_suppresssion"];
      }
      v41 = [NSNumber numberWithUnsignedChar:a3->version];
      [v86 setObject:v41 forKey:@"version"];

      if (a3->lateToElection)
      {
        v42 = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
        [v86 setObject:v42 forKey:@"late_for_device_arbitration"];

        v43 = [NSNumber numberWithDouble:a3->advInterval];
        [v86 setObject:v43 forKey:@"device_arbitration_delay"];
      }
      id v10 = v87;
      if (v84)
      {
        v44 = objc_msgSend(NSString, "stringWithFormat:", @"%hhu", objc_msgSend(v84, "rawGoodnessScore"));
        [v86 setObject:v44 forKey:@"raw_goodness_score"];

        v45 = objc_msgSend(NSString, "stringWithFormat:", @"%hhu", objc_msgSend(v84, "goodnessScore"));
        [v86 setObject:v45 forKey:@"my_goodness"];

        v46 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v84, "deviceClass"));
        [v86 setObject:v46 forKey:@"my_device_class"];

        v47 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v84, "deviceProductType"));
        [v86 setObject:v47 forKey:@"my_product_type"];
      }
      if (v87)
      {
        id v48 = objc_alloc_init(MEMORY[0x263F6DA80]);
        [v48 setDeviceClass:a3->electionParticipantDeviceType[0]];
        [v48 setProductType:a3->electionParticipantProductType[0]];
        [v48 setGoodnessScore:a3->electionParticipantGoodnessScore[0]];
        v49 = [(SCDAMetrics *)v30 getElectionParticipantId:a3 forParticipant:0];
        v50 = SCDAToSISchemaUUID(v49);
        v82 = v48;
        [v48 setElectionParticipantId:v50];

        id v51 = objc_alloc_init(MEMORY[0x263F6DA80]);
        objc_msgSend(v51, "setDeviceClass:", objc_msgSend(v84, "deviceClass"));
        objc_msgSend(v51, "setProductType:", objc_msgSend(v84, "deviceProductType"));
        objc_msgSend(v51, "setGoodnessScore:", objc_msgSend(v84, "goodnessScore"));
        v52 = [(SCDAMetrics *)v30 getDeviceElectionParticipantId:a3];
        v53 = SCDAToSISchemaUUID(v52);
        [v51 setElectionParticipantId:v53];

        v54 = [(SCDAMetrics *)v30 getDeviceRotatedElectionParticipantId:a3];
        v55 = SCDAToSISchemaUUID(v54);
        v81 = v51;
        [v51 setRotatedElectionParticipantId:v55];

        uint64_t v56 = v88;
        unint64_t v57 = 0x263EFF000uLL;
        if (v88)
        {
          for (uint64_t i = 0; i != v88; ++i)
          {
            id v59 = objc_alloc(*(Class *)(v57 + 2464));
            v91[0] = @"dc";
            v60 = v30;
            v61 = [NSNumber numberWithUnsignedChar:a3->electionParticipantDeviceType[i]];
            v92[0] = v61;
            v91[1] = @"pt";
            v62 = [NSNumber numberWithUnsignedChar:a3->electionParticipantProductType[i]];
            v92[1] = v62;
            v91[2] = @"goodness";
            v63 = [NSNumber numberWithUnsignedChar:a3->electionParticipantGoodnessScore[i]];
            v92[2] = v63;
            v64 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];
            v65 = (void *)[v59 initWithDictionary:v64];

            uint64_t v56 = v88;
            long long v30 = v60;

            v66 = [(SCDAMetrics *)v60 getElectionParticipantId:a3 forParticipant:i];
            v67 = [v66 UUIDString];
            [v65 setValue:v67 forKey:@"id"];

            [v89 addObject:v65];
            unint64_t v57 = 0x263EFF000;
          }
        }
        v68 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v85];
        v69 = v30;
        if (v56)
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            id v71 = objc_alloc_init(MEMORY[0x263F6DA80]);
            [v71 setDeviceClass:a3->electionParticipantDeviceType[j]];
            [v71 setProductType:a3->electionParticipantProductType[j]];
            [v71 setGoodnessScore:a3->electionParticipantGoodnessScore[j]];
            v72 = [(SCDAMetrics *)v69 getElectionParticipantId:a3 forParticipant:j];
            v73 = SCDAToSISchemaUUID(v72);
            [v71 setElectionParticipantId:v73];

            [v68 addObject:v71];
          }
        }
        if (a3->decision) {
          uint64_t v74 = 1;
        }
        else {
          uint64_t v74 = 2;
        }
        if (a3->previousDecision) {
          uint64_t v75 = 1;
        }
        else {
          uint64_t v75 = 2;
        }
        uint64_t v76 = mach_absolute_time();
        if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
          dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
        }
        id v9 = v84;
        unint64_t v77 = (unint64_t)(((double)(unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v76)
                                - a3->previousDecisionTime)
                               / 1000000.0);
        int v78 = [v84 rawGoodnessScore];
        v79 = [(SCDAMetrics *)v69 getCDASessionId:a3];
        LODWORD(v80) = v78;
        id v10 = v87;
        [v87 logCDAElectionDecisionMade:11 withDecision:v74 withPreviousDecision:v75 timeSincePreviousDecision:v77 withWinningDevice:v82 withThisDevice:v81 withParticipants:v68 withRawScore:v80 withBoost:0 withCdaId:v79 currentRequestId:0 withTimestamp:mach_absolute_time()];

        id v12 = v86;
      }

      v11 = v83;
    }
    v11[2](v11, v12);
  }
}

- (void)_submitMyriadMetrics:(MyriadMetricsDataV2 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  v98[2] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void *))a6;
  uint64_t v77 = 0;
  int v78 = &v77;
  uint64_t v79 = 0x3032000000;
  uint64_t v80 = __Block_byref_object_copy__1090;
  v81 = __Block_byref_object_dispose__1091;
  id v82 = 0;
  if (a3)
  {
    switch(a3->eventType)
    {
      case 0u:
        unint64_t requestType = a3->requestType;
        uint64_t state = a3->state;
        v97[0] = @"state";
        int v73 = state;
        id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", state);
        v97[1] = @"trigger";
        v98[0] = v15;
        uint64_t v16 = [(SCDAMetrics *)self _getRequestType:requestType];
        v98[1] = v16;
        v17 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];
        uint64_t v18 = [(SCDAMetrics *)self getVersion:a3];
        [(SCDAMetrics *)self getSessionId:a3];
        uint64_t v19 = -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v17, v18);
        uint64_t v20 = (void *)v78[5];
        v78[5] = v19;

        if (v11)
        {
          uint64_t v21 = [(SCDAMetrics *)self _getCDASchemaCDATriggerType:requestType];
          v22 = [(SCDAMetrics *)self getCDASessionId:a3];
          [v11 logCDADeviceStateActivityStartedOrChanged:(v73 + 1) withTrigger:v21 withCdaId:v22 withTimestamp:mach_absolute_time()];
        }
        break;
      case 1u:
        uint64_t v25 = a3->state;
        v95 = @"state";
        id v26 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v25);
        v96 = v26;
        __int16 v27 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        uint64_t v28 = [(SCDAMetrics *)self getVersion:a3];
        [(SCDAMetrics *)self getSessionId:a3];
        uint64_t v29 = -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v27, v28);
        long long v30 = (void *)v78[5];
        v78[5] = v29;

        if (v11)
        {
          uint64_t v31 = [(SCDAMetrics *)self getCDASessionId:a3];
          [v11 logCDADeviceStateActivityEnded:(v25 + 1) withCdaId:v31 withTimestamp:mach_absolute_time()];
        }
        break;
      case 2u:
        uint64_t v32 = a3->state;
        double advDelay = a3->advDelay;
        double advInterval = a3->advInterval;
        v93[0] = @"state";
        int v74 = v32;
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v32);
        v94[0] = v35;
        v93[1] = @"adv-delay";
        v36 = [NSNumber numberWithDouble:advDelay];
        v94[1] = v36;
        v93[2] = @"adv-interval";
        v37 = [NSNumber numberWithDouble:advInterval];
        v94[2] = v37;
        v38 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
        uint64_t v39 = [(SCDAMetrics *)self getVersion:a3];
        [(SCDAMetrics *)self getSessionId:a3];
        uint64_t v40 = -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v38, v39);
        v41 = (void *)v78[5];
        v78[5] = v40;

        if (v11)
        {
          v42 = [(SCDAMetrics *)self getCDASessionId:a3];
          uint64_t v43 = mach_absolute_time();
          *(float *)&double v44 = advDelay;
          *(float *)&double v45 = advInterval;
          [v11 logCDAElectionAdvertisingStarting:(v74 + 1) withDelay:v42 withInterval:v43 withVoiceTriggerLatency:v44 withCdaId:v45 withTimestamp:0.0];
        }
        break;
      case 3u:
        uint64_t v46 = a3->state;
        v91 = @"state";
        v47 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v46);
        v92 = v47;
        id v48 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        uint64_t v49 = [(SCDAMetrics *)self getVersion:a3];
        [(SCDAMetrics *)self getSessionId:a3];
        uint64_t v50 = -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v48, v49);
        id v51 = (void *)v78[5];
        v78[5] = v50;

        if (v11)
        {
          v52 = [(SCDAMetrics *)self getCDASessionId:a3];
          [v11 logCDAElectionAdvertisingStarted:(v46 + 1) withCdaId:v52 withTimestamp:mach_absolute_time()];
        }
        break;
      case 4u:
        uint64_t v53 = a3->state;
        v89[0] = @"state";
        int v75 = v53;
        v54 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v53);
        v89[1] = @"unixTime";
        v90[0] = v54;
        v55 = NSNumber;
        uint64_t v56 = [MEMORY[0x263EFF910] date];
        [v56 timeIntervalSince1970];
        unint64_t v57 = objc_msgSend(v55, "numberWithDouble:");
        v90[1] = v57;
        v58 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
        uint64_t v59 = [(SCDAMetrics *)self getVersion:a3];
        [(SCDAMetrics *)self getSessionId:a3];
        uint64_t v60 = -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v58, v59);
        v61 = (void *)v78[5];
        v78[5] = v60;

        if (v11)
        {
          v62 = [(SCDAMetrics *)self getCDASessionId:a3];
          [v11 logCDAElectionTimerEnded:(v75 + 1) withCdaId:v62 withTimestamp:mach_absolute_time()];
        }
        break;
      case 5u:
        uint64_t v63 = a3->state;
        v87 = @"state";
        v64 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v63);
        uint64_t v88 = v64;
        v65 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        uint64_t v66 = [(SCDAMetrics *)self getVersion:a3];
        [(SCDAMetrics *)self getSessionId:a3];
        uint64_t v67 = -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v65, v66);
        v68 = (void *)v78[5];
        v78[5] = v67;

        if (v11)
        {
          v69 = [(SCDAMetrics *)self getCDASessionId:a3];
          [v11 logCDAElectionAdvertisingEnded:(v63 + 1) withCdaId:v69 withTimestamp:mach_absolute_time()];
        }
        break;
      case 6u:
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __81__SCDAMetrics__submitMyriadMetrics_additionalContext_instrumentation_completion___block_invoke;
        v76[3] = &unk_2654B7838;
        v76[4] = self;
        v76[5] = &v77;
        v76[6] = a3;
        [(SCDAMetrics *)self _decisionMadeContext:a3 additionalContext:v10 instrumentation:v11 completion:v76];
        break;
      default:
        uint64_t v23 = 2201;
        goto LABEL_6;
    }
    v24 = 0;
  }
  else
  {
    uint64_t v23 = 2202;
LABEL_6:
    v24 = [MEMORY[0x263F087E8] errorWithDomain:@"kSCDAErrorDomain" code:v23 userInfo:0];
  }
  v70 = SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v72 = v78[5];
    *(_DWORD *)buf = 136315394;
    v84 = "-[SCDAMetrics _submitMyriadMetrics:additionalContext:instrumentation:completion:]";
    __int16 v85 = 2112;
    uint64_t v86 = v72;
    _os_log_debug_impl(&dword_25C707000, v70, OS_LOG_TYPE_DEBUG, "%s Myriad endpoint metrics context: %@", buf, 0x16u);
    if (!v12) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v12)
  {
LABEL_22:
    id v71 = (void *)[(id)v78[5] copy];
    v12[2](v12, v24, v71);
  }
LABEL_23:

  _Block_object_dispose(&v77, 8);
}

void __81__SCDAMetrics__submitMyriadMetrics_additionalContext_instrumentation_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = a2;
  uint64_t v6 = [v3 getVersion:v4];
  [*(id *)(a1 + 32) getSessionId:*(void *)(a1 + 48)];
  uint64_t v7 = objc_msgSend(v3, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v5, v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)_createEndAnalyticContexFromIntermediateContext:(id)a3 forVersion:(unsigned int)a4 sessionId:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263EFF9A0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 addEntriesFromDictionary:v8];

  id v10 = [NSNumber numberWithUnsignedInt:v6];
  [v9 setObject:v10 forKey:@"version"];

  id v11 = [NSNumber numberWithDouble:a5];
  [v9 setObject:v11 forKey:@"session_id"];

  return v9;
}

- (id)_getElectionParticipantIdWithLowBits:(unint64_t)a3 withHighBits:(unint64_t)a4
{
  v6[2] = *MEMORY[0x263EF8340];
  if (a4 | a3)
  {
    v6[0] = veor_s8(vdup_n_s8(a4 >> 2), (int8x8_t)0x8101820283038);
    v6[1] = veor_s8(vdup_n_s8(a3 >> 2), (int8x8_t)0x8101820283038);
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v6];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)getElectionParticipantId:(MyriadMetricsDataV2 *)a3 forParticipant:(int)a4
{
  return [(SCDAMetrics *)self _getElectionParticipantIdWithLowBits:a3->electionParticipantIdLowBits[a4] withHighBits:a3->electionParticipantIdHighBits[a4]];
}

- (id)getDeviceRotatedElectionParticipantId:(MyriadMetricsDataV2 *)a3
{
  return [(SCDAMetrics *)self _getElectionParticipantIdWithLowBits:a3->deviceRotatedElectionParticipantIdLowBits withHighBits:a3->deviceRotatedElectionParticipantIdHighBits];
}

- (id)getDeviceElectionParticipantId:(MyriadMetricsDataV2 *)a3
{
  return [(SCDAMetrics *)self _getElectionParticipantIdWithLowBits:a3->deviceElectionParticipantIdLowBits withHighBits:a3->deviceElectionParticipantIdHighBits];
}

- (id)getCDASessionId:(MyriadMetricsDataV2 *)a3
{
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"00000000-0000-0000-0000-%012u", a3->sessionId);
    uint64_t v7 = (void *)[v5 initWithUUIDString:v6];
  }
  else
  {
    uint64_t v7 = (void *)[v4 initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  }
  return v7;
}

- (BOOL)isMyriadMetricsMessage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKeyedSubscript:scdaAccessoryMetricsMessageKey];
    if (v4)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (double)getSessionId:(MyriadMetricsDataV2 *)a3
{
  if (a3) {
    return (double)a3->sessionId;
  }
  else {
    return 0.0;
  }
}

- (unsigned)getVersion:(MyriadMetricsDataV2 *)a3
{
  if (a3) {
    return a3->version;
  }
  else {
    return 0;
  }
}

- (int)_getCDASchemaCDATriggerType:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return 0;
  }
  else {
    return dword_25C73C698[a3 - 2];
  }
}

- (id)_getRequestType:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return @"Unknown";
  }
  else {
    return off_2654B7858[a3 - 2];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1124);
  }
  v2 = (void *)sharedInstance_metrics;
  return v2;
}

uint64_t __29__SCDAMetrics_sharedInstance__block_invoke()
{
  sharedInstance_metrics = objc_alloc_init(SCDAMetrics);
  return MEMORY[0x270F9A758]();
}

+ (void)initialize
{
  if (SCDALogInitIfNeeded_once != -1) {
    dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_511);
  }
}

@end