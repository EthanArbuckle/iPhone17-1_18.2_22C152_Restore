@interface APMediaServiceErrorResponseProcessor
+ (id)processErrorsForContentDataItems:(id)a3 error:(id)a4 contextFingerprint:(id)a5 params:(id)a6;
@end

@implementation APMediaServiceErrorResponseProcessor

+ (id)processErrorsForContentDataItems:(id)a3 error:(id)a4 contextFingerprint:(id)a5 params:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a3 count];
  if (v9 || v12)
  {
    if (!v9)
    {
      id v19 = 0;
      goto LABEL_17;
    }
    id v19 = 0;
    uint64_t v20 = 3300;
    uint64_t v21 = 1010;
    switch((unint64_t)[v9 code])
    {
      case 0xBB8uLL:
        goto LABEL_12;
      case 0xBB9uLL:
      case 0xBBBuLL:
      case 0xBBDuLL:
        uint64_t v20 = 3302;
        uint64_t v21 = 1023;
        goto LABEL_12;
      case 0xBBAuLL:
        uint64_t v20 = 3301;
        uint64_t v21 = 1022;
        goto LABEL_12;
      case 0xBBEuLL:
      case 0xBBFuLL:
        uint64_t v20 = 3303;
        uint64_t v21 = 1025;
LABEL_12:
        id v22 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
        v15 = +[APContentData createForServerUnfilledReason:v21 placementType:5 contextIdentifier:v22];

        [v15 setDiagnosticCode:0];
        v16 = [[APJourneyDaemonMetricHelper alloc] initWithContentData:v15];
        v23 = [v11 requestID];
        v24 = [v23 UUIDString];
        -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](v16, "requestFailedForBundleID:withCode:requestID:placement:placementType:", @"com.apple.AppStore", v20, v24, [v11 placement], 5);

        break;
      case 0xBC0uLL:
        goto LABEL_17;
      case 0xBC1uLL:
        v25 = [v9 internalErrors];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1001874D0;
        v27[3] = &unk_100238D40;
        id v28 = v10;
        id v29 = v11;
        [v25 enumerateObjectsUsingBlock:v27];

        goto LABEL_15;
      default:
        APSimulateCrashNoKillProcess();
LABEL_15:
        v15 = 0;
        v16 = 0;
        break;
    }
  }
  else
  {
    v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received empty batch from Media API.", buf, 2u);
    }

    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
    v15 = +[APContentData createForServerUnfilledReason:1025 placementType:5 contextIdentifier:v14];

    v16 = [[APJourneyDaemonMetricHelper alloc] initWithContentData:v15];
    v17 = [v11 requestID];
    v18 = [v17 UUIDString];
    -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](v16, "requestFailedForBundleID:withCode:requestID:placement:placementType:", @"com.apple.AppStore", 3304, v18, [v11 placement], 5);

    [v15 setDiagnosticCode:1];
  }
  id v19 = v15;

LABEL_17:

  return v19;
}

@end