@interface FMFFenceSequencer
+ (id)fencesFromFenceDictionaries:(id)a3;
+ (void)ckCheckForStaleZonesForFence:(id)a3 withCompletion:(id)a4;
+ (void)ckCreateRecordForFence:(id)a3 withCompletion:(id)a4;
+ (void)ckCreateRecordIDForFence:(id)a3 withCompletion:(id)a4;
+ (void)ckDeleteRecordForFence:(id)a3 withCompletion:(id)a4;
+ (void)ckUpdateRecordForFence:(id)a3 withCompletion:(id)a4;
- (FMFFenceManager)fenceManager;
- (FMFFenceSequencer)initWithFenceManager:(id)a3;
- (NSArray)fencesOnMeByMe;
- (NSArray)fencesOnMeByOthers;
- (NSArray)fencesOnOthersByMe;
- (NSArray)fencesOnOthersByOthers;
- (NSSet)fences;
- (id)FMFErrorAsString:(int64_t)a3;
- (id)fenceDictionariesFromResponseDictionary:(id)a3;
- (id)fencesForHandles:(id)a3;
- (id)recurringAndScheduledFencesForHandles:(id)a3;
- (id)updatedFenceForFence:(id)a3;
- (void)_addFence:(id)a3 clientSession:(id)a4 ckShare:(id)a5 completion:(id)a6;
- (void)_removeFence:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (void)addFence:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (void)cleanupRemovedFenceInformationWithFenceID:(id)a3 ckRecordID:(id)a4;
- (void)fenceManager:(id)a3 didModifyFence:(id)a4 clientSession:(id)a5 withCompletion:(id)a6;
- (void)fenceManager:(id)a3 didModifyFence:(id)a4 withCompletion:(id)a5;
- (void)handleIdentityLossWithCompletion:(id)a3;
- (void)removeFence:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (void)removeUnrecoverableManateeFences:(id)a3 withCompletion:(id)a4;
- (void)reset;
- (void)setFences:(id)a3;
- (void)setFencesFromResponseDictionary:(id)a3 withCompletion:(id)a4;
- (void)setFencesOnMeByMe:(id)a3;
- (void)setFencesOnMeByOthers:(id)a3;
- (void)setFencesOnOthersByMe:(id)a3;
- (void)setFencesOnOthersByOthers:(id)a3;
- (void)triggerRepeatedFence:(id)a3 clientSesssion:(id)a4 afterAccpetanceWithCompletion:(id)a5;
- (void)updateFenceInCK:(id)a3 completion:(id)a4;
@end

@implementation FMFFenceSequencer

- (NSSet)fences
{
  v2 = [(FMFFenceSequencer *)self fenceManager];
  v3 = [v2 fences];

  return (NSSet *)v3;
}

- (FMFFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (FMFFenceSequencer)initWithFenceManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMFFenceSequencer;
  v6 = [(FMFFenceSequencer *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fenceManager, a3);
    [(FMFFenceManager *)v7->_fenceManager setDelegate:v7];
    fencesOnMeByMe = v7->_fencesOnMeByMe;
    v7->_fencesOnMeByMe = (NSArray *)&__NSArray0__struct;

    fencesOnMeByOthers = v7->_fencesOnMeByOthers;
    v7->_fencesOnMeByOthers = (NSArray *)&__NSArray0__struct;

    fencesOnOthersByMe = v7->_fencesOnOthersByMe;
    v7->_fencesOnOthersByMe = (NSArray *)&__NSArray0__struct;

    v11 = v7->_fencesOnOthersByMe;
    v7->_fencesOnOthersByMe = (NSArray *)&__NSArray0__struct;
  }
  return v7;
}

- (void)reset
{
  id v2 = [(FMFFenceSequencer *)self fenceManager];
  [v2 reset];
}

- (void)updateFenceInCK:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([v6 shouldUseCloudKitStore] && objc_msgSend(v6, "isFromMe"))
    {
      v8 = objc_opt_class();
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100052A78;
      v18[3] = &unk_1000A3020;
      id v19 = v6;
      v20 = self;
      id v21 = v7;
      [v8 ckUpdateRecordForFence:v19 withCompletion:v18];
    }
    else
    {
      [(FMFFenceSequencer *)self _addFence:v6 clientSession:0 ckShare:0 completion:v7];
    }
  }
  else
  {
    v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006D65C(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v17 = +[NSError errorWithDomain:FMFFenceErrorDomain code:10 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);

    AnalyticsSendEvent();
  }
}

- (void)addFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if ([v8 isRegionAllowed])
    {
      if ([v8 shouldUseCloudKitStore] && objc_msgSend(v8, "isFromMe"))
      {
        uint64_t v11 = +[FMFIDSMessageController sharedInstance];
        uint64_t v12 = [v8 recipients];
        uint64_t v13 = [v12 firstObject];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100052F84;
        v27[3] = &unk_1000A3098;
        id v28 = v8;
        id v31 = v10;
        v29 = self;
        id v30 = v9;
        [v11 hasIDSFenceCapabilityForHandle:v13 withCompletion:v27];
      }
      else
      {
        [(FMFFenceSequencer *)self _addFence:v8 clientSession:v9 ckShare:0 completion:v10];
      }
    }
    else
    {
      v32[0] = @"fenceType";
      v23 = [v8 type];
      v33[0] = v23;
      v32[1] = @"fenceTriggerType";
      v24 = [v8 trigger];
      v33[1] = v24;
      v33[2] = &off_1000A8FE0;
      v32[2] = @"addFenceSuccess";
      v32[3] = @"addFenceError";
      v33[3] = @"FMFFenceErrorRegionUnavailable";
      v25 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
      AnalyticsSendEvent();

      v26 = +[NSError errorWithDomain:FMFFenceErrorDomain code:6 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v26);
    }
  }
  else
  {
    uint64_t v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10006D748(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    v22 = +[NSError errorWithDomain:FMFFenceErrorDomain code:10 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v22);

    AnalyticsSendEvent();
  }
}

- (void)_addFence:(id)a3 clientSession:(id)a4 ckShare:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[FMFCommandManager sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100053724;
  v19[3] = &unk_1000A30C0;
  id v20 = v10;
  uint64_t v21 = self;
  id v23 = v11;
  id v24 = v13;
  id v22 = v12;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  [v14 updateFence:v18 clientSession:v15 completion:v19];
}

- (void)triggerRepeatedFence:(id)a3 clientSesssion:(id)a4 afterAccpetanceWithCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isRecurring])
  {
    if ([v8 isOnMe])
    {
      id v11 = [v8 acceptanceStatus];
      uint64_t v12 = FMFFenceAcceptanceStatusAccepted;
      unsigned int v13 = [v11 isEqualToString:FMFFenceAcceptanceStatusAccepted];

      if (v13)
      {
        uint64_t v14 = [(FMFFenceSequencer *)self fenceManager];
        id v15 = [v14 triggerForRepeatedFenceBeforeAcceptanceWithFence:v8];

        if (v15)
        {
          id v16 = [v15 objectForKeyedSubscript:@"FMFPreAcceptanceFenceTriggerStatus"];
          id v17 = [v15 objectForKeyedSubscript:@"FMFPreAcceptanceFenceTriggerDate"];
          id v18 = [v15 objectForKeyedSubscript:@"FMFPreAcceptanceFenceTriggerLocation"];
          uint64_t v19 = +[NSDate now];
          [v19 timeIntervalSinceDate:v17];
          double v21 = v20;

          id v22 = sub_100005560();
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v21 <= 3600.0)
          {
            id v30 = v18;
            id v31 = v17;
            if (v23)
            {
              *(_DWORD *)buf = 136315138;
              v36 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Invite was sent less than an hour ago. Show fence trigger notification.", buf, 0xCu);
            }

            v26 = [(FMFFenceSequencer *)self fenceManager];
            v27 = +[NSUUID UUID];
            id v28 = [v8 identifier];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_10005409C;
            v32[3] = &unk_1000A2C78;
            void v32[4] = self;
            id v33 = v8;
            id v34 = v10;
            [v26 triggerAfterAcceptanceWithUUID:v27 forFencewithID:v28 withStatus:v16 withAcceptanceStatus:v12 atDate:v31 triggerLocation:v30 clientSession:v9 completion:v32];

            id v18 = v30;
            id v17 = v31;
          }
          else
          {
            if (v23)
            {
              *(_DWORD *)buf = 136315138;
              v36 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Invite was sent over an hour ago, do not show stale fence trigger notification.", buf, 0xCu);
            }

            (*((void (**)(id, void))v10 + 2))(v10, 0);
          }
        }
        else
        {
          id v24 = sub_100005560();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v8 identifier];
            *(_DWORD *)buf = 136315394;
            v36 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
            __int16 v37 = 2112;
            v38 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: No trigger information for fence: %@", buf, 0x16u);
          }
          (*((void (**)(id, void))v10 + 2))(v10, 0);
        }
      }
    }
  }
  v29 = sub_100005560();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Conditions not met for triggering repeated fence after acceptance.", buf, 0xCu);
  }

  (*((void (**)(id, void))v10 + 2))(v10, 0);
}

- (void)removeFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    [v8 setActive:0];
    if ([v8 shouldUseCloudKitStore] && objc_msgSend(v8, "isFromMe"))
    {
      id v11 = objc_opt_class();
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000542D4;
      v21[3] = &unk_1000A30E8;
      id v22 = v8;
      id v25 = v10;
      BOOL v23 = self;
      id v24 = v9;
      [v11 ckDeleteRecordForFence:v22 withCompletion:v21];
    }
    else
    {
      [(FMFFenceSequencer *)self _removeFence:v8 clientSession:v9 completion:v10];
    }
  }
  else
  {
    uint64_t v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006D994(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    AnalyticsSendEvent();
    double v20 = +[NSError errorWithDomain:FMFFenceErrorDomain code:10 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
  }
}

- (void)_removeFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = +[FMFCommandManager sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100054568;
  v14[3] = &unk_1000A2C78;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 updateFence:v13 clientSession:v10 completion:v14];
}

- (void)cleanupRemovedFenceInformationWithFenceID:(id)a3 ckRecordID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFFenceSequencer *)self fenceManager];
  [v8 clearStaleStatusForRemovedFenceID:v7];

  char v9 = _os_feature_enabled_impl();
  if (v6 && (v9 & 1) == 0)
  {
    id v10 = +[FMFCloudKitManager sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005497C;
    v11[3] = &unk_1000A3110;
    id v12 = v6;
    [v10 deleteRecordWithRecordID:v12 inDatabaseWithScope:2 withCompletion:v11];
  }
}

+ (void)ckCheckForStaleZonesForFence:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMFCloudKitManager sharedInstance];
  id v8 = [v6 ckRecordID];

  char v9 = [v7 recordWithID:v8 inScope:2];

  if (v9)
  {
    id v10 = +[FMFCloudKitManager sharedInstance];
    id v11 = [v9 recordID];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100054B2C;
    v12[3] = &unk_1000A3138;
    v12[4] = v9;
    id v13 = v5;
    [v10 deleteRecordWithRecordID:v11 inDatabaseWithScope:2 withCompletion:v12];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

+ (void)ckDeleteRecordForFence:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMFCloudKitManager sharedInstance];
  id v8 = [v6 ckRecordID];

  id v11 = [v7 recordWithID:v8 inScope:2];

  char v9 = +[FMFCloudKitManager sharedInstance];
  id v10 = [v11 recordID];
  [v9 deleteRecordWithRecordID:v10 inDatabaseWithScope:2 withCompletion:v5];
}

+ (void)ckUpdateRecordForFence:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054D54;
  v8[3] = &unk_1000A3160;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [a1 ckCreateRecordForFence:v6 withCompletion:v8];
}

+ (void)ckCreateRecordForFence:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054ED0;
  v8[3] = &unk_1000A3188;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [a1 ckCreateRecordIDForFence:v6 withCompletion:v8];
}

+ (void)ckCreateRecordIDForFence:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSUUID UUID];
  id v11 = [v7 UUIDString];

  id v8 = objc_opt_class();
  id v9 = [v8 ckRecordZoneNameForRecordName:v11];
  id v10 = +[FMFCloudKitManager sharedInstance];
  [v10 createIDForRecordWithName:v11 inZoneWithName:v9 withCompletion:v5];
}

- (void)setFences:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceSequencer *)self fenceManager];
  [v5 setFences:v4];
}

- (void)setFencesFromResponseDictionary:(id)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(FMFFenceSequencer *)self fenceDictionariesFromResponseDictionary:a3];
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[FMFFenceSequencer setFencesFromResponseDictionary:withCompletion:]";
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: fenceDictionaries: %@", buf, 0x16u);
  }

  if (v7)
  {
    id v9 = [(id)objc_opt_class() fencesFromFenceDictionaries:v7];
    id v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[FMFFenceSequencer setFencesFromResponseDictionary:withCompletion:]";
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: fences: %@", buf, 0x16u);
    }

    id v11 = [v9 fm_map:&stru_1000A31C8];
    id v12 = [(FMFFenceSequencer *)self fenceManager];
    [v12 setFencesWithoutCKData:v11];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000553B8;
    v15[3] = &unk_1000A31F0;
    v15[4] = self;
    id v13 = [v9 fm_map:v15];
    uint64_t v14 = [(FMFFenceSequencer *)self fenceManager];
    [v14 setFences:v13];

    v6[2](v6, 1, 0);
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

- (id)updatedFenceForFence:(id)a3
{
  id v3 = a3;
  if ([v3 isSupported])
  {
    if (([v3 shouldUseCloudKitStore] & 1) == 0)
    {
      id v8 = v3;
      goto LABEL_21;
    }
    id v4 = [v3 ckRecordID];
    if (v4)
    {
      if ([v3 isFromMe]) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 3;
      }
      id v6 = +[FMFCloudKitManager sharedInstance];
      id v7 = [v6 recordWithID:v4 inScope:v5];

      if (v7)
      {
        [v3 updateFromRecord:v7];
        id v8 = v3;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v16 = sub_100005560();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10006DCC8();
      }

      uint64_t v14 = [v3 type:@"fenceType"];
      v20[0] = v14;
      v19[1] = @"fenceTriggerType";
      id v15 = [v3 trigger];
      v19[2] = @"receiveFenceError";
      v20[1] = v15;
      v20[2] = @"FMFErrorFenceNoRecordFound";
      id v17 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
      AnalyticsSendEvent();
    }
    else
    {
      id v13 = sub_100005560();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10006DC54();
      }

      v21[0] = @"fenceType";
      id v7 = [v3 type];
      v22[0] = v7;
      v21[1] = @"fenceTriggerType";
      uint64_t v14 = [v3 trigger];
      v21[2] = @"receiveFenceError";
      v22[1] = v14;
      v22[2] = @"FMFErrorFenceNoRecordID";
      id v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
      AnalyticsSendEvent();
    }

    id v8 = 0;
    goto LABEL_20;
  }
  id v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[FMFFenceSequencer updatedFenceForFence:]";
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: unsupported fence %@", buf, 0x16u);
  }

  v23[0] = @"fenceType";
  id v10 = [v3 type];
  v24[0] = v10;
  v23[1] = @"fenceTriggerType";
  id v11 = [v3 trigger];
  v23[2] = @"receiveFenceError";
  v24[1] = v11;
  v24[2] = @"FMFErrorFenceNotSupported";
  id v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  AnalyticsSendEvent();

  id v8 = 0;
LABEL_21:

  return v8;
}

+ (id)fencesFromFenceDictionaries:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = +[FMFAccountManager sharedInstance];
  id v6 = [v5 account];
  id v7 = [v6 dsid];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v14 = objc_alloc((Class)FMFFence);
        id v15 = [v14 initWithDictionary:v13, v19];
        uint64_t v16 = [v15 createdByIdentifier];
        unsigned int v17 = [v16 isEqualToString:v7];

        if (v17) {
          [v15 setFromMe:1];
        }
        if (v15) {
          [v4 addObject:v15];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v4;
}

- (id)fenceDictionariesFromResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"myFencesISet"];
  id v6 = +[NSNull null];
  if (v5 == v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v4 objectForKeyedSubscript:@"myFencesISet"];
  }

  id v8 = [v4 objectForKeyedSubscript:@"myFencesOthersSet"];
  id v9 = +[NSNull null];
  if (v8 == v9)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [v4 objectForKeyedSubscript:@"myFencesOthersSet"];
  }

  uint64_t v11 = [v4 objectForKeyedSubscript:@"friendFencesISet"];
  id v12 = +[NSNull null];
  if (v11 == v12)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [v4 objectForKeyedSubscript:@"friendFencesISet"];
  }

  id v14 = [v4 objectForKeyedSubscript:@"friendFencesOthersSet"];
  id v15 = +[NSNull null];
  if (v14 == v15)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = [v4 objectForKeyedSubscript:@"friendFencesOthersSet"];
  }

  if (v7)
  {
    [(FMFFenceSequencer *)self setFencesOnMeByMe:v7];
  }
  else
  {
    unsigned int v17 = [(FMFFenceSequencer *)self fencesOnMeByMe];
    [(FMFFenceSequencer *)self setFencesOnMeByMe:v17];
  }
  if (v10)
  {
    [(FMFFenceSequencer *)self setFencesOnMeByOthers:v10];
  }
  else
  {
    __int16 v18 = [(FMFFenceSequencer *)self fencesOnMeByOthers];
    [(FMFFenceSequencer *)self setFencesOnMeByOthers:v18];
  }
  if (v13)
  {
    [(FMFFenceSequencer *)self setFencesOnOthersByMe:v13];
  }
  else
  {
    long long v19 = [(FMFFenceSequencer *)self fencesOnOthersByMe];
    [(FMFFenceSequencer *)self setFencesOnOthersByMe:v19];
  }
  if (v16)
  {
    [(FMFFenceSequencer *)self setFencesOnOthersByOthers:v16];
LABEL_24:
    long long v20 = objc_opt_new();
    long long v21 = [(FMFFenceSequencer *)self fencesOnMeByMe];
    [v20 addObjectsFromArray:v21];

    long long v22 = [(FMFFenceSequencer *)self fencesOnMeByOthers];
    [v20 addObjectsFromArray:v22];

    BOOL v23 = [(FMFFenceSequencer *)self fencesOnOthersByMe];
    [v20 addObjectsFromArray:v23];

    id v24 = [(FMFFenceSequencer *)self fencesOnOthersByOthers];
    [v20 addObjectsFromArray:v24];

    goto LABEL_29;
  }
  id v25 = [(FMFFenceSequencer *)self fencesOnOthersByOthers];
  [(FMFFenceSequencer *)self setFencesOnOthersByOthers:v25];

  if (v7 || v10 || v13) {
    goto LABEL_24;
  }
  long long v20 = 0;
LABEL_29:

  return v20;
}

- (id)fencesForHandles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMFFenceSequencer *)self fenceManager];
  id v6 = [v5 fencesForHandles:v4];

  return v6;
}

- (id)recurringAndScheduledFencesForHandles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMFFenceSequencer *)self fenceManager];
  id v6 = [v5 recurringAndScheduledFencesForHandles:v4];

  return v6;
}

- (void)removeUnrecoverableManateeFences:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v15 = (void (**)(void))a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned int v12 = [v11 shouldUseCloudKitStore];
        uint64_t v13 = sub_100005560();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136315394;
            long long v22 = "-[FMFFenceSequencer removeUnrecoverableManateeFences:withCompletion:]";
            __int16 v23 = 2112;
            id v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Remove fence due to keychain loss %@, ", buf, 0x16u);
          }

          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100055F58;
          v16[3] = &unk_1000A2E50;
          v16[4] = v11;
          [(FMFFenceSequencer *)self removeFence:v11 clientSession:0 completion:v16];
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = 136315394;
            long long v22 = "-[FMFFenceSequencer removeUnrecoverableManateeFences:withCompletion:]";
            __int16 v23 = 2112;
            id v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: No need to remove fence. This fence does not use CloudKit. Fence: %@, ", buf, 0x16u);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }
  v15[2](v15);
}

- (void)handleIdentityLossWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMFFenceSequencer *)self fenceManager];
  id v6 = [v5 fences];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056108;
  v8[3] = &unk_1000A3218;
  id v9 = v4;
  id v7 = v4;
  [(FMFFenceSequencer *)self removeUnrecoverableManateeFences:v6 withCompletion:v8];
}

- (void)fenceManager:(id)a3 didModifyFence:(id)a4 clientSession:(id)a5 withCompletion:(id)a6
{
}

- (void)fenceManager:(id)a3 didModifyFence:(id)a4 withCompletion:(id)a5
{
}

- (id)FMFErrorAsString:(int64_t)a3
{
  id result = @"FMFErrorUnknown";
  if (a3 <= 999)
  {
    switch(a3)
    {
      case 'e':
        id result = @"FMFErrorFriendNotFound";
        break;
      case 'f':
        id result = @"FMFErrorFollowerNotFound";
        break;
      case 'g':
        id result = @"FMFErrorMaxFriendsLimitReached";
        break;
      case 'h':
        id result = @"FMFErrorMaxFollowersLimitReached";
        break;
      case 'i':
        id result = @"FMFErrorThisDeviceIsRestricted";
        break;
      case 'j':
        id result = @"FMFErrorThisDeviceShareMyLocationSystemServiceDisabled";
        break;
      case 'k':
        id result = @"FMFErrorThisDeviceGlobalLocationServicesDisabled";
        break;
      case 'l':
        id result = @"FMFErrorThisDeviceIsAlreadyMeDevice";
        break;
      default:
        switch(a3)
        {
          case 201:
            id result = @"FMFErrorMappingPacketImportFailed";
            break;
          case 202:
            id result = @"FMFErrorMappingPacketSendFailed";
            break;
          case 203:
            id result = @"FMFErrorHideFromFollowersIsEnabled";
            break;
          case 204:
            id result = @"FMFErrorNoMappingPacketReturned";
            break;
          case 205:
            id result = @"FMFErrorMappingPacketImportNotSupported";
            break;
          default:
            if (a3 == 503) {
              id result = @"FMFErrorServer";
            }
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1000:
        id result = @"FMFErrorNoAccount";
        break;
      case 1001:
        id result = @"FMFErrorNoAuthToken";
        break;
      case 1002:
        id result = @"FMFErroriCloudAccountChanged";
        break;
      case 1003:
        id result = @"FMFErrorServerErrorUnauthorized";
        break;
      case 1004:
        id result = @"FMFErrorServerErrorInvalidCredentials";
        break;
      case 1005:
        id result = @"FMFErrorServerForbiddenRegion";
        break;
      case 1006:
        id result = @"FMFErrorServerErrorInternal";
        break;
      case 1007:
        id result = @"FMFErrorServerErrorServiceUnavailable";
        break;
      case 1008:
        id result = @"FMFErrorServerErrorTimeout";
        break;
      case 1009:
        id result = @"FMFErrorNoNetwork";
        break;
      case 1010:
        id result = @"FMFErrorNotFirstUnlocked";
        break;
      case 1011:
        id result = @"FMFErrorInitCommandFailed";
        break;
      case 1012:
        id result = @"FMFErrorPayloadDecryptionFailed";
        break;
      case 1013:
        id result = @"FMFErrorNoContactMatching";
        break;
      case 1014:
        id result = @"FMFErrorPayloadLengthUnsupported";
        break;
      case 1015:
        id result = @"FMFErrorMinRefreshingCallback";
        break;
      case 1016:
        id result = @"FMFErrorModelNotInitialized";
        break;
      case 1017:
        id result = @"FMFErrorNoIDSAccount";
        break;
      case 1018:
        id result = @"FMFErrorCloudKitOtherError";
        break;
      case 1019:
        id result = @"FMFErrorXPCConnectionInterrupted";
        break;
      case 1020:
        id result = @"FMFErrorXPCConnectionInvalidated";
        break;
      default:
        return result;
    }
  }
  return result;
}

- (NSArray)fencesOnMeByMe
{
  return self->_fencesOnMeByMe;
}

- (void)setFencesOnMeByMe:(id)a3
{
}

- (NSArray)fencesOnMeByOthers
{
  return self->_fencesOnMeByOthers;
}

- (void)setFencesOnMeByOthers:(id)a3
{
}

- (NSArray)fencesOnOthersByMe
{
  return self->_fencesOnOthersByMe;
}

- (void)setFencesOnOthersByMe:(id)a3
{
}

- (NSArray)fencesOnOthersByOthers
{
  return self->_fencesOnOthersByOthers;
}

- (void)setFencesOnOthersByOthers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fencesOnOthersByOthers, 0);
  objc_storeStrong((id *)&self->_fencesOnOthersByMe, 0);
  objc_storeStrong((id *)&self->_fencesOnMeByOthers, 0);
  objc_storeStrong((id *)&self->_fencesOnMeByMe, 0);

  objc_storeStrong((id *)&self->_fenceManager, 0);
}

@end