@interface GKWidgetEventListener
- (BOOL)isActionDefined:(id)a3;
- (BOOL)isKnownScheme:(id)a3;
- (CHSWidgetEventServiceListener)listener;
- (id)makeDeepLinkDictionaryFrom:(id)a3;
- (void)activateListener;
- (void)eventServiceListener:(id)a3 didReceiveOpenEventWithURL:(id)a4;
- (void)setListener:(id)a3;
@end

@implementation GKWidgetEventListener

- (void)activateListener
{
  id v3 = [objc_alloc((Class)CHSWidgetEventServiceListener) initWithServiceDomain:@"com.apple.chrono.event-service.gamed" delegate:self];
  [(GKWidgetEventListener *)self setListener:v3];

  v4 = [(GKWidgetEventListener *)self listener];
  [v4 activate];

  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Activating CHSWidgetEventServiceListener listener", v7, 2u);
  }
}

- (BOOL)isKnownScheme:(id)a3
{
  uint64_t v3 = qword_100329998[0];
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(qword_100329998, &stru_1002DC9A8);
  }
  unsigned __int8 v5 = [(id)qword_100329990 containsObject:v4];

  return v5;
}

- (BOOL)isActionDefined:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentPlayer] & 1) != 0
    || ([v3 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentLeaderboard] & 1) != 0
    || ([v3 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentAchievement] & 1) != 0
    || ([v3 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentGame] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentDashboard];
  }

  return v4;
}

- (id)makeDeepLinkDictionaryFrom:(id)a3
{
  id v42 = a3;
  uint64_t v3 = [v42 host];
  unsigned __int8 v4 = (void *)v3;
  if (v3)
  {
    v41 = (void *)v3;
    *(void *)buf = 0;
    v94 = buf;
    uint64_t v95 = 0x3032000000;
    v96 = sub_100160FB4;
    v97 = sub_100160FC4;
    id v98 = 0;
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x3032000000;
    v90 = sub_100160FB4;
    v91 = sub_100160FC4;
    id v92 = 0;
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x3032000000;
    v84 = sub_100160FB4;
    v85 = sub_100160FC4;
    id v86 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x3032000000;
    v78 = sub_100160FB4;
    v79 = sub_100160FC4;
    id v80 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    v72 = sub_100160FB4;
    v73 = sub_100160FC4;
    id v74 = 0;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = sub_100160FB4;
    v67 = sub_100160FC4;
    id v68 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = sub_100160FB4;
    v61 = sub_100160FC4;
    id v62 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_100160FB4;
    v55 = sub_100160FC4;
    id v56 = 0;
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = sub_100160FB4;
    v49 = sub_100160FC4;
    id v50 = 0;
    unsigned __int8 v5 = [v42 queryItems];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100160FCC;
    v44[3] = &unk_1002DC9D0;
    v44[4] = buf;
    v44[5] = &v87;
    v44[6] = &v81;
    v44[7] = &v75;
    v44[8] = &v69;
    v44[9] = &v63;
    v44[10] = &v57;
    v44[11] = &v45;
    v44[12] = &v51;
    [v5 enumerateObjectsUsingBlock:v44];

    if ([v41 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentDashboard])
    {
      if ([(id)v64[5] length])
      {
        v107[0] = GKRemoteAlertDeeplinkActionKey;
        v107[1] = GKRemoteAlertDeeplinkActionIdentifierKey;
        CFStringRef v6 = (const __CFString *)v64[5];
        if (!v6) {
          CFStringRef v6 = &stru_1002E4F58;
        }
        v108[0] = GKRemoteAlertDeeplinkActionActivityIdValue;
        v108[1] = v6;
        CFStringRef v7 = (const __CFString *)v46[5];
        if (!v7) {
          CFStringRef v7 = &stru_1002E4F58;
        }
        v107[2] = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
        v107[3] = GKRemoteAlertDeeplinkActionActivityTypeKey;
        CFStringRef v8 = (const __CFString *)v58[5];
        if (!v8) {
          CFStringRef v8 = &stru_1002E4F58;
        }
        v108[2] = v7;
        v108[3] = v8;
        CFStringRef v9 = (const __CFString *)v52[5];
        if (!v9) {
          CFStringRef v9 = &stru_1002E4F58;
        }
        v107[4] = GKRemoteAlertDeeplinkActionWidgetIdKey;
        v107[5] = GKRemoteAlertDeeplinkGameAdamIdKey;
        CFStringRef v10 = (const __CFString *)v88[5];
        if (!v10) {
          CFStringRef v10 = &stru_1002E4F58;
        }
        v11 = v107;
        v12 = v108;
        v108[4] = v9;
        v108[5] = v10;
        uint64_t v13 = 6;
        goto LABEL_37;
      }
      CFStringRef v23 = (const __CFString *)v46[5];
      if (!v23) {
        CFStringRef v23 = &stru_1002E4F58;
      }
      v109[0] = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
      v109[1] = GKRemoteAlertDeeplinkActionWidgetIdKey;
      CFStringRef v24 = (const __CFString *)v52[5];
      if (!v24) {
        CFStringRef v24 = &stru_1002E4F58;
      }
      v110[0] = v23;
      v110[1] = v24;
      v11 = v109;
      v12 = v110;
LABEL_36:
      uint64_t v13 = 2;
LABEL_37:
      v16 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:v13];
LABEL_73:
      unsigned __int8 v4 = v41;
LABEL_74:
      _Block_object_dispose(&v45, 8);

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v57, 8);

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v69, 8);

      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(&v81, 8);

      _Block_object_dispose(&v87, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_75;
    }
    if ([v41 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentPlayer])
    {
      if ([(id)v76[5] length])
      {
        v105[0] = GKRemoteAlertDeeplinkActionKey;
        v105[1] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
        uint64_t v17 = v76[5];
        v106[0] = GKRemoteAlertDeeplinkActionPlayerProfileValue;
        v106[1] = v17;
        v11 = v105;
        v12 = v106;
        goto LABEL_36;
      }
      if (!os_log_GKGeneral) {
        id v31 = (id)GKOSLoggers();
      }
      v32 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v43 = 0;
        v33 = "GKWidgetEventListener: Received malformed player data";
LABEL_71:
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, v33, v43, 2u);
      }
    }
    else
    {
      if ([v41 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentLeaderboard])
      {
        [*((id *)v94 + 5) firstObject];
        v18 = unsigned __int8 v4 = v41;
        if ([v18 length]
          && [(id)v70[5] length]
          && [(id)v76[5] length]
          && [(id)v82[5] length])
        {
          v103[0] = GKRemoteAlertDeeplinkActionKey;
          v103[1] = GKRemoteAlertDeeplinkActionIdentifierKey;
          uint64_t v19 = v82[5];
          v103[2] = GKRemoteAlertDeeplinkGameBundleIdentifierKey;
          v103[3] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
          uint64_t v20 = v76[5];
          v104[2] = v19;
          v104[3] = v20;
          uint64_t v21 = v70[5];
          v103[4] = GKRemoteAlertDeeplinkActionNameKey;
          v103[5] = GKRemoteAlertDeeplinkGameAdamIdKey;
          CFStringRef v22 = (const __CFString *)v88[5];
          if (!v22) {
            CFStringRef v22 = &stru_1002E4F58;
          }
          v104[0] = GKRemoteAlertDeeplinkActionLeaderboardValue;
          v104[1] = v18;
          v104[4] = v21;
          v104[5] = v22;
          v16 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:6];
        }
        else
        {
          if (!os_log_GKGeneral) {
            id v29 = (id)GKOSLoggers();
          }
          v30 = os_log_GKDaemon;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received malformed leaderboard data", v43, 2u);
          }
          v16 = 0;
        }

        goto LABEL_74;
      }
      if ([v41 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentAchievement])
      {
        if ([(id)v82[5] length]
          && [(id)v76[5] length]
          && [(id)v70[5] length])
        {
          v102[0] = GKRemoteAlertDeeplinkActionAchievementsValue;
          v101[0] = GKRemoteAlertDeeplinkActionKey;
          v101[1] = GKRemoteAlertDeeplinkAchievementsIdsKey;
          v25 = [*((id *)v94 + 5) componentsJoinedByString:@","];
          uint64_t v26 = v82[5];
          v102[1] = v25;
          v102[2] = v26;
          v101[2] = GKRemoteAlertDeeplinkGameBundleIdentifierKey;
          v101[3] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
          uint64_t v27 = v70[5];
          v102[3] = v76[5];
          v102[4] = v27;
          v101[4] = GKRemoteAlertDeeplinkActionNameKey;
          v101[5] = GKRemoteAlertDeeplinkGameAdamIdKey;
          CFStringRef v28 = (const __CFString *)v88[5];
          if (!v28) {
            CFStringRef v28 = &stru_1002E4F58;
          }
          v102[5] = v28;
          v16 = +[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:6];

          unsigned __int8 v4 = v41;
          goto LABEL_74;
        }
        if (!os_log_GKGeneral) {
          id v38 = (id)GKOSLoggers();
        }
        v32 = os_log_GKDaemon;
        if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
          goto LABEL_72;
        }
        *(_WORD *)v43 = 0;
        v33 = "GKWidgetEventListener: Received malformed achievement data";
        goto LABEL_71;
      }
      if ([v41 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentGame])
      {
        if ([(id)v82[5] length] && objc_msgSend((id)v88[5], "length"))
        {
          uint64_t v34 = v82[5];
          v99[0] = GKRemoteAlertDeeplinkGameBundleIdentifierKey;
          v99[1] = GKRemoteAlertDeeplinkGameAdamIdKey;
          uint64_t v35 = v88[5];
          v100[0] = v34;
          v100[1] = v35;
          CFStringRef v36 = (const __CFString *)v46[5];
          if (!v36) {
            CFStringRef v36 = &stru_1002E4F58;
          }
          v99[2] = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
          v99[3] = GKRemoteAlertDeeplinkActionWidgetIdKey;
          CFStringRef v37 = (const __CFString *)v52[5];
          if (!v37) {
            CFStringRef v37 = &stru_1002E4F58;
          }
          v100[2] = v36;
          v100[3] = v37;
          v11 = v99;
          v12 = v100;
          uint64_t v13 = 4;
          goto LABEL_37;
        }
        if (!os_log_GKGeneral) {
          id v39 = (id)GKOSLoggers();
        }
        v32 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v43 = 0;
          v33 = "GKWidgetEventListener: Received malformed achievement data";
          goto LABEL_71;
        }
      }
    }
LABEL_72:
    v16 = 0;
    goto LABEL_73;
  }
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers();
  }
  v15 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Missing host from recived url", buf, 2u);
  }
  v16 = 0;
LABEL_75:

  return v16;
}

- (void)eventServiceListener:(id)a3 didReceiveOpenEventWithURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  CFStringRef v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v10 = v9;
    v11 = [v7 absoluteString];
    *(_DWORD *)buf = 138412290;
    v125 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received url %@", buf, 0xCu);
  }
  id v12 = [objc_alloc((Class)NSURLComponents) initWithURL:v7 resolvingAgainstBaseURL:0];
  if (v12)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v13 = [v12 scheme];
      unsigned int v14 = [v13 isEqualToString:@"game-overlay-ui"];

      if (v14)
      {
        if (!os_log_GKGeneral) {
          id v15 = (id)GKOSLoggers();
        }
        v16 = (void *)os_log_GKDaemon;
        if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
    uint64_t v17 = [v12 scheme];
    unsigned __int8 v18 = [v17 isEqualToString:@"GCActivityFeedLockup"];

    if (v18)
    {
      uint64_t v19 = +[GKClientProxy gameCenterClient];
      uint64_t v20 = +[GKService serviceWithTransport:0 forClient:v19 credential:0];

      uint64_t v21 = [v12 host];
      if ([(__CFString *)v21 isEqualToString:GKMarkdownURLFormulationPathComponentASCLaunchTrampoline])
      {
        v105 = v20;
        CFStringRef v22 = objc_opt_new();
        CFStringRef v23 = [v12 queryItems];
        v118[0] = _NSConcreteStackBlock;
        v118[1] = 3221225472;
        v118[2] = sub_100162034;
        v118[3] = &unk_1002DC9F8;
        CFStringRef v24 = v22;
        v119 = v24;
        [v23 enumerateObjectsUsingBlock:v118];

        uint64_t v25 = [(__CFString *)v24 objectForKeyedSubscript:GKActivityFeedMarkdownURLFormulationQueryAdamId];
        uint64_t v103 = [(__CFString *)v24 objectForKeyedSubscript:GKActivityFeedMarkdownURLFormulationQueryBundleId];
        uint64_t v26 = [(__CFString *)v24 objectForKeyedSubscript:GKMarkdownURLFormulationQueryWidgetId];
        uint64_t v27 = (void *)v26;
        if (v26) {
          CFStringRef v28 = (__CFString *)v26;
        }
        else {
          CFStringRef v28 = &stru_1002E4F58;
        }
        v101 = v28;

        uint64_t v29 = GKMarkdownURLFormulationQueryWidgetSize;
        v30 = [(__CFString *)v24 objectForKeyedSubscript:GKMarkdownURLFormulationQueryWidgetSize];

        id v98 = v7;
        if (v30)
        {
          id v31 = [(__CFString *)v24 objectForKeyedSubscript:v29];
        }
        else
        {
          id v31 = &off_1002F2828;
        }
        uint64_t v59 = [(__CFString *)v24 objectForKeyedSubscript:GKMarkdownURLFormulationQueryLocalizedName];
        v60 = (void *)v59;
        if (v59) {
          v61 = (__CFString *)v59;
        }
        else {
          v61 = &stru_1002E4F58;
        }
        id v62 = v61;

        v100 = v24;
        if (v25)
        {
          uint64_t v63 = (void *)v25;
          uint64_t v64 = (int)[v31 intValue];
          uint64_t v65 = [(__CFString *)v24 objectForKeyedSubscript:GKMarkdownURLFormulationQueryTopic];
          id v66 = v6;
          v67 = (void *)v65;
          if (v65) {
            CFStringRef v68 = (const __CFString *)v65;
          }
          else {
            CFStringRef v68 = &stru_1002E4F58;
          }
          uint64_t v69 = (void *)v103;
          uint64_t v70 = v64;
          uint64_t v20 = v105;
          uint64_t v71 = +[ASCAppLaunchTrampolineURL URLWithAdamId:v63 bundleId:v103 widgetId:v101 widgetSize:v70 localizedName:v62 sourceApplication:@"com.apple.gamecenter.widgets.extension" topic:v68];

          id v6 = v66;
          v72 = v101;
          v112[0] = _NSConcreteStackBlock;
          v112[1] = 3221225472;
          v112[2] = sub_1001620D0;
          v112[3] = &unk_1002DCA20;
          v113 = v101;
          v114 = v31;
          v115 = v62;
          id v116 = v63;
          id v117 = v105;
          [v117 invokeASCAppLaunchTrampolineWithURL:v71 handler:v112];
        }
        else
        {
          if (!os_log_GKGeneral) {
            id v73 = (id)GKOSLoggers();
          }
          id v74 = os_log_GKDaemon;
          uint64_t v63 = 0;
          uint64_t v20 = v105;
          v72 = v101;
          uint64_t v69 = (void *)v103;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v125 = v101;
            __int16 v126 = 2112;
            v127 = v31;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Unexpected nil value returned in adamId for widgetId: %@, size: %@", buf, 0x16u);
          }
        }

        id v7 = v98;
        v43 = v100;
      }
      else if ([(GKWidgetEventListener *)self isActionDefined:v21])
      {
        id v102 = v6;
        uint64_t v40 = [(GKWidgetEventListener *)self makeDeepLinkDictionaryFrom:v12];
        v41 = (void *)v40;
        id v42 = &__NSDictionary0__struct;
        if (v40) {
          id v42 = (void *)v40;
        }
        v43 = v42;

        uint64_t v44 = [(__CFString *)v43 objectForKeyedSubscript:GKRemoteAlertDeeplinkActionWidgetIdKey];
        uint64_t v45 = (void *)v44;
        v46 = &stru_1002E4F58;
        if (v44) {
          v46 = (__CFString *)v44;
        }
        v104 = v46;

        uint64_t v47 = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
        uint64_t v48 = [(__CFString *)v43 objectForKeyedSubscript:GKRemoteAlertDeeplinkActionWidgetFamilyKey];
        v106 = v21;
        if (v48)
        {
          v49 = (void *)v48;
          id v50 = v20;
          uint64_t v51 = [(__CFString *)v43 objectForKeyedSubscript:v47];
          v52 = [&off_1002F2E08 objectForKeyedSubscript:v51];

          if (v52)
          {
            uint64_t v53 = [(__CFString *)v43 objectForKeyedSubscript:v47];
            v99 = [&off_1002F2E08 objectForKeyedSubscript:v53];
          }
          else
          {
            v99 = &off_1002F2828;
          }
          uint64_t v20 = v50;
          uint64_t v21 = v106;
        }
        else
        {
          v99 = &off_1002F2828;
        }
        if ([(__CFString *)v21 isEqualToString:GKActivityFeedMarkdownURLFormulationPathComponentGame])
        {
          uint64_t v75 = [(__CFString *)v43 objectForKeyedSubscript:GKRemoteAlertDeeplinkGameAdamIdKey];
          v76 = [(__CFString *)v43 objectForKeyedSubscript:GKRemoteAlertDeeplinkGameBundleIdentifierKey];
          if (v75)
          {
            uint64_t v77 = v99;
            signed int v78 = [v99 intValue];
            v79 = +[ASCAppLaunchTrampolineURL URLWithAdamId:v75 bundleId:v76 widgetId:v104 widgetSize:v78 localizedName:&stru_1002E4F58 sourceApplication:@"com.apple.gamecenter.widgets.extension" topic:GKReporterCSTopic];
            v107[0] = _NSConcreteStackBlock;
            v107[1] = 3221225472;
            v107[2] = sub_100162418;
            v107[3] = &unk_1002DCA48;
            v108 = v104;
            v109 = v99;
            id v110 = v75;
            id v111 = v20;
            [v111 invokeASCAppLaunchTrampolineWithURL:v79 handler:v107];

            id v6 = v102;
          }
          else
          {
            if (!os_log_GKGeneral) {
              id v94 = (id)GKOSLoggers();
            }
            uint64_t v95 = os_log_GKDaemon;
            uint64_t v77 = v99;
            id v6 = v102;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v125 = v104;
              __int16 v126 = 2112;
              v127 = v99;
              _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Unexpected nil value returned in adamId for widgetId: %@, size: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          if (!os_log_GKGeneral) {
            id v80 = (id)GKOSLoggers();
          }
          uint64_t v81 = os_log_GKDaemon;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v43;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Opening remote dashboard with deepLink %@", buf, 0xCu);
          }
          v82 = +[GKPlayerActivityItemInternal typeToConstantMapMetrics];
          uint64_t v83 = [(__CFString *)v43 objectForKeyedSubscript:GKRemoteAlertDeeplinkActionActivityTypeKey];
          id v84 = [v83 integerValue];

          v85 = +[NSNumber numberWithInteger:v84];
          v97 = v82;
          uint64_t v86 = [v82 objectForKeyedSubscript:v85];
          uint64_t v87 = (void *)v86;
          v88 = @"dashboard";
          if (v86) {
            v88 = (__CFString *)v86;
          }
          uint64_t v89 = v88;

          id v96 = objc_alloc((Class)NSMutableDictionary);
          v122[0] = @"eventType";
          v122[1] = @"actionType";
          v123[0] = @"click";
          v123[1] = @"navigate";
          v123[2] = v104;
          v122[2] = @"pageType";
          v122[3] = @"widgetContext";
          v120[0] = @"widgetId";
          v120[1] = @"size";
          v121[0] = v104;
          v121[1] = v99;
          v90 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:2];
          v123[3] = v90;
          v123[4] = v104;
          uint64_t v77 = v99;
          v122[4] = @"widgetId";
          v122[5] = @"size";
          v123[5] = v99;
          v123[6] = @"dashboard";
          v122[6] = @"targetId";
          v122[7] = @"targetType";
          v122[8] = @"location";
          v123[7] = v89;
          v123[8] = &off_1002F2F90;
          v91 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:9];

          id v92 = [v96 initWithDictionary:v91];
          v93 = [(__CFString *)v43 objectForKeyedSubscript:GKRemoteAlertDeeplinkGameAdamIdKey];
          if (v93) {
            [v92 setObject:v93 forKeyedSubscript:@"subjectId"];
          }
          [v20 reportMetricsEventWithTopic:GKReporterCSTopic shouldFlush:&__kCFBooleanFalse metricsFields:v92];

          uint64_t v75 = +[GKGameInternal createGamedGameInternal];
          [v20 openDashboardAsRemoteAlertForGame:v75 hostPID:getpid() deeplink:v43 launchContext:GKDashboardLaunchContextWidget];
          id v6 = v102;
        }

        uint64_t v21 = v106;
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v57 = (id)GKOSLoggers();
        }
        v58 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v125 = v21;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "GKWidgetEventListener: No action defined for %@", buf, 0xCu);
        }
        v43 = +[GKGameInternal createGamedGameInternal];
        [v20 openDashboardAsRemoteAlertForGame:v43 hostPID:getpid() deeplink:&__NSDictionary0__struct launchContext:GKDashboardLaunchContextWidget];
      }
    }
    else
    {
      uint64_t v34 = [v12 scheme];
      unsigned int v35 = [(GKWidgetEventListener *)self isKnownScheme:v34];

      if (v35)
      {
        if (!os_log_GKGeneral) {
          id v36 = (id)GKOSLoggers();
        }
        v16 = (void *)os_log_GKDaemon;
        if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
          goto LABEL_28;
        }
LABEL_27:
        CFStringRef v37 = v16;
        id v38 = [v12 scheme];
        *(_DWORD *)buf = 138412290;
        v125 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received a known scheme \"%@\" and will open the URL", buf, 0xCu);

LABEL_28:
        id v39 = +[GKApplicationWorkspace defaultWorkspace];
        [v39 openURL:v7];
LABEL_29:

        goto LABEL_83;
      }
      if (!os_log_GKGeneral) {
        id v54 = (id)GKOSLoggers();
      }
      v55 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        id v39 = v55;
        id v56 = [v12 scheme];
        *(_DWORD *)buf = 138412290;
        v125 = v56;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received an unknown scheme %@", buf, 0xCu);

        goto LABEL_29;
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v32 = (id)GKOSLoggers();
    }
    v33 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Unable to parse url", buf, 2u);
    }
  }
LABEL_83:
}

- (CHSWidgetEventServiceListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end