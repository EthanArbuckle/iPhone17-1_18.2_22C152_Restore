@interface SearchCallHistoryIntentHandler
+ (unint64_t)maximumRecordCountForCallRecordTypeOptions:(unint64_t)a3;
- (NSCache)identifierToContactCache;
- (SearchCallHistoryIntentHandler)init;
- (SearchCallHistoryIntentHandler)initWithDataSource:(id)a3;
- (SearchCallHistoryIntentHandlerDataSource)dataSource;
- (id)callRecordsForRecentCallsWithRecordTypeOptions:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 recipient:(id)a6 capabilities:(unint64_t)a7 preferredProvider:(int64_t)a8 maximumRecordCount:(unint64_t)a9 unseen:(id)a10;
- (id)callRecordsForVoicemails:(id)a3;
- (void)handleSearchCallHistory:(id)a3 completion:(id)a4;
- (void)handleSearchVoicemailForRecipient:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 unread:(id)a6 maximumRecordCount:(unint64_t)a7 completion:(id)a8;
- (void)resolveRecipientForSearchCallHistory:(id)a3 withCompletion:(id)a4;
@end

@implementation SearchCallHistoryIntentHandler

- (SearchCallHistoryIntentHandler)init
{
  v3 = objc_alloc_init(SearchCallHistoryIntentHandlerDataSource);
  v4 = [(SearchCallHistoryIntentHandler *)self initWithDataSource:v3];

  return v4;
}

- (SearchCallHistoryIntentHandler)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchCallHistoryIntentHandler;
  v6 = [(SearchCallHistoryIntentHandler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = (NSCache *)objc_alloc_init((Class)NSCache);
    identifierToContactCache = v7->_identifierToContactCache;
    v7->_identifierToContactCache = v8;
  }
  return v7;
}

+ (unint64_t)maximumRecordCountForCallRecordTypeOptions:(unint64_t)a3
{
  if ((a3 & 8) != 0) {
    return 1;
  }
  else {
    return 25;
  }
}

- (void)handleSearchCallHistory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got a SearchCallHistory intent: %@", buf, 0xCu);
  }

  v8 = [v6 dateCreated];
  v9 = [v8 startDateComponents];
  v36 = [v8 endDateComponents];
  uint64_t v34 = [v6 recipient];
  id v10 = [v6 callCapabilities];
  id v11 = [v6 callTypes];
  uint64_t v35 = [v6 unseen];
  id v12 = [v6 preferredCallProvider];
  v13 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = (uint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Start Date  : %@", buf, 0xCu);
  }

  v14 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = (uint64_t)v36;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "End Date    : %@", buf, 0xCu);
  }

  v15 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v34;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Recipient   : %@", buf, 0xCu);
  }

  v16 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v38 = (uint64_t)v10;
    __int16 v39 = 1024;
    int v40 = v10 & 1;
    __int16 v41 = 1024;
    unsigned int v42 = (v10 >> 1) & 1;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Capabilities: %lx (audio: %d | video: %d)", buf, 0x18u);
  }

  v17 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = INPreferredCallProviderGetName();
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = (uint64_t)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PreferredCallProvider: %@", buf, 0xCu);
  }
  v19 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v38 = (uint64_t)v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Types       : %lx", buf, 0xCu);
  }

  v20 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v35;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unseen     : %@", buf, 0xCu);
  }

  id v21 = [(id)objc_opt_class() maximumRecordCountForCallRecordTypeOptions:v11];
  v22 = v9;
  v23 = [v9 date];
  id v24 = [v36 date];
  if ((v11 & 0x10) != 0)
  {
    v31 = self;
    v26 = (void *)v34;
    v30 = (void *)v35;
    id v32 = v21;
    v29 = v33;
    [(SearchCallHistoryIntentHandler *)v31 handleSearchVoicemailForRecipient:v34 fromStartDate:v23 toEndDate:v24 unread:v35 maximumRecordCount:v32 completion:v33];
  }
  else
  {
    v25 = self;
    v26 = (void *)v34;
    uint64_t v27 = [(SearchCallHistoryIntentHandler *)v25 callRecordsForRecentCallsWithRecordTypeOptions:v11 startDate:v23 endDate:v24 recipient:v34 capabilities:v10 preferredProvider:v12 maximumRecordCount:v21 unseen:v35];

    id v24 = [objc_alloc((Class)INSearchCallHistoryIntentResponse) initWithCode:7 userActivity:0];
    [v24 setCallRecords:v27];
    v28 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = (uint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Calling completion block with response: %@", buf, 0xCu);
    }

    v29 = v33;
    (*((void (**)(id, id))v33 + 2))(v33, v24);
    v23 = (void *)v27;
    v30 = (void *)v35;
  }
}

- (void)resolveRecipientForSearchCallHistory:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = [a3 recipient];
  v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "resolveRecipientForSearchCallHistory: %@", (uint8_t *)&v21, 0xCu);
  }

  if (!v6)
  {
    v13 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No recipient specified, returning notRequired", (uint8_t *)&v21, 2u);
    }

    uint64_t v12 = +[INPersonResolutionResult notRequired];
    goto LABEL_11;
  }
  v8 = [v6 personHandle];
  v9 = [v8 value];
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handle is present. Simply using the recipient to resolve with: %@", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v12 = +[INPersonResolutionResult successWithResolvedPerson:v6];
LABEL_11:
    v14 = (void *)v12;
    goto LABEL_20;
  }
  v15 = [v6 siriMatches];
  id v16 = [v15 count];
  v17 = IntentHandlerDefaultLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Recipient contains siriMatches, preserving those and returning success", (uint8_t *)&v21, 2u);
    }

    uint64_t v19 = +[INPersonResolutionResult successWithResolvedPerson:v6];
  }
  else
  {
    if (v18)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No contacts match the specified recipient, returning unsupported (a.k.a. notFound)", (uint8_t *)&v21, 2u);
    }

    uint64_t v19 = +[INPersonResolutionResult unsupported];
  }
  v14 = (void *)v19;

LABEL_20:
  v20 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Resolving with: %@", (uint8_t *)&v21, 0xCu);
  }

  v5[2](v5, v14);
}

- (void)handleSearchVoicemailForRecipient:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 unread:(id)a6 maximumRecordCount:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Type indicates we should be searching for voicemail. Matching voicemails to this intent", buf, 2u);
  }

  v20 = [(SearchCallHistoryIntentHandler *)self dataSource];
  int v21 = [v20 voicemailDataSource];

  if ([v21 isOnlineAndSubscribed])
  {
    [(SearchCallHistoryIntentHandler *)self dataSource];
    v22 = self;
    v23 = uint64_t v34 = self;
    [v23 contactsDataSource];
    unint64_t v35 = a7;
    id v24 = v21;
    id v25 = v18;
    id v26 = v17;
    id v27 = v16;
    v29 = id v28 = v15;
    v30 = [(SearchCallHistoryIntentHandler *)v22 identifierToContactCache];
    v31 = objc_msgSend(v14, "tu_handlesMatchingPersonWithContactsDataSource:identifierToContactCache:", v29, v30);

    id v15 = v28;
    id v16 = v27;
    id v17 = v26;
    id v18 = v25;
    int v21 = v24;

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000A5A4;
    v39[3] = &unk_10004CD08;
    id v40 = v14;
    id v41 = v31;
    id v42 = v15;
    id v43 = v16;
    id v44 = v17;
    id v32 = v31;
    id v33 = objc_retainBlock(v39);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000A9C4;
    v36[3] = &unk_10004CD30;
    unint64_t v38 = v35;
    v36[4] = v34;
    id v37 = v18;
    [v24 fetchVoicemailsMatching:v33 completion:v36];
  }
  else
  {
    id v32 = [objc_alloc((Class)INSearchCallHistoryIntentResponse) initWithCode:5 userActivity:0];
    (*((void (**)(id, id))v18 + 2))(v18, v32);
  }
}

- (id)callRecordsForVoicemails:(id)a3
{
  id v3 = a3;
  unint64_t v35 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  id v33 = objc_alloc_init((Class)NSMutableDictionary);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v3;
  id v36 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v39;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v6 = [v5 senderDestinationID];
        id v7 = [v6 length];

        if (!v7)
        {
          v13 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine voicemail.senderDestinationID", buf, 2u);
          }

          goto LABEL_14;
        }
        id v8 = objc_alloc((Class)TUHandle);
        v9 = [v5 senderDestinationID];
        id v10 = [v8 initWithType:2 value:v9];

        id v11 = [v33 objectForKey:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
        }
        else
        {
          if (v11)
          {

LABEL_14:
            id v12 = 0;
LABEL_23:
            v22 = 0;
            goto LABEL_24;
          }
          id v14 = [(SearchCallHistoryIntentHandler *)self dataSource];
          id v15 = [v14 contactsDataSource];
          id v16 = [(SearchCallHistoryIntentHandler *)self dataSource];
          id v17 = [v16 coreTelephonyDataSource];
          id v18 = [v17 allRelevantISOCountryCodes];
          id v12 = +[INPerson tu_personMatchingHandle:v10 contactsDataSource:v15 isoCountryCodes:v18];

          if (v12)
          {
            id v19 = v12;
          }
          else
          {
            id v19 = +[NSNull null];
          }
          v20 = v19;
          [v33 setObject:v19 forKey:v10];
        }
        if (!v12) {
          goto LABEL_23;
        }
        int v21 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] person in callRecord is nil", buf, 2u);
        }

        id v42 = v12;
        v22 = +[NSArray arrayWithObjects:&v42 count:1];
LABEL_24:
        id v23 = objc_alloc((Class)INCallRecord);
        id v24 = [v5 vmIdentifier];
        id v25 = [v5 date];
        [v5 duration];
        id v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isUnread]);
        id v28 = [v23 initWithIdentifier:v24 dateCreated:v25 callRecordType:5 callCapability:1 callDuration:v26 unseen:v27 participants:v22 numberOfCalls:0 isCallerIdBlocked:0];

        [v35 addObject:v28];
      }
      id v36 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v36);
  }

  id v29 = [v35 copy];

  return v29;
}

- (id)callRecordsForRecentCallsWithRecordTypeOptions:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 recipient:(id)a6 capabilities:(unint64_t)a7 preferredProvider:(int64_t)a8 maximumRecordCount:(unint64_t)a9 unseen:(id)a10
{
  int64_t v81 = a8;
  *((void *)&v84 + 1) = a4;
  *(void *)&long long v84 = a5;
  id v13 = a6;
  id v83 = a10;
  id v14 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Performing call history lookup", buf, 2u);
  }

  id v15 = objc_alloc_init((Class)NSMutableArray);
  if (v84 != 0)
  {
    id v16 = +[CallHistoryDataSourcePredicate predicateForCallsAfterDate:*((void *)&v84 + 1) beforeDate:(void)v84];
    [v15 addObject:v16];
  }
  if (v13)
  {
    id v17 = [(SearchCallHistoryIntentHandler *)self dataSource];
    id v18 = [v17 contactsDataSource];
    id v19 = [(SearchCallHistoryIntentHandler *)self identifierToContactCache];
    v20 = objc_msgSend(v13, "tu_handlesMatchingPersonWithContactsDataSource:identifierToContactCache:", v18, v19);

    int v21 = +[CallHistoryDataSourcePredicate predicateForCallsWithNumberOfRemoteParticipants:1];
    [v15 addObject:v21];
    v22 = [(SearchCallHistoryIntentHandler *)self dataSource];
    [v22 coreTelephonyDataSource];
    id v24 = v23 = a3;
    id v25 = [v24 allRelevantISOCountryCodes];
    id v26 = +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:v20 isoCountryCodes:v25];

    a3 = v23;
    [v15 addObject:v26];
  }
  v82 = v13;
  if (a3)
  {
    id v27 = objc_alloc_init((Class)NSMutableArray);
    if (a3)
    {
      id v28 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:1];
      [v27 addObject:v28];
    }
    if ((a3 & 2) != 0)
    {
      id v29 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:0];
      v30 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereAnswered:0];
      unint64_t v31 = a3;
      v90[0] = v29;
      v90[1] = v30;
      id v32 = +[NSArray arrayWithObjects:v90 count:2];
      id v33 = +[NSCompoundPredicate andPredicateWithSubpredicates:v32];

      [v27 addObject:v33];
      a3 = v31;
    }
    if ((a3 & 4) != 0)
    {
      uint64_t v34 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:0];
      unint64_t v35 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereAnswered:1];
      unint64_t v36 = a3;
      v89[0] = v34;
      v89[1] = v35;
      id v37 = +[NSArray arrayWithObjects:v89 count:2];
      long long v38 = +[NSCompoundPredicate andPredicateWithSubpredicates:v37];

      [v27 addObject:v38];
      a3 = v36;
    }
    if (a3 >= 8)
    {
      long long v39 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_100030DE0(a3, v39, v40, v41, v42, v43, v44, v45);
      }
    }
    if (objc_msgSend(v27, "count", v81) == (id)1)
    {
      uint64_t v46 = [v27 firstObject];
    }
    else
    {
      if ((unint64_t)[v27 count] < 2)
      {
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v46 = +[NSCompoundPredicate orPredicateWithSubpredicates:v27];
    }
    v47 = (void *)v46;
    [v15 addObject:v46];

    goto LABEL_23;
  }
LABEL_24:
  if (!a7) {
    goto LABEL_39;
  }
  id v48 = objc_alloc_init((Class)NSMutableArray);
  if (a7)
  {
    v49 = +[CallHistoryDataSourcePredicate predicateForAudioCalls];
    [v48 addObject:v49];
  }
  if ((a7 & 2) != 0)
  {
    v50 = +[CallHistoryDataSourcePredicate predicateForVideoCalls];
    [v48 addObject:v50];
  }
  if (a7 >= 4)
  {
    v51 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_100030D74(a7, v51, v52, v53, v54, v55, v56, v57);
    }
  }
  if (objc_msgSend(v48, "count", v81) == (id)1)
  {
    uint64_t v58 = [v48 firstObject];
LABEL_37:
    v59 = (void *)v58;
    [v15 addObject:v58];

    goto LABEL_38;
  }
  if ((unint64_t)[v48 count] >= 2)
  {
    uint64_t v58 = +[NSCompoundPredicate orPredicateWithSubpredicates:v48];
    goto LABEL_37;
  }
LABEL_38:

LABEL_39:
  if (v81 == 2)
  {
    uint64_t v60 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
  }
  else
  {
    if (v81 != 1) {
      goto LABEL_44;
    }
    uint64_t v60 = +[CallHistoryDataSourcePredicate predicateForTelephonyCalls];
  }
  v61 = (void *)v60;
  objc_msgSend(v15, "addObject:", v60, v81);

LABEL_44:
  if (v83)
  {
    v62 = +[CallHistoryDataSourcePredicate predicateForCallsThatAreRead:](CallHistoryDataSourcePredicate, "predicateForCallsThatAreRead:", [v83 BOOLValue] ^ 1);
    [v15 addObject:v62];
  }
  v63 = [(SearchCallHistoryIntentHandler *)self dataSource];
  id v64 = [v63 restrictedCallTypes];

  if (v64)
  {
    v65 = +[CallHistoryDataSourcePredicate predicateFilteringOutCallTypes:v64];
    [v15 addObject:v65];
  }
  if ([v15 count] == (id)1)
  {
    uint64_t v66 = [v15 firstObject];
LABEL_52:
    v67 = (void *)v66;
    goto LABEL_54;
  }
  if ((unint64_t)[v15 count] >= 2)
  {
    uint64_t v66 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];
    goto LABEL_52;
  }
  v67 = 0;
LABEL_54:
  v68 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v67;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Using predicate: %@", buf, 0xCu);
  }

  v69 = [(SearchCallHistoryIntentHandler *)self dataSource];
  v70 = [v69 callHistoryDataSource];
  v71 = [v70 coalescedCallsWithPredicate:v67 limit:a9 offset:0 batchSize:a9];

  v72 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v71;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Call history search results: %@", buf, 0xCu);
  }

  v73 = +[CallRecordConverter sharedInstance];
  v74 = [(SearchCallHistoryIntentHandler *)self dataSource];
  v75 = [v74 contactsDataSource];
  v76 = [(SearchCallHistoryIntentHandler *)self dataSource];
  v77 = [v76 providerManager];
  v78 = [v73 callRecordsForRecentCalls:v71 withContactsDataSource:v75 withCallProviderManager:v77];

  v79 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v78;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "callRecords: %@", buf, 0xCu);
  }

  return v78;
}

- (SearchCallHistoryIntentHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSCache)identifierToContactCache
{
  return self->_identifierToContactCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToContactCache, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end