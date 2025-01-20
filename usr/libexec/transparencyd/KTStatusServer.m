@interface KTStatusServer
+ (id)auditorReportForKTRequest:(id)a3;
+ (id)auditorReportForKTSMT:(id)a3;
+ (id)auditorReportForSTH:(id)a3;
+ (void)auditorReportsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5;
+ (void)errorsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5;
+ (void)ignoreFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5;
@end

@implementation KTStatusServer

+ (void)errorsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
}

+ (void)ignoreFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
}

+ (id)auditorReportForKTRequest:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  id v5 = [v3 type];
  if ((unint64_t)v5 <= 2) {
    [v4 setObject:*(void *)*(&off_1002C75E0 + (void)v5) forKeyedSubscript:kTransparencyAuditorReportType];
  }
  v6 = [v3 uri];
  [v4 setObject:v6 forKeyedSubscript:kTransparencyAuditorReportURI];

  v7 = [v3 accountKey];
  v8 = [v7 base64EncodedStringWithOptions:0];
  [v4 setObject:v8 forKeyedSubscript:kTransparencyAuditorReportAccountKey];

  v9 = [v3 application];
  [v4 setObject:v9 forKeyedSubscript:kTransparencyAuditorReportApplication];

  [v3 requestTime];
  v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v10 timeIntervalSince1970];
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v11 forKeyedSubscript:kTransparencyAuditorReportRequestTime];

  v12 = [v3 serverLoggableDatas];
  v13 = [v12 base64EncodedStringWithOptions:0];
  [v4 setObject:v13 forKeyedSubscript:kTransparencyAuditorReportServerLoggableDatas];

  v14 = [v3 clientLoggableDatas];

  if (v14)
  {
    v15 = [v3 clientLoggableDatas];
    v16 = [v15 base64EncodedStringWithOptions:0];
    [v4 setObject:v16 forKeyedSubscript:kTransparencyAuditorReportTrustedLoggableDatas];
  }
  v17 = [v3 serverHint];

  if (v17)
  {
    v18 = [v3 serverHint];
    [v4 setObject:v18 forKeyedSubscript:kTransparencyAuditorReportServerHint];
  }
  if ([v3 usedReversePush]) {
    [v4 setObject:&off_1002D9D98 forKeyedSubscript:kTransparencyAuditorReportUsedReversePush];
  }
  v19 = [v3 queryRequest];

  if (v19)
  {
    v20 = [v3 queryRequest];
    v21 = [v20 base64EncodedStringWithOptions:0];
    [v4 setObject:v21 forKeyedSubscript:kTransparencyAuditorReportQueryRequest];
  }
  v22 = [v3 queryResponse];

  if (v22)
  {
    v23 = [v3 queryResponse];
    v24 = [v23 base64EncodedStringWithOptions:0];
    [v4 setObject:v24 forKeyedSubscript:kTransparencyAuditorReportQueryResponse];
  }
  v25 = [v3 responseTime];

  if (v25)
  {
    v26 = [v3 responseTime];
    [v26 timeIntervalSince1970];
    v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v27 forKeyedSubscript:kTransparencyAuditorReportResponseTime];
  }
  if ([v3 type] == (id)1)
  {
    v28 = [v3 application];
    v29 = +[KTAccountKeyServer sharedKeyServiceForApplication:v28];

    if (v29)
    {
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = sub_1001D3FCC;
      v37 = sub_1001D3FDC;
      id v38 = 0;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1001D3FE4;
      v32[3] = &unk_1002C7550;
      v32[4] = &v33;
      [v29 signData:0 completionBlock:v32];
      v30 = [(id)v34[5] base64EncodedStringWithOptions:0];
      [v4 setObject:v30 forKeyedSubscript:kTransparencyAuditorReportPCSIdentity];

      _Block_object_dispose(&v33, 8);
    }
  }

  return v4;
}

+ (id)auditorReportForKTSMT:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:kTransparencyAuditorReportTypeSMT forKeyedSubscript:kTransparencyAuditorReportType];
  id v5 = [v3 uri];
  [v4 setObject:v5 forKeyedSubscript:kTransparencyAuditorReportURI];

  v6 = [v3 application];
  [v4 setObject:v6 forKeyedSubscript:kTransparencyAuditorReportApplication];

  v7 = [v3 receiptTime];
  [v7 timeIntervalSince1970];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:kTransparencyAuditorReportRequestTime];

  v9 = [v3 smt];
  v10 = [v9 base64EncodedStringWithOptions:0];
  [v4 setObject:v10 forKeyedSubscript:kTransparencyAuditorReportSMT];

  if ([v3 signatureResult] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportSignatureFailed];
  }
  if ([v3 mergeResult] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportMMDFailed];
  }
  v11 = [v3 failureEvent];

  if (v11)
  {
    v12 = [v3 failureEvent];
    v13 = [v12 encodedError];
    v14 = [v13 base64EncodedStringWithOptions:0];
    [v4 setObject:v14 forKeyedSubscript:kTransparencyAuditorReportNSError];
  }

  return v4;
}

+ (id)auditorReportForSTH:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  if ([v3 isMapHead])
  {
    [v4 setObject:kTransparencyAuditorReportTypeSMH forKeyedSubscript:kTransparencyAuditorReportType];
    id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 populating]);
    [v4 setObject:v5 forKeyedSubscript:kTransparencyAuditorReportMapPopulating];
  }
  else
  {
    [v4 setObject:kTransparencyAuditorReportTypeSLH forKeyedSubscript:kTransparencyAuditorReportType];
  }
  v6 = [v3 application];
  [v4 setObject:v6 forKeyedSubscript:kTransparencyAuditorReportApplication];

  [v3 receiptTime];
  v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v7 timeIntervalSince1970];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:kTransparencyAuditorReportRequestTime];

  v9 = [v3 sth];
  v10 = [v9 base64EncodedStringWithOptions:0];
  [v4 setObject:v10 forKeyedSubscript:kTransparencyAuditorReportSTH];

  v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 gossip]);
  [v4 setObject:v11 forKeyedSubscript:kTransparencyAuditorReportGossip];

  v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 logBeginTime]);
  [v4 setObject:v12 forKeyedSubscript:kTransparencyAuditorReportTreeEpoch];

  v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 revision]);
  [v4 setObject:v13 forKeyedSubscript:kTransparencyAuditorReportRevision];

  if ([v3 signatureVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportSignatureFailed];
  }
  if ([v3 inclusionVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportInclusionFailed];
  }
  if ([v3 consistencyVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportConsistencyFailed];
  }
  if ([v3 mmdVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportMMDFailed];
  }
  v14 = [v3 failureEvent];

  if (v14)
  {
    v15 = [v3 failureEvent];
    v16 = [v15 encodedError];
    v17 = [v16 base64EncodedStringWithOptions:0];
    [v4 setObject:v17 forKeyedSubscript:kTransparencyAuditorReportNSError];
  }

  return v4;
}

+ (void)auditorReportsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v24 = (void (**)(id, void))a5;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_1001D3FCC;
  v41 = sub_1001D3FDC;
  id v42 = 0;
  v9 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v14 = (id *)(v38 + 5);
        id v32 = (id)v38[5];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1001D4934;
        v30[3] = &unk_1002C7578;
        v30[4] = v13;
        id v15 = v9;
        id v31 = v15;
        unsigned __int8 v16 = [v8 performAndWaitForRequestId:v13 error:&v32 block:v30];
        objc_storeStrong(v14, v32);
        if ((v16 & 1) == 0)
        {
          v18 = (id *)(v38 + 5);
          v17 = (void *)v38[5];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1001D49C4;
          v26[3] = &unk_1002C75C0;
          v28 = &v37;
          id v29 = v17;
          v26[4] = v13;
          id v27 = v15;
          unsigned __int8 v19 = [v8 performAndWaitForFailedEventId:v13 error:&v29 block:v26];
          objc_storeStrong(v18, v29);

          if ((v19 & 1) == 0)
          {

            goto LABEL_12;
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if ([v9 count])
  {
    uint64_t v20 = 0;
    v21 = v9;
  }
  else
  {
    if (v38[5])
    {
      v24[2](v24, 0);
      goto LABEL_17;
    }
    uint64_t v22 = +[TransparencyError errorWithDomain:kTransparencyErrorDatabase, -299, @"no auditor reports for eventIds: %@", obj code description];
    v23 = (void *)v38[5];
    v38[5] = v22;

    v21 = 0;
    uint64_t v20 = v38[5];
  }
  ((void (*)(void (**)(id, void), void *, uint64_t))v24[2])(v24, v21, v20);
LABEL_17:

  _Block_object_dispose(&v37, 8);
}

@end