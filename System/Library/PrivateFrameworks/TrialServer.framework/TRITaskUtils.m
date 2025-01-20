@interface TRITaskUtils
+ (BOOL)updateExperimentHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forExperiment:(id)a4 treatment:(id)a5 deployment:(int)a6 experimentRecord:(id)a7 isBecomingObsolete:(BOOL)a8 categoricalMetric:(id)a9 context:(id)a10;
+ (BOOL)updateExperimentHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forExperiment:(id)a4 treatment:(id)a5 deployment:(int)a6 experimentRecord:(id)a7 isBecomingObsolete:(BOOL)a8 context:(id)a9;
+ (id)_bmltStateForAnalyticsFromStatusType:(unsigned __int8)a3;
+ (id)_experimentStateForAnalyticsFromInternalState:(unsigned __int8)a3;
+ (id)_rolloutStateForAnalyticsFromInternalState:(unsigned __int8)a3;
+ (void)addAttribution:(id)a3 toTaskTags:(id)a4;
+ (void)updateBMLTHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forBMLT:(id)a4 deployment:(int)a5 fps:(id)a6 bmltRecord:(id)a7 context:(id)a8;
+ (void)updateRolloutHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forRollout:(id)a4 ramp:(id)a5 deployment:(int)a6 fps:(id)a7 namespaces:(id)a8 telemetryMetric:(id)a9 rolloutRecord:(id)a10 isBecomingObsolete:(BOOL)a11 context:(id)a12;
@end

@implementation TRITaskUtils

+ (void)addAttribution:(id)a3 toTaskTags:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  if (v19)
  {
    if (!v7)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, a1, @"TRITaskUtils.m", 32, @"Invalid parameter not satisfying: %@", @"tags" object file lineNumber description];
    }
    v8 = [v19 teamIdentifier];

    if (v8)
    {
      v9 = NSString;
      v10 = [v19 teamIdentifier];
      v11 = [v9 stringWithFormat:@"teamId=%@", v10];
      [v7 addObject:v11];
    }
    v12 = NSString;
    v13 = [v19 networkOptions];
    v14 = objc_msgSend(v12, "stringWithFormat:", @"netopt.cellular=%d", objc_msgSend(v13, "allowsCellularAccess"));
    [v7 addObject:v14];

    v15 = NSString;
    v16 = [v19 networkOptions];
    v17 = objc_msgSend(v15, "stringWithFormat:", @"netopt.discretion=%lu", objc_msgSend(v16, "discretionaryBehavior"));
    [v7 addObject:v17];
  }
}

+ (id)_experimentStateForAnalyticsFromInternalState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v9[8] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F347B690;
  v8[1] = &unk_1F347B6A8;
  v9[0] = @"exp_st_AL";
  v9[1] = @"exp_st_FE";
  v8[2] = &unk_1F347B6C0;
  v8[3] = &unk_1F347B6D8;
  v9[2] = @"exp_st_AC";
  v9[3] = @"exp_st_DE";
  v8[4] = &unk_1F347B6F0;
  v8[5] = &unk_1F347B708;
  v9[4] = @"exp_st_AL_F";
  v9[5] = @"exp_st_FE_F";
  v8[6] = &unk_1F347B720;
  v8[7] = &unk_1F347B738;
  v9[6] = @"exp_st_AC_F";
  v9[7] = @"exp_st_DE_F";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:8];
  v5 = [NSNumber numberWithUnsignedChar:v3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

+ (BOOL)updateExperimentHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forExperiment:(id)a4 treatment:(id)a5 deployment:(int)a6 experimentRecord:(id)a7 isBecomingObsolete:(BOOL)a8 context:(id)a9
{
  return [a1 updateExperimentHistoryDatabaseWithAllocationStatus:a3 forExperiment:a4 treatment:a5 deployment:*(void *)&a6 experimentRecord:a7 isBecomingObsolete:a8 categoricalMetric:0 context:a9];
}

+ (BOOL)updateExperimentHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forExperiment:(id)a4 treatment:(id)a5 deployment:(int)a6 experimentRecord:(id)a7 isBecomingObsolete:(BOOL)a8 categoricalMetric:(id)a9 context:(id)a10
{
  BOOL log = a8;
  unsigned int v99 = a3;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a9;
  id v101 = a10;
  id v17 = v13;
  id v18 = v14;
  id v19 = v18;
  id v98 = v15;
  if (v15)
  {
    uint64_t v20 = (uint64_t)v17;
    if (!v17)
    {
      v21 = [v15 experimentDeployment];
      uint64_t v20 = [v21 experimentId];
    }
    uint64_t v22 = (uint64_t)v19;
    if ([v19 isEqualToString:@"unspecified-or-default-treatment"])
    {
      uint64_t v22 = [v15 treatmentId];
    }
    uint64_t v102 = v20;
    v89 = v19;
    id v91 = v16;
    id v93 = v17;
    if (a6 == -1)
    {
      v23 = [v15 experimentDeployment];
      a6 = [v23 deploymentId];
    }
    unsigned int v97 = a6;
    uint64_t v96 = [v15 deploymentEnvironment];
    id v24 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v25 = [v15 namespaces];
    v26 = objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v27 = [v15 namespaces];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v104 objects:v120 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v105 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          id v33 = objc_alloc(MEMORY[0x1E4FB0278]);
          v34 = [v32 name];
          v35 = objc_msgSend(v33, "initWithName:compatibilityVersion:", v34, objc_msgSend(v32, "compatibilityVersion"));

          [v26 addObject:v35];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v104 objects:v120 count:16];
      }
      while (v29);
    }

    id v16 = v91;
    id v17 = v93;
    id v19 = v89;
    id v36 = (id)v102;
  }
  else
  {
    unsigned int v97 = a6;
    v26 = 0;
    uint64_t v96 = 0;
    uint64_t v22 = (uint64_t)v18;
    id v36 = v17;
  }
  v37 = v101;
  v103 = v36;
  if (v36)
  {
    if (v22) {
      v38 = (__CFString *)v22;
    }
    else {
      v38 = @"unspecified-or-default-treatment";
    }
    id v39 = objc_alloc(MEMORY[0x1E4FB0108]);
    v40 = objc_opt_new();
    uint64_t v41 = [v39 initWithEventDate:v40 eventType:v99 deploymentEnvironment:v96 experimentId:v36 deploymentId:v97 treatmentId:v38 errorOrDeactivationReason:0 namespaces:v26];

    v42 = v41;
    v43 = [v101 experimentHistoryDatabase];
    v95 = [v43 getAllAllocationStatusesForExperimentId:v36 deploymentId:v97 treatmentId:v38];

    v44 = [v101 experimentHistoryDatabase];
    char v45 = [v44 addRecord:v42];

    if ((v45 & 1) == 0)
    {
      v60 = TRILogCategory_Server();
      v46 = v98;
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
LABEL_57:

        goto LABEL_58;
      }
      [MEMORY[0x1E4FB0058] categoricalValueForExperimentAllocationStatus:v99];
      v61 = loga = v60;
      *(_DWORD *)buf = 138544130;
      uint64_t v110 = (uint64_t)v61;
      __int16 v111 = 2112;
      *(void *)v112 = v38;
      *(_WORD *)&v112[8] = 2114;
      *(void *)&v112[10] = v103;
      *(_WORD *)&v112[18] = 1024;
      *(_DWORD *)v113 = v97;
      _os_log_error_impl(&dword_1DA291000, loga, OS_LOG_TYPE_ERROR, "Failed to update experiment history database while marking %{public}@ of treatment %@ : experiment %{public}@ : deployment %d. Note: this allocation status will not be logged to analytics.", buf, 0x26u);

LABEL_38:
      v60 = loga;
      goto LABEL_57;
    }
    char v83 = v45;
    v46 = v98;
    v84 = v42;
    if (log)
    {
      v47 = v95;
      if (![v95 count])
      {
        loga = 0;
        goto LABEL_36;
      }
      v118[0] = &unk_1F347B690;
      v116 = &unk_1F347B6D8;
      v117 = @"exp_st_AL_O";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      v81 = v38;
      v49 = v48 = v19;
      v118[1] = &unk_1F347B6A8;
      v119[0] = v49;
      v114 = &unk_1F347B6D8;
      v115 = @"exp_st_FE_O";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      v51 = id v50 = v16;
      v119[1] = v51;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:2];

      id v16 = v50;
      v53 = [v95 objectAtIndexedSubscript:0];
      v54 = [v52 objectForKeyedSubscript:v53];
      v55 = [NSNumber numberWithUnsignedChar:v99];
      uint64_t v56 = [v54 objectForKey:v55];

      id v19 = v48;
      v38 = v81;
      if (!v56)
      {
        v57 = TRILogCategory_Server();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = [v95 objectAtIndexedSubscript:0];
          int v59 = [v58 intValue];
          *(_DWORD *)buf = 138413314;
          uint64_t v110 = (uint64_t)v103;
          __int16 v111 = 2112;
          *(void *)v112 = v81;
          *(_WORD *)&v112[8] = 1024;
          *(_DWORD *)&v112[10] = v97;
          *(_WORD *)&v112[14] = 1024;
          *(_DWORD *)&v112[16] = v59;
          *(_WORD *)v113 = 1024;
          *(_DWORD *)&v113[2] = v99;
          _os_log_impl(&dword_1DA291000, v57, OS_LOG_TYPE_DEFAULT, "Experiment - Treatment - Deployment: %@ - %@ - %d. Previous state: %d, Current state: %d", buf, 0x28u);
        }
      }
      loga = v56;

      v37 = v101;
    }
    else
    {
      loga = 0;
    }
    v47 = v95;
LABEL_36:
    v62 = [NSNumber numberWithUnsignedChar:v99];
    char v63 = [v47 containsObject:v62];

    if ((v63 & 1) == 0)
    {
      if (loga)
      {
        v64 = loga;
      }
      else
      {
        v64 = [a1 _experimentStateForAnalyticsFromInternalState:v99];
        v42 = v84;
        if (!v64)
        {
          v60 = 0;
          char v45 = v83;
          goto LABEL_57;
        }
      }
      v90 = v19;
      v100 = v64;
      if (v16) {
        [MEMORY[0x1E4FB05A8] metricWithName:v64 categoricalValue:v16];
      }
      else {
      v86 = [MEMORY[0x1E4FB05A8] metricWithName:v64];
      }
      v65 = objc_opt_new();
      v66 = [v65 ensureExperimentFields];
      [v66 setClientExperimentId:v103];

      if (v38 == @"unspecified-or-default-treatment") {
        v67 = 0;
      }
      else {
        v67 = v38;
      }
      v68 = [v65 ensureExperimentFields];
      [v68 setClientTreatmentId:v67];

      if (v97 == -1)
      {
        v69 = 0;
      }
      else
      {
        v69 = [NSNumber numberWithInt:v97];
      }
      id v94 = v17;
      v70 = [v69 stringValue];
      [v65 setClientDeploymentId:v70];

      if (v97 != -1) {
      v82 = v38;
      }
      id v92 = v16;
      v71 = TRIDeploymentEnvironment_EnumDescriptor();
      v72 = [v71 textFormatNameForValue:v96];

      if (!v72) {
        v72 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", (int)v96);
      }
      [v65 setClientDeploymentEnv:v72];
      v37 = v101;
      v73 = [v101 client];
      v74 = [v73 logger];
      v75 = [v101 client];
      [v75 trackingId];
      v77 = v76 = v65;
      v108 = v86;
      v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
      [v74 logWithTrackingId:v77 metrics:v78 dimensions:0 trialSystemTelemetry:v76];

      id v16 = v92;
      id v17 = v94;
      v60 = loga;
      id v19 = v90;
      v38 = v82;
      v42 = v84;
      char v45 = v83;
      v46 = v98;
      goto LABEL_57;
    }
    v42 = v84;
    char v45 = v83;
    goto LABEL_38;
  }
  v42 = TRILogCategory_Server();
  v46 = v98;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v80 = [MEMORY[0x1E4FB0058] categoricalValueForExperimentAllocationStatus:v99];
    *(_DWORD *)buf = 138412802;
    v38 = (__CFString *)v22;
    uint64_t v110 = v22;
    __int16 v111 = 1024;
    *(_DWORD *)v112 = v97;
    *(_WORD *)&v112[4] = 2114;
    *(void *)&v112[6] = v80;
    _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "ExperimentID was found to be empty while creating a record for the Experiment History Database. Treatment %@ : Deployment %d; Allocation Status: %{public}@",
      buf,
      0x1Cu);
  }
  else
  {
    v38 = (__CFString *)v22;
  }
  char v45 = 0;
LABEL_58:

  return v45;
}

+ (id)_rolloutStateForAnalyticsFromInternalState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v9[8] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F347B690;
  v8[1] = &unk_1F347B6C0;
  v9[0] = @"roll_st_AL";
  v9[1] = @"roll_st_FE";
  v8[2] = &unk_1F347B6D8;
  v8[3] = &unk_1F347B6A8;
  v9[2] = @"roll_st_AC";
  v9[3] = @"roll_st_DE";
  v8[4] = &unk_1F347B750;
  v8[5] = &unk_1F347B6F0;
  v9[4] = @"roll_st_AL_F";
  v9[5] = @"roll_st_FE_F";
  v8[6] = &unk_1F347B708;
  v8[7] = &unk_1F347B720;
  v9[6] = @"roll_st_AC_F";
  v9[7] = @"roll_st_DE_F";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:8];
  v5 = [NSNumber numberWithUnsignedChar:v3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

+ (void)updateRolloutHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forRollout:(id)a4 ramp:(id)a5 deployment:(int)a6 fps:(id)a7 namespaces:(id)a8 telemetryMetric:(id)a9 rolloutRecord:(id)a10 isBecomingObsolete:(BOOL)a11 context:(id)a12
{
  unsigned int v77 = a3;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a12;
  id v22 = v15;
  id v23 = v16;
  id v24 = v17;
  id v25 = v23;
  if (v17)
  {
    char v83 = TRIValidateFactorPackSetId();
  }
  else
  {
    char v83 = 0;
  }
  id v26 = v18;
  v79 = v26;
  if (!v20)
  {
    v32 = v26;
    v82 = v25;
    v27 = v22;
    if (!v22) {
      goto LABEL_44;
    }
LABEL_18:
    id v74 = v25;
    v35 = v24;
    id v36 = objc_alloc(MEMORY[0x1E4FB0238]);
    v37 = [MEMORY[0x1E4F1C9C8] now];
    v73 = v32;
    uint64_t v38 = [v36 initWithEventLogTime:v37 eventType:v77 rolloutId:v27 rampId:v82 factorPackSetId:v83 deploymentId:a6 namespaces:v32];

    id v39 = [v21 rolloutHistoryDatabase];
    [v39 getAllAllocationStatusesForRolloutId:v27 rampId:v82 deploymentId:a6 factorPackSetId:v83];
    uint64_t v41 = v40 = v21;

    v72 = v40;
    v42 = [v40 rolloutHistoryDatabase];
    v71 = (void *)v38;
    LOBYTE(v40) = [v42 addRecord:v38];

    if ((v40 & 1) == 0)
    {
      v43 = TRILogCategory_Server();
      id v24 = v35;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v67 = [MEMORY[0x1E4FB0058] categoricalValueForRolloutAllocationStatus:v77];
        *(_DWORD *)buf = 138544386;
        id v92 = v67;
        __int16 v93 = 2112;
        id v94 = v83;
        __int16 v95 = 2114;
        uint64_t v96 = v27;
        __int16 v97 = 2114;
        id v98 = v82;
        __int16 v99 = 1024;
        int v100 = a6;
        _os_log_error_impl(&dword_1DA291000, v43, OS_LOG_TYPE_ERROR, "Failed to update rollout history database while marking %{public}@ of fps %@ : rollout %{public}@ : ramp %{public}@ : deployment %d. Note: this allocation status will not be logged to analytics.", buf, 0x30u);
      }
      id v25 = v74;
      goto LABEL_43;
    }
    id v68 = v22;
    v69 = v35;
    v43 = objc_opt_new();
    if ([v41 count])
    {
      unint64_t v44 = 0;
      do
      {
        char v45 = [v41 objectAtIndexedSubscript:v44];
        char v46 = [&unk_1F347B2D0 containsObject:v45];

        if (v46) {
          break;
        }
        v47 = [v41 objectAtIndexedSubscript:v44];
        [v43 addObject:v47];

        ++v44;
      }
      while ([v41 count] > v44);
    }
    if (v19)
    {
      id v24 = v35;
      v32 = v73;
      id v25 = v74;
    }
    else
    {
      id v24 = v35;
      v32 = v73;
      id v25 = v74;
      if (a11)
      {
        if ([v43 count])
        {
          v87 = &unk_1F347B6A8;
          v88 = @"roll_st_AL_O";
          v89[0] = &unk_1F347B690;
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          v90[0] = v48;
          v89[1] = &unk_1F347B6C0;
          v85 = &unk_1F347B6A8;
          v86 = @"roll_st_FE_O";
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          v90[1] = v49;
          v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];

          id v50 = [v43 objectAtIndexedSubscript:0];
          v51 = [v75 objectForKeyedSubscript:v50];
          v52 = [NSNumber numberWithUnsignedChar:v77];
          id v19 = [v51 objectForKey:v52];

          v32 = v73;
          id v24 = v69;
          id v25 = v74;
        }
        else
        {
          id v19 = 0;
        }
      }
    }
    v53 = [NSNumber numberWithUnsignedChar:v77];
    char v54 = [v43 containsObject:v53];

    if (v54)
    {
      id v22 = v68;
LABEL_43:

      id v21 = v72;
      goto LABEL_44;
    }
    if (v19)
    {
      id v55 = v19;
    }
    else
    {
      id v55 = [a1 _rolloutStateForAnalyticsFromInternalState:v77];
      id v22 = v68;
      if (!v55)
      {
        id v19 = 0;
        goto LABEL_43;
      }
    }
    v78 = v55;
    uint64_t v56 = [MEMORY[0x1E4FB05A8] metricWithName:v55];
    v57 = objc_opt_new();
    v58 = [v57 ensureRolloutFields];
    [v58 setClientRolloutId:v27];

    int v59 = [v57 ensureRolloutFields];
    [v59 setClientRampId:v82];

    v60 = [v57 ensureRolloutFields];
    [v60 setClientFactorPackSetId:v83];

    if (a6 == -1)
    {
      v61 = 0;
    }
    else
    {
      v61 = [NSNumber numberWithInt:a6];
    }
    id v76 = v19;
    v62 = [v61 stringValue];
    [v57 setClientDeploymentId:v62];

    if (a6 != -1) {
    v81 = [v72 client];
    }
    char v63 = [v81 logger];
    v64 = [v72 client];
    v65 = [v64 trackingId];
    v84 = v56;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    [v63 logWithTrackingId:v65 metrics:v66 dimensions:0 trialSystemTelemetry:v57];

    id v22 = v68;
    id v24 = v69;
    id v25 = v74;
    id v19 = v76;
    v32 = v73;
    goto LABEL_43;
  }
  v27 = v22;
  if (!v22)
  {
    uint64_t v28 = [v20 deployment];
    v27 = [v28 rolloutId];
  }
  v82 = v25;
  if (!v25)
  {
    v82 = [v20 rampId];
  }
  if (!a6)
  {
    uint64_t v29 = [v20 deployment];
    a6 = [v29 deploymentId];
  }
  if (!v83)
  {
    uint64_t v30 = [v20 activeFactorPackSetId];

    if (v30)
    {
      v31 = [v20 activeFactorPackSetId];
      char v83 = TRIValidateFactorPackSetId();
    }
    else
    {
      char v83 = 0;
    }
  }
  id v33 = (void *)MEMORY[0x1E4F1C978];
  v34 = [v20 namespaces];
  v32 = [v33 arrayWithArray:v34];

  if (v27) {
    goto LABEL_18;
  }
LABEL_44:
}

+ (id)_bmltStateForAnalyticsFromStatusType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v9[10] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F347B6C0;
  v8[1] = &unk_1F347B6D8;
  v9[0] = @"bmlt_st_AL_F";
  v9[1] = @"bmlt_st_AL";
  v8[2] = &unk_1F347B750;
  v8[3] = &unk_1F347B6F0;
  v9[2] = @"bmlt_st_FE_F";
  v9[3] = @"bmlt_st_FE";
  v8[4] = &unk_1F347B708;
  v8[5] = &unk_1F347B720;
  v9[4] = @"bmlt_st_AC_F";
  v9[5] = @"bmlt_st_AC";
  v8[6] = &unk_1F347B738;
  v8[7] = &unk_1F347B768;
  v9[6] = @"bmlt_st_DE_F";
  v9[7] = @"bmlt_st_DE";
  void v8[8] = &unk_1F347B780;
  v8[9] = &unk_1F347B798;
  v9[8] = @"bmlt_st_AL_O";
  void v9[9] = @"bmlt_st_FE_O";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:10];
  v5 = [NSNumber numberWithUnsignedChar:v3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

+ (void)updateBMLTHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forBMLT:(id)a4 deployment:(int)a5 fps:(id)a6 bmltRecord:(id)a7 context:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = v14;
  if (v15)
  {
    id v19 = TRIValidateFactorPackSetId();
  }
  else
  {
    id v19 = 0;
  }
  id v20 = v18;
  if (!v16) {
    goto LABEL_13;
  }
  if (v18)
  {
    if (v11) {
      goto LABEL_7;
    }
LABEL_10:
    id v22 = [v16 bmltDeployment];
    uint64_t v11 = [v22 deploymentId];

    if (v19) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  id v21 = [v16 bmltDeployment];
  id v20 = [v21 backgroundMLTaskId];

  if (!v11) {
    goto LABEL_10;
  }
LABEL_7:
  if (v19) {
    goto LABEL_13;
  }
LABEL_11:
  id v23 = [v16 activeFactorPackSetId];

  if (!v23)
  {
    id v19 = 0;
    if (!v20) {
      goto LABEL_33;
    }
LABEL_14:
    id v50 = a1;
    id v54 = v18;
    id v55 = v15;
    id v25 = objc_alloc(MEMORY[0x1E4FB0088]);
    id v26 = [MEMORY[0x1E4F1C9C8] now];
    unsigned int v52 = v12;
    uint64_t v56 = (void *)[v25 initWithEventDate:v26 eventType:v12 backgroundMLTaskId:v20 deploymentId:v11 factorPackSetId:v19];

    v57 = v17;
    v27 = [v17 bmltHistoryDatabase];
    uint64_t v28 = [v27 getAllAllocationStatusesForBMLTId:v20 deploymentId:v11 factorPackSetId:v19];

    uint64_t v29 = objc_opt_new();
    if ([v28 count])
    {
      unint64_t v30 = 0;
      do
      {
        v31 = [v28 objectAtIndexedSubscript:v30];
        char v32 = [&unk_1F347B2E8 containsObject:v31];

        if (v32) {
          break;
        }
        id v33 = [v28 objectAtIndexedSubscript:v30];
        [v29 addObject:v33];

        ++v30;
      }
      while ([v28 count] > v30);
    }
    v34 = [v57 bmltHistoryDatabase];
    char v35 = [v34 addRecord:v56];

    if (v35)
    {
      id v36 = [NSNumber numberWithUnsignedChar:v52];
      char v37 = [v29 containsObject:v36];

      if (v37)
      {
LABEL_32:

        id v18 = v54;
        id v15 = v55;
        id v17 = v57;
        goto LABEL_33;
      }
      uint64_t v38 = [v50 _bmltStateForAnalyticsFromStatusType:v52];
      if (v38)
      {
        v53 = [MEMORY[0x1E4FB05A8] metricWithName:v38];
        id v39 = objc_opt_new();
        v40 = [v39 ensureBMLTFields];
        [v40 setClientBmltId:v20];

        uint64_t v41 = [v39 ensureBMLTFields];
        [v41 setClientBmltFactorPackSetId:v19];

        if (v11 == -1)
        {
          v42 = 0;
        }
        else
        {
          v42 = [NSNumber numberWithInt:v11];
        }
        unint64_t v44 = [v42 stringValue];
        v51 = v39;
        [v39 setClientDeploymentId:v44];

        if (v11 != -1) {
        v49 = [v57 client];
        }
        v48 = [v49 logger];
        char v45 = [v57 client];
        char v46 = [v45 trackingId];
        v58 = v53;
        v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        [v48 logWithTrackingId:v46 metrics:v47 dimensions:0 trialSystemTelemetry:v51];
      }
    }
    else
    {
      uint64_t v38 = TRILogCategory_Server();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v43 = [v50 _bmltStateForAnalyticsFromStatusType:v52];
        *(_DWORD *)buf = 138544130;
        v60 = v43;
        __int16 v61 = 2112;
        v62 = v19;
        __int16 v63 = 2114;
        v64 = v20;
        __int16 v65 = 1024;
        int v66 = v11;
        _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "Failed to update BMLT history database while marking %{public}@ of fps %@ : bmlt %{public}@ : deployment %d. Note: this allocation status will not be logged to analytics.", buf, 0x26u);
      }
    }

    goto LABEL_32;
  }
  id v24 = [v16 activeFactorPackSetId];
  id v19 = TRIValidateFactorPackSetId();

LABEL_13:
  if (v20) {
    goto LABEL_14;
  }
LABEL_33:
}

@end