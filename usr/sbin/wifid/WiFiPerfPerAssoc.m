@interface WiFiPerfPerAssoc
+ (BOOL)_isCollectionEnabled;
+ (id)sharedInstance;
+ (void)initWithWiFiManager:(void *)a3 queue:(id)a4;
- (AnalyticsWorkspace)analyticsWorkspace;
- (BOOL)_networkSuitableForCollection:(__WiFiNetwork *)a3;
- (BOOL)activeUseBeingTracked;
- (BOOL)deviceIsAssociated;
- (BOOL)deviceUnderActiveUse;
- (BOOL)initialized;
- (NSMutableArray)sessionsWaitingForFinalization;
- (NetworkPerformanceFeed)perfFeed;
- (OS_dispatch_queue)symptomsReplyQueue;
- (OS_dispatch_queue)utilityConcurrent;
- (OS_dispatch_queue)wifiPPASerialQ;
- (WiFiPerfPerAssoc)init;
- (WiFiPerfPerAssocSession)currentSession;
- (id)_initPrivate;
- (id)getBSSIDForCurrentSession;
- (int)displayStateToken;
- (void)_associatedStateDidChange:(BOOL)a3 withAssociatedNetworkRecord:(void *)a4 withChangeReason:(unsigned int)a5;
- (void)_beginActiveUsageForSession:(id)a3;
- (void)_beginPollingForInstantaenousScorecards;
- (void)_endActiveUsageForSession:(id)a3;
- (void)_getHistoricalScorecardSession:(id)a3 andReply:(id)a4;
- (void)_handleDisplayStateChange;
- (void)_locationUpdateNotificationHandler:(id)a3;
- (void)_pollInstantaenousAndUpdateValues;
- (void)_stopPollingForInstantaneousScorecards;
- (void)associatedStateDidChange:(BOOL)a3 withAssociatedNetworkRecord:(void *)a4 withChangeReason:(unsigned int)a5;
- (void)dealloc;
- (void)finalizeFirstSessionThatRequiresItWhenAppropriate;
- (void)finalizeSession:(id)a3;
- (void)ingestLQMUpdate:(id)a3;
- (void)ingestScanResults:(id)a3 currentSSID:(id)a4 andReply:(id)a5;
- (void)setActiveUseBeingTracked:(BOOL)a3;
- (void)setAnalyticsWorkspace:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setDeviceIsAssociated:(BOOL)a3;
- (void)setDeviceUnderActiveUse:(BOOL)a3;
- (void)setDisplayStateToken:(int)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setPerfFeed:(id)a3;
- (void)setSessionsWaitingForFinalization:(id)a3;
- (void)setSymptomsReplyQueue:(id)a3;
- (void)setUtilityConcurrent:(id)a3;
- (void)setWifiPPASerialQ:(id)a3;
@end

@implementation WiFiPerfPerAssoc

+ (id)sharedInstance
{
  if (+[WiFiUsageMonitor sharedInstance])
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "![WiFiUsageMonitor sharedInstance]", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 79, 0);
  }
  else if (+[WiFiPerfPerAssoc _isCollectionEnabled])
  {
    if (objc_msgSend(+[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager"), "isAuthorized"))
    {
      if (qword_10027DC70 != -1) {
        dispatch_once(&qword_10027DC70, &stru_100243440);
      }
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "[[WiFiLocationManager sharedWiFiLocationManager] isAuthorized]", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 84, 0);
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "[WiFiPerfPerAssoc _isCollectionEnabled]", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 82, 0);
  }
  return (id)qword_10027DC78;
}

- (WiFiPerfPerAssoc)init
{
}

- (id)_initPrivate
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3052000000;
  v21 = sub_100022D98;
  v22 = sub_100022C6C;
  uint64_t v23 = 0;
  v17.receiver = self;
  v17.super_class = (Class)WiFiPerfPerAssoc;
  v2 = [(WiFiPerfPerAssoc *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v19[5] = (uint64_t)v2;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.wifid.symptomsPerfPoint.interactionQ", v4);
    v3->_wifiPPASerialQ = (OS_dispatch_queue *)v5;
    if (v5)
    {
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifid.symptomsPerfPoint.symptomsReplyQ", v6);
      v3->_symptomsReplyQueue = (OS_dispatch_queue *)v7;
      if (v7)
      {
        v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifid.symptomsPerfPoint.utilityConcurrentQueue", v8);
        v3->_utilityConcurrent = (OS_dispatch_queue *)v9;
        if (v9)
        {
          id v10 = objc_alloc((Class)AnalyticsWorkspace);
          v11 = (AnalyticsWorkspace *)[v10 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
          v3->_analyticsWorkspace = v11;
          if (v11)
          {
            v12 = (NetworkPerformanceFeed *)[objc_alloc((Class)NetworkPerformanceFeed) initWithWorkspace:v3->_analyticsWorkspace];
            v3->_perfFeed = v12;
            if (v12)
            {
              [(NetworkPerformanceFeed *)v12 setQueue:v3->_symptomsReplyQueue];
              v3->_sessionsWaitingForFinalization = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
              [+[NSNotificationCenter defaultCenter] addObserver:v3 selector:"_locationUpdateNotificationHandler:" name:@"com.apple.wifid.locationUpdateNotification" object:0];
              wifiPPASerialQ = v3->_wifiPPASerialQ;
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_100177298;
              handler[3] = &unk_100243468;
              handler[4] = &v18;
              notify_register_dispatch("com.apple.iokit.hid.displayStatus", &v3->_displayStateToken, wifiPPASerialQ, handler);
              if (notify_is_valid_token(v3->_displayStateToken))
              {
                *(_WORD *)&v3->_deviceUnderActiveUse = 0;
                v3->_initialized = 1;
                goto LABEL_9;
              }
              fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "notify_is_valid_token(_displayStateToken)", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 136, 0);
              if (qword_10027DD68) {
                [(id)qword_10027DD68 WFLog:3 message:"Failed to notify_register_dispatch display state"];
              }
            }
            else
            {
              fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_perfFeed", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 125, 0);
              if (qword_10027DD68) {
                [(id)qword_10027DD68 WFLog:3 message:"Couldn't [NetworkPerformanceFeed initWithWorkspace:]"];
              }
            }
          }
          else
          {
            fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_analyticsWorkspace", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 122, 0);
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3 message:"Couldn't [AnalyticsWorkspace initWorkspaceWithService:]"];
            }
          }
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_utilityConcurrent", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 119, 0);
        }
      }
      else
      {
        fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_symptomsReplyQueue", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 116, 0);
      }
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_wifiPPASerialQ", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 113, 0);
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 108, 0);
  }
LABEL_9:
  if (!v3->_initialized)
  {

    v3 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v3;
}

+ (void)initWithWiFiManager:(void *)a3 queue:(id)a4
{
  qword_10027DC88 = (uint64_t)a3;
  qword_10027DC90 = (uint64_t)a4;
}

- (void)associatedStateDidChange:(BOOL)a3 withAssociatedNetworkRecord:(void *)a4 withChangeReason:(unsigned int)a5
{
}

- (void)_associatedStateDidChange:(BOOL)a3 withAssociatedNetworkRecord:(void *)a4 withChangeReason:(unsigned int)a5
{
  if (self->_initialized)
  {
    BOOL v6 = a3;
    v8 = &v16;
    uint64_t v16 = 0;
    objc_super v17 = &v16;
    uint64_t v18 = 0x2020000000;
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    if (a4)
    {
      dispatch_queue_t v9 = sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)a4);
      v8 = v17;
    }
    else
    {
      dispatch_queue_t v9 = 0;
    }
    unint64_t v19 = (unint64_t)v9;
    uint64_t v10 = v8[3];
    if (v6)
    {
      if (!v10)
      {
        fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "!isAssociated || networkCopy", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 172, 0);
LABEL_15:
        _Block_object_dispose(&v16, 8);
        return;
      }
    }
    else if (!v10)
    {
LABEL_10:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100177484;
      block[3] = &unk_100243490;
      BOOL v15 = v6;
      block[4] = self;
      block[5] = &v16;
      unsigned int v14 = a5;
      dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], block);
      goto LABEL_15;
    }
    if (!-[WiFiPerfPerAssoc _networkSuitableForCollection:](self, "_networkSuitableForCollection:"))
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:@"%s: network not suitable for collection" message:3];
      }
      v12 = (const void *)v17[3];
      if (v12)
      {
        CFRelease(v12);
        v17[3] = 0;
      }
      goto LABEL_15;
    }
    goto LABEL_10;
  }
}

- (id)getBSSIDForCurrentSession
{
  if ([(WiFiPerfPerAssoc *)self currentSession]
    && [(WiFiPerfPerAssocSession *)[(WiFiPerfPerAssoc *)self currentSession] connectedBSSID])
  {
    v3 = [(WiFiPerfPerAssoc *)self currentSession];
    return [(WiFiPerfPerAssocSession *)v3 connectedBSSID];
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self.currentSession && self.currentSession.connectedBSSID", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 227, 0);
    return 0;
  }
}

- (void)finalizeFirstSessionThatRequiresItWhenAppropriate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017795C;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], block);
}

- (void)finalizeSession:(id)a3
{
  if ([a3 hasBeenFinalized])
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "!session.hasBeenFinalized", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 260, 0);
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s Told to finalize a session that's already finalized: %@", "-[WiFiPerfPerAssoc finalizeSession:]", [a3 connectedBSSID]);
    }
  }
  else
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3052000000;
    uint64_t v10 = sub_100022D98;
    v11 = sub_100022C6C;
    id v12 = (id)0xAAAAAAAAAAAAAAAALL;
    id v12 = a3;
    [(id)v8[5] setHasBeenFinalized:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100177CB4;
    v6[3] = &unk_1002434B8;
    v6[4] = a3;
    v6[5] = &v7;
    [(WiFiPerfPerAssoc *)self _getHistoricalScorecardSession:a3 andReply:v6];
    _Block_object_dispose(&v7, 8);
  }
}

- (void)_beginActiveUsageForSession:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = sub_100022D98;
  v7[4] = sub_100022C6C;
  v7[5] = self;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_100022D98;
  v5[4] = sub_100022C6C;
  id v6 = (id)0xAAAAAAAAAAAAAAAALL;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177EF8;
  block[3] = &unk_1002433F8;
  block[4] = self;
  void block[5] = v7;
  void block[6] = v5;
  dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], block);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
}

- (void)_endActiveUsageForSession:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = sub_100022D98;
  v7[4] = sub_100022C6C;
  v7[5] = self;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_100022D98;
  v5[4] = sub_100022C6C;
  id v6 = (id)0xAAAAAAAAAAAAAAAALL;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001782D0;
  block[3] = &unk_1002433F8;
  block[4] = self;
  void block[5] = v7;
  void block[6] = v5;
  dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], block);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
}

- (void)_handleDisplayStateChange
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3052000000;
  v3[3] = sub_100022D98;
  v3[4] = sub_100022C6C;
  v3[5] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10017860C;
  v2[3] = &unk_10023ECC0;
  v2[4] = self;
  v2[5] = v3;
  dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], v2);
  _Block_object_dispose(v3, 8);
}

- (void)ingestLQMUpdate:(id)a3
{
  if (self->_initialized)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3052000000;
    v7[3] = sub_100022D98;
    v7[4] = sub_100022C6C;
    v7[5] = self;
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = sub_100022D98;
    v5[4] = sub_100022C6C;
    id v6 = (id)0xAAAAAAAAAAAAAAAALL;
    id v6 = [a3 copy];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100178848;
    v4[3] = &unk_1002416E8;
    v4[4] = v7;
    v4[5] = v5;
    dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], v4);
    _Block_object_dispose(v5, 8);
    _Block_object_dispose(v7, 8);
  }
}

- (void)_locationUpdateNotificationHandler:(id)a3
{
  if ([a3 object]
    && ([a3 object], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(WiFiPerfPerAssoc *)self currentSession])
  {
    id v5 = [a3 object];
    if ([(WiFiPerfPerAssoc *)self deviceIsAssociated])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100178A00;
      block[3] = &unk_10023EC30;
      block[4] = self;
      void block[5] = v5;
      dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], block);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self.deviceIsAssociated", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 380, 0);
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "note.object && [note.object isKindOfClass:[CLLocation class]] && self.currentSession", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 378, 0);
  }
}

- (void)ingestScanResults:(id)a3 currentSSID:(id)a4 andReply:(id)a5
{
  if (self->_initialized)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_100022D98;
    v6[4] = sub_100022C6C;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100178B6C;
    v5[3] = &unk_1002434E0;
    v5[4] = a3;
    void v5[5] = a4;
    v5[6] = a5;
    v5[7] = v6;
    dispatch_async((dispatch_queue_t)[(WiFiPerfPerAssoc *)self wifiPPASerialQ], v5);
    _Block_object_dispose(v6, 8);
  }
}

- (void)_beginPollingForInstantaenousScorecards
{
  [(WiFiPerfPerAssoc *)self _stopPollingForInstantaneousScorecards];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178D10;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  qword_10027DDB0 = (uint64_t)dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_time_t v3 = dispatch_time(0, 300000000000);
  v4 = [(WiFiPerfPerAssoc *)self wifiPPASerialQ];
  dispatch_after(v3, (dispatch_queue_t)v4, (dispatch_block_t)qword_10027DDB0);
}

- (void)_stopPollingForInstantaneousScorecards
{
  v2 = (void *)qword_10027DDB0;
  if (qword_10027DDB0)
  {
    if (!dispatch_block_testcancel((dispatch_block_t)qword_10027DDB0))
    {
      dispatch_block_cancel(v2);

      qword_10027DDB0 = 0;
    }
  }
}

- (void)_pollInstantaenousAndUpdateValues
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = sub_100022D98;
  v4[4] = sub_100022C6C;
  v4[5] = self;
  perfFeed = self->_perfFeed;
  uint64_t v5 = kSymptomAnalyticsServiceNetworkAttachmentInstant;
  uint64_t v6 = kSymptomAnalyticsServiceNetworkAttachmentCurrent;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100178EDC;
  v3[3] = &unk_100242758;
  v3[4] = v4;
  [(NetworkPerformanceFeed *)perfFeed fullScorecardFor:1 options:+[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1] reply:v3];
  _Block_object_dispose(v4, 8);
}

- (void)_getHistoricalScorecardSession:(id)a3 andReply:(id)a4
{
  if (a3 && [a3 scorecardIdentifier])
  {
    perfFeed = self->_perfFeed;
    id v8 = [a3 scorecardIdentifier];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001790A4;
    v11[3] = &unk_100243508;
    v11[4] = a3;
    v11[5] = a4;
    [(NetworkPerformanceFeed *)perfFeed fullScorecardFor:1 options:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, kSymptomAnalyticsServiceNetworkAttachmentHistorical, 0) reply:v11];
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "session && session.scorecardIdentifier", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 449, 0);
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s without WiFiPerfPerAssocSession, or a WiFiPerfPerAssocSession lacking scorecard identifier, replying nil", "-[WiFiPerfPerAssoc _getHistoricalScorecardSession:andReply:]");
    }
    uint64_t v10 = (void (*)(id, void))*((void *)a4 + 2);
    v10(a4, 0);
  }
}

- (BOOL)_networkSuitableForCollection:(__WiFiNetwork *)a3
{
  if (sub_10001EA5C(a3))
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "!WiFiNetworkIsHidden(network)", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 466, 0);
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: ignoring hidden network", "-[WiFiPerfPerAssoc _networkSuitableForCollection:]"];
    }
  }
  else if (sub_1000C6B08((uint64_t)a3) == 1)
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "WiFiNetworkGetNetworkOfInterestHomeType(network) != kWiFiNetworkOfInterestHome", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 467, 0);
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: ignoring home network", @"-[WiFiPerfPerAssoc _networkSuitableForCollection:]"];
    }
  }
  else
  {
    if (sub_1000CF14C((uint64_t)a3) != 1) {
      return 1;
    }
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "WiFiNetworkGetNetworkOfInterestWorkType(network) != kWiFiNetworkOfInterestWork", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 468, 0);
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: ignoring work network", "-[WiFiPerfPerAssoc _networkSuitableForCollection:]")
    }
  }
  return 0;
}

+ (BOOL)_isCollectionEnabled
{
  if (qword_10027DCA0 != -1) {
    dispatch_once(&qword_10027DCA0, &stru_100243548);
  }
  int v2 = byte_10027DCA8;
  if (!byte_10027DCA8)
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_DiagnosticLogSubmissionEnabled()", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m"", 480, 0);
    if (qword_10027DC98 != -1) {
      dispatch_once(&qword_10027DC98, &stru_100243528);
    }
  }
  return v2 != 0;
}

- (void)dealloc
{
  self->_perfFeed = 0;
  self->_analyticsWorkspace = 0;
  if (notify_is_valid_token(self->_displayStateToken))
  {
    notify_cancel(self->_displayStateToken);
    self->_displayStateToken = -1;
  }

  displayStateToken = self->_displayStateToken;
  if (displayStateToken) {
    dispatch_release(displayStateToken);
  }
  currentSession = self->_currentSession;
  if (currentSession)
  {

    self->_currentSession = 0;
  }
  sessionsWaitingForFinalization = self->_sessionsWaitingForFinalization;
  if (sessionsWaitingForFinalization)
  {
    [(NSMutableArray *)sessionsWaitingForFinalization removeAllObjects];

    self->_sessionsWaitingForFinalization = 0;
  }
  wifiPPASerialQ = self->_wifiPPASerialQ;
  if (wifiPPASerialQ)
  {
    dispatch_release(wifiPPASerialQ);
    self->_wifiPPASerialQ = 0;
  }
  symptomsReplyQueue = self->_symptomsReplyQueue;
  if (symptomsReplyQueue)
  {
    dispatch_release(symptomsReplyQueue);
    self->_symptomsReplyQueue = 0;
  }
  utilityConcurrent = self->_utilityConcurrent;
  if (utilityConcurrent)
  {
    dispatch_release(utilityConcurrent);
    self->_utilityConcurrent = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)WiFiPerfPerAssoc;
  [(WiFiPerfPerAssoc *)&v9 dealloc];
}

- (WiFiPerfPerAssocSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (NSMutableArray)sessionsWaitingForFinalization
{
  return self->_sessionsWaitingForFinalization;
}

- (void)setSessionsWaitingForFinalization:(id)a3
{
}

- (OS_dispatch_queue)wifiPPASerialQ
{
  return self->_wifiPPASerialQ;
}

- (void)setWifiPPASerialQ:(id)a3
{
}

- (OS_dispatch_queue)symptomsReplyQueue
{
  return self->_symptomsReplyQueue;
}

- (void)setSymptomsReplyQueue:(id)a3
{
}

- (OS_dispatch_queue)utilityConcurrent
{
  return self->_utilityConcurrent;
}

- (void)setUtilityConcurrent:(id)a3
{
}

- (BOOL)deviceUnderActiveUse
{
  return self->_deviceUnderActiveUse;
}

- (void)setDeviceUnderActiveUse:(BOOL)a3
{
  self->_deviceUnderActiveUse = a3;
}

- (BOOL)activeUseBeingTracked
{
  return self->_activeUseBeingTracked;
}

- (void)setActiveUseBeingTracked:(BOOL)a3
{
  self->_activeUseBeingTracked = a3;
}

- (BOOL)deviceIsAssociated
{
  return self->_deviceIsAssociated;
}

- (void)setDeviceIsAssociated:(BOOL)a3
{
  self->_deviceIsAssociated = a3;
}

- (NetworkPerformanceFeed)perfFeed
{
  return self->_perfFeed;
}

- (void)setPerfFeed:(id)a3
{
}

- (AnalyticsWorkspace)analyticsWorkspace
{
  return self->_analyticsWorkspace;
}

- (void)setAnalyticsWorkspace:(id)a3
{
}

- (int)displayStateToken
{
  return self->_displayStateToken;
}

- (void)setDisplayStateToken:(int)a3
{
  self->_displayStateToken = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

@end