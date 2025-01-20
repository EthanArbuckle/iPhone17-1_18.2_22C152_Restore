@interface WiFiUsageNetworkSession
- (BOOL)isSessionHarvestable;
- (WiFiUsageNetworkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)displayStateDidChange:(BOOL)a3;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)processForgetNetwork:(id)a3;
- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6;
- (void)sessionDidEnd;
- (void)sessionDidStart;
@end

@implementation WiFiUsageNetworkSession

- (WiFiUsageNetworkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)WiFiUsageNetworkSession;
  v4 = [(WiFiUsageSession *)&v15 initWithSessionType:3 andInterfaceName:a3 andCapabilities:a4];
  lastNetworkDetails = v4->_lastNetworkDetails;
  v4->_lastNetworkDetails = 0;

  v4->_linkUp = 0;
  v4->_networkUsageDuration = 0.0;
  v4->_dnuEnabled = 0;
  v4->_dnuEnabled = DiagnosticLogSubmissionEnabled();
  if (_os_feature_enabled_impl())
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.WiFiLinkState-Biome-Event", v6);
    WiFiLinkStateBiomeEventQueue = v4->_WiFiLinkStateBiomeEventQueue;
    v4->_WiFiLinkStateBiomeEventQueue = (OS_dispatch_queue *)v7;
  }
  else
  {
    v9 = v4->_WiFiLinkStateBiomeEventQueue;
    v4->_WiFiLinkStateBiomeEventQueue = 0;

    NSLog(&cfstr_SDoNotAllocate.isa, "-[WiFiUsageNetworkSession initWithInterfaceName:andCapabilities:]");
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  neighborBssList = v4->_neighborBssList;
  v4->_neighborBssList = (NSMutableSet *)v10;

  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  otherBssList = v4->_otherBssList;
  v4->_otherBssList = (NSMutableSet *)v12;

  return v4;
}

- (void)displayStateDidChange:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageNetworkSession;
  -[WiFiUsageSession displayStateDidChange:](&v5, sel_displayStateDidChange_);
  if (!a3 && ![(WiFiUsageSession *)self poweredOn])
  {
    if ([(WiFiUsageSession *)self isSessionActive])
    {
      NSLog(&cfstr_SNetworkSessio.isa, "-[WiFiUsageNetworkSession displayStateDidChange:]");
      [(WiFiUsageNetworkSession *)self sessionDidEnd];
    }
  }
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v24.receiver = self;
  v24.super_class = (Class)WiFiUsageNetworkSession;
  [(WiFiUsageSession *)&v24 joinStateDidChange:v12 withReason:a4 lastDisconnectReason:a5 lastJoinFailure:a6 andNetworkDetails:v13];
  lastNetworkDetails = self->_lastNetworkDetails;
  if (v12) {
    BOOL v15 = lastNetworkDetails == 0;
  }
  else {
    BOOL v15 = 0;
  }
  int v16 = v15;
  if (v15)
  {
    BOOL v17 = [(WiFiUsageSession *)self isSessionActive];
    lastNetworkDetails = self->_lastNetworkDetails;
    if (!lastNetworkDetails)
    {
      if (!v17) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_20:
    v19 = [(WiFiUsageNetworkDetails *)lastNetworkDetails networkName];
    int v20 = [v19 isEqual:v12];

    BOOL v21 = [(WiFiUsageSession *)self isSessionActive];
    if (v20)
    {
      if (((v16 | !v21) & 1) == 0) {
        goto LABEL_26;
      }
LABEL_25:
      NSLog(&cfstr_SNetworkSessio_0.isa, "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
      [(WiFiUsageNetworkSession *)self sessionDidStart];
      goto LABEL_26;
    }
    if (!v21 && !v17) {
      goto LABEL_25;
    }
LABEL_24:
    NSLog(&cfstr_SNetworkSessio.isa, "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
    [(WiFiUsageNetworkSession *)self sessionDidEnd];
    goto LABEL_25;
  }
  if (v12 || !lastNetworkDetails)
  {
    if (!v12 || !lastNetworkDetails) {
      goto LABEL_26;
    }
    BOOL v17 = 0;
    goto LABEL_20;
  }
  BOOL v18 = [(WiFiUsageSession *)self isSessionActive];
  if (!a6 && v18)
  {
    NSLog(&cfstr_SNetworkSessio.isa, "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
    [(WiFiUsageNetworkSession *)self sessionDidEnd];
  }
LABEL_26:
  if (v13)
  {
    v22 = (WiFiUsageNetworkDetails *)[v13 copy];
    v23 = self->_lastNetworkDetails;
    self->_lastNetworkDetails = v22;
  }
}

- (void)processForgetNetwork:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    if (v4)
    {
      objc_super v5 = [v4 networkName];

      if (v5)
      {
        WiFiLinkStateBiomeEventQueue = self->_WiFiLinkStateBiomeEventQueue;
        if (WiFiLinkStateBiomeEventQueue)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke;
          block[3] = &unk_1E69BC8D8;
          id v8 = v4;
          dispatch_async(WiFiLinkStateBiomeEventQueue, block);
        }
        else
        {
          NSLog(&cfstr_SWifilinkstate.isa, "-[WiFiUsageNetworkSession processForgetNetwork:]");
        }
      }
      else
      {
        NSLog(&cfstr_SNetworknameNu.isa, "-[WiFiUsageNetworkSession processForgetNetwork:]");
      }
    }
    else
    {
      NSLog(&cfstr_SWifiusagenetw.isa, "-[WiFiUsageNetworkSession processForgetNetwork:]");
    }
  }
  else
  {
    NSLog(&cfstr_SDoNothingAsWi.isa, "-[WiFiUsageNetworkSession processForgetNetwork:]");
  }
}

void __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = __softlink__BiomeLibrary();
  v3 = [v2 Device];
  id v4 = [v3 Wireless];
  objc_super v5 = [v4 WiFi];

  if (v5)
  {
    v6 = [v5 pruner];
    if (v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke_23;
      v8[3] = &unk_1E69BD7A0;
      id v9 = *(id *)(a1 + 32);
      [v6 deleteEventsPassingTest:v8];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v7 = [*(id *)(a1 + 32) networkName];
      *(_DWORD *)buf = 136315650;
      v11 = "-[WiFiUsageNetworkSession processForgetNetwork:]_block_invoke";
      __int16 v12 = 2160;
      uint64_t v13 = 1752392040;
      __int16 v14 = 2112;
      BOOL v15 = v7;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: BMPruner NUll - SSID:%{mask.hash}@ ", buf, 0x20u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v6 = [*(id *)(a1 + 32) networkName];
    *(_DWORD *)buf = 136315650;
    v11 = "-[WiFiUsageNetworkSession processForgetNetwork:]_block_invoke";
    __int16 v12 = 2160;
    uint64_t v13 = 1752392040;
    __int16 v14 = 2112;
    BOOL v15 = v6;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: BMStream NUll - SSID:%{mask.hash}@ ", buf, 0x20u);
LABEL_8:
  }
}

uint64_t __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke_23(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  id v4 = [*(id *)(a1 + 32) networkName];
  objc_super v5 = [v3 SSID];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v36 = a4;
  BOOL v8 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  v11 = [MEMORY[0x1E4F1C9C8] date];
  BOOL linkUp = self->_linkUp;
  BOOL v13 = !self->_linkUp && v8;
  BOOL v14 = !v8;
  if (!self->_linkUp) {
    BOOL v14 = 0;
  }
  v38 = v11;
  BOOL v35 = v14;
  if (v13)
  {
    objc_storeStrong((id *)&self->_lastLinkUpTime, v11);
    self->_BOOL linkUp = 1;
    BOOL v15 = [v10 networkName];
    uint64_t v16 = [(WiFiUsageNetworkDetails *)self->_lastNetworkDetails networkName];
    if ([v15 isEqualToString:v16])
    {
      [(NSDate *)self->_lastLinkUpTime timeIntervalSinceDate:self->_lastLinkDownTime];
      double v18 = v17;

      if (v18 < (double)0x14uLL)
      {
        BOOL v19 = 0;
        int v20 = ![(WiFiUsageSession *)self isSessionActive];
        goto LABEL_17;
      }
    }
    else
    {
    }
    v22 = [(WiFiUsageNetworkDetails *)self->_lastNetworkDetails networkName];
    uint64_t v23 = [v22 length];

    BOOL v19 = v23 != 0;
    objc_super v24 = [v10 networkName];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      v26 = (WiFiUsageNetworkDetails *)[v10 copy];
      lastNetworkDetails = self->_lastNetworkDetails;
      self->_lastNetworkDetails = v26;
    }
  }
  else if (v14)
  {
    objc_storeStrong((id *)&self->_lastLinkDownTime, v11);
    [(NSDate *)self->_lastLinkDownTime timeIntervalSinceDate:self->_lastLinkUpTime];
    BOOL v19 = 0;
    self->_networkUsageDuration = v21 + self->_networkUsageDuration;
    self->_BOOL linkUp = 0;
  }
  else
  {
    BOOL v19 = 0;
  }
  int v20 = 1;
LABEL_17:
  if (!_os_feature_enabled_impl())
  {
    int64_t v29 = a5;
    BOOL v30 = v36;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315907;
    v44 = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
    __int16 v45 = 2113;
    id v46 = v10;
    __int16 v47 = 1024;
    BOOL v48 = v13;
    __int16 v49 = 1024;
    BOOL v50 = v35;
    v31 = MEMORY[0x1E4F14500];
    v32 = "%s: Do Nothing as WiFiDirectDonation Feature Flag Disabled! details:%{private}@ linkWentUp:%d linkWentDown:%d ";
    goto LABEL_27;
  }
  if (!v10 || linkUp == v8)
  {
    int64_t v29 = a5;
    BOOL v30 = v36;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315907;
    v44 = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
    __int16 v45 = 2113;
    id v46 = v10;
    __int16 v47 = 1024;
    BOOL v48 = v13;
    __int16 v49 = 1024;
    BOOL v50 = v35;
    v31 = MEMORY[0x1E4F14500];
    v32 = "%s: InValid inputs details:%{private}@ linkWentUp:%d linkWentDown:%d";
LABEL_27:
    _os_log_impl(&dword_1D3CCD000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x22u);
LABEL_28:
    if (!v19) {
      goto LABEL_35;
    }
    goto LABEL_29;
  }
  WiFiLinkStateBiomeEventQueue = self->_WiFiLinkStateBiomeEventQueue;
  int64_t v29 = a5;
  BOOL v30 = v36;
  if (!WiFiLinkStateBiomeEventQueue)
  {
    NSLog(&cfstr_SWifilinkstate.isa, "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    if (!v19) {
      goto LABEL_35;
    }
LABEL_29:
    if ([(WiFiUsageSession *)self isAssociated])
    {
      v33 = self->_lastNetworkDetails;
      if (v33)
      {
        v34 = (void *)[(WiFiUsageNetworkDetails *)v33 copy];
        [(WiFiUsageSession *)self setNetworkDetailsAtEnd:v34];
      }
    }
    v39.receiver = self;
    v39.super_class = (Class)WiFiUsageNetworkSession;
    [(WiFiUsageSession *)&v39 linkStateDidChange:v8 isInvoluntary:v30 linkChangeReason:v29 linkChangeSubreason:a6 withNetworkDetails:v10];
    NSLog(&cfstr_SNetworkSessio.isa, "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    [(WiFiUsageNetworkSession *)self sessionDidEnd];
    if (v20) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__WiFiUsageNetworkSession_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails___block_invoke;
  block[3] = &unk_1E69BC930;
  id v41 = v10;
  BOOL v42 = v13;
  dispatch_async(WiFiLinkStateBiomeEventQueue, block);

  if (v19) {
    goto LABEL_29;
  }
LABEL_35:
  v39.receiver = self;
  v39.super_class = (Class)WiFiUsageNetworkSession;
  [(WiFiUsageSession *)&v39 linkStateDidChange:v8 isInvoluntary:v30 linkChangeReason:v29 linkChangeSubreason:a6 withNetworkDetails:v10];
  if (v20)
  {
LABEL_36:
    NSLog(&cfstr_SNetworkSessio_0.isa, "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    [(WiFiUsageNetworkSession *)self sessionDidStart];
  }
LABEL_37:
}

void __116__WiFiUsageNetworkSession_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v2 = (void *)getBMDeviceWiFiClass_softClass;
  uint64_t v23 = getBMDeviceWiFiClass_softClass;
  if (!getBMDeviceWiFiClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBMDeviceWiFiClass_block_invoke;
    uint64_t v25 = &unk_1E69BD7C8;
    v26 = &v20;
    __getBMDeviceWiFiClass_block_invoke((uint64_t)buf);
    v2 = (void *)v21[3];
  }
  v3 = v2;
  _Block_object_dispose(&v20, 8);
  id v4 = [v3 alloc];
  objc_super v5 = objc_msgSend(*(id *)(a1 + 32), "networkName", v20);
  uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  dispatch_queue_t v7 = (void *)[v4 initWithSSID:v5 starting:v6];

  if (v7)
  {
    BOOL v8 = __softlink__BiomeLibrary();
    id v9 = [v8 Device];
    id v10 = [v9 Wireless];
    v11 = [v10 WiFi];

    if (v11)
    {
      __int16 v12 = [v11 source];
      BOOL v13 = v12;
      if (v12)
      {
        [v12 sendEvent:v7];
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          double v18 = [*(id *)(a1 + 32) networkName];
          int v19 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSub"
                               "reason:withNetworkDetails:]_block_invoke";
          *(_WORD *)&buf[12] = 2160;
          *(void *)&buf[14] = 1752392040;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v25 = v18;
          LOWORD(v26) = 1024;
          *(_DWORD *)((char *)&v26 + 2) = v19;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: BMSource NUll - SSID:%{mask.hash}@ linkstate:%d ", buf, 0x26u);
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [*(id *)(a1 + 32) networkName];
      int v17 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreas"
                           "on:withNetworkDetails:]_block_invoke";
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v25 = v16;
      LOWORD(v26) = 1024;
      *(_DWORD *)((char *)&v26 + 2) = v17;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: BMStream NUll - SSID:%{mask.hash}@ linkstate:%d ", buf, 0x26u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = [*(id *)(a1 + 32) networkName];
    int v15 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason"
                         ":withNetworkDetails:]_block_invoke";
    *(_WORD *)&buf[12] = 2160;
    *(void *)&buf[14] = 1752392040;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v25 = v14;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = v15;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: BMDeviceWiFi Allocation failed SSID:%{mask.hash}@ linkstate:%d ", buf, 0x26u);
  }
}

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageNetworkSession;
  [(WiFiUsageSession *)&v16 scanningStateDidChange:v8 client:a4 neighborBSS:v10 otherBSS:v11];
  if (self->_linkUp)
  {
    if (v10)
    {
      neighborBssList = self->_neighborBssList;
      BOOL v13 = [v10 allObjects];
      [(NSMutableSet *)neighborBssList addObjectsFromArray:v13];
    }
    if (v11)
    {
      otherBssList = self->_otherBssList;
      int v15 = [v11 allObjects];
      [(NSMutableSet *)otherBssList addObjectsFromArray:v15];
    }
  }
}

- (void)sessionDidStart
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageNetworkSession;
  [(WiFiUsageSession *)&v3 sessionDidStart];
  self->_networkUsageDuration = 0.0;
  [(NSMutableSet *)self->_neighborBssList removeAllObjects];
  [(NSMutableSet *)self->_otherBssList removeAllObjects];
}

- (void)sessionDidEnd
{
  if (self->_networkUsageDuration != 0.0)
  {
    -[WiFiUsageSession setSessionDuration:](self, "setSessionDuration:");
    [(WiFiUsageSession *)self setSessionStartTime:0];
  }
  [(WiFiUsageSession *)self setNeighborBssCount:[(NSMutableSet *)self->_neighborBssList count]];
  [(WiFiUsageSession *)self setOtherBssCount:[(NSMutableSet *)self->_otherBssList count]];
  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageNetworkSession;
  [(WiFiUsageSession *)&v5 sessionDidEnd];
  if ([(WiFiUsageNetworkSession *)self isSessionHarvestable])
  {
    objc_super v3 = [[WiFiUsageConnectionQualityRecord alloc] initWithUsageSession:self andNeighborBssList:self->_neighborBssList andOtherBssList:self->_otherBssList];
    id v4 = v3;
    if (v3) {
      [(WiFiUsageConnectionQualityRecord *)v3 queryNetworkPerformanceFeedAndSubmitToGeoWiFi];
    }
  }
}

- (BOOL)isSessionHarvestable
{
  objc_super v3 = [(WiFiUsageSession *)self networkDetails];
  if ([(WiFiUsageSession *)self privacyRestrictionDisabled]) {
    goto LABEL_16;
  }
  if (!self->_dnuEnabled || v3 == 0) {
    goto LABEL_25;
  }
  if ([v3 isHidden])
  {
    NSLog(&cfstr_SHiddenNetwork.isa, "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  if ([v3 isHome])
  {
    NSLog(&cfstr_SHomeNetworkNo.isa, "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  if ([v3 hasNoMap])
  {
    NSLog(&cfstr_SPrivateNetwor.isa, "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  if ([v3 isPersonalHotspot])
  {
    NSLog(&cfstr_SPersonalHotsp.isa, "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }
  objc_super v5 = [v3 connectedBss];
  if ([v5 networkAccessCode] != 2)
  {
    uint64_t v6 = [v3 connectedBss];
    uint64_t v7 = [v6 networkAccessCode];

    if (v7 == 3) {
      goto LABEL_16;
    }
    if ([v3 usageRank] <= 3)
    {
      NSLog(&cfstr_STopNetworkNot.isa, "-[WiFiUsageNetworkSession isSessionHarvestable]");
    }
    else
    {
      [(WiFiUsageSession *)self sessionDuration];
      if (v8 <= 60.0)
      {
        NSLog(&cfstr_SShortDataSess.isa, "-[WiFiUsageNetworkSession isSessionHarvestable]");
      }
      else
      {
        if (+[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:0])
        {
          goto LABEL_16;
        }
        NSLog(&cfstr_SLossCoinTossN.isa, "-[WiFiUsageNetworkSession isSessionHarvestable]");
      }
    }
LABEL_25:
    BOOL v9 = 0;
    goto LABEL_17;
  }

LABEL_16:
  BOOL v9 = 1;
LABEL_17:

  return v9;
}

- (id)metricName
{
  return @"com.apple.wifi.linksession";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_WiFiLinkStateBiomeEventQueue, 0);
  objc_storeStrong((id *)&self->_otherBssList, 0);
  objc_storeStrong((id *)&self->_neighborBssList, 0);
  objc_storeStrong((id *)&self->_lastLinkDownTime, 0);
  objc_storeStrong((id *)&self->_lastLinkUpTime, 0);

  objc_storeStrong((id *)&self->_lastNetworkDetails, 0);
}

@end