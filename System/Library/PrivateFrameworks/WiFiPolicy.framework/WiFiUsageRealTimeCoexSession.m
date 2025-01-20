@interface WiFiUsageRealTimeCoexSession
- (BOOL)hasCandidates;
- (BOOL)hasDifferentIpv4DetailsAfterSSIDTransition;
- (BOOL)hasDifferentIpv6DetailsAfterSSIDTransition;
- (BOOL)infraIsPartOfSplitSSID;
- (BOOL)isCurrentBandPreferredBand;
- (BOOL)isCurrentChannelPreferredChannel;
- (BOOL)isRtCoexOptimal;
- (BOOL)isSplitSSID;
- (BOOL)lastRequestDifferentSSID;
- (NSDate)firstIPUpdateAfterSSIDTransition;
- (NSDate)firstManualJoin;
- (NSDate)firstManualJoinAfterSSIDTransition;
- (NSDate)firstRtCoexOptimal;
- (NSDate)firstSSIDTransition;
- (NSDate)lastEnterPreferredBand;
- (NSDate)lastEnterPreferredChannel;
- (NSDate)lastRtCoexOptimalStatusChange;
- (NSString)lastRequestPreferredBSS;
- (NSString)lastRequestPreferredSSID;
- (NSString)rtCoexSubType;
- (WiFiUsageRealTimeCoexSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (double)preferredBandDuration;
- (double)preferredChannelDuration;
- (double)rtCoexInOptimalDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventDictionary:(BOOL)a3;
- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4;
- (id)metricName;
- (int)lastRequestPreferredBand;
- (unint64_t)lastRequestPreferredChannel;
- (unint64_t)lastRequestType;
- (unint64_t)requestDisconnectCount;
- (unint64_t)requestSteerCount;
- (unint64_t)requestSteerToPreferredChannelCount;
- (unint64_t)rtCoexType;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)processIPv4Changes:(id)a3;
- (void)processIPv6Changes:(id)a3;
- (void)sessionDidStart;
- (void)setFirstIPUpdateAfterSSIDTransition:(id)a3;
- (void)setFirstManualJoin:(id)a3;
- (void)setFirstManualJoinAfterSSIDTransition:(id)a3;
- (void)setFirstRtCoexOptimal:(id)a3;
- (void)setFirstSSIDTransition:(id)a3;
- (void)setHasCandidates:(BOOL)a3;
- (void)setHasDifferentIpv4DetailsAfterSSIDTransition:(BOOL)a3;
- (void)setHasDifferentIpv6DetailsAfterSSIDTransition:(BOOL)a3;
- (void)setIsRtCoexOptimal:(BOOL)a3;
- (void)setIsSplitSSID:(BOOL)a3;
- (void)setLastEnterPreferredBand:(id)a3;
- (void)setLastEnterPreferredChannel:(id)a3;
- (void)setLastRequestDifferentSSID:(BOOL)a3;
- (void)setLastRequestPreferredBSS:(id)a3;
- (void)setLastRequestPreferredBand:(int)a3;
- (void)setLastRequestPreferredChannel:(unint64_t)a3;
- (void)setLastRequestPreferredSSID:(id)a3;
- (void)setLastRequestType:(unint64_t)a3;
- (void)setLastRtCoexOptimalStatusChange:(id)a3;
- (void)setPreferredBandDuration:(double)a3;
- (void)setPreferredChannelAndBandUsageWithReferenceDate:(id)a3;
- (void)setPreferredChannelDuration:(double)a3;
- (void)setRealTimeCoexStatus:(BOOL)a3 type:(unint64_t)a4;
- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5;
- (void)setRequestDisconnectCount:(unint64_t)a3;
- (void)setRequestSteerCount:(unint64_t)a3;
- (void)setRequestSteerToPreferredChannelCount:(unint64_t)a3;
- (void)setRtCoexInOptimalDuration:(double)a3;
- (void)setRtCoexSubType:(id)a3;
- (void)setRtCoexType:(unint64_t)a3;
- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10;
- (void)summarizeSession;
- (void)updateAssociatedNetworkDetails:(id)a3;
- (void)updatePreferredChannelAndBandUsageWithReferenceDate:(id)a3;
- (void)updateRtCoexInOptimalDuration:(BOOL)a3;
@end

@implementation WiFiUsageRealTimeCoexSession

- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  BOOL v6 = a3;
  id v16 = a5;
  if ([(WiFiUsageSession *)self isSessionActive] && !v6)
  {
    v8 = [(WiFiUsageSession *)self sessionName];
    NSLog(&cfstr_SSessionEnded.isa, "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]", v8);

    [(WiFiUsageSession *)self sessionDidEnd];
  }
  if (v6)
  {
    BOOL v9 = [(WiFiUsageSession *)self isSessionActive];
    v10 = [(WiFiUsageSession *)self sessionName];
    v11 = +[WiFiUsagePrivacyFilter getLabelForRTCoexType:a4];
    uint64_t v12 = [v16 componentsJoinedByString:@"&"];
    v13 = (void *)v12;
    if (v9)
    {
      NSLog(&cfstr_SSessionAlread.isa, "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]", v10, v11, v12);
    }
    else
    {
      NSLog(&cfstr_SSessionStarte_0.isa, "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]", v10, v11, v12);

      self->_rtCoexType = a4;
      v14 = [v16 componentsJoinedByString:@"&"];
      rtCoexSubType = self->_rtCoexSubType;
      self->_rtCoexSubType = v14;

      [(WiFiUsageRealTimeCoexSession *)self sessionDidStart];
    }
  }
}

- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10
{
  BOOL v11 = a7;
  uint64_t v12 = *(void *)&a5;
  v15 = (NSString *)a6;
  id v16 = (NSString *)a8;
  v17 = +[WiFiUsagePrivacyFilter getLabelForSteeringRequest:a3];
  uint64_t v18 = +[WiFiUsagePrivacyFilter bandAsString:v12];
  v19 = (void *)v18;
  v20 = @"NO";
  BOOL v28 = v11;
  if (v11) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  if (a9) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  if (a10) {
    v20 = @"YES";
  }
  NSLog(&cfstr_STypeLuPreferr.isa, "-[WiFiUsageRealTimeCoexSession setSteeringRequest:preferredChannel:preferredBand:preferredSSID:targetSSIDDiffersFromCurrent:preferredBSS:ssidIsSplit:transitionCandidates:]", v17, a3, a4, v18, v15, v21, v16, v22, v20);

  self->_lastRequestType = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
    self->_lastRequestPreferredChannel = a4;
  }
  if (v12 != 3) {
    self->_lastRequestPreferredBand = v12;
  }
  lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
  self->_lastRequestPreferredSSID = v15;
  v24 = v15;

  self->_lastRequestDifferentSSID = v28;
  lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
  self->_lastRequestPreferredBSS = v16;

  self->_isSplitSSID = a9;
  self->_hasCandidates = a10;
  if (a3 <= 2)
  {
    uint64_t v26 = *off_1E69BE608[a3];
    ++*(Class *)((char *)&self->super.super.isa + v26);
  }
}

- (void)updateRtCoexInOptimalDuration:(BOOL)a3
{
  if (self->_lastRtCoexOptimalStatusChange) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "now", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 timeIntervalSinceDate:self->_lastRtCoexOptimalStatusChange];
    self->_rtCoexInOptimalDuration = v5 + self->_rtCoexInOptimalDuration;
  }
}

- (void)setRealTimeCoexStatus:(BOOL)a3 type:(unint64_t)a4
{
  BOOL v5 = a3;
  v7 = [MEMORY[0x1E4F1C9C8] now];
  if ((!self->_lastRtCoexOptimalStatusChange || self->_isRtCoexOptimal && !v5)
    && ([(WiFiUsageRealTimeCoexSession *)self updateRtCoexInOptimalDuration:v5],
        [(WiFiUsageRealTimeCoexSession *)self setLastRtCoexOptimalStatusChange:v7],
        !self->_lastRtCoexOptimalStatusChange)
    || (!self->_isRtCoexOptimal ? (BOOL v8 = !v5) : (BOOL v8 = 1), !v8))
  {
    [(WiFiUsageRealTimeCoexSession *)self setLastRtCoexOptimalStatusChange:v7];
  }
  self->_isRtCoexOptimal = v5;
  if (self->_firstRtCoexOptimal) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v5;
  }
  if (!v9) {
    objc_storeStrong((id *)&self->_firstRtCoexOptimal, v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v10 setRealTimeCoexStatus:v5 type:a4];
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a7;
  v14 = [v12 now];
  [(WiFiUsageRealTimeCoexSession *)self updatePreferredChannelAndBandUsageWithReferenceDate:v14];
  v15.receiver = self;
  v15.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v15 linkStateDidChange:v10 isInvoluntary:v9 linkChangeReason:a5 linkChangeSubreason:a6 withNetworkDetails:v13];

  [(WiFiUsageRealTimeCoexSession *)self setPreferredChannelAndBandUsageWithReferenceDate:v14];
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (v12 && a4 == 12)
  {
    if (!self->_firstSSIDTransition)
    {
      v14 = [MEMORY[0x1E4F1C9C8] now];
      firstSSIDTransition = self->_firstSSIDTransition;
      self->_firstSSIDTransition = v14;
LABEL_12:
    }
  }
  else if (v12 && a4 == 2)
  {
    if (!self->_firstManualJoin)
    {
      id v16 = [MEMORY[0x1E4F1C9C8] now];
      firstManualJoin = self->_firstManualJoin;
      self->_firstManualJoin = v16;
    }
    if (self->_firstSSIDTransition && !self->_firstManualJoinAfterSSIDTransition)
    {
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
      firstSSIDTransition = self->_firstManualJoinAfterSSIDTransition;
      self->_firstManualJoinAfterSSIDTransition = v18;
      goto LABEL_12;
    }
  }
  NSLog(&cfstr_SFirstssidtran.isa, "-[WiFiUsageRealTimeCoexSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]", self->_firstSSIDTransition, self->_firstManualJoinAfterSSIDTransition, self->_firstManualJoin);
  v19.receiver = self;
  v19.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v19 joinStateDidChange:v12 withReason:a4 lastDisconnectReason:a5 lastJoinFailure:a6 andNetworkDetails:v13];
}

- (void)processIPv4Changes:(id)a3
{
  id v4 = a3;
  if ([(WiFiUsageSession *)self lastJoinReason] == 12)
  {
    BOOL v5 = [(WiFiUsageSession *)self ipV4Details];
    self->_hasDifferentIpv4DetailsAfterSSIDTransition = [v5 isEqual:v4] ^ 1;

    id v6 = [MEMORY[0x1E4F1C9C8] now];
    firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
    self->_firstIPUpdateAfterSSIDTransition = v6;
  }
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
  BOOL v8 = objc_msgSend(-[WiFiUsageRealTimeCoexSession class](&v10, sel_class), "joinReasonString:", -[WiFiUsageSession lastJoinReason](self, "lastJoinReason"));
  NSLog(&cfstr_SLastjoinreaso.isa, "-[WiFiUsageRealTimeCoexSession processIPv4Changes:]", v8, self->_firstIPUpdateAfterSSIDTransition);

  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v9 processIPv4Changes:v4];
}

- (void)processIPv6Changes:(id)a3
{
  id v4 = a3;
  if ([(WiFiUsageSession *)self lastJoinReason] == 12)
  {
    BOOL v5 = [(WiFiUsageSession *)self ipV6Details];
    self->_hasDifferentIpv6DetailsAfterSSIDTransition = [v5 isEqual:v4] ^ 1;
  }
  if (!self->_firstIPUpdateAfterSSIDTransition)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
    self->_firstIPUpdateAfterSSIDTransition = v6;

    v10.receiver = self;
    v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
    BOOL v8 = objc_msgSend(-[WiFiUsageRealTimeCoexSession class](&v10, sel_class), "joinReasonString:", -[WiFiUsageSession lastJoinReason](self, "lastJoinReason"));
    NSLog(&cfstr_SLastjoinreaso.isa, "-[WiFiUsageRealTimeCoexSession processIPv6Changes:]", v8, self->_firstIPUpdateAfterSSIDTransition);
  }
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v9 processIPv6Changes:v4];
}

- (void)summarizeSession
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] now];
  [(WiFiUsageRealTimeCoexSession *)self updateRtCoexInOptimalDuration:self->_isRtCoexOptimal];
  [(WiFiUsageRealTimeCoexSession *)self updatePreferredChannelAndBandUsageWithReferenceDate:v3];
  [(WiFiUsageRealTimeCoexSession *)self setPreferredChannelAndBandUsageWithReferenceDate:v3];
  v4.receiver = self;
  v4.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v4 summarizeSession];
}

- (id)eventDictionary:(BOOL)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CA60];
  v70.receiver = self;
  v70.super_class = (Class)WiFiUsageRealTimeCoexSession;
  BOOL v5 = [(WiFiUsageSession *)&v70 eventDictionary:a3];
  id v6 = [v4 dictionaryWithDictionary:v5];

  if (v6)
  {
    firstSSIDTransition = self->_firstSSIDTransition;
    BOOL v8 = [(WiFiUsageSession *)self sessionStartTime];
    [(NSDate *)firstSSIDTransition timeIntervalSinceDate:v8];
    double v10 = v9;

    [(NSDate *)self->_firstIPUpdateAfterSSIDTransition timeIntervalSinceDate:self->_firstSSIDTransition];
    double v12 = v11;
    firstManualJoin = self->_firstManualJoin;
    v14 = [(WiFiUsageSession *)self sessionStartTime];
    [(NSDate *)firstManualJoin timeIntervalSinceDate:v14];
    double v16 = v15;

    [(NSDate *)self->_firstManualJoinAfterSSIDTransition timeIntervalSinceDate:self->_firstSSIDTransition];
    double v18 = v17;
    objc_super v19 = +[WiFiUsagePrivacyFilter getLabelForRTCoexType:self->_rtCoexType];
    [v6 setObject:v19 forKeyedSubscript:@"coexSessionTrigger"];

    [v6 setObject:self->_rtCoexSubType forKeyedSubscript:@"coexSessionReason"];
    v20 = +[WiFiUsagePrivacyFilter getLabelForSteeringRequest:self->_lastRequestType];
    [v6 setObject:v20 forKeyedSubscript:@"coexSteeringLastRequestType"];

    if (self->_firstSSIDTransition)
    {
      v21 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:v10];
      [v6 setObject:v21 forKeyedSubscript:@"timeToSSIDTransition"];
    }
    if (self->_firstIPUpdateAfterSSIDTransition)
    {
      v22 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:v12];
      [v6 setObject:v22 forKeyedSubscript:@"timeToCompleteDHCP"];
    }
    if (self->_firstManualJoin)
    {
      v23 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:v16];
      [v6 setObject:v23 forKeyedSubscript:@"timeToManualJoinAttempt"];
    }
    if (self->_firstManualJoinAfterSSIDTransition)
    {
      v24 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:v18];
      [v6 setObject:v24 forKeyedSubscript:@"timeSSIDTransitionToManualJoinAttempt"];
    }
    if (self->_lastRequestPreferredBand != 3)
    {
      v25 = +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:");
      [v6 setObject:v25 forKeyedSubscript:@"coexSteeringRequestLastPreferredBand"];

      uint64_t v26 = NSNumber;
      int lastRequestPreferredBand = self->_lastRequestPreferredBand;
      BOOL v28 = [(WiFiUsageSession *)self networkDetails];
      v29 = [v28 connectedBss];
      v30 = objc_msgSend(v26, "numberWithBool:", lastRequestPreferredBand == objc_msgSend(v29, "band"));
      [v6 setObject:v30 forKeyedSubscript:@"bandAtEndIsTargetBand"];

      double preferredBandDuration = self->_preferredBandDuration;
      [(WiFiUsageSession *)self sessionDuration];
      v33 = +[WiFiUsagePrivacyFilter timePercentage:preferredBandDuration overTotalDuration:v32];
      [v6 setObject:v33 forKeyedSubscript:@"durationOnPreferredBandPerc"];

      if (self->_lastRequestPreferredChannel != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageRealTimeCoexSession isCurrentChannelPreferredChannel](self, "isCurrentChannelPreferredChannel"));
        [v6 setObject:v34 forKeyedSubscript:@"channelAtEndIsTargetChannel"];

        double preferredChannelDuration = self->_preferredChannelDuration;
        [(WiFiUsageSession *)self sessionDuration];
        v37 = +[WiFiUsagePrivacyFilter timePercentage:preferredChannelDuration overTotalDuration:v36];
        [v6 setObject:v37 forKeyedSubscript:@"durationOnPreferredChannelPerc"];
      }
    }
    if (self->_lastRequestType != 3)
    {
      v38 = [NSNumber numberWithBool:self->_lastRequestPreferredSSID != 0];
      [v6 setObject:v38 forKeyedSubscript:@"coexSteeringLastRequestHasPreferredSSID"];

      if (self->_lastRequestPreferredSSID)
      {
        v39 = [NSNumber numberWithBool:self->_lastRequestDifferentSSID];
        [v6 setObject:v39 forKeyedSubscript:@"coexSteeringLastRequestPreferredSSIDDiffers"];

        v40 = NSNumber;
        lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
        v42 = [(WiFiUsageSession *)self networkDetails];
        v43 = [v42 networkName];
        v44 = objc_msgSend(v40, "numberWithBool:", -[NSString isEqualToString:](lastRequestPreferredSSID, "isEqualToString:", v43));
        [v6 setObject:v44 forKeyedSubscript:@"ssidAtEndIsTargetSSID"];
      }
      lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
      if (lastRequestPreferredBSS)
      {
        v46 = NSNumber;
        v47 = [(WiFiUsageSession *)self networkDetails];
        v48 = [v47 connectedBss];
        v49 = [v48 bssid];
        v50 = objc_msgSend(v46, "numberWithBool:", -[NSString isEqualToString:](lastRequestPreferredBSS, "isEqualToString:", v49));
        [v6 setObject:v50 forKeyedSubscript:@"bssAtEndIsTargetBSS"];

        BOOL v51 = self->_lastRequestPreferredBSS != 0;
      }
      else
      {
        BOOL v51 = 0;
      }
      v52 = [NSNumber numberWithBool:v51];
      [v6 setObject:v52 forKeyedSubscript:@"coexSteeringLastRequestHasPreferredBSS"];
    }
    v53 = [NSNumber numberWithUnsignedInteger:self->_requestSteerToPreferredChannelCount];
    [v6 setObject:v53 forKeyedSubscript:@"requestSteerToPreferredChannelCount"];

    v54 = [NSNumber numberWithUnsignedInteger:self->_requestSteerCount];
    [v6 setObject:v54 forKeyedSubscript:@"requestSteerCount"];

    v55 = [NSNumber numberWithUnsignedInteger:self->_requestDisconnectCount];
    [v6 setObject:v55 forKeyedSubscript:@"requestDisconnect"];

    firstRtCoexOptimal = self->_firstRtCoexOptimal;
    if (firstRtCoexOptimal)
    {
      v57 = [(WiFiUsageSession *)self sessionStartTime];
      [(NSDate *)firstRtCoexOptimal timeIntervalSinceDate:v57];
      double v59 = v58;

      v60 = +[WiFiUsagePrivacyFilter getBinFor:(unint64_t)v59 In:&unk_1F2B95578 WithLowestEdge:@"0" As:1];
      [v6 setObject:v60 forKeyedSubscript:@"timeToOptimalCoex"];

      v61 = [NSNumber numberWithDouble:v59];
      [v6 setObject:v61 forKeyedSubscript:@"timeToOptimalCoex_raw"];

      [(WiFiUsageSession *)self sessionDuration];
      v63 = +[WiFiUsagePrivacyFilter timePercentage:v59 overTotalDuration:v62];
      [v6 setObject:v63 forKeyedSubscript:@"timeToOptimalCoexPercSession"];

      double rtCoexInOptimalDuration = self->_rtCoexInOptimalDuration;
      [(WiFiUsageSession *)self sessionDuration];
      v66 = +[WiFiUsagePrivacyFilter timePercentage:rtCoexInOptimalDuration overTotalDuration:v65];
      [v6 setObject:v66 forKeyedSubscript:@"inOptimalCoexPercSession"];

      v67 = [NSNumber numberWithDouble:self->_rtCoexInOptimalDuration];
      [v6 setObject:v67 forKeyedSubscript:@"inOptimalCoexDuration"];
    }
    id v68 = v6;
  }

  return v6;
}

- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
  id v6 = [(WiFiUsageSession *)&v10 eventDictionaryByBand:*(void *)&a3 isFirst:a4];
  v7 = [v5 dictionaryWithDictionary:v6];

  BOOL v8 = [(WiFiUsageRealTimeCoexSession *)self eventDictionary:1];
  [v7 addEntriesFromDictionary:v8];

  return v7;
}

- (WiFiUsageRealTimeCoexSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageRealTimeCoexSession;
  return [(WiFiUsageSession *)&v5 initWithSessionType:8 andInterfaceName:a3 andCapabilities:a4];
}

- (void)sessionDidStart
{
  v13.receiver = self;
  v13.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v13 sessionDidStart];
  self->_lastRequestType = 3;
  self->_lastRequestPreferredChannel = 0x7FFFFFFFFFFFFFFFLL;
  self->_int lastRequestPreferredBand = 3;
  lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
  self->_lastRequestPreferredSSID = 0;

  self->_lastRequestDifferentSSID = 0;
  lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
  self->_lastRequestPreferredBSS = 0;

  self->_isSplitSSID = 0;
  self->_hasCandidates = 0;
  self->_isRtCoexOptimal = 1;
  firstRtCoexOptimal = self->_firstRtCoexOptimal;
  self->_firstRtCoexOptimal = 0;

  lastRtCoexOptimalStatusChange = self->_lastRtCoexOptimalStatusChange;
  self->_lastRtCoexOptimalStatusChange = 0;

  self->_double rtCoexInOptimalDuration = 0.0;
  self->_requestSteerToPreferredChannelCount = 0;
  self->_requestSteerCount = 0;
  self->_requestDisconnectCount = 0;
  lastEnterPreferredChannel = self->_lastEnterPreferredChannel;
  self->_lastEnterPreferredChannel = 0;

  self->_double preferredChannelDuration = 0.0;
  lastEnterPreferredBand = self->_lastEnterPreferredBand;
  self->_lastEnterPreferredBand = 0;

  self->_double preferredBandDuration = 0.0;
  firstSSIDTransition = self->_firstSSIDTransition;
  self->_firstSSIDTransition = 0;

  firstManualJoin = self->_firstManualJoin;
  self->_firstManualJoin = 0;

  firstManualJoinAfterSSIDTransition = self->_firstManualJoinAfterSSIDTransition;
  self->_firstManualJoinAfterSSIDTransition = 0;

  firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
  self->_firstIPUpdateAfterSSIDTransition = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageRealTimeCoexSession;
  objc_super v4 = [(WiFiUsageSession *)&v8 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4)
  {
    v4[1493] = self->_rtCoexType;
    objc_storeStrong(v4 + 1494, self->_rtCoexSubType);
    v5[1495] = self->_lastRequestType;
    v5[1496] = self->_lastRequestPreferredChannel;
    *((_DWORD *)v5 + 2984) = self->_lastRequestPreferredBand;
    objc_storeStrong(v5 + 1497, self->_lastRequestPreferredSSID);
    objc_storeStrong(v5 + 1498, self->_lastRequestPreferredBSS);
    *((unsigned char *)v5 + 11929) = self->_isSplitSSID;
    *((unsigned char *)v5 + 11930) = self->_hasCandidates;
    *((unsigned char *)v5 + 11933) = self->_isRtCoexOptimal;
    objc_storeStrong(v5 + 1499, self->_firstRtCoexOptimal);
    objc_storeStrong(v5 + 1500, self->_lastRtCoexOptimalStatusChange);
    v5[1501] = *(id *)&self->_rtCoexInOptimalDuration;
    v5[1510] = self->_requestSteerToPreferredChannelCount;
    v5[1511] = self->_requestSteerCount;
    v5[1512] = self->_requestDisconnectCount;
    objc_storeStrong(v5 + 1502, self->_lastEnterPreferredChannel);
    v5[1503] = *(id *)&self->_preferredChannelDuration;
    objc_storeStrong(v5 + 1504, self->_lastEnterPreferredBand);
    v5[1505] = *(id *)&self->_preferredBandDuration;
    objc_storeStrong(v5 + 1506, self->_firstSSIDTransition);
    objc_storeStrong(v5 + 1507, self->_firstIPUpdateAfterSSIDTransition);
    objc_storeStrong(v5 + 1508, self->_firstManualJoin);
    objc_storeStrong(v5 + 1509, self->_firstManualJoinAfterSSIDTransition);
    id v6 = v5;
  }

  return v5;
}

- (id)metricName
{
  return @"com.apple.wifi.InfraRealTimeCoexSession";
}

- (BOOL)isCurrentChannelPreferredChannel
{
  if (self->_lastRequestPreferredBand == 3) {
    return 0;
  }
  unint64_t lastRequestPreferredChannel = self->_lastRequestPreferredChannel;
  if (lastRequestPreferredChannel == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  objc_super v5 = [(WiFiUsageSession *)self networkDetails];
  id v6 = [v5 connectedBss];
  if (lastRequestPreferredChannel == [v6 channel])
  {
    int lastRequestPreferredBand = self->_lastRequestPreferredBand;
    objc_super v8 = [(WiFiUsageSession *)self networkDetails];
    double v9 = [v8 connectedBss];
    BOOL v4 = lastRequestPreferredBand == [v9 band];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isCurrentBandPreferredBand
{
  int lastRequestPreferredBand = self->_lastRequestPreferredBand;
  if (lastRequestPreferredBand == 3) {
    return 0;
  }
  BOOL v4 = [(WiFiUsageSession *)self networkDetails];
  objc_super v5 = [v4 connectedBss];
  BOOL v3 = lastRequestPreferredBand == [v5 band];

  return v3;
}

- (void)updateAssociatedNetworkDetails:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  [(WiFiUsageRealTimeCoexSession *)self updatePreferredChannelAndBandUsageWithReferenceDate:v6];
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageRealTimeCoexSession;
  [(WiFiUsageSession *)&v7 updateAssociatedNetworkDetails:v5];

  [(WiFiUsageRealTimeCoexSession *)self setPreferredChannelAndBandUsageWithReferenceDate:v6];
}

- (void)updatePreferredChannelAndBandUsageWithReferenceDate:(id)a3
{
  id v8 = a3;
  if ([(WiFiUsageRealTimeCoexSession *)self isCurrentChannelPreferredChannel]
    && self->_lastEnterPreferredChannel)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    self->_double preferredChannelDuration = v4 + self->_preferredChannelDuration;
    lastEnterPreferredChannel = self->_lastEnterPreferredChannel;
    self->_lastEnterPreferredChannel = 0;
  }
  if ([(WiFiUsageRealTimeCoexSession *)self isCurrentBandPreferredBand]
    && self->_lastEnterPreferredBand)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    self->_double preferredBandDuration = v6 + self->_preferredBandDuration;
    lastEnterPreferredBand = self->_lastEnterPreferredBand;
    self->_lastEnterPreferredBand = 0;
  }
}

- (void)setPreferredChannelAndBandUsageWithReferenceDate:(id)a3
{
  id v5 = a3;
  if ([(WiFiUsageRealTimeCoexSession *)self isCurrentChannelPreferredChannel]) {
    objc_storeStrong((id *)&self->_lastEnterPreferredChannel, a3);
  }
  if ([(WiFiUsageRealTimeCoexSession *)self isCurrentBandPreferredBand]) {
    objc_storeStrong((id *)&self->_lastEnterPreferredBand, a3);
  }
}

- (BOOL)infraIsPartOfSplitSSID
{
  return [(WiFiUsageSession *)self bandAtSessionStart] == 2 && self->_isSplitSSID;
}

- (unint64_t)rtCoexType
{
  return self->_rtCoexType;
}

- (void)setRtCoexType:(unint64_t)a3
{
  self->_rtCoexType = a3;
}

- (NSString)rtCoexSubType
{
  return (NSString *)objc_getProperty(self, a2, 11952, 1);
}

- (void)setRtCoexSubType:(id)a3
{
}

- (unint64_t)lastRequestType
{
  return self->_lastRequestType;
}

- (void)setLastRequestType:(unint64_t)a3
{
  self->_lastRequestType = a3;
}

- (unint64_t)lastRequestPreferredChannel
{
  return self->_lastRequestPreferredChannel;
}

- (void)setLastRequestPreferredChannel:(unint64_t)a3
{
  self->_unint64_t lastRequestPreferredChannel = a3;
}

- (int)lastRequestPreferredBand
{
  return self->_lastRequestPreferredBand;
}

- (void)setLastRequestPreferredBand:(int)a3
{
  self->_int lastRequestPreferredBand = a3;
}

- (BOOL)lastRequestDifferentSSID
{
  return self->_lastRequestDifferentSSID;
}

- (void)setLastRequestDifferentSSID:(BOOL)a3
{
  self->_lastRequestDifferentSSID = a3;
}

- (NSString)lastRequestPreferredSSID
{
  return (NSString *)objc_getProperty(self, a2, 11976, 1);
}

- (void)setLastRequestPreferredSSID:(id)a3
{
}

- (NSString)lastRequestPreferredBSS
{
  return (NSString *)objc_getProperty(self, a2, 11984, 1);
}

- (void)setLastRequestPreferredBSS:(id)a3
{
}

- (BOOL)isSplitSSID
{
  return self->_isSplitSSID;
}

- (void)setIsSplitSSID:(BOOL)a3
{
  self->_isSplitSSID = a3;
}

- (BOOL)hasCandidates
{
  return self->_hasCandidates;
}

- (void)setHasCandidates:(BOOL)a3
{
  self->_hasCandidates = a3;
}

- (BOOL)hasDifferentIpv4DetailsAfterSSIDTransition
{
  return self->_hasDifferentIpv4DetailsAfterSSIDTransition;
}

- (void)setHasDifferentIpv4DetailsAfterSSIDTransition:(BOOL)a3
{
  self->_hasDifferentIpv4DetailsAfterSSIDTransition = a3;
}

- (BOOL)hasDifferentIpv6DetailsAfterSSIDTransition
{
  return self->_hasDifferentIpv6DetailsAfterSSIDTransition;
}

- (void)setHasDifferentIpv6DetailsAfterSSIDTransition:(BOOL)a3
{
  self->_hasDifferentIpv6DetailsAfterSSIDTransition = a3;
}

- (BOOL)isRtCoexOptimal
{
  return self->_isRtCoexOptimal;
}

- (void)setIsRtCoexOptimal:(BOOL)a3
{
  self->_isRtCoexOptimal = a3;
}

- (NSDate)firstRtCoexOptimal
{
  return (NSDate *)objc_getProperty(self, a2, 11992, 1);
}

- (void)setFirstRtCoexOptimal:(id)a3
{
}

- (NSDate)lastRtCoexOptimalStatusChange
{
  return (NSDate *)objc_getProperty(self, a2, 12000, 1);
}

- (void)setLastRtCoexOptimalStatusChange:(id)a3
{
}

- (double)rtCoexInOptimalDuration
{
  return self->_rtCoexInOptimalDuration;
}

- (void)setRtCoexInOptimalDuration:(double)a3
{
  self->_double rtCoexInOptimalDuration = a3;
}

- (NSDate)lastEnterPreferredChannel
{
  return (NSDate *)objc_getProperty(self, a2, 12016, 1);
}

- (void)setLastEnterPreferredChannel:(id)a3
{
}

- (double)preferredChannelDuration
{
  return self->_preferredChannelDuration;
}

- (void)setPreferredChannelDuration:(double)a3
{
  self->_double preferredChannelDuration = a3;
}

- (NSDate)lastEnterPreferredBand
{
  return (NSDate *)objc_getProperty(self, a2, 12032, 1);
}

- (void)setLastEnterPreferredBand:(id)a3
{
}

- (double)preferredBandDuration
{
  return self->_preferredBandDuration;
}

- (void)setPreferredBandDuration:(double)a3
{
  self->_double preferredBandDuration = a3;
}

- (NSDate)firstSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12048, 1);
}

- (void)setFirstSSIDTransition:(id)a3
{
}

- (NSDate)firstIPUpdateAfterSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12056, 1);
}

- (void)setFirstIPUpdateAfterSSIDTransition:(id)a3
{
}

- (NSDate)firstManualJoin
{
  return (NSDate *)objc_getProperty(self, a2, 12064, 1);
}

- (void)setFirstManualJoin:(id)a3
{
}

- (NSDate)firstManualJoinAfterSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12072, 1);
}

- (void)setFirstManualJoinAfterSSIDTransition:(id)a3
{
}

- (unint64_t)requestSteerToPreferredChannelCount
{
  return self->_requestSteerToPreferredChannelCount;
}

- (void)setRequestSteerToPreferredChannelCount:(unint64_t)a3
{
  self->_requestSteerToPreferredChannelCount = a3;
}

- (unint64_t)requestSteerCount
{
  return self->_requestSteerCount;
}

- (void)setRequestSteerCount:(unint64_t)a3
{
  self->_requestSteerCount = a3;
}

- (unint64_t)requestDisconnectCount
{
  return self->_requestDisconnectCount;
}

- (void)setRequestDisconnectCount:(unint64_t)a3
{
  self->_requestDisconnectCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstManualJoinAfterSSIDTransition, 0);
  objc_storeStrong((id *)&self->_firstManualJoin, 0);
  objc_storeStrong((id *)&self->_firstIPUpdateAfterSSIDTransition, 0);
  objc_storeStrong((id *)&self->_firstSSIDTransition, 0);
  objc_storeStrong((id *)&self->_lastEnterPreferredBand, 0);
  objc_storeStrong((id *)&self->_lastEnterPreferredChannel, 0);
  objc_storeStrong((id *)&self->_lastRtCoexOptimalStatusChange, 0);
  objc_storeStrong((id *)&self->_firstRtCoexOptimal, 0);
  objc_storeStrong((id *)&self->_lastRequestPreferredBSS, 0);
  objc_storeStrong((id *)&self->_lastRequestPreferredSSID, 0);

  objc_storeStrong((id *)&self->_rtCoexSubType, 0);
}

@end