@interface UGCSubmissionStorage
+ (unint64_t)muidForClientSubmissionIdentifier:(id)a3;
+ (void)removeClientSubmissionIdentifier:(id)a3;
+ (void)setMUIDAndSubmissionIdentifierWithCorrectionsRequest:(id)a3;
@end

@implementation UGCSubmissionStorage

+ (unint64_t)muidForClientSubmissionIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 dictionaryForKey:@"UGCPendingSubmissions"];
  v6 = [v5 objectForKey:v3];

  if (v6) {
    id v7 = [v6 unsignedIntegerValue];
  }
  else {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

+ (void)setMUIDAndSubmissionIdentifierWithCorrectionsRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 feedbackRequestParameters];
  v5 = [v4 submissionParameters];
  unsigned int v6 = [v5 type];

  if (v6 == 10)
  {
    id v7 = [v3 feedbackRequestParameters];
    v8 = [v7 submissionParameters];
    v9 = [v8 details];
    v10 = [v9 poiEnrichmentUpdate];

    if ([v10 hasPlaceContext])
    {
      v11 = [v10 placeContext];
      id v12 = [v11 muid];

      v13 = [v3 feedbackRequestParameters];
      v14 = [v13 submissionParameters];
      v15 = [v14 clientSubmissionUuid];

      if (v12 && [v15 length])
      {
        v16 = +[NSUserDefaults standardUserDefaults];
        v17 = [v16 dictionaryForKey:@"UGCPendingSubmissions"];
        id v18 = [v17 mutableCopy];

        if (!v18) {
          id v18 = objc_alloc_init((Class)NSMutableDictionary);
        }
        if ([v15 length])
        {
          v19 = +[NSNumber numberWithUnsignedLongLong:v12];
          [v18 setObject:v19 forKey:v15];
        }
        id v20 = [v18 copy];
        [v16 setObject:v20 forKey:@"UGCPendingSubmissions"];
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: muid > 0 && clientIdentifier.length > 0", v21, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: enrichment.hasPlaceContext", buf, 2u);
    }
  }
}

+ (void)removeClientSubmissionIdentifier:(id)a3
{
  id v3 = a3;
  id v7 = +[NSUserDefaults standardUserDefaults];
  v4 = [v7 objectForKey:@"UGCPendingSubmissions"];
  id v5 = [v4 mutableCopy];

  [v5 removeObjectForKey:v3];
  id v6 = [v5 copy];
  [v7 setObject:v6 forKey:@"UGCPendingSubmissions"];
}

@end