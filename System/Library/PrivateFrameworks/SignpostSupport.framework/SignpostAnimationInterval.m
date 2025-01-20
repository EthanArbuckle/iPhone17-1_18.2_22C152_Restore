@interface SignpostAnimationInterval
+ (id)_unionRangesForAnimations:(id)a3;
+ (id)serializationTypeNumber;
+ (id)unionOfAnimationIntervals:(id)a3;
+ (unint64_t)effectiveGlitchTimeRatioAdjustedVersion;
+ (unint64_t)forcedGlitchTimeRatioAdjustedVersion;
+ (void)effectiveGlitchTimeRatioAdjustedVersion;
+ (void)setForcedGlitchTimeRatioAdjustedVersion:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFramePossibleFirstFrameForAnimation:(id)a3;
- (BOOL)isFramePossibleFirstFrameForAnimation:(id)a3 withGraceTime:(unint64_t)a4;
- (NSArray)allClientDrawables;
- (NSArray)allCommits;
- (NSArray)allContributedFrameLatencies;
- (NSArray)allContributedFrameLifetimes;
- (NSArray)allFrameLatencies;
- (NSArray)allFrameLifetimes;
- (NSArray)allHIDLatencies;
- (NSArray)allRenderServerRenders;
- (NSArray)allSystemwideClientDrawables;
- (NSArray)allSystemwideCommits;
- (NSArray)allTransactionLifetimes;
- (NSArray)compositeIntervals;
- (NSArray)contributedFirstFrameGlitches;
- (NSArray)contributedGlitches;
- (NSArray)contributedLongFrameLatencies;
- (NSArray)contributedNonFirstFrameGlitches;
- (NSArray)firstFrameGlitches;
- (NSArray)firstFrameLifetimes;
- (NSArray)glitches;
- (NSArray)longClientDrawables;
- (NSArray)longCommits;
- (NSArray)longContributedFrameLifetimes;
- (NSArray)longFrameLatencies;
- (NSArray)longFrameLifetimes;
- (NSArray)longHIDLatencies;
- (NSArray)longRenderServerRenders;
- (NSArray)longSystemwideClientDrawables;
- (NSArray)longSystemwideCommits;
- (NSArray)longTransactionLifetimes;
- (NSArray)nonFirstFrameGlitches;
- (SignpostAnimationInterval)initWithBeginEvent:(id)a3 endEvent:(id)a4 accumulatedState:(id)a5 firstFrameGraceTimeController:(id)a6;
- (SignpostAnimationInterval)initWithDictionary:(id)a3;
- (SignpostAnimationInterval)initWithFirstAnimatonInterval:(id)a3 secondAnimationInterval:(id)a4;
- (SignpostSupportAnimationGraceTime)firstFrameGraceTime;
- (double)_timeRatioForTimeIntervalArray:(id)a3 applyPerceptionAdjustments:(unint64_t)a4;
- (double)durationToFirstBeginSeconds:(id)a3;
- (double)durationToFirstEndSeconds:(id)a3;
- (double)firstFrameGlitchTimeRatio;
- (double)firstFrameGlitchTimeRatioMsPerS;
- (double)glitchTimeRatio;
- (double)glitchTimeRatioAdjusted;
- (double)glitchTimeRatioAdjustedMsPerS;
- (double)glitchTimeRatioMsPerS;
- (double)nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS;
- (double)nonFirstFrameGlitchTimeRatio;
- (double)nonFirstFrameGlitchTimeRatioAdjusted;
- (double)nonFirstFrameGlitchTimeRatioAdjustedMsPerS;
- (double)nonFirstFrameGlitchTimeRatioMsPerS;
- (double)timeRatioMSPerSForOverrunIntervals:(id)a3 applyPerceptionAdjustments:(unint64_t)a4;
- (double)timeRatioMSPerSForOverrunIntervalsOfType:(unint64_t)a3 class:(unint64_t)a4 contributingPID:(id)a5 applyPerceptionAdjustments:(unint64_t)a6;
- (float)_durationInSecondsFromDurationInMCT:(unint64_t)a3 timebaseRatio:(double)a4;
- (float)frameRate;
- (id)_animationStatsDescription;
- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5;
- (id)_detailedFrameDescription;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4;
- (id)_frameDescription;
- (id)_intervalTypeString;
- (id)_poorPerfFrameDescription;
- (id)_statsStringForTimeIntervals:(id)a3 label:(id)a4;
- (id)debugDescription;
- (id)firstFrameLifetimesWithGraceTimeMCT:(unint64_t)a3;
- (id)humanReadableType;
- (id)overrunIntervalsOfType:(unint64_t)a3 class:(unint64_t)a4 contributingPID:(id)a5;
- (unint64_t)animationType;
- (unint64_t)durationToFirstBeginMachContinuousTime:(id)a3;
- (unint64_t)durationToFirstEndMachContinuousTime:(id)a3;
- (unint64_t)firstFrameGraceTimeMCT;
- (unint64_t)firstFrameGraceTimeMs;
- (unint64_t)frameCount;
- (void)setCompositeIntervals:(id)a3;
@end

@implementation SignpostAnimationInterval

- (SignpostAnimationInterval)initWithBeginEvent:(id)a3 endEvent:(id)a4 accumulatedState:(id)a5 firstFrameGraceTimeController:(id)a6
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [v10 _hasTotalSkyLightCompositeCount];
  if (v14 != [v11 _hasTotalSkyLightCompositeCount])
  {
    v15 = _signpost_debug_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SignpostAnimationInterval initWithBeginEvent:endEvent:accumulatedState:firstFrameGraceTimeController:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v23 = 0;
    goto LABEL_32;
  }
  v112.receiver = self;
  v112.super_class = (Class)SignpostAnimationInterval;
  v24 = [(SignpostInterval *)&v112 initWithBeginEvent:v10 endEvent:v11];
  if (!v24) {
    goto LABEL_31;
  }
  if (v14) {
    goto LABEL_25;
  }
  id v105 = v13;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v25 = [v12 compositorIntervals];
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (!v26) {
    goto LABEL_24;
  }
  uint64_t v27 = v26;
  v106 = v10;
  obj = v25;
  id v104 = v12;
  v28 = v11;
  char v29 = 0;
  v30 = 0;
  uint64_t v31 = *(void *)v109;
  do
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      if (*(void *)v109 != v31) {
        objc_enumerationMutation(obj);
      }
      v33 = *(void **)(*((void *)&v108 + 1) + 8 * i);
      unint64_t v34 = objc_msgSend(v33, "startMachContinuousTime", v104);
      unint64_t v35 = [v33 endMachContinuousTime];
      if (v29)
      {
        if (v35 >= [v28 startMachContinuousTime]) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (v34 >= [v106 startMachContinuousTime] && v35 < objc_msgSend(v28, "startMachContinuousTime"))
      {
        uint64_t v36 = [MEMORY[0x1E4F1CA48] array];

        v30 = (NSArray *)v36;
LABEL_18:
        [(NSArray *)v30 addObject:v33];
        char v29 = 1;
        continue;
      }
      char v29 = 0;
    }
    uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v108 objects:v113 count:16];
  }
  while (v27);
LABEL_22:

  id v13 = v105;
  id v10 = v106;
  id v11 = v28;
  id v12 = v104;
  if (v30)
  {
    compositeIntervals = v24->_compositeIntervals;
    v24->_compositeIntervals = v30;
    v25 = v30;

LABEL_24:
  }
LABEL_25:
  v38 = [v12 longCommitIntervals];
  uint64_t v39 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v38];
  longCommits = v24->_longCommits;
  v24->_longCommits = (NSArray *)v39;

  v41 = [v12 allCommitIntervals];
  uint64_t v42 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v41];
  allCommits = v24->_allCommits;
  v24->_allCommits = (NSArray *)v42;

  v44 = [v12 longSystemwideCommitIntervals];
  uint64_t v45 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v44];
  longSystemwideCommits = v24->_longSystemwideCommits;
  v24->_longSystemwideCommits = (NSArray *)v45;

  v47 = [v12 allSystemwideCommitIntervals];
  uint64_t v48 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v47];
  allSystemwideCommits = v24->_allSystemwideCommits;
  v24->_allSystemwideCommits = (NSArray *)v48;

  v50 = [v12 longClientDrawableIntervals];
  uint64_t v51 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v50];
  longClientDrawables = v24->_longClientDrawables;
  v24->_longClientDrawables = (NSArray *)v51;

  v53 = [v12 allClientDrawableIntervals];
  uint64_t v54 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v53];
  allClientDrawables = v24->_allClientDrawables;
  v24->_allClientDrawables = (NSArray *)v54;

  v56 = [v12 longSystemwideClientDrawableIntervals];
  uint64_t v57 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v56];
  longSystemwideClientDrawables = v24->_longSystemwideClientDrawables;
  v24->_longSystemwideClientDrawables = (NSArray *)v57;

  v59 = [v12 allSystemwideClientDrawableIntervals];
  uint64_t v60 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v59];
  allSystemwideClientDrawables = v24->_allSystemwideClientDrawables;
  v24->_allSystemwideClientDrawables = (NSArray *)v60;

  v62 = [v12 longTransactionLifetimes];
  uint64_t v63 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v62];
  longTransactionLifetimes = v24->_longTransactionLifetimes;
  v24->_longTransactionLifetimes = (NSArray *)v63;

  v65 = [v12 allTransactionLifetimes];
  uint64_t v66 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v65];
  allTransactionLifetimes = v24->_allTransactionLifetimes;
  v24->_allTransactionLifetimes = (NSArray *)v66;

  v68 = [v12 longFrameLatencies];
  uint64_t v69 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v68];
  longFrameLatencies = v24->_longFrameLatencies;
  v24->_longFrameLatencies = (NSArray *)v69;

  v71 = [v12 allFrameLatencies];
  uint64_t v72 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v71];
  allFrameLatencies = v24->_allFrameLatencies;
  v24->_allFrameLatencies = (NSArray *)v72;

  v74 = [v12 longHIDLatencies];
  uint64_t v75 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v74];
  longHIDLatencies = v24->_longHIDLatencies;
  v24->_longHIDLatencies = (NSArray *)v75;

  v77 = [v12 allHIDLatencies];
  uint64_t v78 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v77];
  allHIDLatencies = v24->_allHIDLatencies;
  v24->_allHIDLatencies = (NSArray *)v78;

  v80 = [v12 longRenders];
  uint64_t v81 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v80];
  longRenderServerRenders = v24->_longRenderServerRenders;
  v24->_longRenderServerRenders = (NSArray *)v81;

  v83 = [v12 allRenders];
  uint64_t v84 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v83];
  allRenderServerRenders = v24->_allRenderServerRenders;
  v24->_allRenderServerRenders = (NSArray *)v84;

  firstFrameGraceTime = v24->_firstFrameGraceTime;
  v24->_firstFrameGraceTime = 0;

  v87 = [v10 _numberArgumentWithName:@"first_frame_grace_time_ms"];
  v88 = v87;
  if (v87)
  {
    v89 = -[SignpostSupportAnimationGraceTime initWithAnimationType:firstFrameGraceTimeMs:]([SignpostSupportAnimationGraceTime alloc], "initWithAnimationType:firstFrameGraceTimeMs:", 3, [v87 unsignedIntValue]);
    goto LABEL_27;
  }
  uint64_t v103 = [v10 animationType];
  if (v103 == 1)
  {
    v89 = [v13 userInteractiveGraceTime];
LABEL_27:
    v90 = v24->_firstFrameGraceTime;
    v24->_firstFrameGraceTime = v89;
  }
  else if (v103 == 2)
  {
    v89 = [v13 userInitiatedGraceTime];
    goto LABEL_27;
  }
  if (!v24->_firstFrameGraceTime)
  {
    v91 = [(SignpostSupportObject *)v24 subsystem];
    v92 = [(SignpostSupportObject *)v24 category];
    v93 = [(SignpostObject *)v24 name];
    uint64_t v94 = [v13 gracetimeForSubsystem:v91 category:v92 name:v93];
    v95 = v24->_firstFrameGraceTime;
    v24->_firstFrameGraceTime = (SignpostSupportAnimationGraceTime *)v94;
  }
  v96 = [v12 longFrameLifetimes];
  uint64_t v97 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v96];
  longFrameLifetimes = v24->_longFrameLifetimes;
  v24->_longFrameLifetimes = (NSArray *)v97;

  v99 = [v12 allFrameLifetimes];
  uint64_t v100 = [(SignpostSupportObject *)v24 _containedObjectsFromArray:v99];
  allFrameLifetimes = v24->_allFrameLifetimes;
  v24->_allFrameLifetimes = (NSArray *)v100;

LABEL_31:
  self = v24;
  v23 = self;
LABEL_32:

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFrameGraceTime, 0);
  objc_storeStrong((id *)&self->_longRenderServerRenders, 0);
  objc_storeStrong((id *)&self->_allRenderServerRenders, 0);
  objc_storeStrong((id *)&self->_longHIDLatencies, 0);
  objc_storeStrong((id *)&self->_allHIDLatencies, 0);
  objc_storeStrong((id *)&self->_longFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_allFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_longFrameLatencies, 0);
  objc_storeStrong((id *)&self->_allFrameLatencies, 0);
  objc_storeStrong((id *)&self->_longTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_allTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_compositeIntervals, 0);
  objc_storeStrong((id *)&self->_longSystemwideClientDrawables, 0);
  objc_storeStrong((id *)&self->_allSystemwideClientDrawables, 0);
  objc_storeStrong((id *)&self->_longClientDrawables, 0);
  objc_storeStrong((id *)&self->_allClientDrawables, 0);
  objc_storeStrong((id *)&self->_longSystemwideCommits, 0);
  objc_storeStrong((id *)&self->_allSystemwideCommits, 0);
  objc_storeStrong((id *)&self->_longCommits, 0);

  objc_storeStrong((id *)&self->_allCommits, 0);
}

+ (unint64_t)forcedGlitchTimeRatioAdjustedVersion
{
  return _forcedGlitchTimeRatioAdjustedVersion;
}

+ (void)setForcedGlitchTimeRatioAdjustedVersion:(unint64_t)a3
{
  _forcedGlitchTimeRatioAdjustedVersion = a3;
}

+ (unint64_t)effectiveGlitchTimeRatioAdjustedVersion
{
  unint64_t v2 = [a1 forcedGlitchTimeRatioAdjustedVersion];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (effectiveGlitchTimeRatioAdjustedVersion_onceToken != -1) {
      dispatch_once(&effectiveGlitchTimeRatioAdjustedVersion_onceToken, &__block_literal_global_2);
    }
    unint64_t v2 = effectiveGlitchTimeRatioAdjustedVersion_userDefaultsVersion;
  }
  if (v2 >= 4)
  {
    if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = _signpost_debug_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        +[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion];
      }
    }
    return 3;
  }
  return v2;
}

void __68__SignpostAnimationInterval_effectiveGlitchTimeRatioAdjustedVersion__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v1 = [v0 objectForKey:@"SignpostSupportOverrideDefaultGlitchTimeRatioAdjustedVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    effectiveGlitchTimeRatioAdjustedVersion_userDefaultsVersion = [v1 unsignedIntegerValue];
  }
}

- (id)_intervalTypeString
{
  return @"Animation";
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  v19.receiver = self;
  v19.super_class = (Class)SignpostAnimationInterval;
  v8 = [(SignpostInterval *)&v19 _descriptionStringForColumn:a3 timeFormat:a4 asBegin:a5];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
LABEL_3:
    id v11 = v10;
    goto LABEL_4;
  }
  switch(a3)
  {
    case 4uLL:
      if (a4 != 2)
      {
        if (a4 == 1)
        {
          uint64_t v18 = NSString;
          uint64_t v16 = [(SignpostAnimationInterval *)self glitches];
          objc_msgSend(v18, "stringWithFormat:", @"%llu", SignpostSupportTotalDurationMachContinuousTimeForIntervals(v16));
          break;
        }
        if (a4)
        {
LABEL_15:
          id v11 = 0;
          goto LABEL_4;
        }
      }
      v15 = NSString;
      uint64_t v16 = [(SignpostAnimationInterval *)self glitches];
      objc_msgSend(v15, "stringWithFormat:", @"%.3fs", (double)SignpostSupportTotalDurationNsForIntervals(v16) / 1000000000.0);
      break;
    case 3uLL:
      uint64_t v17 = NSString;
      uint64_t v16 = [(SignpostAnimationInterval *)self glitches];
      objc_msgSend(v17, "stringWithFormat:", @"%lu", objc_msgSend(v16, "count"));
      break;
    case 2uLL:
      id v13 = NSString;
      [(SignpostAnimationInterval *)self frameRate];
      objc_msgSend(v13, "stringWithFormat:", @"%.1fFPS", v14);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    default:
      goto LABEL_15;
  id v11 = };

LABEL_4:

  return v11;
}

- (id)_detailedFrameDescription
{
  v3 = [(SignpostAnimationInterval *)self allFrameLatencies];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = NSString;
    v6 = [(SignpostAnimationInterval *)self allFrameLatencies];
    [(SignpostAnimationInterval *)self durationToFirstEndSeconds:v6];
    objc_msgSend(v5, "stringWithFormat:", @"%.4fs\n", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = @"N/A";
  }
  v9 = [(SignpostAnimationInterval *)self allContributedFrameLatencies];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = NSString;
    id v12 = [(SignpostAnimationInterval *)self allContributedFrameLatencies];
    [(SignpostAnimationInterval *)self durationToFirstEndSeconds:v12];
    objc_msgSend(v11, "stringWithFormat:", @"%.4fs\n", v13);
    float v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v15 = NSString;
    uint64_t v16 = [(SignpostAnimationInterval *)self allFrameLatencies];
    uint64_t v17 = [v16 count];
    uint64_t v18 = [(SignpostAnimationInterval *)self allContributedFrameLatencies];
    objc_super v19 = [v15 stringWithFormat:@"Coincident frames: %lu frames\nTime to first coincident frame: %@\nKnown contributed frames: %lu frames\nTime to first known contributed frame: %@\n", v17, v8, objc_msgSend(v18, "count"), v14];

    goto LABEL_8;
  }
  float v14 = @"N/A";
  if (v4) {
    goto LABEL_7;
  }
  objc_super v19 = 0;
LABEL_8:

  return v19;
}

- (id)_poorPerfFrameDescription
{
  uint64_t v54 = NSString;
  v62 = [(SignpostAnimationInterval *)self longCommits];
  uint64_t v53 = [v62 count];
  v61 = [(SignpostAnimationInterval *)self allCommits];
  uint64_t v51 = [v61 count];
  uint64_t v60 = [(SignpostAnimationInterval *)self longSystemwideCommits];
  uint64_t v49 = [v60 count];
  v59 = [(SignpostAnimationInterval *)self allSystemwideCommits];
  uint64_t v47 = [v59 count];
  v58 = [(SignpostAnimationInterval *)self longClientDrawables];
  uint64_t v45 = [v58 count];
  uint64_t v57 = [(SignpostAnimationInterval *)self allClientDrawables];
  uint64_t v44 = [v57 count];
  v56 = [(SignpostAnimationInterval *)self longSystemwideClientDrawables];
  uint64_t v42 = [v56 count];
  v55 = [(SignpostAnimationInterval *)self allSystemwideClientDrawables];
  uint64_t v40 = [v55 count];
  v52 = [(SignpostAnimationInterval *)self longTransactionLifetimes];
  uint64_t v38 = [v52 count];
  v50 = [(SignpostAnimationInterval *)self allTransactionLifetimes];
  uint64_t v36 = [v50 count];
  uint64_t v48 = [(SignpostAnimationInterval *)self longFrameLatencies];
  uint64_t v35 = [v48 count];
  v46 = [(SignpostAnimationInterval *)self allFrameLatencies];
  uint64_t v33 = [v46 count];
  v43 = [(SignpostAnimationInterval *)self longHIDLatencies];
  uint64_t v31 = [v43 count];
  v41 = [(SignpostAnimationInterval *)self allHIDLatencies];
  uint64_t v29 = [v41 count];
  uint64_t v39 = [(SignpostAnimationInterval *)self longRenderServerRenders];
  uint64_t v28 = [v39 count];
  v37 = [(SignpostAnimationInterval *)self allRenderServerRenders];
  uint64_t v26 = [v37 count];
  unint64_t v34 = [(SignpostAnimationInterval *)self longFrameLifetimes];
  uint64_t v24 = [v34 count];
  v32 = [(SignpostAnimationInterval *)self allFrameLifetimes];
  uint64_t v22 = [v32 count];
  v30 = [(SignpostAnimationInterval *)self longContributedFrameLifetimes];
  uint64_t v21 = [v30 count];
  uint64_t v27 = [(SignpostAnimationInterval *)self allContributedFrameLifetimes];
  uint64_t v20 = [v27 count];
  v25 = [(SignpostAnimationInterval *)self glitches];
  uint64_t v19 = [v25 count];
  v23 = [(SignpostAnimationInterval *)self firstFrameGlitches];
  uint64_t v3 = [v23 count];
  uint64_t v4 = [(SignpostAnimationInterval *)self nonFirstFrameGlitches];
  uint64_t v5 = [v4 count];
  v6 = [(SignpostAnimationInterval *)self contributedGlitches];
  uint64_t v7 = [v6 count];
  v8 = [(SignpostAnimationInterval *)self contributedFirstFrameGlitches];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [(SignpostAnimationInterval *)self contributedNonFirstFrameGlitches];
  uint64_t v11 = [v10 count];
  [(SignpostAnimationInterval *)self glitchTimeRatioMsPerS];
  uint64_t v13 = v12;
  [(SignpostAnimationInterval *)self firstFrameGlitchTimeRatioMsPerS];
  uint64_t v15 = v14;
  [(SignpostAnimationInterval *)self nonFirstFrameGlitchTimeRatioMsPerS];
  objc_msgSend(v54, "stringWithFormat:", @"Long commits: %lu long commit(s) out of %lu\nSystemwide Long commits: %lu systemwide long commit(s) out of %lu\nLong client drawables: %lu long client drawable(s) out of %lu\nSystemwide Long client drawables: %lu systemwide long client drawables(s) out of %lu\nLong Transaction Lifetimes: %lu long transaction lifetime(s) out of %lu\nLong Frame Latency Count: %lu late frame(s) a total of %lu\nLong HID Latency Count: %lu long HID interval(s) out of %lu\nLong CA Render Server Render Count: %lu render(s) out of %lu\nLong Frame Lifetime Count: %lu frame lifetime(s) out of %lu\nLong Contributed Frame Lifetime Count: %lu frame(s) out of %lu\nGlitch Count: %lu glitches (%lu first frame, %lu non-first frame)\nContributed Glitch Count: %lu glitches (%lu first frame, %lu non-first frame)\nGlitch Time Ratio: %.2f ms/s (%.2f ms/s first frame, %.2f ms/s non-first frame)\n", v53, v51, v49, v47, v45, v44, v42, v40, v38, v36, v35, v33, v31, v29, v28, v26,
    v24,
    v22,
    v21,
    v20,
    v19,
    v3,
    v5,
    v7,
    v9,
    v11,
    v13,
    v15,
  uint64_t v17 = v16);

  return v17;
}

- (double)_timeRatioForTimeIntervalArray:(id)a3 applyPerceptionAdjustments:(unint64_t)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if (v6)
  {
    if (a4)
    {
      [(SignpostSupportObject *)self timebaseRatio];
      unint64_t v9 = (unint64_t)(1500000000.0 / v8);
      unint64_t v10 = [(SignpostInterval *)self durationMachContinuousTime];
      if (v10 > v9) {
        unint64_t v9 = v10;
      }
      if (v9)
      {
        [(SignpostSupportObject *)self timebaseRatio];
        double v12 = v11;
        -[SignpostAnimationInterval _durationInSecondsFromDurationInMCT:timebaseRatio:](self, "_durationInSecondsFromDurationInMCT:timebaseRatio:", v9);
        if (v13 < 1.0) {
          unint64_t v9 = (unint64_t)(1000000000.0 / v12);
        }
        if (a4 >= 2)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __87__SignpostAnimationInterval__timeRatioForTimeIntervalArray_applyPerceptionAdjustments___block_invoke;
          v16[3] = &unk_1E5B3FFE8;
          v16[4] = self;
          uint64_t v14 = SignpostSupportTotalDurationMachContinuousTimeForIntervalsWithAdjustments(v6, v16);
LABEL_12:
          double v7 = (double)(unint64_t)v14 / (double)v9;
          goto LABEL_13;
        }
LABEL_11:
        uint64_t v14 = SignpostSupportTotalDurationMachContinuousTimeForIntervals(v6);
        goto LABEL_12;
      }
    }
    else
    {
      unint64_t v9 = [(SignpostInterval *)self durationMachContinuousTime];
      if (v9) {
        goto LABEL_11;
      }
    }
  }
LABEL_13:

  return v7;
}

unint64_t __87__SignpostAnimationInterval__timeRatioForTimeIntervalArray_applyPerceptionAdjustments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  [v3 startSeconds];
  double v6 = v5;
  [v3 endSeconds];
  double v8 = (v6 + v7) * 0.5;
  [v4 startSeconds];
  double v10 = fmax(v8 - v9, 0.0);
  [v4 endSeconds];
  double v12 = v11;

  double v13 = fmax(v12 - v8, 0.0);
  if (v10 < v13) {
    double v13 = v10;
  }
  if (v13 >= 0.175) {
    double v14 = 1.0;
  }
  else {
    double v14 = v13 / 0.175;
  }
  unint64_t v15 = (unint64_t)(v14 * (double)(unint64_t)[v3 durationMachContinuousTime]);

  return v15;
}

+ (id)_unionRangesForAnimations:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v3;
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    v23 = v4;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v4 count])
        {
          uint64_t v26 = i;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          double v7 = v4;
          uint64_t v8 = [(SignpostAnimationsUnionInterval *)v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v28;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v28 != v10) {
                  objc_enumerationMutation(v7);
                }
                double v12 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                NSUInteger v13 = [v12 animationTimeRange];
                NSUInteger v15 = v14;
                NSUInteger v16 = [v6 startMachContinuousTime];
                NSUInteger v17 = [v6 durationMachContinuousTime];
                v39.location = v13;
                v39.length = v15;
                v41.location = v16;
                v41.length = v17;
                if (NSIntersectionRange(v39, v41).length)
                {
                  v40.location = v13;
                  v40.length = v15;
                  v42.location = v16;
                  v42.length = v17;
                  NSRange v19 = NSUnionRange(v40, v42);
                  objc_msgSend(v12, "setAnimationTimeRange:", v19.location, v19.length);
                  uint64_t v20 = [v12 animationIntervals];
                  [v20 addObject:v6];

                  goto LABEL_17;
                }
              }
              uint64_t v9 = [(SignpostAnimationsUnionInterval *)v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }

          uint64_t v18 = [[SignpostAnimationsUnionInterval alloc] initWithAnimation:v6];
          [(SignpostAnimationsUnionInterval *)v7 addObject:v18];
          double v7 = v18;
LABEL_17:
          id v4 = v23;
          uint64_t i = v26;
        }
        else
        {
          double v7 = [[SignpostAnimationsUnionInterval alloc] initWithAnimation:v6];
          [v4 addObject:v7];
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  return v4;
}

- (float)_durationInSecondsFromDurationInMCT:(unint64_t)a3 timebaseRatio:(double)a4
{
  return (float)(unint64_t)((double)a3 * a4) / 1000000000.0;
}

+ (id)unionOfAnimationIntervals:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    double v5 = [v3 sortedArrayUsingComparator:&__block_literal_global_595];

    double v6 = (void *)[v5 mutableCopy];
    if ([v6 count] != 1)
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [v6 objectAtIndex:v8];
        unint64_t v10 = v8 + 1;
        double v11 = [v6 objectAtIndex:v8 + 1];
        unint64_t v12 = [v11 startMachContinuousTime];
        if (v12 <= [v9 endMachContinuousTime])
        {
          unint64_t v13 = [v11 endMachContinuousTime];
          if (v13 <= [v9 endMachContinuousTime])
          {
            [v6 removeObjectAtIndex:v8 + 1];
          }
          else
          {
            NSUInteger v14 = [[SignpostAnimationInterval alloc] initWithFirstAnimatonInterval:v9 secondAnimationInterval:v11];
            if (v14)
            {
              [v6 replaceObjectAtIndex:v8 withObject:v14];
            }
            else
            {
              NSUInteger v15 = _signpost_debug_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
                +[SignpostAnimationInterval unionOfAnimationIntervals:v15];
              }

              unint64_t v10 = v8;
            }
            [v6 removeObjectAtIndex:v10];
          }
        }
        else
        {
          ++v8;
        }
      }
      while (v8 < [v6 count] - 1);
    }
    id v4 = (void *)[v6 copy];

    id v3 = v5;
  }
  else
  {
    id v4 = (void *)[v3 copy];
  }

  return v4;
}

uint64_t __55__SignpostAnimationInterval_unionOfAnimationIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 startMachContinuousTime];
  if (v6 >= [v5 startMachContinuousTime])
  {
    uint64_t v8 = [v4 startMachContinuousTime];
    uint64_t v7 = v8 != [v5 startMachContinuousTime];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (NSArray)firstFrameLifetimes
{
  unint64_t v3 = [(SignpostAnimationInterval *)self firstFrameGraceTimeMCT];

  return (NSArray *)[(SignpostAnimationInterval *)self firstFrameLifetimesWithGraceTimeMCT:v3];
}

- (id)firstFrameLifetimesWithGraceTimeMCT:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  NSUInteger v6 = [(SignpostInterval *)self startMachContinuousTime];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(SignpostAnimationInterval *)self allFrameLifetimes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v12 mayBeFirstFrame] & 1) == 0)
        {
          NSUInteger v13 = [v12 startMachContinuousTime];
          v23.length = [v12 durationMachContinuousTime];
          v22.location = v6;
          v22.length = a3;
          v23.location = v13;
          if (!NSIntersectionRange(v22, v23).length) {
            continue;
          }
        }
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v5;
}

- (BOOL)isFramePossibleFirstFrameForAnimation:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(SignpostAnimationInterval *)self isFramePossibleFirstFrameForAnimation:v4 withGraceTime:[(SignpostAnimationInterval *)self firstFrameGraceTimeMCT]];

  return (char)self;
}

- (BOOL)isFramePossibleFirstFrameForAnimation:(id)a3 withGraceTime:(unint64_t)a4
{
  id v6 = a3;
  NSUInteger v7 = [(SignpostInterval *)self startMachContinuousTime];
  if ([v6 mayBeFirstFrame])
  {
    BOOL v8 = 1;
  }
  else
  {
    NSUInteger v9 = [v6 startMachContinuousTime];
    v12.length = [v6 durationMachContinuousTime];
    v11.location = v7;
    v11.length = a4;
    v12.location = v9;
    BOOL v8 = NSIntersectionRange(v11, v12).length != 0;
  }

  return v8;
}

- (NSArray)glitches
{
  unint64_t v3 = [(SignpostAnimationInterval *)self longFrameLifetimes];
  id v4 = _glitchesFromFrameLifetimesBase(v3, self, 2, 19, 0);

  return (NSArray *)v4;
}

- (NSArray)contributedGlitches
{
  unint64_t v3 = [(SignpostAnimationInterval *)self longContributedFrameLifetimes];
  id v4 = _glitchesFromFrameLifetimesBase(v3, self, 2, 19, 0);

  return (NSArray *)v4;
}

- (id)overrunIntervalsOfType:(unint64_t)a3 class:(unint64_t)a4 contributingPID:(id)a5
{
  id v8 = a5;
  NSUInteger v9 = [(SignpostAnimationInterval *)self longFrameLifetimes];
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__SignpostAnimationInterval_overrunIntervalsOfType_class_contributingPID___block_invoke;
    v15[3] = &unk_1E5B40030;
    id v16 = v8;
    NSRange v11 = [v10 predicateWithBlock:v15];
    uint64_t v12 = [v9 filteredArrayUsingPredicate:v11];

    NSUInteger v9 = (void *)v12;
  }
  NSUInteger v13 = _glitchesFromFrameLifetimesBase(v9, self, a3, a4, v8);

  return v13;
}

uint64_t __74__SignpostAnimationInterval_overrunIntervalsOfType_class_contributingPID___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 contributingPIDs];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (double)timeRatioMSPerSForOverrunIntervals:(id)a3 applyPerceptionAdjustments:(unint64_t)a4
{
  [(SignpostAnimationInterval *)self _timeRatioForTimeIntervalArray:a3 applyPerceptionAdjustments:a4];
  return v4 * 1000.0;
}

- (double)timeRatioMSPerSForOverrunIntervalsOfType:(unint64_t)a3 class:(unint64_t)a4 contributingPID:(id)a5 applyPerceptionAdjustments:(unint64_t)a6
{
  id v8 = [(SignpostAnimationInterval *)self overrunIntervalsOfType:a3 class:a4 contributingPID:a5];
  [(SignpostAnimationInterval *)self timeRatioMSPerSForOverrunIntervals:v8 applyPerceptionAdjustments:a6];
  double v10 = v9;

  return v10;
}

- (double)glitchTimeRatio
{
  unint64_t v3 = [(SignpostAnimationInterval *)self glitches];
  [(SignpostAnimationInterval *)self _timeRatioForTimeIntervalArray:v3 applyPerceptionAdjustments:0];
  double v5 = v4;

  return v5;
}

- (double)glitchTimeRatioMsPerS
{
  [(SignpostAnimationInterval *)self glitchTimeRatio];
  return v2 * 1000.0;
}

- (double)glitchTimeRatioAdjusted
{
  unint64_t v3 = +[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion];
  if (v3 - 1 > 1)
  {
    double v5 = [(SignpostAnimationInterval *)self glitches];
  }
  else
  {
    double v4 = [(SignpostAnimationInterval *)self longFrameLifetimes];
    double v5 = _glitchesFromFrameLifetimesBase(v4, self, 1, 19, 0);
  }
  [(SignpostAnimationInterval *)self _timeRatioForTimeIntervalArray:v5 applyPerceptionAdjustments:v3];
  double v7 = v6;

  return v7;
}

- (double)glitchTimeRatioAdjustedMsPerS
{
  [(SignpostAnimationInterval *)self glitchTimeRatioAdjusted];
  return v2 * 1000.0;
}

- (unint64_t)firstFrameGraceTimeMs
{
  double v2 = [(SignpostAnimationInterval *)self firstFrameGraceTime];
  unint64_t v3 = [v2 firstFrameGraceTimeMs];

  return v3;
}

- (unint64_t)animationType
{
  double v2 = [(SignpostAnimationInterval *)self firstFrameGraceTime];
  unint64_t v3 = [v2 animationType];

  return v3;
}

- (unint64_t)firstFrameGraceTimeMCT
{
  unint64_t v3 = [(SignpostAnimationInterval *)self firstFrameGraceTime];
  double v4 = (double)(unint64_t)(1000000 * [v3 firstFrameGraceTimeMs]);
  [(SignpostSupportObject *)self timebaseRatio];
  unint64_t v6 = (unint64_t)(v4 / v5);

  return v6;
}

- (NSArray)firstFrameGlitches
{
  unint64_t v3 = [(SignpostAnimationInterval *)self longFrameLifetimes];
  double v4 = _glitchesFromFrameLifetimesBase(v3, self, 2, 1, 0);

  return (NSArray *)v4;
}

- (NSArray)contributedFirstFrameGlitches
{
  unint64_t v3 = [(SignpostAnimationInterval *)self longContributedFrameLifetimes];
  double v4 = _glitchesFromFrameLifetimesBase(v3, self, 2, 1, 0);

  return (NSArray *)v4;
}

- (double)firstFrameGlitchTimeRatio
{
  unint64_t v3 = [(SignpostAnimationInterval *)self firstFrameGlitches];
  [(SignpostAnimationInterval *)self _timeRatioForTimeIntervalArray:v3 applyPerceptionAdjustments:0];
  double v5 = v4;

  return v5;
}

- (double)firstFrameGlitchTimeRatioMsPerS
{
  [(SignpostAnimationInterval *)self firstFrameGlitchTimeRatio];
  return v2 * 1000.0;
}

- (NSArray)nonFirstFrameGlitches
{
  unint64_t v3 = [(SignpostAnimationInterval *)self longFrameLifetimes];
  double v4 = _glitchesFromFrameLifetimesBase(v3, self, 2, 18, 0);

  return (NSArray *)v4;
}

- (NSArray)contributedNonFirstFrameGlitches
{
  unint64_t v3 = [(SignpostAnimationInterval *)self longContributedFrameLifetimes];
  double v4 = _glitchesFromFrameLifetimesBase(v3, self, 2, 18, 0);

  return (NSArray *)v4;
}

- (double)nonFirstFrameGlitchTimeRatio
{
  unint64_t v3 = [(SignpostAnimationInterval *)self nonFirstFrameGlitches];
  [(SignpostAnimationInterval *)self _timeRatioForTimeIntervalArray:v3 applyPerceptionAdjustments:0];
  double v5 = v4;

  return v5;
}

- (double)nonFirstFrameGlitchTimeRatioMsPerS
{
  [(SignpostAnimationInterval *)self nonFirstFrameGlitchTimeRatio];
  return v2 * 1000.0;
}

- (double)nonFirstFrameGlitchTimeRatioAdjusted
{
  unint64_t v3 = +[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion];
  if (v3 - 1 > 1)
  {
    double v5 = [(SignpostAnimationInterval *)self nonFirstFrameGlitches];
  }
  else
  {
    double v4 = [(SignpostAnimationInterval *)self longFrameLifetimes];
    double v5 = _glitchesFromFrameLifetimesBase(v4, self, 1, 18, 0);
  }
  [(SignpostAnimationInterval *)self _timeRatioForTimeIntervalArray:v5 applyPerceptionAdjustments:v3];
  double v7 = v6;

  return v7;
}

- (double)nonFirstFrameGlitchTimeRatioAdjustedMsPerS
{
  [(SignpostAnimationInterval *)self nonFirstFrameGlitchTimeRatioAdjusted];
  return v2 * 1000.0;
}

- (double)nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS
{
  unint64_t v3 = NSNumber;
  double v4 = [(SignpostInterval *)self beginEvent];
  double v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));
  [(SignpostAnimationInterval *)self timeRatioMSPerSForOverrunIntervalsOfType:2 class:10 contributingPID:v5 applyPerceptionAdjustments:+[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion]];
  double v7 = v6;

  return v7;
}

- (id)_statsStringForTimeIntervals:(id)a3 label:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = SignpostSupportSlidingWindowAveragesForIntervalsInNs(v5, 2);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) doubleValue];
        if (v11 < v13) {
          double v11 = v13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }
  NSUInteger v14 = NSString;
  uint64_t v15 = [v5 count];
  double v16 = (double)SignpostSupportAverageDurationNsForIntervals(v5) / 1000000.0;
  long long v17 = [v14 stringWithFormat:@"%lu %@ with %.2f ms average duration, %.3f ms standard deviation, and %.3f ms window max\n", v15, v6, *(void *)&v16, (double)SignpostSupportStdDevNsForIntervals(v5) / 1000000.0, v11 / 1000000.0];

  return v17;
}

- (id)_animationStatsDescription
{
  unint64_t v3 = [(SignpostAnimationInterval *)self allCommits];

  BOOL v4 = v3 != 0;
  if (v3)
  {
    id v5 = [(SignpostAnimationInterval *)self allCommits];
    id v6 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v5 label:@"commit(s)"];
  }
  else
  {
    id v6 = &stru_1EF807BF0;
  }
  double v7 = [(SignpostAnimationInterval *)self allSystemwideCommits];

  if (v7)
  {
    uint64_t v8 = [(SignpostAnimationInterval *)self allSystemwideCommits];
    uint64_t v9 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v8 label:@"systemwide commit(s)"];

    BOOL v4 = 1;
  }
  else
  {
    uint64_t v9 = &stru_1EF807BF0;
  }
  uint64_t v10 = [(SignpostAnimationInterval *)self allClientDrawables];

  if (v10)
  {
    double v11 = [(SignpostAnimationInterval *)self allClientDrawables];
    uint64_t v12 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v11 label:@"client drawables(s)"];

    BOOL v4 = 1;
  }
  else
  {
    uint64_t v12 = &stru_1EF807BF0;
  }
  double v13 = [(SignpostAnimationInterval *)self allSystemwideClientDrawables];

  if (v13)
  {
    NSUInteger v14 = [(SignpostAnimationInterval *)self allSystemwideClientDrawables];
    uint64_t v15 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v14 label:@"systemwide client drawable(s)"];

    BOOL v4 = 1;
  }
  else
  {
    uint64_t v15 = &stru_1EF807BF0;
  }
  double v16 = [(SignpostAnimationInterval *)self allRenderServerRenders];

  if (v16)
  {
    long long v17 = [(SignpostAnimationInterval *)self allRenderServerRenders];
    long long v18 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v17 label:@"CA render server renders(s)"];

    BOOL v4 = 1;
  }
  else
  {
    long long v18 = &stru_1EF807BF0;
  }
  long long v19 = [(SignpostAnimationInterval *)self allTransactionLifetimes];

  if (v19)
  {
    long long v20 = [(SignpostAnimationInterval *)self allTransactionLifetimes];
    long long v21 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v20 label:@"transaction lifetimes"];

    BOOL v4 = 1;
  }
  else
  {
    long long v21 = &stru_1EF807BF0;
  }
  long long v22 = [(SignpostAnimationInterval *)self allFrameLatencies];

  if (v22)
  {
    NSRange v23 = [(SignpostAnimationInterval *)self allFrameLatencies];
    uint64_t v47 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v23 label:@"frame latencies"];

    BOOL v4 = 1;
  }
  else
  {
    uint64_t v47 = &stru_1EF807BF0;
  }
  uint64_t v24 = [(SignpostAnimationInterval *)self allHIDLatencies];

  if (v24)
  {
    uint64_t v25 = [(SignpostAnimationInterval *)self allHIDLatencies];
    v50 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v25 label:@"HID latencies"];

    BOOL v4 = 1;
  }
  else
  {
    v50 = &stru_1EF807BF0;
  }
  uint64_t v26 = [(SignpostAnimationInterval *)self allFrameLifetimes];

  if (v26)
  {
    long long v27 = [(SignpostAnimationInterval *)self allFrameLifetimes];
    uint64_t v49 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v27 label:@"frame lifetimes"];

    BOOL v4 = 1;
  }
  else
  {
    uint64_t v49 = &stru_1EF807BF0;
  }
  long long v28 = [(SignpostAnimationInterval *)self glitches];
  long long v29 = v21;
  long long v30 = v15;
  long long v31 = v12;
  long long v32 = v9;
  long long v33 = v6;
  if (v28)
  {
    uint64_t v48 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v28 label:@"glitches"];
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v48 = &stru_1EF807BF0;
  }

  uint64_t v34 = [(SignpostAnimationInterval *)self contributedGlitches];
  uint64_t v51 = v6;
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v36 = [(SignpostAnimationInterval *)self _statsStringForTimeIntervals:v34 label:@"contributed glitches"];

    uint64_t v37 = v33;
    uint64_t v38 = v32;
    NSRange v39 = v31;
    NSRange v40 = v30;
    NSRange v41 = v29;
    NSRange v42 = v47;
LABEL_34:
    uint64_t v44 = v48;
    v43 = v49;
    uint64_t v45 = v50;
    v52 = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@", v49, v37, v38, v39, v40, v18, v41, v42, v50, v48, v36];
    goto LABEL_36;
  }
  uint64_t v36 = &stru_1EF807BF0;
  uint64_t v37 = v6;
  uint64_t v38 = v32;
  NSRange v39 = v31;
  NSRange v40 = v30;
  NSRange v41 = v29;
  NSRange v42 = v47;
  if (v4) {
    goto LABEL_34;
  }
  v52 = 0;
  uint64_t v45 = v50;
  uint64_t v44 = v48;
  v43 = v49;
LABEL_36:

  return v52;
}

- (id)_frameDescription
{
  unint64_t v3 = [(SignpostAnimationInterval *)self _detailedFrameDescription];
  BOOL v4 = [(SignpostAnimationInterval *)self _poorPerfFrameDescription];
  uint64_t v5 = [(SignpostAnimationInterval *)self _animationStatsDescription];
  id v6 = (void *)v5;
  double v7 = NSString;
  if (v3 || v4 || v5)
  {
    uint64_t v9 = &stru_1EF807BF0;
    if (v3) {
      uint64_t v10 = v3;
    }
    else {
      uint64_t v10 = &stru_1EF807BF0;
    }
    if (v4) {
      double v11 = v4;
    }
    else {
      double v11 = &stru_1EF807BF0;
    }
    if (v5) {
      uint64_t v9 = (__CFString *)v5;
    }
    [NSString stringWithFormat:@"%@%@%@", v10, v11, v9];
  }
  else
  {
    [(SignpostAnimationInterval *)self frameRate];
    objc_msgSend(v7, "stringWithFormat:", @"Average Framerate: %.1f frames/sec\n", v8, v14, v15);
  uint64_t v12 = };

  return v12;
}

- (id)debugDescription
{
  unint64_t v3 = [(SignpostAnimationInterval *)self animationType];
  if (v3 - 1 > 2) {
    BOOL v4 = @"Default";
  }
  else {
    BOOL v4 = off_1E5B40078[v3 - 1];
  }
  uint64_t v5 = NSString;
  id v6 = [(SignpostObject *)self name];
  unint64_t v7 = [(SignpostInterval *)self startMachContinuousTime];
  unint64_t v8 = [(SignpostInterval *)self endMachContinuousTime];
  [(SignpostInterval *)self durationSeconds];
  double v10 = v9;
  if ([(SignpostInterval *)self telemetryEnabled]) {
    double v11 = @"Enabled";
  }
  else {
    double v11 = @"Disabled";
  }
  uint64_t v12 = [(SignpostAnimationInterval *)self _frameDescription];
  double v13 = +[SignpostMetrics _deltaDescription:self];
  uint64_t v14 = [(SignpostInterval *)self _eventDescriptions];
  uint64_t v15 = [v5 stringWithFormat:@"Animation Interval \"%@\" [%llu - %llu]\nDuration: %.4fs\nTelemetry:%@\nAnimation Type: %@\n%@%@%@", v6, v7, v8, *(void *)&v10, v11, v4, v12, v13, v14];

  return v15;
}

- (float)frameRate
{
  unint64_t v3 = [(SignpostAnimationInterval *)self allFrameLatencies];

  if (v3)
  {
    BOOL v4 = [(SignpostAnimationInterval *)self allFrameLatencies];
    float v5 = (float)(unint64_t)[v4 count];
    [(SignpostInterval *)self durationSeconds];
    float v7 = v5 / v6;
LABEL_5:

    return v7;
  }
  unint64_t v8 = [(SignpostInterval *)self beginEvent];
  int v9 = [v8 _hasTotalSkyLightCompositeCount];

  float v7 = 0.0;
  if (v9)
  {
    BOOL v4 = [(SignpostInterval *)self endEvent];
    uint64_t v10 = [v4 _totalSkyLightCompositeCount];
    double v11 = [(SignpostInterval *)self beginEvent];
    float v12 = (float)(unint64_t)(v10 - [v11 _totalSkyLightCompositeCount]);
    [(SignpostInterval *)self durationSeconds];
    float v7 = v12 / v13;

    goto LABEL_5;
  }
  return v7;
}

- (SignpostAnimationInterval)initWithFirstAnimatonInterval:(id)a3 secondAnimationInterval:(id)a4
{
  float v6 = (SignpostAnimationInterval *)a3;
  id v7 = a4;
  unint64_t v8 = [(SignpostInterval *)v6 startMachContinuousTime];
  if (v8 <= [v7 startMachContinuousTime]
    && (unint64_t v9 = [(SignpostInterval *)v6 endMachContinuousTime],
        v9 >= [v7 startMachContinuousTime]))
  {
    unint64_t v11 = [(SignpostInterval *)v6 endMachContinuousTime];
    if (v11 >= [v7 endMachContinuousTime])
    {
      uint64_t v14 = v6;
    }
    else
    {
      float v12 = [(SignpostInterval *)v6 beginEvent];
      float v13 = [v7 endEvent];
      v86.receiver = self;
      v86.super_class = (Class)SignpostAnimationInterval;
      uint64_t v14 = [(SignpostInterval *)&v86 initWithBeginEvent:v12 endEvent:v13];

      if (v14)
      {
        uint64_t v15 = [(SignpostAnimationInterval *)v6 longCommits];
        double v16 = [v7 longCommits];
        uint64_t v17 = _uniqueInterval(v15, v16);
        longCommits = v14->_longCommits;
        v14->_longCommits = (NSArray *)v17;

        long long v19 = [(SignpostAnimationInterval *)v6 longSystemwideCommits];
        long long v20 = [v7 longSystemwideCommits];
        uint64_t v21 = _uniqueInterval(v19, v20);
        longSystemwideCommits = v14->_longSystemwideCommits;
        v14->_longSystemwideCommits = (NSArray *)v21;

        NSRange v23 = [(SignpostAnimationInterval *)v6 allSystemwideCommits];
        uint64_t v24 = [v7 allSystemwideCommits];
        uint64_t v25 = _uniqueInterval(v23, v24);
        allSystemwideCommits = v14->_allSystemwideCommits;
        v14->_allSystemwideCommits = (NSArray *)v25;

        long long v27 = [(SignpostAnimationInterval *)v6 longClientDrawables];
        long long v28 = [v7 longClientDrawables];
        uint64_t v29 = _uniqueInterval(v27, v28);
        longClientDrawables = v14->_longClientDrawables;
        v14->_longClientDrawables = (NSArray *)v29;

        long long v31 = [(SignpostAnimationInterval *)v6 allClientDrawables];
        long long v32 = [v7 allClientDrawables];
        uint64_t v33 = _uniqueInterval(v31, v32);
        allClientDrawables = v14->_allClientDrawables;
        v14->_allClientDrawables = (NSArray *)v33;

        uint64_t v35 = [(SignpostAnimationInterval *)v6 longSystemwideClientDrawables];
        uint64_t v36 = [v7 longSystemwideClientDrawables];
        uint64_t v37 = _uniqueInterval(v35, v36);
        longSystemwideClientDrawables = v14->_longSystemwideClientDrawables;
        v14->_longSystemwideClientDrawables = (NSArray *)v37;

        NSRange v39 = [(SignpostAnimationInterval *)v6 allSystemwideClientDrawables];
        NSRange v40 = [v7 allSystemwideClientDrawables];
        uint64_t v41 = _uniqueInterval(v39, v40);
        allSystemwideClientDrawables = v14->_allSystemwideClientDrawables;
        v14->_allSystemwideClientDrawables = (NSArray *)v41;

        v43 = [(SignpostAnimationInterval *)v6 longTransactionLifetimes];
        uint64_t v44 = [v7 longTransactionLifetimes];
        uint64_t v45 = _uniqueInterval(v43, v44);
        longTransactionLifetimes = v14->_longTransactionLifetimes;
        v14->_longTransactionLifetimes = (NSArray *)v45;

        uint64_t v47 = [(SignpostAnimationInterval *)v6 allTransactionLifetimes];
        uint64_t v48 = [v7 allTransactionLifetimes];
        uint64_t v49 = _uniqueInterval(v47, v48);
        allTransactionLifetimes = v14->_allTransactionLifetimes;
        v14->_allTransactionLifetimes = (NSArray *)v49;

        uint64_t v51 = [(SignpostAnimationInterval *)v6 longFrameLatencies];
        v52 = [v7 longFrameLatencies];
        uint64_t v53 = _uniqueInterval(v51, v52);
        longFrameLatencies = v14->_longFrameLatencies;
        v14->_longFrameLatencies = (NSArray *)v53;

        v55 = [(SignpostAnimationInterval *)v6 allFrameLatencies];
        v56 = [v7 allFrameLatencies];
        uint64_t v57 = _uniqueInterval(v55, v56);
        allFrameLatencies = v14->_allFrameLatencies;
        v14->_allFrameLatencies = (NSArray *)v57;

        v59 = [(SignpostAnimationInterval *)v6 allHIDLatencies];
        uint64_t v60 = [v7 allHIDLatencies];
        uint64_t v61 = _uniqueInterval(v59, v60);
        longHIDLatencies = v14->_longHIDLatencies;
        v14->_longHIDLatencies = (NSArray *)v61;

        uint64_t v63 = [(SignpostAnimationInterval *)v6 allHIDLatencies];
        v64 = [v7 allHIDLatencies];
        uint64_t v65 = _uniqueInterval(v63, v64);
        allHIDLatencies = v14->_allHIDLatencies;
        v14->_allHIDLatencies = (NSArray *)v65;

        v67 = [(SignpostAnimationInterval *)v6 longRenderServerRenders];
        v68 = [v7 longRenderServerRenders];
        uint64_t v69 = _uniqueInterval(v67, v68);
        longRenderServerRenders = v14->_longRenderServerRenders;
        v14->_longRenderServerRenders = (NSArray *)v69;

        v71 = [(SignpostAnimationInterval *)v6 allRenderServerRenders];
        uint64_t v72 = [v7 allRenderServerRenders];
        uint64_t v73 = _uniqueInterval(v71, v72);
        allRenderServerRenders = v14->_allRenderServerRenders;
        v14->_allRenderServerRenders = (NSArray *)v73;

        uint64_t v75 = [(SignpostAnimationInterval *)v6 firstFrameGraceTime];
        firstFrameGraceTime = v14->_firstFrameGraceTime;
        v14->_firstFrameGraceTime = (SignpostSupportAnimationGraceTime *)v75;

        v77 = [(SignpostAnimationInterval *)v6 longFrameLifetimes];
        uint64_t v78 = [v7 longFrameLifetimes];
        uint64_t v79 = _uniqueInterval(v77, v78);
        longFrameLifetimes = v14->_longFrameLifetimes;
        v14->_longFrameLifetimes = (NSArray *)v79;

        uint64_t v81 = [(SignpostAnimationInterval *)v6 allFrameLifetimes];
        v82 = [v7 allFrameLifetimes];
        uint64_t v83 = _uniqueInterval(v81, v82);
        allFrameLifetimes = v14->_allFrameLifetimes;
        v14->_allFrameLifetimes = (NSArray *)v83;
      }
      self = v14;
    }
    uint64_t v10 = v14;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSArray)allContributedFrameLatencies
{
  unint64_t v3 = NSNumber;
  BOOL v4 = [(SignpostInterval *)self beginEvent];
  float v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));

  float v6 = [(SignpostAnimationInterval *)self allFrameLatencies];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__SignpostAnimationInterval_allContributedFrameLatencies__block_invoke;
  v12[3] = &unk_1E5B40058;
  id v13 = v5;
  id v8 = v5;
  unint64_t v9 = [v7 predicateWithBlock:v12];
  uint64_t v10 = [v6 filteredArrayUsingPredicate:v9];

  return (NSArray *)v10;
}

uint64_t __57__SignpostAnimationInterval_allContributedFrameLatencies__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 contributingPids];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (NSArray)contributedLongFrameLatencies
{
  unint64_t v3 = NSNumber;
  uint64_t v4 = [(SignpostInterval *)self beginEvent];
  float v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));

  float v6 = [(SignpostAnimationInterval *)self longFrameLatencies];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SignpostAnimationInterval_contributedLongFrameLatencies__block_invoke;
  v12[3] = &unk_1E5B40058;
  id v13 = v5;
  id v8 = v5;
  unint64_t v9 = [v7 predicateWithBlock:v12];
  uint64_t v10 = [v6 filteredArrayUsingPredicate:v9];

  return (NSArray *)v10;
}

uint64_t __58__SignpostAnimationInterval_contributedLongFrameLatencies__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 contributingPids];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (NSArray)allContributedFrameLifetimes
{
  unint64_t v3 = NSNumber;
  uint64_t v4 = [(SignpostInterval *)self beginEvent];
  float v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));

  float v6 = [(SignpostAnimationInterval *)self allFrameLifetimes];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__SignpostAnimationInterval_allContributedFrameLifetimes__block_invoke;
  v12[3] = &unk_1E5B40030;
  id v13 = v5;
  id v8 = v5;
  unint64_t v9 = [v7 predicateWithBlock:v12];
  uint64_t v10 = [v6 filteredArrayUsingPredicate:v9];

  return (NSArray *)v10;
}

uint64_t __57__SignpostAnimationInterval_allContributedFrameLifetimes__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 contributingPIDs];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (NSArray)longContributedFrameLifetimes
{
  unint64_t v3 = NSNumber;
  uint64_t v4 = [(SignpostInterval *)self beginEvent];
  float v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));

  float v6 = [(SignpostAnimationInterval *)self longFrameLifetimes];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SignpostAnimationInterval_longContributedFrameLifetimes__block_invoke;
  v12[3] = &unk_1E5B40030;
  id v13 = v5;
  id v8 = v5;
  unint64_t v9 = [v7 predicateWithBlock:v12];
  uint64_t v10 = [v6 filteredArrayUsingPredicate:v9];

  return (NSArray *)v10;
}

uint64_t __58__SignpostAnimationInterval_longContributedFrameLifetimes__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 contributingPIDs];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SignpostAnimationInterval;
  if ([(SignpostInterval *)&v16 isEqual:v5])
  {
    id v6 = v5;
    id v7 = [(SignpostAnimationInterval *)self compositeIntervals];
    if (!v7 || ([v6 compositeIntervals], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unint64_t v9 = [(SignpostAnimationInterval *)self compositeIntervals];
      if (v9)
      {

        if (v7)
        {
        }
      }
      else
      {
        uint64_t v10 = [v6 compositeIntervals];

        if (v7)
        {
        }
        if (v10) {
          goto LABEL_15;
        }
      }
      unint64_t v11 = [(SignpostAnimationInterval *)self compositeIntervals];

      if (!v11
        || ([(SignpostAnimationInterval *)self compositeIntervals],
            float v12 = objc_claimAutoreleasedReturnValue(),
            [v6 compositeIntervals],
            id v13 = objc_claimAutoreleasedReturnValue(),
            int v14 = [v12 isEqual:v13],
            v13,
            v12,
            v14))
      {
        BOOL v8 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
    }
LABEL_15:
    BOOL v8 = 0;
    goto LABEL_16;
  }
  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (unint64_t)frameCount
{
  unint64_t v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 _hasTotalSkyLightCompositeCount];

  if (v4)
  {
    id v5 = [(SignpostInterval *)self endEvent];
    uint64_t v6 = [v5 _totalSkyLightCompositeCount];
    id v7 = [(SignpostInterval *)self beginEvent];
    unint64_t v8 = v6 - [v7 _totalSkyLightCompositeCount];
  }
  else
  {
    unint64_t v9 = [(SignpostAnimationInterval *)self compositeIntervals];

    if (v9)
    {
      uint64_t v10 = [(SignpostAnimationInterval *)self compositeIntervals];
    }
    else
    {
      unint64_t v11 = [(SignpostAnimationInterval *)self allFrameLatencies];

      if (!v11) {
        return 0;
      }
      uint64_t v10 = [(SignpostAnimationInterval *)self allFrameLatencies];
    }
    id v5 = v10;
    unint64_t v8 = [v10 count];
  }

  return v8;
}

- (unint64_t)durationToFirstBeginMachContinuousTime:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 startMachContinuousTime];
    unint64_t v8 = v7 - [(SignpostInterval *)self startMachContinuousTime];
  }
  else
  {
    unint64_t v8 = -1;
  }

  return v8;
}

- (unint64_t)durationToFirstEndMachContinuousTime:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 endMachContinuousTime];
    unint64_t v8 = v7 - [(SignpostInterval *)self startMachContinuousTime];
  }
  else
  {
    unint64_t v8 = -1;
  }

  return v8;
}

- (double)durationToFirstBeginSeconds:(id)a3
{
  double v4 = (double)[(SignpostAnimationInterval *)self durationToFirstBeginMachContinuousTime:a3];
  [(SignpostSupportObject *)self timebaseRatio];
  return (double)(unint64_t)(v5 * v4) / 1000000000.0;
}

- (double)durationToFirstEndSeconds:(id)a3
{
  double v4 = (double)[(SignpostAnimationInterval *)self durationToFirstEndMachContinuousTime:a3];
  [(SignpostSupportObject *)self timebaseRatio];
  return (double)(unint64_t)(v5 * v4) / 1000000000.0;
}

- (NSArray)allCommits
{
  return self->_allCommits;
}

- (NSArray)longCommits
{
  return self->_longCommits;
}

- (NSArray)allSystemwideCommits
{
  return self->_allSystemwideCommits;
}

- (NSArray)longSystemwideCommits
{
  return self->_longSystemwideCommits;
}

- (NSArray)allClientDrawables
{
  return self->_allClientDrawables;
}

- (NSArray)longClientDrawables
{
  return self->_longClientDrawables;
}

- (NSArray)allSystemwideClientDrawables
{
  return self->_allSystemwideClientDrawables;
}

- (NSArray)longSystemwideClientDrawables
{
  return self->_longSystemwideClientDrawables;
}

- (NSArray)compositeIntervals
{
  return self->_compositeIntervals;
}

- (void)setCompositeIntervals:(id)a3
{
}

- (NSArray)allTransactionLifetimes
{
  return self->_allTransactionLifetimes;
}

- (NSArray)longTransactionLifetimes
{
  return self->_longTransactionLifetimes;
}

- (NSArray)allFrameLatencies
{
  return self->_allFrameLatencies;
}

- (NSArray)longFrameLatencies
{
  return self->_longFrameLatencies;
}

- (NSArray)allFrameLifetimes
{
  return self->_allFrameLifetimes;
}

- (NSArray)longFrameLifetimes
{
  return self->_longFrameLifetimes;
}

- (NSArray)allHIDLatencies
{
  return self->_allHIDLatencies;
}

- (NSArray)longHIDLatencies
{
  return self->_longHIDLatencies;
}

- (NSArray)allRenderServerRenders
{
  return self->_allRenderServerRenders;
}

- (NSArray)longRenderServerRenders
{
  return self->_longRenderServerRenders;
}

- (SignpostSupportAnimationGraceTime)firstFrameGraceTime
{
  return (SignpostSupportAnimationGraceTime *)objc_getProperty(self, a2, 304, 1);
}

+ (id)serializationTypeNumber
{
  return 0;
}

- (SignpostAnimationInterval)initWithDictionary:(id)a3
{
  return 0;
}

- (id)humanReadableType
{
  return @"SignpostAnimationInterval";
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v40.receiver = self;
    v40.super_class = (Class)SignpostAnimationInterval;
    double v5 = [(SignpostInterval *)&v40 _dictionaryRepresentationWithIsHumanReadable:1 shouldRedact:a4];
    uint64_t v6 = NSNumber;
    [(SignpostAnimationInterval *)self frameRate];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v5 setObject:v7 forKeyedSubscript:@"Framerate"];

    unint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostAnimationInterval frameCount](self, "frameCount"));
    [v5 setObject:v8 forKeyedSubscript:@"FrameCount"];

    uint64_t v9 = [(SignpostAnimationInterval *)self compositeIntervals];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      unint64_t v11 = [(SignpostAnimationInterval *)self compositeIntervals];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        id v13 = [MEMORY[0x1E4F1CA48] array];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        int v14 = [(SignpostAnimationInterval *)self compositeIntervals];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = [*(id *)(*((void *)&v36 + 1) + 8 * i) humanReadableDictionaryRepresentation];
              [v13 addObject:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
          }
          while (v16);
        }

        [v5 setObject:v13 forKeyedSubscript:@"CompositeIntervalArray"];
      }
    }
    long long v20 = NSNumber;
    uint64_t v21 = [(SignpostAnimationInterval *)self glitches];
    long long v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    [v5 setObject:v22 forKeyedSubscript:@"GC"];

    NSRange v23 = NSNumber;
    [(SignpostAnimationInterval *)self glitchTimeRatioMsPerS];
    uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
    [v5 setObject:v24 forKeyedSubscript:@"GTRMsPerS"];

    uint64_t v25 = NSNumber;
    uint64_t v26 = [(SignpostAnimationInterval *)self firstFrameGlitches];
    long long v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
    [v5 setObject:v27 forKeyedSubscript:@"FFGC"];

    long long v28 = NSNumber;
    [(SignpostAnimationInterval *)self firstFrameGlitchTimeRatioMsPerS];
    uint64_t v29 = objc_msgSend(v28, "numberWithDouble:");
    [v5 setObject:v29 forKeyedSubscript:@"FFGTRMsPerS"];

    long long v30 = NSNumber;
    long long v31 = [(SignpostAnimationInterval *)self nonFirstFrameGlitches];
    long long v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
    [v5 setObject:v32 forKeyedSubscript:@"NFFGC"];

    uint64_t v33 = NSNumber;
    [(SignpostAnimationInterval *)self nonFirstFrameGlitchTimeRatioMsPerS];
    uint64_t v34 = objc_msgSend(v33, "numberWithDouble:");
    [v5 setObject:v34 forKeyedSubscript:@"NFFGTRMsPerS"];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

+ (void)effectiveGlitchTimeRatioAdjustedVersion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  unint64_t v3 = "+[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = 3;
  _os_log_debug_impl(&dword_1A4576000, a2, OS_LOG_TYPE_DEBUG, "%s: Unknown GlitchTimeRatioAdjustedVersion %lu, - reverting to %lu", (uint8_t *)&v2, 0x20u);
}

+ (void)unionOfAnimationIntervals:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Merging failed, ignoring offending first interval.", buf, 2u);
}

- (void)initWithBeginEvent:(uint64_t)a3 endEvent:(uint64_t)a4 accumulatedState:(uint64_t)a5 firstFrameGraceTimeController:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end