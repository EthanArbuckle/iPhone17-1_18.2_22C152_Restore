@interface MAAutoAssetSummary
+ (BOOL)supportsSecureCoding;
+ (id)assetRepresentationName:(int64_t)a3;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (BOOL)assetIsSecureMobileAsset;
- (BOOL)assetIsStaged;
- (BOOL)assetWasPatched;
- (BOOL)getStringsForSummaryProps:(id *)a3 isPersonalized:(id *)a4 isPrePersonalized:(id *)a5 isGrafted:(id *)a6 graftPoint:(id *)a7 stageGroup:(id *)a8 targetOS:(id *)a9;
- (BOOL)secureMobileAssetIsGrafted;
- (BOOL)secureMobileAssetIsPersonalized;
- (BOOL)secureMobileAssetIsPrePersonalized;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetStatus)jobStatus;
- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14;
- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14 withIsSecureMobileAsset:(BOOL)a15 withPersonalizationStatus:(BOOL)a16 withPrePersonalizationStatus:(BOOL)a17 withGraftStatus:(BOOL)a18 withGraftPoint:(id)a19 withStageGroupType:(unint64_t)a20 withTargetOS:(id)a21;
- (MAAutoAssetSummary)initWithCoder:(id)a3;
- (NSString)secureMobileAssetGraftPoint;
- (NSString)targetOS;
- (id)assetRepresentationName;
- (id)description;
- (id)newSummaryDictionary;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeClientCount;
- (int64_t)activeMonitorCount;
- (int64_t)assetRepresentation;
- (int64_t)maximumClientCount;
- (int64_t)pushDelaySecs;
- (int64_t)scheduledIntervalSecs;
- (int64_t)scheduledRemainingSecs;
- (int64_t)totalClientCount;
- (unint64_t)stageGroup;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetIsSecureMobileAsset:(BOOL)a3;
- (void)setAssetIsStaged:(BOOL)a3;
- (void)setAssetRepresentation:(int64_t)a3;
- (void)setAssetSelector:(id)a3;
- (void)setAssetWasPatched:(BOOL)a3;
- (void)setJobStatus:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setPushDelaySecs:(int64_t)a3;
- (void)setScheduledIntervalSecs:(int64_t)a3;
- (void)setScheduledRemainingSecs:(int64_t)a3;
- (void)setSecureMobileAssetGraftPoint:(id)a3;
- (void)setSecureMobileAssetIsGrafted:(BOOL)a3;
- (void)setSecureMobileAssetIsPersonalized:(BOOL)a3;
- (void)setSecureMobileAssetIsPrePersonalized:(BOOL)a3;
- (void)setStageGroup:(unint64_t)a3;
- (void)setTargetOS:(id)a3;
- (void)setTotalClientCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MAAutoAssetSummary

- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14
{
  id v21 = a3;
  id v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)MAAutoAssetSummary;
  v23 = [(MAAutoAssetSummary *)&v26 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_assetSelector, a3);
    v24->_assetRepresentation = a4;
    v24->_assetWasPatched = a5;
    v24->_assetIsStaged = a6;
    objc_storeStrong((id *)&v24->_jobStatus, a7);
    v24->_scheduledIntervalSecs = a8;
    v24->_scheduledRemainingSecs = a9;
    v24->_pushDelaySecs = a10;
    v24->_activeClientCount = a11;
    v24->_activeMonitorCount = a12;
    v24->_maximumClientCount = a13;
    v24->_totalClientCount = a14;
  }

  return v24;
}

- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14 withIsSecureMobileAsset:(BOOL)a15 withPersonalizationStatus:(BOOL)a16 withPrePersonalizationStatus:(BOOL)a17 withGraftStatus:(BOOL)a18 withGraftPoint:(id)a19 withStageGroupType:(unint64_t)a20 withTargetOS:(id)a21
{
  id v25 = a3;
  id v26 = a7;
  id v27 = a19;
  id v28 = a21;
  v35.receiver = self;
  v35.super_class = (Class)MAAutoAssetSummary;
  v29 = [(MAAutoAssetSummary *)&v35 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_assetSelector, a3);
    v30->_assetRepresentation = a4;
    v30->_assetWasPatched = a5;
    v30->_assetIsStaged = a6;
    objc_storeStrong((id *)&v30->_jobStatus, a7);
    v30->_scheduledIntervalSecs = a8;
    v30->_scheduledRemainingSecs = a9;
    v30->_pushDelaySecs = a10;
    v30->_activeClientCount = a11;
    v30->_activeMonitorCount = a12;
    v30->_maximumClientCount = a13;
    v30->_totalClientCount = a14;
    v30->_assetIsSecureMobileAsset = a15;
    v30->_secureMobileAssetIsPersonalized = a16;
    v30->_secureMobileAssetIsPrePersonalized = a17;
    v30->_secureMobileAssetIsGrafted = a18;
    objc_storeStrong((id *)&v30->_secureMobileAssetGraftPoint, a19);
    v30->_stageGroup = a20;
    objc_storeStrong((id *)&v30->_targetOS, a21);
  }

  return v30;
}

- (MAAutoAssetSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSummary;
  v5 = [(MAAutoAssetSummary *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSelector"];
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v6;

    v5->_assetRepresentation = [v4 decodeInt64ForKey:@"assetRepresentation"];
    v5->_assetWasPatched = [v4 decodeBoolForKey:@"assetWasPatched"];
    v5->_assetIsStaged = [v4 decodeBoolForKey:@"assetIsStaged"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jobStatus"];
    jobStatus = v5->_jobStatus;
    v5->_jobStatus = (MAAutoAssetStatus *)v8;

    v5->_scheduledIntervalSecs = [v4 decodeIntegerForKey:@"scheduledIntervalSecs"];
    v5->_scheduledRemainingSecs = [v4 decodeIntegerForKey:@"scheduledRemainingSecs"];
    v5->_pushDelaySecs = [v4 decodeIntegerForKey:@"pushDelaySecs"];
    v5->_activeClientCount = [v4 decodeIntegerForKey:@"activeClientCount"];
    v5->_activeMonitorCount = [v4 decodeIntegerForKey:@"activeMonitorCount"];
    v5->_maximumClientCount = [v4 decodeIntegerForKey:@"maximumClientCount"];
    v5->_totalClientCount = [v4 decodeIntegerForKey:@"totalClientCount"];
    v5->_assetIsSecureMobileAsset = [v4 decodeBoolForKey:@"assetIsSecureMobileAsset"];
    v5->_secureMobileAssetIsPersonalized = [v4 decodeBoolForKey:@"secureMobileAssetIsPersonalized"];
    v5->_secureMobileAssetIsPrePersonalized = [v4 decodeBoolForKey:@"secureMobileAssetIsPrePersonalized"];
    v5->_secureMobileAssetIsGrafted = [v4 decodeBoolForKey:@"secureMobileAssetIsGrafted"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureMobileAssetGraftPoint"];
    secureMobileAssetGraftPoint = v5->_secureMobileAssetGraftPoint;
    v5->_secureMobileAssetGraftPoint = (NSString *)v10;

    v5->_stageGroup = [v4 decodeIntegerForKey:@"stageGroup"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetOSKey"];
    targetOS = v5->_targetOS;
    v5->_targetOS = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSummary *)self assetSelector];
  [v4 encodeObject:v5 forKey:@"assetSelector"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary assetRepresentation](self, "assetRepresentation"), @"assetRepresentation");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"), @"assetWasPatched");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"), @"assetIsStaged");
  uint64_t v6 = [(MAAutoAssetSummary *)self jobStatus];
  [v4 encodeObject:v6 forKey:@"jobStatus"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"), @"scheduledIntervalSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"), @"pushDelaySecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"), @"scheduledRemainingSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"), @"activeClientCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"), @"activeMonitorCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"), @"maximumClientCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"), @"totalClientCount");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary assetIsSecureMobileAsset](self, "assetIsSecureMobileAsset"), @"assetIsSecureMobileAsset");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary secureMobileAssetIsPersonalized](self, "secureMobileAssetIsPersonalized"), @"secureMobileAssetIsPersonalized");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary secureMobileAssetIsPrePersonalized](self, "secureMobileAssetIsPrePersonalized"), @"secureMobileAssetIsPrePersonalized");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary secureMobileAssetIsGrafted](self, "secureMobileAssetIsGrafted"), @"secureMobileAssetIsGrafted");
  v7 = [(MAAutoAssetSummary *)self secureMobileAssetGraftPoint];
  [v4 encodeObject:v7 forKey:@"secureMobileAssetGraftPoint"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary stageGroup](self, "stageGroup"), @"stageGroup");
  id v8 = [(MAAutoAssetSummary *)self targetOS];
  [v4 encodeObject:v8 forKey:@"targetOSKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)getStringsForSummaryProps:(id *)a3 isPersonalized:(id *)a4 isPrePersonalized:(id *)a5 isGrafted:(id *)a6 graftPoint:(id *)a7 stageGroup:(id *)a8 targetOS:(id *)a9
{
  if (a3) {
    BOOL v9 = a4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v14 = v9 || a5 == 0 || a6 == 0 || a7 == 0 || a8 == 0 || a9 == 0;
  BOOL v15 = !v14;
  if (v14)
  {
    v24 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:](v25);
    }
  }
  else
  {
    *a3 = @"N/A";
    *a4 = @"N/A";
    *a5 = @"N/A";
    *a6 = @"N/A";
    *a7 = @"N/A";
    *a8 = @"N/A";
    *a9 = @"N/A";
    if ([(MAAutoAssetSummary *)self assetIsSecureMobileAsset])
    {
      *a3 = @"YES";
      if ([(MAAutoAssetSummary *)self secureMobileAssetIsPersonalized])
      {
        *a4 = @"YES";
        if ([(MAAutoAssetSummary *)self secureMobileAssetIsGrafted])
        {
          *a6 = @"YES";
          v23 = [(MAAutoAssetSummary *)self secureMobileAssetGraftPoint];

          if (v23)
          {
            *a7 = [(MAAutoAssetSummary *)self secureMobileAssetGraftPoint];
          }
          else
          {
            *a7 = @"Unknown(error)";
          }
        }
        else
        {
          *a6 = @"NO";
        }
      }
      else
      {
        *a4 = @"NO";
      }
      if ([(MAAutoAssetSummary *)self secureMobileAssetIsPrePersonalized]) {
        *a5 = @"YES";
      }
    }
    else
    {
      *a3 = @"NO";
    }
    if ([(MAAutoAssetSummary *)self assetIsStaged])
    {
      if ([(MAAutoAssetSummary *)self stageGroup] == 1)
      {
        id v26 = @"REQUIRED";
      }
      else
      {
        unint64_t v27 = [(MAAutoAssetSummary *)self stageGroup];
        id v26 = @"UNKNOWN";
        if (v27 == 2) {
          id v26 = @"OPTIONAL";
        }
      }
      *a8 = v26;
      id v28 = [(MAAutoAssetSummary *)self targetOS];
      if (v28)
      {
        id v29 = [(MAAutoAssetSummary *)self targetOS];
        *a9 = v29;
      }
      else
      {
        *a9 = @"Unknown";
      }
    }
  }
  return v15;
}

- (id)description
{
  v3 = @"N";
  v54 = @"N/A";
  v55[0] = @"N";
  v52 = @"N/A";
  v53 = @"N/A";
  v50 = @"N/A";
  v51 = @"N/A";
  v49 = @"N/A";
  [(MAAutoAssetSummary *)self getStringsForSummaryProps:v55 isPersonalized:&v54 isPrePersonalized:&v53 isGrafted:&v52 graftPoint:&v51 stageGroup:&v50 targetOS:&v49];
  v45 = (__CFString *)v55[0];
  v44 = v54;
  v43 = v53;
  v42 = v52;
  v41 = v51;
  v48 = v50;
  v47 = v49;
  v38 = NSString;
  v40 = [(MAAutoAssetSummary *)self assetSelector];
  uint64_t v39 = [v40 summary];
  v46 = [(MAAutoAssetSummary *)self assetRepresentationName];
  if ([(MAAutoAssetSummary *)self assetWasPatched]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v37 = v4;
  if ([(MAAutoAssetSummary *)self assetIsStaged]) {
    v3 = @"Y";
  }
  int64_t v5 = [(MAAutoAssetSummary *)self scheduledIntervalSecs];
  int64_t v6 = [(MAAutoAssetSummary *)self scheduledRemainingSecs];
  int64_t v7 = [(MAAutoAssetSummary *)self pushDelaySecs];
  int64_t v8 = [(MAAutoAssetSummary *)self activeClientCount];
  int64_t v9 = [(MAAutoAssetSummary *)self activeMonitorCount];
  int64_t v10 = [(MAAutoAssetSummary *)self maximumClientCount];
  int64_t v11 = [(MAAutoAssetSummary *)self totalClientCount];
  uint64_t v12 = [(MAAutoAssetSummary *)self jobStatus];
  if (v12)
  {
    v13 = [(MAAutoAssetSummary *)self jobStatus];
    uint64_t v14 = [v13 description];
    BOOL v15 = v3;
    v16 = (void *)v14;
    int64_t v35 = v11;
    int64_t v31 = v9;
    int64_t v33 = v10;
    int64_t v27 = v7;
    int64_t v29 = v8;
    int64_t v25 = v6;
    v18 = v41;
    v17 = v42;
    v19 = v43;
    v20 = v44;
    id v21 = v45;
    id v22 = (void *)v39;
    objc_msgSend(v38, "stringWithFormat:", @">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n              assetIsSecureAsset: %@\n       secureAssetIsPersonalized: %@\n    secureAssetIsPrePersonalized: %@\n      secureMobileAssetIsGrafted: %@\n     secureMobileAssetGraftPoint: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n                      stageGroup: %@\n                 targetOSVersion: %@\n%@<<<]", v39, v46, v37, v15, v45, v44, v43, v42, v41, v5, v25, v27, v29, v31, v33, v35,
      v48,
      v47,
    v23 = v14);
  }
  else
  {
    int64_t v36 = v11;
    int64_t v32 = v9;
    int64_t v34 = v10;
    int64_t v28 = v7;
    int64_t v30 = v8;
    int64_t v26 = v6;
    v18 = v41;
    v17 = v42;
    v19 = v43;
    v20 = v44;
    id v21 = v45;
    id v22 = (void *)v39;
    objc_msgSend(v38, "stringWithFormat:", @">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n              assetIsSecureAsset: %@\n       secureAssetIsPersonalized: %@\n    secureAssetIsPrePersonalized: %@\n      secureMobileAssetIsGrafted: %@\n     secureMobileAssetGraftPoint: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n                      stageGroup: %@\n                 targetOSVersion: %@\n%@<<<]", v39, v46, v37, v3, v45, v44, v43, v42, v41, v5, v26, v28, v30, v32, v34, v36,
      v48,
      v47,
    v23 = @"                       jobStatus: N\n");
  }

  return v23;
}

- (id)summary
{
  v3 = [(MAAutoAssetSummary *)self assetSelector];
  int64_t v28 = [v3 summary];

  int64_t v27 = [(MAAutoAssetSummary *)self assetRepresentationName];
  if ([(MAAutoAssetSummary *)self assetWasPatched]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  int64_t v26 = v4;
  if ([(MAAutoAssetSummary *)self assetIsStaged]) {
    int64_t v5 = @"Y";
  }
  else {
    int64_t v5 = @"N";
  }
  id v21 = v5;
  int64_t v6 = [(MAAutoAssetSummary *)self jobStatus];
  if (v6)
  {
    int64_t v7 = [(MAAutoAssetSummary *)self jobStatus];
    int64_t v25 = [v7 summary];
  }
  else
  {
    int64_t v25 = @"NONE";
  }

  v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  id v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  int64_t v34 = @"N/A";
  v35[0] = @"N";
  int64_t v32 = @"N/A";
  int64_t v33 = @"N/A";
  int64_t v30 = @"N/A";
  int64_t v31 = @"N/A";
  int64_t v29 = @"N/A";
  [(MAAutoAssetSummary *)self getStringsForSummaryProps:v35 isPersonalized:&v34 isPrePersonalized:&v33 isGrafted:&v32 graftPoint:&v31 stageGroup:&v30 targetOS:&v29];
  int64_t v8 = (__CFString *)v35[0];
  int64_t v9 = v34;
  int64_t v10 = v33;
  int64_t v11 = v32;
  uint64_t v12 = v31;
  v13 = v30;
  uint64_t v14 = v29;
  objc_msgSend(NSString, "stringWithFormat:", @"asset(%@)[%@]|patched:%@|staged:%@|secureMobileAsset:%@|personalized:%@|prePersonalized:%@|grafted:%@|graftPoint:%@|status:%@|interval:%@|remaining:%@|pushDelay:%@|clients:%@|monitors:%@|maxClients:%@|totalClients:%@|stageGroup:%@|targetOSVersion:%@", v28, v27, v26, v21, v8, v9, v10, v11, v12, v25, v24, v23, v22, v20, v19, v17,
    v16,
    v13,
    v14);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v32 = @"NO";
  int64_t v33 = @"NO";
  int64_t v30 = @"NO";
  int64_t v31 = @"NO";
  int64_t v28 = @"N/A";
  int64_t v29 = @"N/A";
  int64_t v27 = @"N/A";
  [(MAAutoAssetSummary *)self getStringsForSummaryProps:&v33 isPersonalized:&v32 isPrePersonalized:&v31 isGrafted:&v30 graftPoint:&v29 stageGroup:&v28 targetOS:&v27];
  id v4 = v33;
  int64_t v5 = v32;
  int64_t v6 = v31;
  int64_t v7 = v30;
  int64_t v8 = v29;
  int64_t v26 = v28;
  int64_t v25 = v27;
  int64_t v9 = [(MAAutoAssetSummary *)self assetSelector];
  int64_t v10 = (void *)[v9 newSummaryDictionary];
  [v3 setSafeObject:v10 forKey:@"assetSelector"];

  int64_t v11 = [(MAAutoAssetSummary *)self assetRepresentationName];
  [v3 setSafeObject:v11 forKey:@"assetRepresentation"];

  if ([(MAAutoAssetSummary *)self assetWasPatched]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  [v3 setSafeObject:v12 forKey:@"assetWasPatched"];
  if ([(MAAutoAssetSummary *)self assetIsStaged]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 setSafeObject:v13 forKey:@"assetIsStaged"];
  [v3 setSafeObject:v4 forKey:@"assetIsSecureMobileAsset"];
  [v3 setSafeObject:v5 forKey:@"secureMobileAssetIsPersonalized"];
  [v3 setSafeObject:v6 forKey:@"secureMobileAssetIsPrePersonalized"];
  [v3 setSafeObject:v7 forKey:@"secureMobileAssetIsGrafted"];
  [v3 setSafeObject:v8 forKey:@"secureMobileAssetGraftPoint"];
  uint64_t v14 = [(MAAutoAssetSummary *)self jobStatus];
  if (v14)
  {
    id v15 = [(MAAutoAssetSummary *)self jobStatus];
    v16 = (void *)[v15 newSummaryDictionary];
    [v3 setSafeObject:v16 forKey:@"jobStatus"];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    [v3 setSafeObject:v15 forKey:@"jobStatus"];
  }

  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  [v3 setSafeObject:v17 forKey:@"scheduledIntervalSecs"];

  id v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  [v3 setSafeObject:v18 forKey:@"scheduledRemainingSecs"];

  v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  [v3 setSafeObject:v19 forKey:@"pushDelaySecs"];

  v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  [v3 setSafeObject:v20 forKey:@"activeClientCount"];

  id v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  [v3 setSafeObject:v21 forKey:@"activeMonitorCount"];

  id v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  [v3 setSafeObject:v22 forKey:@"maximumClientCount"];

  v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  [v3 setSafeObject:v23 forKey:@"totalClientCount"];

  [v3 setSafeObject:v26 forKey:@"stageGroup"];
  [v3 setSafeObject:v25 forKey:@"targetOSKey"];

  return v3;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MAAutoAssetSummary *)self assetSelector];
  int64_t v6 = [v5 summary];

  v85 = [(MAAutoAssetSummary *)self assetRepresentationName];
  if ([(MAAutoAssetSummary *)self assetWasPatched]) {
    int64_t v7 = @"Y";
  }
  else {
    int64_t v7 = @"N";
  }
  v86 = v7;
  if ([(MAAutoAssetSummary *)self assetIsStaged]) {
    int64_t v8 = @"Y";
  }
  else {
    int64_t v8 = @"N";
  }
  v75 = v8;
  int64_t v9 = [(MAAutoAssetSummary *)self jobStatus];
  if (v9)
  {
    int64_t v10 = [(MAAutoAssetSummary *)self jobStatus];
    v84 = [v10 summary];
  }
  else
  {
    v84 = @"NONE";
  }

  v83 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v82 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v81 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v80 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v79 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v78 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v77 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v92 = @"NO";
  v93[0] = @"NO";
  v90 = @"NO";
  v91 = @"NO";
  v88 = @"N/A";
  v89 = @"N/A";
  v87 = @"N/A";
  [(MAAutoAssetSummary *)self getStringsForSummaryProps:v93 isPersonalized:&v92 isPrePersonalized:&v91 isGrafted:&v90 graftPoint:&v89 stageGroup:&v88 targetOS:&v87];
  v76 = (__CFString *)v93[0];
  int64_t v11 = v92;
  uint64_t v12 = v91;
  v13 = v90;
  uint64_t v14 = v89;
  id v15 = v88;
  v16 = v87;
  v74 = v6;
  unint64_t v17 = [v6 length];
  id v18 = [v4 safeStringForKey:@"assetSelector"];
  unint64_t v19 = [v18 length];

  if (v17 > v19) {
    [v4 setSafeObject:v74 forKey:@"assetSelector"];
  }
  unint64_t v20 = [v85 length];
  id v21 = [v4 safeStringForKey:@"assetRepresentation"];
  unint64_t v22 = [v21 length];

  if (v20 > v22) {
    [v4 setSafeObject:v85 forKey:@"assetRepresentation"];
  }
  unint64_t v23 = [(__CFString *)v86 length];
  v24 = [v4 safeStringForKey:@"assetWasPatched"];
  unint64_t v25 = [v24 length];

  if (v23 > v25) {
    [v4 setSafeObject:v86 forKey:@"assetWasPatched"];
  }
  unint64_t v26 = [(__CFString *)v75 length];
  int64_t v27 = [v4 safeStringForKey:@"assetIsStaged"];
  unint64_t v28 = [v27 length];

  if (v26 > v28) {
    [v4 setSafeObject:v86 forKey:@"assetIsStaged"];
  }
  unint64_t v29 = [(__CFString *)v76 length];
  int64_t v30 = [v4 safeStringForKey:@"assetIsSecureMobileAsset"];
  unint64_t v31 = [v30 length];

  if (v29 > v31) {
    [v4 setSafeObject:v76 forKey:@"assetIsSecureMobileAsset"];
  }
  unint64_t v32 = [(__CFString *)v11 length];
  int64_t v33 = [v4 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  unint64_t v34 = [v33 length];

  if (v32 > v34) {
    [v4 setSafeObject:v11 forKey:@"secureMobileAssetIsPersonalized"];
  }
  unint64_t v35 = [(__CFString *)v12 length];
  int64_t v36 = [v4 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  unint64_t v37 = [v36 length];

  if (v35 > v37) {
    [v4 setSafeObject:v12 forKey:@"secureMobileAssetIsPrePersonalized"];
  }
  unint64_t v38 = [(__CFString *)v13 length];
  uint64_t v39 = [v4 safeStringForKey:@"secureMobileAssetIsGrafted"];
  unint64_t v40 = [v39 length];

  if (v38 > v40) {
    [v4 setSafeObject:v13 forKey:@"secureMobileAssetIsGrafted"];
  }
  unint64_t v41 = [(__CFString *)v14 length];
  v42 = [v4 safeStringForKey:@"secureMobileAssetGraftPoint"];
  unint64_t v43 = [v42 length];

  if (v41 > v43) {
    [v4 setSafeObject:v14 forKey:@"secureMobileAssetGraftPoint"];
  }
  unint64_t v44 = [(__CFString *)v84 length];
  v45 = [v4 safeStringForKey:@"jobStatus"];
  unint64_t v46 = [v45 length];

  if (v44 > v46) {
    [v4 setSafeObject:v84 forKey:@"jobStatus"];
  }
  unint64_t v47 = [v83 length];
  v48 = [v4 safeStringForKey:@"scheduledIntervalSecs"];
  unint64_t v49 = [v48 length];

  if (v47 > v49) {
    [v4 setSafeObject:v83 forKey:@"scheduledIntervalSecs"];
  }
  unint64_t v50 = [v82 length];
  v51 = [v4 safeStringForKey:@"scheduledRemainingSecs"];
  unint64_t v52 = [v51 length];

  if (v50 > v52) {
    [v4 setSafeObject:v82 forKey:@"scheduledRemainingSecs"];
  }
  unint64_t v53 = [v81 length];
  v54 = [v4 safeStringForKey:@"pushDelaySecs"];
  unint64_t v55 = [v54 length];

  if (v53 > v55) {
    [v4 setSafeObject:v81 forKey:@"pushDelaySecs"];
  }
  unint64_t v56 = [v80 length];
  v57 = [v4 safeStringForKey:@"activeClientCount"];
  unint64_t v58 = [v57 length];

  if (v56 > v58) {
    [v4 setSafeObject:v80 forKey:@"activeClientCount"];
  }
  unint64_t v59 = [v79 length];
  v60 = [v4 safeStringForKey:@"activeMonitorCount"];
  unint64_t v61 = [v60 length];

  if (v59 > v61) {
    [v4 setSafeObject:v79 forKey:@"activeMonitorCount"];
  }
  unint64_t v62 = [v78 length];
  v63 = [v4 safeStringForKey:@"maximumClientCount"];
  unint64_t v64 = [v63 length];

  if (v62 > v64) {
    [v4 setSafeObject:v78 forKey:@"maximumClientCount"];
  }
  unint64_t v65 = [v77 length];
  v66 = [v4 safeStringForKey:@"totalClientCount"];
  unint64_t v67 = [v66 length];

  if (v65 > v67) {
    [v4 setSafeObject:v77 forKey:@"totalClientCount"];
  }
  unint64_t v68 = [(__CFString *)v15 length];
  v69 = [v4 safeStringForKey:@"stageGroup"];
  unint64_t v70 = [v69 length];

  if (v68 < v70) {
    [v4 setSafeObject:v15 forKey:@"stageGroup"];
  }
  unint64_t v71 = [(__CFString *)v16 length];
  v72 = [v4 safeStringForKey:@"targetOSKey"];
  unint64_t v73 = [v72 length];

  if (v71 < v73) {
    [v4 setSafeObject:v16 forKey:@"targetOSKey"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MAAutoAssetSummary *)self assetSelector];
  uint64_t v6 = [v5 summary];

  v60 = [(MAAutoAssetSummary *)self assetRepresentationName];
  if ([(MAAutoAssetSummary *)self assetWasPatched]) {
    int64_t v7 = @"Y";
  }
  else {
    int64_t v7 = @"N";
  }
  unint64_t v61 = v7;
  if ([(MAAutoAssetSummary *)self assetIsStaged]) {
    int64_t v8 = @"Y";
  }
  else {
    int64_t v8 = @"N";
  }
  v69 = v8;
  int64_t v9 = [(MAAutoAssetSummary *)self jobStatus];
  if (v9)
  {
    int64_t v10 = [(MAAutoAssetSummary *)self jobStatus];
    unint64_t v70 = [v10 summary];
  }
  else
  {
    unint64_t v70 = @"NONE";
  }

  v63 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  unint64_t v68 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  unint64_t v67 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v66 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  unint64_t v65 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  unint64_t v64 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  unint64_t v62 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v76 = @"NO";
  v77[0] = @"NO";
  v74 = @"NO";
  v75 = @"NO";
  v72 = @"N/A";
  unint64_t v73 = @"N/A";
  unint64_t v71 = @"N/A";
  [(MAAutoAssetSummary *)self getStringsForSummaryProps:v77 isPersonalized:&v76 isPrePersonalized:&v75 isGrafted:&v74 graftPoint:&v73 stageGroup:&v72 targetOS:&v71];
  unint64_t v46 = (__CFString *)v77[0];
  unint64_t v44 = v76;
  v42 = v75;
  unint64_t v40 = v74;
  unint64_t v38 = v73;
  unint64_t v59 = v72;
  unint64_t v34 = v71;
  id v36 = (id)NSString;
  v48 = [v4 safeStringForKey:@"assetSelector"];
  unint64_t v32 = (void *)v6;
  unint64_t v58 = +[MAAutoAssetSummary summaryPaddedString:v6 paddingToLenghtOfString:v48 paddingWith:@" " paddingBefore:0];
  unint64_t v47 = [v4 safeStringForKey:@"assetRepresentation"];
  v57 = +[MAAutoAssetSummary summaryPaddedString:v60 paddingToLenghtOfString:v47 paddingWith:@" " paddingBefore:0];
  v45 = [v4 safeStringForKey:@"assetWasPatched"];
  unint64_t v56 = +[MAAutoAssetSummary summaryPaddedString:v61 paddingToLenghtOfString:v45 paddingWith:@" " paddingBefore:0];
  unint64_t v43 = [v4 safeStringForKey:@"assetIsStaged"];
  unint64_t v55 = +[MAAutoAssetSummary summaryPaddedString:v69 paddingToLenghtOfString:v43 paddingWith:@" " paddingBefore:0];
  unint64_t v41 = [v4 safeStringForKey:@"assetIsSecureMobileAsset"];
  v54 = +[MAAutoAssetSummary summaryPaddedString:v46 paddingToLenghtOfString:v41 paddingWith:@" " paddingBefore:0];
  uint64_t v39 = [v4 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  unint64_t v53 = +[MAAutoAssetSummary summaryPaddedString:v44 paddingToLenghtOfString:v39 paddingWith:@" " paddingBefore:0];
  unint64_t v35 = [v4 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  unint64_t v52 = +[MAAutoAssetSummary summaryPaddedString:v42 paddingToLenghtOfString:v35 paddingWith:@" " paddingBefore:0];
  int64_t v33 = [v4 safeStringForKey:@"secureMobileAssetIsGrafted"];
  unint64_t v50 = +[MAAutoAssetSummary summaryPaddedString:v40 paddingToLenghtOfString:v33 paddingWith:@" " paddingBefore:0];
  unint64_t v31 = [v4 safeStringForKey:@"secureMobileAssetGraftPoint"];
  v51 = +[MAAutoAssetSummary summaryPaddedString:v38 paddingToLenghtOfString:v31 paddingWith:@" " paddingBefore:0];
  int64_t v30 = [v4 safeStringForKey:@"jobStatus"];
  unint64_t v26 = +[MAAutoAssetSummary summaryPaddedString:v70 paddingToLenghtOfString:v30 paddingWith:@" " paddingBefore:0];
  unint64_t v29 = [v4 safeStringForKey:@"scheduledIntervalSecs"];
  v24 = +[MAAutoAssetSummary summaryPaddedString:v63 paddingToLenghtOfString:v29 paddingWith:@" " paddingBefore:1];
  unint64_t v28 = [v4 safeStringForKey:@"scheduledRemainingSecs"];
  unint64_t v49 = +[MAAutoAssetSummary summaryPaddedString:v68 paddingToLenghtOfString:v28 paddingWith:@" " paddingBefore:1];
  int64_t v27 = [v4 safeStringForKey:@"pushDelaySecs"];
  unint64_t v19 = +[MAAutoAssetSummary summaryPaddedString:v67 paddingToLenghtOfString:v27 paddingWith:@" " paddingBefore:1];
  unint64_t v25 = [v4 safeStringForKey:@"activeClientCount"];
  id v21 = +[MAAutoAssetSummary summaryPaddedString:v66 paddingToLenghtOfString:v25 paddingWith:@" " paddingBefore:1];
  unint64_t v23 = [v4 safeStringForKey:@"activeMonitorCount"];
  int64_t v11 = +[MAAutoAssetSummary summaryPaddedString:v65 paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:1];
  unint64_t v22 = [v4 safeStringForKey:@"maximumClientCount"];
  uint64_t v12 = +[MAAutoAssetSummary summaryPaddedString:v64 paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:1];
  unint64_t v20 = [v4 safeStringForKey:@"totalClientCount"];
  v13 = +[MAAutoAssetSummary summaryPaddedString:v62 paddingToLenghtOfString:v20 paddingWith:@" " paddingBefore:1];
  uint64_t v14 = [v4 safeStringForKey:@"stageGroup"];
  id v15 = +[MAAutoAssetSummary summaryPaddedString:v59 paddingToLenghtOfString:v14 paddingWith:@" " paddingBefore:1];
  v16 = [v4 safeStringForKey:@"targetOSKey"];

  unint64_t v17 = +[MAAutoAssetSummary summaryPaddedString:v34 paddingToLenghtOfString:v16 paddingWith:@" " paddingBefore:1];

  objc_msgSend(v36, "stringWithFormat:", @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v58, v57, v56, v55, v54, v53, v52, v50, v51, v26, v24, v49, v19, v21, v11, v12,
    v13,
    v15,
    v17);
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)assetRepresentationName
{
  int64_t v2 = [(MAAutoAssetSummary *)self assetRepresentation];
  return +[MAAutoAssetSummary assetRepresentationName:v2];
}

+ (id)assetRepresentationName:(int64_t)a3
{
  id v3 = @"UNKNOWN";
  if (a3 > 400)
  {
    switch(a3)
    {
      case 600:
        id result = @"CandidateForStaging";
        break;
      case 601:
        id result = @"AvailableForStaging";
        break;
      case 602:
        id result = @"BeingStaged";
        break;
      case 603:
        id result = @"Staged";
        break;
      default:
        if (a3 == 500) {
          id v3 = @"VersionDownloaded";
        }
        if (a3 == 401) {
          id result = @"ScheduledPushed";
        }
        else {
          id result = v3;
        }
        break;
    }
  }
  else
  {
    id v4 = @"AwaitingUnlock";
    int64_t v5 = @"Active";
    uint64_t v6 = @"Scheduled";
    if (a3 != 400) {
      uint64_t v6 = @"UNKNOWN";
    }
    if (a3 != 300) {
      int64_t v5 = v6;
    }
    if (a3 != 201) {
      id v4 = v5;
    }
    if (a3 == 200) {
      id v3 = @"AwaitingSync";
    }
    if (a3 == 100) {
      id v3 = @"Monitor";
    }
    if (!a3) {
      id v3 = @"None";
    }
    if (a3 <= 200) {
      return v3;
    }
    else {
      return v4;
    }
  }
  return result;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setSafeObject:@"assetSelector" forKey:@"assetSelector"];
  [v2 setSafeObject:@"assetRepresentation" forKey:@"assetRepresentation"];
  [v2 setSafeObject:@"assetWasPatched" forKey:@"assetWasPatched"];
  [v2 setSafeObject:@"assetIsStaged" forKey:@"assetIsStaged"];
  [v2 setSafeObject:@"assetIsSecureMobileAsset" forKey:@"assetIsSecureMobileAsset"];
  [v2 setSafeObject:@"secureMobileAssetIsPersonalized" forKey:@"secureMobileAssetIsPersonalized"];
  [v2 setSafeObject:@"secureMobileAssetIsPrePersonalized" forKey:@"secureMobileAssetIsPrePersonalized"];
  [v2 setSafeObject:@"secureMobileAssetIsGrafted" forKey:@"secureMobileAssetIsGrafted"];
  [v2 setSafeObject:@"secureMobileAssetGraftPoint" forKey:@"secureMobileAssetGraftPoint"];
  [v2 setSafeObject:@"jobStatus" forKey:@"jobStatus"];
  [v2 setSafeObject:@"scheduledIntervalSecs" forKey:@"scheduledIntervalSecs"];
  [v2 setSafeObject:@"scheduledRemainingSecs" forKey:@"scheduledRemainingSecs"];
  [v2 setSafeObject:@"activeClientCount" forKey:@"activeClientCount"];
  [v2 setSafeObject:@"activeMonitorCount" forKey:@"activeMonitorCount"];
  [v2 setSafeObject:@"maximumClientCount" forKey:@"maximumClientCount"];
  [v2 setSafeObject:@"totalClientCount" forKey:@"totalClientCount"];
  [v2 setSafeObject:@"stageGroup" forKey:@"stageGroup"];
  [v2 setSafeObject:@"targetOSKey" forKey:@"targetOSKey"];
  return v2;
}

+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  unint64_t v13 = [v12 length];
  uint64_t v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    unint64_t v17 = [NSString string];
    id v18 = [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];

    id v19 = [NSString alloc];
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    uint64_t v14 = (void *)v20;
  }
  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  unint64_t v26 = NSString;
  id v3 = a3;
  int64_t v33 = [v3 safeStringForKey:@"assetSelector"];
  v42 = +[MAAutoAssetSummary summaryPaddedString:@"assetSelector" paddingToLenghtOfString:v33 paddingWith:@" " paddingBefore:0];
  unint64_t v32 = [v3 safeStringForKey:@"assetRepresentation"];
  unint64_t v41 = +[MAAutoAssetSummary summaryPaddedString:@"assetRepresentation" paddingToLenghtOfString:v32 paddingWith:@" " paddingBefore:0];
  unint64_t v31 = [v3 safeStringForKey:@"assetWasPatched"];
  unint64_t v40 = +[MAAutoAssetSummary summaryPaddedString:@"assetWasPatched" paddingToLenghtOfString:v31 paddingWith:@" " paddingBefore:0];
  int64_t v30 = [v3 safeStringForKey:@"assetIsStaged"];
  uint64_t v39 = +[MAAutoAssetSummary summaryPaddedString:@"assetIsStaged" paddingToLenghtOfString:v30 paddingWith:@" " paddingBefore:0];
  unint64_t v29 = [v3 safeStringForKey:@"assetIsSecureMobileAsset"];
  unint64_t v38 = +[MAAutoAssetSummary summaryPaddedString:@"assetIsSecureMobileAsset" paddingToLenghtOfString:v29 paddingWith:@" " paddingBefore:0];
  unint64_t v28 = [v3 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  id v37 = +[MAAutoAssetSummary summaryPaddedString:@"secureMobileAssetIsPersonalized" paddingToLenghtOfString:v28 paddingWith:@" " paddingBefore:0];
  unint64_t v25 = [v3 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  id v36 = +[MAAutoAssetSummary summaryPaddedString:@"secureMobileAssetIsPrePersonalized" paddingToLenghtOfString:v25 paddingWith:@" " paddingBefore:0];
  v24 = [v3 safeStringForKey:@"secureMobileAssetIsGrafted"];
  unint64_t v35 = +[MAAutoAssetSummary summaryPaddedString:@"secureMobileAssetIsGrafted" paddingToLenghtOfString:v24 paddingWith:@" " paddingBefore:0];
  unint64_t v23 = [v3 safeStringForKey:@"secureMobileAssetGraftPoint"];
  unint64_t v34 = +[MAAutoAssetSummary summaryPaddedString:@"secureMobileAssetGraftPoint" paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:0];
  unint64_t v22 = [v3 safeStringForKey:@"jobStatus"];
  id v18 = +[MAAutoAssetSummary summaryPaddedString:@"jobStatus" paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:0];
  id v21 = [v3 safeStringForKey:@"scheduledIntervalSecs"];
  uint64_t v16 = +[MAAutoAssetSummary summaryPaddedString:@"scheduledIntervalSecs" paddingToLenghtOfString:v21 paddingWith:@" " paddingBefore:0];
  uint64_t v20 = [v3 safeStringForKey:@"scheduledRemainingSecs"];
  uint64_t v14 = +[MAAutoAssetSummary summaryPaddedString:@"scheduledRemainingSecs" paddingToLenghtOfString:v20 paddingWith:@" " paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"activeClientCount"];
  unint64_t v13 = +[MAAutoAssetSummary summaryPaddedString:@"activeClientCount" paddingToLenghtOfString:v19 paddingWith:@" " paddingBefore:0];
  unint64_t v17 = [v3 safeStringForKey:@"activeMonitorCount"];
  id v11 = +[MAAutoAssetSummary summaryPaddedString:@"activeMonitorCount" paddingToLenghtOfString:v17 paddingWith:@" " paddingBefore:0];
  uint64_t v15 = [v3 safeStringForKey:@"maximumClientCount"];
  id v10 = +[MAAutoAssetSummary summaryPaddedString:@"maximumClientCount" paddingToLenghtOfString:v15 paddingWith:@" " paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"totalClientCount"];
  id v4 = +[MAAutoAssetSummary summaryPaddedString:@"totalClientCount" paddingToLenghtOfString:v12 paddingWith:@" " paddingBefore:0];
  int64_t v5 = [v3 safeStringForKey:@"stageGroup"];
  BOOL v6 = +[MAAutoAssetSummary summaryPaddedString:@"stageGroup" paddingToLenghtOfString:v5 paddingWith:@" " paddingBefore:0];
  int64_t v7 = [v3 safeStringForKey:@"targetOSKey"];

  int64_t v8 = +[MAAutoAssetSummary summaryPaddedString:@"targetOSKey" paddingToLenghtOfString:v7 paddingWith:@" " paddingBefore:0];
  objc_msgSend(v26, "stringWithFormat:", @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v42, v41, v40, v39, v38, v37, v36, v35, v34, v18, v16, v14, v13, v11, v10, v4,
    v6,
  int64_t v27 = v8);

  return v27;
}

+ (id)summaryPaddedBanner:(id)a3
{
  unint64_t v25 = NSString;
  id v3 = a3;
  unint64_t v32 = [v3 safeStringForKey:@"assetSelector"];
  v42 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v32 paddingWith:@"=" paddingBefore:0];
  unint64_t v31 = [v3 safeStringForKey:@"assetRepresentation"];
  unint64_t v41 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v31 paddingWith:@"=" paddingBefore:0];
  int64_t v30 = [v3 safeStringForKey:@"assetWasPatched"];
  unint64_t v40 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v30 paddingWith:@"=" paddingBefore:0];
  unint64_t v29 = [v3 safeStringForKey:@"assetIsStaged"];
  uint64_t v39 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v29 paddingWith:@"=" paddingBefore:0];
  unint64_t v28 = [v3 safeStringForKey:@"assetIsSecureMobileAsset"];
  unint64_t v38 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v28 paddingWith:@"=" paddingBefore:0];
  int64_t v27 = [v3 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  id v37 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v27 paddingWith:@"=" paddingBefore:0];
  v24 = [v3 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  id v36 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v24 paddingWith:@"=" paddingBefore:0];
  unint64_t v23 = [v3 safeStringForKey:@"secureMobileAssetIsGrafted"];
  unint64_t v35 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v23 paddingWith:@"=" paddingBefore:0];
  unint64_t v22 = [v3 safeStringForKey:@"secureMobileAssetGraftPoint"];
  unint64_t v34 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v22 paddingWith:@"=" paddingBefore:0];
  id v21 = [v3 safeStringForKey:@"jobStatus"];
  unint64_t v17 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v21 paddingWith:@"=" paddingBefore:0];
  uint64_t v20 = [v3 safeStringForKey:@"scheduledIntervalSecs"];
  int64_t v33 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v20 paddingWith:@"=" paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"scheduledRemainingSecs"];
  uint64_t v14 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v19 paddingWith:@"=" paddingBefore:0];
  id v18 = [v3 safeStringForKey:@"activeClientCount"];
  unint64_t v13 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v18 paddingWith:@"=" paddingBefore:0];
  uint64_t v16 = [v3 safeStringForKey:@"activeMonitorCount"];
  id v4 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v16 paddingWith:@"=" paddingBefore:0];
  uint64_t v15 = [v3 safeStringForKey:@"maximumClientCount"];
  int64_t v5 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v15 paddingWith:@"=" paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"totalClientCount"];
  BOOL v6 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v12 paddingWith:@"=" paddingBefore:0];
  int64_t v7 = [v3 safeStringForKey:@"stageGroup"];
  int64_t v8 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v7 paddingWith:@"=" paddingBefore:0];
  id v9 = [v3 safeStringForKey:@"targetOSKey"];

  id v10 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v9 paddingWith:@"=" paddingBefore:0];
  objc_msgSend(v25, "stringWithFormat:", @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v42, v41, v40, v39, v38, v37, v36, v35, v34, v17, v33, v14, v13, v4, v5, v6,
    v8,
  unint64_t v26 = v10);

  return v26;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
}

- (int64_t)assetRepresentation
{
  return self->_assetRepresentation;
}

- (void)setAssetRepresentation:(int64_t)a3
{
  self->_assetRepresentation = a3;
}

- (BOOL)assetWasPatched
{
  return self->_assetWasPatched;
}

- (void)setAssetWasPatched:(BOOL)a3
{
  self->_assetWasPatched = a3;
}

- (BOOL)assetIsStaged
{
  return self->_assetIsStaged;
}

- (void)setAssetIsStaged:(BOOL)a3
{
  self->_assetIsStaged = a3;
}

- (BOOL)assetIsSecureMobileAsset
{
  return self->_assetIsSecureMobileAsset;
}

- (void)setAssetIsSecureMobileAsset:(BOOL)a3
{
  self->_assetIsSecureMobileAsset = a3;
}

- (BOOL)secureMobileAssetIsPersonalized
{
  return self->_secureMobileAssetIsPersonalized;
}

- (void)setSecureMobileAssetIsPersonalized:(BOOL)a3
{
  self->_secureMobileAssetIsPersonalized = a3;
}

- (BOOL)secureMobileAssetIsPrePersonalized
{
  return self->_secureMobileAssetIsPrePersonalized;
}

- (void)setSecureMobileAssetIsPrePersonalized:(BOOL)a3
{
  self->_secureMobileAssetIsPrePersonalized = a3;
}

- (BOOL)secureMobileAssetIsGrafted
{
  return self->_secureMobileAssetIsGrafted;
}

- (void)setSecureMobileAssetIsGrafted:(BOOL)a3
{
  self->_secureMobileAssetIsGrafted = a3;
}

- (NSString)secureMobileAssetGraftPoint
{
  return self->_secureMobileAssetGraftPoint;
}

- (void)setSecureMobileAssetGraftPoint:(id)a3
{
}

- (MAAutoAssetStatus)jobStatus
{
  return self->_jobStatus;
}

- (void)setJobStatus:(id)a3
{
}

- (int64_t)scheduledIntervalSecs
{
  return self->_scheduledIntervalSecs;
}

- (void)setScheduledIntervalSecs:(int64_t)a3
{
  self->_scheduledIntervalSecs = a3;
}

- (int64_t)scheduledRemainingSecs
{
  return self->_scheduledRemainingSecs;
}

- (void)setScheduledRemainingSecs:(int64_t)a3
{
  self->_scheduledRemainingSecs = a3;
}

- (int64_t)pushDelaySecs
{
  return self->_pushDelaySecs;
}

- (void)setPushDelaySecs:(int64_t)a3
{
  self->_pushDelaySecs = a3;
}

- (int64_t)activeClientCount
{
  return self->_activeClientCount;
}

- (void)setActiveClientCount:(int64_t)a3
{
  self->_activeClientCount = a3;
}

- (int64_t)activeMonitorCount
{
  return self->_activeMonitorCount;
}

- (void)setActiveMonitorCount:(int64_t)a3
{
  self->_activeMonitorCount = a3;
}

- (int64_t)maximumClientCount
{
  return self->_maximumClientCount;
}

- (void)setMaximumClientCount:(int64_t)a3
{
  self->_maximumClientCount = a3;
}

- (int64_t)totalClientCount
{
  return self->_totalClientCount;
}

- (void)setTotalClientCount:(int64_t)a3
{
  self->_totalClientCount = a3;
}

- (unint64_t)stageGroup
{
  return self->_stageGroup;
}

- (void)setStageGroup:(unint64_t)a3
{
  self->_stageGroup = a3;
}

- (NSString)targetOS
{
  return self->_targetOS;
}

- (void)setTargetOS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetOS, 0);
  objc_storeStrong((id *)&self->_jobStatus, 0);
  objc_storeStrong((id *)&self->_secureMobileAssetGraftPoint, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
}

- (void)getStringsForSummaryProps:(os_log_t)log isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B275B000, log, OS_LOG_TYPE_ERROR, "Invalid arguments passed to getStringsForSummaryProps", v1, 2u);
}

@end