@interface WLKPlaybackSummary
+ (BOOL)supportsSecureCoding;
+ (double)playedThresholdTimeForDuration:(double)a3;
+ (id)EBSSummaryWithBundleID:(id)a3 channelID:(id)a4 externalId:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 playbackState:(int64_t)a9 playbackRate:(id)a10 currentPlaybackDate:(id)a11;
+ (id)VODSummaryWithBundleID:(id)a3 channelID:(id)a4 contentID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 duration:(id)a9 elapsedTime:(id)a10 featureDuration:(id)a11 featureElapsedTime:(id)a12 playbackState:(int64_t)a13 playbackRate:(id)a14 completionState:(int64_t)a15;
+ (id)VODSummaryWithBundleID:(id)a3 channelID:(id)a4 contentID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 duration:(id)a9 elapsedTime:(id)a10 playbackState:(int64_t)a11 playbackRate:(id)a12 completionState:(int64_t)a13;
+ (id)_debugStringForPlaybackType:(int64_t)a3;
+ (id)debugStringForCompletionState:(int64_t)a3;
+ (id)debugStringForPlaybackState:(int64_t)a3;
+ (id)liveSummaryWithBundleID:(id)a3 channelID:(id)a4 serviceID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 playbackState:(int64_t)a9 playbackRate:(id)a10 currentPlaybackDate:(id)a11;
+ (int64_t)completionStateForDuration:(double)a3 elapsedTime:(double)a4;
- (BOOL)_compareOptional:(id)a3 with:(id)a4;
- (BOOL)_compareOptionalTemporalValue:(id)a3 with:(id)a4 fuzzy:(BOOL)a5;
- (BOOL)_isValid;
- (BOOL)_validate:(id)a3 identifier:(id)a4 expectedClass:(Class)a5;
- (BOOL)isAlwaysLive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSummary:(id)a3;
- (BOOL)isEquivalentToSummaryExcludingCursor:(id)a3;
- (BOOL)isEquivalentToSummaryExcludingTimestamp:(id)a3;
- (BOOL)isFromActivePlayerPath;
- (BOOL)isLiveType;
- (BOOL)isSameContent:(id)a3;
- (BOOL)isTimerDerived;
- (NSDate)currentPlaybackDate;
- (NSDate)timestamp;
- (NSNumber)accountIDAsNumber;
- (NSNumber)duration;
- (NSNumber)elapsedTime;
- (NSNumber)featureDuration;
- (NSNumber)featureElapsedTime;
- (NSNumber)playbackRate;
- (NSString)accountID;
- (NSString)bundleID;
- (NSString)channelID;
- (NSString)contentID;
- (NSString)externalProfileID;
- (NSString)serviceID;
- (WLKPlaybackSummary)initWithBundleID:(id)a3 timestamp:(id)a4 duration:(id)a5 elapsedTime:(id)a6 featureDuration:(id)a7 featureElapsedTime:(id)a8 externalProfileID:(id)a9 contentID:(id)a10 accountID:(id)a11 playbackState:(int64_t)a12 playbackRate:(id)a13 completionState:(int64_t)a14 isAlwaysLive:(BOOL)a15 serviceID:(id)a16 currentPlaybackDate:(id)a17 playbackType:(int64_t)a18 isTimerDerived:(BOOL)a19 isFromActivePlayerPath:(BOOL)a20 channelID:(id)a21;
- (WLKPlaybackSummary)initWithCoder:(id)a3;
- (WLKPlaybackSummary)initWithMediaRemoteDictionary:(id)a3 bundleID:(id)a4 accountID:(id)a5 isFromActivePlayerPath:(BOOL)a6;
- (id)JSONRepresentation;
- (id)description;
- (id)dictionaryRepresentation;
- (id)elapsedTimeSummaryWithPlaybackState:(int64_t)a3 timerDerived:(BOOL)a4;
- (id)sanitizedCopy;
- (id)shortDescription;
- (int64_t)completionState;
- (int64_t)playbackState;
- (int64_t)playbackType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)resolveChannelID:(id)a3;
- (void)setFromActivePlayerPath:(BOOL)a3;
- (void)setIsAlwaysLive:(BOOL)a3;
- (void)setIsTimerDerived:(BOOL)a3;
@end

@implementation WLKPlaybackSummary

- (WLKPlaybackSummary)initWithMediaRemoteDictionary:(id)a3 bundleID:(id)a4 accountID:(id)a5 isFromActivePlayerPath:(BOOL)a6
{
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F774C8];
  id v46 = a5;
  id v10 = a4;
  v11 = [v8 valueForKey:v9];
  v12 = [v8 valueForKey:*MEMORY[0x1E4F774D0]];
  uint64_t v13 = [v8 valueForKey:*MEMORY[0x1E4F775E8]];
  v14 = [v8 valueForKey:*MEMORY[0x1E4F774E0]];
  uint64_t v15 = [v8 valueForKey:*MEMORY[0x1E4F774E8]];
  v16 = [v8 valueForKey:*MEMORY[0x1E4F775B0]];
  v17 = [v8 valueForKey:*MEMORY[0x1E4F774A8]];
  v18 = [v8 valueForKey:*MEMORY[0x1E4F77508]];
  v45 = [v8 valueForKey:*MEMORY[0x1E4F77478]];
  v51 = v18;
  v50 = v14;
  v48 = (void *)v15;
  if ([v18 BOOLValue])
  {
    if ([v16 length])
    {
      int v19 = 0;
      int v41 = 0;
      int v42 = 1;
      uint64_t v20 = 2;
LABEL_6:
      uint64_t v43 = v20;
      goto LABEL_8;
    }
    if ([v14 length])
    {
      int v19 = 0;
      int v42 = 0;
      int v41 = 1;
      uint64_t v20 = 1;
      goto LABEL_6;
    }
  }
  int v42 = 0;
  int v41 = 0;
  uint64_t v43 = 0;
  int v19 = 1;
LABEL_8:
  v21 = [v8 valueForKey:*MEMORY[0x1E4F77560]];
  objc_opt_class();
  v49 = (void *)v13;
  v44 = v10;
  if (objc_opt_isKindOfClass())
  {
    v22 = v21;
    [v21 floatValue];
    if (v23 == 0.0)
    {
      uint64_t v24 = 2;
      goto LABEL_13;
    }
  }
  else
  {
    v22 = v21;
  }
  uint64_t v24 = 1;
LABEL_13:
  v25 = v51;
  if (v19)
  {
    v26 = [v8 valueForKey:*MEMORY[0x1E4F77558]];
    v27 = v26;
    if (v26)
    {
      [v26 floatValue];
      double v29 = v28;
      if (fabs(v29) < 0.00000011920929)
      {
        int64_t v30 = 1;
LABEL_20:
        NSLog(&cfstr_Wlkplaybacksum.isa, v27);
LABEL_23:

        v25 = v51;
        goto LABEL_24;
      }
      if (fabs(v29 + -1.0) < 0.00000011920929)
      {
        int64_t v30 = 2;
        goto LABEL_20;
      }
      NSLog(&cfstr_Wlkplaybacksum_0.isa, v27);
    }
    NSLog(&cfstr_Wlkplaybacksum_1.isa);
    [v11 doubleValue];
    double v32 = v31;
    [v12 doubleValue];
    int64_t v30 = +[WLKPlaybackSummary completionStateForDuration:v32 elapsedTime:v33];
    goto LABEL_23;
  }
  int64_t v30 = 0;
LABEL_24:
  if ((v42 | v41) == 1 && !v17)
  {
    v17 = [MEMORY[0x1E4F1C9C8] date];
  }
  BYTE1(v39) = a6;
  LOBYTE(v39) = 0;
  LOBYTE(v38) = [v25 BOOLValue];
  v34 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:](self, "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v44, v49, v11, v12, 0, 0, v48, v50, v46, v24, v22, v30, v38, v16, v17,
          v43,
          v39,
          v45);

  v35 = v34;
  v36 = 0;
  if ([(WLKPlaybackSummary *)v35 _isValid]) {
    v36 = v35;
  }

  return v36;
}

- (WLKPlaybackSummary)initWithBundleID:(id)a3 timestamp:(id)a4 duration:(id)a5 elapsedTime:(id)a6 featureDuration:(id)a7 featureElapsedTime:(id)a8 externalProfileID:(id)a9 contentID:(id)a10 accountID:(id)a11 playbackState:(int64_t)a12 playbackRate:(id)a13 completionState:(int64_t)a14 isAlwaysLive:(BOOL)a15 serviceID:(id)a16 currentPlaybackDate:(id)a17 playbackType:(int64_t)a18 isTimerDerived:(BOOL)a19 isFromActivePlayerPath:(BOOL)a20 channelID:(id)a21
{
  id v26 = a3;
  id v27 = a4;
  id v28 = a5;
  id v69 = a6;
  id v68 = a7;
  id v67 = a8;
  double v29 = v27;
  id v66 = a9;
  id v65 = a10;
  id v30 = a11;
  double v31 = v28;
  id v32 = a13;
  id v33 = a16;
  id v34 = a17;
  id v35 = a21;
  v70.receiver = self;
  v70.super_class = (Class)WLKPlaybackSummary;
  v36 = [(WLKPlaybackSummary *)&v70 init];
  if (v36)
  {
    uint64_t v37 = [v26 copy];
    bundleID = v36->_bundleID;
    v36->_bundleID = (NSString *)v37;

    uint64_t v39 = [v29 copy];
    timestamp = v36->_timestamp;
    v36->_timestamp = (NSDate *)v39;

    uint64_t v41 = [v31 copy];
    duration = v36->_duration;
    v36->_duration = (NSNumber *)v41;

    uint64_t v43 = [v69 copy];
    elapsedTime = v36->_elapsedTime;
    v36->_elapsedTime = (NSNumber *)v43;

    uint64_t v45 = [v68 copy];
    featureDuration = v36->_featureDuration;
    v36->_featureDuration = (NSNumber *)v45;

    uint64_t v47 = [v67 copy];
    featureElapsedTime = v36->_featureElapsedTime;
    v36->_featureElapsedTime = (NSNumber *)v47;

    uint64_t v49 = [v66 copy];
    externalProfileID = v36->_externalProfileID;
    v36->_externalProfileID = (NSString *)v49;

    uint64_t v51 = [v65 copy];
    contentID = v36->_contentID;
    v36->_contentID = (NSString *)v51;

    uint64_t v53 = [v30 copy];
    accountID = v36->_accountID;
    v36->_accountID = (NSString *)v53;

    v36->_playbackState = a12;
    uint64_t v55 = [v32 copy];
    playbackRate = v36->_playbackRate;
    v36->_playbackRate = (NSNumber *)v55;

    v36->_completionState = a14;
    v36->_isAlwaysLive = a15;
    uint64_t v57 = [v33 copy];
    serviceID = v36->_serviceID;
    v36->_serviceID = (NSString *)v57;

    uint64_t v59 = [v34 copy];
    currentPlaybackDate = v36->_currentPlaybackDate;
    v36->_currentPlaybackDate = (NSDate *)v59;

    v36->_playbackType = a18;
    v36->_isTimerDerived = a19;
    v36->_fromActivePlayerPath = a20;
    uint64_t v61 = [v35 copy];
    channelID = v36->_channelID;
    v36->_channelID = (NSString *)v61;
  }
  return v36;
}

- (BOOL)_isValid
{
  v3 = [(WLKPlaybackSummary *)self bundleID];
  BOOL v4 = [(WLKPlaybackSummary *)self _validate:v3 identifier:@"bundleID" expectedClass:objc_opt_class()];

  if (!v4) {
    return 0;
  }
  v5 = [(WLKPlaybackSummary *)self accountID];
  BOOL v6 = [(WLKPlaybackSummary *)self _validate:v5 identifier:@"accountID" expectedClass:objc_opt_class()];

  if (!v6) {
    return 0;
  }
  v7 = [(WLKPlaybackSummary *)self timestamp];
  BOOL v8 = [(WLKPlaybackSummary *)self _validate:v7 identifier:@"timestamp" expectedClass:objc_opt_class()];

  if (!v8) {
    return 0;
  }
  int64_t playbackType = self->_playbackType;
  if (playbackType == 2)
  {
    v17 = [(WLKPlaybackSummary *)self currentPlaybackDate];
    BOOL v18 = [(WLKPlaybackSummary *)self _validate:v17 identifier:@"currentPlaybackDate" expectedClass:objc_opt_class()];

    if (!v18) {
      return 0;
    }
    int v19 = [(WLKPlaybackSummary *)self serviceID];
    BOOL v20 = [(WLKPlaybackSummary *)self _validate:v19 identifier:@"serviceID" expectedClass:objc_opt_class()];

    return v20;
  }
  if (playbackType == 1)
  {
    v21 = [(WLKPlaybackSummary *)self currentPlaybackDate];
    BOOL v22 = [(WLKPlaybackSummary *)self _validate:v21 identifier:@"currentPlaybackDate" expectedClass:objc_opt_class()];

    if (!v22) {
      return 0;
    }
    float v23 = [(WLKPlaybackSummary *)self contentID];
    BOOL v24 = [(WLKPlaybackSummary *)self _validate:v23 identifier:@"contentID" expectedClass:objc_opt_class()];

    return v24;
  }
  if (playbackType) {
    return 1;
  }
  id v10 = [(WLKPlaybackSummary *)self duration];
  BOOL v11 = [(WLKPlaybackSummary *)self _validate:v10 identifier:@"duration" expectedClass:objc_opt_class()];

  if (!v11) {
    return 0;
  }
  v12 = [(WLKPlaybackSummary *)self elapsedTime];
  BOOL v13 = [(WLKPlaybackSummary *)self _validate:v12 identifier:@"elapsedTime" expectedClass:objc_opt_class()];

  if (!v13) {
    return 0;
  }
  v14 = [(WLKPlaybackSummary *)self elapsedTime];
  uint64_t v15 = [MEMORY[0x1E4F28C28] notANumber];
  int v16 = [v14 isEqualToNumber:v15];

  if (!v16)
  {
    id v26 = [(WLKPlaybackSummary *)self contentID];
    BOOL v27 = [(WLKPlaybackSummary *)self _validate:v26 identifier:@"contentID" expectedClass:objc_opt_class()];

    if (!v27) {
      return 0;
    }
    id v28 = [(WLKPlaybackSummary *)self duration];
    unint64_t v29 = [v28 unsignedIntegerValue];

    if (v29 <= 0x1D)
    {
      id v30 = [(WLKPlaybackSummary *)self duration];
      NSLog(&cfstr_Wlkplaybacksum_5.isa, v30);

      return 0;
    }
    double v31 = [(WLKPlaybackSummary *)self contentID];
    uint64_t v32 = [v31 length];

    if (!v32)
    {
      NSLog(&cfstr_Wlkplaybacksum_6.isa);
      return 0;
    }
    return 1;
  }
  NSLog(&cfstr_Wlkplaybacksum_4.isa);
  return 0;
}

- (BOOL)_validate:(id)a3 identifier:(id)a4 expectedClass:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    NSLog(&cfstr_Wlkplaybacksum_2.isa, v8);
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = NSStringFromClass(a5);
    v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    NSLog(&cfstr_Wlkplaybacksum_3.isa, v9, v11, v13);

    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)accountID
{
  return self->_accountID;
}

+ (int64_t)completionStateForDuration:(double)a3 elapsedTime:(double)a4
{
  [a1 playedThresholdTimeForDuration:a3];
  int64_t v6 = 2;
  if (v5 > a4) {
    int64_t v6 = 1;
  }
  if (v5 == 0.0) {
    return 0;
  }
  else {
    return v6;
  }
}

+ (double)playedThresholdTimeForDuration:(double)a3
{
  double v3 = 0.0;
  if (a3 > 0.0 && a3 != 3.40282347e38)
  {
    if (a3 < 10.0) {
      return a3;
    }
    if (a3 >= 900.0)
    {
      if (a3 >= 1800.0)
      {
        if (a3 >= 3900.0)
        {
          if (a3 >= 6000.0)
          {
            double v4 = -660.0;
            return a3 + v4;
          }
          unint64_t v5 = 0xC07E000000000000;
        }
        else
        {
          unint64_t v5 = 0xC06E000000000000;
        }
        double v4 = *(double *)&v5;
      }
      else
      {
        double v4 = -180.0;
      }
    }
    else
    {
      double v4 = -10.0;
    }
    return a3 + v4;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackRate, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_externalProfileID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_featureElapsedTime, 0);
  objc_storeStrong((id *)&self->_featureDuration, 0);
  objc_storeStrong((id *)&self->_elapsedTime, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_currentPlaybackDate, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_channelID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (id)VODSummaryWithBundleID:(id)a3 channelID:(id)a4 contentID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 duration:(id)a9 elapsedTime:(id)a10 playbackState:(int64_t)a11 playbackRate:(id)a12 completionState:(int64_t)a13
{
  return (id)[a1 VODSummaryWithBundleID:a3 channelID:a4 contentID:a5 accountID:a6 externalProfileID:a7 timestamp:a8 duration:a9 elapsedTime:a10 featureDuration:0 featureElapsedTime:0 playbackState:a11 playbackRate:a12 completionState:a13];
}

+ (id)VODSummaryWithBundleID:(id)a3 channelID:(id)a4 contentID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 duration:(id)a9 elapsedTime:(id)a10 featureDuration:(id)a11 featureElapsedTime:(id)a12 playbackState:(int64_t)a13 playbackRate:(id)a14 completionState:(int64_t)a15
{
  int64_t v20 = a15;
  id v41 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a10;
  id v28 = a11;
  id v42 = a12;
  id v29 = a14;
  id v30 = v29;
  if (!a15)
  {
    id v39 = v29;
    NSLog(&cfstr_Wlkplaybacksum_1.isa);
    if (v28 && v42)
    {
      [v28 doubleValue];
      double v32 = v31;
      id v33 = v42;
    }
    else
    {
      [v26 doubleValue];
      double v32 = v34;
      id v33 = v27;
    }
    [v33 doubleValue];
    int64_t v20 = +[WLKPlaybackSummary completionStateForDuration:v32 elapsedTime:v35];
    id v30 = v39;
  }
  LOWORD(v38) = 256;
  LOBYTE(v37) = 0;
  v40 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:]([WLKPlaybackSummary alloc], "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v41, v25, v26, v27, v28, v42, v24, v22, v23, a13, v30, v20, v37, 0, 0,
          0,
          v38,
          v21);

  return v40;
}

+ (id)liveSummaryWithBundleID:(id)a3 channelID:(id)a4 serviceID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 playbackState:(int64_t)a9 playbackRate:(id)a10 currentPlaybackDate:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  LOWORD(v28) = 256;
  LOBYTE(v27) = 1;
  id v25 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:]([WLKPlaybackSummary alloc], "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v24, v19, 0, 0, 0, 0, v20, 0, v21, a9, v18, 0, v27, v22, v17,
          2,
          v28,
          v23);

  return v25;
}

+ (id)EBSSummaryWithBundleID:(id)a3 channelID:(id)a4 externalId:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 playbackState:(int64_t)a9 playbackRate:(id)a10 currentPlaybackDate:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  LOWORD(v28) = 256;
  LOBYTE(v27) = 1;
  id v25 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:]([WLKPlaybackSummary alloc], "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v24, v19, 0, 0, 0, 0, v20, v22, v21, a9, v18, 0, v27, 0, v17,
          1,
          v28,
          v23);

  return v25;
}

- (NSNumber)accountIDAsNumber
{
  v2 = NSNumber;
  double v3 = [(WLKPlaybackSummary *)self accountID];
  double v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

  return (NSNumber *)v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (WLKPlaybackSummary *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(WLKPlaybackSummary *)self isEqualToSummary:v4];
  }

  return v5;
}

- (BOOL)isEqualToSummary:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && (int64_t playbackType = self->_playbackType, playbackType == [v4 playbackType])
    && (int64_t playbackState = self->_playbackState, playbackState == [v5 playbackState])
    && (int64_t completionState = self->_completionState, completionState == [v5 completionState])
    && (int isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == [v5 isAlwaysLive])
    && (int isTimerDerived = self->_isTimerDerived, isTimerDerived == [v5 isTimerDerived]))
  {
    bundleID = self->_bundleID;
    v12 = [v5 bundleID];
    if ([(NSString *)bundleID isEqualToString:v12])
    {
      accountID = self->_accountID;
      v14 = [v5 accountID];
      if ([(NSString *)accountID isEqualToString:v14])
      {
        timestamp = self->_timestamp;
        int v16 = [v5 timestamp];
        if ([(NSDate *)timestamp isEqualToDate:v16])
        {
          currentPlaybackDate = self->_currentPlaybackDate;
          id v18 = [v5 currentPlaybackDate];
          if ([(WLKPlaybackSummary *)self _compareOptional:currentPlaybackDate with:v18])
          {
            duration = self->_duration;
            id v20 = [v5 duration];
            if ([(WLKPlaybackSummary *)self _compareOptional:duration with:v20])
            {
              elapsedTime = self->_elapsedTime;
              id v22 = [v5 elapsedTime];
              if ([(WLKPlaybackSummary *)self _compareOptional:elapsedTime with:v22])
              {
                featureDuration = self->_featureDuration;
                id v24 = [v5 featureDuration];
                if ([(WLKPlaybackSummary *)self _compareOptional:featureDuration with:v24])
                {
                  featureElapsedTime = self->_featureElapsedTime;
                  uint64_t v26 = [v5 featureElapsedTime];
                  uint64_t v27 = featureElapsedTime;
                  uint64_t v28 = (void *)v26;
                  if ([(WLKPlaybackSummary *)self _compareOptional:v27 with:v26])
                  {
                    id v41 = v28;
                    externalProfileID = self->_externalProfileID;
                    v40 = [v5 externalProfileID];
                    if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", externalProfileID))
                    {
                      contentID = self->_contentID;
                      id v39 = [v5 contentID];
                      if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", contentID))
                      {
                        serviceID = self->_serviceID;
                        uint64_t v38 = [v5 serviceID];
                        if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", serviceID))
                        {
                          channelID = self->_channelID;
                          uint64_t v37 = [v5 channelID];
                          if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", channelID))
                          {
                            playbackRate = self->_playbackRate;
                            id v33 = [v5 playbackRate];
                            BOOL v34 = [(WLKPlaybackSummary *)self _compareOptional:playbackRate with:v33];
                          }
                          else
                          {
                            BOOL v34 = 0;
                          }
                        }
                        else
                        {
                          BOOL v34 = 0;
                        }
                      }
                      else
                      {
                        BOOL v34 = 0;
                      }
                    }
                    else
                    {
                      BOOL v34 = 0;
                    }

                    uint64_t v28 = v41;
                  }
                  else
                  {
                    BOOL v34 = 0;
                  }
                }
                else
                {
                  BOOL v34 = 0;
                }
              }
              else
              {
                BOOL v34 = 0;
              }
            }
            else
            {
              BOOL v34 = 0;
            }
          }
          else
          {
            BOOL v34 = 0;
          }
        }
        else
        {
          BOOL v34 = 0;
        }
      }
      else
      {
        BOOL v34 = 0;
      }
    }
    else
    {
      BOOL v34 = 0;
    }
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

- (BOOL)isEquivalentToSummaryExcludingCursor:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && (int64_t playbackType = self->_playbackType, playbackType == [v4 playbackType])
    && (int64_t playbackState = self->_playbackState, playbackState == [v5 playbackState])
    && (int64_t completionState = self->_completionState, completionState == [v5 completionState])
    && (int isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == [v5 isAlwaysLive]))
  {
    bundleID = self->_bundleID;
    BOOL v11 = [v5 bundleID];
    if ([(NSString *)bundleID isEqualToString:v11])
    {
      accountID = self->_accountID;
      BOOL v13 = [v5 accountID];
      if ([(NSString *)accountID isEqualToString:v13])
      {
        duration = self->_duration;
        uint64_t v15 = [v5 duration];
        if ([(WLKPlaybackSummary *)self _compareOptionalTemporalValue:duration with:v15 fuzzy:1])
        {
          featureDuration = self->_featureDuration;
          id v17 = [v5 featureDuration];
          if ([(WLKPlaybackSummary *)self _compareOptionalTemporalValue:featureDuration with:v17 fuzzy:1])
          {
            externalProfileID = self->_externalProfileID;
            id v19 = [v5 externalProfileID];
            if ([(WLKPlaybackSummary *)self _compareOptional:externalProfileID with:v19])
            {
              contentID = self->_contentID;
              id v21 = [v5 contentID];
              if ([(WLKPlaybackSummary *)self _compareOptional:contentID with:v21])
              {
                serviceID = self->_serviceID;
                id v23 = [v5 serviceID];
                if ([(WLKPlaybackSummary *)self _compareOptional:serviceID with:v23])
                {
                  channelID = self->_channelID;
                  id v29 = [v5 channelID];
                  if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", channelID))
                  {
                    playbackRate = self->_playbackRate;
                    id v25 = [v5 playbackRate];
                    BOOL v26 = [(WLKPlaybackSummary *)self _compareOptional:playbackRate with:v25];
                  }
                  else
                  {
                    BOOL v26 = 0;
                  }
                }
                else
                {
                  BOOL v26 = 0;
                }
              }
              else
              {
                BOOL v26 = 0;
              }
            }
            else
            {
              BOOL v26 = 0;
            }
          }
          else
          {
            BOOL v26 = 0;
          }
        }
        else
        {
          BOOL v26 = 0;
        }
      }
      else
      {
        BOOL v26 = 0;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)isEquivalentToSummaryExcludingTimestamp:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && (int64_t playbackType = self->_playbackType, playbackType == [v4 playbackType])
    && (int64_t playbackState = self->_playbackState, playbackState == [v5 playbackState])
    && (int64_t completionState = self->_completionState, completionState == [v5 completionState])
    && (int isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == [v5 isAlwaysLive])
    && (int isTimerDerived = self->_isTimerDerived, isTimerDerived == [v5 isTimerDerived]))
  {
    bundleID = self->_bundleID;
    v12 = [v5 bundleID];
    if ([(NSString *)bundleID isEqualToString:v12])
    {
      accountID = self->_accountID;
      v14 = [v5 accountID];
      if ([(NSString *)accountID isEqualToString:v14])
      {
        duration = self->_duration;
        int v16 = [v5 duration];
        if ([(WLKPlaybackSummary *)self _compareOptionalTemporalValue:duration with:v16 fuzzy:1])
        {
          elapsedTime = self->_elapsedTime;
          id v18 = [v5 elapsedTime];
          if ([(WLKPlaybackSummary *)self _compareOptionalTemporalValue:elapsedTime with:v18 fuzzy:1])
          {
            featureDuration = self->_featureDuration;
            id v20 = [v5 featureDuration];
            if ([(WLKPlaybackSummary *)self _compareOptionalTemporalValue:featureDuration with:v20 fuzzy:1])
            {
              featureElapsedTime = self->_featureElapsedTime;
              id v22 = [v5 featureElapsedTime];
              if ([(WLKPlaybackSummary *)self _compareOptionalTemporalValue:featureElapsedTime with:v22 fuzzy:1])
              {
                externalProfileID = self->_externalProfileID;
                id v24 = [v5 externalProfileID];
                if ([(WLKPlaybackSummary *)self _compareOptional:externalProfileID with:v24])
                {
                  contentID = self->_contentID;
                  uint64_t v26 = [v5 contentID];
                  uint64_t v27 = contentID;
                  uint64_t v28 = (void *)v26;
                  if ([(WLKPlaybackSummary *)self _compareOptional:v27 with:v26])
                  {
                    uint64_t v37 = v28;
                    serviceID = self->_serviceID;
                    v36 = [v5 serviceID];
                    if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", serviceID))
                    {
                      channelID = self->_channelID;
                      double v35 = [v5 channelID];
                      if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", channelID))
                      {
                        playbackRate = self->_playbackRate;
                        double v31 = [v5 playbackRate];
                        BOOL v32 = [(WLKPlaybackSummary *)self _compareOptional:playbackRate with:v31];
                      }
                      else
                      {
                        BOOL v32 = 0;
                      }
                    }
                    else
                    {
                      BOOL v32 = 0;
                    }

                    uint64_t v28 = v37;
                  }
                  else
                  {
                    BOOL v32 = 0;
                  }
                }
                else
                {
                  BOOL v32 = 0;
                }
              }
              else
              {
                BOOL v32 = 0;
              }
            }
            else
            {
              BOOL v32 = 0;
            }
          }
          else
          {
            BOOL v32 = 0;
          }
        }
        else
        {
          BOOL v32 = 0;
        }
      }
      else
      {
        BOOL v32 = 0;
      }
    }
    else
    {
      BOOL v32 = 0;
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)isSameContent:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && (int64_t playbackType = self->_playbackType, playbackType == [v4 playbackType])
    && (int isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == [v5 isAlwaysLive]))
  {
    bundleID = self->_bundleID;
    uint64_t v9 = [v5 bundleID];
    if ([(NSString *)bundleID isEqualToString:v9])
    {
      accountID = self->_accountID;
      BOOL v11 = [v5 accountID];
      if ([(NSString *)accountID isEqualToString:v11])
      {
        contentID = self->_contentID;
        BOOL v13 = [v5 contentID];
        if ([(WLKPlaybackSummary *)self _compareOptional:contentID with:v13])
        {
          serviceID = self->_serviceID;
          uint64_t v15 = [v5 serviceID];
          if ([(WLKPlaybackSummary *)self _compareOptional:serviceID with:v15])
          {
            channelID = self->_channelID;
            id v17 = [v5 channelID];
            if ([(WLKPlaybackSummary *)self _compareOptional:channelID with:v17])
            {
              externalProfileID = self->_externalProfileID;
              id v19 = [v5 externalProfileID];
              BOOL v20 = [(WLKPlaybackSummary *)self _compareOptional:externalProfileID with:v19];
            }
            else
            {
              BOOL v20 = 0;
            }
          }
          else
          {
            BOOL v20 = 0;
          }
        }
        else
        {
          BOOL v20 = 0;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  uint64_t v4 = [(NSDate *)self->_timestamp hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_duration hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_elapsedTime hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_contentID hash] ^ self->_playbackState ^ self->_playbackType;
  BOOL isAlwaysLive = self->_isAlwaysLive;
  NSUInteger v9 = isAlwaysLive ^ [(NSString *)self->_serviceID hash];
  return v7 ^ v9 ^ [(NSString *)self->_channelID hash];
}

- (BOOL)isLiveType
{
  return (unint64_t)(self->_playbackType - 1) < 2;
}

- (id)shortDescription
{
  channelID = self->_channelID;
  if (!channelID) {
    channelID = self->_bundleID;
  }
  contentID = self->_contentID;
  if (!contentID) {
    contentID = self->_serviceID;
  }
  int64_t completionState = self->_completionState;
  uint64_t v6 = contentID;
  NSUInteger v7 = channelID;
  id v8 = +[WLKPlaybackSummary debugStringForCompletionState:completionState];
  NSUInteger v9 = +[WLKPlaybackSummary _debugStringForPlaybackType:self->_playbackType];
  BOOL v10 = [NSString stringWithFormat:@"[%@:::%@] [%@] [%@]", v7, v6, v9, v8];
  BOOL v11 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)WLKPlaybackSummary;
  v12 = [(WLKPlaybackSummary *)&v15 description];

  BOOL v13 = [v11 stringWithFormat:@"%@ %@", v12, v10];

  return v13;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WLKPlaybackSummary;
  uint64_t v4 = [(WLKPlaybackSummary *)&v8 description];
  uint64_t v5 = [(WLKPlaybackSummary *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v46[17] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WLKPlaybackSummary debugStringForCompletionState:self->_completionState];
  uint64_t v4 = +[WLKPlaybackSummary debugStringForPlaybackState:self->_playbackState];
  uint64_t v5 = +[WLKPlaybackSummary _debugStringForPlaybackType:self->_playbackType];
  v45[0] = @"bundleID";
  uint64_t bundleID = (uint64_t)self->_bundleID;
  uint64_t v42 = bundleID;
  if (!bundleID)
  {
    uint64_t bundleID = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v34 = (void *)bundleID;
  v46[0] = bundleID;
  v45[1] = @"timestamp";
  uint64_t timestamp = (uint64_t)self->_timestamp;
  uint64_t v41 = timestamp;
  if (!timestamp)
  {
    uint64_t timestamp = [MEMORY[0x1E4F1CA98] null];
  }
  id v33 = (void *)timestamp;
  v46[1] = timestamp;
  v45[2] = @"duration";
  uint64_t duration = (uint64_t)self->_duration;
  uint64_t v40 = duration;
  if (!duration)
  {
    uint64_t duration = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v32 = (void *)duration;
  v46[2] = duration;
  v45[3] = @"elapsedTime";
  uint64_t elapsedTime = (uint64_t)self->_elapsedTime;
  uint64_t v39 = elapsedTime;
  if (!elapsedTime)
  {
    uint64_t elapsedTime = [MEMORY[0x1E4F1CA98] null];
  }
  double v31 = (void *)elapsedTime;
  v46[3] = elapsedTime;
  v45[4] = @"featureDuration";
  uint64_t featureDuration = (uint64_t)self->_featureDuration;
  uint64_t v38 = featureDuration;
  if (!featureDuration)
  {
    uint64_t featureDuration = [MEMORY[0x1E4F1CA98] null];
  }
  id v30 = (void *)featureDuration;
  v46[4] = featureDuration;
  v45[5] = @"featureElapsedTime";
  uint64_t featureElapsedTime = (uint64_t)self->_featureElapsedTime;
  uint64_t v37 = featureElapsedTime;
  if (!featureElapsedTime)
  {
    uint64_t featureElapsedTime = [MEMORY[0x1E4F1CA98] null];
  }
  id v29 = (void *)featureElapsedTime;
  v46[5] = featureElapsedTime;
  v45[6] = @"contentID";
  uint64_t contentID = (uint64_t)self->_contentID;
  uint64_t v36 = contentID;
  if (!contentID)
  {
    uint64_t contentID = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = (void *)contentID;
  v46[6] = contentID;
  v46[7] = v4;
  v45[7] = @"playbackState";
  v45[8] = @"playbackRate";
  playbackRate = self->_playbackRate;
  uint64_t v14 = (uint64_t)playbackRate;
  if (!playbackRate)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v43 = (void *)v4;
  v44 = (void *)v3;
  uint64_t v27 = (void *)v14;
  v46[8] = v14;
  v46[9] = v3;
  v45[9] = @"completionState";
  v45[10] = @"serviceID";
  serviceID = self->_serviceID;
  uint64_t v16 = (uint64_t)serviceID;
  if (!serviceID)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v16;
  v46[10] = v16;
  v45[11] = @"currentPlaybackDate";
  currentPlaybackDate = self->_currentPlaybackDate;
  id v18 = currentPlaybackDate;
  if (!currentPlaybackDate)
  {
    id v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v46[11] = v18;
  v45[12] = @"isAlwaysLive";
  id v19 = [NSNumber numberWithBool:self->_isAlwaysLive];
  v46[12] = v19;
  v46[13] = v5;
  BOOL v20 = (void *)v5;
  v45[13] = @"playbackType";
  v45[14] = @"isTimerDerived";
  id v21 = [NSNumber numberWithBool:self->_isTimerDerived];
  v46[14] = v21;
  v45[15] = @"isFromActivePlayerPath";
  id v22 = [NSNumber numberWithBool:self->_fromActivePlayerPath];
  v46[15] = v22;
  v45[16] = @"channelID";
  channelID = self->_channelID;
  id v24 = channelID;
  if (!channelID)
  {
    id v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v46[16] = v24;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:17];
  if (!channelID) {

  }
  if (currentPlaybackDate)
  {
    if (serviceID) {
      goto LABEL_27;
    }
  }
  else
  {

    if (serviceID) {
      goto LABEL_27;
    }
  }

LABEL_27:
  if (!playbackRate) {

  }
  if (!v36) {
  if (!v37)
  }

  if (!v38) {
  if (!v39)
  }

  if (!v40) {
  if (!v41)
  }

  if (!v42) {

  }
  return v35;
}

+ (id)debugStringForPlaybackState:(int64_t)a3
{
  uint64_t v3 = @"Playing";
  if (a3 == 2) {
    uint64_t v3 = @"Paused";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Stopped";
  }
}

+ (id)_debugStringForPlaybackType:(int64_t)a3
{
  uint64_t v3 = @"VOD";
  if (a3 == 1) {
    uint64_t v3 = @"EBS";
  }
  if (a3 == 2) {
    return @"Live";
  }
  else {
    return v3;
  }
}

- (id)JSONRepresentation
{
  uint64_t v3 = [(WLKPlaybackSummary *)self dictionaryRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [NSNumber numberWithInteger:self->_completionState];
  [v4 setObject:v5 forKeyedSubscript:@"completionStateValue"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_playbackState];
  [v4 setObject:v6 forKeyedSubscript:@"playbackStateValue"];

  NSUInteger v7 = [NSNumber numberWithInteger:self->_playbackType];
  [v4 setObject:v7 forKeyedSubscript:@"playbackTypeValue"];

  [v4 setObject:self->_accountID forKeyedSubscript:@"accountID"];

  return v4;
}

- (id)sanitizedCopy
{
  id v23 = [WLKPlaybackSummary alloc];
  id v18 = [(WLKPlaybackSummary *)self bundleID];
  id v22 = [(WLKPlaybackSummary *)self timestamp];
  id v21 = [(WLKPlaybackSummary *)self duration];
  BOOL v20 = [(WLKPlaybackSummary *)self elapsedTime];
  id v19 = [(WLKPlaybackSummary *)self featureDuration];
  id v17 = [(WLKPlaybackSummary *)self featureElapsedTime];
  uint64_t v3 = [(WLKPlaybackSummary *)self contentID];
  int64_t v16 = [(WLKPlaybackSummary *)self playbackState];
  objc_super v15 = [(WLKPlaybackSummary *)self playbackRate];
  int64_t v4 = [(WLKPlaybackSummary *)self completionState];
  BOOL v5 = [(WLKPlaybackSummary *)self isAlwaysLive];
  uint64_t v6 = [(WLKPlaybackSummary *)self serviceID];
  NSUInteger v7 = [(WLKPlaybackSummary *)self currentPlaybackDate];
  int64_t v8 = [(WLKPlaybackSummary *)self playbackType];
  BOOL v9 = [(WLKPlaybackSummary *)self isTimerDerived];
  BOOL v10 = [(WLKPlaybackSummary *)self isFromActivePlayerPath];
  BOOL v11 = [(WLKPlaybackSummary *)self channelID];
  BYTE1(v14) = v10;
  LOBYTE(v14) = v9;
  LOBYTE(v13) = v5;
  id v24 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:](v23, "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v18, v22, v21, v20, v19, v17, 0, v3, 0, v16, v15, v4, v13, v6, v7,
          v8,
          v14,
          v11);

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKPlaybackSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_8);
    }
    BOOL v5 = [(WLKPlaybackSummary *)self init];
    if (v5)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.bundleID"];
      uint64_t bundleID = v5->_bundleID;
      v5->_uint64_t bundleID = (NSString *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.timestamp"];
      uint64_t timestamp = v5->_timestamp;
      v5->_uint64_t timestamp = (NSDate *)v8;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.duration"];
      uint64_t duration = v5->_duration;
      v5->_uint64_t duration = (NSNumber *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.elapsedTime"];
      uint64_t elapsedTime = v5->_elapsedTime;
      v5->_uint64_t elapsedTime = (NSNumber *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.featureDuration"];
      uint64_t featureDuration = v5->_featureDuration;
      v5->_uint64_t featureDuration = (NSNumber *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.featureElapsedTime"];
      uint64_t featureElapsedTime = v5->_featureElapsedTime;
      v5->_uint64_t featureElapsedTime = (NSNumber *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.externalContentID"];
      uint64_t contentID = v5->_contentID;
      v5->_uint64_t contentID = (NSString *)v18;

      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.externalUserProfileID"];
      externalProfileID = v5->_externalProfileID;
      v5->_externalProfileID = (NSString *)v20;

      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.accountID"];
      accountID = v5->_accountID;
      v5->_accountID = (NSString *)v22;

      v5->_int64_t playbackState = [v4 decodeIntegerForKey:@"WLKPlaybackActivity.playbackState"];
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.playbackRate"];
      playbackRate = v5->_playbackRate;
      v5->_playbackRate = (NSNumber *)v24;

      v5->_int64_t completionState = [v4 decodeIntegerForKey:@"WLKPlaybackActivity.completionState"];
      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.serviceID"];
      serviceID = v5->_serviceID;
      v5->_serviceID = (NSString *)v26;

      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.currentPlaybackDate"];
      currentPlaybackDate = v5->_currentPlaybackDate;
      v5->_currentPlaybackDate = (NSDate *)v28;

      v5->_BOOL isAlwaysLive = [v4 decodeBoolForKey:@"WLKPlaybackActivity.isAlwaysLive"];
      v5->_int64_t playbackType = [v4 decodeIntegerForKey:@"WLKPlaybackActivity.playbackType"];
      v5->_int isTimerDerived = [v4 decodeBoolForKey:@"WLKPlaybackActivity.isTimerDerived"];
      v5->_fromActivePlayerPath = [v4 decodeBoolForKey:@"WLKPlaybackActivity.fromActivePlayerPath"];
      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKPlaybackActivity.channelID"];
      channelID = v5->_channelID;
      v5->_channelID = (NSString *)v30;
    }
    self = v5;
    BOOL v32 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    BOOL v32 = 0;
  }

  return v32;
}

void __36__WLKPlaybackSummary_initWithCoder___block_invoke()
{
  v0 = +[WLKProcessInfo currentProcessInfo];
  if ([v0 BOOLValueForEntitlement:@"com.apple.watchlist.private"]) {
    char v1 = 1;
  }
  else {
    char v1 = WLKIsDaemon();
  }
  initWithCoder__isEntitled = v1;

  if (!initWithCoder__isEntitled)
  {
    v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3B8];
    [v2 raise:v3 format:@"This process is not properly entitled for WatchListKit"];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_bundleID forKey:@"WLKPlaybackActivity.bundleID"];
  [v4 encodeObject:self->_timestamp forKey:@"WLKPlaybackActivity.timestamp"];
  [v4 encodeObject:self->_duration forKey:@"WLKPlaybackActivity.duration"];
  [v4 encodeObject:self->_elapsedTime forKey:@"WLKPlaybackActivity.elapsedTime"];
  [v4 encodeObject:self->_featureDuration forKey:@"WLKPlaybackActivity.featureDuration"];
  [v4 encodeObject:self->_featureElapsedTime forKey:@"WLKPlaybackActivity.featureElapsedTime"];
  [v4 encodeObject:self->_contentID forKey:@"WLKPlaybackActivity.externalContentID"];
  [v4 encodeObject:self->_externalProfileID forKey:@"WLKPlaybackActivity.externalUserProfileID"];
  [v4 encodeObject:self->_accountID forKey:@"WLKPlaybackActivity.accountID"];
  [v4 encodeInteger:self->_playbackState forKey:@"WLKPlaybackActivity.playbackState"];
  [v4 encodeObject:self->_playbackRate forKey:@"WLKPlaybackActivity.playbackRate"];
  [v4 encodeInteger:self->_completionState forKey:@"WLKPlaybackActivity.completionState"];
  [v4 encodeObject:self->_serviceID forKey:@"WLKPlaybackActivity.serviceID"];
  [v4 encodeObject:self->_currentPlaybackDate forKey:@"WLKPlaybackActivity.currentPlaybackDate"];
  [v4 encodeBool:self->_isAlwaysLive forKey:@"WLKPlaybackActivity.isAlwaysLive"];
  [v4 encodeInteger:self->_playbackType forKey:@"WLKPlaybackActivity.playbackType"];
  [v4 encodeBool:self->_isTimerDerived forKey:@"WLKPlaybackActivity.isTimerDerived"];
  [v4 encodeBool:self->_fromActivePlayerPath forKey:@"WLKPlaybackActivity.fromActivePlayerPath"];
  [v4 encodeObject:self->_channelID forKey:@"WLKPlaybackActivity.channelID"];
}

- (BOOL)_compareOptional:(id)a3 with:(id)a4
{
  if (a3 && a4) {
    return [a3 isEqual:a4];
  }
  else {
    return ((unint64_t)a3 | (unint64_t)a4) == 0;
  }
}

- (BOOL)_compareOptionalTemporalValue:(id)a3 with:(id)a4 fuzzy:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(id)v7 floatValue];
    float v10 = v9;
    [(id)v8 floatValue];
    char v12 = vabds_f32(v10, v11) <= 0.1;
  }
  else if (v7 && v8)
  {
    char v12 = [(id)v7 isEqual:v8];
  }
  else
  {
    char v12 = (v7 | v8) == 0;
  }

  return v12;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDate)currentPlaybackDate
{
  return self->_currentPlaybackDate;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)elapsedTime
{
  return self->_elapsedTime;
}

- (NSNumber)featureDuration
{
  return self->_featureDuration;
}

- (NSNumber)featureElapsedTime
{
  return self->_featureElapsedTime;
}

- (NSString)externalProfileID
{
  return self->_externalProfileID;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (NSNumber)playbackRate
{
  return self->_playbackRate;
}

- (int64_t)completionState
{
  return self->_completionState;
}

- (int64_t)playbackType
{
  return self->_playbackType;
}

- (BOOL)isAlwaysLive
{
  return self->_isAlwaysLive;
}

- (void)setIsAlwaysLive:(BOOL)a3
{
  self->_BOOL isAlwaysLive = a3;
}

- (BOOL)isTimerDerived
{
  return self->_isTimerDerived;
}

- (void)setIsTimerDerived:(BOOL)a3
{
  self->_int isTimerDerived = a3;
}

- (BOOL)isFromActivePlayerPath
{
  return self->_fromActivePlayerPath;
}

- (void)setFromActivePlayerPath:(BOOL)a3
{
  self->_fromActivePlayerPath = a3;
}

- (void)resolveChannelID:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  BOOL v5 = [(WLKPlaybackSummary *)self channelID];

  if (v5)
  {
    id v6 = [(WLKPlaybackSummary *)self channelID];
    v4[2](v4, v6, 0);
  }
  else
  {
    unint64_t v7 = +[WLKChannelUtilities sharedInstanceFiltered];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__WLKPlaybackSummary_ChannelID__resolveChannelID___block_invoke;
    v8[3] = &unk_1E620A998;
    v8[4] = self;
    id v9 = v7;
    float v10 = v4;
    id v6 = v7;
    [v6 loadIfNeededWithCompletion:v8];
  }
}

void __50__WLKPlaybackSummary_ChannelID__resolveChannelID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v8 = [*(id *)(a1 + 32) bundleID];
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "channelForBundleID:");
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      id v6 = [v3 channelID];
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
    }
    else
    {
      id v6 = WLKError(0, 0, @"channel not found");
      (*(void (**)(void, void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v6);
    }
  }
  else
  {
    unint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

+ (id)debugStringForCompletionState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E620B610[a3];
  }
}

- (id)elapsedTimeSummaryWithPlaybackState:(int64_t)a3 timerDerived:(BOOL)a4
{
  double v7 = 0.0;
  if ([(WLKPlaybackSummary *)self playbackState] == 1)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [(WLKPlaybackSummary *)self timestamp];
    [v8 timeIntervalSinceDate:v9];
    double v7 = v10;
  }
  float v11 = [(WLKPlaybackSummary *)self elapsedTime];
  [v11 doubleValue];
  double v13 = v7 + v12;

  uint64_t v14 = [(WLKPlaybackSummary *)self duration];
  [v14 doubleValue];
  double v16 = fmin(v13, v15);

  uint64_t v17 = [NSNumber numberWithDouble:v16];
  uint64_t v18 = [(WLKPlaybackSummary *)self featureElapsedTime];
  BOOL v49 = a4;
  v48 = (void *)v17;
  if (v18
    && (id v19 = (void *)v18,
        [(WLKPlaybackSummary *)self featureDuration],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    id v21 = [(WLKPlaybackSummary *)self featureElapsedTime];
    [v21 doubleValue];
    double v23 = v7 + v22;

    uint64_t v24 = [(WLKPlaybackSummary *)self featureDuration];
    [v24 doubleValue];
    double v26 = fmin(v23, v25);

    uint64_t v39 = [NSNumber numberWithDouble:v26];
  }
  else
  {
    uint64_t v39 = 0;
  }
  uint64_t v27 = [(WLKPlaybackSummary *)self duration];
  [v27 doubleValue];
  int64_t v47 = +[WLKPlaybackSummary completionStateForDuration:elapsedTime:](WLKPlaybackSummary, "completionStateForDuration:elapsedTime:");

  id v46 = [WLKPlaybackSummary alloc];
  uint64_t v45 = [(WLKPlaybackSummary *)self bundleID];
  v44 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v43 = [(WLKPlaybackSummary *)self duration];
  uint64_t v42 = [(WLKPlaybackSummary *)self featureDuration];
  uint64_t v28 = [(WLKPlaybackSummary *)self externalProfileID];
  id v29 = [(WLKPlaybackSummary *)self contentID];
  uint64_t v41 = [(WLKPlaybackSummary *)self accountID];
  if (a3 == 1) {
    uint64_t v30 = &unk_1F13D9920;
  }
  else {
    uint64_t v30 = &unk_1F13D9938;
  }
  BOOL v31 = [(WLKPlaybackSummary *)self isAlwaysLive];
  uint64_t v40 = [(WLKPlaybackSummary *)self serviceID];
  BOOL v32 = [(WLKPlaybackSummary *)self currentPlaybackDate];
  int64_t v33 = [(WLKPlaybackSummary *)self playbackType];
  BOOL v34 = [(WLKPlaybackSummary *)self isFromActivePlayerPath];
  id v35 = [(WLKPlaybackSummary *)self channelID];
  BYTE1(v38) = v34;
  LOBYTE(v38) = v49;
  LOBYTE(v37) = v31;
  v50 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:](v46, "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v45, v44, v43, v48, v42, v39, v28, v29, v41, a3, v30, v47, v37, v40, v32,
          v33,
          v38,
          v35);

  return v50;
}

@end