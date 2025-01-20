@interface CADataTransformEngine
- (BOOL)computeSnapshotValidity:(unint64_t)a3 snapshotTimestamp:(id)a4 validityThreshold:(unint64_t)a5;
- (BOOL)transformAndSubmitDNSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5;
- (BOOL)transformAndSubmitDPSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5;
- (BOOL)transformAndSubmitSWMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5;
- (CADataTransformEngine)init;
- (RecommendationPreferences)preferences;
- (double)computePercentage:(unint64_t)a3 denomenator:(unint64_t)a4;
- (unint64_t)compareValues:(unint64_t)a3 second:(unint64_t)a4;
- (unint64_t)computeDifferenceBetweenDates:(id)a3 end:(id)a4;
- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4;
- (void)computeDPSRecoveryIndex:(id)a3 timestamps:(id)a4 andReply:(id)a5;
- (void)findTxCompletionFailureWithMaxCount:(id)a3 andReply:(id)a4;
- (void)setPreferences:(id)a3;
@end

@implementation CADataTransformEngine

- (CADataTransformEngine)init
{
  v8.receiver = self;
  v8.super_class = (Class)CADataTransformEngine;
  v2 = [(CADataTransformEngine *)&v8 init];
  uint64_t v3 = +[RecommendationPreferences sharedObject];
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "-[CADataTransformEngine init]";
      __int16 v11 = 1024;
      int v12 = 82;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error RecommendationPreferences init", buf, 0x12u);
    }

    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "-[CADataTransformEngine init]";
      __int16 v11 = 1024;
      int v12 = 87;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error initializing CADataTransformEngine", buf, 0x12u);
    }

    return 0;
  }
  return v2;
}

- (BOOL)computeSnapshotValidity:(unint64_t)a3 snapshotTimestamp:(id)a4 validityThreshold:(unint64_t)a5
{
  [a4 timeIntervalSince1970];
  return v7 > (double)a3 && (unint64_t)v7 - a3 <= a5;
}

- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setDropped:[v6 dropped] + [v5 dropped]];
  [v6 setNoBuf:[v6 noBuf] + [v5 noBuf]];
  [v6 setNoResources:[v6 noResources] + [v5 noResources]];
  [v6 setNoAck:[v6 noAck] + [v5 noAck]];
  [v6 setChipModeError:[v6 chipModeError] + [v5 chipModeError]];
  [v6 setExpired:[v6 expired] + [v5 expired]];
  [v6 setTxFailure:[v6 txFailure] + [v5 txFailure]];
  [v6 setFirmwareFreePacket:[v6 firmwareFreePacket] + [v5 firmwareFreePacket]];
  [v6 setMaxRetries:[v6 maxRetries] + [v5 maxRetries]];
  LODWORD(a3) = [v5 forceLifetimeExp];

  [v6 setForceLifetimeExp:[v6 forceLifetimeExp] + a3];
}

- (void)findTxCompletionFailureWithMaxCount:(id)a3 andReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, unint64_t, void *))a4;
  double v7 = +[NSMutableString string];
  objc_super v8 = +[NSMutableString string];
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  uint64_t v11 = 1;
  while (2)
  {
    switch(v11)
    {
      case 1:
        unsigned int v12 = [v5 dropped];
        goto LABEL_13;
      case 2:
        unsigned int v12 = [v5 noBuf];
        goto LABEL_13;
      case 3:
        unsigned int v12 = [v5 noResources];
        goto LABEL_13;
      case 4:
        unsigned int v12 = [v5 noAck];
        goto LABEL_13;
      case 5:
        unsigned int v12 = [v5 chipModeError];
        goto LABEL_13;
      case 6:
        unsigned int v12 = [v5 expired];
        goto LABEL_13;
      case 7:
        unsigned int v12 = [v5 txFailure];
        goto LABEL_13;
      case 8:
        unsigned int v12 = [v5 firmwareFreePacket];
        goto LABEL_13;
      case 9:
        unsigned int v12 = [v5 maxRetries];
        goto LABEL_13;
      case 10:
        unsigned int v12 = [v5 forceLifetimeExp];
LABEL_13:
        BOOL v13 = v10 >= v12;
        if (v10 <= v12) {
          unint64_t v10 = v12;
        }
        if (!v13) {
          uint64_t v9 = v11;
        }
        CFStringRef v14 = @"1";
        if (!v12) {
          goto LABEL_18;
        }
        goto LABEL_19;
      default:
LABEL_18:
        CFStringRef v14 = @"0";
LABEL_19:
        [v7 insertString:v14 atIndex:0];
        if (++v11 != 11) {
          continue;
        }
        v15 = (char *)[v7 length];
        if (v15)
        {
          v16 = v15 - 1;
          do
          {
            v17 = [v7 substringWithRange:v16];
            [v8 appendString:v17];

            --v16;
          }
          while (v16 != (char *)-1);
        }
        v18 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136446722;
          v20 = "-[CADataTransformEngine findTxCompletionFailureWithMaxCount:andReply:]";
          __int16 v21 = 1024;
          int v22 = 181;
          __int16 v23 = 2112;
          v24 = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txStatusString: %@", (uint8_t *)&v19, 0x1Cu);
        }

        v6[2](v6, v9, v10, v8);
        return;
    }
  }
}

- (void)computeDPSRecoveryIndex:(id)a3 timestamps:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v43 = a4;
  v42 = (void (**)(id, uint64_t, id, uint64_t))a5;
  v39 = self;
  unint64_t v9 = [(RecommendationPreferences *)self->_preferences dps_interrogation_sample_count];
  id v40 = [v8 dpsCounterSamplesCount];
  if (v9)
  {
    uint64_t v10 = 0;
    unsigned int v11 = 0;
    unsigned int v12 = 0;
    BOOL v13 = 0;
    id v41 = v8;
    unint64_t v38 = v9;
    while (1)
    {
      CFStringRef v14 = v13;
      BOOL v13 = [v8 dpsCounterSampleAtIndex:v10];

      if (!v13) {
        break;
      }
      v15 = [v13 peerStats];

      if (!v15)
      {
        unsigned int v12 = 0;
        break;
      }
      unsigned int v12 = v15;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v16 = [v15 acCompletions];
      id v17 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v49;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v49 != v19) {
              objc_enumerationMutation(v16);
            }
            __int16 v21 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if ([v21 ac]
              && [v21 durSinceLastSuccessfulComp] / 0x3E8 < v11 + 8)
            {
              unint64_t v22 = v11 + 5;
              uint64_t v23 = 1;
              goto LABEL_17;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v10 = ++v11;
      unint64_t v9 = v38;
      id v8 = v41;
      if (v38 <= v11) {
        goto LABEL_21;
      }
    }
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    goto LABEL_39;
  }
  BOOL v13 = 0;
  unsigned int v12 = 0;
LABEL_21:
  if ((unint64_t)v40 <= v9)
  {
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 1;
LABEL_39:
    v24 = v43;
    goto LABEL_42;
  }
  v26 = [v8 dpsCounterSamples];
  v27 = [v26 lastObject];

  v24 = v43;
  if (!v27)
  {
    BOOL v13 = 0;
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    goto LABEL_42;
  }
  v28 = [v27 peerStats];

  if (!v28)
  {
    unsigned int v12 = 0;
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    BOOL v13 = v27;
    goto LABEL_42;
  }
  uint64_t v29 = [v43 objectForKeyedSubscript:@"start"];
  if (!v29
    || (v30 = (void *)v29,
        [v43 objectForKeyedSubscript:@"end"],
        v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        !v31))
  {
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 1;
LABEL_41:
    BOOL v13 = v27;
    unsigned int v12 = v28;
    goto LABEL_42;
  }
  v32 = [v43 objectForKeyedSubscript:@"start"];
  v33 = [v43 objectForKeyedSubscript:@"end"];
  id v34 = [(CADataTransformEngine *)v39 computeDifferenceBetweenDates:v32 end:v33];

  if ((unint64_t)v34 <= v9)
  {
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    goto LABEL_41;
  }
  id v41 = v8;
  if (v34 > (id)[(RecommendationPreferences *)v39->_preferences dps_report_sent_after])
  {
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    BOOL v13 = v27;
    unsigned int v12 = v28;
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v16 = [v28 acCompletions];
    unint64_t v22 = (unint64_t)[v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v22)
    {
      uint64_t v35 = *(void *)v45;
      while (2)
      {
        for (j = 0; j != (void *)v22; j = (char *)j + 1)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v16);
          }
          v37 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          if ([v37 ac]
            && (unint64_t)v34 + 8 > [v37 durSinceLastSuccessfulComp] / 0x3E8uLL)
          {
            unint64_t v22 = (v34 + 5);
            uint64_t v23 = 1;
            goto LABEL_44;
          }
        }
        unint64_t v22 = (unint64_t)[v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      uint64_t v23 = 0;
LABEL_44:
      BOOL v13 = v27;
      unsigned int v12 = v28;
LABEL_17:
      v24 = v43;
    }
    else
    {
      uint64_t v23 = 0;
      BOOL v13 = v27;
      unsigned int v12 = v28;
    }

    uint64_t v25 = 1;
  }
  id v8 = v41;
LABEL_42:
  v42[2](v42, v23, (id)v22, v25);
}

- (unint64_t)computeDifferenceBetweenDates:(id)a3 end:(id)a4
{
  [a4 timeIntervalSinceDate:a3];
  return (unint64_t)v4;
}

- (unint64_t)compareValues:(unint64_t)a3 second:(unint64_t)a4
{
  if (a4 <= a3) {
    return a4 != a3;
  }
  else {
    return 2;
  }
}

- (double)computePercentage:(unint64_t)a3 denomenator:(unint64_t)a4
{
  if (a4) {
    return (double)a3 / (double)a4 * 100.0;
  }
  else {
    return 0.0;
  }
}

- (BOOL)transformAndSubmitDPSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  char v14 = AnalyticsSendEventLazy();
  v15 = WALogCategoryDefaultHandle();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v22 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]";
      __int16 v23 = 1024;
      int v24 = 448;
      id v17 = "%{public}s::%d:Submitted DPS metric (CA)";
      id v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v22 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]";
    __int16 v23 = 1024;
    int v24 = 446;
    id v17 = "%{public}s::%d:Failed sending DPS metric (CA)";
    id v18 = v16;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return v14;
}

- (BOOL)transformAndSubmitDNSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  char v14 = AnalyticsSendEventLazy();
  v15 = WALogCategoryDefaultHandle();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v22 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]";
      __int16 v23 = 1024;
      int v24 = 793;
      id v17 = "%{public}s::%d:Submitted DNS metric (CA)";
      id v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v22 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]";
    __int16 v23 = 1024;
    int v24 = 791;
    id v17 = "%{public}s::%d:Failed sending DNS metric (CA)";
    id v18 = v16;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return v14;
}

- (BOOL)transformAndSubmitSWMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v11 = v8;
  id v12 = v7;
  char v13 = AnalyticsSendEventLazy();
  char v14 = WALogCategoryDefaultHandle();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v21 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]";
      __int16 v22 = 1024;
      int v23 = 1044;
      v16 = "%{public}s::%d:Submitted SW metric (CA)";
      id v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v21 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]";
    __int16 v22 = 1024;
    int v23 = 1042;
    v16 = "%{public}s::%d:Failed sending SW metric (CA)";
    id v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return v13;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end