@interface STAskForTimeManager
+ (int64_t)_approvedTimeForResponseAnswer:(int64_t)a3 amount:(id)a4;
+ (int64_t)_resourceTypeForUsageType:(int64_t)a3;
+ (int64_t)_responseAnswerForAnswer:(int64_t)a3 timeApproved:(id *)a4;
- (BOOL)_applyAskForTimeDeclarationsForAnswer:(int64_t)a3 usageType:(int64_t)a4 requestedResourceIdentifier:(id)a5 timeGranted:(id)a6 oneMoreMinute:(BOOL)a7 toUser:(id)a8 managedObjectContext:(id)a9 error:(id *)a10;
- (BOOL)_approveAskForTimeRequest:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)_sendRequestToParents:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (STAskForTimeConfigurationProvider)askForTimeConfigurationProvider;
- (STAskForTimeEventRelay)eventRelay;
- (STAskForTimeManager)initWithPersistenceController:(id)a3 userNotificationManager:(id)a4 eventRelay:(id)a5 askForTimeConfigurationProvider:(id)a6 askToManager:(id)a7;
- (STAskToManager)askToManager;
- (STFamilyOrganizationController)familyOrganizationController;
- (STPersistenceControllerProtocol)persistenceController;
- (STUserNotificationManager)userNotificationManager;
- (id)_eventForRequest:(id)a3;
- (void)_handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6;
- (void)_handleApprovalOfRequest:(id)a3;
- (void)_handleAskForTimeResponse:(id)a3 respondingUserAppleID:(id)a4;
- (void)_handleDisapprovalOfRequest:(id)a3;
- (void)_postAskForTimeResponseNotificationWithRespondingUserGivenName:(id)a3 respondingUserDSID:(id)a4 respondingUserAltDSID:(id)a5 respondingUserAppleID:(id)a6 associatedRequestIdentifier:(id)a7 answer:(int64_t)a8 requestedResourceName:(id)a9 amountGranted:(id)a10;
- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchLastResponseForRequestedResourceIdentifier:(id)a3 usageType:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)handleAnswer:(int64_t)a3 forRequestWithIdentifier:(id)a4;
- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6;
- (void)handleAskForTimeRequestPayload:(id)a3;
- (void)handleAskForTimeResponsePayload:(id)a3;
- (void)handleV2AskForTimeResponsePayload:(id)a3;
- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4;
- (void)setFamilyOrganizationController:(id)a3;
@end

@implementation STAskForTimeManager

- (STAskForTimeManager)initWithPersistenceController:(id)a3 userNotificationManager:(id)a4 eventRelay:(id)a5 askForTimeConfigurationProvider:(id)a6 askToManager:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)STAskForTimeManager;
  v17 = [(STAskForTimeManager *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventRelay, a5);
    objc_storeStrong((id *)&v18->_persistenceController, a3);
    objc_storeStrong((id *)&v18->_userNotificationManager, a4);
    objc_storeStrong((id *)&v18->_askForTimeConfigurationProvider, a6);
    objc_storeStrong((id *)&v18->_askToManager, a7);
    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v18 selector:"_handleApprovalOfRequest:" name:STUserNotificationAskForTimeResponseReceivedApprove object:v13];
    [v19 addObserver:v18 selector:"_handleDisapprovalOfRequest:" name:STUserNotificationAskForTimeResponseReceivedDontApprove object:v13];
  }
  return v18;
}

- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STAskForTimeManager *)self askForTimeConfigurationProvider];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AA38;
  v11[3] = &unk_1002FB4B0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 shouldDeliverNotificationQuietlyWithCompletion:v11];
}

- (id)_eventForRequest:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[STAskForTimeManager _resourceTypeForUsageType:](STAskForTimeManager, "_resourceTypeForUsageType:", [v3 usageType]);
  id v5 = objc_alloc((Class)STUserID);
  id v6 = [v3 requestingUserDSID];
  id v7 = [v5 initWithDSID:v6];

  v8 = [STAskForTimeRequestEvent alloc];
  id v9 = [v3 requestIdentifier];
  id v10 = [v9 UUIDString];
  v11 = [v3 timeStamp];
  id v12 = [v3 requestedResourceIdentifier];

  id v13 = [(STAskForTimeRequestEvent *)v8 initWithIdentifier:v10 resourceType:v4 timestamp:v11 requesterUserID:v7 requestedResourceIdentifier:v12];
  return v13;
}

- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STAskForTimeManager *)self persistenceController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000B614;
  v11[3] = &unk_1002FB4D8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)fetchLastResponseForRequestedResourceIdentifier:(id)a3 usageType:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[STLog ask];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10025AB0C();
  }

  id v10 = [(STAskForTimeManager *)self persistenceController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B82C;
  v13[3] = &unk_1002FB500;
  id v14 = v7;
  id v15 = v8;
  id v11 = v7;
  id v12 = v8;
  [v10 performBackgroundTask:v13];
}

- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[STLog ask];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 UUIDString];
    CFStringRef v15 = @"disapproved";
    int v16 = 138543874;
    v17 = v14;
    __int16 v18 = 2114;
    if (!a3) {
      CFStringRef v15 = @"approved";
    }
    CFStringRef v19 = v15;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Begin handling answer for request %{public}@, answer:%{public}@, time approved:%{public}@", (uint8_t *)&v16, 0x20u);
  }
  [(STAskForTimeManager *)self _handleAnswer:a3 requestIdentifier:v10 timeApproved:v11 completionHandler:v12];
}

- (void)_handleApprovalOfRequest:(id)a3
{
  int64_t v4 = [a3 userInfo];
  id v5 = objc_alloc((Class)NSUUID);
  id v6 = [v4 objectForKeyedSubscript:STUserNotificationAskForTimeKeyRequestIdentifier];
  id v7 = [v5 initWithUUIDString:v6];

  if (v7)
  {
    id v8 = [v4 objectForKeyedSubscript:STUserNotificationAskForTimeKeyTimeApproved];
    [(STAskForTimeManager *)self _handleAnswer:0 requestIdentifier:v7 timeApproved:v8 completionHandler:0];
  }
  else
  {
    id v9 = +[STLog ask];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10025ABE8(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)_handleDisapprovalOfRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSUUID);
  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:STUserNotificationAskForTimeKeyRequestIdentifier];
  id v8 = [v5 initWithUUIDString:v7];

  if (v8)
  {
    [(STAskForTimeManager *)self _handleAnswer:1 requestIdentifier:v8 timeApproved:0 completionHandler:0];
  }
  else
  {
    id v9 = +[STLog ask];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10025AC58(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)handleAskForTimeRequestPayload:(id)a3
{
  id v3 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10000AF40;
  v34 = sub_10000AF50;
  id v35 = 0;
  id v4 = objc_alloc((Class)STAskForTimeRequest);
  id v5 = [v3 payloadDictionary];
  id v6 = [v4 initWithPayload:v5];

  if (v6)
  {
    id v7 = +[NSDate now];
    id v8 = [v3 userInfo];
    id v9 = [v8 objectForKeyedSubscript:@"ServerReceivedTime"];

    if (v9)
    {
      [v9 doubleValue];
      uint64_t v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      uint64_t v10 = v7;
    }
    uint64_t v12 = v10;
    uint64_t v13 = +[STLog ask];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v6 requestIdentifier];
      uint64_t v15 = [v6 requestedResourceIdentifier];
      uint64_t v16 = [v3 userInfo];
      v17 = [v16 objectForKeyedSubscript:@"AppleID"];
      *(_DWORD *)buf = 138544130;
      v37 = v14;
      __int16 v38 = 2114;
      v39 = v15;
      __int16 v40 = 2114;
      v41 = v17;
      __int16 v42 = 2114;
      v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received ask request %{public}@ (%{public}@) from %{public}@ - requested at %{public}@", buf, 0x2Au);
    }
    __int16 v18 = +[NSCalendar autoupdatingCurrentCalendar];
    CFStringRef v19 = [v18 nextDateAfterDate:v12 matchingHour:0 minute:0 second:0 options:1024];

    if ([v7 compare:v19] == (id)1)
    {
      __int16 v20 = +[STLog ask];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v6 requestIdentifier];
        *(_DWORD *)buf = 138543362;
        v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Dropping expired ask for time request: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_super v22 = [(STAskForTimeManager *)self persistenceController];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000C474;
      v25[3] = &unk_1002FB550;
      v26 = v6;
      v29 = &v30;
      v27 = v7;
      v28 = self;
      [v22 performBackgroundTaskAndWait:v25];

      if (v31[5])
      {
        v23 = [(STAskForTimeManager *)self eventRelay];
        [v23 relayRequestEvent:v31[5]];
      }
      __int16 v20 = v26;
    }
  }
  else
  {
    id v7 = +[STLog ask];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v3 payloadDictionary];
      sub_10025ACC8(v11, (uint64_t)buf, v7);
    }
  }

  _Block_object_dispose(&v30, 8);
}

- (void)handleAskForTimeResponsePayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"AppleID"];

  id v7 = +[STLog ask];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138477827;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received a response for more time from %{private}@", (uint8_t *)&v12, 0xCu);
  }

  id v8 = objc_alloc((Class)STAskForTimeResponse);
  id v9 = [v4 payloadDictionary];
  id v10 = [v8 initWithPayload:v9];

  if (v10)
  {
    [(STAskForTimeManager *)self _handleAskForTimeResponse:v10 respondingUserAppleID:v6];
  }
  else
  {
    uint64_t v11 = +[STLog ask];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10025AEEC(v4, v11);
    }
  }
}

- (void)_handleAskForTimeResponse:(id)a3 respondingUserAppleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog ask];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received a response for more time from %{private}@", (uint8_t *)&buf, 0xCu);
  }

  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000;
    objc_super v22 = sub_10000AF40;
    v23 = sub_10000AF50;
    id v24 = 0;
    id v9 = [(STAskForTimeManager *)self persistenceController];
    int v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_10000D064;
    uint64_t v15 = &unk_1002FB5A0;
    id v16 = v6;
    id v17 = v7;
    __int16 v18 = self;
    p_long long buf = &buf;
    [v9 performBackgroundTaskAndWait:&v12];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      id v10 = [(STAskForTimeManager *)self eventRelay];
      [v10 relayResponseEvent:*(void *)(*((void *)&buf + 1) + 40)];
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v11 = +[STLog ask];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10025AF78();
    }
  }
}

- (void)handleV2AskForTimeResponsePayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payloadType];
  unsigned __int8 v6 = [v5 isEqualToString:@"STUnifiedTransportPayloadTypeAskForTimeResponseV2"];

  if (v6)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"AppleID"];

    id v9 = +[STLog ask];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received a v2 ask response from %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    CFStringRef v19 = sub_10000AF40;
    __int16 v20 = sub_10000AF50;
    id v21 = 0;
    id v10 = [(STAskForTimeManager *)self persistenceController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000DB90;
    v13[3] = &unk_1002FB5C8;
    id v14 = v4;
    uint64_t v11 = v8;
    uint64_t v15 = v11;
    p_long long buf = &buf;
    [v10 performBackgroundTaskAndWait:v13];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      int v12 = [(STAskForTimeManager *)self eventRelay];
      [v12 relayResponseEvent:*(void *)(*((void *)&buf + 1) + 40)];
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v11 = +[STLog ask];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10025B0E4();
    }
  }
}

- (void)_postAskForTimeResponseNotificationWithRespondingUserGivenName:(id)a3 respondingUserDSID:(id)a4 respondingUserAltDSID:(id)a5 respondingUserAppleID:(id)a6 associatedRequestIdentifier:(id)a7 answer:(int64_t)a8 requestedResourceName:(id)a9 amountGranted:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_10000AF40;
  v43[4] = sub_10000AF50;
  id v22 = v15;
  id v44 = v22;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_10000AF40;
  v41[4] = sub_10000AF50;
  id v42 = 0;
  v23 = objc_opt_new();
  if (v17)
  {
    id v45 = v17;
    id v24 = +[NSArray arrayWithObjects:&v45 count:1];
    [v23 setExpectedAltDSIDs:v24];
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000E5B0;
  v31[3] = &unk_1002FB5F0;
  id v25 = v16;
  id v32 = v25;
  id v26 = v18;
  id v33 = v26;
  __int16 v38 = v43;
  v39 = v41;
  int64_t v40 = a8;
  id v27 = v19;
  id v34 = v27;
  id v28 = v20;
  id v35 = v28;
  id v29 = v21;
  id v36 = v29;
  v37 = self;
  [v23 startRequestWithCompletionHandler:v31];

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

- (void)_handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  int v12 = (void (**)(void))a6;
  uint64_t v13 = +[STLog ask];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = a3 ? @"Not approving" : @"Approving";
    unsigned __int8 v15 = [v11 isEqual:&off_10030FB08];
    if (v15)
    {
      id v16 = @"all day";
    }
    else
    {
      [v11 floatValue];
      id v16 = +[NSNumber numberWithDouble:v17 / 60.0];
    }
    id v18 = [v10 UUIDString];
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ request for %@ [minutes] for request %@", buf, 0x20u);

    if ((v15 & 1) == 0) {
  }
    }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v30 = sub_10000AF40;
  v31 = sub_10000AF50;
  id v32 = 0;
  id v19 = [(STAskForTimeManager *)self persistenceController];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000EB30;
  v23[3] = &unk_1002FB618;
  id v20 = v10;
  id v24 = v20;
  int64_t v28 = a3;
  id v21 = v11;
  id v25 = v21;
  id v26 = self;
  id v27 = buf;
  [v19 performBackgroundTaskAndWait:v23];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v22 = [(STAskForTimeManager *)self eventRelay];
    [v22 relayResponseEvent:*(void *)(*(void *)&buf[8] + 40)];
  }
  if (v12) {
    v12[2](v12);
  }

  _Block_object_dispose(buf, 8);
}

- (BOOL)_applyAskForTimeDeclarationsForAnswer:(int64_t)a3 usageType:(int64_t)a4 requestedResourceIdentifier:(id)a5 timeGranted:(id)a6 oneMoreMinute:(BOOL)a7 toUser:(id)a8 managedObjectContext:(id)a9 error:(id *)a10
{
  BOOL v11 = a7;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = +[STLog ask];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v66 = v18;
    __int16 v67 = 2114;
    id v68 = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Granting %@ seconds for \"%{public}@\"", buf, 0x16u);
  }

  if (a3 != 1)
  {
    if (a3) {
      id v22 = 0;
    }
    else {
      id v22 = CEMPolicyWebSiteDeclaration_Mode_override;
    }
    v55 = self;
    if (v17)
    {
      id v64 = v17;
      v23 = +[NSArray arrayWithObjects:&v64 count:1];
    }
    else
    {
      v23 = 0;
    }
    id v60 = v20;
    if (a4 == 2)
    {
      if (([v17 isEqualToString:CTCategoryIdentifierUtilities] & 1) != 0
        || ([v17 isEqualToString:CTCategoryIdentifierShoppingAndFood] & 1) != 0
        || [v17 isEqualToString:CTCategoryIdentifierTravel])
      {
        uint64_t v63 = CTCategoryIdentifierOther;
        id v25 = +[NSArray arrayWithObjects:&v63 count:1];
      }
      else
      {
        id v25 = v23;
      }
      id v26 = v25;
      id v27 = +[CEMPolicyCategoryDeclaration buildWithIdentifier:0 withMode:v22 withCategories:v25 withCategoriesVersion2:v23];

      goto LABEL_22;
    }
    if (a4 == 1)
    {
      uint64_t v24 = +[CEMPolicyWebSiteDeclaration buildWithIdentifier:0 withMode:v22 withHostnames:v23];
    }
    else
    {
      if (a4)
      {
        int64_t v28 = +[NSAssertionHandler currentHandler];
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, @"STAskForTimeManager.m", 717, @"Unexpected usage type %ld", a4);

        id v27 = 0;
        goto LABEL_22;
      }
      uint64_t v24 = +[CEMPolicyAppDeclaration buildWithIdentifier:0 withMode:v22 withApps:v23];
    }
    id v27 = (void *)v24;
LABEL_22:
    v59 = v23;
    id v56 = v22;
    id v29 = +[NSDate now];
    [v18 doubleValue];
    uint64_t v30 = objc_msgSend(v29, "dateByAddingTimeInterval:");
    id v31 = [objc_alloc((Class)STBlueprint) initWithContext:v60];
    [v31 setType:STBlueprintTypeUsageLimitOverride];
    [v31 setCreationDate:v29];
    [v31 setExpiration:v30];
    id v32 = [v19 managingOrganization];
    [v31 setOrganization:v32];

    id v33 = +[NSSet setWithObject:v19];
    [v31 setUsers:v33];

    v57 = (void *)v30;
    v58 = v29;
    id v34 = v18;
    if (v11)
    {
      uint64_t v35 = STOneMoreMinuteBlueprintIdentifierPrefix;
      id v36 = objc_opt_new();
      v37 = [v36 UUIDString];
      __int16 v38 = +[NSString stringWithFormat:@"%@_%@", v35, v37];

      [v31 setIdentifier:v38];
    }
    else
    {
      __int16 v38 = +[NSUUID UUID];
      v39 = [v38 UUIDString];
      [v31 setIdentifier:v39];
    }
    [v31 setIsDirty:1];
    id v40 = [objc_alloc((Class)STBlueprintConfiguration) initWithContext:v60];
    v41 = [v27 declarationIdentifier];
    [v40 setIdentifier:v41];

    id v42 = [v27 declarationType];
    [v40 setType:v42];

    [v40 setBlueprint:v31];
    id v62 = 0;
    v43 = [v27 serializeAsDataWithError:&v62];
    id v44 = v62;
    [v40 setPayloadPlist:v43];

    id v45 = [v40 payloadPlist];

    if (v45)
    {
      id v54 = v19;
      id v46 = v18;
      v47 = [(STAskForTimeManager *)v55 persistenceController];
      id v61 = 0;
      unsigned int v48 = [v47 saveContext:v60 error:&v61];
      id v49 = v61;

      v50 = +[STLog ask];
      a3 = (int64_t)v50;
      if (v48)
      {
        id v18 = v34;
        v51 = v56;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v66 = v17;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "Successfully saved ask for time override declaration for %{public}@", buf, 0xCu);
        }

        LOBYTE(a3) = 1;
      }
      else
      {
        v51 = v56;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          sub_10025B4C4();
        }

        id v18 = v46;
        if (a10)
        {
          STXPCSafeErrorFromCoreDataError();
          LOBYTE(a3) = 0;
          *a10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          LOBYTE(a3) = 0;
        }
      }
      id v19 = v54;
    }
    else
    {
      v52 = +[STLog ask];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        sub_10025B450();
      }

      id v49 = 0;
      LOBYTE(a3) = 0;
      if (a10) {
        *a10 = v44;
      }
      v51 = v56;
    }

    id v20 = v60;
  }

  return a3;
}

- (BOOL)_approveAskForTimeRequest:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v25 = 0;
  id v10 = +[STCoreUser fetchLocalUserInContext:v9 error:&v25];
  id v11 = v25;
  if (v10)
  {
    id v12 = [v8 timeRequested];
    if ([v12 isEqual:&off_10030FB08])
    {
      uint64_t v13 = +[NSCalendar currentCalendar];
      id v14 = objc_opt_new();
      unsigned __int8 v15 = [v13 nextDateAfterDate:v14 matchingHour:0 minute:0 second:0 options:1024];

      [v15 timeIntervalSinceNow];
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = +[STLog ask];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v27 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Request is for all day, recalculating and granting %{public}@ seconds", buf, 0xCu);
      }
    }
    else
    {
      id v16 = v12;
    }

    id v20 = [v8 usageType];
    id v21 = [v8 requestedResourceIdentifier];
    id v24 = v11;
    BOOL v19 = -[STAskForTimeManager _applyAskForTimeDeclarationsForAnswer:usageType:requestedResourceIdentifier:timeGranted:oneMoreMinute:toUser:managedObjectContext:error:](self, "_applyAskForTimeDeclarationsForAnswer:usageType:requestedResourceIdentifier:timeGranted:oneMoreMinute:toUser:managedObjectContext:error:", 0, v20, v21, v16, [v8 oneMoreMinute], v10, v9, &v24);
    id v22 = v24;

    if (a5 && !v19) {
      *a5 = v22;
    }
  }
  else
  {
    id v18 = +[STLog ask];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10025B52C();
    }

    if (a5)
    {
      +[NSError errorWithDomain:STErrorDomain code:2 userInfo:0];
      BOOL v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v19 = 0;
    }
    id v22 = v11;
  }

  return v19;
}

- (BOOL)_sendRequestToParents:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[STLog ask];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10025B670();
  }

  id v29 = 0;
  id v10 = +[STCoreUser fetchLocalUserInContext:v8 error:&v29];
  id v11 = v29;
  if (v10)
  {
    if ([v10 isManaged])
    {
      id v28 = v11;
      id v12 = +[STAskForTimeRequestResponse upsertAskForTimeRequest:v7 fromUser:v10 inContext:v8 error:&v28];
      id v13 = v28;

      if (v12)
      {
        id v14 = objc_opt_new();
        [v12 setRequestTimeStamp:v14];

        if (![v8 hasChanges])
        {
LABEL_9:
          id v17 = +[STLog ask];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_10025B5FC();
          }

          id v18 = [v10 dsid];
          [v7 setRequestingUserDSID:v18];

          BOOL v19 = [v10 givenName];
          [v7 setRequestingUserDisplayName:v19];

          id v20 = [v12 identifier];
          [v7 setRequestIdentifier:v20];

          BOOL v21 = 1;
          goto LABEL_30;
        }
        id v27 = v13;
        unsigned __int8 v15 = [v8 save:&v27];
        id v16 = v27;

        if (v15)
        {
          id v13 = v16;
          goto LABEL_9;
        }
        id v25 = +[STLog ask];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10025ADE8();
        }

        if (!a5)
        {
          BOOL v21 = 0;
          id v13 = v16;
          goto LABEL_30;
        }
        id v24 = v16;
      }
      else
      {
        v23 = +[STLog ask];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10025AD80();
        }

        if (!a5)
        {
          BOOL v21 = 0;
          goto LABEL_30;
        }
        id v24 = v13;
      }
      id v13 = v24;
      BOOL v21 = 0;
      *a5 = v13;
LABEL_30:

      id v11 = v13;
      goto LABEL_31;
    }
    id v22 = +[STLog ask];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10025B630();
    }
  }
  else
  {
    id v22 = +[STLog ask];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10025B594();
    }
  }

  if (a5)
  {
    +[NSError errorWithDomain:STErrorDomain code:2 userInfo:0];
    BOOL v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_31:

  return v21;
}

- (void)handleAnswer:(int64_t)a3 forRequestWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = +[STLog ask];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 2) {
      CFStringRef v8 = @"Not Approved";
    }
    else {
      CFStringRef v8 = off_1002FB638[a3 - 1];
    }
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v14 = v8;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling local ask response: %{public}@ for request: %{public}@", buf, 0x16u);
  }

  id v12 = 0;
  int64_t v9 = +[STAskForTimeManager _responseAnswerForAnswer:a3 timeApproved:&v12];
  id v10 = v12;
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  [(STAskForTimeManager *)self _handleAnswer:v9 requestIdentifier:v11 timeApproved:v10 completionHandler:0];
}

+ (int64_t)_resourceTypeForUsageType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)_approvedTimeForResponseAnswer:(int64_t)a3 amount:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    int64_t v7 = 0;
  }
  else if ([v5 isEqualToNumber:&off_10030FB20])
  {
    int64_t v7 = 1;
  }
  else if ([v6 isEqualToNumber:&off_10030FB38])
  {
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = 3;
  }

  return v7;
}

+ (int64_t)_responseAnswerForAnswer:(int64_t)a3 timeApproved:(id *)a4
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v5 = 0;
    int64_t result = 1;
    if (!a4) {
      return result;
    }
    goto LABEL_5;
  }
  int64_t result = 0;
  id v5 = off_1002FB650[a3 - 1];
  if (a4) {
LABEL_5:
  }
    *a4 = v5;
  return result;
}

- (STFamilyOrganizationController)familyOrganizationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_familyOrganizationController);
  return (STFamilyOrganizationController *)WeakRetained;
}

- (void)setFamilyOrganizationController:(id)a3
{
}

- (STAskForTimeEventRelay)eventRelay
{
  return (STAskForTimeEventRelay *)objc_getProperty(self, a2, 16, 1);
}

- (STUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (STAskForTimeConfigurationProvider)askForTimeConfigurationProvider
{
  return self->_askForTimeConfigurationProvider;
}

- (STAskToManager)askToManager
{
  return self->_askToManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_askToManager, 0);
  objc_storeStrong((id *)&self->_askForTimeConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_eventRelay, 0);
  objc_destroyWeak((id *)&self->_familyOrganizationController);
}

@end