@interface PLSubmissionConfig
+ (BOOL)internalSubmissionBehavior;
+ (id)getDateMarkerFromSystemDate:(id)a3;
+ (void)clearTaskingDefaults;
+ (void)submitTaskingDefaultsCheckStateToCA:(id)a3;
- (BOOL)conditionCheckForEnergy;
- (BOOL)conditionCheckForTaskingType:(id)a3;
- (BOOL)enableDPUpload;
- (BOOL)hasFileToSubmit;
- (BOOL)internal;
- (BOOL)isDRTasking;
- (BOOL)isValidSubmissionFilesMask;
- (BOOL)isValidTaskingBlob;
- (BOOL)seed;
- (BOOL)shouldStartTaskingToday;
- (BOOL)shouldSubmitToday;
- (BOOL)signpostDisable;
- (BOOL)submitBDC;
- (BOOL)submitBG;
- (BOOL)submitCE;
- (BOOL)submitMSS;
- (BOOL)submitPLL;
- (BOOL)submitPLLUpgrade;
- (BOOL)submitSP;
- (BOOL)submitXC;
- (NSArray)builds;
- (NSArray)removeEntries;
- (NSArray)taskingFiles;
- (NSArray)trimmingQueries;
- (NSDate)configDateApplied;
- (NSDate)configDateReceived;
- (NSDate)endDate;
- (NSDate)lastBatteryTimestampSystem;
- (NSDate)startDate;
- (NSDictionary)ckTagConfig;
- (NSDictionary)defaultTaskingTypeParameters;
- (NSDictionary)hashEntries;
- (NSDictionary)perModelTaskingTypeParameters;
- (NSDictionary)plTaskingTables;
- (NSDictionary)ppsTaskingTables;
- (NSDictionary)signpostAllowlist;
- (NSDictionary)taskingPercentage;
- (NSNumber)cacheSize;
- (NSNumber)capSize;
- (NSString)blobFailureReason;
- (NSString)deviceModel;
- (NSString)filePath;
- (NSString)ondemand;
- (NSString)request;
- (NSString)tagUUID;
- (NSString)taskingBuild;
- (NSString)taskingDeviceModels;
- (NSString)taskingPopulation;
- (NSString)taskingType;
- (NSUUID)configUUID;
- (PLSubmissionConfig)initWithPayload:(id)a3;
- (PLSubmissionConfig)initWithReasonType:(signed __int16)a3;
- (PLSubmissionConfig)initWithReasonType:(signed __int16)a3 DRConfig:(id)a4;
- (double)dice;
- (id)contextDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getDateMarker;
- (id)getDateMarkerLegacy;
- (id)getSubmitReasonTypeToCAFieldValue;
- (id)getSubmitReasonTypeToFlushReason;
- (id)getSubmitReasonTypeToReasonLog;
- (id)getSubmitReasonTypeToStorageEventOTAType;
- (id)splitBySubmissionType;
- (id)submissionCategory;
- (id)submissionMaskToString;
- (signed)submitReasonType;
- (unint64_t)submittedFilesMask;
- (void)conditionCheckForEnergy;
- (void)emitQueryEvent:(BOOL)a3;
- (void)emitSubmitEvent;
- (void)emitTaskingTypeSpecifiedEvent;
- (void)initTagInfoForReasonType:(signed __int16)a3 withStartDate:(id)a4 withEndDate:(id)a5;
- (void)initializeFilesToBeSubmitted;
- (void)isValidTaskingBlob;
- (void)readTaskingDefaults;
- (void)readTaskingPayloadOverride:(id)a3;
- (void)setBlobFailureReason:(id)a3;
- (void)setBuilds:(id)a3;
- (void)setCacheSize:(id)a3;
- (void)setCapSize:(id)a3;
- (void)setCkTagConfig:(id)a3;
- (void)setConfigDateApplied:(id)a3;
- (void)setConfigDateReceived:(id)a3;
- (void)setConfigUUID:(id)a3;
- (void)setDefaultTaskingTypeParameters:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDice:(double)a3;
- (void)setEnableDPUpload:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setHashEntries:(id)a3;
- (void)setInternal:(BOOL)a3;
- (void)setIsDRTasking:(BOOL)a3;
- (void)setLastBatteryTimestampSystem:(id)a3;
- (void)setOndemand:(id)a3;
- (void)setPerModelTaskingTypeParameters:(id)a3;
- (void)setPlTaskingTables:(id)a3;
- (void)setPpsTaskingTables:(id)a3;
- (void)setRemoveEntries:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSeed:(BOOL)a3;
- (void)setSignpostAllowlist:(id)a3;
- (void)setSignpostDisable:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setSubmitReasonType:(signed __int16)a3;
- (void)setSubmittedFilesMask:(unint64_t)a3;
- (void)setTagUUID:(id)a3;
- (void)setTaskingBuild:(id)a3;
- (void)setTaskingDeviceModels:(id)a3;
- (void)setTaskingFiles:(id)a3;
- (void)setTaskingPercentage:(id)a3;
- (void)setTaskingPopulation:(id)a3;
- (void)setTaskingType:(id)a3;
- (void)setTrimmingQueries:(id)a3;
- (void)shouldSubmitToday;
- (void)submitFileStatsToAnalytics;
@end

@implementation PLSubmissionConfig

- (PLSubmissionConfig)initWithReasonType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PLSubmissionConfig;
  v4 = [(PLSubmissionConfig *)&v27 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    switch((int)v3)
    {
      case 0:
      case 1:
      case 2:
      case 5:
        +[PLDefaults doubleForKey:@"internalOTASubmission" ifNotSet:86400.0];
        v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v5 sinceDate:-v6];
        v8 = v4;
        v9 = v5;
        goto LABEL_6;
      case 3:
        v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        v7 = +[PLDefaults objectForKey:@"PLTaskingOnDemandStartDate" ifNotSet:v10];

        v8 = v4;
        v9 = v7;
LABEL_6:
        [(PLSubmissionConfig *)v8 setConfigDateApplied:v9];
        goto LABEL_7;
      case 4:
        v13 = (void *)MEMORY[0x1E4F1C9C8];
        +[PLDefaults doubleForKey:@"LastUpgradeTimestamp" ifNotSet:-1.0];
        v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
        v15 = +[PLUtilities getFirstBatteryTimestamp];
        uint64_t v16 = +[PLUtilities getLastBatteryTimestamp];
        v17 = (void *)v16;
        if (!v15 || !v16)
        {
          v24 = PLLogSubmission();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[PLSubmissionConfig initWithReasonType:].cold.4();
          }

          v11 = 0;
          goto LABEL_9;
        }
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v16];
        v19 = PLLogSubmission();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionConfig initWithReasonType:](v18, v19);
        }

        v20 = PLLogSubmission();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionConfig initWithReasonType:]();
        }

        if ([v18 containsDate:v14])
        {
          v7 = [MEMORY[0x1E4F1C9C8] nearestMidnightBeforeDate:v14];
          uint64_t v21 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v14];

          v22 = PLLogSubmission();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1BBD2F000, v22, OS_LOG_TYPE_INFO, "Upgrade date is within active powerlog region", v26, 2u);
          }

          v23 = PLLogSubmission();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionConfig initWithReasonType:]();
          }

          [(PLSubmissionConfig *)v4 setConfigDateApplied:v21];
          v5 = (void *)v21;
        }
        else
        {
          v25 = PLLogSubmission();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_INFO, "Upgrade date is outside of active powerlog region", v26, 2u);
          }

          v7 = 0;
        }

LABEL_7:
        [(PLSubmissionConfig *)v4 initTagInfoForReasonType:v3 withStartDate:v7 withEndDate:v5];

        break;
      default:
        v7 = 0;
        goto LABEL_7;
    }
  }
  v11 = v4;
LABEL_9:

  return v11;
}

- (PLSubmissionConfig)initWithReasonType:(signed __int16)a3 DRConfig:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [(PLSubmissionConfig *)self initWithReasonType:v4];
  if (v7)
  {
    if (v6
      && ([v6 payloadDictionaryRepresentation],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      [(PLSubmissionConfig *)v7 setIsDRTasking:1];
      v9 = [v6 configUUID];
      [(PLSubmissionConfig *)v7 setConfigUUID:v9];

      v10 = [v6 receivedDate];
      v11 = [v10 convertFromSystemToMonotonic];
      [(PLSubmissionConfig *)v7 setConfigDateReceived:v11];

      v12 = [v6 payloadDictionaryRepresentation];
      [(PLSubmissionConfig *)v7 readTaskingPayloadOverride:v12];
    }
    else
    {
      [(PLSubmissionConfig *)v7 setIsDRTasking:0];
      [(PLSubmissionConfig *)v7 readTaskingDefaults];
    }
    if ([(PLSubmissionConfig *)v7 submitReasonType] == 4)
    {
      unint64_t v13 = 1024;
LABEL_8:
      v7->_submittedFilesMask = v13;
      goto LABEL_13;
    }
    if ([(PLSubmissionConfig *)v7 submitReasonType] == 3
      && [(PLSubmissionConfig *)v7 submitPLL]
      && [(PLSubmissionConfig *)v7 submitPLLUpgrade])
    {
      unint64_t v13 = v7->_submittedFilesMask & 0xFFFFFFFFFFFFFBFFLL;
      goto LABEL_8;
    }
  }
LABEL_13:

  return v7;
}

- (PLSubmissionConfig)initWithPayload:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PLSubmissionConfig;
  v5 = [(PLSubmissionConfig *)&v29 init];
  id v6 = v5;
  if (v5)
  {
    request = v5->_request;
    v5->_request = 0;

    ondemand = v6->_ondemand;
    v6->_ondemand = 0;

    capSize = v6->_capSize;
    v6->_capSize = (NSNumber *)&unk_1F1584998;

    plTaskingTables = v6->_plTaskingTables;
    v6->_plTaskingTables = 0;

    ppsTaskingTables = v6->_ppsTaskingTables;
    v6->_ppsTaskingTables = 0;

    taskingType = v6->_taskingType;
    v6->_taskingType = 0;

    taskingBuild = v6->_taskingBuild;
    v6->_taskingBuild = 0;

    taskingDeviceModels = v6->_taskingDeviceModels;
    v6->_taskingDeviceModels = 0;

    taskingPopulation = v6->_taskingPopulation;
    v6->_taskingPopulation = 0;

    taskingPercentage = v6->_taskingPercentage;
    v6->_taskingPercentage = 0;

    signpostAllowlist = v6->_signpostAllowlist;
    v6->_signpostAllowlist = 0;

    *(_WORD *)&v6->_enableDPUpload = 1;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"removeEntryKeys"];
    removeEntries = v6->_removeEntries;
    v6->_removeEntries = (NSArray *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"hashEntryKeys"];
    hashEntries = v6->_hashEntries;
    v6->_hashEntries = (NSDictionary *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"trimmingQueries"];
    trimmingQueries = v6->_trimmingQueries;
    v6->_trimmingQueries = (NSArray *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"cache_size"];
    cacheSize = v6->_cacheSize;
    v6->_cacheSize = (NSNumber *)v24;

    v6->_submittedFilesMask = 127;
    if ((_os_feature_enabled_impl() & 1) == 0) {
      v6->_submittedFilesMask &= ~0x20uLL;
    }
    if ((_os_feature_enabled_impl() & 1) == 0) {
      v6->_submittedFilesMask &= ~0x40uLL;
    }
    v26 = [v4 objectForKeyedSubscript:@"startDate"];
    objc_super v27 = [v4 objectForKeyedSubscript:@"endDate"];
    [(PLSubmissionConfig *)v6 initTagInfoForReasonType:7 withStartDate:v26 withEndDate:v27];
  }
  return v6;
}

- (void)initTagInfoForReasonType:(signed __int16)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v20 = a4;
  id v9 = a5;
  objc_storeStrong((id *)&self->_startDate, a4);
  objc_storeStrong((id *)&self->_endDate, a5);
  self->_submitReasonType = a3;
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];
  tagUUID = self->_tagUUID;
  self->_tagUUID = v11;

  self->_seed = +[PLPlatform seedBuild];
  self->_internal = +[PLPlatform internalBuild];
  unint64_t v13 = +[PLUtilities hardwareModel];
  deviceModel = self->_deviceModel;
  self->_deviceModel = v13;

  self->_dice = (double)(rand() % 1000) / 10.0;
  self->_enableDPUpload = 1;
  v15 = +[PLDefaults objectForKey:@"LastBuild" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  uint64_t v16 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v15, 0);
  builds = self->_builds;
  self->_builds = v16;

  if (+[PLPlatform internalBuild])
  {
    if ([(PLSubmissionConfig *)self submitBDC])
    {
      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v19 = [v18 fileExistsAtPath:@"/var/db/Battery/BDC"];

      if ((v19 & 1) == 0) {
        self->_submittedFilesMask &= ~8uLL;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PLSubmissionConfig allocWithZone:a3] init];
  uint64_t v5 = [(PLSubmissionConfig *)self submitReasonType];
  id v6 = [(PLSubmissionConfig *)self startDate];
  v7 = [(PLSubmissionConfig *)self endDate];
  [(PLSubmissionConfig *)v4 initTagInfoForReasonType:v5 withStartDate:v6 withEndDate:v7];

  v8 = [(PLSubmissionConfig *)self configUUID];
  [(PLSubmissionConfig *)v4 setConfigUUID:v8];

  id v9 = [(PLSubmissionConfig *)self configDateApplied];
  [(PLSubmissionConfig *)v4 setConfigDateApplied:v9];

  v10 = [(PLSubmissionConfig *)self configDateReceived];
  [(PLSubmissionConfig *)v4 setConfigDateReceived:v10];

  [(PLSubmissionConfig *)self dice];
  -[PLSubmissionConfig setDice:](v4, "setDice:");
  [(PLSubmissionConfig *)v4 setEnableDPUpload:[(PLSubmissionConfig *)self enableDPUpload]];
  [(PLSubmissionConfig *)v4 setIsDRTasking:[(PLSubmissionConfig *)self isDRTasking]];
  v11 = [(PLSubmissionConfig *)self request];
  [(PLSubmissionConfig *)v4 setRequest:v11];

  v12 = [(PLSubmissionConfig *)self ondemand];
  [(PLSubmissionConfig *)v4 setOndemand:v12];

  unint64_t v13 = [(PLSubmissionConfig *)self capSize];
  [(PLSubmissionConfig *)v4 setCapSize:v13];

  v14 = [(PLSubmissionConfig *)self plTaskingTables];
  [(PLSubmissionConfig *)v4 setPlTaskingTables:v14];

  v15 = [(PLSubmissionConfig *)self ppsTaskingTables];
  [(PLSubmissionConfig *)v4 setPpsTaskingTables:v15];

  uint64_t v16 = [(PLSubmissionConfig *)self removeEntries];
  [(PLSubmissionConfig *)v4 setRemoveEntries:v16];

  v17 = [(PLSubmissionConfig *)self hashEntries];
  [(PLSubmissionConfig *)v4 setHashEntries:v17];

  uint64_t v18 = [(PLSubmissionConfig *)self trimmingQueries];
  [(PLSubmissionConfig *)v4 setTrimmingQueries:v18];

  char v19 = [(PLSubmissionConfig *)self taskingBuild];
  [(PLSubmissionConfig *)v4 setTaskingBuild:v19];

  id v20 = [(PLSubmissionConfig *)self taskingDeviceModels];
  [(PLSubmissionConfig *)v4 setTaskingDeviceModels:v20];

  uint64_t v21 = [(PLSubmissionConfig *)self taskingPopulation];
  [(PLSubmissionConfig *)v4 setTaskingPopulation:v21];

  uint64_t v22 = [(PLSubmissionConfig *)self taskingPercentage];
  [(PLSubmissionConfig *)v4 setTaskingPercentage:v22];

  v23 = [(PLSubmissionConfig *)self signpostAllowlist];
  [(PLSubmissionConfig *)v4 setSignpostAllowlist:v23];

  [(PLSubmissionConfig *)v4 setSignpostDisable:[(PLSubmissionConfig *)self signpostDisable]];
  uint64_t v24 = [(PLSubmissionConfig *)self cacheSize];
  [(PLSubmissionConfig *)v4 setCacheSize:v24];

  v25 = [(PLSubmissionConfig *)self taskingFiles];
  [(PLSubmissionConfig *)v4 setTaskingFiles:v25];

  [(PLSubmissionConfig *)v4 setSubmittedFilesMask:[(PLSubmissionConfig *)self submittedFilesMask]];
  v26 = [(PLSubmissionConfig *)self taskingType];
  [(PLSubmissionConfig *)v4 setTaskingType:v26];

  objc_super v27 = [(PLSubmissionConfig *)self defaultTaskingTypeParameters];
  [(PLSubmissionConfig *)v4 setDefaultTaskingTypeParameters:v27];

  v28 = [(PLSubmissionConfig *)self perModelTaskingTypeParameters];
  [(PLSubmissionConfig *)v4 setPerModelTaskingTypeParameters:v28];

  objc_super v29 = [(PLSubmissionConfig *)self filePath];
  [(PLSubmissionConfig *)v4 setFilePath:v29];

  v30 = [(PLSubmissionConfig *)self ckTagConfig];
  [(PLSubmissionConfig *)v4 setCkTagConfig:v30];

  v31 = [(PLSubmissionConfig *)self blobFailureReason];
  [(PLSubmissionConfig *)v4 setBlobFailureReason:v31];

  v32 = [(PLSubmissionConfig *)self lastBatteryTimestampSystem];
  [(PLSubmissionConfig *)v4 setLastBatteryTimestampSystem:v32];

  return v4;
}

- (void)readTaskingPayloadOverride:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PLTaskingRequest"];
  [(PLSubmissionConfig *)self setRequest:v5];

  id v6 = [v4 objectForKeyedSubscript:@"PLTaskingOnDemand"];
  [(PLSubmissionConfig *)self setOndemand:v6];

  v7 = [v4 objectForKeyedSubscript:@"PLTaskingCapSize"];
  if (!v7 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v9 = v7, (isKindOfClass & 1) == 0)) {
    id v9 = &unk_1F1584998;
  }
  [(PLSubmissionConfig *)self setCapSize:v9];
  v10 = [v4 objectForKeyedSubscript:@"PLTaskingTables"];
  [(PLSubmissionConfig *)self setPlTaskingTables:v10];

  v11 = [v4 objectForKeyedSubscript:@"PPSTaskingTables"];
  [(PLSubmissionConfig *)self setPpsTaskingTables:v11];

  v12 = [v4 objectForKeyedSubscript:@"PLTaskingRemoveEntries"];
  [(PLSubmissionConfig *)self setRemoveEntries:v12];

  unint64_t v13 = [(PLSubmissionConfig *)self removeEntries];

  if (!v13) {
    [(PLSubmissionConfig *)self setRemoveEntries:&unk_1F15868A0];
  }
  v14 = [v4 objectForKeyedSubscript:@"PLTaskingHashEntries"];
  if (v14)
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __49__PLSubmissionConfig_readTaskingPayloadOverride___block_invoke;
    v53[3] = &unk_1E6255990;
    id v54 = v15;
    id v16 = v15;
    [v14 enumerateObjectsUsingBlock:v53];
    v17 = (void *)[v16 copy];
    [(PLSubmissionConfig *)self setHashEntries:v17];
  }
  else
  {
    [(PLSubmissionConfig *)self setHashEntries:&unk_1F15947C0];
  }
  [(PLSubmissionConfig *)self setTrimmingQueries:0];
  uint64_t v18 = [v4 objectForKeyedSubscript:@"PLTaskingBuild"];
  [(PLSubmissionConfig *)self setTaskingBuild:v18];

  char v19 = [v4 objectForKeyedSubscript:@"PLTaskingDeviceModels"];
  [(PLSubmissionConfig *)self setTaskingDeviceModels:v19];

  id v20 = [v4 objectForKeyedSubscript:@"PLTaskingPopulation"];
  [(PLSubmissionConfig *)self setTaskingPopulation:v20];

  uint64_t v21 = [v4 objectForKeyedSubscript:@"PLTaskingPercentage"];
  [(PLSubmissionConfig *)self setTaskingPercentage:v21];

  uint64_t v22 = [v4 objectForKeyedSubscript:@"PLTaskingSignpostAllowlist"];
  [(PLSubmissionConfig *)self setSignpostAllowlist:v22];

  v23 = [v4 objectForKeyedSubscript:@"PLTaskingSignpostDisable"];
  if (v23 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v24 = [v23 BOOLValue];
  }
  else {
    uint64_t v24 = 0;
  }
  [(PLSubmissionConfig *)self setSignpostDisable:v24];
  [(PLSubmissionConfig *)self setCacheSize:0];
  self->_submittedFilesMask = 0;
  v25 = [v4 objectForKeyedSubscript:@"PLTaskingFiles"];
  [(PLSubmissionConfig *)self setTaskingFiles:v25];

  v26 = [(PLSubmissionConfig *)self taskingFiles];

  if (v26)
  {
    v45 = v23;
    v46 = v7;
    id v47 = v4;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    objc_super v27 = [(PLSubmissionConfig *)self taskingFiles];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (!v28) {
      goto LABEL_42;
    }
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v50;
    *(void *)&long long v29 = 138412290;
    long long v44 = v29;
    while (1)
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(v27);
        }
        v33 = *(void **)(*((void *)&v49 + 1) + 8 * v32);
        if (objc_msgSend(v33, "isEqualToString:", @"PLL", v44))
        {
          unint64_t v34 = self->_submittedFilesMask | 1;
LABEL_35:
          self->_submittedFilesMask = v34;
          goto LABEL_36;
        }
        if ([v33 isEqualToString:@"PLL-Upgrade"])
        {
          unint64_t v34 = self->_submittedFilesMask | 0x400;
          goto LABEL_35;
        }
        if ([v33 isEqualToString:@"MSS"])
        {
          unint64_t v34 = self->_submittedFilesMask | 2;
          goto LABEL_35;
        }
        if ([v33 isEqualToString:@"SP"])
        {
          unint64_t v34 = self->_submittedFilesMask | 4;
          goto LABEL_35;
        }
        if ([v33 isEqualToString:@"BDC"])
        {
          unint64_t v34 = self->_submittedFilesMask | 8;
          goto LABEL_35;
        }
        if ([v33 isEqualToString:@"CE"])
        {
          unint64_t v34 = self->_submittedFilesMask | 0x10;
          goto LABEL_35;
        }
        if ([v33 isEqualToString:@"XC"])
        {
          unint64_t v34 = self->_submittedFilesMask | 0x20;
          goto LABEL_35;
        }
        if ([v33 isEqualToString:@"BG"])
        {
          unint64_t v34 = self->_submittedFilesMask | 0x40;
          goto LABEL_35;
        }
        log = PLLogSubmission();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v44;
          v56 = v33;
          _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Unsupported tasking files: %@", buf, 0xCu);
        }

LABEL_36:
        ++v32;
      }
      while (v30 != v32);
      uint64_t v35 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
      uint64_t v30 = v35;
      if (!v35)
      {
LABEL_42:

        v7 = v46;
        id v4 = v47;
        v23 = v45;
        goto LABEL_48;
      }
    }
  }
  if (+[PLPlatform internalBuild])
  {
    self->_submittedFilesMask = 127;
    if ((_os_feature_enabled_impl() & 1) == 0) {
      self->_submittedFilesMask &= ~0x20uLL;
    }
    if ((_os_feature_enabled_impl() & 1) == 0) {
      self->_submittedFilesMask &= ~0x40uLL;
    }
  }
LABEL_48:
  v36 = [v4 objectForKeyedSubscript:@"PLEnableDPUpload"];

  if (v36)
  {
    v37 = [v4 objectForKeyedSubscript:@"PLEnableDPUpload"];
    -[PLSubmissionConfig setEnableDPUpload:](self, "setEnableDPUpload:", [v37 BOOLValue]);
  }
  else
  {
    [(PLSubmissionConfig *)self setEnableDPUpload:1];
  }
  v38 = [v4 objectForKeyedSubscript:@"PLTaskingType"];
  [(PLSubmissionConfig *)self setTaskingType:v38];

  v39 = [v4 objectForKeyedSubscript:@"PLDefaultTaskingTypeParametersKey"];
  [(PLSubmissionConfig *)self setDefaultTaskingTypeParameters:v39];

  v40 = [v4 objectForKeyedSubscript:@"PLPerModelTaskingTypeParametersKey"];
  [(PLSubmissionConfig *)self setPerModelTaskingTypeParameters:v40];

  v41 = [(PLSubmissionConfig *)self taskingFiles];
  +[PLDefaults setObject:v41 forKey:@"PLTaskingFiles" saveToDisk:1];

  v42 = [(PLSubmissionConfig *)self plTaskingTables];
  +[PLDefaults setObject:v42 forKey:@"PLTaskingTables" saveToDisk:1];

  v43 = [(PLSubmissionConfig *)self ppsTaskingTables];
  +[PLDefaults setObject:v43 forKey:@"PPSTaskingTables" saveToDisk:1];
}

void __49__PLSubmissionConfig_readTaskingPayloadOverride___block_invoke(uint64_t a1, void *a2)
{
  id v10 = [a2 componentsSeparatedByString:@"."];
  BOOL v3 = [v10 count] == 2;
  id v4 = v10;
  if (v3)
  {
    uint64_t v5 = [v10 objectAtIndexedSubscript:0];
    id v6 = [v10 objectAtIndexedSubscript:1];
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

    if (!v7)
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
    }
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    [v9 addObject:v6];

    id v4 = v10;
  }
}

- (BOOL)isValidSubmissionFilesMask
{
  BOOL v3 = [(PLSubmissionConfig *)self taskingFiles];

  if (!v3) {
    return 1;
  }
  unint64_t submittedFilesMask = self->_submittedFilesMask;
  BOOL v6 = (submittedFilesMask & 0x10) == 0 || submittedFilesMask == 16;
  if ((submittedFilesMask & 8) != 0) {
    return submittedFilesMask == 8;
  }
  else {
    return v6;
  }
}

- (BOOL)isValidTaskingBlob
{
  if ([(PLSubmissionConfig *)self isValidSubmissionFilesMask])
  {
    request = self->_request;
    return +[PLUtilities isValidString:request];
  }
  else
  {
    uint64_t v5 = PLLogSubmission();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(PLSubmissionConfig *)self isValidTaskingBlob];
    }

    blobFailureReason = self->_blobFailureReason;
    self->_blobFailureReason = (NSString *)@"InvalidTaskingFiles";

    return 0;
  }
}

- (void)readTaskingDefaults
{
  PLOSAPreferencesGetValue();
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  self->_request = v3;

  PLOSAPreferencesGetValue();
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  ondemand = self->_ondemand;
  self->_ondemand = v5;

  v7 = PLOSAPreferencesGetValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v7;
    capSize = self->_capSize;
    self->_capSize = v8;
  }
  else
  {
    capSize = self->_capSize;
    self->_capSize = (NSNumber *)&unk_1F1584998;
  }

  PLOSAPreferencesGetValue();
  id v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  plTaskingTables = self->_plTaskingTables;
  self->_plTaskingTables = v10;

  PLOSAPreferencesGetValue();
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  removeEntries = self->_removeEntries;
  self->_removeEntries = v12;

  if (!self->_removeEntries)
  {
    self->_removeEntries = (NSArray *)&unk_1F1586918;
  }
  v14 = PLOSAPreferencesGetValue();
  if (v14)
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __41__PLSubmissionConfig_readTaskingDefaults__block_invoke;
    v35[3] = &unk_1E6255990;
    id v36 = v15;
    id v16 = v15;
    [v14 enumerateObjectsUsingBlock:v35];
    v17 = (NSDictionary *)[v16 copy];
    hashEntries = self->_hashEntries;
    self->_hashEntries = v17;
  }
  else
  {
    char v19 = self->_hashEntries;
    self->_hashEntries = (NSDictionary *)&unk_1F15947E8;
  }
  trimmingQueries = self->_trimmingQueries;
  self->_trimmingQueries = 0;

  PLOSAPreferencesGetValue();
  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskingBuild = self->_taskingBuild;
  self->_taskingBuild = v21;

  PLOSAPreferencesGetValue();
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskingDeviceModels = self->_taskingDeviceModels;
  self->_taskingDeviceModels = v23;

  PLOSAPreferencesGetValue();
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskingPopulation = self->_taskingPopulation;
  self->_taskingPopulation = v25;

  PLOSAPreferencesGetValue();
  objc_super v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  taskingPercentage = self->_taskingPercentage;
  self->_taskingPercentage = v27;

  PLOSAPreferencesGetValue();
  long long v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  signpostAllowlist = self->_signpostAllowlist;
  self->_signpostAllowlist = v29;

  uint64_t v31 = PLOSAPreferencesGetValue();
  uint64_t v32 = v31;
  BOOL v33 = v31 && ([v31 BOOLValue] & 1) != 0;
  self->_signpostDisable = v33;
  cacheSize = self->_cacheSize;
  self->_cacheSize = 0;

  [(PLSubmissionConfig *)self initializeFilesToBeSubmitted];
}

void __41__PLSubmissionConfig_readTaskingDefaults__block_invoke(uint64_t a1, void *a2)
{
  id v10 = [a2 componentsSeparatedByString:@"."];
  BOOL v3 = [v10 count] == 2;
  id v4 = v10;
  if (v3)
  {
    uint64_t v5 = [v10 objectAtIndexedSubscript:0];
    BOOL v6 = [v10 objectAtIndexedSubscript:1];
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

    if (!v7)
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
    }
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    [v9 addObject:v6];

    id v4 = v10;
  }
}

- (id)submissionMaskToString
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(PLSubmissionConfig *)self submitPLL]) {
    [v3 addObject:@"Powerlog"];
  }
  if ([(PLSubmissionConfig *)self submitPLLUpgrade]) {
    [v3 addObject:@"UpgradePowerlog"];
  }
  if ([(PLSubmissionConfig *)self submitMSS]) {
    [v3 addObject:@"Microstackshots"];
  }
  if ([(PLSubmissionConfig *)self submitBDC]) {
    [v3 addObject:@"BDC_logs"];
  }
  if ([(PLSubmissionConfig *)self submitSP]) {
    [v3 addObject:@"Signpost"];
  }
  if ([(PLSubmissionConfig *)self submitCE]) {
    [v3 addObject:@"CleanEnergyLogs"];
  }
  if ([(PLSubmissionConfig *)self submitXC]) {
    [v3 addObject:@"XcodeOrganizer"];
  }
  if ([(PLSubmissionConfig *)self submitBG]) {
    [v3 addObject:@"BackgroundProcessing"];
  }
  id v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

- (id)splitBySubmissionType
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(PLSubmissionConfig *)self submitReasonType] == 1)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    if ([(PLSubmissionConfig *)self submitCE])
    {
      id v4 = (void *)[(PLSubmissionConfig *)self copy];
      [v4 setSubmittedFilesMask:16];
      [v3 addObject:v4];
      self->_submittedFilesMask &= ~0x10uLL;
    }
    if ([(PLSubmissionConfig *)self submitXC])
    {
      uint64_t v5 = (void *)[(PLSubmissionConfig *)self copy];
      [v5 setSubmittedFilesMask:32];
      [v3 addObject:v5];
      self->_submittedFilesMask &= ~0x20uLL;
    }
    if ([(PLSubmissionConfig *)self submitBG])
    {
      BOOL v6 = (void *)[(PLSubmissionConfig *)self copy];
      [v6 setSubmittedFilesMask:64];
      [v3 addObject:v6];
      self->_submittedFilesMask &= ~0x40uLL;
    }
    [v3 addObject:self];
    v7 = [v3 reverseObjectEnumerator];
    v8 = [v7 allObjects];
  }
  else
  {
    v10[0] = self;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  return v8;
}

- (id)submissionCategory
{
  if ([(PLSubmissionConfig *)self submitReasonType] == 4) {
    return @"upgrade-archive";
  }
  if ([(PLSubmissionConfig *)self submitReasonType] == 2) {
    return @"safeguard-archive";
  }
  if ([(PLSubmissionConfig *)self submitReasonType] == 1
    && [(PLSubmissionConfig *)self submittedFilesMask] == 16)
  {
    return @"ce-archive";
  }
  if ([(PLSubmissionConfig *)self submittedFilesMask] == 32) {
    return @"xc-archive";
  }
  if ([(PLSubmissionConfig *)self submittedFilesMask] == 64) {
    return @"bg-archive";
  }
  return @"pps-archive";
}

- (id)getSubmitReasonTypeToCAFieldValue
{
  uint64_t v2 = self->_submitReasonType - 1;
  if (v2 > 6) {
    return @"unknownreason";
  }
  else {
    return off_1E6255B50[v2];
  }
}

- (id)getSubmitReasonTypeToFlushReason
{
  uint64_t v2 = self->_submitReasonType - 1;
  if (v2 > 6) {
    return @"unknown OTA reason";
  }
  else {
    return off_1E6255B88[v2];
  }
}

- (id)getSubmitReasonTypeToReasonLog
{
  int v2 = self->_submitReasonType - 1;
  id v4 = @"SafeLogFile";
  switch(v2)
  {
    case 0:
      id v4 = @"InternalSubmission";
      break;
    case 1:
      id v4 = @"SafeguardSubmission";
      break;
    case 2:
    case 4:
      uint64_t v5 = NSString;
      request = self->_request;
      v7 = @"OnDemandTasking";
      goto LABEL_6;
    case 3:
      uint64_t v5 = NSString;
      request = self->_request;
      v7 = @"UpgradeTasking";
LABEL_6:
      id v4 = [v5 stringWithFormat:@"%@:%@", v7, request];
      break;
    case 6:
      break;
    default:
      id v4 = @"unknownreason";
      break;
  }
  return v4;
}

- (id)getSubmitReasonTypeToStorageEventOTAType
{
  uint64_t v2 = self->_submitReasonType - 1;
  if v2 <= 6 && ((0x5Fu >> v2)) {
    BOOL v3 = *off_1E6255BC0[v2];
  }
  else {
    BOOL v3 = @"unknownreason";
  }
  return v3;
}

- (id)getDateMarkerLegacy
{
  BOOL v3 = [(PLSubmissionConfig *)self lastBatteryTimestampSystem];
  if (v3)
  {
    id v4 = [(PLSubmissionConfig *)self lastBatteryTimestampSystem];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
    BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = [v5 nearestMidnightBeforeDate:v6];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v7 setDateFormat:@"yyyyMMdd"];
  id v9 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v7 setTimeZone:v9];

  id v10 = [v8 objectForKey:*MEMORY[0x1E4F1C3E0]];
  [v7 setCalendar:v10];

  [v7 setLocale:v8];
  v11 = [v7 stringFromDate:v4];

  return v11;
}

- (id)getDateMarker
{
  BOOL v3 = [(PLSubmissionConfig *)self lastBatteryTimestampSystem];
  if (v3)
  {
    id v4 = [(PLSubmissionConfig *)self lastBatteryTimestampSystem];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
    BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = [v5 nearestMidnightBeforeDate:v6];
  }
  id v7 = +[PLSubmissionConfig getDateMarkerFromSystemDate:v4];

  return v7;
}

+ (id)getDateMarkerFromSystemDate:(id)a3
{
  if (a3)
  {
    BOOL v3 = NSString;
    [a3 timeIntervalSince1970];
    uint64_t v5 = v4;
    BOOL v6 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    objc_msgSend(v3, "stringWithFormat:", @"%f [%ld]", v5, objc_msgSend(v6, "secondsFromGMT"));
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = @"unknown";
  }
  return v7;
}

+ (void)clearTaskingDefaults
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (clearTaskingDefaults_defaultOnce != -1) {
      dispatch_once(&clearTaskingDefaults_defaultOnce, block);
    }
    if (clearTaskingDefaults_classDebugEnabled)
    {
      BOOL v3 = [NSString stringWithFormat:@"clearing on demand tasking defaults"];
      uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
      uint64_t v5 = [v4 lastPathComponent];
      BOOL v6 = [NSString stringWithUTF8String:"+[PLSubmissionConfig clearTaskingDefaults]"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:725];

      id v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  +[PLDefaults setObject:0 forKey:@"PLTaskingOnDemandStartDate" saveToDisk:1];
  +[PLDefaults setObject:0 forKey:@"PLTaskingRestartCount" saveToDisk:1];
  +[PLDefaults setObject:0 forKey:@"PLTaskingFiles" saveToDisk:1];
  +[PLDefaults setObject:0 forKey:@"PLTaskingTables" saveToDisk:1];
  +[PLDefaults setObject:0 forKey:@"PPSTaskingTables" saveToDisk:1];
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_381;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = v8;
    if (clearTaskingDefaults_defaultOnce_379 != -1) {
      dispatch_once(&clearTaskingDefaults_defaultOnce_379, v30);
    }
    if (clearTaskingDefaults_classDebugEnabled_380)
    {
      id v9 = [NSString stringWithFormat:@"clearing tasking OSAPreferences"];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"+[PLSubmissionConfig clearTaskingDefaults]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:739];

      unint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  unsigned int v14 = PLOSAPreferencesSynchronize();
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_387;
    v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v29[4] = v15;
    if (clearTaskingDefaults_defaultOnce_385 != -1) {
      dispatch_once(&clearTaskingDefaults_defaultOnce_385, v29);
    }
    if (clearTaskingDefaults_classDebugEnabled_386)
    {
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"synchronized=%d", v14);
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
      uint64_t v18 = [v17 lastPathComponent];
      char v19 = [NSString stringWithUTF8String:"+[PLSubmissionConfig clearTaskingDefaults]"];
      +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:746];

      id v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  PLOSAPreferencesSetValue();
  unsigned int v21 = PLOSAPreferencesSynchronize();
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v22 = objc_opt_class();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_393;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v22;
    if (clearTaskingDefaults_defaultOnce_391 != -1) {
      dispatch_once(&clearTaskingDefaults_defaultOnce_391, v28);
    }
    if (clearTaskingDefaults_classDebugEnabled_392)
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"synchronized=%d", v21);
      uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"+[PLSubmissionConfig clearTaskingDefaults]"];
      +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:752];

      objc_super v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  clearTaskingDefaults_classDebugEnabled = result;
  return result;
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_381(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  clearTaskingDefaults_classDebugEnabled_380 = result;
  return result;
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_387(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  clearTaskingDefaults_classDebugEnabled_386 = result;
  return result;
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_393(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  clearTaskingDefaults_classDebugEnabled_392 = result;
  return result;
}

- (BOOL)conditionCheckForEnergy
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLArchiveManager lastArchivePath];
  BOOL v3 = PLLogSubmission();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Energy Tasking: looking for archived powerlog...", (uint8_t *)&v10, 2u);
  }

  if (!v2)
  {
    id v7 = PLLogSubmission();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionConfig conditionCheckForEnergy]();
    }
    goto LABEL_12;
  }
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v2];

  BOOL v6 = PLLogSubmission();
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionConfig conditionCheckForEnergy]();
    }
LABEL_12:
    BOOL v8 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "Energy Tasking: last archived powerlog = %@", (uint8_t *)&v10, 0xCu);
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)conditionCheckForTaskingType:(id)a3
{
  int v4 = [a3 isEqualToString:@"Energy"];
  if (v4)
  {
    LOBYTE(v4) = [(PLSubmissionConfig *)self conditionCheckForEnergy];
  }
  return v4;
}

- (BOOL)shouldSubmitToday
{
  BOOL v3 = PLLogSubmission();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionConfig shouldSubmitToday].cold.5();
  }

  [(PLSubmissionConfig *)self emitTaskingTypeSpecifiedEvent];
  if (![(PLSubmissionConfig *)self isValidTaskingBlob])
  {
    BOOL v6 = PLLogSubmission();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionConfig shouldSubmitToday].cold.4();
    }
    goto LABEL_23;
  }
  int v4 = [(PLSubmissionConfig *)self taskingType];
  BOOL v5 = [(PLSubmissionConfig *)self conditionCheckForTaskingType:v4];

  if (!v5)
  {
    [(PLSubmissionConfig *)self emitQueryEvent:0];
    BOOL v6 = PLLogSubmission();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionConfig shouldSubmitToday]();
    }
    goto LABEL_23;
  }
  [(PLSubmissionConfig *)self emitQueryEvent:1];
  BOOL v6 = +[PLUtilities productType];
  perModelTaskingTypeParameters = self->_perModelTaskingTypeParameters;
  if (perModelTaskingTypeParameters || self->_defaultTaskingTypeParameters)
  {
    if (v6)
    {
      BOOL v8 = [(NSDictionary *)perModelTaskingTypeParameters objectForKeyedSubscript:v6];
      if (v8)
      {
        id v9 = [(NSDictionary *)self->_perModelTaskingTypeParameters objectForKeyedSubscript:v6];
        int v10 = [v9 objectForKeyedSubscript:@"samplingPercentage"];
        int v11 = [v10 intValue];
      }
      else
      {
        id v9 = [(NSDictionary *)self->_defaultTaskingTypeParameters objectForKeyedSubscript:@"samplingPercentage"];
        int v11 = [v9 intValue];
      }

      unint64_t v13 = PLLogSubmission();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionConfig shouldSubmitToday]();
      }

      if ((v11 - 101) >= 0xFFFFFF9C)
      {
        [(PLSubmissionConfig *)self dice];
        if (v14 < (double)v11) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      uint64_t v12 = PLLogSubmission();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionConfig shouldSubmitToday]();
      }
    }
LABEL_23:
    BOOL v15 = 0;
    goto LABEL_24;
  }
LABEL_22:
  [(PLSubmissionConfig *)self emitSubmitEvent];
  BOOL v15 = 1;
LABEL_24:

  return v15;
}

- (BOOL)shouldStartTaskingToday
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (shouldStartTaskingToday_defaultOnce != -1) {
      dispatch_once(&shouldStartTaskingToday_defaultOnce, block);
    }
    if (shouldStartTaskingToday_classDebugEnabled)
    {
      int v4 = [NSString stringWithFormat:@"begin on-demand tasking setup check"];
      BOOL v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
      BOOL v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:979];

      BOOL v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (+[PLDefaults fullMode]
    || +[PLDefaults taskMode])
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_406;
      v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v96[4] = v9;
      if (shouldStartTaskingToday_defaultOnce_404 != -1) {
        dispatch_once(&shouldStartTaskingToday_defaultOnce_404, v96);
      }
      if (shouldStartTaskingToday_classDebugEnabled_405)
      {
        int v10 = [NSString stringWithFormat:@"already in task mode or full mode"];
        int v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
        uint64_t v12 = [v11 lastPathComponent];
        unint64_t v13 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
        +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:984];

        double v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
LABEL_16:

        goto LABEL_17;
      }
    }
    return 0;
  }
  if (![(PLSubmissionConfig *)self isValidTaskingBlob])
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_412;
      v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v95[4] = v16;
      if (shouldStartTaskingToday_defaultOnce_410 != -1) {
        dispatch_once(&shouldStartTaskingToday_defaultOnce_410, v95);
      }
      if (shouldStartTaskingToday_classDebugEnabled_411)
      {
        int v10 = [NSString stringWithFormat:@"Tasking blob is not valid"];
        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
        uint64_t v18 = [v17 lastPathComponent];
        char v19 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
        +[PLCoreStorage logMessage:v10 fromFile:v18 fromFunction:v19 fromLineNumber:989];

        double v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_16;
      }
    }
    return 0;
  }
  if ([(PLSubmissionConfig *)self isDRTasking]) {
    return 1;
  }
  [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.OTATasking", @"PLTaskingRequest"];
  PLADClientAddValueForScalarKey();
  AnalyticsSendEventLazy();
  +[PLSubmissionConfig submitTaskingDefaultsCheckStateToCA:@"PLTaskingRequest"];
  if (self->_taskingBuild)
  {
    int v10 = +[PLDefaults objectForKey:@"LastBuild" forApplicationID:@"com.apple.powerlogd" synchronize:0];
    if (!v10) {
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    taskingBuild = self->_taskingBuild;
    unsigned int v21 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v22 = [(NSString *)taskingBuild stringByTrimmingCharactersInSet:v21];

    v23 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v24 = [(__CFString *)v10 stringByTrimmingCharactersInSet:v23];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v25 = objc_opt_class();
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_433;
      v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v94[4] = v25;
      if (shouldStartTaskingToday_defaultOnce_431 != -1) {
        dispatch_once(&shouldStartTaskingToday_defaultOnce_431, v94);
      }
      if (shouldStartTaskingToday_classDebugEnabled_432)
      {
        v26 = [NSString stringWithFormat:@"taskingBuild=%@, currentBuild=%@\n", v22, v24];
        objc_super v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
        uint64_t v28 = [v27 lastPathComponent];
        long long v29 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
        +[PLCoreStorage logMessage:v26 fromFile:v28 fromFunction:v29 fromLineNumber:1018];

        uint64_t v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if (!v22)
    {

      goto LABEL_17;
    }
    int v31 = [v22 isEqualToString:v24];

    if (!v31) {
      return 0;
    }
  }
  uint64_t v32 = +[PLUtilities hardwareModel];
  int v10 = (__CFString *)v32;
  if (self->_taskingDeviceModels)
  {
    if (!v32) {
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v33 = objc_opt_class();
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_439;
      v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v93[4] = v33;
      if (shouldStartTaskingToday_defaultOnce_437 != -1) {
        dispatch_once(&shouldStartTaskingToday_defaultOnce_437, v93);
      }
      if (shouldStartTaskingToday_classDebugEnabled_438)
      {
        unint64_t v34 = [NSString stringWithFormat:@"currentModel=%@, taskingDeviceModels=%@\n", v10, self->_taskingDeviceModels];
        uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
        id v36 = [v35 lastPathComponent];
        v37 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
        +[PLCoreStorage logMessage:v34 fromFile:v36 fromFunction:v37 fromLineNumber:1033];

        v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v39 = [(NSString *)self->_taskingDeviceModels tokenizedByString:@":"];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v89 objects:v98 count:16];
    if (!v40) {
      goto LABEL_85;
    }
    uint64_t v41 = v40;
    int v42 = 0;
    uint64_t v43 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v90 != v43) {
          objc_enumerationMutation(v39);
        }
        v45 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        if (v45)
        {
          v46 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          id v47 = [v45 stringByTrimmingCharactersInSet:v46];

          v42 |= [(__CFString *)v10 isEqualToString:v47];
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v89 objects:v98 count:16];
    }
    while (v41);

    if ((v42 & 1) == 0) {
      goto LABEL_17;
    }
  }
  if (!self->_taskingPopulation) {
    goto LABEL_87;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v48 = objc_opt_class();
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_448;
    v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v88[4] = v48;
    if (shouldStartTaskingToday_defaultOnce_446 != -1) {
      dispatch_once(&shouldStartTaskingToday_defaultOnce_446, v88);
    }
    if (shouldStartTaskingToday_classDebugEnabled_447)
    {
      long long v49 = [NSString stringWithFormat:@"taskingPopulation=%@\n", self->_taskingPopulation];
      long long v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
      long long v51 = [v50 lastPathComponent];
      long long v52 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
      +[PLCoreStorage logMessage:v49 fromFile:v51 fromFunction:v52 fromLineNumber:1052];

      v53 = PLLogCommon();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  taskingPopulation = self->_taskingPopulation;
  v55 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v39 = [(NSString *)taskingPopulation stringByTrimmingCharactersInSet:v55];

  if (![v39 isEqualToString:@"INTERNAL"])
  {
    if ([v39 isEqualToString:@"SEED"])
    {
      if (+[PLPlatform seedBuild]) {
        goto LABEL_86;
      }
    }
    else if ([v39 isEqualToString:@"CARRIER"])
    {
      if (+[PLPlatform carrierBuild]) {
        goto LABEL_86;
      }
    }
    else if ([v39 isEqualToString:@"GM"] {
           && !+[PLPlatform internalBuild]
    }
           && !+[PLPlatform seedBuild])
    {
      goto LABEL_86;
    }
LABEL_85:

    goto LABEL_17;
  }
  if (!+[PLPlatform internalBuild]) {
    goto LABEL_85;
  }
LABEL_86:

LABEL_87:
  if (self->_taskingPercentage)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    v57 = [(NSDictionary *)self->_taskingPercentage objectForKeyedSubscript:v10];

    taskingPercentage = self->_taskingPercentage;
    if (v57)
    {
      v59 = v10;
    }
    else
    {
      v60 = [(NSDictionary *)taskingPercentage objectForKeyedSubscript:@"default"];

      if (!v60) {
        goto LABEL_94;
      }
      taskingPercentage = self->_taskingPercentage;
      v59 = @"default";
    }
    v61 = [(NSDictionary *)taskingPercentage objectForKeyedSubscript:v59];
    v60 = (void *)[v61 intValue];

LABEL_94:
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v62 = objc_opt_class();
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_470;
      v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v87[4] = v62;
      if (shouldStartTaskingToday_defaultOnce_468 != -1) {
        dispatch_once(&shouldStartTaskingToday_defaultOnce_468, v87);
      }
      if (shouldStartTaskingToday_classDebugEnabled_469)
      {
        v63 = objc_msgSend(NSString, "stringWithFormat:", @"taskingPercentage=%d\n", v60);
        v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
        v65 = [v64 lastPathComponent];
        v66 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
        +[PLCoreStorage logMessage:v63 fromFile:v65 fromFunction:v66 fromLineNumber:1092];

        v67 = PLLogCommon();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if ((int)v60 < 1) {
      goto LABEL_17;
    }
    if (v60 <= 0x63)
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v68 = objc_opt_class();
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_476;
        v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v86[4] = v68;
        if (shouldStartTaskingToday_defaultOnce_474 != -1) {
          dispatch_once(&shouldStartTaskingToday_defaultOnce_474, v86);
        }
        if (shouldStartTaskingToday_classDebugEnabled_475)
        {
          v69 = NSString;
          [(PLSubmissionConfig *)self dice];
          v71 = objc_msgSend(v69, "stringWithFormat:", @"dice=%f\n", v70);
          v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
          v73 = [v72 lastPathComponent];
          v74 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
          +[PLCoreStorage logMessage:v71 fromFile:v73 fromFunction:v74 fromLineNumber:1095];

          v75 = PLLogCommon();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      [(PLSubmissionConfig *)self dice];
      if (v76 >= (double)(int)v60) {
        goto LABEL_17;
      }
    }
  }
  unint64_t v77 = 0x1E6253000;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v78 = objc_opt_class();
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_482;
    v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v85[4] = v78;
    if (shouldStartTaskingToday_defaultOnce_480 != -1) {
      dispatch_once(&shouldStartTaskingToday_defaultOnce_480, v85);
    }
    if (shouldStartTaskingToday_classDebugEnabled_481)
    {
      v79 = [NSString stringWithFormat:@"onDemandTasking=%@", self->_ondemand];
      v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m"];
      v81 = [v80 lastPathComponent];
      v82 = [NSString stringWithUTF8String:"-[PLSubmissionConfig shouldStartTaskingToday]"];
      +[PLCoreStorage logMessage:v79 fromFile:v81 fromFunction:v82 fromLineNumber:1100];

      v83 = PLLogCommon();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      unint64_t v77 = 0x1E6253000uLL;
    }
  }
  ondemand = self->_ondemand;
  if (ondemand && [(NSString *)ondemand isEqualToString:@"PLTaskingOnDemandForced"])
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.OTATasking", @"PLTaskingOnDemand"];
    BOOL v15 = 1;
    PLADClientAddValueForScalarKey();
    AnalyticsSendEventLazy();
    [*(id *)(v77 + 1144) submitTaskingDefaultsCheckStateToCA:@"PLTaskingOnDemand"];
    if (!+[PLDefaults BOOLForKey:@"PLTaskingOnDemandOptOut" ifNotSet:0])goto LABEL_18; {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.OTATasking", @"PLTaskingOnDemandOptOut"];
    }
    PLADClientAddValueForScalarKey();
    AnalyticsSendEventLazy();
  }
LABEL_17:
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_406(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_405 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_412(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_411 = result;
  return result;
}

void *__45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_422()
{
  return &unk_1F1594810;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_433(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_432 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_439(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_438 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_448(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_447 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_470(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_469 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_476(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_475 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_482(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  shouldStartTaskingToday_classDebugEnabled_481 = result;
  return result;
}

void *__45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_489()
{
  return &unk_1F1594838;
}

void *__45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_2()
{
  return &unk_1F1594860;
}

- (BOOL)submitPLL
{
  return self->_submittedFilesMask & 1;
}

- (BOOL)submitPLLUpgrade
{
  return (BYTE1(self->_submittedFilesMask) >> 2) & 1;
}

- (BOOL)submitMSS
{
  return (LOBYTE(self->_submittedFilesMask) >> 1) & 1;
}

- (BOOL)submitSP
{
  return (LOBYTE(self->_submittedFilesMask) >> 2) & 1;
}

- (BOOL)submitBDC
{
  return (LOBYTE(self->_submittedFilesMask) >> 3) & 1;
}

- (BOOL)submitCE
{
  return (LOBYTE(self->_submittedFilesMask) >> 4) & 1;
}

- (BOOL)submitXC
{
  return 0;
}

- (BOOL)submitBG
{
  int v3 = _os_feature_enabled_impl();
  if (v3) {
    return (LOBYTE(self->_submittedFilesMask) >> 6) & 1;
  }
  return v3;
}

- (BOOL)hasFileToSubmit
{
  return self->_submittedFilesMask != 0;
}

+ (BOOL)internalSubmissionBehavior
{
  if (!+[PLPlatform internalBuild]) {
    return 0;
  }
  uint64_t v2 = PLOSAPreferencesGetValue();
  BOOL v3 = v2 == 0;
  if (v2)
  {
    int v4 = PLLogSubmission();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Tasking blob received for internal device", v6, 2u);
    }
  }
  return v3;
}

- (void)initializeFilesToBeSubmitted
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_unint64_t submittedFilesMask = 0;
  PLOSAPreferencesGetValue();
  BOOL v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  taskingFiles = self->_taskingFiles;
  self->_taskingFiles = v3;

  BOOL v5 = self->_taskingFiles;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v6 = v5;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (!v7) {
      goto LABEL_30;
    }
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v17 = v8;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        if (objc_msgSend(v12, "isEqualToString:", @"PLL", v17))
        {
          unint64_t v13 = self->_submittedFilesMask | 1;
LABEL_23:
          self->_unint64_t submittedFilesMask = v13;
          goto LABEL_24;
        }
        if ([v12 isEqualToString:@"PLL-Upgrade"])
        {
          unint64_t v13 = self->_submittedFilesMask | 0x400;
          goto LABEL_23;
        }
        if ([v12 isEqualToString:@"MSS"])
        {
          unint64_t v13 = self->_submittedFilesMask | 2;
          goto LABEL_23;
        }
        if ([v12 isEqualToString:@"SP"])
        {
          unint64_t v13 = self->_submittedFilesMask | 4;
          goto LABEL_23;
        }
        if ([v12 isEqualToString:@"BDC"])
        {
          unint64_t v13 = self->_submittedFilesMask | 8;
          goto LABEL_23;
        }
        if ([v12 isEqualToString:@"CE"])
        {
          unint64_t v13 = self->_submittedFilesMask | 0x10;
          goto LABEL_23;
        }
        if ([v12 isEqualToString:@"XC"])
        {
          unint64_t v13 = self->_submittedFilesMask | 0x20;
          goto LABEL_23;
        }
        if ([v12 isEqualToString:@"BG"])
        {
          unint64_t v13 = self->_submittedFilesMask | 0x40;
          goto LABEL_23;
        }
        log = PLLogSubmission();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v17;
          uint64_t v24 = v12;
          _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Unsupported tasking files: %@", buf, 0xCu);
        }

LABEL_24:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v14 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      uint64_t v9 = v14;
      if (!v14)
      {
LABEL_30:

        return;
      }
    }
  }
  if (+[PLPlatform internalBuild])
  {
    int v15 = [(PLSubmissionConfig *)self submitReasonType];
    unint64_t v16 = 127;
    if (v15 == 2) {
      unint64_t v16 = 3;
    }
    self->_unint64_t submittedFilesMask = v16;
    if ((_os_feature_enabled_impl() & 1) == 0) {
      self->_submittedFilesMask &= ~0x20uLL;
    }
    if ((_os_feature_enabled_impl() & 1) == 0) {
      self->_submittedFilesMask &= ~0x40uLL;
    }
  }
}

- (void)setSubmittedFilesMask:(unint64_t)a3
{
  self->_unint64_t submittedFilesMask = a3;
}

- (unint64_t)submittedFilesMask
{
  return self->_submittedFilesMask;
}

- (void)submitFileStatsToAnalytics
{
  if ([(PLSubmissionConfig *)self submitPLL])
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.iCloudTaskingSubmissionFiles", @"PLL"];
    PLADClientAddValueForScalarKey();
  }
  if ([(PLSubmissionConfig *)self submitPLLUpgrade])
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.iCloudTaskingSubmissionFiles", @"PLL"];
    PLADClientAddValueForScalarKey();
  }
  if ([(PLSubmissionConfig *)self submitMSS])
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.iCloudTaskingSubmissionFiles", @"MSS"];
    PLADClientAddValueForScalarKey();
  }
  if ([(PLSubmissionConfig *)self submitSP])
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.iCloudTaskingSubmissionFiles", @"SP"];
    PLADClientAddValueForScalarKey();
  }
  if ([(PLSubmissionConfig *)self submitBDC])
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.iCloudTaskingSubmissionFiles", @"BDC"];
    PLADClientAddValueForScalarKey();
  }
  if ([(PLSubmissionConfig *)self submitCE])
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.powerlog.iCloudTaskingSubmissionFiles", @"CE"];
    PLADClientAddValueForScalarKey();
  }
  AnalyticsSendEventLazy();
}

id __48__PLSubmissionConfig_submitFileStatsToAnalytics__block_invoke(uint64_t a1)
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v11[0] = @"PLL";
  if ([*(id *)(a1 + 32) submitPLL]) {
    uint64_t v2 = &unk_1F15849B0;
  }
  else {
    uint64_t v2 = &unk_1F15849C8;
  }
  v12[0] = v2;
  v11[1] = @"PLL-Upgrade";
  if ([*(id *)(a1 + 32) submitPLLUpgrade]) {
    BOOL v3 = &unk_1F15849B0;
  }
  else {
    BOOL v3 = &unk_1F15849C8;
  }
  v12[1] = v3;
  v11[2] = @"MSS";
  if ([*(id *)(a1 + 32) submitMSS]) {
    int v4 = &unk_1F15849B0;
  }
  else {
    int v4 = &unk_1F15849C8;
  }
  v12[2] = v4;
  v11[3] = @"SP";
  if ([*(id *)(a1 + 32) submitSP]) {
    BOOL v5 = &unk_1F15849B0;
  }
  else {
    BOOL v5 = &unk_1F15849C8;
  }
  v12[3] = v5;
  v11[4] = @"BDC";
  if ([*(id *)(a1 + 32) submitBDC]) {
    BOOL v6 = &unk_1F15849B0;
  }
  else {
    BOOL v6 = &unk_1F15849C8;
  }
  v12[4] = v6;
  v11[5] = @"CE";
  if ([*(id *)(a1 + 32) submitCE]) {
    uint64_t v7 = &unk_1F15849B0;
  }
  else {
    uint64_t v7 = &unk_1F15849C8;
  }
  v12[5] = v7;
  v11[6] = @"XC";
  if ([*(id *)(a1 + 32) submitXC]) {
    long long v8 = &unk_1F15849B0;
  }
  else {
    long long v8 = &unk_1F15849C8;
  }
  v12[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];
  return v9;
}

- (void)emitTaskingTypeSpecifiedEvent
{
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v3 = [(PLSubmissionConfig *)self request];
  [v10 setObject:v3 forKeyedSubscript:@"TaskingRequest"];

  int v4 = [(PLSubmissionConfig *)self taskingType];
  [v10 setObject:v4 forKeyedSubscript:@"TaskingType"];

  BOOL v5 = [(PLSubmissionConfig *)self configUUID];
  BOOL v6 = [v5 UUIDString];
  [v10 setObject:v6 forKeyedSubscript:@"TaskingUUID"];

  uint64_t v7 = NSNumber;
  long long v8 = [(PLSubmissionConfig *)self taskingType];
  uint64_t v9 = [v7 numberWithInt:v8 != 0];
  [v10 setObject:v9 forKeyedSubscript:@"TaskingTypeSpecified"];

  _submitTaskingTypeCAEventPayload(v10, @"Tasking type specified");
}

- (void)emitQueryEvent:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v5 = [(PLSubmissionConfig *)self request];
  [v11 setObject:v5 forKeyedSubscript:@"TaskingRequest"];

  BOOL v6 = [(PLSubmissionConfig *)self taskingType];
  [v11 setObject:v6 forKeyedSubscript:@"TaskingType"];

  uint64_t v7 = [(PLSubmissionConfig *)self configUUID];
  long long v8 = [v7 UUIDString];
  [v11 setObject:v8 forKeyedSubscript:@"TaskingUUID"];

  uint64_t v9 = [NSNumber numberWithBool:v3];
  [v11 setObject:v9 forKeyedSubscript:@"QueryResult"];

  if (v3) {
    id v10 = @"Query succceded";
  }
  else {
    id v10 = @"Query failed";
  }
  _submitTaskingTypeCAEventPayload(v11, v10);
}

- (void)emitSubmitEvent
{
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v3 = [(PLSubmissionConfig *)self request];
  [v7 setObject:v3 forKeyedSubscript:@"TaskingRequest"];

  int v4 = [(PLSubmissionConfig *)self taskingType];
  [v7 setObject:v4 forKeyedSubscript:@"TaskingType"];

  BOOL v5 = [(PLSubmissionConfig *)self configUUID];
  BOOL v6 = [v5 UUIDString];
  [v7 setObject:v6 forKeyedSubscript:@"TaskingUUID"];

  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ShouldSubmit"];
  _submitTaskingTypeCAEventPayload(v7, @"Device should submit");
}

+ (void)submitTaskingDefaultsCheckStateToCA:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __58__PLSubmissionConfig_submitTaskingDefaultsCheckStateToCA___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"state";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)contextDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PLSubmissionConfig *)self filePath];
  BOOL v5 = [v4 lastPathComponent];
  [v3 setObject:v5 forKeyedSubscript:@"fileName"];

  BOOL v6 = [(PLSubmissionConfig *)self ckTagConfig];
  id v7 = [v6 objectForKeyedSubscript:@"Internal"];
  if ([v7 isEqualToString:@"true"]) {
    long long v8 = &unk_1F15849B0;
  }
  else {
    long long v8 = &unk_1F15849C8;
  }
  [v3 setObject:v8 forKeyedSubscript:@"internal"];

  uint64_t v9 = [(PLSubmissionConfig *)self ckTagConfig];
  id v10 = [v9 objectForKeyedSubscript:@"Beta"];
  if ([v10 isEqualToString:@"true"]) {
    id v11 = &unk_1F15849B0;
  }
  else {
    id v11 = &unk_1F15849C8;
  }
  [v3 setObject:v11 forKeyedSubscript:@"seed"];

  [v3 setObject:@"iOS" forKeyedSubscript:@"machineType"];
  uint64_t v12 = [v3 objectForKeyedSubscript:@"machineType"];
  int v13 = [v12 isEqualToString:@"iOS"];

  if (v13 && +[PLPlatform isiPad]) {
    [v3 setObject:@"iPadOS" forKeyedSubscript:@"machineType"];
  }
  uint64_t v14 = [(PLSubmissionConfig *)self ckTagConfig];
  int v15 = [v14 objectForKeyedSubscript:@"Model"];

  if (v15)
  {
    unint64_t v16 = [(PLSubmissionConfig *)self ckTagConfig];
    long long v17 = [v16 objectForKeyedSubscript:@"Model"];
    [v3 setObject:v17 forKeyedSubscript:@"deviceModel"];
  }
  uint64_t v18 = [(PLSubmissionConfig *)self ckTagConfig];
  long long v19 = [v18 objectForKeyedSubscript:@"TagUUID"];

  if (v19)
  {
    long long v20 = [(PLSubmissionConfig *)self ckTagConfig];
    long long v21 = [v20 objectForKeyedSubscript:@"TagUUID"];
    [v3 setObject:v21 forKeyedSubscript:@"UUID"];
  }
  long long v22 = [(PLSubmissionConfig *)self ckTagConfig];
  v23 = [v22 objectForKeyedSubscript:@"Reason"];

  if (v23)
  {
    uint64_t v24 = [(PLSubmissionConfig *)self ckTagConfig];
    uint64_t v25 = [v24 objectForKeyedSubscript:@"Reason"];
    [v3 setObject:v25 forKeyedSubscript:@"reason"];
  }
  uint64_t v26 = [(PLSubmissionConfig *)self ckTagConfig];
  objc_super v27 = [v26 objectForKeyedSubscript:@"Build"];

  if (v27)
  {
    uint64_t v28 = [(PLSubmissionConfig *)self ckTagConfig];
    long long v29 = [v28 objectForKeyedSubscript:@"Build"];
    [v3 setObject:v29 forKeyedSubscript:@"build"];
  }
  uint64_t v30 = [(PLSubmissionConfig *)self ckTagConfig];
  int v31 = [v30 objectForKeyedSubscript:@"Date"];

  if (v31)
  {
    uint64_t v32 = [(PLSubmissionConfig *)self ckTagConfig];
    uint64_t v33 = [v32 objectForKeyedSubscript:@"Date"];
    [v3 setObject:v33 forKeyedSubscript:@"date"];
  }
  unint64_t v34 = [(PLSubmissionConfig *)self ckTagConfig];
  uint64_t v35 = [v34 objectForKeyedSubscript:@"SubmittedFilesMask"];

  if (v35)
  {
    id v36 = [(PLSubmissionConfig *)self ckTagConfig];
    v37 = [v36 objectForKeyedSubscript:@"SubmittedFilesMask"];
    [v3 setObject:v37 forKeyedSubscript:@"submittedFilesMask"];
  }
  v38 = [(PLSubmissionConfig *)self ckTagConfig];
  v39 = [v38 objectForKeyedSubscript:@"ExtendedAttributes"];

  if (v39)
  {
    uint64_t v40 = [(PLSubmissionConfig *)self ckTagConfig];
    uint64_t v41 = [v40 objectForKeyedSubscript:@"ExtendedAttributes"];
    int v42 = (void *)[v41 mutableCopy];

    uint64_t v43 = [MEMORY[0x1E4F1C9C8] now];
    long long v44 = +[PLSubmissionConfig getDateMarkerFromSystemDate:v43];
    [v42 setObject:v44 forKeyedSubscript:@"HandoverDate"];

    v45 = [v42 serializedJSONString];
    [v3 setObject:v45 forKeyedSubscript:@"extendedAttributes"];
  }
  v46 = (void *)[v3 copy];

  return v46;
}

- (BOOL)isDRTasking
{
  return self->_isDRTasking;
}

- (void)setIsDRTasking:(BOOL)a3
{
  self->_isDRTasking = a3;
}

- (NSUUID)configUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigUUID:(id)a3
{
}

- (NSDate)configDateReceived
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigDateReceived:(id)a3
{
}

- (NSDate)configDateApplied
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfigDateApplied:(id)a3
{
}

- (NSString)request
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSString)ondemand
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOndemand:(id)a3
{
}

- (NSNumber)capSize
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCapSize:(id)a3
{
}

- (NSDictionary)plTaskingTables
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPlTaskingTables:(id)a3
{
}

- (NSDictionary)ppsTaskingTables
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPpsTaskingTables:(id)a3
{
}

- (NSDictionary)hashEntries
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHashEntries:(id)a3
{
}

- (NSArray)removeEntries
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRemoveEntries:(id)a3
{
}

- (NSArray)trimmingQueries
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTrimmingQueries:(id)a3
{
}

- (NSString)taskingType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTaskingType:(id)a3
{
}

- (NSDictionary)defaultTaskingTypeParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDefaultTaskingTypeParameters:(id)a3
{
}

- (NSDictionary)perModelTaskingTypeParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPerModelTaskingTypeParameters:(id)a3
{
}

- (NSArray)taskingFiles
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTaskingFiles:(id)a3
{
}

- (BOOL)enableDPUpload
{
  return self->_enableDPUpload;
}

- (void)setEnableDPUpload:(BOOL)a3
{
  self->_enableDPUpload = a3;
}

- (BOOL)signpostDisable
{
  return self->_signpostDisable;
}

- (void)setSignpostDisable:(BOOL)a3
{
  self->_signpostDisable = a3;
}

- (NSDictionary)signpostAllowlist
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSignpostAllowlist:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)lastBatteryTimestampSystem
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastBatteryTimestampSystem:(id)a3
{
}

- (NSNumber)cacheSize
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCacheSize:(id)a3
{
}

- (signed)submitReasonType
{
  return self->_submitReasonType;
}

- (void)setSubmitReasonType:(signed __int16)a3
{
  self->_submitReasonType = a3;
}

- (NSString)tagUUID
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTagUUID:(id)a3
{
}

- (BOOL)seed
{
  return self->_seed;
}

- (void)setSeed:(BOOL)a3
{
  self->_seed = a3;
}

- (BOOL)internal
{
  return self->_internal;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (NSArray)builds
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBuilds:(id)a3
{
}

- (NSString)deviceModel
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setFilePath:(id)a3
{
}

- (NSDictionary)ckTagConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCkTagConfig:(id)a3
{
}

- (NSString)blobFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBlobFailureReason:(id)a3
{
}

- (double)dice
{
  return self->_dice;
}

- (void)setDice:(double)a3
{
  self->_dice = a3;
}

- (NSString)taskingBuild
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTaskingBuild:(id)a3
{
}

- (NSString)taskingPopulation
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setTaskingPopulation:(id)a3
{
}

- (NSString)taskingDeviceModels
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTaskingDeviceModels:(id)a3
{
}

- (NSDictionary)taskingPercentage
{
  return (NSDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTaskingPercentage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingPercentage, 0);
  objc_storeStrong((id *)&self->_taskingDeviceModels, 0);
  objc_storeStrong((id *)&self->_taskingPopulation, 0);
  objc_storeStrong((id *)&self->_taskingBuild, 0);
  objc_storeStrong((id *)&self->_blobFailureReason, 0);
  objc_storeStrong((id *)&self->_ckTagConfig, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_builds, 0);
  objc_storeStrong((id *)&self->_tagUUID, 0);
  objc_storeStrong((id *)&self->_cacheSize, 0);
  objc_storeStrong((id *)&self->_lastBatteryTimestampSystem, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_signpostAllowlist, 0);
  objc_storeStrong((id *)&self->_taskingFiles, 0);
  objc_storeStrong((id *)&self->_perModelTaskingTypeParameters, 0);
  objc_storeStrong((id *)&self->_defaultTaskingTypeParameters, 0);
  objc_storeStrong((id *)&self->_taskingType, 0);
  objc_storeStrong((id *)&self->_trimmingQueries, 0);
  objc_storeStrong((id *)&self->_removeEntries, 0);
  objc_storeStrong((id *)&self->_hashEntries, 0);
  objc_storeStrong((id *)&self->_ppsTaskingTables, 0);
  objc_storeStrong((id *)&self->_plTaskingTables, 0);
  objc_storeStrong((id *)&self->_capSize, 0);
  objc_storeStrong((id *)&self->_ondemand, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_configDateApplied, 0);
  objc_storeStrong((id *)&self->_configDateReceived, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
}

- (void)initWithReasonType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "startDate=%@, endDate=%@", v1, 0x16u);
}

- (void)initWithReasonType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "monotonicUpgradeDate=%@", v2, v3, v4, v5, v6);
}

- (void)initWithReasonType:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 startDate];
  uint64_t v5 = [a1 endDate];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "monotonicPowerlogRange=[%@, %@]", (uint8_t *)&v6, 0x16u);
}

- (void)initWithReasonType:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "Nil date(s), cannot init upgrade range: monotonicPowerlogStart=%@, monotonicPowerlogEnd=%@", v1, 0x16u);
}

- (void)isValidTaskingBlob
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 taskingFiles];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Invalid tasking files request: %@", v4, 0xCu);
}

- (void)conditionCheckForEnergy
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "Energy Tasking: last archived powerlog %@ does not exist!", v1, 0xCu);
}

- (void)shouldSubmitToday
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Starting conditional submission check...", v2, v3, v4, v5, v6);
}

@end