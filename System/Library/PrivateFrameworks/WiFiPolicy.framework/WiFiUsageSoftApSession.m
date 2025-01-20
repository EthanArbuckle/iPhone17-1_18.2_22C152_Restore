@interface WiFiUsageSoftApSession
- (BOOL)compatibilityEnabled;
- (BOOL)lastHiddenState;
- (NSDate)lastAwdlActiveTime;
- (NSDate)lastInfraActiveTime;
- (NSMutableSet)connectedClients;
- (NSString)requester;
- (NSString)status;
- (NSString)tearDownReason;
- (WiFiUsageSoftApSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (double)awdlActiveDuration;
- (double)infraActiveDuration;
- (double)lowPowerModeDuration;
- (double)requestToUpLatency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventDictionary:(BOOL)a3;
- (id)metricName;
- (unint64_t)appleClientConnectCount;
- (unint64_t)appliedCountryCode;
- (unint64_t)autoHotspotClientConnectCount;
- (unint64_t)awdlStateChangedCount;
- (unint64_t)bandTransitionCount;
- (unint64_t)broadcastClientConnectCount;
- (unint64_t)clientDisconnectCount;
- (unint64_t)fiveGHzChannelCount;
- (unint64_t)fiveGHzClientConnectCount;
- (unint64_t)fiveGHzDeniedUnii1ChannelCount;
- (unint64_t)fiveGHzDeniedUnii2aChannelCount;
- (unint64_t)fiveGHzDeniedUnii2cChannelCount;
- (unint64_t)fiveGHzDeniedUnii3ChannelCount;
- (unint64_t)hiddenClientConnectCount;
- (unint64_t)hiddenTransitionCount;
- (unint64_t)infraStateChangedCount;
- (unint64_t)instantHotspotClientConnectCount;
- (unint64_t)knownNetworkScanCount;
- (unint64_t)lastChannel;
- (unint64_t)maxConnectedClientCount;
- (unint64_t)otherClientConnectCount;
- (unint64_t)twoFourGHzChannelCount;
- (unint64_t)twoFourGHzClientConnectCount;
- (unint64_t)twoFourGHzDeniedChannelCount;
- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8;
- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7;
- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)setAppleClientConnectCount:(unint64_t)a3;
- (void)setAppliedCountryCode:(unint64_t)a3;
- (void)setAutoHotspotClientConnectCount:(unint64_t)a3;
- (void)setAwdlActiveDuration:(double)a3;
- (void)setAwdlStateChangedCount:(unint64_t)a3;
- (void)setBandTransitionCount:(unint64_t)a3;
- (void)setBroadcastClientConnectCount:(unint64_t)a3;
- (void)setClientDisconnectCount:(unint64_t)a3;
- (void)setCompatibilityEnabled:(BOOL)a3;
- (void)setConnectedClients:(id)a3;
- (void)setFiveGHzChannelCount:(unint64_t)a3;
- (void)setFiveGHzClientConnectCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii1ChannelCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii2aChannelCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii2cChannelCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii3ChannelCount:(unint64_t)a3;
- (void)setHiddenClientConnectCount:(unint64_t)a3;
- (void)setHiddenTransitionCount:(unint64_t)a3;
- (void)setInfraActiveDuration:(double)a3;
- (void)setInfraStateChangedCount:(unint64_t)a3;
- (void)setInstantHotspotClientConnectCount:(unint64_t)a3;
- (void)setKnownNetworkScanCount:(unint64_t)a3;
- (void)setLastAwdlActiveTime:(id)a3;
- (void)setLastChannel:(unint64_t)a3;
- (void)setLastHiddenState:(BOOL)a3;
- (void)setLastInfraActiveTime:(id)a3;
- (void)setLowPowerModeDuration:(double)a3;
- (void)setMaxConnectedClientCount:(unint64_t)a3;
- (void)setOtherClientConnectCount:(unint64_t)a3;
- (void)setRequestToUpLatency:(double)a3;
- (void)setRequester:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTearDownReason:(id)a3;
- (void)setTwoFourGHzChannelCount:(unint64_t)a3;
- (void)setTwoFourGHzClientConnectCount:(unint64_t)a3;
- (void)setTwoFourGHzDeniedChannelCount:(unint64_t)a3;
- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14;
- (void)summarizeSession;
@end

@implementation WiFiUsageSoftApSession

- (WiFiUsageSoftApSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WiFiUsageSoftApSession;
  v4 = [(WiFiUsageSession *)&v6 initWithSessionType:6 andInterfaceName:a3 andCapabilities:a4];
  [(WiFiUsageSoftApSession *)v4 setTwoFourGHzDeniedChannelCount:0];
  [(WiFiUsageSoftApSession *)v4 setFiveGHzDeniedUnii1ChannelCount:0];
  [(WiFiUsageSoftApSession *)v4 setFiveGHzDeniedUnii2aChannelCount:0];
  [(WiFiUsageSoftApSession *)v4 setFiveGHzDeniedUnii2cChannelCount:0];
  [(WiFiUsageSoftApSession *)v4 setFiveGHzDeniedUnii3ChannelCount:0];
  return v4;
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v7 = a3;
  v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4, a5, a6, a7);
  v10 = v9;
  lastInfraActiveTime = self->_lastInfraActiveTime;
  if (v7)
  {
    if (!lastInfraActiveTime)
    {
      v13 = v9;
      v9 = (void *)[(WiFiUsageSoftApSession *)self setLastInfraActiveTime:v9];
      v10 = v13;
      ++self->_infraStateChangedCount;
    }
  }
  else if (lastInfraActiveTime)
  {
    v14 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    self->_infraActiveDuration = v12 + self->_infraActiveDuration;
    v9 = (void *)[(WiFiUsageSoftApSession *)self setLastInfraActiveTime:0];
    v10 = v14;
  }

  MEMORY[0x1F41817F8](v9, v10, lastInfraActiveTime);
}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  BOOL v4 = a3;
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4);
  BOOL v7 = v6;
  if (v4)
  {
    v10 = v6;
    objc_super v6 = (void *)[(WiFiUsageSoftApSession *)self setLastAwdlActiveTime:v6];
    BOOL v7 = v10;
    ++self->_awdlStateChangedCount;
  }
  else
  {
    lastAwdlActiveTime = self->_lastAwdlActiveTime;
    if (lastAwdlActiveTime)
    {
      v11 = v6;
      objc_msgSend(v6, "timeIntervalSinceDate:");
      self->_awdlActiveDuration = v9 + self->_awdlActiveDuration;
      objc_super v6 = (void *)[(WiFiUsageSoftApSession *)self setLastAwdlActiveTime:0];
      BOOL v7 = v11;
    }
  }

  MEMORY[0x1F41817F8](v6, v7, lastAwdlActiveTime);
}

- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  BOOL v19 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  v32 = [MEMORY[0x1E4F1C9C8] date];
  v31 = v21;
  if ([(WiFiUsageSession *)self isSessionActive] == v19)
  {
LABEL_6:
    char v25 = 0;
    if (!v22) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (!v19)
  {
    NSLog(&cfstr_SSoftapSession_0.isa, "-[WiFiUsageSoftApSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:]");
    [(WiFiUsageSoftApSession *)self setLowPowerModeDuration:a12];
    [(WiFiUsageSoftApSession *)self setTearDownReason:v23];
    [(WiFiUsageSession *)self sessionDidEnd];
    [(NSMutableSet *)self->_connectedClients removeAllObjects];
    goto LABEL_6;
  }
  NSLog(&cfstr_SSoftapSession.isa, "-[WiFiUsageSoftApSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:]");
  [(WiFiUsageSession *)self sessionDidStart];
  [(WiFiUsageSoftApSession *)self setRequester:v21];
  [(WiFiUsageSoftApSession *)self setCompatibilityEnabled:a13];
  [(WiFiUsageSoftApSession *)self setLowPowerModeDuration:0.0];
  [(WiFiUsageSoftApSession *)self setInfraActiveDuration:0.0];
  [(WiFiUsageSoftApSession *)self setAwdlActiveDuration:0.0];
  [(WiFiUsageSoftApSession *)self setRequestToUpLatency:0.0];
  [(WiFiUsageSoftApSession *)self setAppleClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setOtherClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setHiddenClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setBroadcastClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setTwoFourGHzClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setFiveGHzClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setClientDisconnectCount:0];
  [(WiFiUsageSoftApSession *)self setMaxConnectedClientCount:0];
  [(WiFiUsageSoftApSession *)self setInstantHotspotClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setAutoHotspotClientConnectCount:0];
  [(WiFiUsageSoftApSession *)self setLastAwdlActiveTime:0];
  [(WiFiUsageSoftApSession *)self setLastInfraActiveTime:0];
  [(WiFiUsageSoftApSession *)self setTwoFourGHzChannelCount:0];
  [(WiFiUsageSoftApSession *)self setFiveGHzChannelCount:0];
  [(WiFiUsageSoftApSession *)self setInfraStateChangedCount:0];
  [(WiFiUsageSoftApSession *)self setAwdlStateChangedCount:0];
  [(WiFiUsageSoftApSession *)self setKnownNetworkScanCount:0];
  [(WiFiUsageSoftApSession *)self setHiddenTransitionCount:0];
  [(WiFiUsageSoftApSession *)self setBandTransitionCount:0];
  connectedClients = self->_connectedClients;
  if (connectedClients)
  {
    [(NSMutableSet *)connectedClients removeAllObjects];
  }
  else
  {
    v28 = [MEMORY[0x1E4F1CA80] set];
    v29 = self->_connectedClients;
    self->_connectedClients = v28;
  }
  char v25 = 1;
  if (v22) {
LABEL_7:
  }
    [(WiFiUsageSoftApSession *)self setStatus:v22];
LABEL_8:
  if (a8) {
    [(WiFiUsageSoftApSession *)self setAppliedCountryCode:a8];
  }
  if (a14 > 0.0) {
    [(WiFiUsageSoftApSession *)self setRequestToUpLatency:a14];
  }
  if (v19)
  {
    if ((v25 & 1) == 0)
    {
      int64_t v26 = a7 - self->_lastChannel;
      if (v26)
      {
        if (v26 < 0) {
          int64_t v26 = self->_lastChannel - a7;
        }
        if ((unint64_t)v26 >= 0x65) {
          ++self->_bandTransitionCount;
        }
      }
      if (self->_lastHiddenState != a9) {
        ++self->_hiddenTransitionCount;
      }
    }
    if (!self->_lastInfraActiveTime && a10) {
      [(WiFiUsageSoftApSession *)self setLastInfraActiveTime:v32];
    }
    if (!self->_lastAwdlActiveTime && a11) {
      [(WiFiUsageSoftApSession *)self setLastAwdlActiveTime:v32];
    }
    if (a7 && self->_lastChannel != a7)
    {
      v27 = &OBJC_IVAR___WiFiUsageSoftApSession__fiveGHzChannelCount;
      if (a7 < 0xE) {
        v27 = &OBJC_IVAR___WiFiUsageSoftApSession__twoFourGHzChannelCount;
      }
      ++*(Class *)((char *)&self->super.super.isa + *v27);
    }
    [(WiFiUsageSoftApSession *)self setLastHiddenState:a9];
    [(WiFiUsageSoftApSession *)self setLastChannel:a7];
  }
  v34.receiver = self;
  v34.super_class = (Class)WiFiUsageSoftApSession;
  BYTE3(v30) = a13;
  BYTE2(v30) = a11;
  LOWORD(v30) = __PAIR16__(a10, a9);
  -[WiFiUsageSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:](&v34, sel_softApStateDidChange_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency_, v19, v31, v22, v23, a7, a8, a12, a14, v30);
}

- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a3;
  id v14 = a4;
  id v16 = v14;
  if (v12)
  {
    if (self->_lastChannel >= 0xE) {
      v17 = &OBJC_IVAR___WiFiUsageSoftApSession__fiveGHzClientConnectCount;
    }
    else {
      v17 = &OBJC_IVAR___WiFiUsageSoftApSession__twoFourGHzClientConnectCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v17);
    v18 = &OBJC_IVAR___WiFiUsageSoftApSession__broadcastClientConnectCount;
    if (v8) {
      v18 = &OBJC_IVAR___WiFiUsageSoftApSession__hiddenClientConnectCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v18);
    BOOL v19 = &OBJC_IVAR___WiFiUsageSoftApSession__otherClientConnectCount;
    if (v11) {
      BOOL v19 = &OBJC_IVAR___WiFiUsageSoftApSession__appleClientConnectCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v19);
    if (v10) {
      ++self->_instantHotspotClientConnectCount;
    }
    if (v9) {
      ++self->_autoHotspotClientConnectCount;
    }
    id v20 = v14;
    if (v14) {
      [(NSMutableSet *)self->_connectedClients addObject:v14];
    }
    id v14 = (id)[(NSMutableSet *)self->_connectedClients count];
    id v16 = v20;
    if ((unint64_t)v14 > self->_maxConnectedClientCount)
    {
      id v14 = (id)[(NSMutableSet *)self->_connectedClients count];
      id v16 = v20;
      self->_maxConnectedClientCount = (unint64_t)v14;
    }
  }
  else
  {
    ++self->_clientDisconnectCount;
    if (v14)
    {
      id v21 = v14;
      id v14 = (id)[(NSMutableSet *)self->_connectedClients removeObject:v14];
      id v16 = v21;
    }
  }

  MEMORY[0x1F41817F8](v14, v16, v15);
}

- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7
{
  [(WiFiUsageSoftApSession *)self setTwoFourGHzDeniedChannelCount:a3];
  [(WiFiUsageSoftApSession *)self setFiveGHzDeniedUnii1ChannelCount:a4];
  [(WiFiUsageSoftApSession *)self setFiveGHzDeniedUnii2aChannelCount:a5];
  [(WiFiUsageSoftApSession *)self setFiveGHzDeniedUnii2cChannelCount:a6];

  [(WiFiUsageSoftApSession *)self setFiveGHzDeniedUnii3ChannelCount:a7];
}

- (id)eventDictionary:(BOOL)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v6 = [(WiFiUsageSession *)self sessionName];
  [v5 setObject:v6 forKeyedSubscript:@"SessionName"];

  [(WiFiUsageSession *)self sessionDuration];
  BOOL v7 = +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:");
  [v5 setObject:v7 forKeyedSubscript:@"SessionDuration"];

  BOOL v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WiFiUsageSession sessionPid](self, "sessionPid"));
  [v5 setObject:v8 forKeyedSubscript:@"SessionPid"];

  [(WiFiUsageSession *)self sessionTimeSinceLastSession];
  BOOL v9 = +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:");
  [v5 setObject:v9 forKeyedSubscript:@"SessionTimeSinceLastSession"];

  [v5 setObject:self->_requester forKeyedSubscript:@"Requester"];
  [v5 setObject:self->_status forKeyedSubscript:@"Status"];
  [v5 setObject:self->_tearDownReason forKeyedSubscript:@"TearDownReason"];
  BOOL v10 = [NSNumber numberWithBool:self->_lastHiddenState];
  [v5 setObject:v10 forKeyedSubscript:@"LastHiddenState"];

  BOOL v11 = [NSNumber numberWithUnsignedInteger:self->_lastChannel];
  [v5 setObject:v11 forKeyedSubscript:@"LastChannel"];

  BOOL v12 = [NSNumber numberWithUnsignedInteger:self->_twoFourGHzChannelCount];
  [v5 setObject:v12 forKeyedSubscript:@"TwoFourGHzChannelCount"];

  v13 = [NSNumber numberWithUnsignedInteger:self->_fiveGHzChannelCount];
  [v5 setObject:v13 forKeyedSubscript:@"FiveGHzChannelCount"];

  id v14 = [NSNumber numberWithUnsignedInteger:self->_appleClientConnectCount];
  [v5 setObject:v14 forKeyedSubscript:@"AppleClientConnectCount"];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_otherClientConnectCount];
  [v5 setObject:v15 forKeyedSubscript:@"OtherClientConnectCount"];

  id v16 = [NSNumber numberWithUnsignedInteger:self->_hiddenClientConnectCount];
  [v5 setObject:v16 forKeyedSubscript:@"HiddenClientConnectCount"];

  v17 = [NSNumber numberWithUnsignedInteger:self->_broadcastClientConnectCount];
  [v5 setObject:v17 forKeyedSubscript:@"BroadcastClientConnectCount"];

  v18 = [NSNumber numberWithUnsignedInteger:self->_autoHotspotClientConnectCount];
  [v5 setObject:v18 forKeyedSubscript:@"AutoHotspotClientConnectCount"];

  BOOL v19 = [NSNumber numberWithUnsignedInteger:self->_instantHotspotClientConnectCount];
  [v5 setObject:v19 forKeyedSubscript:@"InstantHotspotClientConnectCount"];

  id v20 = [NSNumber numberWithUnsignedInteger:self->_twoFourGHzClientConnectCount];
  [v5 setObject:v20 forKeyedSubscript:@"TwoFourGHzClientConnectCount"];

  id v21 = [NSNumber numberWithUnsignedInteger:self->_fiveGHzClientConnectCount];
  [v5 setObject:v21 forKeyedSubscript:@"FiveGHzClientConnectCount"];

  id v22 = [NSNumber numberWithUnsignedInteger:self->_clientDisconnectCount];
  [v5 setObject:v22 forKeyedSubscript:@"ClientDisconnectCount"];

  id v23 = [NSNumber numberWithUnsignedInteger:self->_maxConnectedClientCount];
  [v5 setObject:v23 forKeyedSubscript:@"MaxConnectedClientCount"];

  double lowPowerModeDuration = self->_lowPowerModeDuration;
  [(WiFiUsageSession *)self sessionDuration];
  int64_t v26 = +[WiFiUsagePrivacyFilter timePercentage:lowPowerModeDuration overTotalDuration:v25];
  [v5 setObject:v26 forKeyedSubscript:@"LowPowerModeDuration"];

  double infraActiveDuration = self->_infraActiveDuration;
  [(WiFiUsageSession *)self sessionDuration];
  v29 = +[WiFiUsagePrivacyFilter timePercentage:infraActiveDuration overTotalDuration:v28];
  [v5 setObject:v29 forKeyedSubscript:@"InfraActiveDuration"];

  double awdlActiveDuration = self->_awdlActiveDuration;
  [(WiFiUsageSession *)self sessionDuration];
  v32 = +[WiFiUsagePrivacyFilter timePercentage:awdlActiveDuration overTotalDuration:v31];
  [v5 setObject:v32 forKeyedSubscript:@"AwdlActiveDuration"];

  v33 = [NSNumber numberWithDouble:self->_requestToUpLatency];
  [v5 setObject:v33 forKeyedSubscript:@"RequestToUpLatency"];

  objc_super v34 = [NSNumber numberWithUnsignedInteger:self->_infraStateChangedCount];
  [v5 setObject:v34 forKeyedSubscript:@"InfraStateChangedCount"];

  v35 = [NSNumber numberWithUnsignedInteger:self->_awdlStateChangedCount];
  [v5 setObject:v35 forKeyedSubscript:@"AwdlStateChangedCount"];

  v36 = [NSNumber numberWithUnsignedInteger:self->_knownNetworkScanCount];
  [v5 setObject:v36 forKeyedSubscript:@"KnownNetworkScanCount"];

  v37 = [NSNumber numberWithUnsignedInteger:self->_hiddenTransitionCount];
  [v5 setObject:v37 forKeyedSubscript:@"HiddenTransitionCount"];

  v38 = [NSNumber numberWithUnsignedInteger:self->_bandTransitionCount];
  [v5 setObject:v38 forKeyedSubscript:@"BandTransitionCount"];

  v39 = [NSNumber numberWithUnsignedInteger:self->_twoFourGHzDeniedChannelCount];
  [v5 setObject:v39 forKeyedSubscript:@"TwoFourGHzDeniedChannelCount"];

  v40 = [NSNumber numberWithUnsignedInteger:self->_fiveGHzDeniedUnii1ChannelCount];
  [v5 setObject:v40 forKeyedSubscript:@"FiveGHzDeniedUnii1ChannelCount"];

  v41 = [NSNumber numberWithUnsignedInteger:self->_fiveGHzDeniedUnii2aChannelCount];
  [v5 setObject:v41 forKeyedSubscript:@"FiveGHzDeniedUnii2aChannelCount"];

  v42 = [NSNumber numberWithUnsignedInteger:self->_fiveGHzDeniedUnii2cChannelCount];
  [v5 setObject:v42 forKeyedSubscript:@"FiveGHzDeniedUnii2cChannelCount"];

  v43 = [NSNumber numberWithUnsignedInteger:self->_fiveGHzDeniedUnii3ChannelCount];
  [v5 setObject:v43 forKeyedSubscript:@"FiveGHzDeniedUnii3ChannelCount"];

  v48[0] = self->_appliedCountryCode;
  v44 = [NSString stringWithCString:v48 encoding:4];
  [v5 setObject:v44 forKeyedSubscript:@"CountryCodeApplied"];

  v45 = [NSNumber numberWithBool:self->_compatibilityEnabled];
  [v5 setObject:v45 forKeyedSubscript:@"MaximizeCompatibilityEnabled"];

  if (!a3)
  {
    v46 = [(WiFiUsageSession *)self sessionStartTime];
    [v5 setObject:v46 forKeyedSubscript:@"SessionStartTimestamp"];
  }

  return v5;
}

- (void)summarizeSession
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = v3;
  if (self->_lastInfraActiveTime)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    self->_double infraActiveDuration = v5 + self->_infraActiveDuration;
    [(WiFiUsageSoftApSession *)self setLastInfraActiveTime:0];
  }
  if (self->_lastAwdlActiveTime)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    self->_double awdlActiveDuration = v6 + self->_awdlActiveDuration;
    [(WiFiUsageSoftApSession *)self setLastAwdlActiveTime:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageSoftApSession;
  [(WiFiUsageSession *)&v7 summarizeSession];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(WiFiUsageSession *)self type];
  double v6 = [(WiFiUsageSession *)self interfaceName];
  objc_super v7 = [(WiFiUsageSession *)self capabilities];
  BOOL v8 = (void *)[v4 initWithSessionType:v5 andInterfaceName:v6 andCapabilities:v7];

  BOOL v9 = [(WiFiUsageSession *)self completionQueue];
  [v8 setCompletionQueue:v9];

  BOOL v10 = [(WiFiUsageSession *)self completionContext];
  [v8 setCompletionContext:v10];

  BOOL v11 = [(WiFiUsageSession *)self completionHandler];
  [v8 setCompletionHandler:v11];

  [(WiFiUsageSession *)self sessionDuration];
  objc_msgSend(v8, "setSessionDuration:");
  BOOL v12 = [(WiFiUsageSession *)self sessionStartTime];
  [v8 setSessionStartTime:v12];

  objc_msgSend(v8, "setIsSessionActive:", -[WiFiUsageSession isSessionActive](self, "isSessionActive"));
  objc_msgSend(v8, "setSessionPid:", -[WiFiUsageSession sessionPid](self, "sessionPid"));
  [v8 setRequester:self->_requester];
  [v8 setStatus:self->_status];
  [v8 setLastAwdlActiveTime:self->_lastAwdlActiveTime];
  [v8 setLastInfraActiveTime:self->_lastInfraActiveTime];
  [v8 setAppleClientConnectCount:self->_appleClientConnectCount];
  [v8 setOtherClientConnectCount:self->_otherClientConnectCount];
  [v8 setHiddenClientConnectCount:self->_hiddenClientConnectCount];
  [v8 setBroadcastClientConnectCount:self->_broadcastClientConnectCount];
  [v8 setTwoFourGHzClientConnectCount:self->_twoFourGHzClientConnectCount];
  [v8 setFiveGHzClientConnectCount:self->_fiveGHzChannelCount];
  [v8 setClientDisconnectCount:self->_clientDisconnectCount];
  [v8 setMaxConnectedClientCount:self->_maxConnectedClientCount];
  [v8 setInstantHotspotClientConnectCount:self->_instantHotspotClientConnectCount];
  [v8 setAutoHotspotClientConnectCount:self->_autoHotspotClientConnectCount];
  [v8 setLastHiddenState:self->_lastHiddenState];
  [v8 setLastChannel:self->_lastChannel];
  [v8 setTwoFourGHzChannelCount:self->_twoFourGHzChannelCount];
  [v8 setFiveGHzChannelCount:self->_fiveGHzChannelCount];
  [v8 setLowPowerModeDuration:self->_lowPowerModeDuration];
  [v8 setInfraActiveDuration:self->_infraActiveDuration];
  [v8 setAwdlActiveDuration:self->_awdlActiveDuration];
  [v8 setRequestToUpLatency:self->_requestToUpLatency];
  [v8 setCompatibilityEnabled:self->_compatibilityEnabled];
  [v8 setInfraStateChangedCount:self->_infraStateChangedCount];
  [v8 setAwdlStateChangedCount:self->_awdlStateChangedCount];
  [v8 setKnownNetworkScanCount:self->_knownNetworkScanCount];
  [v8 setHiddenTransitionCount:self->_hiddenTransitionCount];
  [v8 setBandTransitionCount:self->_bandTransitionCount];
  [v8 setTwoFourGHzDeniedChannelCount:self->_twoFourGHzDeniedChannelCount];
  [v8 setFiveGHzDeniedUnii1ChannelCount:self->_fiveGHzDeniedUnii1ChannelCount];
  [v8 setFiveGHzDeniedUnii2aChannelCount:self->_fiveGHzDeniedUnii2aChannelCount];
  [v8 setFiveGHzDeniedUnii2cChannelCount:self->_fiveGHzDeniedUnii2cChannelCount];
  [v8 setFiveGHzDeniedUnii3ChannelCount:self->_fiveGHzDeniedUnii3ChannelCount];
  [v8 setAppliedCountryCode:self->_appliedCountryCode];
  [v8 setConnectedClients:self->_connectedClients];
  [v8 setTearDownReason:self->_tearDownReason];
  return v8;
}

- (id)metricName
{
  return @"com.apple.wifi.softapsession";
}

- (NSString)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)tearDownReason
{
  return self->_tearDownReason;
}

- (void)setTearDownReason:(id)a3
{
}

- (NSDate)lastAwdlActiveTime
{
  return self->_lastAwdlActiveTime;
}

- (void)setLastAwdlActiveTime:(id)a3
{
}

- (NSDate)lastInfraActiveTime
{
  return self->_lastInfraActiveTime;
}

- (void)setLastInfraActiveTime:(id)a3
{
}

- (BOOL)compatibilityEnabled
{
  return self->_compatibilityEnabled;
}

- (void)setCompatibilityEnabled:(BOOL)a3
{
  self->_compatibilityEnabled = a3;
}

- (unint64_t)appleClientConnectCount
{
  return self->_appleClientConnectCount;
}

- (void)setAppleClientConnectCount:(unint64_t)a3
{
  self->_appleClientConnectCount = a3;
}

- (unint64_t)otherClientConnectCount
{
  return self->_otherClientConnectCount;
}

- (void)setOtherClientConnectCount:(unint64_t)a3
{
  self->_otherClientConnectCount = a3;
}

- (unint64_t)hiddenClientConnectCount
{
  return self->_hiddenClientConnectCount;
}

- (void)setHiddenClientConnectCount:(unint64_t)a3
{
  self->_hiddenClientConnectCount = a3;
}

- (unint64_t)broadcastClientConnectCount
{
  return self->_broadcastClientConnectCount;
}

- (void)setBroadcastClientConnectCount:(unint64_t)a3
{
  self->_broadcastClientConnectCount = a3;
}

- (unint64_t)twoFourGHzClientConnectCount
{
  return self->_twoFourGHzClientConnectCount;
}

- (void)setTwoFourGHzClientConnectCount:(unint64_t)a3
{
  self->_twoFourGHzClientConnectCount = a3;
}

- (unint64_t)fiveGHzClientConnectCount
{
  return self->_fiveGHzClientConnectCount;
}

- (void)setFiveGHzClientConnectCount:(unint64_t)a3
{
  self->_fiveGHzClientConnectCount = a3;
}

- (unint64_t)autoHotspotClientConnectCount
{
  return self->_autoHotspotClientConnectCount;
}

- (void)setAutoHotspotClientConnectCount:(unint64_t)a3
{
  self->_autoHotspotClientConnectCount = a3;
}

- (unint64_t)instantHotspotClientConnectCount
{
  return self->_instantHotspotClientConnectCount;
}

- (void)setInstantHotspotClientConnectCount:(unint64_t)a3
{
  self->_instantHotspotClientConnectCount = a3;
}

- (unint64_t)clientDisconnectCount
{
  return self->_clientDisconnectCount;
}

- (void)setClientDisconnectCount:(unint64_t)a3
{
  self->_clientDisconnectCount = a3;
}

- (unint64_t)maxConnectedClientCount
{
  return self->_maxConnectedClientCount;
}

- (void)setMaxConnectedClientCount:(unint64_t)a3
{
  self->_maxConnectedClientCount = a3;
}

- (BOOL)lastHiddenState
{
  return self->_lastHiddenState;
}

- (void)setLastHiddenState:(BOOL)a3
{
  self->_lastHiddenState = a3;
}

- (unint64_t)lastChannel
{
  return self->_lastChannel;
}

- (void)setLastChannel:(unint64_t)a3
{
  self->_lastChannel = a3;
}

- (unint64_t)twoFourGHzChannelCount
{
  return self->_twoFourGHzChannelCount;
}

- (void)setTwoFourGHzChannelCount:(unint64_t)a3
{
  self->_twoFourGHzChannelCount = a3;
}

- (unint64_t)fiveGHzChannelCount
{
  return self->_fiveGHzChannelCount;
}

- (void)setFiveGHzChannelCount:(unint64_t)a3
{
  self->_fiveGHzChannelCount = a3;
}

- (double)lowPowerModeDuration
{
  return self->_lowPowerModeDuration;
}

- (void)setLowPowerModeDuration:(double)a3
{
  self->_double lowPowerModeDuration = a3;
}

- (double)infraActiveDuration
{
  return self->_infraActiveDuration;
}

- (void)setInfraActiveDuration:(double)a3
{
  self->_double infraActiveDuration = a3;
}

- (double)awdlActiveDuration
{
  return self->_awdlActiveDuration;
}

- (void)setAwdlActiveDuration:(double)a3
{
  self->_double awdlActiveDuration = a3;
}

- (double)requestToUpLatency
{
  return self->_requestToUpLatency;
}

- (void)setRequestToUpLatency:(double)a3
{
  self->_requestToUpLatency = a3;
}

- (unint64_t)infraStateChangedCount
{
  return self->_infraStateChangedCount;
}

- (void)setInfraStateChangedCount:(unint64_t)a3
{
  self->_infraStateChangedCount = a3;
}

- (unint64_t)awdlStateChangedCount
{
  return self->_awdlStateChangedCount;
}

- (void)setAwdlStateChangedCount:(unint64_t)a3
{
  self->_awdlStateChangedCount = a3;
}

- (unint64_t)knownNetworkScanCount
{
  return self->_knownNetworkScanCount;
}

- (void)setKnownNetworkScanCount:(unint64_t)a3
{
  self->_knownNetworkScanCount = a3;
}

- (unint64_t)hiddenTransitionCount
{
  return self->_hiddenTransitionCount;
}

- (void)setHiddenTransitionCount:(unint64_t)a3
{
  self->_hiddenTransitionCount = a3;
}

- (unint64_t)bandTransitionCount
{
  return self->_bandTransitionCount;
}

- (void)setBandTransitionCount:(unint64_t)a3
{
  self->_bandTransitionCount = a3;
}

- (unint64_t)twoFourGHzDeniedChannelCount
{
  return self->_twoFourGHzDeniedChannelCount;
}

- (void)setTwoFourGHzDeniedChannelCount:(unint64_t)a3
{
  self->_twoFourGHzDeniedChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii1ChannelCount
{
  return self->_fiveGHzDeniedUnii1ChannelCount;
}

- (void)setFiveGHzDeniedUnii1ChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii1ChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii2aChannelCount
{
  return self->_fiveGHzDeniedUnii2aChannelCount;
}

- (void)setFiveGHzDeniedUnii2aChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii2aChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii2cChannelCount
{
  return self->_fiveGHzDeniedUnii2cChannelCount;
}

- (void)setFiveGHzDeniedUnii2cChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii2cChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii3ChannelCount
{
  return self->_fiveGHzDeniedUnii3ChannelCount;
}

- (void)setFiveGHzDeniedUnii3ChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii3ChannelCount = a3;
}

- (unint64_t)appliedCountryCode
{
  return self->_appliedCountryCode;
}

- (void)setAppliedCountryCode:(unint64_t)a3
{
  self->_appliedCountryCode = a3;
}

- (NSMutableSet)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong((id *)&self->_lastInfraActiveTime, 0);
  objc_storeStrong((id *)&self->_lastAwdlActiveTime, 0);
  objc_storeStrong((id *)&self->_tearDownReason, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_requester, 0);
}

@end