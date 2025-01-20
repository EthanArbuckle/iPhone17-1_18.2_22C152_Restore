@interface ActivityManagerDebuggingManager
+ (id)actionStrs:(int64_t)a3 maximumInternal:(double)a4 clear:(BOOL)a5;
+ (void)appendRecentAction:(id)a3;
+ (void)log:(int)a3 format:(id)a4;
+ (void)log:(int)a3 format:(id)a4 args:(char *)a5;
- (ActivityManagerDebuggingManager)initWithManager:(id)a3;
- (BOOL)disableAdminEntitlmentChecking;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)supportNetworkPeers;
- (NSXPCListener)listener;
- (SharingBTLESuggestedItem)fakeBTLEInjectedItem;
- (UAActivityReplay)replayManager;
- (UACornerActionManager)manager;
- (UANetworkReplayRendevousHandler)networkConnectionHandler;
- (UAPingController)pingController;
- (double)currentPerfTime;
- (id)perfSummaryString;
- (timeval)ignoredRTimeVal;
- (unint64_t)recentActionsStateHandler;
- (void)doCopyAdvertisedUUIDWithCompletionHandler:(id)a3;
- (void)doCopyAllUUIDsOfType:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)doCopyDebuggingInfo:(id)a3 completionHandler:(id)a4;
- (void)doCopyDefaults:(BOOL)a3 completionHandler:(id)a4;
- (void)doCopyDynamicUserActivitiesString:(id)a3 completionHandler:(id)a4;
- (void)doCopyEnabledUUIDsWithCompletionHandler:(id)a3;
- (void)doCopyRecentActions:(id)a3 completionHandler:(id)a4;
- (void)doCopySimulatorStatusString:(id)a3 completionHandler:(id)a4;
- (void)doCopyStatusString:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doDidSaveDelegate:(id)a3 completionHandler:(id)a4;
- (void)doFetchMoreAppSuggestions;
- (void)doFindMatchingUserActivityForString:(id)a3 withCompletionHandler:(id)a4;
- (void)doGetCurrentAdvertisedItemUUID:(id)a3;
- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doGetPairedDevices:(id)a3 completionHandler:(id)a4;
- (void)doGetSFActivityAdvertisement:(id)a3 completionHandler:(id)a4;
- (void)doGetSysdiagnoseStringsIncludingPrivateData:(BOOL)a3 completionHandler:(id)a4;
- (void)doInjectBTLEItem:(id)a3 type:(unint64_t)a4 identifier:(id)a5 title:(id)a6 activityPayload:(id)a7 webPageURL:(id)a8 remoteModel:(id)a9 duration:(double)a10 payloadDelay:(double)a11;
- (void)doNOP:(id)a3 withCompletionHandler:(id)a4;
- (void)doReplayCommands:(id)a3 completionHandler:(id)a4;
- (void)doSetDebugOption:(id)a3 value:(id)a4;
- (void)doSetDefaults:(id)a3 archivedValue:(id)a4;
- (void)doSetLocalPasteboardReflection:(BOOL)a3;
- (void)doSetRemotePasteboardAvailable:(BOOL)a3;
- (void)doSetupNetworkedPairs:(id)a3 port:(int64_t)a4;
- (void)doSetupRendevous:(id)a3 domain:(id)a4 activate:(BOOL)a5;
- (void)doTerminateServer;
- (void)doWillSaveDelegate:(id)a3 completionHandler:(id)a4;
- (void)receivePing:(id)a3;
- (void)resume;
- (void)setDebugging:(BOOL)a3;
- (void)setDisableAdminEntitlmentChecking:(BOOL)a3;
- (void)setFakeBTLEInjectedItem:(id)a3;
- (void)setListener:(id)a3;
- (void)setManager:(id)a3;
- (void)setNetworkConnectionHandler:(id)a3;
- (void)setPingController:(id)a3;
- (void)setRecentActionsStateHandler:(unint64_t)a3;
- (void)setReplayManager:(id)a3;
- (void)setSupportNetworkPeers:(BOOL)a3;
- (void)startAdvertisingPingWithTimeInterval:(double)a3;
- (void)stopAdvertisingPing;
- (void)suspend;
@end

@implementation ActivityManagerDebuggingManager

+ (void)appendRecentAction:(id)a3
{
  id v5 = a3;
  sub_10000E878();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if ((char *)[v3 count] - 49 <= (char *)0xFFFFFFFFFFFFFFCDLL) {
    objc_msgSend(v3, "removeObjectsInRange:", 0, (char *)objc_msgSend(v3, "count") - 49);
  }
  v4 = [[ActivityManagerDebugRecentActionItem alloc] initWithString:v5];
  [v3 addObject:v4];

  objc_sync_exit(v3);
}

+ (void)log:(int)a3 format:(id)a4 args:(char *)a5
{
  id v7 = a4;
  if (v7 && a5)
  {
    id v9 = v7;
    id v8 = [objc_alloc((Class)NSString) initWithFormat:v7 arguments:a5];
    syslog(a3, "%s", (const char *)[v8 UTF8String]);

    id v7 = v9;
  }
}

+ (void)log:(int)a3 format:(id)a4
{
  [a1 log:*(void *)&a3 format:a4 args:&v4];
}

- (ActivityManagerDebuggingManager)initWithManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ActivityManagerDebuggingManager;
  v6 = [(ActivityManagerDebuggingManager *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->manager, a3);
    id v8 = objc_alloc((Class)NSXPCListener);
    id v9 = UAResumableActivitiesManagerServiceName();
    v10 = (NSXPCListener *)[v8 initWithMachServiceName:v9];
    listener = v7->listener;
    v7->listener = v10;

    [(NSXPCListener *)v7->listener setDelegate:v7];
    v12 = +[NSString stringWithFormat:@"STARTING pid=%d", getpid()];
    +[ActivityManagerDebuggingManager appendRecentAction:v12];

    v13 = dispatch_get_global_queue(0, 0);
    [(ActivityManagerDebuggingManager *)v7 setRecentActionsStateHandler:os_state_add_handler()];
  }
  return v7;
}

- (void)suspend
{
  [(NSXPCListener *)self->listener suspend];
  id v3 = [(ActivityManagerDebuggingManager *)self networkConnectionHandler];
  [v3 suspend];
}

- (void)resume
{
  [(NSXPCListener *)self->listener resume];
  id v3 = [(ActivityManagerDebuggingManager *)self networkConnectionHandler];
  [v3 resume];
}

- (void)setDebugging:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  -[ActivityManagerDebuggingManager doSetDebugOption:value:](self, "doSetDebugOption:value:", @"EnableLogging");
}

+ (id)actionStrs:(int64_t)a3 maximumInternal:(double)a4 clear:(BOOL)a5
{
  BOOL v5 = a5;
  v28 = +[NSMutableArray array];
  id v8 = sub_10000E878();
  id v9 = +[NSDate date];
  id v10 = v8;
  objc_sync_enter(v10);
  id v11 = [v10 copy];
  if (v5) {
    [v10 removeAllObjects];
  }
  objc_sync_exit(v10);
  v27 = v10;

  id v12 = objc_alloc_init((Class)NSDateFormatter);
  id v13 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [v12 setLocale:v13];

  [v12 setDateFormat:@"HH:MM:ss.SSSS"];
  if (!a3) {
    a3 = (int64_t)[v11 count];
  }
  if (a4 == 0.0) {
    double v14 = 3.40282347e38;
  }
  else {
    double v14 = a4;
  }
  uint64_t v15 = (uint64_t)[v11 count] - a3;
  for (unint64_t i = v15 & ~(v15 >> 63); i < (unint64_t)[v11 count]; ++i)
  {
    v17 = [v11 objectAtIndex:i];
    v18 = [v17 when];
    [v18 timeIntervalSinceDate:v9];
    double v20 = v19;

    if (v20 <= v14)
    {
      v21 = [v17 when];
      v22 = [v12 stringFromDate:v21];
      v23 = [v17 str];
      v24 = +[NSString stringWithFormat:@"%@ %@", v22, v23];
      [v28 addObject:v24];
    }
  }
  id v25 = [v28 copy];

  return v25;
}

- (BOOL)supportNetworkPeers
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL supportNetworkPeers = v2->_supportNetworkPeers;
  objc_sync_exit(v2);

  return supportNetworkPeers;
}

- (void)setSupportNetworkPeers:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  if (obj->_supportNetworkPeers != v3)
  {
    obj->_BOOL supportNetworkPeers = v3;
    if (v3)
    {
      BOOL v5 = [UANetworkReplayRendevousHandler alloc];
      v6 = [(ActivityManagerDebuggingManager *)obj manager];
      id v7 = [(UANetworkReplayRendevousHandler *)v5 initWithManager:v6];
      [(ActivityManagerDebuggingManager *)obj setNetworkConnectionHandler:v7];

      id v8 = [(ActivityManagerDebuggingManager *)obj manager];
      id v9 = [(ActivityManagerDebuggingManager *)obj networkConnectionHandler];
      [v8 addHandler:v9];

      id v10 = +[UAUserActivityDefaults sharedDefaults];
      id v11 = [v10 rendevousPairingType];

      id v12 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v13 = [v12 enableNetworkControlListener];

      if (v13)
      {
        double v14 = +[UAUserActivityDefaults sharedDefaults];
        id v15 = [v14 networkControlListenerPort];

        v16 = [(ActivityManagerDebuggingManager *)obj networkConnectionHandler];
        [v16 listenForIncomingConnections:0 port:v15 type:v11];
      }
      v17 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v18 = [v17 enableAutomaticRendevousPairing];

      if (v18)
      {
        double v19 = [(ActivityManagerDebuggingManager *)obj networkConnectionHandler];
        [v19 scanForPeersOfType:0 domain:0];
      }
      else
      {
        if (!v11)
        {
LABEL_12:

          id v4 = obj;
          goto LABEL_13;
        }
        double v19 = [(ActivityManagerDebuggingManager *)obj networkConnectionHandler];
        [v19 scanForPeersOfType:v11 domain:0];
      }

      goto LABEL_12;
    }
    double v20 = [(ActivityManagerDebuggingManager *)obj networkConnectionHandler];

    id v4 = obj;
    if (v20)
    {
      v21 = [(ActivityManagerDebuggingManager *)obj manager];
      v22 = [(ActivityManagerDebuggingManager *)obj networkConnectionHandler];
      [v21 removeHandler:v22];

      v23 = [(ActivityManagerDebuggingManager *)obj networkConnectionHandler];
      [v23 suspend];

      [(ActivityManagerDebuggingManager *)obj setNetworkConnectionHandler:0];
      id v4 = obj;
    }
  }
LABEL_13:
  objc_sync_exit(v4);
}

- (id)perfSummaryString
{
  if (getrusage(0, &v4))
  {
    v2 = 0;
  }
  else
  {
    v2 = +[NSString stringWithFormat:@"(user=%.5gs/system=%.5gs)", (double)v4.ru_utime.tv_usec / 1000000.0 + (double)v4.ru_utime.tv_sec, (double)v4.ru_stime.tv_usec / 1000000.0 + (double)v4.ru_stime.tv_sec];
  }

  return v2;
}

- (double)currentPerfTime
{
  int v2 = getrusage(0, &v4);
  double result = 0.0;
  if (!v2) {
    return (double)v4.ru_utime.tv_usec / 1000000.0 + (double)v4.ru_utime.tv_sec;
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.coreservices.lsuseractivityd.admininterface"];
  if ([v6 BOOLValue]) {
    goto LABEL_9;
  }
  id v7 = [v5 valueForEntitlement:@"application-identifier"];
  if (([v7 isEqual:@"com.apple.Preferences"] & 1) != 0
    || ![v5 effectiveUserIdentifier])
  {

LABEL_9:
    goto LABEL_10;
  }
  unsigned __int8 v8 = [(ActivityManagerDebuggingManager *)self disableAdminEntitlmentChecking];

  if (v8)
  {
LABEL_10:
    id v12 = _LSGetResumableActivitiesAdministrativeProtocolInterface();
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&stru_1000C62A0];
    [v5 setInvalidationHandler:&stru_1000C62C0];
    goto LABEL_11;
  }
  id v9 = [v5 valueForEntitlement:@"com.apple.private.useractivity.sysdiagnose"];
  if ([v9 BOOLValue])
  {
    unsigned int v10 = [v5 effectiveUserIdentifier];

    if (!v10)
    {
      id v11 = _LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface();
      [v5 setExportedInterface:v11];

      [v5 setExportedObject:self];
LABEL_11:
      [v5 resume];
      BOOL v13 = 1;
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v15 = sub_10000BA18(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = [UAAuditToken alloc];
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    v17 = [(UAAuditToken *)v16 initWithAuditToken:v18];
    *(_DWORD *)buf = 138543618;
    double v20 = v17;
    __int16 v21 = 2114;
    CFStringRef v22 = @"com.apple.private.coreservices.lsuseractivityd.admininterface";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "*** Attempt to access adminstrative interface fror process pid=%{public}@, which doesn't have the %{public}@ entitlement.", buf, 0x16u);
  }
  [v5 invalidate];
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (void)receivePing:(id)a3
{
  id v3 = a3;
  rusage v4 = sub_10000BA18(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138477827;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "*** SENDING PING %{private}@ to clients.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)doNOP:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  unsigned __int8 v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138477827;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "- doNOP, str=%{private}@, so echoing that back to client.", (uint8_t *)&v9, 0xCu);
  }

  v6[2](v6, v5, 0);
}

- (void)doSetDebugOption:(id)a3 value:(id)a4
{
  v40 = (__CFString *)a3;
  id v39 = a4;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v74 = v40;
    __int16 v75 = 2114;
    id v76 = v39;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "### DEBUGGING: doSetDebugOption:%{public}@ => %{public}@", buf, 0x16u);
  }

  if (![(__CFString *)v40 isEqual:@"EnableDebugging"])
  {
    if ([(__CFString *)v40 isEqual:@"sharing"])
    {
      unsigned int v7 = [v39 BOOLValue];
      id obj = +[UAUserActivityDefaults sharedDefaults];
      if (v7 != [obj enableSharingFramework] && objc_opt_class())
      {
        BOOL v8 = objc_opt_class() == 0;

        if (v8) {
          goto LABEL_70;
        }
        unsigned int v52 = [v39 BOOLValue];
        int v9 = sub_10000BA18(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v10 = @"OFF";
          if (v52) {
            CFStringRef v10 = @"ON";
          }
          *(_DWORD *)buf = 138543362;
          CFStringRef v74 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### DEBUGGING: Changing EnableSharingFramework to %{public}@", buf, 0xCu);
        }

        id v11 = +[UAUserActivityDefaults sharedDefaults];
        [v11 setEnableSharingFramework:v52];

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v12 = [(ActivityManagerDebuggingManager *)self manager];
        id obja = [v12 advertisers];

        id v48 = [obja countByEnumeratingWithState:&v65 objects:v72 count:16];
        if (v48)
        {
          uint64_t v46 = *(void *)v66;
          do
          {
            for (unint64_t i = 0; i != v48; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v66 != v46) {
                objc_enumerationMutation(obja);
              }
              BOOL v13 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = v13;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                id v15 = [v14 sfActivityAdvertisers];
                id v16 = [v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
                char v17 = v52;
                if (v16)
                {
                  uint64_t v18 = *(void *)v62;
                  char v17 = v52;
                  do
                  {
                    for (j = 0; j != v16; j = (char *)j + 1)
                    {
                      if (*(void *)v62 != v18) {
                        objc_enumerationMutation(v15);
                      }
                      uint64_t v20 = *(void *)(*((void *)&v61 + 1) + 8 * (void)j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        __int16 v21 = sub_10000BA18(0);
                        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "### Removing SFActivityAdvertiser from UASharingAdvertiser", buf, 2u);
                        }

                        [v14 removeSFActivityAdvertiser:v20];
                        v17 &= v52 ^ 1;
                      }
                    }
                    id v16 = [v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
                  }
                  while (v16);
                }

                if (v17)
                {
                  CFStringRef v22 = +[SFActivityAdvertiser sharedAdvertiser];
                  v23 = sub_10000BA18(0);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "### Adding SFActivityAdvertiser to UASharingAdvertiser.", buf, 2u);
                  }

                  [v14 addSFActivityAdvertiser:v22];
                }
              }
            }
            id v48 = [obja countByEnumeratingWithState:&v65 objects:v72 count:16];
          }
          while (v48);
        }

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v24 = [(ActivityManagerDebuggingManager *)self manager];
        id obj = [v24 receivers];

        id v25 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
        if (v25)
        {
          uint64_t v47 = *(void *)v58;
          id v49 = v25;
          do
          {
            for (k = 0; k != v49; k = (char *)k + 1)
            {
              if (*(void *)v58 != v47) {
                objc_enumerationMutation(obj);
              }
              v26 = *(void **)(*((void *)&v57 + 1) + 8 * (void)k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v27 = v26;
                long long v53 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                v28 = [v27 sfActivityScanners];
                id v29 = [v28 countByEnumeratingWithState:&v53 objects:v69 count:16];
                char v30 = v52;
                if (v29)
                {
                  uint64_t v31 = *(void *)v54;
                  char v30 = v52;
                  do
                  {
                    for (m = 0; m != v29; m = (char *)m + 1)
                    {
                      if (*(void *)v54 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * (void)m);
                      objc_opt_class();
                      int v34 = objc_opt_isKindOfClass() ^ 1;
                      if ((v34 | v52))
                      {
                        v30 &= v34;
                      }
                      else
                      {
                        v35 = sub_10000BA18(0);
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "### Removing SFActivityScanner from UASharingReceiver.", buf, 2u);
                        }

                        [v27 removeSFActivityScanner:v33];
                      }
                    }
                    id v29 = [v28 countByEnumeratingWithState:&v53 objects:v69 count:16];
                  }
                  while (v29);
                }

                if (v30)
                {
                  id v36 = [objc_alloc((Class)SFActivityScanner) initWithDelegate:v27];
                  v37 = sub_10000BA18(0);
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "### Adding SFActivityScanner to UASharingReceiver.", buf, 2u);
                  }

                  [v27 addSFActivityScanner:v36];
                }
              }
            }
            id v49 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
          }
          while (v49);
        }
      }
    }
    else
    {
      if ([(__CFString *)v40 isEqual:@"screensaver"])
      {
        id objc = [(ActivityManagerDebuggingManager *)self manager];
        objc_msgSend(objc, "updateScreenSaverActive:", objc_msgSend(v39, "BOOLValue"));

        goto LABEL_70;
      }
      if ([(__CFString *)v40 isEqual:@"screendim"])
      {
        id objd = [(ActivityManagerDebuggingManager *)self manager];
        objc_msgSend(objd, "updateScreenDimStateState:", objc_msgSend(v39, "BOOLValue"));

        goto LABEL_70;
      }
      if (![(__CFString *)v40 isEqual:@"useractive"]) {
        goto LABEL_70;
      }
      id obj = [(ActivityManagerDebuggingManager *)self manager];
      objc_msgSend(obj, "updateUserActiveState:", objc_msgSend(v39, "BOOLValue"));
    }

    goto LABEL_70;
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setObject:v39 forKey:v40];

  id objb = +[NSUserDefaults standardUserDefaults];
  [objb synchronize];

LABEL_70:
}

- (void)doFindMatchingUserActivityForString:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  long long v53 = (void (**)(id, void *))a4;
  unsigned int v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v77 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "str=%{private}@", buf, 0xCu);
  }

  long long v60 = +[NSMutableSet set];
  id v49 = [(UACornerActionManager *)self->manager advertiseableItems];
  v50 = [(UACornerActionManager *)self->manager cornerActionItems];
  if (v6 && [v6 length])
  {
    if (![v60 count] && !objc_msgSend(v6, "compare:options:", @"best", 1))
    {
      BOOL v8 = [(ActivityManagerDebuggingManager *)self manager];
      int v9 = [v8 bestCornerItem];

      if (v9)
      {
        CFStringRef v10 = sub_10000BA18(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v11 = [v9 uuid];
          id v12 = [v11 UUIDString];
          *(_DWORD *)buf = 138543619;
          id v77 = v12;
          __int16 v78 = 2113;
          v79 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "-- Matching current best item %{public}@/%{private}@", buf, 0x16u);
        }
        [v60 addObject:v9];
      }
    }
    if (![v60 count])
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id obj = v50;
      id v13 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v13)
      {
        id v57 = *(id *)v70;
        do
        {
          for (unint64_t i = 0; i != v13; unint64_t i = (char *)i + 1)
          {
            if (*(id *)v70 != v57) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            if ([v6 containsString:@"."])
            {
              id v16 = [v15 activityType];
              BOOL v17 = [v16 compare:v6 options:1] == 0;

              if (v17) {
                [v60 addObject:v15];
              }
            }
            uint64_t v18 = sub_10000F6D0(v6);
            if (v18)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v19 = v15;
                uint64_t v20 = [v19 advertisementPayload];
                __int16 v21 = [v20 payloadBytes];
                unsigned int v22 = [v18 isEqual:v21];

                if (v22) {
                  [v60 addObject:v19];
                }
              }
            }
            if ([v6 containsString:@"."])
            {
              v23 = [v15 bundleIdentifier];
              BOOL v24 = [v23 compare:v6 options:1] == 0;

              if (v24) {
                [v60 addObject:v15];
              }
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
        }
        while (v13);
      }
    }
    if (![v60 count])
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v54 = v49;
      id v25 = [v54 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (!v25) {
        goto LABEL_56;
      }
      id obja = *(id *)v66;
      while (1)
      {
        id v58 = v25;
        for (j = 0; j != v58; j = (char *)j + 1)
        {
          if (*(id *)v66 != obja) {
            objc_enumerationMutation(v54);
          }
          id v27 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
          v28 = [v27 uuid];
          id v29 = [v28 UUIDString];
          if ([v29 hasPrefix:v6]) {
            goto LABEL_47;
          }
          char v30 = [v27 uuid];
          uint64_t v31 = [v30 UUIDString];
          if ([v31 hasSuffix:v6]) {
            goto LABEL_46;
          }
          v32 = [v27 title];
          if ([v32 isEqualToString:v6]) {
            goto LABEL_45;
          }
          uint64_t v33 = [v27 title];
          if ([v33 hasPrefix:v6]) {
            goto LABEL_44;
          }
          int v34 = [v27 title];
          if ([v34 hasSuffix:v6])
          {

LABEL_44:
LABEL_45:

LABEL_46:
LABEL_47:

LABEL_48:
            [v60 addObject:v27];
            continue;
          }
          if ([v6 containsString:@"."])
          {
            unsigned int v52 = [v27 activityType];
            BOOL v51 = [v52 compare:v6 options:1] == 0;

            if (v51) {
              goto LABEL_48;
            }
          }
          else
          {
          }
        }
        id v25 = [v54 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (!v25)
        {
LABEL_56:

          break;
        }
      }
    }
    if ([v60 count]) {
      goto LABEL_71;
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v59 = v50;
    id v35 = [v59 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (!v35) {
      goto LABEL_70;
    }
    uint64_t v36 = *(void *)v62;
LABEL_60:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v62 != v36) {
        objc_enumerationMutation(v59);
      }
      v38 = *(void **)(*((void *)&v61 + 1) + 8 * v37);
      id v39 = [v38 uuid];
      v40 = [v39 UUIDString];
      if ([v40 hasPrefix:v6])
      {
      }
      else
      {
        v41 = [v38 uuid];
        v42 = [v41 UUIDString];
        unsigned __int8 v43 = [v42 hasSuffix:v6];

        if ((v43 & 1) == 0)
        {
          v44 = [v38 bundleIdentifier];
          BOOL v45 = [v44 compare:v6 options:1] == 0;

          if (!v45) {
            goto LABEL_68;
          }
        }
      }
      [v60 addObject:v38];
LABEL_68:
      if (v35 == (id)++v37)
      {
        id v35 = [v59 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (!v35)
        {
LABEL_70:

          break;
        }
        goto LABEL_60;
      }
    }
  }
LABEL_71:
  if ([v60 count] == (id)1)
  {
    uint64_t v46 = [v60 anyObject];
    uint64_t v47 = [v46 uuid];
  }
  else
  {
    uint64_t v47 = 0;
  }
  if (v53) {
    v53[2](v53, v47);
  }
}

- (void)doCopyAllUUIDsOfType:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  BOOL v8 = +[NSMutableArray array];
  int v9 = [(UACornerActionManager *)self->manager advertiseableItems];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100078D6C;
  id v15 = &unk_1000C62E8;
  unint64_t v17 = a3;
  id v10 = v8;
  id v16 = v10;
  [v9 enumerateObjectsUsingBlock:&v12];
  id v11 = objc_msgSend(v10, "copy", v12, v13, v14, v15);
  v6[2](v6, v11);
}

- (void)doCopyAdvertisedUUIDWithCompletionHandler:(id)a3
{
  int v9 = (void (**)(id, void *))a3;
  if ([(UACornerActionManager *)self->manager weAreAdvertisingAnItem])
  {
    id v5 = [(UACornerActionManager *)self->manager uaAdvertisableItemsInOrder];
    id v6 = [v5 firstObject];

    if (v6)
    {
      unsigned int v7 = [v6 uuid];
      char v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = 0;
  }
  unsigned int v7 = 0;
  char v8 = 1;
LABEL_6:
  v9[2](v9, v7);
  if ((v8 & 1) == 0) {
}
  }

- (void)doCopyEnabledUUIDsWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  id v5 = [(UACornerActionManager *)self->manager activeAdvertiseableItemsUUIDs];
  v6[2](v6, v5);
}

- (void)doCopyDebuggingInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v5 = [(UACornerActionManager *)self->manager debuggingInfo];
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)doCopyDynamicUserActivitiesString:(id)a3 completionHandler:(id)a4
{
  unsigned int v7 = (void (**)(id, void *))a4;
  id v6 = [(UACornerActionManager *)self->manager dynamicUserActivitiesString];
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)doCopyStatusString:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, const __CFString *))a5;
  if (v10)
  {
    if (v8 && ![v8 isEqual:@"status"])
    {
      if ([v8 isEqual:@"simulatorStatus"])
      {
        v10[2](v10, @"This platform does not support the iOS simulator.");
        goto LABEL_6;
      }
      if (![v8 isEqual:@"recentEligible"])
      {
        id v15 = +[NSString stringWithFormat:@"Command %@ not recognized", v8];
        v10[2](v10, v15);

        goto LABEL_6;
      }
      id v14 = [(UACornerActionManager *)self->manager mainDispatchQ];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000793A0;
      v16[3] = &unk_1000C6338;
      v16[4] = self;
      unint64_t v17 = v10;
      dispatch_sync(v14, v16);

      uint64_t v13 = v17;
    }
    else
    {
      id v12 = [(UACornerActionManager *)self->manager mainDispatchQ];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007932C;
      block[3] = &unk_1000C6310;
      block[4] = self;
      id v19 = v10;
      dispatch_sync(v12, block);

      uint64_t v13 = v19;
    }

LABEL_6:
  }
}

- (void)doFetchMoreAppSuggestions
{
}

- (void)doCopyRecentActions:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    unsigned int v7 = objc_opt_class();
    id v8 = [v10 objectForKey:@"clear"];
    id v9 = objc_msgSend(v7, "actionStrs:maximumInternal:clear:", 50, objc_msgSend(v8, "BOOLValue"), 300.0);
    v5[2](v5, v9);
  }
}

- (void)doCopySimulatorStatusString:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v5 = +[NSMutableString string];
  [v5 appendString:@"This platform does not support the iOS simulator."];
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)doGetCurrentAdvertisedItemUUID:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  id v5 = [(UACornerActionManager *)self->manager uaAdvertisableItemsInOrder];
  id v6 = [v5 firstObject];
  unsigned int v7 = [v6 uuid];

  v8[2](v8, v7);
}

- (void)doInjectBTLEItem:(id)a3 type:(unint64_t)a4 identifier:(id)a5 title:(id)a6 activityPayload:(id)a7 webPageURL:(id)a8 remoteModel:(id)a9 duration:(double)a10 payloadDelay:(double)a11
{
  id v49 = a3;
  id v19 = a5;
  id v47 = a6;
  id v48 = a7;
  id v45 = a8;
  id v46 = a9;
  if (self->fakeBTLEInjectedItem)
  {
    uint64_t v20 = sub_10000BA18(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem uuid];
      *(_DWORD *)buf = 138412290;
      id v57 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Removing previous injected fake BTLE item %@", buf, 0xCu);
    }
    [(UACornerActionManager *)self->manager setDebugCornerItem:0];
    fakeBTLEInjectedItem = self->fakeBTLEInjectedItem;
    self->fakeBTLEInjectedItem = 0;
  }
  if (v49 && v19)
  {
    v23 = [[SharingBTLESuggestedItem alloc] initWithUUID:v49 type:a4 options:0];
    BOOL v24 = self->fakeBTLEInjectedItem;
    self->fakeBTLEInjectedItem = v23;

    id v25 = +[LSApplicationWorkspace defaultWorkspace];
    v26 = [v25 applicationForUserActivityType:v19];
    id v27 = [v26 bundleIdentifier];
    unsigned __int8 v28 = [v25 applicationIsInstalled:v27];

    if (v28)
    {
      if (v26) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    if ((objc_msgSend(v19, "containsString:", @":", context) & 1) == 0)
    {
      id v29 = [@":" stringByAppendingString:v19];
      v26 = [v25 applicationForUserActivityType:v29];

      if (v26) {
        goto LABEL_26;
      }
    }
    if (([v19 containsString:@":"] & 1) == 0)
    {
      char v30 = [v19 lowercaseString];
      if ([v25 applicationIsInstalled:v30])
      {
        v26 = +[LSApplicationProxy applicationProxyForIdentifier:v30];

        if (v26) {
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    if ([v19 containsString:@":"])
    {
      uint64_t v31 = [v19 componentsSeparatedByString:@":"];
      v32 = [v31 lastObject];
      uint64_t v33 = [v32 lowercaseString];

      if ([v25 applicationIsInstalled:v33])
      {
        int v34 = [v33 lowercaseString];
        v26 = +[LSApplicationProxy applicationProxyForIdentifier:v34];
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
LABEL_26:
    id v35 = objc_msgSend(v26, "bundleIdentifier", context);
    [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem setBundleIdentifier:v35];

    [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem setActivityType:v19];
    uint64_t v36 = +[SFPeerDevice testPeerForModel:v46];
    [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem setPeerDevice:v36];
    [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem setPayloadRequested:1];
    [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem setPayloadAvailabilityDelay:a11];
    uint64_t v37 = sub_10000BA18(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem activityType];
      id v39 = [(SharingBTLESuggestedItem *)self->fakeBTLEInjectedItem uuid];
      v40 = [v39 UUIDString];
      v41 = sub_100003070(v48);
      *(_DWORD *)buf = 138478595;
      id v57 = v38;
      __int16 v58 = 2113;
      id v59 = v47;
      __int16 v60 = 2113;
      long long v61 = v40;
      __int16 v62 = 2113;
      long long v63 = v41;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Injecting fake BTLE item, %{private}@ \"%{private}@\" %{private}@ payload=%{private}@", buf, 0x2Au);
    }
    dispatch_time_t v42 = dispatch_time(0, (uint64_t)(a11 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007A0D4;
    block[3] = &unk_1000C5880;
    block[4] = self;
    id v53 = v47;
    id v54 = v48;
    id v55 = v45;
    dispatch_after(v42, (dispatch_queue_t)&_dispatch_main_q, block);
    [(UACornerActionManager *)self->manager setDebugCornerItem:self->fakeBTLEInjectedItem];
    dispatch_time_t v43 = dispatch_time(0, (uint64_t)(a10 * 1000000000.0));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10007A190;
    v50[3] = &unk_1000C4DD0;
    v50[4] = self;
    id v51 = v49;
    dispatch_after(v43, (dispatch_queue_t)&_dispatch_main_q, v50);

    goto LABEL_29;
  }
  id v25 = sub_10000BA18(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Injecting nil BTLE item, so removing last item", buf, 2u);
  }
LABEL_29:
}

- (void)doTerminateServer
{
  [(UACornerActionManager *)self->manager terminate];
}

- (void)doWillSaveDelegate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [(UACornerActionManager *)self->manager clients];
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [v13 userActivityClientForUUID:v6];
          id v15 = sub_10000BA18(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = [v6 UUIDString];
            *(_DWORD *)buf = 138543362;
            id v25 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "About to call prepareToResumeActivityWithUUID for activityUUID %{public}@", buf, 0xCu);
          }
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10007A5BC;
          v17[3] = &unk_1000C4DA8;
          id v18 = v6;
          id v19 = v7;
          [v14 askSourceProcessToUpdateActivityWithUUID:v18 evenIfClean:1 completionHandler:v17];

          goto LABEL_13;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)doDidSaveDelegate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v17 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(UACornerActionManager *)self->manager clients];
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v11 userActivityClientForUUID:v6];
          uint64_t v13 = sub_10000BA18(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v14 = [v6 UUIDString];
            *(_DWORD *)buf = 138543362;
            v26 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "About to call didResumeUserActivityWithUUID for activityUUID %{public}@", buf, 0xCu);
          }
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          _OWORD v18[2] = sub_10007A9A0;
          v18[3] = &unk_1000C4DA8;
          id v15 = v6;
          id v19 = v15;
          id v20 = v17;
          [v12 didResumeUserActivityWithUUID:v15 completionHandler:v18];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)doSetupNetworkedPairs:(id)a3 port:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138478083;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Setting up network connection to other machine %{private}@ %ld", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [(ActivityManagerDebuggingManager *)self manager];
  +[UANetworkReplayController createConnection:v8 host:v6 port:a4];
}

- (void)doSetupRendevous:(id)a3 domain:(id)a4 activate:(BOOL)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = [(ActivityManagerDebuggingManager *)self networkConnectionHandler];
  [v8 scanForPeersOfType:v9 domain:v7];
}

- (void)startAdvertisingPingWithTimeInterval:(double)a3
{
  rusage v4 = [(ActivityManagerDebuggingManager *)self pingController];

  if (v4)
  {
    id v7 = [[UAPingUserActivityInfo alloc] initWithPayloadSize:128];
    id v5 = [(ActivityManagerDebuggingManager *)self pingController];
    id v6 = [v5 client];
    [v6 pushItem:v7];
  }
}

- (void)stopAdvertisingPing
{
  id v3 = [(ActivityManagerDebuggingManager *)self pingController];

  if (v3)
  {
    id v5 = [(ActivityManagerDebuggingManager *)self pingController];
    rusage v4 = [v5 client];
    [v4 removeItem:0];
  }
}

- (void)doGetSysdiagnoseStringsIncludingPrivateData:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = +[NSMutableArray array];
  [v6 addObjectsFromArray:&off_1000CCAD8];
  id v7 = [(ActivityManagerDebuggingManager *)self manager];
  id v8 = [v7 statusString];

  [v6 addObject:v8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [(ActivityManagerDebuggingManager *)self manager];
  id v10 = [v9 handlers];

  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v13) statusString];
        if (v14) {
          [v6 addObject:v14];
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  [v6 addObjectsFromArray:&off_1000CCAF0];
  +[ActivityManagerDebuggingManager actionStrs:100 maximumInternal:0 clear:86400.0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v15 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(v6, "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v18), (void)v19);
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v15 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  v5[2](v5, v6);
}

- (void)doReplayCommands:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(ActivityManagerDebuggingManager *)self replayManager];

  if (!v7)
  {
    id v8 = [UAActivityReplay alloc];
    id v9 = [(ActivityManagerDebuggingManager *)self manager];
    id v10 = [(UAActivityReplay *)v8 initWithManager:v9 name:@"ReplayManager"];
    [(ActivityManagerDebuggingManager *)self setReplayManager:v10];

    id v11 = [(ActivityManagerDebuggingManager *)self manager];
    uint64_t v12 = [(ActivityManagerDebuggingManager *)self replayManager];
    [v11 addHandler:v12];
  }
  if (v14 && [v14 count])
  {
    uint64_t v13 = [(ActivityManagerDebuggingManager *)self replayManager];
    [v13 processCommands:v14 completionHandler:v6];
  }
  else
  {
    [(ActivityManagerDebuggingManager *)self setReplayManager:0];
  }
}

- (void)doCopyDefaults:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v5 = +[UAUserActivityDefaults sharedDefaults];
  id v6 = [v5 defaults:v4];
  v7[2](v7, v6, 0);
}

- (void)doSetDefaults:(id)a3 archivedValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  id v7 = +[NSArray arrayWithObjects:v11 count:8];
  id v8 = +[NSSet setWithArray:v7];

  id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v6 error:0];

  if (v9)
  {
    id v10 = +[UAUserActivityDefaults sharedDefaults];
    [v10 setDefault:v5 value:v9];
  }
}

- (void)doSetRemotePasteboardAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ActivityManagerDebuggingManager *)self manager];
  BOOL v4 = [v5 pasteboardController];
  [v4 setRemotePasteboardAvalibility:v3 withDataRequester:0];
}

- (void)doSetLocalPasteboardReflection:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ActivityManagerDebuggingManager *)self manager];
  BOOL v4 = [v5 pasteboardController];
  [v4 setLocalPasteboardReflection:v3];
}

- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  if (v5)
  {
    id v7 = v5;
    id v6 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    v7[2](v7, 0, v6);

    id v5 = v7;
  }
}

- (void)doGetSFActivityAdvertisement:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void *, void *, void *, void))a4;
  id v6 = [(ActivityManagerDebuggingManager *)self manager];
  id v7 = [v6 advertisers];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      id v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v12;
          id v15 = objc_msgSend(v14, "currentAdvertisedBytes", (void)v19);
          id v16 = [v14 mostRecentAdvertisedBytesTime];
          uint64_t v17 = [v14 currentAdvertisedItem];
          id v18 = [v17 uuid];
          v5[2](v5, v15, v16, v18, 0);

          uint64_t v13 = v8;
          goto LABEL_11;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", UAContinuityErrorDomain, -129, 0, (void)v19);
  ((void (**)(id, void *, void *, void *, void *))v5)[2](v5, 0, 0, 0, v13);
LABEL_11:
}

- (void)doGetPairedDevices:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[NSMutableArray array];
  id v7 = [(ActivityManagerDebuggingManager *)self manager];
  id v8 = [v7 advertisers];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = objc_msgSend(v13, "pairedDevices", (void)v17);
          id v15 = [v14 allObjects];
          [v6 addObjectsFromArray:v15];
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  id v16 = sub_10000BA18(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    long long v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "doGetPairedDevices(%{public}@)", buf, 0xCu);
  }

  (*((void (**)(id, void *, void, void))v5 + 2))(v5, v6, 0, 0);
}

- (UACornerActionManager)manager
{
  return (UACornerActionManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManager:(id)a3
{
}

- (SharingBTLESuggestedItem)fakeBTLEInjectedItem
{
  return (SharingBTLESuggestedItem *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFakeBTLEInjectedItem:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 32, 1);
}

- (void)setListener:(id)a3
{
}

- (BOOL)disableAdminEntitlmentChecking
{
  return self->_disableAdminEntitlmentChecking;
}

- (void)setDisableAdminEntitlmentChecking:(BOOL)a3
{
  self->_disableAdminEntitlmentChecking = a3;
}

- (UAActivityReplay)replayManager
{
  return (UAActivityReplay *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReplayManager:(id)a3
{
}

- (UAPingController)pingController
{
  return (UAPingController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPingController:(id)a3
{
}

- (UANetworkReplayRendevousHandler)networkConnectionHandler
{
  return (UANetworkReplayRendevousHandler *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetworkConnectionHandler:(id)a3
{
}

- (timeval)ignoredRTimeVal
{
  objc_copyStruct(v4, &self->_ignoredRTimeVal, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_usec = v3;
  result.tv_sec = v2;
  return result;
}

- (unint64_t)recentActionsStateHandler
{
  return self->_recentActionsStateHandler;
}

- (void)setRecentActionsStateHandler:(unint64_t)a3
{
  self->_recentActionsStateHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConnectionHandler, 0);
  objc_storeStrong((id *)&self->_pingController, 0);
  objc_storeStrong((id *)&self->_replayManager, 0);
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->fakeBTLEInjectedItem, 0);

  objc_storeStrong((id *)&self->manager, 0);
}

@end