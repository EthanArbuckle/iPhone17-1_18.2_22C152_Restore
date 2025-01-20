@interface WiFiUsageLinkSession
- (BOOL)useSavedJoinStats;
- (WiFiUsageLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)addDictionary:(id)a3 withKeysPrefix:(id)a4 toFlatDictionary:(id)a5;
- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4;
- (void)displayStateDidChange:(BOOL)a3;
- (void)faultEventDetected:(unint64_t)a3;
- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4;
- (void)handleFaultEventWithReason:(id)a3;
- (void)interfaceRankingDidChange:(BOOL)a3;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkQualityDidChange:(id)a3;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)lockStateDidChange:(BOOL)a3;
- (void)performLinkTestFor:(id)a3 isTriggeredByFault:(BOOL)a4;
- (void)processDHCPChanges:(id)a3;
- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11;
- (void)processIPv4Changes:(id)a3;
- (void)processIPv6Changes:(id)a3;
- (void)rangingCompleted;
- (void)retryLinkTestInOneMinute;
- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4;
- (void)updateLinkRecoveryDisabled:(BOOL)a3;
- (void)updateLinkTestInterval:(unint64_t)a3;
@end

@implementation WiFiUsageLinkSession

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9C8] date];
  if (v6)
  {
    if (([v6 isEqualToString:@"com.apple.springboard"] & 1) == 0)
    {
      if ([v6 isEqualToString:@"com.apple.appleseed.FeedbackAssistant"])
      {
        if (!self->_lastFaultIndicationTime || (objc_msgSend(v8, "timeIntervalSinceDate:"), v9 > 60.0))
        {
          if (self->_linkUp && self->_didBecomePrimary)
          {
            objc_storeStrong((id *)&self->_lastFaultIndicationTime, v8);
            [(WiFiUsageLinkSession *)self performLinkTestFor:@"FeedbackAssistant" isTriggeredByFault:0];
          }
        }
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v10 applicationStateDidChange:v6 withAttributes:v7];
}

- (void)linkQualityDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v3 linkQualityDidChange:a3];
}

- (WiFiUsageLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageLinkSession;
  v4 = [(WiFiUsageSession *)&v9 initWithSessionType:4 andInterfaceName:a3 andCapabilities:a4];
  v4->_linkUp = 0;
  lastLinkTest = v4->_lastLinkTest;
  v4->_lastLinkTest = 0;

  v4->_numLinkTestFailures = 0;
  v4->_didHandleFaultEvent = 0;
  v4->_didBecomePrimary = 0;
  v4->_foundSuccessfulLinkTest = 0;
  v4->_numLinkRecoverySkips = 0;
  v4->_periodicLinkTestInterval = 60;
  lastFaultEventHandled = v4->_lastFaultEventHandled;
  v4->_lastFaultEventHandled = 0;

  v4->_band = 3;
  [(WiFiUsageSession *)v4 setLinkRecoveryDisabled:0];
  linkTestResult = v4->_linkTestResult;
  v4->_linkTestResult = 0;

  return v4;
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (a6 && ![(WiFiUsageSession *)self isSessionActive])
  {
    [(WiFiUsageSession *)self sessionDidStart];
    v15.receiver = self;
    v15.super_class = (Class)WiFiUsageLinkSession;
    [(WiFiUsageSession *)&v15 joinStateDidChange:v12 withReason:a4 lastDisconnectReason:a5 lastJoinFailure:a6 andNetworkDetails:v13];
    v14.receiver = self;
    v14.super_class = (Class)WiFiUsageLinkSession;
    [(WiFiUsageSession *)&v14 updateAssociatedNetworkDetails:v13];
    [(WiFiUsageSession *)self sessionDidEnd];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WiFiUsageLinkSession;
    [(WiFiUsageSession *)&v15 joinStateDidChange:v12 withReason:a4 lastDisconnectReason:a5 lastJoinFailure:a6 andNetworkDetails:v13];
  }
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = v12;
  BOOL v14 = !self->_linkUp && v10;
  char v15 = !self->_linkUp || v10;
  v16 = [v12 connectedBss];
  self->_band = [v16 band];

  if ((v15 & 1) == 0 && [(WiFiUsageSession *)self isAssociated])
  {
    v17 = [(WiFiUsageSession *)self networkDetails];
    v18 = (void *)[v17 copy];
    [(WiFiUsageSession *)self setNetworkDetailsAtEnd:v18];
  }
  v32.receiver = self;
  v32.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v32 linkStateDidChange:v10 isInvoluntary:v9 linkChangeReason:a5 linkChangeSubreason:a6 withNetworkDetails:v13];
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(WiFiUsageSession *)self networkDetails];
      *(_DWORD *)buf = 136315395;
      v34 = "-[WiFiUsageLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
      __int16 v35 = 2113;
      v36 = v19;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: link session started for %{private}@", buf, 0x16u);
    }
    [(WiFiUsageSession *)self sessionDidStart];
    self->_linkUp = 1;
    v20 = [v13 connectedBss];
    uint64_t v21 = +[WiFiUsageLQMTransformations maxPhyModeFrom:](WiFiUsageLQMTransformations, "maxPhyModeFrom:", [v20 phyMode]);

    v31.receiver = self;
    v31.super_class = (Class)WiFiUsageLinkSession;
    if (v21 > [(WiFiUsageSession *)&v31 maxPhyMode])
    {
      v30.receiver = self;
      v30.super_class = (Class)WiFiUsageLinkSession;
      [(WiFiUsageSession *)&v30 setMaxPhyMode:v21];
    }
    v22 = [v13 connectedBss];
    v23 = [v22 bssid];
    bssid = self->_bssid;
    self->_bssid = v23;

    v25 = [v13 networkName];
    ssid = self->_ssid;
    self->_ssid = v25;
LABEL_20:

    goto LABEL_21;
  }
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(WiFiUsageSession *)self networkDetails];
      *(_DWORD *)buf = 136315395;
      v34 = "-[WiFiUsageLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
      __int16 v35 = 2113;
      v36 = v27;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: link session ended for %{private}@", buf, 0x16u);
    }
    [(WiFiUsageSession *)self sessionDidEnd];
    self->_linkUp = 0;
    lastLinkTest = self->_lastLinkTest;
    self->_lastLinkTest = 0;

    self->_didBecomePrimary = 0;
    self->_foundSuccessfulLinkTest = 0;
    self->_numLinkTestFailures = 0;
    self->_numLinkRecoverySkips = 0;
    v29 = self->_bssid;
    self->_bssid = 0;

    ssid = self->_ssid;
    self->_ssid = 0;
    goto LABEL_20;
  }
LABEL_21:
}

- (void)interfaceRankingDidChange:(BOOL)a3
{
  self->_didBecomePrimary = a3;
}

- (BOOL)useSavedJoinStats
{
  return 1;
}

- (id)metricName
{
  return @"com.apple.wifi.linksession";
}

- (void)lockStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = v5;
  if (!self->_lastLinkTest || (objc_msgSend(v5, "timeIntervalSinceDate:"), v7 > 600.0))
  {
    if (!v3) {
      [(WiFiUsageLinkSession *)self performLinkTestFor:@"LockStateChanged" isTriggeredByFault:0];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v8 lockStateDidChange:v3];
}

- (void)displayStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = v5;
  if (!self->_lastLinkTest)
  {
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:");
  if (v7 > 600.0 && v3) {
LABEL_4:
  }
    [(WiFiUsageLinkSession *)self performLinkTestFor:@"DisplayStateChanged" isTriggeredByFault:0];
LABEL_5:
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v8 displayStateDidChange:v3];
}

- (void)handleFaultEventWithReason:(id)a3
{
  self->_numLinkTestFailures = 0;
}

- (void)retryLinkTestInOneMinute
{
  NSLog(&cfstr_SUWaiting1Minu.isa, a2, "-[WiFiUsageLinkSession retryLinkTestInOneMinute]", 291);
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 60000000000);
  v4 = [(WiFiUsageSession *)self completionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WiFiUsageLinkSession_retryLinkTestInOneMinute__block_invoke;
  block[3] = &unk_1E69BCBA0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__WiFiUsageLinkSession_retryLinkTestInOneMinute__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained[11984]) {
    v2 = @"didHandleFaultEvent";
  }
  else {
    v2 = @"retryLinkTest";
  }
  [WeakRetained performLinkTestFor:v2 isTriggeredByFault:0];
}

- (void)faultEventDetected:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v16 faultEventDetected:a3];
  id v6 = @"Arp Failure";
  switch(a3)
  {
    case 0x11uLL:
      goto LABEL_6;
    case 0x12uLL:
      id v6 = @"SlowWiFiDnsFailure";
      goto LABEL_6;
    case 0x13uLL:
      id v6 = @"SlowWiFiDUT";
      goto LABEL_6;
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      goto LABEL_29;
    case 0x19uLL:
      if (self->_lastFaultIndicationTime && (objc_msgSend(v5, "timeIntervalSinceDate:"), v12 <= 60.0))
      {
        [v5 timeIntervalSinceDate:self->_lastFaultIndicationTime];
        NSLog(&cfstr_SKwifiusagefau_0.isa, "-[WiFiUsageLinkSession faultEventDetected:]", v14);
      }
      else
      {
        if (self->_linkUp && self->_didBecomePrimary)
        {
          objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
          BOOL v10 = @"Siri Timed Out";
          goto LABEL_23;
        }
        NSLog(&cfstr_SKwifiusagefau.isa, "-[WiFiUsageLinkSession faultEventDetected:]", self->_linkUp, self->_didBecomePrimary);
      }
      goto LABEL_29;
    case 0x1AuLL:
      if (self->_lastFaultIndicationTime)
      {
        objc_msgSend(v5, "timeIntervalSinceDate:");
        if (v13 <= 600.0)
        {
          [v5 timeIntervalSinceDate:self->_lastFaultIndicationTime];
          NSLog(&cfstr_SKwifiusagefau_2.isa, "-[WiFiUsageLinkSession faultEventDetected:]", v15);
          goto LABEL_29;
        }
      }
      if (!self->_linkUp || !self->_didBecomePrimary)
      {
        NSLog(&cfstr_SKwifiusagefau_1.isa, "-[WiFiUsageLinkSession faultEventDetected:]", self->_linkUp, self->_didBecomePrimary);
        goto LABEL_29;
      }
      objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
      BOOL v10 = @"Apsd Timed Out";
LABEL_23:
      BOOL v9 = self;
      BOOL v8 = 1;
      goto LABEL_24;
    default:
      if (a3 != 10) {
        goto LABEL_29;
      }
      id v6 = @"SlowWiFiAP";
LABEL_6:
      if (self->_lastFaultIndicationTime && (objc_msgSend(v5, "timeIntervalSinceDate:"), v7 <= 60.0))
      {
        [v5 timeIntervalSinceDate:self->_lastFaultIndicationTime];
        NSLog(&cfstr_SFaultTypeLuRe_0.isa, "-[WiFiUsageLinkSession faultEventDetected:]", a3, v6, v11);
      }
      else if (self->_linkUp && self->_didBecomePrimary)
      {
        objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
        BOOL v8 = a3 == 18;
        BOOL v9 = self;
        BOOL v10 = v6;
LABEL_24:
        [(WiFiUsageLinkSession *)v9 performLinkTestFor:v10 isTriggeredByFault:v8];
      }
      else
      {
        NSLog(&cfstr_SFaultTypeLuRe.isa, "-[WiFiUsageLinkSession faultEventDetected:]", a3, v6, self->_linkUp, self->_didBecomePrimary);
      }
LABEL_29:

      return;
  }
}

- (void)performLinkTestFor:(id)a3 isTriggeredByFault:(BOOL)a4
{
  id v6 = a3;
  double v7 = v6;
  if (self->_linkUp && self->_didBecomePrimary)
  {
    NSLog(&cfstr_SUReasonIntern.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]", 419, v6, +[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall"));
    if (+[WiFiUsagePrivacyFilter isInternalInstall])
    {
      BOOL v8 = [MEMORY[0x1E4F1C9C8] date];
      objc_storeStrong((id *)&self->_lastLinkTest, v8);
      BOOL v9 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
      char v10 = [v9 hasActivitiesRunning];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
        [v11 networkActivityStart:1 activate:1];

        linkTestResult = self->_linkTestResult;
        self->_linkTestResult = 0;

        double v13 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v14 = self->_linkTestResult;
        self->_linkTestResult = v13;
      }
      uint64_t v15 = [WFMeasure alloc];
      unint64_t lastFaultEventHandledOptions = self->_lastFaultEventHandledOptions;
      v17 = [(WiFiUsageSession *)self interfaceName];
      v18 = [(WFMeasure *)v15 initWithType:2 andReason:v7 prevTestedOptions:lastFaultEventHandledOptions andInterfaceName:v17];

      if (v18)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke;
        v27[3] = &unk_1E69BCBC8;
        BOOL v30 = a4;
        id v28 = v7;
        v29 = self;
        v19 = [(WiFiUsageSession *)self completionQueue];
        [(WFMeasure *)v18 start:v27 withCompletionQueue:v19];
      }
    }
    else
    {
      NSLog(&cfstr_SRejectedDueTo.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]");
    }
  }
  else if (self->_didHandleFaultEvent {
         && [v6 isEqualToString:@"didHandleFaultEvent"])
  }
  {
    NSLog(&cfstr_SULinkNotReady.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]", 802, self->_lastFaultEventHandledReason);
    v20 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v21 = v20;
    if (self->_didBecomePrimary) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    [v20 setObject:v22 forKey:@"DidBecomePrimary"];
    if (self->_linkUp) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    [v21 setObject:v23 forKey:@"LinkUp"];
    [(WiFiUsageLinkSession *)self addDictionary:v21 withKeysPrefix:@"FinalResults_" toFlatDictionary:self->_linkTestResult];
    v24 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    [v24 networkActivityStop:1 withReason:3 withClientMetric:"linkTestResults" withClientDict:self->_linkTestResult andError:0];

    v25 = self->_linkTestResult;
    self->_linkTestResult = 0;

    self->_didHandleFaultEvent = 0;
    lastFaultEventHandledReason = self->_lastFaultEventHandledReason;
    self->_lastFaultEventHandledReason = 0;

    self->_unint64_t lastFaultEventHandledOptions = 0;
    self->_numLinkTestFailures = 0;
  }
}

void __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke(uint64_t a1, void *a2)
{
  v165[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 statusForDNS];
  v5 = [v3 statusForLocal];
  id v6 = [v3 statusForInternet];
  double v7 = [v3 dnsServers];
  if (v7)
  {
    BOOL v8 = [v3 dnsServers];
    BOOL v129 = [v8 count] == 0;
  }
  else
  {
    BOOL v129 = 1;
  }

  BOOL v9 = [v3 gatewayAddress];
  if (v9)
  {
    char v10 = [v3 gatewayAddress];
    BOOL v127 = [v10 length] == 0;
  }
  else
  {
    BOOL v127 = 1;
  }

  uint64_t v11 = [v3 statusForSiriTCP];
  uint64_t v12 = [v3 statusForSiriTLS];
  double v13 = [MEMORY[0x1E4F1CA60] dictionary];
  v139 = [MEMORY[0x1E4F28E78] stringWithString:@"LinkTestFailure"];
  [v139 appendFormat:@"_%@", *(void *)(a1 + 32)];
  [v13 setObject:*(void *)(a1 + 32) forKey:@"Invoke"];
  if (v4) {
    [v13 setObject:v4 forKey:@"DNS"];
  }
  if (v5) {
    [v13 setObject:v5 forKey:@"Local"];
  }
  if (v6) {
    [v13 setObject:v6 forKey:@"Internet"];
  }
  v133 = (__CFString *)v12;
  v126 = (uint64_t *)(a1 + 32);
  if (v11)
  {
    [v13 setObject:v11 forKey:@"SiriTCP"];
    if (!v12)
    {
      int v131 = 0;
LABEL_18:
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "siriTrafficClass"));
      uint64_t v15 = v13;
      [v13 setObject:v14 forKey:@"SiriTrafficClass"];

      goto LABEL_19;
    }
LABEL_17:
    [v13 setObject:v12 forKey:@"SiriTLS"];
    int v131 = 1;
    goto LABEL_18;
  }
  if (v12) {
    goto LABEL_17;
  }
  uint64_t v15 = v13;
  int v131 = 0;
LABEL_19:
  if ([v3 backhaulResultsValid])
  {
    objc_super v16 = [v3 downloadError];

    if (v16) {
      v17 = &kWFMeasureStatusBroken;
    }
    else {
      v17 = &kWFMeasureStatusOK;
    }
    [v15 setObject:*v17 forKey:@"Backhaul"];
  }
  if (*(unsigned char *)(a1 + 48) && [v3 seenSpecificAcFailure])
  {
    v18 = [v3 statusForAcFailure];
    [v15 setObject:v18 forKey:@"FltBadAC"];
  }
  v134 = v4;
  v135 = v6;
  v136 = v5;
  v137 = v11;
  if (v4 == kWFMeasureStatusOK)
  {
    int v132 = 0;
    BOOL v30 = v4;
  }
  else
  {
    v19 = kWFMeasureStatusBroken;
    if (v4 == kWFMeasureStatusBroken)
    {
      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v21 = *(void **)(a1 + 40);
      v165[0] = &unk_1F2B93D60;
      v164[0] = @"SessionNotificationFaultType";
      v164[1] = @"SessionNotificationInterfaceName";
      v22 = [v21 interfaceName];
      v165[1] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v165 forKeys:v164 count:2];
      v24 = v21;
      v5 = v136;
      [v20 postNotificationName:@"SessionNotificationFaultEventDetected" object:v24 userInfo:v23];

      v4 = v134;
      id v6 = v135;

      v19 = kWFMeasureStatusBroken;
    }
    if (v4) {
      BOOL v25 = v4 == v19;
    }
    else {
      BOOL v25 = 1;
    }
    int v26 = v25;
    int v132 = v26;
    if (v25)
    {
      v27 = @"_DNSNil";
      if (v127) {
        v27 = @"_DNSNoG";
      }
      if (v129) {
        v27 = @"_DNSNoDNS";
      }
      if (v129 && v127) {
        id v28 = @"_DNSNoGDNS";
      }
      else {
        id v28 = v27;
      }
      if (v4) {
        v29 = @"_DNS";
      }
      else {
        v29 = v28;
      }
      [v139 appendString:v29];
    }
    NSLog(&cfstr_SStatusfordnsL.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v4, v139);
    BOOL v30 = kWFMeasureStatusOK;
  }
  if (v6 == v30)
  {
    uint64_t v138 = 0;
  }
  else
  {
    objc_super v31 = kWFMeasureStatusBroken;
    if (v6 == kWFMeasureStatusBroken)
    {
      objc_super v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v33 = *(void **)(a1 + 40);
      v163[0] = &unk_1F2B93D78;
      v162[0] = @"SessionNotificationFaultType";
      v162[1] = @"SessionNotificationInterfaceName";
      v34 = [v33 interfaceName];
      v163[1] = v34;
      __int16 v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:v162 count:2];
      v36 = v33;
      v5 = v136;
      [v32 postNotificationName:@"SessionNotificationFaultEventDetected" object:v36 userInfo:v35];

      v4 = v134;
      id v6 = v135;

      objc_super v31 = kWFMeasureStatusBroken;
    }
    if (v6) {
      BOOL v37 = v6 == v31;
    }
    else {
      BOOL v37 = 1;
    }
    uint64_t v38 = v37;
    uint64_t v138 = v38;
    if (v37)
    {
      v39 = @"_IntNil";
      if (v127) {
        v39 = @"_IntNoG";
      }
      if (v129) {
        v39 = @"_IntNoDNS";
      }
      if (v129 && v127) {
        v40 = @"_IntNoGDNS";
      }
      else {
        v40 = v39;
      }
      if (v6) {
        v41 = @"_Int";
      }
      else {
        v41 = v40;
      }
      [v139 appendString:v41];
    }
    NSLog(&cfstr_SStatusforinte.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v6, v139);
    id v6 = kWFMeasureStatusOK;
  }
  if (v5 != v6)
  {
    v42 = kWFMeasureStatusBroken;
    if (v5 == kWFMeasureStatusBroken)
    {
      v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v44 = *(void **)(a1 + 40);
      v161[0] = &unk_1F2B93D90;
      v160[0] = @"SessionNotificationFaultType";
      v160[1] = @"SessionNotificationInterfaceName";
      v45 = [v44 interfaceName];
      v161[1] = v45;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:v160 count:2];
      v47 = v44;
      v5 = v136;
      [v43 postNotificationName:@"SessionNotificationFaultEventDetected" object:v47 userInfo:v46];

      v4 = v134;
      v42 = kWFMeasureStatusBroken;
      if (!v136) {
        goto LABEL_81;
      }
    }
    else if (!v5)
    {
      goto LABEL_81;
    }
    if (v5 != v42)
    {
LABEL_84:
      NSLog(&cfstr_SStatusforloca.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v5, v139);
      goto LABEL_85;
    }
LABEL_81:
    if ((v138 & 1) == 0) {
      NSLog(&cfstr_SWarningLocalT.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke");
    }
    [v139 appendString:@"_Loc"];
    goto LABEL_84;
  }
LABEL_85:
  if (*(unsigned char *)(a1 + 48) && [v3 seenSpecificAcFailure])
  {
    v48 = [v3 statusForAcFailure];
    [v139 appendFormat:@"_FltBadAC %@", v48];

    NSLog(&cfstr_SFaultWithSeen.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v3, v139);
    NSLog(&cfstr_SStatusforloca_0.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v5, v139, v15);
  }
  v49 = kWFMeasureStatusOK;
  if (v11 && v11 != kWFMeasureStatusOK)
  {
    if (v11 == kWFMeasureStatusBroken)
    {
      v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v51 = *(void **)(a1 + 40);
      v159[0] = &unk_1F2B93DA8;
      v158[0] = @"SessionNotificationFaultType";
      v158[1] = @"SessionNotificationInterfaceName";
      v52 = [v51 interfaceName];
      v159[1] = v52;
      v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:2];
      [v50 postNotificationName:@"SessionNotificationFaultEventDetected" object:v51 userInfo:v53];

      v4 = v134;
    }
    [v139 appendString:@"_SiriTCP"];
    NSLog(&cfstr_SStatusforsiri.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v11, v139, v15);
    v49 = kWFMeasureStatusOK;
    uint64_t v138 = 1;
  }
  v54 = v133;
  BOOL v25 = v133 == v49;
  int v55 = v131;
  if (v25) {
    int v55 = 0;
  }
  if (v55 == 1)
  {
    if (v133 == kWFMeasureStatusBroken)
    {
      v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v57 = *(void **)(a1 + 40);
      v157[0] = &unk_1F2B93DC0;
      v156[0] = @"SessionNotificationFaultType";
      v156[1] = @"SessionNotificationInterfaceName";
      v58 = [v57 interfaceName];
      v157[1] = v58;
      v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:v156 count:2];
      [v56 postNotificationName:@"SessionNotificationFaultEventDetected" object:v57 userInfo:v59];

      v4 = v134;
    }
    [v139 appendString:@"_SiriTLS"];
    NSLog(&cfstr_SStatusforsiri_0.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v133, v139, v15);
    uint64_t v138 = 1;
  }
  if (*(unsigned char *)(a1 + 48) && [v3 seenSpecificAcFailure])
  {
    [v139 appendFormat:@"_FltBadAC"];
    NSLog(&cfstr_SFaultWithSeen_0.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v3, v139, v15);
  }
  NSLog(&cfstr_SLqmWifi.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v3);
  if (_os_feature_enabled_impl())
  {
    v60 = [MEMORY[0x1E4FB6F38] sharedAnalyticsProcessor];

    if (v60)
    {
      id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v62 = *(void *)(a1 + 40);
      v63 = (void *)MEMORY[0x1E4FB6F58];
      if (*(void *)(v62 + 11968))
      {
        uint64_t v154 = *(void *)(MEMORY[0x1E4FB6F58] + 16);
        uint64_t v155 = *(void *)(v62 + 11968);
        v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
        [v61 addEntriesFromDictionary:v64];

        uint64_t v62 = *(void *)(a1 + 40);
      }
      v124 = v15;
      if (*(void *)(v62 + 11960))
      {
        uint64_t v152 = v63[3];
        uint64_t v153 = *(void *)(v62 + 11960);
        v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        [v61 addEntriesFromDictionary:v65];
      }
      v150[0] = v63[1];
      v123 = [MEMORY[0x1E4F1C9C8] date];
      v151[0] = v123;
      v150[1] = v63[4];
      v125 = v61;
      v130 = [NSNumber numberWithBool:v129];
      v151[1] = v130;
      v150[2] = v63[5];
      v128 = [NSNumber numberWithBool:v127];
      v151[2] = v128;
      v150[3] = v63[6];
      v122 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "dnsResultsValid"));
      v151[3] = v122;
      v150[4] = v63[7];
      v121 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "dnsSuccess"));
      v151[4] = v121;
      v150[5] = v63[8];
      v120 = [NSNumber numberWithBool:v138];
      v151[5] = v120;
      v150[6] = v63[9];
      v119 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "gatewayMaxRTT"));
      v151[6] = v119;
      v150[7] = v63[10];
      v118 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "gatewayMinRTT"));
      v151[7] = v118;
      v150[8] = v63[11];
      v117 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "gatewayPacketLoss"));
      v151[8] = v117;
      v150[9] = v63[12];
      v116 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "gatewayResultsValid"));
      uint64_t v66 = *(void *)(a1 + 32);
      v151[9] = v116;
      v151[10] = v66;
      uint64_t v67 = v63[14];
      v150[10] = v63[13];
      v150[11] = v67;
      v115 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      v151[11] = v115;
      v150[12] = v63[15];
      v114 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "localDNSMaxRTT"));
      v151[12] = v114;
      v150[13] = v63[16];
      v113 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "localDNSMinRTT"));
      v151[13] = v113;
      v150[14] = v63[17];
      v112 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "localDNSPacketLoss"));
      v151[14] = v112;
      v150[15] = v63[18];
      v111 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "localResultsValid"));
      v151[15] = v111;
      v150[16] = v63[19];
      v110 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "publicDNSMaxRTT"));
      v151[16] = v110;
      v150[17] = v63[20];
      v109 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "publicDNSMinRTT"));
      v151[17] = v109;
      v150[18] = v63[21];
      v108 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "publicDNSPacketLoss"));
      v151[18] = v108;
      v150[19] = v63[22];
      v107 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "publicResultsValid"));
      v151[19] = v107;
      v150[20] = v63[23];
      v68 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "seenSpecificAcFailure"));
      v151[20] = v68;
      v150[21] = v63[24];
      v69 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "siriTCPResultsValid"));
      v151[21] = v69;
      v150[22] = v63[25];
      v70 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "siriTCPSuccess"));
      v151[22] = v70;
      v150[23] = v63[26];
      v71 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "siriTLSResultsValid"));
      v151[23] = v71;
      v150[24] = v63[27];
      v72 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "siriTLSSuccess"));
      v151[24] = v72;
      v150[25] = v63[28];
      v73 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "siriTrafficClass"));
      v151[25] = v73;
      v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:26];
      [v125 addEntriesFromDictionary:v74];

      v4 = v134;
      if (v134)
      {
        uint64_t v148 = v63[29];
        v149 = v134;
        v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
        [v125 addEntriesFromDictionary:v75];
      }
      v54 = v133;
      if (v135)
      {
        uint64_t v146 = v63[30];
        v147 = v135;
        v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
        [v125 addEntriesFromDictionary:v76];
      }
      uint64_t v15 = v124;
      if (v136)
      {
        uint64_t v144 = v63[31];
        v145 = v136;
        v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
        [v125 addEntriesFromDictionary:v77];
      }
      if (v137)
      {
        uint64_t v142 = v63[32];
        v143 = v137;
        v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
        [v125 addEntriesFromDictionary:v78];
      }
      if (v131)
      {
        uint64_t v140 = v63[33];
        v141 = v133;
        v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
        [v125 addEntriesFromDictionary:v79];
      }
      v80 = [MEMORY[0x1E4FB6F38] sharedAnalyticsProcessor];
      [v80 processWAMessageMetric:*v63 data:v125];
    }
  }
  uint64_t v81 = *(void *)(a1 + 40);
  if ((v132 | v138) == 1)
  {
    ++*(void *)(v81 + 11976);
    NSLog(&cfstr_SULinkTestFail.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 678, *(void *)(*(void *)(a1 + 40) + 11976), v139);
    v82 = @"FoundFailure";
  }
  else
  {
    *(unsigned char *)(v81 + 11985) = 1;
    *(void *)(*(void *)(a1 + 40) + 11976) = 0;
    NSLog(&cfstr_SULinkTestPass.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 684);
    v82 = @"SuccessfulLinkTest";
  }
  [v15 setObject:@"YES" forKey:v82];
  uint64_t v83 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v83 + 11984))
  {
    if (*(unsigned char *)(v83 + 11985) || (unint64_t v85 = *(void *)(v83 + 11992), v85 >= 2))
    {
      *(void *)(v83 + 11992) = 0;
      uint64_t v86 = *(void *)(a1 + 40);
      if (!*(unsigned char *)(v86 + 11985)) {
        NSLog(&cfstr_SULinkTestHasN.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 718, *(void *)(v86 + 11992));
      }
      if (v138)
      {
        if (!v132 || *(void *)(*(void *)(a1 + 40) + 11976) < 2uLL) {
          goto LABEL_149;
        }
LABEL_138:
        NSLog(&cfstr_SULinktestfail.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 726);
        [v139 appendFormat:@"_MaxNonCrit"];
        goto LABEL_149;
      }
      if (v132)
      {
        if (*(void *)(*(void *)(a1 + 40) + 11976) > 1uLL) {
          goto LABEL_138;
        }
        if (!*(unsigned char *)(a1 + 48))
        {
          NSLog(&cfstr_SUFoundNonCrit.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 748);
          [v15 setObject:@"YES" forKey:@"WillAttemptRetest"];
          [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"BeforeNonCriticalFailureRetest_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
          *(void *)(*(void *)(a1 + 40) + 12024) = [v3 options];
          [*(id *)(a1 + 40) retryLinkTestInOneMinute];
          goto LABEL_157;
        }
LABEL_149:
        v99 = [NSString stringWithFormat:@"LinkTestFailure_%@", *v126];
        if ([v139 isEqualToString:v99])
        {
          NSLog(&cfstr_SUAttemptingTo.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 733, v139, *v126);
          v105 = MEMORY[0x1E4F14500];
          id v106 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
            __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke_cold_1((uint64_t)v139, v126);
          }

          __assert_rtn("-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", "WiFiUsageLinkSession.m", 735, "false");
        }
        if (v132)
        {
          BOOL v100 = *(void *)(*(void *)(a1 + 40) + 11976) > 1uLL;
        }
        else if (v138)
        {
          BOOL v100 = 0;
        }
        else
        {
          int v101 = [v3 seenSpecificAcFailure];
          BOOL v100 = 0;
          uint64_t v102 = 0;
          if (!v101)
          {
LABEL_156:
            NSLog(&cfstr_SUWillInduceFa.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 739, v139, v138, v100, v102);
            [v15 setObject:@"YES" forKey:@"WillInduceFaultEvent"];
            [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"BeforeInduceingFault_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
            *(void *)(*(void *)(a1 + 40) + 12024) = [v3 options];
            v103 = *(void **)(a1 + 40);
            v104 = [NSString stringWithString:v139];
            [v103 handleFaultEventWithReason:v104];

            goto LABEL_157;
          }
        }
        uint64_t v102 = *(unsigned __int8 *)(a1 + 48);
        goto LABEL_156;
      }
      if (((v138 & 1) != 0 || [v3 seenSpecificAcFailure]) && *(unsigned char *)(a1 + 48)) {
        goto LABEL_149;
      }
      if (*(unsigned char *)(*(void *)(a1 + 40) + 11985))
      {
        NSLog(&cfstr_SUFoundSuccess.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 757);
        [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"FinalResults_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
        v92 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
        v93 = v92;
        uint64_t v94 = *(void *)(*(void *)(a1 + 40) + 12040);
        uint64_t v95 = 2;
LABEL_147:
        [v92 networkActivityStop:1 withReason:v95 withClientMetric:"linkTestResults" withClientDict:v94 andError:0];

        *(void *)(*(void *)(a1 + 40) + 12024) = 0;
        uint64_t v97 = *(void *)(a1 + 40);
        v98 = *(void **)(v97 + 12040);
        *(void *)(v97 + 12040) = 0;

        goto LABEL_157;
      }
      NSLog(&cfstr_SUNotProceedin.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 769);
      v96 = @"LinkRecoverySkips";
    }
    else
    {
      *(void *)(v83 + 11992) = v85 + 1;
      NSLog(&cfstr_SULinkTestDidN.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 784, *(void *)(*(void *)(a1 + 40) + 11992));
      v96 = @"SkippingRecovery";
    }
    [v15 setObject:@"YES" forKey:v96];
    [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"FinalResults_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
    v92 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    v93 = v92;
    uint64_t v94 = *(void *)(*(void *)(a1 + 40) + 12040);
    uint64_t v95 = 4;
    goto LABEL_147;
  }
  NSLog(&cfstr_SULinkTestComp.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 690, *v126);
  if ([(id)*v126 isEqualToString:@"didHandleFaultEvent"])
  {
    if ((v132 | v138))
    {
      [v15 setObject:@"YES" forKey:@"FaultEventLinkNotRecovered"];
      NSLog(&cfstr_SULinkTestFail_0.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 699, *(void *)(*(void *)(a1 + 40) + 12016));
      uint64_t v84 = 3;
    }
    else
    {
      [v15 setObject:@"YES" forKey:@"FaultEventRecoveredLink"];
      NSLog(&cfstr_SULinkTestPass_0.isa, "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 696, *(void *)(*(void *)(a1 + 40) + 12016));
      uint64_t v84 = 2;
    }
    [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"FinalResults_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
    v87 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    [v87 networkActivityStop:1 withReason:v84 withClientMetric:"linkTestResults" withClientDict:*(void *)(*(void *)(a1 + 40) + 12040) andError:0];

    uint64_t v88 = *(void *)(a1 + 40);
    v89 = *(void **)(v88 + 12040);
    *(void *)(v88 + 12040) = 0;

    *(unsigned char *)(*(void *)(a1 + 40) + 11984) = 0;
    uint64_t v90 = *(void *)(a1 + 40);
    v91 = *(void **)(v90 + 12016);
    *(void *)(v90 + 12016) = 0;

    *(void *)(*(void *)(a1 + 40) + 12024) = 0;
    *(void *)(*(void *)(a1 + 40) + 11976) = 0;
    v54 = v133;
    v4 = v134;
  }
LABEL_157:
}

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v4 systemWakeStateDidChange:a3 wokenByWiFi:a4];
}

- (void)processIPv4Changes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v3 processIPv4Changes:a3];
}

- (void)processIPv6Changes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v3 processIPv6Changes:a3];
}

- (void)processDHCPChanges:(id)a3
{
  BOOL linkUp = self->_linkUp;
  id v5 = a3;
  NSLog(&cfstr_SDLinkupDDicti.isa, "-[WiFiUsageLinkSession processDHCPChanges:]", 897, linkUp, v5);
  v6.receiver = self;
  v6.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v6 processDHCPChanges:v5];
}

- (void)rangingCompleted
{
  NSLog(&cfstr_SDLinkupD.isa, a2, "-[WiFiUsageLinkSession rangingCompleted]", 918, self->_linkUp);
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v3 rangingCompleted];
}

- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageLinkSession;
  [(WiFiUsageSession *)&v11 processDriverAvailability:a3 available:a4 version:a5 flags:a6 eventID:a7 reason:a8 subReason:a9 minorReason:a10 reasonString:a11];
}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
}

- (void)updateLinkTestInterval:(unint64_t)a3
{
  self->_periodicLinkTestInterval = a3;
  NSLog(&cfstr_SNewIntervalLu.isa, a2, "-[WiFiUsageLinkSession updateLinkTestInterval:]", a3);
}

- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  objc_super v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v7 = [v6 persistentDomainForName:@"com.apple.wifipolicy.usagelinksession"];

  BOOL v8 = [v7 objectForKey:v9];
  if (v8)
  {
    NSLog(&cfstr_SFoundPreferen.isa, "-[WiFiUsageLinkSession getLazyNSNumberPreference:exists:]", @"com.apple.wifipolicy.usagelinksession", v9);
    v5[2](v5, v8);
  }
}

- (void)addDictionary:(id)a3 withKeysPrefix:(id)a4 toFlatDictionary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__WiFiUsageLinkSession_addDictionary_withKeysPrefix_toFlatDictionary___block_invoke;
  v11[3] = &unk_1E69BCBF0;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
}

void __70__WiFiUsageLinkSession_addDictionary_withKeysPrefix_toFlatDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [*(id *)(a1 + 32) stringByAppendingString:a2];
  objc_super v6 = [*(id *)(a1 + 40) valueForKey:v5];

  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    id v8 = [v7 valueForKey:v5];
    NSLog(&cfstr_SKeywithprefix.isa, "-[WiFiUsageLinkSession addDictionary:withKeysPrefix:toFlatDictionary:]_block_invoke", v5, v8, v9);
  }
  else
  {
    [v7 setObject:v9 forKey:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTestResult, 0);
  objc_storeStrong((id *)&self->_lastFaultEventHandledReason, 0);
  objc_storeStrong((id *)&self->_lastFaultEventHandled, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_lastFaultIndicationTime, 0);

  objc_storeStrong((id *)&self->_lastLinkTest, 0);
}

void __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke_cold_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a2;
  int v3 = 136315906;
  objc_super v4 = "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 734;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v2;
  _os_log_fault_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s:%u: Attempting to reset chip with vague reason %@, linkTestIniated %@\n", (uint8_t *)&v3, 0x26u);
}

@end