@interface RMHTTPConduit
+ (NSString)userAgent;
+ (id)_generateEnrollmentToken;
- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5;
- (BOOL)_prepareTask:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5;
- (BOOL)_prepareURLRequest:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5;
- (BOOL)_processErrorResponse:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)_processUnauthorizedResponse:(id)a3 shouldRetry:(BOOL *)a4 error:(id *)a5;
- (BOOL)_setRequestPayload:(id)a3 onURLRequest:(id)a4 error:(id *)a5;
- (BOOL)isSyncAllowed;
- (BOOL)madeChangesDuringSync;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (NSURLSession)session;
- (RMConduitDelegate)delegate;
- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4 session:(id)a5;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (id)_authenticationCredential;
- (id)_makeURLRequestWithManagementSource:(id)a3 method:(id)a4 endpoint:(id)a5;
- (id)_processResponse:(id)a3 data:(id)a4 payloadClassByStatusCode:(id)a5 shouldRetry:(BOOL *)a6 error:(id *)a7;
- (id)statusItemsToImplicitlySubscribeTo;
- (id)statusItemsToSendDuringEnrollment;
- (signed)errorState;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_didFinishEnrollingWithResponsePayload:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_didFinishFetchingDeclarationItems:(id)a3 response:(id)a4 error:(id)a5 lastReceivedPushTimestamp:(id)a6 completionHandler:(id)a7;
- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9;
- (void)_didFinishFetchingServerTokens:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_didFinishSendingStatusWithResponse:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_didFinishUnenrollingToldRemote:(BOOL)a3 completionHandler:(id)a4;
- (void)_didReceiveEnrollReferralWithOriginalRequest:(id)a3 responsePayload:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3;
- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6;
- (void)_resumeEnrollmentTaskForRequest:(id)a3 enrollmentToken:(id)a4 completionHandler:(id)a5;
- (void)_resumeTaskForRequest:(id)a3 enrollmentToken:(id)a4 expectedResponseClassByStatusCode:(id)a5 completionHandler:(id)a6;
- (void)_setBody:(id)a3 onURLRequest:(id)a4;
- (void)_startObservers;
- (void)_stopObservers;
- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4;
- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMadeChangesDuringSync:(BOOL)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)setSession:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMHTTPConduit

+ (NSString)userAgent
{
  if (qword_1000DB170 != -1) {
    dispatch_once(&qword_1000DB170, &stru_1000C5C70);
  }
  v2 = (void *)qword_1000DB168;

  return (NSString *)v2;
}

- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  v9 = +[NSURLSession sessionWithConfiguration:v8 delegate:self delegateQueue:0];

  v10 = [(RMHTTPConduit *)self initWithManagementSourceObjectID:v7 inContext:v6 session:v9];
  return v10;
}

- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RMHTTPConduit;
  v12 = [(RMHTTPConduit *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_session, a5);
  }

  return v13;
}

- (void)startWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: starting", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[RMLog httpConduit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10003E3F0();
  }

  [(RMHTTPConduit *)self context];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035AAC;
  v8[3] = &unk_1000C5100;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  id v10 = self;
  [v7 performBlockAndWait:v8];
  v4[2](v4);

  os_activity_scope_leave(&state);
}

- (void)_startObservers
{
  id v6 = [(RMHTTPConduit *)self context];
  v3 = [v6 transactionAuthor];
  v4 = [[RMPersistentHistoryNotifier alloc] initWithContext:v6];
  [(RMPersistentHistoryNotifier *)v4 setDelegate:self];
  v5 = +[NSSet setWithObject:v3];
  [(RMPersistentHistoryNotifier *)v4 setIgnoredTransactionAuthors:v5];

  [(RMHTTPConduit *)self setPersistentHistoryNotifier:v4];
  [(RMPersistentHistoryNotifier *)v4 start];
}

- (void)_stopObservers
{
  v3 = [(RMHTTPConduit *)self persistentHistoryNotifier];
  [v3 setDelegate:0];

  [(RMHTTPConduit *)self setPersistentHistoryNotifier:0];
}

- (signed)errorState
{
  v2 = self;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  __int16 v12 = 0;
  [(RMHTTPConduit *)self context];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100035DA0;
  v5[3] = &unk_1000C4E08;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  id v7 = v2;
  v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOWORD(v2) = *((_WORD *)v10 + 12);

  _Block_object_dispose(&v9, 8);
  return (__int16)v2;
}

- (id)statusItemsToImplicitlySubscribeTo
{
  v5[0] = RMModelStatusItemManagementClientCapabilities;
  v5[1] = RMModelStatusItemManagementDeclarations;
  v5[2] = RMModelStatusItemManagementPushToken;
  v2 = +[NSArray arrayWithObjects:v5 count:3];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)statusItemsToSendDuringEnrollment
{
  id v3 = +[NSMutableArray arrayWithCapacity:2];
  [v3 addObject:RMModelStatusItemManagementClientCapabilities];
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  [(RMHTTPConduit *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036078;
  v7[3] = &unk_1000C4E08;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  uint64_t v9 = self;
  id v10 = &v11;
  [v4 performBlockAndWait:v7];
  if (*((unsigned char *)v12 + 24))
  {
    [v3 addObject:RMModelStatusItemDeviceSerialNumber];
    [v3 addObject:RMModelStatusItemDeviceUDID];
  }
  v5 = +[NSSet setWithArray:v3];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: enrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = +[RMLog httpConduit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10003E48C();
  }

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10003648C;
  v40 = sub_10003649C;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10003648C;
  v34 = sub_10003649C;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10003648C;
  v28 = sub_10003649C;
  id v29 = 0;
  [(RMHTTPConduit *)self context];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000364A4;
  v18[3] = &unk_1000C5C98;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v10;
  v20 = self;
  v21 = &v36;
  v22 = &v30;
  v23 = &v24;
  [v10 performBlockAndWait:v18];
  if (v37[5])
  {
    v7[2](v7);
  }
  else
  {
    uint64_t v11 = v25[5];
    __int16 v12 = +[RMModelAnyPayload buildFromDictionary:v6];
    uint64_t v13 = +[RMProtocolEnrollRequest requestWithEnrollmentToken:v11 statusItems:v12];

    uint64_t v14 = v31[5];
    id v17 = 0;
    LOBYTE(v11) = [(RMHTTPConduit *)self _setRequestPayload:v13 onURLRequest:v14 error:&v17];
    id v15 = v17;
    if (v11)
    {
      [(RMHTTPConduit *)self _resumeEnrollmentTaskForRequest:v31[5] enrollmentToken:v25[5] completionHandler:v7];
    }
    else
    {
      v16 = +[RMLog httpConduit];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_10003E424();
      }

      ((void (*)(void (**)(void), id))v7[2])(v7, v15);
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  os_activity_scope_leave(&state);
}

+ (id)_generateEnrollmentToken
{
  v2 = objc_opt_new();
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)_resumeEnrollmentTaskForRequest:(id)a3 enrollmentToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17[0] = &off_1000CAC38;
  id v10 = a4;
  v17[1] = &off_1000CAC50;
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100036848;
  v14[3] = &unk_1000C5CC0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(RMHTTPConduit *)self _resumeTaskForRequest:v13 enrollmentToken:v10 expectedResponseClassByStatusCode:v11 completionHandler:v14];
}

- (void)_didReceiveEnrollReferralWithOriginalRequest:(id)a3 responsePayload:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v35 = a3;
  id v12 = a4;
  id v34 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, id))a7;
  id v15 = +[RMLog httpConduit];
  id v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003E5F8();
    }

    v14[2](v14, v13);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10003E5C4();
    }

    uint64_t v32 = [v12 responseReferralBaseURL];
    if (v32)
    {
      v33 = +[NSURL URLWithString:](NSURL, "URLWithString:");
      if (v33)
      {
        [(RMHTTPConduit *)self context];
        uint64_t v59 = 0;
        v60 = &v59;
        uint64_t v61 = 0x3032000000;
        v62 = sub_10003648C;
        v63 = sub_10003649C;
        id v64 = 0;
        uint64_t v53 = 0;
        v54 = &v53;
        uint64_t v55 = 0x3032000000;
        v56 = sub_10003648C;
        v57 = sub_10003649C;
        id v58 = 0;
        uint64_t v47 = 0;
        v48 = &v47;
        uint64_t v49 = 0x3032000000;
        v50 = sub_10003648C;
        v51 = sub_10003649C;
        id v52 = 0;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_100036E58;
        v40[3] = &unk_1000C5CE8;
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = self;
        v44 = &v59;
        id v43 = v33;
        v45 = &v47;
        v46 = &v53;
        id v30 = v41;
        [v41 performBlockAndWait:v40];
        if (v60[5])
        {
          ((void (*)(void (**)(id, id)))v14[2])(v14);
        }
        else
        {
          id v19 = [v35 URL];
          v20 = [v19 pathComponents];

          v21 = (char *)[v20 count];
          if ((unint64_t)v21 >= 2)
          {
            uint64_t v22 = objc_msgSend(v20, "subarrayWithRange:", v21 - 2, 2);

            v20 = (void *)v22;
          }
          id v23 = (id)v48[5];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v24 = v20;
          id v25 = [v24 countByEnumeratingWithState:&v36 objects:v65 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v37;
            do
            {
              v27 = 0;
              v28 = v23;
              do
              {
                if (*(void *)v37 != v26) {
                  objc_enumerationMutation(v24);
                }
                id v23 = [v28 URLByAppendingPathComponent:*(void *)(*((void *)&v36 + 1) + 8 * (void)v27) isDirectory:0];

                v27 = (char *)v27 + 1;
                v28 = v23;
              }
              while (v25 != v27);
              id v25 = [v24 countByEnumeratingWithState:&v36 objects:v65 count:16];
            }
            while (v25);
          }

          id v29 = [v35 mutableCopy];
          [v29 setURL:v23];
          [(RMHTTPConduit *)self _resumeEnrollmentTaskForRequest:v29 enrollmentToken:v54[5] completionHandler:v14];
        }
        _Block_object_dispose(&v47, 8);

        _Block_object_dispose(&v53, 8);
        _Block_object_dispose(&v59, 8);
      }
      else
      {
        v18 = +[RMLog httpConduit];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10003E55C();
        }

        v31 = +[RMErrorUtilities createCouldNotParseURLErrorWithString:v32];
        v14[2](v14, v31);
      }
    }
    else
    {
      id v17 = +[RMLog httpConduit];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003E528();
      }

      v33 = +[RMErrorUtilities createMissingReferralURLError];
      v14[2](v14, v33);
    }
  }
}

- (void)_didFinishEnrollingWithResponsePayload:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  if (v12)
  {
    uint64_t v14 = +[RMLog httpConduit];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003E730();
    }

    v13[2](v13, v12);
  }
  else
  {
    if (v10)
    {
      [(RMHTTPConduit *)self context];
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x3032000000;
      v23[3] = sub_10003648C;
      v23[4] = sub_10003649C;
      id v24 = 0;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      void v17[2] = sub_100037300;
      v17[3] = &unk_1000C5D10;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = v15;
      id v19 = self;
      id v20 = v10;
      uint64_t v22 = v23;
      id v21 = v11;
      [v15 performBlockAndWait:v17];
      ((void (*)(void (**)(id, id)))v13[2])(v13);

      _Block_object_dispose(v23, 8);
    }
    else
    {
      id v16 = +[RMLog httpConduit];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003E6FC();
      }

      id v15 = +[RMErrorUtilities createInternalError];
      v13[2](v13, v15);
    }
  }
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: unenrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[RMLog httpConduit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10003E798();
  }

  [(RMHTTPConduit *)self _stopObservers];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10003648C;
  v27 = sub_10003649C;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10003648C;
  id v21 = sub_10003649C;
  id v22 = 0;
  [(RMHTTPConduit *)self context];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100037838;
  v12[3] = &unk_1000C5468;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = &v23;
  id v16 = &v17;
  [v7 performBlockAndWait:v12];
  uint64_t v8 = v24[5];
  if (v8)
  {
    uint64_t v9 = v18[5];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100037928;
    v10[3] = &unk_1000C5D38;
    v10[4] = self;
    id v11 = v4;
    [(RMHTTPConduit *)self _resumeTaskForRequest:v8 enrollmentToken:v9 expectedResponseClassByStatusCode:0 completionHandler:v10];
  }
  else
  {
    [(RMHTTPConduit *)self _didFinishUnenrollingToldRemote:0 completionHandler:v4];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishUnenrollingToldRemote:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  id v7 = [(RMHTTPConduit *)self session];
  [v7 finishTasksAndInvalidate];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10003648C;
  v13[4] = sub_10003649C;
  id v14 = 0;
  [(RMHTTPConduit *)self context];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100037BB4;
  v9[3] = &unk_1000C4E08;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v8;
  id v11 = self;
  id v12 = v13;
  [v8 performBlockAndWait:v9];
  v6[2](v6, v4);

  _Block_object_dispose(v13, 8);
}

- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: fetching server tokens", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[RMLog httpConduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003E868();
  }

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_10003648C;
  uint64_t v32 = sub_10003649C;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_10003648C;
  uint64_t v26 = sub_10003649C;
  id v27 = 0;
  [(RMHTTPConduit *)self context];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100038054;
  v16[3] = &unk_1000C5D60;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v9;
  id v18 = self;
  BOOL v21 = a3;
  uint64_t v19 = &v22;
  id v20 = &v28;
  [v9 performBlockAndWait:v16];
  uint64_t v10 = v29[5];
  if (v10)
  {
    uint64_t v11 = v23[5];
    id v35 = &off_1000CAC38;
    uint64_t v36 = objc_opt_class();
    id v12 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003828C;
    v14[3] = &unk_1000C5D38;
    v14[4] = self;
    id v15 = v6;
    [(RMHTTPConduit *)self _resumeTaskForRequest:v10 enrollmentToken:v11 expectedResponseClassByStatusCode:v12 completionHandler:v14];
  }
  else
  {
    id v13 = +[RMLog httpConduit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10003E834();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingServerTokens:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  if (v12)
  {
    id v14 = +[RMLog httpConduit];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003E904();
    }

    v13[2](v13, v12);
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = sub_10003648C;
    id v27 = sub_10003649C;
    id v28 = 0;
    [(RMHTTPConduit *)self context];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    void v18[2] = sub_1000384E0;
    v18[3] = &unk_1000C5D88;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = v15;
    id v20 = self;
    id v21 = v10;
    uint64_t v22 = &v23;
    [v15 performBlockAndWait:v18];
    if (v24[5])
    {
      ((void (*)(void (**)(id, id)))v13[2])(v13);
    }
    else
    {
      id v16 = +[RMLog httpConduit];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Successfully saved server tokens", (uint8_t *)v17, 2u);
      }

      v13[2](v13, 0);
    }

    _Block_object_dispose(&v23, 8);
  }
}

- (BOOL)isSyncAllowed
{
  v2 = self;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  [(RMHTTPConduit *)self context];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000387A8;
  void v5[3] = &unk_1000C4E08;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOBYTE(v2) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: syncing only if needed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[RMLog httpConduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003E9D4(v4, v8, v9, v10, v11, v12, v13, v14);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100038B5C;
  v31[3] = &unk_1000C5890;
  id v15 = (id)objc_opt_new();
  id v32 = v15;
  id v16 = objc_retainBlock(v31);
  [(RMHTTPConduit *)self setMadeChangesDuringSync:0];
  id v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100038BE0;
  v26[3] = &unk_1000C5E00;
  id v18 = v16;
  id v29 = v18;
  id v19 = v17;
  id v27 = v19;
  id v28 = self;
  BOOL v30 = v4;
  [(RMHTTPConduit *)self _fetchTokensOnlyIfNeeded:v4 completionHandler:v26];
  id v20 = dispatch_get_global_queue(21, 0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100038DC8;
  v23[3] = &unk_1000C5E28;
  id v24 = v15;
  id v25 = v6;
  v23[4] = self;
  id v21 = v15;
  id v22 = v6;
  dispatch_group_notify(v19, v20, v23);

  os_activity_scope_leave(&state);
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
  id v11 = 0;
  id v6 = a4;
  id v7 = +[RMProtocolPushMessage loadData:a3 serializationType:1 error:&v11];
  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = [v7 messageSyncTokens];
    [(RMHTTPConduit *)self _updateWithSyncTokens:v9 completionHandler:v6];

    id v6 = (id)v9;
  }
  else
  {
    uint64_t v10 = +[RMLog httpConduit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003EA58();
    }

    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  id v13 = 0;
  uint64_t v8 = +[RMProtocolTokensResponse loadData:v6 serializationType:1 error:&v13];
  id v9 = v13;
  uint64_t v10 = v9;
  if (v8)
  {

    uint64_t v10 = (void *)v8;
LABEL_5:
    id v11 = [v10 responseSyncTokens];
    [(RMHTTPConduit *)self _updateWithSyncTokens:v11 completionHandler:v7];

    goto LABEL_9;
  }
  uint64_t v12 = +[RMLog httpConduit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10003EAC0();
  }

  v7[2](v7, v10);
LABEL_9:
}

- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10003648C;
  id v19 = sub_10003649C;
  id v20 = 0;
  [(RMHTTPConduit *)self context];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003921C;
  v10[3] = &unk_1000C5D88;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v8;
  uint64_t v12 = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v15;
  [v8 performBlockAndWait:v10];
  v7[2](v7, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: fetching declaration items", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[RMLog httpConduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003EB5C();
  }

  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10003648C;
  uint64_t v36 = sub_10003649C;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10003648C;
  BOOL v30 = sub_10003649C;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10003648C;
  v24[4] = sub_10003649C;
  id v25 = 0;
  [(RMHTTPConduit *)self context];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_100039740;
  v17[3] = &unk_1000C5E50;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v9;
  id v19 = self;
  BOOL v23 = a3;
  id v20 = &v26;
  id v21 = v24;
  id v22 = &v32;
  [v9 performBlockAndWait:v17];
  uint64_t v10 = v33[5];
  if (v10)
  {
    uint64_t v11 = v27[5];
    long long v39 = &off_1000CAC38;
    uint64_t v40 = objc_opt_class();
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003998C;
    v14[3] = &unk_1000C5E78;
    v14[4] = self;
    id v16 = v24;
    id v15 = v6;
    [(RMHTTPConduit *)self _resumeTaskForRequest:v10 enrollmentToken:v11 expectedResponseClassByStatusCode:v12 completionHandler:v14];
  }
  else
  {
    id v13 = +[RMLog httpConduit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10003EB28();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingDeclarationItems:(id)a3 response:(id)a4 error:(id)a5 lastReceivedPushTimestamp:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id))a7;
  if (v14)
  {
    uint64_t v17 = +[RMLog httpConduit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003EBC4();
    }

    v16[2](v16, v14);
  }
  else
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = sub_10003648C;
    BOOL v30 = sub_10003649C;
    id v31 = 0;
    [(RMHTTPConduit *)self context];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100039BFC;
    v21[3] = &unk_1000C5D88;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v18;
    BOOL v23 = self;
    id v24 = v12;
    id v25 = &v26;
    [v18 performBlockAndWait:v21];
    if (v27[5])
    {
      ((void (*)(void (**)(id, id)))v16[2])(v16);
    }
    else
    {
      id v19 = +[RMLog httpConduit];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Successfully saved partial object", (uint8_t *)v20, 2u);
      }

      v16[2](v16, 0);
    }

    _Block_object_dispose(&v26, 8);
  }
}

- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6
{
  id v9 = a3;
  id v40 = a4;
  id v10 = a6;
  long long v39 = self;
  uint64_t v11 = [(RMHTTPConduit *)self managementSourceObjectID];
  long long v38 = v9;
  id v12 = [v9 objectWithID:v11];

  id v37 = v12;
  id v35 = v10;
  id v13 = [v12 valueForKey:v10];
  id v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v13 count]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v13;
  id v15 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v20 = [v19 identifier];
        id v21 = [v19 serverToken];
        id v22 = +[NSString stringWithFormat:@"%@-%@", v20, v21];
        [v14 setObject:v19 forKeyedSubscript:v22];
      }
      id v16 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v16);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v41 = v40;
  id v23 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v41);
        }
        id v27 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
        uint64_t v28 = [v27 responseIdentifier];
        id v29 = [v27 responseServerToken];
        BOOL v30 = +[NSString stringWithFormat:@"%@-%@", v28, v29];
        uint64_t v31 = [v14 objectForKeyedSubscript:v30];
        if (v31)
        {
          id v32 = (id)v31;
          [v14 removeObjectForKey:v30];
        }
        else
        {
          id v32 = [[a5 alloc] initWithContext:v38];
          [v32 setIdentifier:v28];
          [v32 setServerToken:v29];
          [v32 setManagementSource:v37];
          [(RMHTTPConduit *)v39 setMadeChangesDuringSync:1];
        }
      }
      id v24 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v24);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10003A28C;
  v43[3] = &unk_1000C5EA0;
  v43[4] = v39;
  id v33 = v38;
  id v44 = v33;
  [v14 enumerateKeysAndObjectsUsingBlock:v43];
}

- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = RMProtocolEndpointDeclarationActivation;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A430;
  v8[3] = &unk_1000C5DB0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(RMHTTPConduit *)self _fetchNextObjectOfClass:v5 endpoint:v6 completionHandler:v8];
}

- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: fetching next object from server", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = +[RMLog httpConduit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromClass(a3);
    sub_10003EE30(v12, v57, v11);
  }

  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  long long v50 = sub_10003648C;
  long long v51 = sub_10003649C;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = sub_10003648C;
  long long v45 = sub_10003649C;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_10003648C;
  long long v39 = sub_10003649C;
  id v40 = 0;
  [(RMHTTPConduit *)self context];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003AB14;
  v27[3] = &unk_1000C5EF0;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v28 = v13;
  id v29 = self;
  Class v34 = a3;
  uint64_t v31 = &v35;
  id v14 = v8;
  id v30 = v14;
  id v32 = &v41;
  id v33 = &v47;
  [v13 performBlockAndWait:v27];
  uint64_t v15 = v48[5];
  if (!v15)
  {
    id v18 = +[RMLog httpConduit];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = NSStringFromClass(a3);
      sub_10003ED64(v19, buf, v18);
    }
    goto LABEL_10;
  }
  if (!v36[5])
  {
    id v18 = +[RMLog httpConduit];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromClass(a3);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = [(RMHTTPConduit *)self managementSourceObjectID];
      sub_10003EDBC(v20, v21, buf, v18);
    }
LABEL_10:

    v9[2](v9, 0);
    goto LABEL_11;
  }
  uint64_t v16 = v42[5];
  v54 = &off_1000CAC38;
  uint64_t v55 = objc_opt_class();
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003AD48;
  v22[3] = &unk_1000C5F18;
  v22[4] = self;
  uint64_t v25 = &v35;
  Class v26 = a3;
  id v23 = v14;
  id v24 = v9;
  [(RMHTTPConduit *)self _resumeTaskForRequest:v15 enrollmentToken:v16 expectedResponseClassByStatusCode:v17 completionHandler:v22];

LABEL_11:
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(void))a9;
  id v21 = [v18 statusCode];
  if (v21 == (id)200 || !v19 || v21 == (id)404)
  {
    Class v26 = a5;
    *(void *)uint64_t v37 = 0;
    *(void *)&v37[8] = v37;
    *(void *)&v37[16] = 0x3032000000;
    long long v38 = sub_10003648C;
    long long v39 = sub_10003649C;
    id v40 = 0;
    [(RMHTTPConduit *)self context];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003B0C8;
    v28[3] = &unk_1000C5F40;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v23;
    id v30 = self;
    id v31 = v16;
    id v32 = v19;
    id v24 = v17;
    id v33 = v24;
    id v34 = v15;
    id v35 = v18;
    uint64_t v36 = v37;
    [v23 performBlockAndWait:v28];
    if (*(void *)(*(void *)&v37[8] + 40))
    {
      v20[2](v20);
    }
    else
    {
      uint64_t v25 = +[RMLog httpConduit];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Successfully saved object, fetching next one", buf, 2u);
      }

      [(RMHTTPConduit *)self _fetchNextObjectOfClass:v26 endpoint:v24 completionHandler:v20];
    }

    _Block_object_dispose(v37, 8);
  }
  else
  {
    id v22 = +[RMLog httpConduit];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v37 = 138543874;
      *(void *)&v37[4] = v16;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v17;
      *(_WORD *)&v37[22] = 2114;
      long long v38 = (uint64_t (*)(uint64_t, uint64_t))v19;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error while fetching object %{public}@ (%{public}@): %{public}@", v37, 0x20u);
    }

    ((void (*)(void (**)(void), id))v20[2])(v20, v19);
  }
}

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "HTTPConduit: sending status", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = +[RMLog httpConduit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10003F014();
  }

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10003648C;
  id v31 = sub_10003649C;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10003648C;
  uint64_t v25 = sub_10003649C;
  id v26 = 0;
  [(RMHTTPConduit *)self context];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003B72C;
  v16[3] = &unk_1000C5468;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v10;
  id v18 = self;
  id v19 = &v21;
  id v20 = &v27;
  [v10 performBlockAndWait:v16];
  if (v28[5])
  {
    -[RMHTTPConduit _setBody:onURLRequest:](self, "_setBody:onURLRequest:", v6);
    uint64_t v11 = v28[5];
    uint64_t v12 = v22[5];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003B810;
    v14[3] = &unk_1000C5D38;
    v14[4] = self;
    id v15 = v7;
    [(RMHTTPConduit *)self _resumeTaskForRequest:v11 enrollmentToken:v12 expectedResponseClassByStatusCode:0 completionHandler:v14];
  }
  else
  {
    id v13 = +[RMErrorUtilities createInternalError];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  os_activity_scope_leave(&state);
}

- (void)_didFinishSendingStatusWithResponse:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (v9)
  {
    uint64_t v11 = +[RMLog httpConduit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003F048();
    }

    v10[2](v10, v9);
  }
  else
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = sub_10003648C;
    uint64_t v23 = sub_10003649C;
    id v24 = 0;
    [(RMHTTPConduit *)self context];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003BA30;
    v15[3] = &unk_1000C4E08;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v12;
    id v17 = self;
    id v18 = &v19;
    [v12 performBlockAndWait:v15];
    if (v20[5])
    {
      ((void (*)(void (**)(id, id)))v10[2])(v10);
    }
    else
    {
      id v13 = +[RMLog httpConduit];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        __int16 v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Successfully sent status", (uint8_t *)&v14, 2u);
      }

      v10[2](v10, 0);
    }

    _Block_object_dispose(&v19, 8);
  }
}

- (id)_processResponse:(id)a3 data:(id)a4 payloadClassByStatusCode:(id)a5 shouldRetry:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (char *)[v12 statusCode];
  id v16 = +[RMLog httpConduit];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    long long v50 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Got back from HTTP: %ld", buf, 0xCu);
  }

  if ([v12 statusCode] == (id)401
    && ![(RMHTTPConduit *)self _processUnauthorizedResponse:v12 shouldRetry:a6 error:a7])
  {
    goto LABEL_34;
  }
  id v17 = +[NSNumber numberWithInteger:v15];
  id v18 = [v14 objectForKey:v17];

  if (v15 == (char *)204)
  {
    if (!v14 || v18 == (id)objc_opt_class()) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if ((unint64_t)(v15 - 400) <= 0xC7)
  {
    id v48 = 0;
    unsigned __int8 v19 = [(RMHTTPConduit *)self _processErrorResponse:v12 data:v13 error:&v48];
    id v20 = v48;
    uint64_t v21 = v20;
    if ((v19 & 1) == 0)
    {
      if (!a7 || !v20) {
        goto LABEL_33;
      }
LABEL_27:
      *a7 = v21;
LABEL_33:

LABEL_34:
      id v34 = 0;
      goto LABEL_35;
    }
    if (v13)
    {
      id v22 = [v13 base64EncodedStringWithOptions:0];
      if (!a7) {
        goto LABEL_32;
      }
    }
    else
    {
      id v22 = @"Empty Response Body";
      if (!a7)
      {
LABEL_32:

        goto LABEL_33;
      }
    }
    uint64_t v36 = +[RMErrorUtilities createHTTPErrorWithStatusCode:v15 reason:v22];
    uint64_t v37 = v36;
    if (v36) {
      *a7 = v36;
    }

    goto LABEL_32;
  }
  if (!v14)
  {
LABEL_20:
    id v34 = +[RMModelAnyPayload buildFromDictionary:&__NSDictionary0__struct];
    goto LABEL_35;
  }
  if (v18)
  {
    uint64_t v47 = [v12 allHeaderFields];
    uint64_t v23 = [v47 objectForKeyedSubscript:@"Content-Type"];
    id v24 = @"text/html";
    id v46 = (void *)v23;
    if (v23) {
      id v24 = (__CFString *)v23;
    }
    uint64_t v25 = v24;
    id v26 = (char *)[(__CFString *)v25 rangeOfString:@";"];
    if (v27)
    {
      id v28 = v26;
      uint64_t v29 = v27;
      id v30 = [(__CFString *)v25 substringToIndex:v26];
      id v31 = &v28[v29];
      id v32 = v30;
      id v33 = [(__CFString *)v25 substringFromIndex:v31];
    }
    else
    {
      id v32 = v25;
      id v33 = 0;
    }

    long long v39 = v32;
    id v40 = (char *)v33;

    if (v13
      && ([(__CFString *)v39 isEqualToString:@"application/json"] & 1) == 0)
    {
      unsigned int v42 = [(RMHTTPConduit *)self _incrementConduitStateError:2 serverRetryAfter:0 error:a7];
      id v34 = 0;
      if (a7 && v42)
      {
        uint64_t v43 = +[RMErrorUtilities createUnhandledContentTypeErrorWithContentType:v39];
        id v44 = v43;
        if (v43) {
          *a7 = v43;
        }

        id v34 = 0;
      }
    }
    else
    {
      if ([v40 length])
      {
        uint64_t v41 = +[RMLog httpConduit];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          long long v50 = v40;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Unused Content-Type parameter: %{public}@", buf, 0xCu);
        }
      }
      if (v13)
      {
        id v34 = [v18 loadData:v13 serializationType:1 error:a7];
      }
      else
      {
        long long v45 = objc_opt_new();
        id v34 = [v18 loadData:v45 serializationType:1 error:a7];
      }
    }

    goto LABEL_35;
  }
LABEL_21:
  unsigned int v35 = [(RMHTTPConduit *)self _incrementConduitStateError:2 serverRetryAfter:0 error:a7];
  id v34 = 0;
  if (a7 && v35)
  {
    uint64_t v21 = +[RMErrorUtilities createHTTPErrorWithStatusCode:reason:](RMErrorUtilities, "createHTTPErrorWithStatusCode:reason:", [v12 statusCode], @"Unexpected status code");
    if (!v21) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
LABEL_35:

  return v34;
}

- (BOOL)_processUnauthorizedResponse:(id)a3 shouldRetry:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 allHeaderFields];
  id v10 = [v9 objectForKeyedSubscript:@"WWW-Authenticate"];

  uint64_t v11 = +[RMLog httpConduit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10003F1B4();
  }

  id v12 = +[NSCharacterSet characterSetWithCharactersInString:@", "];
  id v13 = [v10 componentsSeparatedByCharactersInSet:v12];

  id v14 = +[RMLog httpConduit];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10003F14C();
  }

  if (([v13 containsObject:RMAuthenticationSchemeTest] & 1) != 0
    || ([v13 containsObject:RMAuthenticationSchemeBearer] & 1) != 0
    || [v13 containsObject:RMAuthenticationSchemeMAID])
  {
    id v15 = +[RMLog httpConduit];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10003F118();
    }

    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    id v30 = sub_10003648C;
    id v31 = sub_10003649C;
    id v32 = 0;
    [(RMHTTPConduit *)self context];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10003C344;
    v22[3] = &unk_1000C5D88;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v16;
    id v24 = self;
    id v25 = v13;
    id v26 = &v27;
    [v16 performBlockAndWait:v22];
    id v17 = (void *)v28[5];
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
    }
    else
    {
      *a4 = 1;
    }

    _Block_object_dispose(&v27, 8);
  }
  else if (a5)
  {
    unsigned __int8 v19 = [v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v20 = [v19 componentsJoinedByString:@", "];

    uint64_t v21 = +[RMErrorUtilities createUnsupportedAuthenticationSchemeErrorWithScheme:v20];

    if (v21) {
      *a5 = v21;
    }
  }
  return 0;
}

- (BOOL)_processErrorResponse:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 allHeaderFields];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"Content-Type"];
  id v12 = (void *)v11;
  id v13 = @"text/html";
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  id v14 = v13;
  id v15 = (char *)[(__CFString *)v14 rangeOfString:@";"];
  if (v16)
  {
    id v17 = v15;
    uint64_t v18 = v16;
    unsigned __int8 v19 = [(__CFString *)v14 substringToIndex:v15];
    id v20 = [(__CFString *)v14 substringFromIndex:&v17[v18]];
  }
  else
  {
    unsigned __int8 v19 = v14;
    id v20 = 0;
  }

  uint64_t v21 = v19;
  id v22 = v20;

  if (v9 && ![(__CFString *)v21 isEqualToString:@"application/json"])
  {
    id v25 = 0;
    goto LABEL_23;
  }
  if ([v22 length])
  {
    id v23 = +[RMLog httpConduit];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v41 = 138543362;
      *(void *)&v41[4] = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Unused Content-Type parameter: %{public}@", v41, 0xCu);
    }
  }
  id v24 = v9;
  if (!v9) {
    id v24 = objc_opt_new();
  }
  *(void *)uint64_t v41 = 0;
  id v25 = +[RMProtocolErrorResponse loadData:v24 serializationType:1 error:v41];
  id v26 = *(id *)v41;
  if (v9)
  {
    if (!v25) {
      goto LABEL_19;
    }
  }
  else
  {

    if (!v25)
    {
LABEL_19:
      uint64_t v27 = +[RMLog httpConduit];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10003F4E8();
      }
    }
  }

LABEL_23:
  id v28 = [v25 responseCode];
  uint64_t v29 = (uint64_t)[v8 statusCode];
  id v30 = 0;
  uint64_t v31 = 2;
  if (v29 > 409)
  {
    if (v29 == 410)
    {
      id v30 = 0;
      BOOL v32 = [v28 isEqualToString:RMProtocolErrorResponse_Code_enrollmentNotAllowed] == 0;
      unsigned int v33 = 4;
LABEL_38:
      if (v32) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = v33;
      }
      goto LABEL_46;
    }
    if (v29 == 503)
    {
      id v34 = objc_msgSend(v8, "allHeaderFields", 2);
      unsigned int v35 = [v34 objectForKeyedSubscript:@"Retry-After"];

      if (v35)
      {
        uint64_t v36 = objc_opt_new();
        id v37 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
        [v36 setLocale:v37];

        [v36 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];
        id v30 = [v36 dateFromString:v35];
        if (!v30)
        {
          uint64_t v38 = (uint64_t)[v35 integerValue];
          if (v38 < 1)
          {
            id v30 = 0;
          }
          else
          {
            id v30 = +[NSDate dateWithTimeIntervalSinceNow:(double)v38];
          }
        }
      }
      else
      {
        id v30 = 0;
      }

      uint64_t v31 = 3;
    }
  }
  else
  {
    if (v29 != 403)
    {
      if (v29 != 404) {
        goto LABEL_46;
      }
      id v30 = 0;
      BOOL v32 = [v28 isEqualToString:RMProtocolErrorResponse_Code_enrollmentTokenInvalid] == 0;
      unsigned int v33 = 5;
      goto LABEL_38;
    }
    if (([v28 isEqualToString:RMProtocolErrorResponse_Code_clientVersionInvalid] & 1) != 0
      || ([v28 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthInvalid] & 1) != 0
      || [v28 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthMissing])
    {
      id v30 = 0;
      uint64_t v31 = 1;
    }
    else
    {
      id v30 = 0;
      uint64_t v31 = 2;
    }
  }
LABEL_46:
  BOOL v39 = [(RMHTTPConduit *)self _incrementConduitStateError:v31 serverRetryAfter:v30 error:a5];

  return v39;
}

- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10003648C;
  id v23 = sub_10003649C;
  id v24 = 0;
  [(RMHTTPConduit *)self context];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003CCFC;
  v13[3] = &unk_1000C5F68;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v9;
  id v15 = self;
  signed __int16 v18 = a3;
  id v10 = v8;
  id v16 = v10;
  id v17 = &v19;
  [v9 performBlockAndWait:v13];
  uint64_t v11 = (void *)v20[5];
  if (a5 && v11) {
    *a5 = v11;
  }

  _Block_object_dispose(&v19, 8);
  return v11 == 0;
}

- (id)_makeURLRequestWithManagementSource:(id)a3 method:(id)a4 endpoint:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 conduitConfig];
  uint64_t v11 = [v10 state];
  id v12 = [v11 enrollmentToken];
  unsigned int v13 = [v9 enrollmentType];

  id v14 = (id *)&RMProtocolChannelUser;
  if (v13) {
    id v14 = (id *)&RMProtocolChannelDevice;
  }
  id v15 = *v14;
  id v16 = [v11 referralBaseURL];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v11 baseURL];
  }
  uint64_t v19 = v18;

  id v20 = [v7 stringByReplacingOccurrencesOfString:@"{channel}" withString:v15];

  if (v12)
  {
    uint64_t v21 = [v20 stringByReplacingOccurrencesOfString:@"{enrollmenttoken}" withString:v12];

    id v20 = (void *)v21;
  }
  id v22 = [v19 URLByAppendingPathComponent:v20];
  id v23 = +[NSMutableURLRequest requestWithURL:v22 cachePolicy:0 timeoutInterval:30.0];
  [v23 setHTTPMethod:v8];

  id v24 = +[RMHTTPConduit userAgent];
  [v23 setValue:v24 forHTTPHeaderField:@"User-Agent"];

  [v23 setValue:@"application/json" forHTTPHeaderField:@"Accept"];

  return v23;
}

- (id)_authenticationCredential
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10003648C;
  id v26 = sub_10003649C;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10003648C;
  id v20 = sub_10003649C;
  id v21 = 0;
  [(RMHTTPConduit *)self context];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10003D27C;
  uint64_t v11 = &unk_1000C5468;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v3;
  unsigned int v13 = self;
  id v14 = &v16;
  id v15 = &v22;
  [v3 performBlockAndWait:&v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_msgSend((id)v23[5], "authenticationScheme", v8, v9, v10, v11);
    uint64_t v5 = (void *)v17[5];
    if (v5 != v4 && (!v4 || ![v5 isEqualToString:v4]))
    {
      id v6 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = 0;
    id v6 = 0;
    if (v17[5]) {
      goto LABEL_8;
    }
  }
  id v6 = (id)v23[5];
LABEL_8:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v6;
}

- (BOOL)_prepareURLRequest:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  id v10 = [v9 UUIDString];
  [v7 setValue:v10 forHTTPHeaderField:@"X-Apple-Request-UUID"];

  uint64_t v11 = +[RMLog httpConduit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10003F5B8(v7);
  }

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_6;
  }
  id v19 = 0;
  unsigned __int8 v12 = [v8 prepareURLRequest:v7 error:&v19];
  id v13 = v19;
  id v14 = v13;
  if (v12)
  {

LABEL_6:
    id v14 = +[RMFeatureOverrides testOrganizationID];
    if ([v14 length])
    {
      id v15 = [v7 valueForHTTPHeaderField:@"Authorization"];
      if ([v15 length])
      {
        uint64_t v16 = [v15 stringByAppendingFormat:@", %@=\"%@\", @"test-org-id"", v14];

        [v7 setValue:v16 forHTTPHeaderField:@"Authorization"];
        id v15 = (void *)v16;
      }
    }
    BOOL v17 = 1;
    goto LABEL_11;
  }
  BOOL v17 = 0;
  if (a5 && v13)
  {
    id v14 = v13;
    BOOL v17 = 0;
    *a5 = v14;
  }
LABEL_11:

  return v17;
}

- (BOOL)_prepareTask:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 originalRequest];
  id v10 = +[RMLog httpConduit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10003F67C(v9);
  }

  if (objc_opt_respondsToSelector())
  {
    id v15 = 0;
    unsigned __int8 v11 = [v8 prepareTask:v7 error:&v15];
    id v12 = v15;
    id v13 = v12;
    if ((v11 & 1) == 0 && a5 && v12) {
      *a5 = v12;
    }
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (BOOL)_setRequestPayload:(id)a3 onURLRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_5;
  }
  id v10 = [v8 serializeAsDataWithType:1 error:a5];
  if (v10)
  {
LABEL_5:
    [(RMHTTPConduit *)self _setBody:v10 onURLRequest:v9];

    BOOL v11 = 1;
    goto LABEL_6;
  }
  BOOL v11 = 0;
LABEL_6:

  return v11;
}

- (void)_setBody:(id)a3 onURLRequest:(id)a4
{
  id v7 = a4;
  if (a3)
  {
    [v7 setHTTPBody:a3];
    CFStringRef v5 = @"application/json";
    id v6 = v7;
  }
  else
  {
    [v7 setHTTPBody:0];
    id v6 = v7;
    CFStringRef v5 = 0;
  }
  [v6 setValue:v5 forHTTPHeaderField:@"Content-Type"];
}

- (void)_resumeTaskForRequest:(id)a3 enrollmentToken:(id)a4 expectedResponseClassByStatusCode:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(RMHTTPConduit *)self _authenticationCredential];
  id v32 = 0;
  LOBYTE(a6) = [(RMHTTPConduit *)self _prepareURLRequest:v10 withAuthenticationCredential:v14 error:&v32];
  id v15 = v32;
  if (a6)
  {
    uint64_t v16 = [v10 HTTPMethod];
    BOOL v17 = +[RMLog httpConduit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10003F740();
    }

    uint64_t v18 = [(RMHTTPConduit *)self session];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003D97C;
    v25[3] = &unk_1000C5F90;
    id v19 = v16;
    id v26 = v19;
    id v27 = v10;
    id v23 = v11;
    id v28 = v11;
    id v20 = v13;
    id v31 = v20;
    uint64_t v29 = self;
    id v30 = v12;
    id v21 = [(id)v18 dataTaskWithRequest:v27 completionHandler:v25];

    id v24 = v15;
    LOBYTE(v18) = [(RMHTTPConduit *)self _prepareTask:v21 withAuthenticationCredential:v14 error:&v24];
    id v22 = v24;

    if (v18) {
      [v21 resume];
    }
    else {
      (*((void (**)(id, void, void, id))v20 + 2))(v20, 0, 0, v22);
    }

    id v11 = v23;
  }
  else
  {
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v15);
    id v22 = v15;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v7 = (void (**)(id, void, void *))a6;
  id v8 = [a5 protectionSpace];
  id v9 = [v8 authenticationMethod];
  id v10 = +[RMLog httpConduit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10003FA24();
  }

  unsigned int v11 = [v9 isEqualToString:NSURLAuthenticationMethodServerTrust];
  id v12 = +[RMLog httpConduit];
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10003F9BC();
    }

    id v14 = (__SecTrust *)[v8 serverTrust];
    if (v14)
    {
      uint64_t v15 = (uint64_t)v14;
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError(v14, &error))
      {
        uint64_t v16 = +[NSURLCredential credentialForTrust:v15];
        BOOL v17 = +[RMLog httpConduit];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_10003F904();
        }

        v7[2](v7, 0, v16);
        goto LABEL_21;
      }
      id v19 = +[RMLog httpConduit];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10003F938(v15, (void **)&error);
      }
    }
    else
    {
      uint64_t v18 = +[RMLog httpConduit];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003F8D0();
      }
    }
    v7[2](v7, 2, 0);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10003F9F0();
  }

  v7[2](v7, 3, 0);
LABEL_21:
}

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 changeType] == (id)2)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    unsigned int v11 = [v9 changedObjectID];
    id v12 = [v11 entity];
    id v13 = +[RMConduitConfig entity];
    unsigned int v10 = [v12 isKindOfEntity:v13];
    if (v10)
    {
      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      id v14 = [(RMHTTPConduit *)self context];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10003DFCC;
      v16[3] = &unk_1000C5FB8;
      void v16[4] = self;
      id v17 = v11;
      id v18 = v9;
      id v19 = v12;
      id v20 = v13;
      id v21 = &v22;
      [v14 performBlockAndWait:v16];
      *a5 = *((unsigned char *)v23 + 24);

      _Block_object_dispose(&v22, 8);
    }
  }
  return v10;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v6 insertedObjectIDs];
  if (![v7 count])
  {
    id v8 = [v6 updatedObjectIDs];
    if (![v8 count])
    {
      id v9 = [v6 deletedObjectIDs];
      if (![v9 count])
      {
        unsigned int v11 = [v14 persistentHistoryToken];
        id v12 = [v6 persistentHistoryToken];
        unsigned __int8 v13 = +[RMPersistentHistoryNotifierChanges isExistingPersistentHistoryToken:v11 fromSameStoreAsUpdatedToken:v12];

        if (v13) {
          goto LABEL_10;
        }
        goto LABEL_7;
      }
    }
  }

LABEL_7:
  unsigned int v10 = [(RMHTTPConduit *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 conduitNeedsToSync:self];
  }

LABEL_10:
}

- (RMConduitDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMConduitDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)madeChangesDuringSync
{
  return self->_madeChangesDuringSync;
}

- (void)setMadeChangesDuringSync:(BOOL)a3
{
  self->_madeChangesDuringSync = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementSourceObjectID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_persistentHistoryNotifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end