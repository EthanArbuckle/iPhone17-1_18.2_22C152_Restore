@interface CallRecordConverter
+ (id)sharedInstance;
- (CallRecordConverter)init;
- (NSCache)handleToPersonCache;
- (NSCache)recentCallIdToCallRecordCache;
- (id)callRecordForRecentCall:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6;
- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5;
- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6;
- (int64_t)callCapabilityFromRecentCall:(id)a3;
- (int64_t)preferredCallProviderFromRecentCall:(id)a3;
- (void)setHandleToPersonCache:(id)a3;
- (void)setRecentCallIdToCallRecordCache:(id)a3;
@end

@implementation CallRecordConverter

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026D7C;
  block[3] = &unk_10004CC38;
  block[4] = a1;
  if (qword_100058980 != -1) {
    dispatch_once(&qword_100058980, block);
  }
  v2 = (void *)qword_100058978;

  return v2;
}

- (CallRecordConverter)init
{
  v8.receiver = self;
  v8.super_class = (Class)CallRecordConverter;
  v2 = [(CallRecordConverter *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    recentCallIdToCallRecordCache = v2->_recentCallIdToCallRecordCache;
    v2->_recentCallIdToCallRecordCache = v3;

    v5 = (NSCache *)objc_alloc_init((Class)NSCache);
    handleToPersonCache = v2->_handleToPersonCache;
    v2->_handleToPersonCache = v5;
  }
  return v2;
}

- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5
{
  return [(CallRecordConverter *)self callRecordsForRecentCalls:a3 withContactsDataSource:a4 withCallProviderManager:a5 withCurrentISOCountryCodes:&__NSArray0__struct];
}

- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6
{
  id v10 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v16);
        v18 = [(CallRecordConverter *)self recentCallIdToCallRecordCache];
        v19 = [v17 uniqueId];
        v20 = [v18 objectForKey:v19];

        v21 = IntentHandlerDefaultLog();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22) {
            sub_10003241C(&buf, v30, v21);
          }
        }
        else
        {
          if (v22) {
            sub_1000323A4(v35, v17, &v36, v21);
          }

          v20 = [(CallRecordConverter *)self callRecordForRecentCall:v17 withContactsDataSource:v28 withCallProviderManager:v27 withCurrentISOCountryCodes:v26];
          v21 = [(CallRecordConverter *)self recentCallIdToCallRecordCache];
          v23 = [v17 uniqueId];
          [v21 setObject:v20 forKey:v23];
        }
        [v11 addObject:v20];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v14);
  }

  id v24 = [v11 copy];

  return v24;
}

- (id)callRecordForRecentCall:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6
{
  id v10 = a3;
  id v49 = a4;
  id v11 = a5;
  id v48 = a6;
  v51 = +[NSMutableArray array];
  v50 = v10;
  v47 = v11;
  if ([v10 callerIdIsBlocked])
  {
    id v12 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Caller ID is blocked", buf, 2u);
    }
    goto LABEL_35;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v12 = [v10 remoteParticipantHandles];
  id v13 = [v12 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v57;
    v53 = v12;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v57 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * i), "tu_tuHandle");
        if (v18)
        {
          v19 = [(CallRecordConverter *)self handleToPersonCache];
          v20 = [v19 objectForKey:v18];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = v20;
            id v22 = v15;
            goto LABEL_25;
          }
          if (v20)
          {
            v23 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint8_t buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Found an entry of unknown type in handleToPerson cache", buf, 2u);
            }

            uint64_t v15 = 0;
          }
          else
          {
            id v24 = [v10 isoCountryCode];
            if (v24)
            {
              v25 = [v10 isoCountryCode];
              v62 = v25;
              id v22 = +[NSArray arrayWithObjects:&v62 count:1];
            }
            else
            {
              id v22 = v48;
            }

            v21 = +[INPerson tu_personMatchingHandle:v18 contactsDataSource:v49 isoCountryCodes:v22];

            if (v21)
            {
              id v26 = v21;
            }
            else
            {
              id v26 = +[NSNull null];
            }
            id v27 = v26;
            id v28 = [(CallRecordConverter *)self handleToPersonCache];
            [v28 setObject:v27 forKey:v18];

            id v10 = v50;
LABEL_25:

            if (v21)
            {
              [v51 addObject:v21];
              uint64_t v15 = v21;
            }
            else
            {
              uint64_t v15 = 0;
            }
            id v12 = v53;
          }
          v29 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            v61 = v15;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "person added to particpants in callrecord: %@", buf, 0xCu);
          }

          goto LABEL_32;
        }
        v20 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint8_t buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine remoteParticipantHandle for CHRecentCall", buf, 2u);
        }
LABEL_32:
      }
      id v14 = [v12 countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (!v14)
      {
        id v11 = v47;
        goto LABEL_36;
      }
    }
  }
LABEL_35:
  uint64_t v15 = 0;
LABEL_36:

  unsigned int v30 = [v10 callStatus];
  if ((kCHCallStatusOutgoing & v30) != 0)
  {
    uint64_t v31 = 1;
  }
  else
  {
    unsigned int v32 = [v10 callStatus];
    if ((kCHCallStatusMissed & v32) != 0)
    {
      uint64_t v31 = 2;
    }
    else
    {
      unsigned int v33 = [v10 callStatus];
      uint64_t v31 = 3;
      if ((kCHCallStatusIncoming & v33) == 0) {
        uint64_t v31 = 0;
      }
    }
  }
  id v54 = (id)v31;
  v45 = [v11 providerForRecentCall:v10];
  v42 = [v45 bundleIdentifier];
  int64_t v34 = [(CallRecordConverter *)self preferredCallProviderFromRecentCall:v10];
  int64_t v52 = [(CallRecordConverter *)self callCapabilityFromRecentCall:v10];
  id v35 = objc_alloc((Class)INCallRecord);
  v46 = [v10 uniqueId];
  v44 = [v10 date];
  uint64_t v36 = v10;
  [v10 duration];
  v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v37 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 read] ^ 1);
  v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 numberOfOccurrences]);
  v39 = [v45 identifier];
  v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v36 callerIdIsBlocked]);
  id v55 = [v35 initWithIdentifier:v46 dateCreated:v44 callRecordType:v54 callCapability:v52 callDuration:v43 unseen:v37 preferredCallProvider:v34 participants:v51 numberOfCalls:v38 providerId:v39 providerBundleId:v42 isCallerIdBlocked:v40];

  return v55;
}

- (int64_t)preferredCallProviderFromRecentCall:(id)a3
{
  v3 = [a3 serviceProvider];
  if ([v3 isEqualToString:kCHServiceProviderFaceTime])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:kCHServiceProviderTelephony])
  {
    int64_t v4 = 1;
  }
  else
  {
    id v5 = [v3 length];
    v6 = IntentHandlerDefaultLog();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_1000324A0(v7);
      }
      int64_t v4 = 3;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10003245C(v7);
      }
      int64_t v4 = 0;
    }
  }
  return v4;
}

- (int64_t)callCapabilityFromRecentCall:(id)a3
{
  id v3 = [a3 mediaType];
  int64_t v4 = (int64_t)v3;
  if (v3)
  {
    if (v3 == (id)2)
    {
      id v5 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        v6 = "Inferring video call capability from call to redial";
        v7 = buf;
        goto LABEL_10;
      }
    }
    else
    {
      if (v3 != (id)1) {
        return 0;
      }
      id v5 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        v6 = "Inferring audio call capability from call to redial";
        v7 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
  }
  else
  {
    id v5 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      v6 = "[WARN] Unable to infer callCapability from call to redial because media type of that call was unknown.";
      v7 = (uint8_t *)&v9;
      goto LABEL_10;
    }
  }

  return v4;
}

- (NSCache)recentCallIdToCallRecordCache
{
  return self->_recentCallIdToCallRecordCache;
}

- (void)setRecentCallIdToCallRecordCache:(id)a3
{
}

- (NSCache)handleToPersonCache
{
  return self->_handleToPersonCache;
}

- (void)setHandleToPersonCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToPersonCache, 0);

  objc_storeStrong((id *)&self->_recentCallIdToCallRecordCache, 0);
}

@end