@interface RecommendationEngine
- (BOOL)canCaptureforDPS;
- (BOOL)canWDforDPS;
- (NSMutableDictionary)dpsWDBudgetDict;
- (RecommendationEngine)init;
- (RecommendationPreferences)preferences;
- (float)medianCCA:(id)a3;
- (void)addNumRecommendedCapture;
- (void)addNumRecommendedWD;
- (void)addNumSuppressedCapture;
- (void)addNumSuppressedWD;
- (void)isDatapathStudyShowingDPS:(id)a3 andReply:(id)a4;
- (void)recommendActionFromData:(id)a3 andReply:(id)a4;
- (void)setDpsWDBudgetDict:(id)a3;
- (void)setPreferences:(id)a3;
@end

@implementation RecommendationEngine

- (RecommendationEngine)init
{
  v9.receiver = self;
  v9.super_class = (Class)RecommendationEngine;
  v2 = [(RecommendationEngine *)&v9 init];
  if (!v2)
  {
    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[RecommendationEngine init]";
      __int16 v12 = 1024;
      int v13 = 35;
      v8 = "%{public}s::%d:Error super init";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
    }
LABEL_10:

    v5 = 0;
    goto LABEL_4;
  }
  uint64_t v3 = +[RecommendationPreferences sharedObject];
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[RecommendationEngine init]";
      __int16 v12 = 1024;
      int v13 = 38;
      v8 = "%{public}s::%d:Error RecommendationPreferences init";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v5 = v2;
LABEL_4:

  return v5;
}

- (BOOL)canWDforDPS
{
  uint64_t v3 = +[NSDate date];
  v4 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_lastWD"];

  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_lastWD"];
    [v3 timeIntervalSinceDate:v5];
    double v7 = v6;
    double v8 = (double)(60 * [(RecommendationPreferences *)self->_preferences minutes_between_dps_wd]);
    objc_super v9 = WALogCategoryDefaultHandle();
    v10 = v9;
    BOOL v11 = v7 > v8;
    if (v7 <= v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136446978;
        v17 = "-[RecommendationEngine canWDforDPS]";
        __int16 v18 = 1024;
        int v19 = 61;
        __int16 v20 = 2048;
        double v21 = v7;
        __int16 v22 = 2112;
        v23 = v5;
        __int16 v12 = "%{public}s::%d:DPS Not Allowed - Last DPS WD was %f seconds ago at %@";
        int v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_10;
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "-[RecommendationEngine canWDforDPS]";
      __int16 v18 = 1024;
      int v19 = 58;
      __int16 v20 = 2048;
      double v21 = v7;
      __int16 v22 = 2112;
      v23 = v5;
      __int16 v12 = "%{public}s::%d:DPS Allowed - Last DPS WD was %f seconds ago at %@";
      int v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v16, 0x26u);
    }

    goto LABEL_12;
  }
  v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446466;
    v17 = "-[RecommendationEngine canWDforDPS]";
    __int16 v18 = 1024;
    int v19 = 52;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kDPSLastWD not yet populated", (uint8_t *)&v16, 0x12u);
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)canCaptureforDPS
{
  uint64_t v3 = +[NSDate date];
  v4 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_lastCapture"];

  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_lastCapture"];
    [v3 timeIntervalSinceDate:v5];
    uint64_t v7 = v6;
    double v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      BOOL v11 = "-[RecommendationEngine canCaptureforDPS]";
      __int16 v12 = 1024;
      int v13 = 76;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Capture Allowed - Last DPS WD was %f seconds ago at %@", (uint8_t *)&v10, 0x26u);
    }
  }
  else
  {
    v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      BOOL v11 = "-[RecommendationEngine canCaptureforDPS]";
      __int16 v12 = 1024;
      int v13 = 71;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kDPSLastCapture not yet populated", (uint8_t *)&v10, 0x12u);
    }
  }

  return 1;
}

- (float)medianCCA:(id)a3
{
  id v3 = a3;
  v4 = [v3 fieldForKey:@"DPSR_dpsCounterSamples"];
  v5 = [v4 repeatableValues];
  uint64_t v6 = (const char *)[v5 count];

  if ((unint64_t)v6 > 1)
  {
    unint64_t v52 = 0;
    v53 = v6 - 1;
    v51 = 0;
    unsigned int v13 = 0;
    for (i = v3; ; id v3 = i)
    {
      __int16 v14 = [v3 fieldForKey:@"DPSR_dpsCounterSamples"];
      uint64_t v15 = [v14 repeatableValues];
      __int16 v16 = [v15 objectAtIndex:0];
      v17 = [v16 fieldForKey:@"DPSCS_peerStats"];
      __int16 v18 = [v17 subMessageValue];
      int v19 = [v18 fieldForKey:@"NWAPS_ccas"];
      __int16 v20 = [v19 repeatableValues];
      id v21 = [v20 count];

      if ((unint64_t)v21 <= v13) {
        break;
      }
      uint64_t v22 = v13;
      v63 = [v3 fieldForKey:@"DPSR_dpsCounterSamples"];
      v62 = [v63 repeatableValues];
      v61 = [v62 objectAtIndex:v53];
      v60 = [v61 fieldForKey:@"DPSCS_peerStats"];
      v59 = [v60 subMessageValue];
      v58 = [v59 fieldForKey:@"NWAPS_ccas"];
      v57 = [v58 repeatableValues];
      v56 = [v57 objectAtIndex:v13];
      v55 = [v56 fieldForKey:@"NWASB_residentTime"];
      v23 = [v55 uint64Value];
      v24 = [v3 fieldForKey:@"DPSR_dpsCounterSamples"];
      v25 = [v24 repeatableValues];
      v26 = [v25 objectAtIndex:0];
      v27 = [v26 fieldForKey:@"DPSCS_peerStats"];
      v28 = [v27 subMessageValue];
      v29 = [v28 fieldForKey:@"NWAPS_ccas"];
      v30 = [v29 repeatableValues];
      uint64_t v65 = v22;
      v31 = [v30 objectAtIndex:v22];
      v32 = [v31 fieldForKey:@"NWASB_residentTime"];
      unint64_t v33 = v23 - (unsigned char *)[v32 uint64Value];

      if (v33 > v52)
      {
        v34 = [i fieldForKey:@"DPSR_dpsCounterSamples"];
        v35 = [v34 repeatableValues];
        v36 = [v35 objectAtIndex:v53];
        v37 = [v36 fieldForKey:@"DPSCS_peerStats"];
        v38 = [v37 subMessageValue];
        v39 = [v38 fieldForKey:@"NWAPS_ccas"];
        [v39 repeatableValues];
        v40 = unint64_t v64 = v33;
        v41 = [v40 objectAtIndex:v65];
        v42 = [v41 fieldForKey:@"NWASB_state"];
        uint64_t v43 = [v42 stringValue];

        v51 = v43;
        unint64_t v52 = v64;
      }
      unsigned int v13 = v65 + 1;
    }
    double v8 = v51;
    if (v51)
    {
      v44 = +[NSScanner scannerWithString:v51];
      v45 = +[NSCharacterSet decimalDigitCharacterSet];
      [v44 scanUpToCharactersFromSet:v45 intoString:0];

      v46 = +[NSCharacterSet decimalDigitCharacterSet];
      id v66 = 0;
      [v44 scanCharactersFromSet:v46 intoString:&v66];
      id v47 = v66;

      [v47 floatValue];
      float v9 = v48;
      v49 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v68 = "-[RecommendationEngine medianCCA:]";
        __int16 v69 = 1024;
        int v70 = 121;
        __int16 v71 = 2112;
        v72 = v51;
        __int16 v73 = 2048;
        double v74 = v9;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCA %@ floatCCA %f", buf, 0x26u);
      }
    }
    else
    {
      double v8 = WALogCategoryDefaultHandle();
      float v9 = 65535.0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        int v10 = "Instances populated with the same values, CCA not found (slowDPS)";
        BOOL v11 = v8;
        uint32_t v12 = 2;
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v68 = "-[RecommendationEngine medianCCA:]";
      __int16 v69 = 1024;
      int v70 = 90;
      __int16 v71 = 2048;
      v72 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough DPSR_dpsCounterSamples %lu", buf, 0x1Cu);
    }

    double v8 = WALogCategoryDefaultHandle();
    float v9 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v68 = v6;
      int v10 = "Not enough DPSR_dpsCounterSamples %lu";
      BOOL v11 = v8;
      uint32_t v12 = 12;
LABEL_18:
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v10, buf, v12);
    }
  }

  return v9;
}

- (void)isDatapathStudyShowingDPS:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, const __CFString *))a4;
  int v114 = 0;
  uint64_t v129 = 0;
  uint64_t v130 = 0;
  uint64_t v127 = 0;
  uint64_t v128 = 0;
  double v8 = [v6 fieldForKey:@"DPSR_dpsCounterSamples"];
  float v9 = [v8 repeatableValues];
  int v10 = (char *)[v9 count];

  BOOL v11 = WALogCategoryDefaultHandle();
  uint32_t v12 = v11;
  unsigned int v13 = v10 - 1;
  if ((unint64_t)v10 <= 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v117 = 1024;
      int v118 = 147;
      __int16 v119 = 2048;
      *(void *)v120 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough samples %lu", buf, 0x1Cu);
    }

    v7[2](v7, 0, &stru_1000D3628);
    goto LABEL_64;
  }
  v102 = v7;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
    __int16 v117 = 1024;
    int v118 = 152;
    __int16 v119 = 2048;
    *(void *)v120 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Called with countOfSamples %lu", buf, 0x1Cu);
  }
  v100 = v10;

  v112 = v6;
  __int16 v14 = [v6 fieldForKey:@"DPSR_dpsCounterSamples"];
  uint64_t v15 = [v14 repeatableValues];
  __int16 v16 = [v15 objectAtIndex:0];
  v17 = [v16 fieldForKey:@"DPSCS_peerStats"];
  __int16 v18 = [v17 subMessageValue];
  int v19 = [v18 fieldForKey:@"NWAPS_acCompletions"];
  __int16 v20 = [v19 repeatableValues];
  unint64_t v21 = (unint64_t)[v20 count];

  v110 = self;
  if (v21 < 5)
  {
    v23 = v112;
    if (!v21) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v116 = (const char *)v21;
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Out of range acCount found in NWAPS_acCompletions: %lu", buf, 0xCu);
    }

    unint64_t v21 = 4;
    v23 = v112;
  }
  uint64_t v24 = 0;
  v111 = v13;
  unint64_t v103 = v21;
  do
  {
    uint64_t v113 = v24;
    v25 = [v23 fieldForKey:@"DPSR_dpsCounterSamples" v100];
    v26 = [v25 repeatableValues];
    v27 = [v26 objectAtIndex:v13];
    v28 = [v27 fieldForKey:@"DPSCS_peerStats"];
    v29 = [v28 subMessageValue];
    v30 = [v29 fieldForKey:@"NWAPS_acCompletions"];
    v31 = [v30 repeatableValues];
    v32 = [v31 objectAtIndex:v24];
    unint64_t v33 = [v32 fieldForKey:@"NWAPACTC_success"];
    unsigned int v106 = [v33 uint32Value];

    v34 = [v23 fieldForKey:@"DPSR_dpsCounterSamples"];
    v35 = [v34 repeatableValues];
    v36 = [v35 objectAtIndex:0];
    v37 = [v36 fieldForKey:@"DPSCS_peerStats"];
    v38 = [v37 subMessageValue];
    v39 = [v38 fieldForKey:@"NWAPS_acCompletions"];
    v40 = [v39 repeatableValues];
    v41 = [v40 objectAtIndex:v113];
    v42 = [v41 fieldForKey:@"NWAPACTC_success"];
    unsigned int v43 = [v42 uint32Value];

    v44 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v117 = 1024;
      int v118 = 169;
      __int16 v119 = 2048;
      *(void *)v120 = v111;
      *(_WORD *)&v120[8] = 1024;
      *(_DWORD *)v121 = v106;
      *(_WORD *)&v121[4] = 1024;
      *(_DWORD *)v122 = v43;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWAPACTC_success[%lu] %u NWAPACTC_success[0] %u ", buf, 0x28u);
    }

    *((_DWORD *)&v129 + v113) = v106 - v43;
    v45 = [v112 fieldForKey:@"DPSR_dpsCounterSamples"];
    v46 = [v45 repeatableValues];
    id v47 = [v46 objectAtIndex:v111];
    float v48 = [v47 fieldForKey:@"DPSCS_peerStats"];
    v49 = [v48 subMessageValue];
    v50 = [v49 fieldForKey:@"NWAPS_acCompletions"];
    v51 = [v50 repeatableValues];
    unint64_t v52 = [v51 objectAtIndex:v113];
    v53 = [v52 fieldForKey:@"NWAPACTC_qeuedPackets"];
    unsigned int v107 = [v53 uint32Value];

    v54 = [v112 fieldForKey:@"DPSR_dpsCounterSamples"];
    v55 = [v54 repeatableValues];
    v56 = [v55 objectAtIndex:0];
    v57 = [v56 fieldForKey:@"DPSCS_peerStats"];
    v58 = [v57 subMessageValue];
    v59 = [v58 fieldForKey:@"NWAPS_acCompletions"];
    v60 = [v59 repeatableValues];
    v61 = [v60 objectAtIndex:v113];
    v62 = [v61 fieldForKey:@"NWAPACTC_qeuedPackets"];
    unsigned int v63 = [v62 uint32Value];

    unint64_t v64 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v117 = 1024;
      int v118 = 177;
      __int16 v119 = 2048;
      *(void *)v120 = v111;
      *(_WORD *)&v120[8] = 1024;
      *(_DWORD *)v121 = v107;
      *(_WORD *)&v121[4] = 1024;
      *(_DWORD *)v122 = v63;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWAPACTC_qeuedPackets[%lu] %u NWAPACTC_qeuedPackets[0] %u ", buf, 0x28u);
    }

    if (v107) {
      BOOL v65 = v63 == 0;
    }
    else {
      BOOL v65 = 1;
    }
    uint8_t v66 = !v65;
    buf[v113 - 4] = v66;
    v108 = [v112 fieldForKey:@"DPSR_dpsCounterSamples"];
    v67 = [v108 repeatableValues];
    v68 = [v67 objectAtIndex:v111];
    __int16 v69 = [v68 fieldForKey:@"DPSCS_peerStats"];
    int v70 = [v69 subMessageValue];
    __int16 v71 = [v70 fieldForKey:@"NWAPS_acCompletions"];
    v72 = [v71 repeatableValues];
    __int16 v73 = [v72 objectAtIndex:v113];
    double v74 = [v73 fieldForKey:@"NWAPACTC_durSinceLastEnqueueAtLastCheck"];
    unsigned int v75 = [v74 uint32Value];
    *((_DWORD *)&v127 + v113) = v75;

    unsigned int v13 = v111;
    v76 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v117 = 1024;
      int v118 = 183;
      __int16 v119 = 2048;
      *(void *)v120 = v111;
      *(_WORD *)&v120[8] = 1024;
      *(_DWORD *)v121 = v75;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWAPACTC_durSinceLastEnqueueAtLastCheck[%lu] %u", buf, 0x22u);
    }

    v23 = v112;
    uint64_t v24 = v113 + 1;
  }
  while (v103 != v113 + 1);
LABEL_26:
  uint64_t v77 = 0;
  char v78 = 0;
  v79 = 0;
  do
  {
    char v104 = v78;
    v109 = v79;
    uint64_t v80 = v77;
    while (1)
    {
      v81 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        int v82 = *((_DWORD *)&v129 + v80);
        int v83 = buf[v80 - 4];
        int v84 = *((_DWORD *)&v127 + v80);
        *(_DWORD *)buf = 136448002;
        v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
        __int16 v117 = 1024;
        int v118 = 188;
        __int16 v119 = 1024;
        *(_DWORD *)v120 = v80;
        *(_WORD *)&v120[4] = 1024;
        *(_DWORD *)&v120[6] = v82;
        *(_WORD *)v121 = 1024;
        *(_DWORD *)&v121[2] = v80;
        *(_WORD *)v122 = 1024;
        *(_DWORD *)&v122[2] = v83;
        __int16 v123 = 1024;
        int v124 = v80;
        __int16 v125 = 1024;
        int v126 = v84;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Evaluating deltaSuccessPerAC[%d] %d queuedPendingAtBeginningAndEnd[%d] %d durSinceLastEnqueueAtLastCheck[%d] %d", buf, 0x36u);
      }

      if ([(RecommendationPreferences *)v110->_preferences force_dps_recommend_always])
      {
        v85 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
          __int16 v117 = 1024;
          int v118 = 191;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%{public}s::%d:force_dps_recommend_always is true, faking 0 success, pending data, and a a long stall", buf, 0x12u);
        }

        LODWORD(v130) = 0;
        BYTE2(v114) = 1;
        LODWORD(v128) = 4000
                      * [(RecommendationPreferences *)v110->_preferences dps_stall_dur_for_wd];
      }
      if (!*((_DWORD *)&v129 + v80))
      {
        if (buf[v80 - 4])
        {
          unint64_t v86 = *((unsigned int *)&v127 + v80);
          if (1000
             * (uint64_t)[(RecommendationPreferences *)v110->_preferences dps_stall_dur_for_wd] <= v86)
            break;
        }
      }
      if (++v80 == 4)
      {
        if (v104)
        {
          v79 = v109;
          goto LABEL_51;
        }
        v96 = WALogCategoryDefaultHandle();
        id v6 = v112;
        uint64_t v7 = (void (**)(id, void, const __CFString *))v102;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
          __int16 v117 = 1024;
          int v118 = 227;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: Recommending WARecommendNull", buf, 0x12u);
        }

        v93 = (void (*)(void *, uint64_t, void *))v102[2];
        v94 = v102;
        uint64_t v95 = 0;
        v79 = v109;
LABEL_62:
        v93(v94, v95, v79);
        goto LABEL_63;
      }
    }
    [(RecommendationEngine *)v110 medianCCA:v112];
    if (v87 >= 35.0)
    {
      [(RecommendationEngine *)v110 medianCCA:v112];
      if (v89 >= (float)[(RecommendationPreferences *)v110->_preferences dps_wd_cca]) {
        CFStringRef v88 = @"Data Path Stuck~High CCA";
      }
      else {
        CFStringRef v88 = @"Data Path Stuck~Med CCA";
      }
    }
    else
    {
      CFStringRef v88 = @"Data Path Stuck~Low CCA";
    }
    uint64_t v105 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v88, v100);

    v90 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v117 = 1024;
      int v118 = 210;
      __int16 v119 = 2112;
      *(void *)v120 = v105;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@", buf, 0x1Cu);
    }

    uint64_t v77 = v80 + 1;
    char v78 = 1;
    BOOL v65 = v80 == 3;
    v79 = (void *)v105;
  }
  while (!v65);
LABEL_51:
  id v91 = [(RecommendationPreferences *)v110->_preferences dps_capture_evaluated_at_sample];
  if (v101 == v91)
  {
    v92 = WALogCategoryDefaultHandle();
    id v6 = v112;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v117 = 1024;
      int v118 = 218;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: Recommending WARecommendFullCapture", buf, 0x12u);
    }

    uint64_t v7 = (void (**)(id, void, const __CFString *))v102;
    v93 = (void (*)(void *, uint64_t, void *))v102[2];
    v94 = v102;
    uint64_t v95 = 1;
    goto LABEL_62;
  }
  id v97 = [(RecommendationPreferences *)v110->_preferences dps_trap_evaluated_at_sample];
  v98 = WALogCategoryDefaultHandle();
  v99 = v98;
  id v6 = v112;
  if (v101 == v97)
  {
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v117 = 1024;
      int v118 = 222;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: Recommending WARecommendTrapWatchdog", buf, 0x12u);
    }

    uint64_t v7 = (void (**)(id, void, const __CFString *))v102;
    v93 = (void (*)(void *, uint64_t, void *))v102[2];
    v94 = v102;
    uint64_t v95 = 2;
    goto LABEL_62;
  }
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v116 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
    __int16 v117 = 1024;
    int v118 = 232;
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Returning", buf, 0x12u);
  }

  uint64_t v7 = (void (**)(id, void, const __CFString *))v102;
  ((void (*)(void *, void, const __CFString *))v102[2])(v102, 0, &stru_1000D3628);
LABEL_63:

LABEL_64:
}

- (void)addNumRecommendedWD
{
  id v3 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numRecommendedWD"];

  if (v3)
  {
    v4 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numRecommendedWD"];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue] + 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = +[NSNumber numberWithInt:1];
  }
  [(NSMutableDictionary *)self->_dpsWDBudgetDict setObject:v5 forKey:@"dps_numRecommendedWD"];
}

- (void)addNumSuppressedWD
{
  id v3 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numSuppressedWD"];

  if (v3)
  {
    v4 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numSuppressedWD"];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue] + 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = +[NSNumber numberWithInt:1];
  }
  [(NSMutableDictionary *)self->_dpsWDBudgetDict setObject:v5 forKey:@"dps_numSuppressedWD"];
}

- (void)addNumRecommendedCapture
{
  id v3 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numRecommendedCapture"];

  if (v3)
  {
    v4 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numRecommendedCapture"];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue] + 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = +[NSNumber numberWithInt:1];
  }
  [(NSMutableDictionary *)self->_dpsWDBudgetDict setObject:v5 forKey:@"dps_numRecommendedCapture"];
}

- (void)addNumSuppressedCapture
{
  id v3 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numSuppressedCapture"];

  if (v3)
  {
    v4 = [(NSMutableDictionary *)self->_dpsWDBudgetDict valueForKey:@"dps_numSuppressedCapture"];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue] + 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = +[NSNumber numberWithInt:1];
  }
  [(NSMutableDictionary *)self->_dpsWDBudgetDict setObject:v5 forKey:@"dps_numSuppressedCapture"];
}

- (void)recommendActionFromData:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(RecommendationPreferences *)self->_preferences disable_dps_wd])
  {
    float v9 = [v6 fieldForKey:@"DPSR_dpsCounterSamples"];
    int v10 = [v9 repeatableValues];
    id v11 = [v10 count];
    if (v11 == (id)[(RecommendationPreferences *)self->_preferences dps_capture_evaluated_at_sample])
    {
    }
    else
    {
      uint32_t v12 = [v6 fieldForKey:@"DPSR_dpsCounterSamples"];
      unsigned int v13 = [v12 repeatableValues];
      id v14 = [v13 count];
      unint64_t v15 = [(RecommendationPreferences *)self->_preferences dps_trap_evaluated_at_sample];

      if (v14 != (id)v15) {
        goto LABEL_9;
      }
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100043CE0;
    v16[3] = &unk_1000D1160;
    v16[4] = self;
    id v18 = v7;
    id v17 = v6;
    [(RecommendationEngine *)self isDatapathStudyShowingDPS:v17 andReply:v16];

    goto LABEL_9;
  }
  double v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v20 = "-[RecommendationEngine recommendActionFromData:andReply:]";
    __int16 v21 = 1024;
    int v22 = 290;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WARecommendNull disable_dps_wd", buf, 0x12u);
  }

  (*((void (**)(id, void, const __CFString *))v7 + 2))(v7, 0, @"disable_dps_wd");
LABEL_9:
}

- (NSMutableDictionary)dpsWDBudgetDict
{
  return self->_dpsWDBudgetDict;
}

- (void)setDpsWDBudgetDict:(id)a3
{
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
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_storeStrong((id *)&self->_dpsWDBudgetDict, 0);
}

@end