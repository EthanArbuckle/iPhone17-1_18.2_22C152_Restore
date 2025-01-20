@interface WiFiRoamManager
+ (id)sharedWiFiRoamManager;
+ (id)stringRepresentationWithHostReason:(int64_t)a3;
+ (id)stringRepresentationWithReason:(unsigned int)a3;
+ (id)stringRepresentationWithStatus:(unsigned int)a3;
- (BOOL)allowRoam;
- (BOOL)awdlRealTimeModeActive;
- (BOOL)canSubmitMetrics;
- (BOOL)detectLateRoam;
- (BOOL)deviceStationary;
- (BOOL)ipAddrAssigned;
- (BOOL)isLastRoamDueToBeaconLost;
- (BOOL)isRoamLateDueToDelta;
- (BOOL)roamWithReason:(unint64_t)a3 bandPreference:(int)a4;
- (NSDictionary)roamPrep;
- (NSDictionary)roamScanStart;
- (NSDictionary)roamState;
- (NSDictionary)roamStatus;
- (NSMutableArray)previousRoams;
- (WiFiRoamManager)init;
- (double)btStateChangeTimestamp;
- (double)lastRoamAttemptTimestamp;
- (double)lastRoamStatusFailedNoCandidateTs;
- (double)lastRoamSuppressionRemovalTime;
- (double)linkUpTimestamp;
- (double)paramMinRoamRetryWaitTime;
- (double)paramMinRoamWaitTimeFromLinkUpInSec;
- (double)paramWindowSizeInSec;
- (double)roamScanEndTimestamp;
- (double)roamScanStartTimestamp;
- (double)windowTimestamp;
- (id)copyRoamStatus;
- (int64_t)bssEnvironment;
- (int64_t)btState;
- (int64_t)btType;
- (int64_t)currentBand;
- (int64_t)lastHostTriggeredRoamReason;
- (int64_t)maxRssiDeltaInRoamCache;
- (int64_t)minRssiDeltaInRoamCache;
- (int64_t)paramMaxRoamRetriesInWindow;
- (int64_t)roamAttemptCount;
- (unint64_t)detectPingPong;
- (unint64_t)pingPongNth;
- (unsigned)stateFlags;
- (void)dealloc;
- (void)reset;
- (void)resetPingPong;
- (void)setAwdlRealTimeModeActive:(BOOL)a3;
- (void)setBTState:(int64_t)a3 type:(int64_t)a4;
- (void)setBssEnvironment:(int64_t)a3;
- (void)setBtState:(int64_t)a3;
- (void)setBtStateChangeTimestamp:(double)a3;
- (void)setBtType:(int64_t)a3;
- (void)setCurrentBand:(int64_t)a3;
- (void)setDeviceMotionState:(int)a3;
- (void)setDeviceStationary:(BOOL)a3;
- (void)setIpAddrAssigned:(BOOL)a3;
- (void)setIsRoamLateDueToDelta:(BOOL)a3;
- (void)setLastHostTriggeredRoamReason:(int64_t)a3;
- (void)setLastRoamAttemptTimestamp:(double)a3;
- (void)setLastRoamStatusFailedNoCandidateTs:(double)a3;
- (void)setLastRoamSuppressionRemovalTime:(double)a3;
- (void)setLinkDown;
- (void)setLinkUpTimestamp:(double)a3;
- (void)setLinkUpWithBSSEnvironment:(int64_t)a3 band:(int64_t)a4 roam:(BOOL)a5 inCharging:(BOOL)a6 motionState:(int)a7;
- (void)setMaxRssiDeltaInRoamCache:(int64_t)a3;
- (void)setMinRssiDeltaInRoamCache:(int64_t)a3;
- (void)setParamMaxRoamRetriesInWindow:(int64_t)a3;
- (void)setParamMinRoamRetryWaitTime:(double)a3;
- (void)setParamMinRoamWaitTimeFromLinkUpInSec:(double)a3;
- (void)setParamWindowSizeInSec:(double)a3;
- (void)setPingPongNth:(unint64_t)a3;
- (void)setPreviousRoams:(id)a3;
- (void)setRoamAttemptCount:(int64_t)a3;
- (void)setRoamEndState:(id)a3 forInterface:(id)a4;
- (void)setRoamPrep:(id)a3;
- (void)setRoamPrep:(id)a3 forInterface:(id)a4;
- (void)setRoamScanEndTimestamp:(double)a3;
- (void)setRoamScanStart:(id)a3;
- (void)setRoamScanStartTimestamp:(double)a3;
- (void)setRoamStart:(id)a3 forInterface:(id)a4;
- (void)setRoamStatus:(id)a3;
- (void)setRoamStatus:(id)a3 withBeaconCache:(id)a4 forInterface:(id)a5;
- (void)setStateFlags:(unsigned __int8)a3;
- (void)setWindowTimestamp:(double)a3;
@end

@implementation WiFiRoamManager

+ (id)sharedWiFiRoamManager
{
  v3 = objc_opt_class();
  objc_sync_enter(v3);
  id v4 = (id)qword_10027D5B8;
  if (!qword_10027D5B8)
  {
    id v4 = objc_alloc_init((Class)a1);
    qword_10027D5B8 = (uint64_t)v4;
  }
  objc_sync_exit(v3);
  return v4;
}

- (WiFiRoamManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)WiFiRoamManager;
  v2 = [(WiFiRoamManager *)&v10 init];
  v3 = (WiFiRoamManager *)v2;
  if (v2)
  {
    v2[8] = 0;
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 4) = 0;
    *((void *)v2 + 2) = 0;
    *((void *)v2 + 9) = 0;
    *((void *)v2 + 10) = 0;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)(v2 + 40) = _Q0;
    *((void *)v2 + 7) = 3;
    *((void *)v2 + 8) = 0x405E000000000000;
    *(_DWORD *)(v2 + 9) = 0;
    *((void *)v2 + 11) = 0;
    *((void *)v2 + 12) = 0;
    *((void *)v2 + 27) = objc_alloc_init((Class)NSMutableArray);
    v3->_pingPongNth = 0;
  }
  qword_10027D5B8 = (uint64_t)v3;
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiRoamManager;
  [(WiFiRoamManager *)&v3 dealloc];
}

- (void)setRoamStart:(id)a3 forInterface:(id)a4
{
  if (([(WiFiRoamManager *)self stateFlags] & 1) == 0)
  {
    [(WiFiRoamManager *)self setStateFlags:[(WiFiRoamManager *)self stateFlags] | 1];
    roamScanStart = self->_roamScanStart;
    if (roamScanStart) {

    }
    self->_roamScanStart = (NSDictionary *)[a3 copy];
    +[NSDate timeIntervalSinceReferenceDate];
    self->_roamScanStartTimestamp = v9;
    self->_roamScanEndTimestamp = 0.0;
    self->_isRoamLateDueToDelta = 0;
    self->_minRssiDeltaInRoamCache = 0;
    self->_maxRssiDeltaInRoamCache = 0;
    id v10 = [(NSDictionary *)self->_roamScanStart objectForKey:@"ROAM_LAST_STATUS"];
    id v11 = [(NSDictionary *)self->_roamScanStart objectForKey:@"ROAM_SCAN_REASON"];
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: Status:%u Reason:%d (%@)", "-[WiFiRoamManager setRoamStart:forInterface:]", (unint64_t)[v10 unsignedIntValue] & 0x1FF, (unint64_t)[v11 unsignedIntValue] & 0x1FF, +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", [v11 unsignedIntValue]) message];
    }
    [+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance") setRoamingState:1 withReason:[v11 unsignedIntValue] asString:+[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v11, "unsignedIntValue")) andStatus:[v10 unsignedIntValue] asString:+[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", objc_msgSend(v10, "unsignedIntValue")) andLatency:self->_roamScanStart andRoamData:0 andPingPongSequence:0 forInterface:a4];
  }
}

- (void)setRoamEndState:(id)a3 forInterface:(id)a4
{
  if (([(WiFiRoamManager *)self stateFlags] & 2) == 0)
  {
    id v32 = a4;
    [(WiFiRoamManager *)self setStateFlags:[(WiFiRoamManager *)self stateFlags] | 2];
    roamState = self->_roamState;
    if (roamState) {

    }
    self->_roamState = (NSDictionary *)[a3 copy];
    id v36 = +[NSMutableString string];
    v34 = self;
    id v9 = [(NSDictionary *)self->_roamState objectForKey:@"ROAM_CACHE"];
    id v31 = [v9 count];
    id obj = v9;
    if (v9)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v38;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(obj);
            }
            [v36 appendFormat:@" {%@, %@, %@, %@} ", [v37 objectForKey:@"BSSID"], [v37 objectForKey:@"RSSI"], [v37 objectForKey:@"CHANNEL"], [v37 objectForKey:@"CHANNEL_FLAGS"];
          }
          id v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v11);
      }
    }
    v14 = self;
    id v33 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAM_LAST_STATUS"];
    id v15 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAM_SCAN_REASON"];
    id v16 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_FLAGS"];
    id v17 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_TIME_STARTED"];
    id v30 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_TIME_ENDED"];
    v18 = [v30 unsignedLongValue];
    id v29 = v17;
    v19 = [v17 unsignedLongValue];
    if (qword_10027DD68)
    {
      v14 = v34;
      objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Rssi: %d Count: %d Age: %d LastStatus: %d Reason: %d Flags:%lX RoamCache: %lu - %@", "-[WiFiRoamManager setRoamEndState:forInterface:]", objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"RSSI"), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_SCAN_COUNT"), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_SCAN_AGE"), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_LAST_STATUS"), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_SCAN_REASON"), "unsignedIntValue"), objc_msgSend(v16, "unsignedIntegerValue"),
        v31,
        v36);
    }
    [(WiFiRoamManager *)v14 detectLateRoam];
    if (obj) {
      [+[WiFiUsageMonitor sharedInstance] updateRoamCache:obj forInterface:v32];
    }
    if ([v33 unsignedIntValue])
    {
      uint64_t v21 = v18 - v19;
      v22 = +[WiFiUsageMonitor sharedInstance];
      uint64_t v23 = [v15 unsignedIntValue];
      id v24 = +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", [v15 unsignedIntValue]);
      uint64_t v25 = [v33 unsignedIntValue];
      id v26 = +[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", [v33 unsignedIntValue]);
      if (v30) {
        BOOL v27 = v29 == 0;
      }
      else {
        BOOL v27 = 1;
      }
      if (v27) {
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v28 = v21;
      }
      [(WiFiUsageMonitor *)v22 setRoamingState:0 withReason:v23 asString:v24 andStatus:v25 asString:v26 andLatency:v28 andRoamData:v14->_roamState andPingPongSequence:0 forInterface:v32];
    }
  }
}

- (void)setRoamPrep:(id)a3 forInterface:(id)a4
{
  if (([(WiFiRoamManager *)self stateFlags] & 4) == 0)
  {
    [(WiFiRoamManager *)self setStateFlags:[(WiFiRoamManager *)self stateFlags] | 4];
    roamPrep = self->_roamPrep;
    if (roamPrep) {

    }
    id v9 = (NSDictionary *)[a3 copy];
    self->_roamPrep = v9;
    id v10 = [(NSDictionary *)v9 objectForKey:@"ROAM_SCAN_REASON"];
    [+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance") setRoamingState:1 withReason:[v10 unsignedIntValue] asString:+[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v10, "unsignedIntValue")) andStatus:0x7FFFFFFFFFFFFFFFLL andLatency:0 andRoamData:0 andPingPongSequence:self->_roamPrep forInterface:a4];
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: Will roam to candidate: %@", "-[WiFiRoamManager setRoamPrep:forInterface:]", -[NSDictionary objectForKey:](self->_roamPrep, "objectForKey:", @"BSSID" message];
    }
  }
}

- (void)setRoamStatus:(id)a3 withBeaconCache:(id)a4 forInterface:(id)a5
{
  if (([(WiFiRoamManager *)self stateFlags] & 8) == 0)
  {
    [(WiFiRoamManager *)self setStateFlags:[(WiFiRoamManager *)self stateFlags] | 8];
    roamStatus = self->_roamStatus;
    if (roamStatus) {

    }
    self->_roamStatus = (NSDictionary *)[a3 copy];
    +[NSDate timeIntervalSinceReferenceDate];
    self->_roamScanEndTimestamp = v11;
    id v12 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_TIME_STARTED"];
    v13 = [[self->_roamStatus objectForKey:@"ROAMEDEVENT_TIME_ENDED"] unsignedLongValue];
    v14 = [v12 unsignedLongValue];
    id v15 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_STATUS"];
    id v32 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_REASON"];
    id v16 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_FLAGS"];
    id v30 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_CHANNELS_SCANNED_COUNT"];
    if (((unint64_t)[v15 unsignedIntegerValue] & 0x1FF) != 0)
    {
      id v29 = 0;
      id v28 = 0;
      unint64_t v17 = 0;
    }
    else
    {
      unint64_t v17 = [(WiFiRoamManager *)self detectPingPong];
      self->_pingPongNth = v17;
      id v29 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAM_SCAN_SUMMARY"];
      id v28 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAM_PKT_LOSS_INFO"];
    }
    int64_t v31 = v13 - v14;
    if (qword_10027DD68)
    {
      context = v18;
      objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Latency:%ld Status:%u (%@) Reason:%d (%@) ScannedChannelCount:%lu Flags:%lX PingPongNth:%lu scanSummary:%@ lossSummary:%@", "-[WiFiRoamManager setRoamStatus:withBeaconCache:forInterface:]", v31, (unint64_t)objc_msgSend(v15, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", objc_msgSend(v15, "unsignedIntValue")), (unint64_t)objc_msgSend(v32, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v32, "unsignedIntValue")), objc_msgSend(v30, "unsignedIntegerValue"), objc_msgSend(v16, "unsignedIntegerValue"), v17,
        v29,
        v28);
      v18 = context;
    }
    if (v17)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: previous roams:%@", "-[WiFiRoamManager setRoamStatus:withBeaconCache:forInterface:]", self->_previousRoams message];
      }
    }
    [(WiFiRoamManager *)self detectLateRoam];
    if ([v15 unsignedIntValue] == -528350205
      || [(WiFiRoamManager *)self deviceStationary]
      && [v15 unsignedIntValue] == -528350133)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      -[WiFiRoamManager setLastRoamStatusFailedNoCandidateTs:](self, "setLastRoamStatusFailedNoCandidateTs:");
    }
    if (a4) {
      [+[WiFiUsageMonitor sharedInstance] updateBeaconCache:a4 afterRoamAttempt:self->_roamStatus whileCurrentBSSID:[(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_ORIGIN_ADDR"] forInterface:a5];
    }
    v20 = +[WiFiUsageMonitor sharedInstance];
    uint64_t v21 = [v32 unsignedIntValue];
    id v22 = +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", [v32 unsignedIntValue]);
    uint64_t v23 = [v15 unsignedIntValue];
    id v24 = +[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", [v15 unsignedIntValue]);
    uint64_t v25 = self->_roamStatus;
    if (self->_pingPongNth) {
      id v26 = [(NSMutableArray *)self->_previousRoams valueForKey:@"reason"];
    }
    else {
      id v26 = 0;
    }
    [(WiFiUsageMonitor *)v20 setRoamingState:0 withReason:v21 asString:v22 andStatus:v23 asString:v24 andLatency:v31 andRoamData:v25 andPingPongSequence:v26 forInterface:a5];
  }
}

- (id)copyRoamStatus
{
  id v4 = [(NSDictionary *)self->_roamStatus copy];
  return v4;
}

- (void)setLinkUpWithBSSEnvironment:(int64_t)a3 band:(int64_t)a4 roam:(BOOL)a5 inCharging:(BOOL)a6 motionState:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  +[NSDate timeIntervalSinceReferenceDate];
  -[WiFiRoamManager setLinkUpTimestamp:](self, "setLinkUpTimestamp:");
  [(WiFiRoamManager *)self setBssEnvironment:a3];
  [(WiFiRoamManager *)self setCurrentBand:a4];
  if (!a5)
  {
    [(WiFiRoamManager *)self reset];
    [(WiFiRoamManager *)self setDeviceMotionState:v7];
  }
  [(WiFiRoamManager *)self setLastRoamStatusFailedNoCandidateTs:0.0];
}

- (void)setLinkDown
{
  [(WiFiRoamManager *)self setDeviceMotionState:0];
  [(WiFiRoamManager *)self setLinkUpTimestamp:0.0];
  [(WiFiRoamManager *)self setBssEnvironment:0];
  [(WiFiRoamManager *)self setCurrentBand:0];
  [(WiFiRoamManager *)self reset];
  [(WiFiRoamManager *)self setWindowTimestamp:0.0];
  [(WiFiRoamManager *)self setLastRoamStatusFailedNoCandidateTs:0.0];
}

- (void)reset
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiRoamManager reset]");
  }

  self->_roamState = 0;
  self->_roamScanStartTimestamp = 0.0;
  self->_roamScanEndTimestamp = 0.0;

  self->_roamScanStart = 0;
  self->_roamState = 0;

  self->_roamPrep = 0;
  self->_roamStatus = 0;
  [(WiFiRoamManager *)self setLastHostTriggeredRoamReason:0];
  [(WiFiRoamManager *)self setStateFlags:0];
}

- (void)resetPingPong
{
  self->_pingPongNth = 0;
}

- (void)setBTState:(int64_t)a3 type:(int64_t)a4
{
  [(WiFiRoamManager *)self setBtState:a3];
  [(WiFiRoamManager *)self setBtType:a4];
  +[NSDate timeIntervalSinceReferenceDate];
  -[WiFiRoamManager setBtStateChangeTimestamp:](self, "setBtStateChangeTimestamp:");
  if ((id)[(WiFiRoamManager *)self btType] == (id)102)
  {
    int64_t v8 = [(WiFiRoamManager *)self btState];
    if ((unint64_t)(v8 - 1) <= 1)
    {
      int64_t v9 = v8;
      if ((id)[(WiFiRoamManager *)self currentBand] == (id)1) {
        [(WiFiRoamManager *)self roamWithReason:v9 bandPreference:0];
      }
    }
  }
}

- (BOOL)allowRoam
{
  int64_t v4 = [(WiFiRoamManager *)self bssEnvironment];
  if ((char *)[(WiFiRoamManager *)self bssEnvironment] - 5 >= (char *)2
    && (unint64_t)(v4 - 3) >= 2)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: Not allowed for environment:%ld", "-[WiFiRoamManager allowRoam]", -[WiFiRoamManager bssEnvironment](self, "bssEnvironment"), v39)];
    }
    goto LABEL_10;
  }
  [(WiFiRoamManager *)self linkUpTimestamp];
  if (v5 == 0.0)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: Not allowed as link not up", "-[WiFiRoamManager allowRoam]");
    }
    goto LABEL_35;
  }
  if ([(WiFiRoamManager *)self awdlRealTimeModeActive])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: Not allowed as awdl realtime traffic active", @"-[WiFiRoamManager allowRoam]"];
    }
    goto LABEL_35;
  }
  if (![(WiFiRoamManager *)self ipAddrAssigned])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: Not allowed as IP addr hasn't been assigned yet", @"-[WiFiRoamManager allowRoam]"];
    }
LABEL_35:
    id v15 = v37;
    goto LABEL_11;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v7 = v6;
  [(WiFiRoamManager *)self linkUpTimestamp];
  double v9 = v7 - v8;
  [(WiFiRoamManager *)self paramMinRoamWaitTimeFromLinkUpInSec];
  if (v9 >= v10)
  {
    [(WiFiRoamManager *)self windowTimestamp];
    if (v17 == 0.0
      || ([(WiFiRoamManager *)self windowTimestamp],
          double v19 = v7 - v18,
          [(WiFiRoamManager *)self paramWindowSizeInSec],
          v19 >= v20))
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s: Resetting window", "-[WiFiRoamManager allowRoam]"];
      }
      [(WiFiRoamManager *)self setWindowTimestamp:v7];
      [(WiFiRoamManager *)self setRoamAttemptCount:0];
      [(WiFiRoamManager *)self lastRoamAttemptTimestamp];
      if (v28 != 0.0)
      {
        [(WiFiRoamManager *)self lastRoamAttemptTimestamp];
        double v30 = v7 - v29;
        [(WiFiRoamManager *)self paramMinRoamRetryWaitTime];
        if (v30 <= v31)
        {
          id v12 = (void *)qword_10027DD68;
          if (!qword_10027DD68) {
            goto LABEL_10;
          }
          [(WiFiRoamManager *)self lastRoamAttemptTimestamp];
          double v38 = v7 - v33;
          v14 = "%s: Not allowed as last attempt was %2.2f sec ago ";
          goto LABEL_9;
        }
      }
    }
    else
    {
      uint64_t v21 = [(WiFiRoamManager *)self roamAttemptCount];
      if (v21 >= [(WiFiRoamManager *)self paramMaxRoamRetriesInWindow])
      {
        id v12 = (void *)qword_10027DD68;
        if (!qword_10027DD68) {
          goto LABEL_10;
        }
        [(WiFiRoamManager *)self windowTimestamp];
        double v35 = v7 - v34;
        [(WiFiRoamManager *)self paramWindowSizeInSec];
        double v38 = v35;
        uint64_t v39 = v36;
        v14 = "%s: Not allowed as max attempts made. Only %2.2f sec into window size %2.2f";
        goto LABEL_9;
      }
      [(WiFiRoamManager *)self lastRoamAttemptTimestamp];
      if (v22 != 0.0)
      {
        [(WiFiRoamManager *)self lastRoamAttemptTimestamp];
        double v24 = v7 - v23;
        [(WiFiRoamManager *)self paramMinRoamRetryWaitTime];
        if (v24 <= v25)
        {
          id v12 = (void *)qword_10027DD68;
          if (!qword_10027DD68) {
            goto LABEL_10;
          }
          [(WiFiRoamManager *)self lastRoamAttemptTimestamp];
          double v38 = v7 - v26;
          v14 = "%s: Not allowed as last attempt was %2.2f sec ago";
          goto LABEL_9;
        }
      }
    }
    [(WiFiRoamManager *)self setRoamAttemptCount:(char *)[(WiFiRoamManager *)self roamAttemptCount] + 1];
    [(WiFiRoamManager *)self setLastRoamAttemptTimestamp:v7];
    BOOL v16 = 1;
    goto LABEL_24;
  }
  id v12 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    [(WiFiRoamManager *)self linkUpTimestamp];
    double v38 = v7 - v13;
    v14 = "%s: Not allowed as link up was %2.2f sec ago";
LABEL_9:
    [v12 WFLog:3, v14, "-[WiFiRoamManager allowRoam]", *(void *)&v38, v39];
  }
LABEL_10:
  id v15 = v11;
LABEL_11:
  BOOL v16 = 0;
LABEL_24:
  return v16;
}

- (BOOL)roamWithReason:(unint64_t)a3 bandPreference:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (v4 >= 3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: Invalid band preference: %d. Exiting", "-[WiFiRoamManager roamWithReason:bandPreference:]", 0)];
    }
    goto LABEL_10;
  }
  if (![(WiFiRoamManager *)self allowRoam])
  {
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Host triggered roam allowed for reason: %lu with bandPref: %d ", "-[WiFiRoamManager roamWithReason:bandPreference:]", a3, v4);
  }
  [(WiFiRoamManager *)self setLastHostTriggeredRoamReason:a3];
  v14[0] = @"com.apple.wifid.wifiroammangerroamtype";
  v14[1] = @"com.apple.wifid.wifiroammangerroamreason";
  v15[0] = +[NSNumber numberWithChar:(char)v4];
  v15[1] = +[NSNumber numberWithInteger:(int)a3];
  double v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  BOOL v11 = 1;
  CFNotificationCenterPostNotification(LocalCenter, @"com.apple.wifid.wifiroammanagerroamnotification", 0, (CFDictionaryRef)v9, 1u);
LABEL_6:
  return v11;
}

- (BOOL)canSubmitMetrics
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (([(WiFiRoamManager *)self stateFlags] & 8) != 0
    && ([(WiFiRoamManager *)self lastRoamSuppressionRemovalTime], Current - v4 > 30.0))
  {
    unsigned int v5 = ([(WiFiRoamManager *)self stateFlags] >> 1) & 1;
  }
  else
  {
    unsigned int v5 = 0;
  }
  if (qword_10027DD68)
  {
    double v7 = "No";
    if (v5) {
      double v7 = "Yes";
    }
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: %s", "-[WiFiRoamManager canSubmitMetrics]", v7);
  }
  return v5;
}

- (BOOL)detectLateRoam
{
  if (!self->_roamState
    || (roamStatus = self->_roamStatus) == 0
    || (id v5 = [(NSDictionary *)roamStatus objectForKey:@"ROAMEDEVENT_STATUS"],
        id v6 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_REASON"],
        [v5 unsignedIntValue] != -528350205)
    && [v5 unsignedIntValue] != -528350133
    || [v6 unsignedIntegerValue] != (id)3766619137)
  {
    BOOL v22 = 0;
    goto LABEL_44;
  }
  unsigned int v29 = [[self->_roamState objectForKey:@"RSSI"] unsignedIntValue];
  id v7 = [(NSDictionary *)self->_roamState objectForKey:@"ROAM_CACHE"];
  if (!v7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, "%s: no roam cache", "-[WiFiRoamManager detectLateRoam]"];
    }
    goto LABEL_42;
  }
  double v8 = v7;
  if (![v7 count])
  {
LABEL_42:
    char v24 = 0;
    goto LABEL_43;
  }
  BOOL v27 = v3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v9)
  {
    char v28 = 0;
    goto LABEL_36;
  }
  id v10 = v9;
  char v28 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    double v13 = 0;
    do
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v13);
      if (!v14)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: ERROR: no roam candidate at idx %d in cache with count %lu ", "-[WiFiRoamManager detectLateRoam]", (char *)v13 + v11, objc_msgSend(v8, "count"));
        }
        goto LABEL_19;
      }
      id v15 = [[objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)v13), "objectForKey:", @"RSSI") unsignedIntValue];
      id v16 = v15;
      if ((int)v15 <= -90)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Roam candidate %d has weak RSSI %d ", "-[WiFiRoamManager detectLateRoam]", (char *)v13 + v11, v16);
        }
LABEL_19:
        goto LABEL_20;
      }
      uint64_t v18 = v15 - v29;
      id v19 = [v14 objectForKey:@"BSSID"];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: Roam candidate %@ (idx %d) has RSSI delta %d ", "-[WiFiRoamManager detectLateRoam]", v19, (char *)v13 + v11, v18 message];
      }
      if ((v18 - 1) <= 0xB)
      {
        [(WiFiRoamManager *)self setIsRoamLateDueToDelta:1];
        if (![(WiFiRoamManager *)self minRssiDeltaInRoamCache]
          || [(WiFiRoamManager *)self minRssiDeltaInRoamCache] > v18)
        {
          [(WiFiRoamManager *)self setMinRssiDeltaInRoamCache:v18];
        }
        if (![(WiFiRoamManager *)self maxRssiDeltaInRoamCache]
          || [(WiFiRoamManager *)self maxRssiDeltaInRoamCache] < v18)
        {
          [(WiFiRoamManager *)self setMaxRssiDeltaInRoamCache:v18];
        }
        char v28 = 1;
      }
LABEL_20:
      double v13 = (char *)v13 + 1;
    }
    while (v10 != v13);
    id v21 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    id v10 = v21;
    uint64_t v11 = (v11 + v13);
  }
  while (v21);
LABEL_36:
  char v24 = v28;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: isLateRoam: %d", @"-[WiFiRoamManager detectLateRoam]", v28 & 1];
  }
  objc_super v3 = v27;
LABEL_43:
  BOOL v22 = v24 & 1;
LABEL_44:
  return v22;
}

- (unint64_t)detectPingPong
{
  if (!self->_roamStatus)
  {
    NSLog(@"%s - _roamStatus not available. bail", a2, "-[WiFiRoamManager detectPingPong]");
    return 0;
  }
  if (![(WiFiRoamManager *)self previousRoams])
  {
    NSLog(@"%s - previousRoams not available. bail", v3, "-[WiFiRoamManager detectPingPong]");
    return 0;
  }
  id v5 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_REASON"];
  id v6 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_TARGET_ADDR"];
  id v7 = [(NSDictionary *)self->_roamStatus objectForKey:@"ROAMEDEVENT_ORIGIN_ADDR"];
  if ([v6 isEqualToData:v7])
  {
    NSLog(@"%s - roamTarget (%@) and roamOrigin (%@) are identical, bail", "-[WiFiRoamManager detectPingPong]", v6, v7);
LABEL_29:
    return 0;
  }
  double v8 = +[PreviousRoam roamWithBssid:andReason:](PreviousRoam, "roamWithBssid:andReason:", v6, [v5 unsignedIntegerValue]);
  if (!v8)
  {
    NSLog(@"%s - cannot get instance of PreviousRoam class, bail", "-[WiFiRoamManager detectPingPong]");
    goto LABEL_29;
  }
  [(NSMutableArray *)self->_previousRoams addObject:v8];
  id v9 = +[NSMutableSet setWithCapacity:2];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [[-[NSMutableArray reverseObjectEnumerator](self->_previousRoams, "reverseObjectEnumerator") allObjects];
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    uint64_t v14 = -1;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [objc_msgSend(v16, "timestamp") timeIntervalSinceNow];
        if (v17 < -60.0
          && v14 <= (uint64_t)[(NSMutableArray *)self->_previousRoams indexOfObject:v16])
        {
          uint64_t v14 = (uint64_t)[(NSMutableArray *)self->_previousRoams indexOfObject:v16];
        }
        if ((-[NSMutableSet containsObject:](v9, "containsObject:", [v16 bssid]) & 1) != 0
          || [(NSMutableSet *)v9 count] != (id)2)
        {
          -[NSMutableSet addObject:](v9, "addObject:", [v16 bssid]);
        }
        else if (v14 <= (uint64_t)[(NSMutableArray *)self->_previousRoams indexOfObject:v16])
        {
          uint64_t v14 = (uint64_t)[(NSMutableArray *)self->_previousRoams indexOfObject:v16];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
    if ((v14 & 0x8000000000000000) == 0) {
      -[NSMutableArray removeObjectsInRange:](self->_previousRoams, "removeObjectsInRange:", 0, v14 + 1);
    }
  }
  uint64_t v18 = (char *)[(NSMutableArray *)self->_previousRoams count];
  previousRoams = self->_previousRoams;
  unint64_t v20 = (unint64_t)(v18 - 2) & ~((uint64_t)(v18 - 2) >> 63);
  NSLog(@"%s - _previousRoams:%@\npingPongNth=%ld (-->%lu)", "-[WiFiRoamManager detectPingPong]", previousRoams, v18 - 2, v20);
  return v20;
}

- (void)setDeviceMotionState:(int)a3
{
  [(WiFiRoamManager *)self linkUpTimestamp];
  if (v6 != 0.0) {
    [(WiFiRoamManager *)self setDeviceStationary:a3 == 1];
  }
}

+ (id)stringRepresentationWithStatus:(unsigned int)a3
{
  if ((a3 & 0x1FF) == 0) {
    return @"Success";
  }
  id result = @"Operation failed";
  switch(a3)
  {
    case 0xE0820401:
      return result;
    case 0xE0820402:
      id result = @"Operation timed out";
      break;
    case 0xE0820403:
      id result = @"Failed due to no matching network found";
      break;
    case 0xE0820404:
      id result = @"Operation was aborted";
      break;
    case 0xE0820405:
      id result = @"Protocol failure: packet not ack'd";
      break;
    case 0xE0820406:
      id result = @"AUTH or ASSOC packet was unsolicited";
      break;
    case 0xE0820407:
      id result = @"Attempt to assoc to an auto auth configuration";
      break;
    case 0xE0820408:
      id result = @"Scan results are incomplete";
      break;
    case 0xE0820409:
      id result = @"Scan aborted by another scan";
      break;
    case 0xE082040A:
      id result = @"Scan aborted due to assoc in progress";
      break;
    case 0xE082040B:
      id result = @"802.11h quiet period started";
      break;
    case 0xE082040C:
      id result = @"User disabled scanning";
      break;
    case 0xE082040D:
      id result = @"No allowable channels to scan";
      break;
    case 0xE082040E:
      id result = @"Scan aborted due to CCX fast roam";
      break;
    case 0xE082040F:
      id result = @"Abort channel select";
      break;
    default:
      if (a3 == -528350133) {
        id result = @"Network found but filtered out by roam score logic";
      }
      else {
        id result = +[NSString stringWithFormat:@"Unknown=%ld", a3];
      }
      break;
  }
  return result;
}

+ (id)stringRepresentationWithReason:(unsigned int)a3
{
  if (a3 + 528348160 >= 0x14) {
    return +[NSString stringWithFormat:@"Unknown=%ld", a3];
  }
  else {
    return *(&off_10023EE58 + (int)(a3 + 528348160));
  }
}

+ (id)stringRepresentationWithHostReason:(int64_t)a3
{
  if ((unint64_t)a3 >= 7) {
    return +[NSString stringWithFormat:@"Unknown=%ld", a3];
  }
  else {
    return *(&off_10023EEF8 + a3);
  }
}

- (BOOL)isLastRoamDueToBeaconLost
{
  roamScanStart = self->_roamScanStart;
  if (roamScanStart)
  {
    id v3 = [(NSDictionary *)roamScanStart objectForKey:@"ROAM_SCAN_REASON"];
    LOBYTE(roamScanStart) = v3 && [v3 unsignedIntValue] == -528348156;
  }
  return (char)roamScanStart;
}

- (NSDictionary)roamState
{
  return self->_roamState;
}

- (double)roamScanStartTimestamp
{
  return self->_roamScanStartTimestamp;
}

- (void)setRoamScanStartTimestamp:(double)a3
{
  self->_roamScanStartTimestamp = a3;
}

- (double)roamScanEndTimestamp
{
  return self->_roamScanEndTimestamp;
}

- (void)setRoamScanEndTimestamp:(double)a3
{
  self->_roamScanEndTimestamp = a3;
}

- (double)paramMinRoamWaitTimeFromLinkUpInSec
{
  return self->_paramMinRoamWaitTimeFromLinkUpInSec;
}

- (void)setParamMinRoamWaitTimeFromLinkUpInSec:(double)a3
{
  self->_paramMinRoamWaitTimeFromLinkUpInSec = a3;
}

- (double)paramMinRoamRetryWaitTime
{
  return self->_paramMinRoamRetryWaitTime;
}

- (void)setParamMinRoamRetryWaitTime:(double)a3
{
  self->_paramMinRoamRetryWaitTime = a3;
}

- (int64_t)paramMaxRoamRetriesInWindow
{
  return self->_paramMaxRoamRetriesInWindow;
}

- (void)setParamMaxRoamRetriesInWindow:(int64_t)a3
{
  self->_paramMaxRoamRetriesInWindow = a3;
}

- (double)paramWindowSizeInSec
{
  return self->_paramWindowSizeInSec;
}

- (void)setParamWindowSizeInSec:(double)a3
{
  self->_paramWindowSizeInSec = a3;
}

- (BOOL)isRoamLateDueToDelta
{
  return self->_isRoamLateDueToDelta;
}

- (void)setIsRoamLateDueToDelta:(BOOL)a3
{
  self->_isRoamLateDueToDelta = a3;
}

- (int64_t)minRssiDeltaInRoamCache
{
  return self->_minRssiDeltaInRoamCache;
}

- (void)setMinRssiDeltaInRoamCache:(int64_t)a3
{
  self->_minRssiDeltaInRoamCache = a3;
}

- (int64_t)maxRssiDeltaInRoamCache
{
  return self->_maxRssiDeltaInRoamCache;
}

- (void)setMaxRssiDeltaInRoamCache:(int64_t)a3
{
  self->_maxRssiDeltaInRoamCache = a3;
}

- (int64_t)lastHostTriggeredRoamReason
{
  return self->_lastHostTriggeredRoamReason;
}

- (void)setLastHostTriggeredRoamReason:(int64_t)a3
{
  self->_lastHostTriggeredRoamReason = a3;
}

- (BOOL)awdlRealTimeModeActive
{
  return self->_awdlRealTimeModeActive;
}

- (void)setAwdlRealTimeModeActive:(BOOL)a3
{
  self->_awdlRealTimeModeActive = a3;
}

- (BOOL)ipAddrAssigned
{
  return self->_ipAddrAssigned;
}

- (void)setIpAddrAssigned:(BOOL)a3
{
  self->_ipAddrAssigned = a3;
}

- (double)lastRoamStatusFailedNoCandidateTs
{
  return self->_lastRoamStatusFailedNoCandidateTs;
}

- (void)setLastRoamStatusFailedNoCandidateTs:(double)a3
{
  self->_lastRoamStatusFailedNoCandidateTs = a3;
}

- (double)lastRoamSuppressionRemovalTime
{
  return self->_lastRoamSuppressionRemovalTime;
}

- (void)setLastRoamSuppressionRemovalTime:(double)a3
{
  self->_lastRoamSuppressionRemovalTime = a3;
}

- (unint64_t)pingPongNth
{
  return self->_pingPongNth;
}

- (void)setPingPongNth:(unint64_t)a3
{
  self->_pingPongNth = a3;
}

- (NSDictionary)roamScanStart
{
  return self->_roamScanStart;
}

- (void)setRoamScanStart:(id)a3
{
}

- (NSDictionary)roamPrep
{
  return self->_roamPrep;
}

- (void)setRoamPrep:(id)a3
{
}

- (NSDictionary)roamStatus
{
  return self->_roamStatus;
}

- (void)setRoamStatus:(id)a3
{
}

- (int64_t)roamAttemptCount
{
  return self->_roamAttemptCount;
}

- (void)setRoamAttemptCount:(int64_t)a3
{
  self->_roamAttemptCount = a3;
}

- (int64_t)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(int64_t)a3
{
  self->_bssEnvironment = a3;
}

- (int64_t)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int64_t)a3
{
  self->_currentBand = a3;
}

- (int64_t)btState
{
  return self->_btState;
}

- (void)setBtState:(int64_t)a3
{
  self->_btState = a3;
}

- (int64_t)btType
{
  return self->_btType;
}

- (void)setBtType:(int64_t)a3
{
  self->_btType = a3;
}

- (double)btStateChangeTimestamp
{
  return self->_btStateChangeTimestamp;
}

- (void)setBtStateChangeTimestamp:(double)a3
{
  self->_btStateChangeTimestamp = a3;
}

- (double)linkUpTimestamp
{
  return self->_linkUpTimestamp;
}

- (void)setLinkUpTimestamp:(double)a3
{
  self->_linkUpTimestamp = a3;
}

- (double)windowTimestamp
{
  return self->_windowTimestamp;
}

- (void)setWindowTimestamp:(double)a3
{
  self->_windowTimestamp = a3;
}

- (double)lastRoamAttemptTimestamp
{
  return self->_lastRoamAttemptTimestamp;
}

- (void)setLastRoamAttemptTimestamp:(double)a3
{
  self->_lastRoamAttemptTimestamp = a3;
}

- (unsigned)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(unsigned __int8)a3
{
  self->_stateFlags = a3;
}

- (BOOL)deviceStationary
{
  return self->_deviceStationary;
}

- (void)setDeviceStationary:(BOOL)a3
{
  self->_deviceStationary = a3;
}

- (NSMutableArray)previousRoams
{
  return self->_previousRoams;
}

- (void)setPreviousRoams:(id)a3
{
}

@end