@interface WiFiUserInteractionMonitor
+ (BOOL)checkIfMatchesHomeBundleIds:(id)a3;
+ (BOOL)checkIfMatchesNonNetworkingBundleIds:(id)a3;
+ (id)getHomeBundleIds;
+ (id)getKnownNonNetworkingBundleIds;
+ (id)sharedInstance;
- (BOOL)_canTrigger11axPerfStudyForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5;
- (BOOL)_isCellularDataAllowedForApp:(id)a3;
- (BOOL)_isSymptomTrackingRtTrafficForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5;
- (BOOL)anyCallInProgress;
- (BOOL)callHostedOnThisDevice;
- (BOOL)canTrigger11axPerfStudyForBackgroundFlows;
- (BOOL)canTrigger11axPerfStudyForForegroundFlows;
- (BOOL)carModeActive;
- (BOOL)hasRealTimeAppProperty:(id)a3;
- (BOOL)initialSetupCompleted;
- (BOOL)isAVConferenceActive;
- (BOOL)isAirplayActiveOverInfra;
- (BOOL)isAnyCallInProgress;
- (BOOL)isAskToJoinAllowed;
- (BOOL)isCarModeActive;
- (BOOL)isCarPlay;
- (BOOL)isCellularDataUsable;
- (BOOL)isCellularInexpensive5G;
- (BOOL)isCoPresenceActive;
- (BOOL)isDeviceLocked;
- (BOOL)isDisplayOn;
- (BOOL)isFirstUserUnlocked;
- (BOOL)isInGameMode;
- (BOOL)isInHomeScreen;
- (BOOL)isInNonNetworkingApp;
- (BOOL)isInitialSetupCompleted;
- (BOOL)isLowQualityNetwork:(__WiFiNetwork *)a3;
- (BOOL)isMediaPlaying;
- (BOOL)isNetworkRecommendationAllowed;
- (BOOL)isNetworkingAppInForeground;
- (BOOL)isPersonalHotspotRecommendationAllowed;
- (BOOL)isPriorityNetwork:(__WiFiNetwork *)a3;
- (BOOL)isPublicNetwork:(__WiFiNetwork *)a3;
- (BOOL)isRealTimeAppActive;
- (BOOL)isSetupCompleted;
- (BOOL)isUsingSustainedCellularData;
- (BOOL)isUsingSustainedWiFiData;
- (BOOL)isWiFiCallInProgress;
- (BOOL)navigating;
- (BOOL)setupCompleted;
- (BOOL)wifiCallInProgress;
- (CXCallObserver)callObserver;
- (GEONavigationListener)navigationListener;
- (NSDate)periodicTasksLastRanAt;
- (NSDictionary)appAwareDetails;
- (NSMutableArray)clients;
- (NSMutableDictionary)appAttributes;
- (NSMutableDictionary)overrideNetworkState;
- (NSMutableSet)monitoredInterfaceNames;
- (NSMutableSet)runningForegroundApps;
- (NSMutableSet)runningNetworkingApps;
- (NSSet)cellularDataStatusMap;
- (NSString)cellularInterfaceName;
- (NSString)description;
- (OS_dispatch_mach)managedEventDispatchPort;
- (OS_dispatch_queue)internalQueue;
- (WiFiUserInteractionMonitorNetworkAgent)rtTrafficAgent;
- (__CTServerConnection)ctServerConnection;
- (double)cellularL3MBPS;
- (double)wifiL3MBPS;
- (id)_initPrivate;
- (id)_stateInfo;
- (int)gameNotifyToken;
- (int)managedEventNotifyToken;
- (unint64_t)_applicationNotifyState;
- (unint64_t)cellularIfTotalBytes;
- (unint64_t)cellularIfTotalPackets;
- (unint64_t)cellularL3PPS;
- (unint64_t)overrideApplicationState;
- (unint64_t)symptomBackgroundFlowProperties;
- (unint64_t)symptomForegroundFlowProperties;
- (unint64_t)wifiIfTotalBytes;
- (unint64_t)wifiIfTotalInputBytes;
- (unint64_t)wifiIfTotalInputPackets;
- (unint64_t)wifiIfTotalOutputBytes;
- (unint64_t)wifiIfTotalOutputPackets;
- (unint64_t)wifiIfTotalPackets;
- (unint64_t)wifiL3PPS;
- (unsigned)managedEventNotifyPort;
- (unsigned)symptomBackgroundFlowClassification;
- (unsigned)symptomForegroundFlowClassification;
- (void)_handleManagedEventNotification;
- (void)_notifyCaptiveWithApplicationState:(unint64_t)a3;
- (void)_updateCallState;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)dealloc;
- (void)dumpOverrideNetworkState;
- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5;
- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4;
- (void)resetBackgroundApps;
- (void)resetOverrideNetworkStates;
- (void)resetOverrideStates;
- (void)runPeriodicTasks;
- (void)setAnyCallInProgress:(BOOL)a3;
- (void)setAppAttributes:(id)a3;
- (void)setAppAwareDetails:(id)a3;
- (void)setApplicationRunningState:(BOOL)a3 foregroundState:(BOOL)a4 andNetworkingState:(BOOL)a5 forBundleId:(id)a6;
- (void)setCallHostedOnThisDevice:(BOOL)a3;
- (void)setCallObserver:(id)a3;
- (void)setCarModeActive:(BOOL)a3;
- (void)setCellularDataStatusMap:(id)a3;
- (void)setCellularIfTotalBytes:(unint64_t)a3;
- (void)setCellularIfTotalPackets:(unint64_t)a3;
- (void)setCellularInterfaceName:(id)a3;
- (void)setCellularL3MBPS:(double)a3;
- (void)setCellularL3PPS:(unint64_t)a3;
- (void)setClients:(id)a3;
- (void)setCurrentDisplayState:(BOOL)a3 andLockState:(BOOL)a4;
- (void)setGameNotifyToken:(int)a3;
- (void)setInitialSetupCompleted:(BOOL)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsAirplayActiveOverInfra:(BOOL)a3;
- (void)setIsCarPlay:(BOOL)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)setIsDisplayOn:(BOOL)a3;
- (void)setIsFirstUserUnlocked:(BOOL)a3;
- (void)setIsInGameMode:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setManagedEventDispatchPort:(id)a3;
- (void)setManagedEventNotifyPort:(unsigned int)a3;
- (void)setManagedEventNotifyToken:(int)a3;
- (void)setMonitoredInterfaceNames:(id)a3;
- (void)setNavigating:(BOOL)a3;
- (void)setNavigationListener:(id)a3;
- (void)setOverrideApplicationState:(unint64_t)a3;
- (void)setOverrideNetworkState:(id)a3;
- (void)setPeriodicTasksLastRanAt:(id)a3;
- (void)setRtTrafficAgent:(id)a3;
- (void)setRunningForegroundApps:(id)a3;
- (void)setRunningNetworkingApps:(id)a3;
- (void)setSetupCompleted:(BOOL)a3;
- (void)setSymptomBackgroundFlowClassification:(unsigned int)a3;
- (void)setSymptomBackgroundFlowProperties:(unint64_t)a3;
- (void)setSymptomForegroundFlowClassification:(unsigned int)a3;
- (void)setSymptomForegroundFlowProperties:(unint64_t)a3;
- (void)setWifiCallInProgress:(BOOL)a3;
- (void)setWifiIfTotalBytes:(unint64_t)a3;
- (void)setWifiIfTotalInputBytes:(unint64_t)a3;
- (void)setWifiIfTotalInputPackets:(unint64_t)a3;
- (void)setWifiIfTotalOutputBytes:(unint64_t)a3;
- (void)setWifiIfTotalOutputPackets:(unint64_t)a3;
- (void)setWifiIfTotalPackets:(unint64_t)a3;
- (void)setWifiL3MBPS:(double)a3;
- (void)setWifiL3PPS:(unint64_t)a3;
- (void)startMonitoringInterface:(id)a3;
- (void)unregisterStateChangeCallback:(void *)a3;
- (void)updateOverrideNetworkState:(id)a3 overrideValue:(unint64_t)a4;
@end

@implementation WiFiUserInteractionMonitor

- (void)_handleManagedEventNotification
{
}

- (BOOL)isAVConferenceActive
{
  v2 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (BOOL)isNetworkRecommendationAllowed
{
  if (![(WiFiUserInteractionMonitor *)self isSetupCompleted])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: setup not completed. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]", v6, v7);
    }
    goto LABEL_8;
  }
  if ([(WiFiUserInteractionMonitor *)self navigating]
    || [(WiFiUserInteractionMonitor *)self anyCallInProgress])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: navigating(%d) or in call(%d). Not allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]", -[WiFiUserInteractionMonitor navigating](self, "navigating"), -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
    }
LABEL_8:
    BOOL v4 = 0;
    goto LABEL_9;
  }
  if ([(WiFiUserInteractionMonitor *)self isCellularInexpensive5G])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: cellular is 5G and inexpensive. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]", v6, v7)];
    }
    goto LABEL_8;
  }
  if ([(WiFiUserInteractionMonitor *)self isUsingSustainedCellularData])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: in active cellular data usage. Allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]");
    }
  }
  else if ([(WiFiUserInteractionMonitor *)self isNetworkingAppInForeground])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: in FG networking app. Allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]"];
    }
  }
  else
  {
    if ([(WiFiUserInteractionMonitor *)self isInHomeScreen]
      || [(WiFiUserInteractionMonitor *)self isInNonNetworkingApp]
      || [(WiFiUserInteractionMonitor *)self isCellularDataUsable])
    {
      return 0;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: in an app and no cellular. Allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]");
    }
  }
  BOOL v4 = 1;
LABEL_9:
  return v4;
}

- (void)setApplicationRunningState:(BOOL)a3 foregroundState:(BOOL)a4 andNetworkingState:(BOOL)a5 forBundleId:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  if (!v10) {
    goto LABEL_25;
  }
  if (a3)
  {
    if (v7)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: %@ entered foreground", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10 message];
      }
      v12 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
      [v12 addObject:v10];
    }
    else
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: %@ entered background", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10 message];
      }
      v12 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
      [v12 removeObject:v10];
    }

    v14 = [(WiFiUserInteractionMonitor *)self runningNetworkingApps];
    v15 = v14;
    if (v6)
    {
      [v14 addObject:v10];
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: %@ exited", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10 message];
    }
    v13 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
    [v13 removeObject:v10];

    v14 = [(WiFiUserInteractionMonitor *)self runningNetworkingApps];
    v15 = v14;
  }
  [v14 removeObject:v10];
LABEL_16:

  [(WiFiUserInteractionMonitor *)self _notifyCaptiveWithApplicationState:[(WiFiUserInteractionMonitor *)self _applicationNotifyState]];
  if ([(WiFiUserInteractionMonitor *)self hasRealTimeAppProperty:v10])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v16 = [(WiFiUserInteractionMonitor *)self clients];
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v22 = [v21 callback];
          ((void (**)(void, id, uint64_t))v22)[2](v22, [v21 context], 8);
        }
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v18);
    }
  }
LABEL_25:
}

- (unint64_t)_applicationNotifyState
{
  unsigned __int8 v3 = [(WiFiUserInteractionMonitor *)self runningNetworkingApps];
  BOOL v4 = +[NSMutableSet setWithSet:v3];

  v5 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
  [v4 minusSet:v5];

  if ([(WiFiUserInteractionMonitor *)self isDeviceLocked]
    || [(WiFiUserInteractionMonitor *)self navigating]
    || ![(WiFiUserInteractionMonitor *)self isDisplayOn]
    || [(WiFiUserInteractionMonitor *)self isInNonNetworkingApp])
  {
    BOOL v6 = 0;
  }
  else
  {
    v9 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
    BOOL v6 = [v9 count] != 0;
  }
  if ([v4 count]) {
    unint64_t v7 = v6 | 2;
  }
  else {
    unint64_t v7 = v6;
  }

  return v7;
}

- (NSMutableSet)runningNetworkingApps
{
  return self->_runningNetworkingApps;
}

- (BOOL)navigating
{
  return self->_navigating;
}

- (BOOL)isDisplayOn
{
  return self->_isDisplayOn;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)_notifyCaptiveWithApplicationState:(unint64_t)a3
{
  if (dword_10027DCD8)
  {
    BOOL v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000054D8;
    block[3] = &unk_10023EAF8;
    block[4] = a3;
    dispatch_async(v4, block);
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: notify token is null" args:("-[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:]")];
    }
  }
}

- (void)setSymptomForegroundFlowProperties:(unint64_t)a3
{
  self->_symptomForegroundFlowProperties = a3;
}

- (void)setSymptomForegroundFlowClassification:(unsigned int)a3
{
  self->_symptomForegroundFlowClassification = a3;
}

- (void)setSymptomBackgroundFlowProperties:(unint64_t)a3
{
  self->_symptomBackgroundFlowProperties = a3;
}

- (void)setSymptomBackgroundFlowClassification:(unsigned int)a3
{
  self->_symptomBackgroundFlowClassification = a3;
}

- (void)setAppAwareDetails:(id)a3
{
}

- (BOOL)isUsingSustainedCellularData
{
  [(WiFiUserInteractionMonitor *)self cellularL3MBPS];
  return v3 > 2.0 || [(WiFiUserInteractionMonitor *)self cellularL3PPS] > 0x28;
}

- (BOOL)isNetworkingAppInForeground
{
  if ([(WiFiUserInteractionMonitor *)self overrideApplicationState])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden application state as %llu", "-[WiFiUserInteractionMonitor isNetworkingAppInForeground]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    }
    return [(WiFiUserInteractionMonitor *)self overrideApplicationState] & 1;
  }
  else if ([(WiFiUserInteractionMonitor *)self isInHomeScreen] {
         || [(WiFiUserInteractionMonitor *)self isInNonNetworkingApp])
  }
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
    BOOL v6 = +[NSMutableSet setWithSet:v5];

    BOOL v4 = [(WiFiUserInteractionMonitor *)self runningNetworkingApps];
    [v6 intersectSet:v4];

    LOBYTE(v4) = [v6 count] != 0;
  }
  return (char)v4;
}

- (BOOL)isCellularInexpensive5G
{
  v2 = self;
  if ([(WiFiUserInteractionMonitor *)self overrideApplicationState])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden inexpensive cellular state as 0x%llx", "-[WiFiUserInteractionMonitor isCellularInexpensive5G]", -[WiFiUserInteractionMonitor overrideApplicationState](v2, "overrideApplicationState"));
    }
    return ([(WiFiUserInteractionMonitor *)v2 overrideApplicationState] >> 7) & 1;
  }
  else
  {
    BOOL v4 = [(WiFiUserInteractionMonitor *)v2 cellularDataStatusMap];

    if (v4)
    {
      v5 = [(WiFiUserInteractionMonitor *)v2 cellularInterfaceName];
      if (sub_100015400(v5))
      {
        LOBYTE(v2) = 0;
      }
      else
      {
        BOOL v6 = [(WiFiUserInteractionMonitor *)v2 cellularDataStatusMap];
        LOBYTE(v2) = [v6 containsObject:@"WiFiCellularDataStatus5GAvailable"];
      }
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (unint64_t)cellularL3PPS
{
  return self->_cellularL3PPS;
}

- (double)cellularL3MBPS
{
  return self->_cellularL3MBPS;
}

- (NSSet)cellularDataStatusMap
{
  return self->_cellularDataStatusMap;
}

- (BOOL)anyCallInProgress
{
  return self->_anyCallInProgress;
}

+ (id)sharedInstance
{
  if (qword_10027DCD0 != -1) {
    dispatch_once(&qword_10027DCD0, &stru_1002435E0);
  }
  v2 = (void *)qword_10027DCC8;

  return v2;
}

- (void)runPeriodicTasks
{
  double v3 = +[NSDate date];
  BOOL v4 = [(WiFiUserInteractionMonitor *)self periodicTasksLastRanAt];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  unint64_t v7 = [(WiFiUserInteractionMonitor *)self periodicTasksLastRanAt];

  v8 = [(WiFiUserInteractionMonitor *)self periodicTasksLastRanAt];

  if (!v8 || v6 >= 5.0)
  {
    [(WiFiUserInteractionMonitor *)self setPeriodicTasksLastRanAt:v3];
    if (self->_ctServerConnectionRef)
    {
      v9 = [(WiFiUserInteractionMonitor *)self cellularInterfaceName];

      if (v9)
      {
        v53 = 0;
        getifaddrs(&v53);
        id v10 = v53;
        if (v53)
        {
          v11 = 0;
          ifa_data = 0;
          do
          {
            ifa_name = v10->ifa_name;
            if (ifa_name)
            {
              if (v10->ifa_data)
              {
                ifa_addr = v10->ifa_addr;
                if (ifa_addr)
                {
                  if (ifa_addr->sa_family == 18)
                  {
                    id v15 = [(WiFiUserInteractionMonitor *)self cellularInterfaceName];
                    int v16 = strcmp(ifa_name, (const char *)[v15 UTF8String]);

                    if (!v16) {
                      ifa_data = v10->ifa_data;
                    }
                    id v17 = [(WiFiUserInteractionMonitor *)self monitoredInterfaceNames];
                    if ([v17 count])
                    {
                      __s1a = v10->ifa_name;
                      id v18 = [(WiFiUserInteractionMonitor *)self monitoredInterfaceNames];
                      uint64_t v19 = [v18 allObjects];
                      id v20 = [v19 objectAtIndexedSubscript:0];
                      LODWORD(__s1a) = strcmp(__s1a, (const char *)[v20 UTF8String]);

                      if (!__s1a) {
                        v11 = v10->ifa_data;
                      }
                    }
                    else
                    {
                    }
                  }
                }
              }
            }
            id v10 = v10->ifa_next;
          }
          while (v10);
          if (ifa_data)
          {
            unint64_t v21 = (ifa_data[11] + ifa_data[10]);
            unint64_t v22 = (ifa_data[7] + ifa_data[5]);
            unint64_t v23 = [(WiFiUserInteractionMonitor *)self cellularIfTotalBytes];
            unint64_t v24 = [(WiFiUserInteractionMonitor *)self cellularIfTotalPackets];
            if (!v7)
            {
              [(WiFiUserInteractionMonitor *)self setCellularIfTotalBytes:v21];
              [(WiFiUserInteractionMonitor *)self setCellularIfTotalPackets:v22];
              if (v11) {
                goto LABEL_30;
              }
              goto LABEL_38;
            }
            unint64_t v25 = v24;
            unint64_t v26 = v21 - v23;
            if ([(WiFiUserInteractionMonitor *)self cellularIfTotalBytes] < v21) {
              [(WiFiUserInteractionMonitor *)self setCellularL3MBPS:(double)v26 / v6 * 0.000000953674316];
            }
            unint64_t v27 = v22 - v25;
            [(WiFiUserInteractionMonitor *)self setCellularIfTotalBytes:v21];
            if ([(WiFiUserInteractionMonitor *)self cellularIfTotalPackets] < v22) {
              [(WiFiUserInteractionMonitor *)self setCellularL3PPS:(unint64_t)((double)v27 / v6)];
            }
            [(WiFiUserInteractionMonitor *)self setCellularIfTotalPackets:v22];
            if (qword_10027DD68) {
              [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: cellular data did %llu bytes (%llu packets) over %.3f seconds", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v26, v27, *(void *)&v6);
            }
          }
          else
          {
            if (qword_10027DD68) {
              [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to find if_data for cellular interface.", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v39, v40, v41)];
            }
          }
          if (v11)
          {
LABEL_30:
            unint64_t v29 = (v11[11] + v11[10]);
            unint64_t v30 = (v11[7] + v11[5]);
            unint64_t v31 = [(WiFiUserInteractionMonitor *)self wifiIfTotalBytes];
            unint64_t v32 = [(WiFiUserInteractionMonitor *)self wifiIfTotalPackets];
            __s1 = (char *)v11[10];
            unint64_t v33 = [(WiFiUserInteractionMonitor *)self wifiIfTotalInputBytes];
            uint64_t v49 = v11[11];
            unint64_t v50 = v33;
            unint64_t v34 = [(WiFiUserInteractionMonitor *)self wifiIfTotalOutputBytes];
            uint64_t v47 = v11[5];
            unint64_t v48 = v34;
            unint64_t v35 = [(WiFiUserInteractionMonitor *)self wifiIfTotalInputPackets];
            uint64_t v46 = v11[7];
            unint64_t v36 = [(WiFiUserInteractionMonitor *)self wifiIfTotalOutputPackets];
            [(WiFiUserInteractionMonitor *)self setWifiIfTotalInputBytes:v11[10]];
            [(WiFiUserInteractionMonitor *)self setWifiIfTotalOutputBytes:v11[11]];
            [(WiFiUserInteractionMonitor *)self setWifiIfTotalInputPackets:v11[5]];
            [(WiFiUserInteractionMonitor *)self setWifiIfTotalOutputPackets:v11[7]];
            if (!v7)
            {
              [(WiFiUserInteractionMonitor *)self setWifiIfTotalBytes:v29];
              [(WiFiUserInteractionMonitor *)self setWifiIfTotalPackets:v30];
              goto LABEL_42;
            }
            unint64_t v37 = v29 - v31;
            if ([(WiFiUserInteractionMonitor *)self wifiIfTotalBytes] < v29) {
              [(WiFiUserInteractionMonitor *)self setWifiL3MBPS:(double)v37 / v6 * 0.000000953674316];
            }
            [(WiFiUserInteractionMonitor *)self setWifiIfTotalBytes:v29];
            if ([(WiFiUserInteractionMonitor *)self wifiIfTotalPackets] < v30) {
              [(WiFiUserInteractionMonitor *)self setWifiL3PPS:(unint64_t)((double)(v30 - v32) / v6)];
            }
            [(WiFiUserInteractionMonitor *)self setWifiIfTotalPackets:v30];
            if (qword_10027DD68) {
              [((id)qword_10027DD68) WFLog:message:3, "%s: WiFi data did %llu(input:%llu output:%llu) bytes, %llu(input:%llu output:%llu) packets over %.3f seconds", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v37, &__s1[-v50], v49 - v48, v30 - v32, v47 - v35, v46 - v36, *(void *)&v6];
            }
LABEL_40:
LABEL_42:
            freeifaddrs(v53);
            goto LABEL_43;
          }
LABEL_38:
          if (qword_10027DD68) {
            [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to find if_data for WiFi interface.", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v39, v40, v41, v42, v43, v44, v45);
          }
          goto LABEL_40;
        }
      }
    }
  }
LABEL_43:
}

- (NSMutableSet)monitoredInterfaceNames
{
  return self->_monitoredInterfaceNames;
}

- (NSString)cellularInterfaceName
{
  return self->_cellularInterfaceName;
}

- (NSDate)periodicTasksLastRanAt
{
  return self->_periodicTasksLastRanAt;
}

- (unint64_t)wifiIfTotalPackets
{
  return self->_wifiIfTotalPackets;
}

- (unint64_t)wifiIfTotalBytes
{
  return self->_wifiIfTotalBytes;
}

- (BOOL)isInNonNetworkingApp
{
  if (![(WiFiUserInteractionMonitor *)self isInHomeScreen])
  {
    uint64_t v3 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      double v5 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
      id v6 = [v5 count];

      if (v6)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        unint64_t v7 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
        v8 = [v7 allObjects];

        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
              if (!+[WiFiUserInteractionMonitor checkIfMatchesNonNetworkingBundleIds:](WiFiUserInteractionMonitor, "checkIfMatchesNonNetworkingBundleIds:", v13)&& !+[WiFiUserInteractionMonitor checkIfMatchesHomeBundleIds:v13])
              {

                return 0;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: currently no networking app is in the foreground", "-[WiFiUserInteractionMonitor isInNonNetworkingApp]");
        }
      }
    }
  }
  return 1;
}

+ (BOOL)checkIfMatchesNonNetworkingBundleIds:(id)a3
{
  id v3 = a3;
  +[WiFiUserInteractionMonitor getKnownNonNetworkingBundleIds];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = 1;
      if (objc_msgSend(v3, "rangeOfString:options:", *(void *)(*((void *)&v11 + 1) + 8 * v8), 1, (void)v11) != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)getKnownNonNetworkingBundleIds
{
  return &off_100264228;
}

- (BOOL)isRealTimeAppActive
{
  if ([(WiFiUserInteractionMonitor *)self overrideApplicationState])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden application state as %llu", "-[WiFiUserInteractionMonitor isRealTimeAppActive]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    }
    return ([(WiFiUserInteractionMonitor *)self overrideApplicationState] >> 6) & 1;
  }
  else if ([(WiFiUserInteractionMonitor *)self isWiFiCallInProgress] {
         || ([(WiFiUserInteractionMonitor *)self rtTrafficAgent],
  }
             id v5 = objc_claimAutoreleasedReturnValue(),
             unsigned __int8 v6 = [v5 isActive],
             v5,
             (v6 & 1) != 0))
  {
LABEL_17:
    LOBYTE(v4) = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
    uint64_t v8 = [v7 allObjects];

    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([(WiFiUserInteractionMonitor *)self hasRealTimeAppProperty:*(void *)(*((void *)&v14 + 1) + 8 * i)])
          {

            goto LABEL_17;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    LOBYTE(v4) = [(WiFiUserInteractionMonitor *)self _isSymptomTrackingRtTrafficForFlowNamed:@"foreground" withProperties:[(WiFiUserInteractionMonitor *)self symptomForegroundFlowProperties] andClassification:[(WiFiUserInteractionMonitor *)self symptomForegroundFlowClassification]];
  }
  return v4;
}

- (WiFiUserInteractionMonitorNetworkAgent)rtTrafficAgent
{
  return self->_rtTrafficAgent;
}

- (BOOL)hasRealTimeAppProperty:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  unint64_t v31 = sub_100022DB8;
  unint64_t v32 = sub_100022C84;
  id v33 = 0;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  if (![(WiFiUserInteractionMonitor *)self isSetupCompleted]) {
    goto LABEL_7;
  }
  unsigned int v5 = ![(WiFiUserInteractionMonitor *)self isFirstUserUnlocked];
  if (!v4) {
    LOBYTE(v5) = 1;
  }
  if (v5)
  {
LABEL_7:
    unsigned __int8 v10 = 0;
  }
  else
  {
    unsigned __int8 v6 = [(WiFiUserInteractionMonitor *)self appAttributes];
    uint64_t v7 = [v6 objectForKey:v4];
    uint64_t v8 = (void *)v29[5];
    v29[5] = v7;

    id v9 = (void *)v29[5];
    if (v9)
    {
      unsigned __int8 v10 = [v9 BOOLValue];
    }
    else
    {
      if (objc_opt_class())
      {
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
        long long v13 = [(WiFiUserInteractionMonitor *)self internalQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10017C0B8;
        block[3] = &unk_100243650;
        id v14 = v4;
        id v20 = v14;
        unint64_t v22 = &v24;
        unint64_t v23 = &v28;
        long long v15 = v12;
        unint64_t v21 = v15;
        dispatch_async(v13, block);

        dispatch_time_t v16 = dispatch_time(0, 10000000);
        if (dispatch_semaphore_wait(v15, v16))
        {
          if (qword_10027DD68) {
            [((id)qword_10027DD68) WFLog:3, @"%s: timed out waiting for LSApplicationRecord", @"-[WiFiUserInteractionMonitor hasRealTimeAppProperty:]"];
          }
        }
        else if (v29[5])
        {
          long long v18 = [(WiFiUserInteractionMonitor *)self appAttributes];
          [v18 setObject:v29[5] forKey:v14];
        }
      }
      unsigned __int8 v10 = *((unsigned char *)v25 + 24) != 0;
    }
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v10;
}

- (BOOL)isSetupCompleted
{
  if (&_BYSetupAssistantNeedsToRun && ![(WiFiUserInteractionMonitor *)self setupCompleted])
  {
    [(WiFiUserInteractionMonitor *)self setSetupCompleted:BYSetupAssistantNeedsToRun() ^ 1];
    id v4 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      unsigned int v5 = [(WiFiUserInteractionMonitor *)self setupCompleted];
      unsigned __int8 v6 = "not completed";
      if (v5) {
        unsigned __int8 v6 = "completed";
      }
      [v4 WFLog:3 message:@"%s: Setup is %s", @"-[WiFiUserInteractionMonitor isSetupCompleted]", v6];
    }
  }
  else
  {
    [(WiFiUserInteractionMonitor *)self setSetupCompleted:1];
  }

  return [(WiFiUserInteractionMonitor *)self setupCompleted];
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (BOOL)isFirstUserUnlocked
{
  return self->_isFirstUserUnlocked;
}

- (NSMutableDictionary)appAttributes
{
  return self->_appAttributes;
}

- (unint64_t)symptomForegroundFlowProperties
{
  return self->_symptomForegroundFlowProperties;
}

- (unsigned)symptomForegroundFlowClassification
{
  return self->_symptomForegroundFlowClassification;
}

- (BOOL)isWiFiCallInProgress
{
  if ([(WiFiUserInteractionMonitor *)self wifiCallInProgress]) {
    return 1;
  }
  id v4 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
  unsigned __int8 v5 = [v4 isActive];

  return v5;
}

- (BOOL)wifiCallInProgress
{
  return self->_wifiCallInProgress;
}

- (BOOL)_isSymptomTrackingRtTrafficForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5
{
  return (a5 & 0x1F) != 0;
}

- (BOOL)isInHomeScreen
{
  if ([(WiFiUserInteractionMonitor *)self overrideApplicationState])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden application state as %llu", "-[WiFiUserInteractionMonitor isInHomeScreen]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    }
    return ([(WiFiUserInteractionMonitor *)self overrideApplicationState] >> 2) & 1;
  }
  else
  {
    unsigned __int8 v5 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
    id v6 = [v5 count];

    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v7 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
      uint64_t v8 = [v7 allObjects];

      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v16;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            if (!+[WiFiUserInteractionMonitor checkIfMatchesHomeBundleIds:*(void *)(*((void *)&v15 + 1) + 8 * i)])
            {
              LOBYTE(v4) = 0;
              goto LABEL_16;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v4) = 1;
LABEL_16:
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, @"%s: no runningForegroundApps", @"-[WiFiUserInteractionMonitor isInHomeScreen]"];
      }
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (NSMutableSet)runningForegroundApps
{
  return self->_runningForegroundApps;
}

+ (BOOL)checkIfMatchesHomeBundleIds:(id)a3
{
  id v3 = a3;
  +[WiFiUserInteractionMonitor getHomeBundleIds];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v3 lowercaseString:v11];
        LOBYTE(v8) = [v9 containsString:v8];

        if (v8)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (id)getHomeBundleIds
{
  return &off_100264210;
}

- (unint64_t)overrideApplicationState
{
  return self->_overrideApplicationState;
}

- (unint64_t)cellularIfTotalPackets
{
  return self->_cellularIfTotalPackets;
}

- (unint64_t)cellularIfTotalBytes
{
  return self->_cellularIfTotalBytes;
}

- (unint64_t)wifiIfTotalOutputPackets
{
  return self->_wifiIfTotalOutputPackets;
}

- (unint64_t)wifiIfTotalOutputBytes
{
  return self->_wifiIfTotalOutputBytes;
}

- (unint64_t)wifiIfTotalInputPackets
{
  return self->_wifiIfTotalInputPackets;
}

- (unint64_t)wifiIfTotalInputBytes
{
  return self->_wifiIfTotalInputBytes;
}

- (void)setWifiL3PPS:(unint64_t)a3
{
  self->_wifiL3PPS = a3;
}

- (void)setWifiL3MBPS:(double)a3
{
  self->_wifiL3MBPS = a3;
}

- (void)setWifiIfTotalPackets:(unint64_t)a3
{
  self->_wifiIfTotalPackets = a3;
}

- (void)setWifiIfTotalOutputPackets:(unint64_t)a3
{
  self->_wifiIfTotalOutputPackets = a3;
}

- (void)setWifiIfTotalOutputBytes:(unint64_t)a3
{
  self->_wifiIfTotalOutputBytes = a3;
}

- (void)setWifiIfTotalInputPackets:(unint64_t)a3
{
  self->_wifiIfTotalInputPackets = a3;
}

- (void)setWifiIfTotalInputBytes:(unint64_t)a3
{
  self->_wifiIfTotalInputBytes = a3;
}

- (void)setWifiIfTotalBytes:(unint64_t)a3
{
  self->_wifiIfTotalBytes = a3;
}

- (void)setPeriodicTasksLastRanAt:(id)a3
{
}

- (void)setCellularIfTotalPackets:(unint64_t)a3
{
  self->_cellularIfTotalPackets = a3;
}

- (void)setCellularIfTotalBytes:(unint64_t)a3
{
  self->_cellularIfTotalBytes = a3;
}

- (BOOL)isPersonalHotspotRecommendationAllowed
{
  if (![(WiFiUserInteractionMonitor *)self isSetupCompleted])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: setup not completed. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", v5, v6)];
    }
    goto LABEL_8;
  }
  if ([(WiFiUserInteractionMonitor *)self navigating]
    || [(WiFiUserInteractionMonitor *)self anyCallInProgress])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: navigating(%d) or in call(%d). Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", -[WiFiUserInteractionMonitor navigating](self, "navigating"), -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
    }
LABEL_8:
    return 0;
  }
  if ([(WiFiUserInteractionMonitor *)self isCellularInexpensive5G])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: cellular is 5G and inexpensive. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", v5, v6);
    }
    goto LABEL_8;
  }
  if ([(WiFiUserInteractionMonitor *)self isDeviceLocked]
    || ![(WiFiUserInteractionMonitor *)self isDisplayOn])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Device locked or Display is OFF. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", v5, v6);
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (BOOL)isAirplayActiveOverInfra
{
  return self->_isAirplayActiveOverInfra;
}

- (id)_initPrivate
{
  v31.receiver = self;
  v31.super_class = (Class)WiFiUserInteractionMonitor;
  v2 = [(WiFiUserInteractionMonitor *)&v31 init];
  if (!v2) {
    goto LABEL_25;
  }
  id v3 = +[NSMutableArray array];
  [(WiFiUserInteractionMonitor *)v2 setClients:v3];

  id v4 = [(WiFiUserInteractionMonitor *)v2 clients];

  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifid.WiFiUserInteractionMonitor", v5);
  [(WiFiUserInteractionMonitor *)v2 setInternalQueue:v6];

  id v4 = [(WiFiUserInteractionMonitor *)v2 internalQueue];

  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v7 = +[NSMutableSet set];
  [(WiFiUserInteractionMonitor *)v2 setMonitoredInterfaceNames:v7];

  id v4 = [(WiFiUserInteractionMonitor *)v2 monitoredInterfaceNames];

  if (!v4) {
    goto LABEL_21;
  }
  [(WiFiUserInteractionMonitor *)v2 setAnyCallInProgress:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiCallInProgress:0];
  [(WiFiUserInteractionMonitor *)v2 setCallHostedOnThisDevice:0];
  [(WiFiUserInteractionMonitor *)v2 setIsCarPlay:0];
  [(WiFiUserInteractionMonitor *)v2 setIsMediaPlaying:0];
  [(WiFiUserInteractionMonitor *)v2 setIsAirplayActiveOverInfra:0];
  if (&_managed_event_fetch)
  {
    if (!notify_register_mach_port(kSymptomManagedEventWiFiAppAwareNotification, &v2->_managedEventNotifyPort, 0, &v2->_managedEventNotifyToken))
    {
      uint64_t v8 = [(WiFiUserInteractionMonitor *)v2 internalQueue];
      f = (void *)dispatch_mach_create_f();
      [(WiFiUserInteractionMonitor *)v2 setManagedEventDispatchPort:f];

      id v4 = [(WiFiUserInteractionMonitor *)v2 managedEventDispatchPort];

      if (!v4) {
        goto LABEL_21;
      }
      id v10 = [(WiFiUserInteractionMonitor *)v2 managedEventDispatchPort];
      [(WiFiUserInteractionMonitor *)v2 managedEventNotifyPort];
      dispatch_mach_connect();

      goto LABEL_9;
    }
LABEL_25:
    id v4 = 0;
    goto LABEL_21;
  }
LABEL_9:
  [(WiFiUserInteractionMonitor *)v2 setAppAwareDetails:0];
  long long v11 = [[WiFiUserInteractionMonitorNetworkAgent alloc] initWithUUID:@"A2CB4344-1CC7-47EF-8D25-FB68B047620F" andDescription:@"APPLE80211KEY_REAL_TIME_MEDIA_TRAFFIC_UUID"];
  [(WiFiUserInteractionMonitor *)v2 setRtTrafficAgent:v11];

  id v4 = [(WiFiUserInteractionMonitor *)v2 rtTrafficAgent];

  if (!v4) {
    goto LABEL_21;
  }
  long long v12 = [(WiFiUserInteractionMonitor *)v2 rtTrafficAgent];
  [v12 registerStateChangeCallback:&stru_100243600 withCallbackContext:v2];

  notify_register_check("com.apple.airport.userNotification", &dword_10027DCD8);
  [(WiFiUserInteractionMonitor *)v2 setNavigating:0];
  if (!objc_opt_class()) {
    goto LABEL_13;
  }
  id v13 = objc_alloc((Class)GEONavigationListener);
  long long v14 = [(WiFiUserInteractionMonitor *)v2 internalQueue];
  id v15 = [v13 initWithQueue:v14];
  [(WiFiUserInteractionMonitor *)v2 setNavigationListener:v15];

  long long v16 = [(WiFiUserInteractionMonitor *)v2 navigationListener];

  if (!v16)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: unable to create navigation listener", "-[WiFiUserInteractionMonitor _initPrivate]");
    }
    goto LABEL_25;
  }
  long long v17 = [(WiFiUserInteractionMonitor *)v2 navigationListener];
  [v17 setDelegate:v2];

LABEL_13:
  if (objc_opt_class() && NSClassFromString(@"CXCallObserver"))
  {
    long long v18 = [(WiFiUserInteractionMonitor *)v2 internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017AED0;
    block[3] = &unk_10023E9B8;
    uint64_t v30 = v2;
    dispatch_async(v18, block);
  }
  long long v19 = +[NSMutableSet set];
  [(WiFiUserInteractionMonitor *)v2 setRunningForegroundApps:v19];

  id v20 = +[NSMutableSet set];
  [(WiFiUserInteractionMonitor *)v2 setRunningNetworkingApps:v20];

  [(WiFiUserInteractionMonitor *)v2 setSetupCompleted:0];
  [(WiFiUserInteractionMonitor *)v2 setInitialSetupCompleted:0];
  v2->_ctServerConnectionRef = 0;
  if (&__CTServerConnectionCreateWithIdentifier)
  {
    v2->_ctServerConnectionRef = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: created a CT server connection %p", "-[WiFiUserInteractionMonitor _initPrivate]", v2->_ctServerConnectionRef];
    }
  }
  [(WiFiUserInteractionMonitor *)v2 setCellularL3MBPS:0.0];
  [(WiFiUserInteractionMonitor *)v2 setCellularL3PPS:0];
  [(WiFiUserInteractionMonitor *)v2 setCellularIfTotalBytes:0];
  [(WiFiUserInteractionMonitor *)v2 setCellularIfTotalPackets:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiL3MBPS:0.0];
  [(WiFiUserInteractionMonitor *)v2 setWifiL3PPS:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiIfTotalBytes:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiIfTotalPackets:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiIfTotalInputBytes:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiIfTotalOutputBytes:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiIfTotalInputPackets:0];
  [(WiFiUserInteractionMonitor *)v2 setWifiIfTotalOutputPackets:0];
  [(WiFiUserInteractionMonitor *)v2 setPeriodicTasksLastRanAt:0];
  unint64_t v22 = +[NSMutableDictionary dictionary];
  [(WiFiUserInteractionMonitor *)v2 setOverrideNetworkState:v22];

  [(WiFiUserInteractionMonitor *)v2 setIsFirstUserUnlocked:0];
  unint64_t v23 = +[NSMutableDictionary dictionary];
  [(WiFiUserInteractionMonitor *)v2 setAppAttributes:v23];

  [(WiFiUserInteractionMonitor *)v2 setGameNotifyToken:0];
  internalQueue = v2->_internalQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10017AF64;
  handler[3] = &unk_100243628;
  id v4 = v2;
  uint64_t v28 = v4;
  notify_register_dispatch("com.apple.system.console_mode_changed", &v2->_gameNotifyToken, internalQueue, handler);
  v2 = v28;
LABEL_21:

  return v4;
}

- (void)dealloc
{
  id v3 = [(WiFiUserInteractionMonitor *)self managedEventDispatchPort];

  if (v3)
  {
    id v4 = [(WiFiUserInteractionMonitor *)self managedEventDispatchPort];
    dispatch_mach_cancel();
  }
  if ([(WiFiUserInteractionMonitor *)self managedEventNotifyToken])
  {
    notify_cancel([(WiFiUserInteractionMonitor *)self managedEventNotifyToken]);
    [(WiFiUserInteractionMonitor *)self setManagedEventNotifyToken:0];
  }
  uint64_t v5 = [(WiFiUserInteractionMonitor *)self callObserver];

  if (v5)
  {
    dispatch_queue_t v6 = [(WiFiUserInteractionMonitor *)self callObserver];
    [v6 setDelegate:0 queue:0];

    [(WiFiUserInteractionMonitor *)self setCallObserver:0];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [(WiFiUserInteractionMonitor *)self monitoredInterfaceNames];
  uint64_t v8 = [v7 allObjects];

  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v12);
        long long v14 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];

        if (v14)
        {
          id v15 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
          long long v16 = [v15 registration];
          [v16 removeNetworkAgentFromInterfaceNamed:v13];
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  long long v17 = [(WiFiUserInteractionMonitor *)self monitoredInterfaceNames];
  [v17 removeAllObjects];

  long long v18 = +[NSNotificationCenter defaultCenter];
  [v18 removeObserver:self];

  long long v19 = [(WiFiUserInteractionMonitor *)self clients];
  [v19 removeAllObjects];

  id v20 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  [v20 removeAllObjects];

  ctServerConnectionRef = self->_ctServerConnectionRef;
  if (ctServerConnectionRef) {
    CFRelease(ctServerConnectionRef);
  }
  v22.receiver = self;
  v22.super_class = (Class)WiFiUserInteractionMonitor;
  [(WiFiUserInteractionMonitor *)&v22 dealloc];
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnectionRef;
}

- (void)startMonitoringInterface:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    id v4 = [(WiFiUserInteractionMonitor *)self monitoredInterfaceNames];
    unsigned __int8 v5 = [v4 containsObject:v10];

    if ((v5 & 1) == 0)
    {
      dispatch_queue_t v6 = [(WiFiUserInteractionMonitor *)self monitoredInterfaceNames];
      [v6 addObject:v10];

      uint64_t v7 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];

      if (v7)
      {
        uint64_t v8 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
        id v9 = [v8 registration];
        [v9 addNetworkAgentToInterfaceNamed:v10];
      }
    }
  }
}

- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4
{
  id v11 = a3;
  uint64_t v7 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    id v8 = objc_retainBlock(v11);
    [v7 WFLog:3, "%s: callback %@, context %@", "-[WiFiUserInteractionMonitor registerStateChangeCallback:withCallbackContext:]", v8, a4 message];
  }
  id v9 = objc_alloc_init(WiFiUserInteractionMonitorClient);
  [(WiFiUserInteractionMonitorClient *)v9 setCallback:v11];
  [(WiFiUserInteractionMonitorClient *)v9 setContext:a4];
  id v10 = [(WiFiUserInteractionMonitor *)self clients];
  [v10 addObject:v9];
}

- (void)unregisterStateChangeCallback:(void *)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned __int8 v5 = [(WiFiUserInteractionMonitor *)self clients];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6)
  {
    id v8 = v5;
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if ([v11 context] == a3)
      {
        id v12 = v11;

        id v8 = v12;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v7);

  if (v8)
  {
    uint64_t v13 = [(WiFiUserInteractionMonitor *)self clients];
    [v13 removeObject:v8];

LABEL_13:
  }
}

- (void)setCurrentDisplayState:(BOOL)a3 andLockState:(BOOL)a4
{
  BOOL v4 = a4;
  [(WiFiUserInteractionMonitor *)self setIsDisplayOn:a3];
  [(WiFiUserInteractionMonitor *)self setIsDeviceLocked:v4];
  if (![(WiFiUserInteractionMonitor *)self isDeviceLocked]
    && [(WiFiUserInteractionMonitor *)self isDisplayOn])
  {
    [(WiFiUserInteractionMonitor *)self setIsFirstUserUnlocked:1];
  }
  unint64_t v6 = [(WiFiUserInteractionMonitor *)self _applicationNotifyState];

  [(WiFiUserInteractionMonitor *)self _notifyCaptiveWithApplicationState:v6];
}

- (void)setOverrideApplicationState:(unint64_t)a3
{
  if ([(WiFiUserInteractionMonitor *)self overrideApplicationState] != a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: setting override state to %llu", "-[WiFiUserInteractionMonitor setOverrideApplicationState:]", a3];
    }
    self->_overrideApplicationState = a3;
    unint64_t v6 = [(WiFiUserInteractionMonitor *)self overrideApplicationState];
    [(WiFiUserInteractionMonitor *)self _notifyCaptiveWithApplicationState:v6];
  }
}

- (void)updateOverrideNetworkState:(id)a3 overrideValue:(unint64_t)a4
{
  id v10 = a3;
  NSLog(@"updateOverrideNetworkState: ssid %@ state 0x%llx\n", v10, a4);
  unint64_t v6 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  id v7 = v6;
  if (a4)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:a4];
    [v7 setObject:v8 forKey:v10];
  }
  else
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:v10];

    if (!v9) {
      goto LABEL_6;
    }
    id v7 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
    [v7 removeObjectForKey:v10];
  }

LABEL_6:
}

- (void)resetOverrideStates
{
  [(WiFiUserInteractionMonitor *)self setOverrideApplicationState:0];
  unint64_t v3 = [(WiFiUserInteractionMonitor *)self _applicationNotifyState];

  [(WiFiUserInteractionMonitor *)self _notifyCaptiveWithApplicationState:v3];
}

- (void)resetOverrideNetworkStates
{
  unint64_t v3 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];

  if (v3)
  {
    BOOL v4 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
    [v4 removeAllObjects];

    id v5 = +[NSMutableDictionary dictionary];
    [(WiFiUserInteractionMonitor *)self setOverrideNetworkState:v5];
  }
}

- (void)dumpOverrideNetworkState
{
  unint64_t v3 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];

  if (v3)
  {
    id v4 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
    NSLog(@"%s: overrideNetworkState %@\n", "-[WiFiUserInteractionMonitor dumpOverrideNetworkState]", v4);
  }
}

- (void)resetBackgroundApps
{
  id v2 = [(WiFiUserInteractionMonitor *)self runningNetworkingApps];
  [v2 removeAllObjects];
}

- (BOOL)isPriorityNetwork:(__WiFiNetwork *)a3
{
  id v5 = sub_10001A43C(a3);
  uint64_t v6 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  if (!v6) {
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  id v8 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  uint64_t v9 = [v8 objectForKey:v5];

  if (v9)
  {
    id v10 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
    id v11 = [v10 objectForKey:v5];
    id v12 = [v11 unsignedLongLongValue];

    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden isPriorityNetwork state as 0x%llx", "-[WiFiUserInteractionMonitor isPriorityNetwork:]", v12);
    }
    BOOL v14 = v12 & 1;
  }
  else
  {
LABEL_6:
    BOOL v14 = sub_1000D2DA0((uint64_t)a3);
  }

  return v14;
}

- (BOOL)isPublicNetwork:(__WiFiNetwork *)a3
{
  unint64_t v3 = (CFDictionaryRef *)a3;
  id v5 = sub_10001A43C(a3);
  uint64_t v6 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  if (!v6) {
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  id v8 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  uint64_t v9 = [v8 objectForKey:v5];

  if (v9)
  {
    id v10 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
    id v11 = [v10 objectForKey:v5];
    unint64_t v12 = (unint64_t)[v11 unsignedLongLongValue];

    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden isPublicNetwork state as 0x%llx", "-[WiFiUserInteractionMonitor isPublicNetwork:]", v12);
    }
    unint64_t v3 = (CFDictionaryRef *)((v12 >> 1) & 1);
  }
  else
  {
LABEL_6:
    LOBYTE(v3) = sub_1000D2F10(v3) != 0;
  }

  return (char)v3;
}

- (BOOL)isLowQualityNetwork:(__WiFiNetwork *)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v5 = sub_10001A43C(a3);
  uint64_t v6 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  if (!v6) {
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  id v8 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  uint64_t v9 = [v8 objectForKey:v5];

  if (v9)
  {
    id v10 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
    id v11 = [v10 objectForKey:v5];
    unint64_t v12 = (unint64_t)[v11 unsignedLongLongValue];

    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden isLowQualityNetwork state as 0x%llx", "-[WiFiUserInteractionMonitor isLowQualityNetwork:]", v12);
    }
    uint64_t v3 = (v12 >> 2) & 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v3) = sub_1000D2F54(v3);
  }

  return v3;
}

- (BOOL)isInitialSetupCompleted
{
  if (&_BYSetupAssistantNeedsToRun) {
    BOOL v3 = &_BYSetupAssistantHasCompletedInitialRun == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || [(WiFiUserInteractionMonitor *)self initialSetupCompleted])
  {
    [(WiFiUserInteractionMonitor *)self setInitialSetupCompleted:1];
  }
  else
  {
    if (BYSetupAssistantHasCompletedInitialRun()) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = BYSetupAssistantNeedsToRun() ^ 1;
    }
    [(WiFiUserInteractionMonitor *)self setInitialSetupCompleted:v4];
    uint64_t v6 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      unsigned int v7 = [(WiFiUserInteractionMonitor *)self initialSetupCompleted];
      id v8 = "not completed";
      if (v7) {
        id v8 = "completed";
      }
      [v6 WFLog:3 message:@"%s: Initial setup is %s", @"-[WiFiUserInteractionMonitor isInitialSetupCompleted]", v8];
    }
  }

  return [(WiFiUserInteractionMonitor *)self initialSetupCompleted];
}

- (BOOL)isUsingSustainedWiFiData
{
  [(WiFiUserInteractionMonitor *)self wifiL3MBPS];
  return v3 > 2.0 || [(WiFiUserInteractionMonitor *)self wifiL3PPS] > 0x28;
}

- (BOOL)isCellularDataUsable
{
  double v3 = [(WiFiUserInteractionMonitor *)self cellularDataStatusMap];

  if (v3)
  {
    uint64_t v4 = [(WiFiUserInteractionMonitor *)self cellularDataStatusMap];
    unsigned int v5 = [v4 containsObject:@"WiFiCellularDataStatusNoLTE"] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isAskToJoinAllowed
{
  if (![(WiFiUserInteractionMonitor *)self isSetupCompleted])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: setup not completed. Not allowing ask-to-join.", "-[WiFiUserInteractionMonitor isAskToJoinAllowed]", v6, v7);
    }
    goto LABEL_8;
  }
  if ([(WiFiUserInteractionMonitor *)self navigating]
    || [(WiFiUserInteractionMonitor *)self anyCallInProgress])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: navigating(%d) or in call(%d). Not allowing ask-to-join.", "-[WiFiUserInteractionMonitor isAskToJoinAllowed]", -[WiFiUserInteractionMonitor navigating](self, "navigating"), -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
    }
LABEL_8:
    BOOL v4 = 0;
    goto LABEL_9;
  }
  if (![(WiFiUserInteractionMonitor *)self isNetworkingAppInForeground]) {
    return 0;
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: in FG networking app. Allowing atj.", "-[WiFiUserInteractionMonitor isAskToJoinAllowed]")];
  }
  BOOL v4 = 1;
LABEL_9:
  return v4;
}

- (BOOL)isAnyCallInProgress
{
  if ([(WiFiUserInteractionMonitor *)self anyCallInProgress]) {
    return 1;
  }
  BOOL v4 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
  unsigned __int8 v5 = [v4 isActive];

  return v5;
}

- (BOOL)isCoPresenceActive
{
  double v3 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
  if ([v3 avcMinJB])
  {
    BOOL v4 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
    BOOL v5 = (unint64_t)[v4 avcMinJB] < 0x15;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isCarModeActive
{
  if ([(WiFiUserInteractionMonitor *)self carModeActive]) {
    return 1;
  }

  return [(WiFiUserInteractionMonitor *)self navigating];
}

- (BOOL)canTrigger11axPerfStudyForForegroundFlows
{
  unint64_t v3 = [(WiFiUserInteractionMonitor *)self symptomForegroundFlowProperties];
  uint64_t v4 = [(WiFiUserInteractionMonitor *)self symptomForegroundFlowClassification];

  return [(WiFiUserInteractionMonitor *)self _canTrigger11axPerfStudyForFlowNamed:@"foreground" withProperties:v3 andClassification:v4];
}

- (BOOL)canTrigger11axPerfStudyForBackgroundFlows
{
  unint64_t v3 = [(WiFiUserInteractionMonitor *)self symptomBackgroundFlowProperties];
  uint64_t v4 = [(WiFiUserInteractionMonitor *)self symptomBackgroundFlowClassification];

  return [(WiFiUserInteractionMonitor *)self _canTrigger11axPerfStudyForFlowNamed:@"background" withProperties:v3 andClassification:v4];
}

- (BOOL)_canTrigger11axPerfStudyForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5
{
  char v5 = a5;
  unsigned int v6 = a4;
  id v7 = a3;
  if ((v5 & 0x1F) != 0)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: app-aware flow:%@ latency:0x%x jitter:0x%x lossTolerance:0x%x duration:0x%x requiredBandwidth:0x%x preferredBandwidth:0x%x", "-[WiFiUserInteractionMonitor _canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:]", v7, v6, (v6 >> 1), (v6 >> 2), (v6 >> 3), (v6 >> 4), (v6 >> 5) message];
    }
    int v9 = ((v6 >> 2) & 1) + ((v6 >> 3) & 1);
    unsigned int v10 = v9 + ((v6 >> 1) & 1);
    unsigned int v11 = v9 + ((v6 >> 4) & 1);
    BOOL v13 = v10 > 2 || v11 > 2 || (v6 & 0xC00) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_updateCallState
{
  id v2 = self;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  unint64_t v3 = [(WiFiUserInteractionMonitor *)self callObserver];
  uint64_t v4 = [v3 calls];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    int v41 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v51;
    uint64_t v35 = *(void *)v51;
    unint64_t v36 = v2;
    do
    {
      unsigned int v10 = 0;
      id v37 = v6;
      do
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v50 + 1) + 8 * (void)v10) hasConnected])
        {
          uint64_t v40 = v10;
          if (qword_10027DD68) {
            [((id)qword_10027DD68) WFLog:3, "%s: call has connected", "-[WiFiUserInteractionMonitor _updateCallState]"];
          }
          unint64_t v12 = +[TUCallCenter callCenterWithQueue:v2->_internalQueue];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          BOOL v13 = [v12 currentCalls];
          id v14 = [v13 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v39 = v12;
            uint64_t v16 = *(void *)v47;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v47 != v16) {
                  objc_enumerationMutation(v13);
                }
                long long v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                long long v19 = [v18 providerContext];
                if (qword_10027DD68) {
                  [(id)qword_10027DD68 WFLog:3, "%s: call context %@", "-[WiFiUserInteractionMonitor _updateCallState]", v19 message];
                }
                unint64_t v21 = [v19 objectForKey:@"kCallSubType"];
                if ([v21 isEqualToString:@"kCallSubTypeWifi"])
                {
                  if (qword_10027DD68) {
                    [((id)qword_10027DD68) WFLog:3, @"%s: call is connected over WiFi", @"-[WiFiUserInteractionMonitor _updateCallState]"];
                  }
                  int v41 = 1;
                }
                unsigned int v23 = [v18 isHostedOnCurrentDevice];
                if (qword_10027DD68)
                {
                  if (v23) {
                    long long v25 = "%s: Call is hosted on this device";
                  }
                  else {
                    long long v25 = "%s: Call is not hosted on this device";
                  }
                  [((id)qword_10027DD68) WFLog:3 message:v25 -[WiFiUserInteractionMonitor _updateCallState]];
                }
                v7 |= v23;
              }
              id v15 = [v13 countByEnumeratingWithState:&v46 objects:v55 count:16];
            }
            while (v15);
            char v8 = 1;
            id v2 = v36;
            id v6 = v37;
            uint64_t v9 = v35;
            unint64_t v12 = v39;
          }

          unsigned int v10 = v40;
        }
        unsigned int v10 = (char *)v10 + 1;
      }
      while (v10 != v6);
      id v6 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
    int v41 = 0;
    char v8 = 0;
  }

  if ([(WiFiUserInteractionMonitor *)v2 anyCallInProgress] && (v8 & 1) == 0)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: call has ended", "-[WiFiUserInteractionMonitor _updateCallState]");
    }
  }
  char v27 = v8 ^ [(WiFiUserInteractionMonitor *)v2 anyCallInProgress];
  if (v27) {
    [(WiFiUserInteractionMonitor *)v2 setAnyCallInProgress:v8 & 1];
  }
  if ((v41 ^ [(WiFiUserInteractionMonitor *)v2 wifiCallInProgress]))
  {
    [(WiFiUserInteractionMonitor *)v2 setWifiCallInProgress:v41 & 1];
    if ((v7 & 1) == [(WiFiUserInteractionMonitor *)v2 callHostedOnThisDevice]) {
      goto LABEL_46;
    }
  }
  else if (((v7 ^ [(WiFiUserInteractionMonitor *)v2 callHostedOnThisDevice]) & 1) == 0)
  {
    if ((v27 & 1) == 0) {
      return;
    }
    goto LABEL_46;
  }
  [(WiFiUserInteractionMonitor *)v2 setCallHostedOnThisDevice:v7 & 1];
LABEL_46:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v28 = [(WiFiUserInteractionMonitor *)v2 clients];
  id v29 = [v28 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v43;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
        unint64_t v34 = [v33 callback];
        ((void (**)(void, id, uint64_t))v34)[2](v34, [v33 context], 2);
      }
      id v30 = [v28 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v30);
  }
}

- (BOOL)_isCellularDataAllowedForApp:(id)a3
{
  id v4 = a3;
  if (v4 && self->_ctServerConnectionRef) {
    _CTServerConnectionCopyCellularUsagePolicy();
  }

  return 1;
}

- (id)_stateInfo
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSDate date];
  id v5 = +[NSString stringWithFormat:@"%p@%@", self, v4];
  id v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  [v3 setObject:v5 forKeyedSubscript:v7];

  char v8 = [(WiFiUserInteractionMonitor *)self appAwareDetails];
  [v3 setObject:v8 forKeyedSubscript:@"AppAwareDetails"];

  uint64_t v9 = +[NSString stringWithFormat:@"0x%llx", [(WiFiUserInteractionMonitor *)self symptomForegroundFlowProperties]];
  [v3 setObject:v9 forKeyedSubscript:@"ForegroundFlows"];

  unsigned int v10 = +[NSString stringWithFormat:@"0x%llx", [(WiFiUserInteractionMonitor *)self symptomBackgroundFlowProperties]];
  [v3 setObject:v10 forKeyedSubscript:@"BackgroundFlows"];

  unsigned int v11 = +[NSString stringWithFormat:@"0x%x", [(WiFiUserInteractionMonitor *)self symptomForegroundFlowClassification]];
  [v3 setObject:v11 forKeyedSubscript:@"ForegroundClassification"];

  unint64_t v12 = +[NSString stringWithFormat:@"0x%x", [(WiFiUserInteractionMonitor *)self symptomBackgroundFlowClassification]];
  [v3 setObject:v12 forKeyedSubscript:@"BackgroundClassification"];

  BOOL v13 = [(WiFiUserInteractionMonitor *)self runningForegroundApps];
  [v3 setObject:v13 forKeyedSubscript:@"ForegroundApps"];

  id v14 = [(WiFiUserInteractionMonitor *)self runningNetworkingApps];
  [v3 setObject:v14 forKeyedSubscript:@"NetworkingApps"];

  id v15 = [(WiFiUserInteractionMonitor *)self monitoredInterfaceNames];
  [v3 setObject:v15 forKeyedSubscript:@"InterfaceNames"];

  if ([(WiFiUserInteractionMonitor *)self isSetupCompleted]) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  [v3 setObject:v16 forKeyedSubscript:@"IsSetupCompleted"];
  if ([(WiFiUserInteractionMonitor *)self navigating]) {
    CFStringRef v17 = @"YES";
  }
  else {
    CFStringRef v17 = @"NO";
  }
  [v3 setObject:v17 forKeyedSubscript:@"IsNavigating"];
  if ([(WiFiUserInteractionMonitor *)self isInHomeScreen]) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  [v3 setObject:v18 forKeyedSubscript:@"IsInHomeScreen"];
  if ([(WiFiUserInteractionMonitor *)self isAnyCallInProgress]) {
    CFStringRef v19 = @"YES";
  }
  else {
    CFStringRef v19 = @"NO";
  }
  [v3 setObject:v19 forKeyedSubscript:@"IsAnyCallInProgress"];
  if ([(WiFiUserInteractionMonitor *)self isWiFiCallInProgress]) {
    CFStringRef v20 = @"YES";
  }
  else {
    CFStringRef v20 = @"NO";
  }
  [v3 setObject:v20 forKeyedSubscript:@"IsWiFiCallInProgress"];
  if ([(WiFiUserInteractionMonitor *)self isCallHostedOnThisDevice]) {
    CFStringRef v21 = @"YES";
  }
  else {
    CFStringRef v21 = @"NO";
  }
  [v3 setObject:v21 forKeyedSubscript:@"IsCallHostedOnThisDevice"];
  if ([(WiFiUserInteractionMonitor *)self isInNonNetworkingApp]) {
    CFStringRef v22 = @"YES";
  }
  else {
    CFStringRef v22 = @"NO";
  }
  [v3 setObject:v22 forKeyedSubscript:@"IsInNonNetworkingApp"];
  if ([(WiFiUserInteractionMonitor *)self isNetworkingAppInForeground]) {
    CFStringRef v23 = @"YES";
  }
  else {
    CFStringRef v23 = @"NO";
  }
  [v3 setObject:v23 forKeyedSubscript:@"IsNetworkingAppInForeground"];
  if ([(WiFiUserInteractionMonitor *)self isRealTimeAppActive]) {
    CFStringRef v24 = @"YES";
  }
  else {
    CFStringRef v24 = @"NO";
  }
  [v3 setObject:v24 forKeyedSubscript:@"IsRealTimeAppActive"];
  long long v25 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
  if ([v25 isActive]) {
    CFStringRef v26 = @"YES";
  }
  else {
    CFStringRef v26 = @"NO";
  }
  [v3 setObject:v26 forKeyedSubscript:@"IsAVConferenceActive"];

  char v27 = [(WiFiUserInteractionMonitor *)self rtTrafficAgent];
  uint64_t v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llums", [v27 avcMinJB]);
  [v3 setObject:v28 forKeyedSubscript:@"AVCMinJitterBuffer"];

  if ([(WiFiUserInteractionMonitor *)self isCoPresenceActive]) {
    CFStringRef v29 = @"YES";
  }
  else {
    CFStringRef v29 = @"NO";
  }
  [v3 setObject:v29 forKeyedSubscript:@"IsCoPresenceActive"];
  if ([(WiFiUserInteractionMonitor *)self isCellularDataUsable]) {
    CFStringRef v30 = @"YES";
  }
  else {
    CFStringRef v30 = @"NO";
  }
  [v3 setObject:v30 forKeyedSubscript:@"IsCellularDataUsable"];
  if ([(WiFiUserInteractionMonitor *)self isUsingSustainedCellularData]) {
    CFStringRef v31 = @"YES";
  }
  else {
    CFStringRef v31 = @"NO";
  }
  [v3 setObject:v31 forKeyedSubscript:@"IsUsingCellularData"];
  if ([(WiFiUserInteractionMonitor *)self isCellularInexpensive5G]) {
    CFStringRef v32 = @"YES";
  }
  else {
    CFStringRef v32 = @"NO";
  }
  [v3 setObject:v32 forKeyedSubscript:@"IsCellularInexpensive5G"];
  id v33 = [(WiFiUserInteractionMonitor *)self overrideNetworkState];
  unint64_t v34 = [v33 description];
  [v3 setObject:v34 forKeyedSubscript:@"overrideNetworkState"];

  if ([(WiFiUserInteractionMonitor *)self isAskToJoinAllowed]) {
    CFStringRef v35 = @"YES";
  }
  else {
    CFStringRef v35 = @"NO";
  }
  [v3 setObject:v35 forKeyedSubscript:@"IsAskToJoinAllowed"];
  if ([(WiFiUserInteractionMonitor *)self isNetworkRecommendationAllowed]) {
    CFStringRef v36 = @"YES";
  }
  else {
    CFStringRef v36 = @"NO";
  }
  [v3 setObject:v36 forKeyedSubscript:@"IsNetworkRecommendationAllowed"];
  [(WiFiUserInteractionMonitor *)self cellularL3MBPS];
  v38 = +[NSString stringWithFormat:@"%.2fMBps/%llupps", v37, [(WiFiUserInteractionMonitor *)self cellularL3PPS]];
  [v3 setObject:v38 forKeyedSubscript:@"CellularUsage"];

  [(WiFiUserInteractionMonitor *)self wifiL3MBPS];
  uint64_t v40 = +[NSString stringWithFormat:@"%.2fMBps/%llupps", v39, [(WiFiUserInteractionMonitor *)self wifiL3PPS]];
  [v3 setObject:v40 forKeyedSubscript:@"WiFiUsage"];

  return v3;
}

- (NSString)description
{
  id v2 = [(WiFiUserInteractionMonitor *)self _stateInfo];
  unint64_t v3 = [v2 description];

  return (NSString *)v3;
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  id v11 = a3;
  if ((a4 == 2) != [(WiFiUserInteractionMonitor *)self navigating])
  {
    if (a4 == 2) {
      unsigned int v7 = 0;
    }
    else {
      unsigned int v7 = [(WiFiUserInteractionMonitor *)self navigating];
    }
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: navigating %d" : @"-[WiFiUserInteractionMonitor navigationListener:didChangeNavigationState:transportType:]" : a4 == 2];
    }
    [(WiFiUserInteractionMonitor *)self setNavigating:a4 == 2];
    if (v7)
    {
      if ([(WiFiUserInteractionMonitor *)self overrideApplicationState])
      {
        unint64_t v9 = [(WiFiUserInteractionMonitor *)self overrideApplicationState];
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: using overridden application state as %llu to notify captive", "-[WiFiUserInteractionMonitor navigationListener:didChangeNavigationState:transportType:]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))];
        }
      }
      else
      {
        unint64_t v9 = [(WiFiUserInteractionMonitor *)self _applicationNotifyState];
      }
      [(WiFiUserInteractionMonitor *)self _notifyCaptiveWithApplicationState:v9];
    }
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (void)setIsAirplayActiveOverInfra:(BOOL)a3
{
  self->_isAirplayActiveOverInfra = a3;
}

- (unint64_t)symptomBackgroundFlowProperties
{
  return self->_symptomBackgroundFlowProperties;
}

- (unsigned)symptomBackgroundFlowClassification
{
  return self->_symptomBackgroundFlowClassification;
}

- (GEONavigationListener)navigationListener
{
  return self->_navigationListener;
}

- (void)setNavigationListener:(id)a3
{
}

- (void)setIsDisplayOn:(BOOL)a3
{
  self->_isDisplayOn = a3;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void)setNavigating:(BOOL)a3
{
  self->_navigating = a3;
}

- (unsigned)managedEventNotifyPort
{
  return self->_managedEventNotifyPort;
}

- (void)setManagedEventNotifyPort:(unsigned int)a3
{
  self->_managedEventNotifyPort = a3;
}

- (int)managedEventNotifyToken
{
  return self->_managedEventNotifyToken;
}

- (void)setManagedEventNotifyToken:(int)a3
{
  self->_managedEventNotifyToken = a3;
}

- (OS_dispatch_mach)managedEventDispatchPort
{
  return self->_managedEventDispatchPort;
}

- (void)setManagedEventDispatchPort:(id)a3
{
}

- (NSDictionary)appAwareDetails
{
  return self->_appAwareDetails;
}

- (void)setRtTrafficAgent:(id)a3
{
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (void)setAnyCallInProgress:(BOOL)a3
{
  self->_anyCallInProgress = a3;
}

- (void)setWifiCallInProgress:(BOOL)a3
{
  self->_wifiCallInProgress = a3;
}

- (BOOL)callHostedOnThisDevice
{
  return self->_callHostedOnThisDevice;
}

- (void)setCallHostedOnThisDevice:(BOOL)a3
{
  self->_callHostedOnThisDevice = a3;
}

- (void)setRunningForegroundApps:(id)a3
{
}

- (void)setRunningNetworkingApps:(id)a3
{
}

- (BOOL)initialSetupCompleted
{
  return self->_initialSetupCompleted;
}

- (void)setInitialSetupCompleted:(BOOL)a3
{
  self->_initialSetupCompleted = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void)setClients:(id)a3
{
}

- (void)setMonitoredInterfaceNames:(id)a3
{
}

- (NSMutableDictionary)overrideNetworkState
{
  return self->_overrideNetworkState;
}

- (void)setOverrideNetworkState:(id)a3
{
}

- (void)setCellularL3PPS:(unint64_t)a3
{
  self->_cellularL3PPS = a3;
}

- (void)setCellularL3MBPS:(double)a3
{
  self->_cellularL3MBPS = a3;
}

- (unint64_t)wifiL3PPS
{
  return self->_wifiL3PPS;
}

- (double)wifiL3MBPS
{
  return self->_wifiL3MBPS;
}

- (void)setIsFirstUserUnlocked:(BOOL)a3
{
  self->_isFirstUserUnlocked = a3;
}

- (void)setAppAttributes:(id)a3
{
}

- (int)gameNotifyToken
{
  return self->_gameNotifyToken;
}

- (void)setGameNotifyToken:(int)a3
{
  self->_gameNotifyToken = a3;
}

- (BOOL)carModeActive
{
  return self->_carModeActive;
}

- (void)setCarModeActive:(BOOL)a3
{
  self->_carModeActive = a3;
}

- (BOOL)isInGameMode
{
  return self->_isInGameMode;
}

- (void)setIsInGameMode:(BOOL)a3
{
  self->_isInGameMode = a3;
}

- (void)setCellularInterfaceName:(id)a3
{
}

- (void)setCellularDataStatusMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularDataStatusMap, 0);
  objc_storeStrong((id *)&self->_cellularInterfaceName, 0);
  objc_storeStrong((id *)&self->_appAttributes, 0);
  objc_storeStrong((id *)&self->_overrideNetworkState, 0);
  objc_storeStrong((id *)&self->_periodicTasksLastRanAt, 0);
  objc_storeStrong((id *)&self->_monitoredInterfaceNames, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_runningNetworkingApps, 0);
  objc_storeStrong((id *)&self->_runningForegroundApps, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_rtTrafficAgent, 0);
  objc_storeStrong((id *)&self->_appAwareDetails, 0);
  objc_storeStrong((id *)&self->_managedEventDispatchPort, 0);

  objc_storeStrong((id *)&self->_navigationListener, 0);
}

@end