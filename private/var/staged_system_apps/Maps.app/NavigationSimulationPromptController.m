@interface NavigationSimulationPromptController
+ (id)actionsForPromptOptions:(id)a3;
+ (void)promptIfNeededForSimulationForRoute:(id)a3 navigationTracePlayback:(BOOL)a4 continueWithOptions:(id)a5;
@end

@implementation NavigationSimulationPromptController

+ (void)promptIfNeededForSimulationForRoute:(id)a3 navigationTracePlayback:(BOOL)a4 continueWithOptions:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v39 = a5;
  v9 = +[GEOPlatform sharedPlatform];
  unsigned int v38 = [v9 isInternalInstall];

  int BOOL = GEOConfigGetBOOL();
  int v36 = GEOConfigGetBOOL();
  v10 = sub_10057741C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v6) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    v12 = v11;
    if (BOOL) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    v14 = v13;
    if (v36) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    v16 = v15;
    if (v38) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    v18 = v17;
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v53 = v16;
    LOWORD(v54) = 2112;
    *(void *)((char *)&v54 + 2) = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "isNavigationTracePlayback=%@ showNavigationSimulationPrompt=%@ navigationSimulationEnabled=%@ isInternalInstall=%@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x5810000000;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v53 = (__CFString *)&unk_1011B93F2;
  uint64_t v57 = 0;
  +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions];
  unsigned int v19 = [v8 transportType] - 1;
  if (v19 > 5) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = qword_100F740E0[v19];
  }
  v21 = [v8 routeAttributes];
  unsigned __int8 v22 = [v21 hasTimepoint];

  if (v6)
  {
    v23 = (void (*)(void *, long long *, void))v39[2];
    long long v24 = *(_OWORD *)(*(void *)&buf[8] + 48);
    long long v46 = *(_OWORD *)(*(void *)&buf[8] + 32);
    long long v47 = v24;
    long long v48 = *(_OWORD *)(*(void *)&buf[8] + 64);
    uint64_t v49 = *(void *)(*(void *)&buf[8] + 80);
    v23(v39, &v46, 0);
  }
  else if ((v38 & BOOL) != 0)
  {
    v25 = &off_1013AE8F8;
    switch(v20)
    {
      case 1:
        v29 = +[CarDisplayController sharedInstance];
        unsigned int v30 = [v29 isCurrentlyConnectedToAnyCarScene];

        if (v30) {
          v31 = &off_1013AE928;
        }
        else {
          v31 = &off_1013AE940;
        }
        v25 = (_UNKNOWN **)[v31 mutableCopy];
        break;
      case 2:
      case 5:
        v25 = &off_1013AE910;
        break;
      case 3:
        break;
      default:
        v25 = (_UNKNOWN **)&__NSArray0__struct;
        break;
    }
    v50[0] = @"kMapsInterruptionActions";
    v32 = [a1 actionsForPromptOptions:v25];
    v50[1] = @"kMapsInterruptionTitle";
    v51[0] = v32;
    v51[1] = @"Navigation Simulation";
    v33 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

    v34 = +[UIApplication sharedMapsDelegate];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100D825C0;
    v40[3] = &unk_1013238E8;
    v35 = v25;
    id v41 = v35;
    v42 = v39;
    v43 = buf;
    uint64_t v44 = v20;
    unsigned __int8 v45 = v22;
    [v34 interruptApplicationWithKind:12 userInfo:v33 completionHandler:v40];
  }
  else
  {
    uint64_t v26 = *(void *)&buf[8];
    if (v36) {
      *(unsigned char *)(*(void *)&buf[8] + 32) = 1;
    }
    v27 = (void (*)(void *, long long *, void))v39[2];
    long long v28 = *(_OWORD *)(v26 + 48);
    long long v46 = *(_OWORD *)(v26 + 32);
    long long v47 = v28;
    long long v48 = *(_OWORD *)(v26 + 64);
    uint64_t v49 = *(void *)(v26 + 80);
    v27(v39, &v46, 0);
  }
  _Block_object_dispose(buf, 8);
}

+ (id)actionsForPromptOptions:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = sub_100D82794((__CFString *)[v10 unsignedIntegerValue]);
        v12 = +[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v11, [v10 unsignedIntegerValue] == 0, 0);
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end