@interface GKCloudKitMultiplayer
+ (BOOL)isOwnZoneID:(id)a3;
+ (id)databaseForZoneID:(id)a3;
+ (id)formattedContact:(id)a3;
+ (id)lastSevenDigits:(id)a3;
+ (id)msgServiceQueue;
+ (id)packFakeRealTimeBulletinWithZoneData:(id)a3;
+ (id)packFakeTurnBasedBulletinWithZoneData:(id)a3;
+ (id)sessionCache;
+ (void)acceptShareMetadata:(id)a3 retryCount:(int)a4 completionHandler:(id)a5;
+ (void)bundleIDsForContainerName:(id)a3 handler:(id)a4;
+ (void)deleteInviteRecordWithRecordID:(id)a3 fromDatabase:(id)a4;
+ (void)generateAndStoreInviteBulletinForRecord:(id)a3 database:(id)a4;
+ (void)getAssociatedAccountsWithCompletionHandler:(id)a3;
+ (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4;
+ (void)handleLegacyShareMetadata:(id)a3 needsAccept:(BOOL)a4 completionHandler:(id)a5;
+ (void)primaryPlayerWithHandler:(id)a3;
+ (void)searchAndSaveIdentityForRecord:(id)a3 database:(id)a4 completionHandler:(id)a5;
+ (void)updateUserWithHandler:(id)a3;
@end

@implementation GKCloudKitMultiplayer

+ (id)sessionCache
{
  if (qword_1003296C8 != -1) {
    dispatch_once(&qword_1003296C8, &stru_1002D8D28);
  }
  v2 = (void *)qword_1003296C0;

  return v2;
}

+ (void)updateUserWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sessionCache];
  [v5 updateUserWithHandler:v4];
}

+ (void)primaryPlayerWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    id v5 = +[GKDispatchGroup dispatchGroupWithName:@"getPrimaryPlayer"];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_1000B6668;
    v22 = sub_1000B6678;
    id v23 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000B6B8C;
    v17[3] = &unk_1002D8D50;
    v17[4] = &v18;
    v17[5] = a1;
    [v5 perform:v17];
    id v6 = [v5 waitWithTimeout:5.0];
    if (v19[5])
    {
      v7 = 0;
    }
    else
    {
      v7 = +[NSError _gkUserErrorForGameSessionErrorCode:2 userInfo:0];
    }
    if (v6 || v7)
    {
      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers();
      }
      v16 = os_log_GKAccount;
      if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
        sub_1000BAC90((uint64_t)v7, (uint64_t)v6, v16);
      }
      uint64_t v14 = 0;
      v13 = v7;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v10 = (id)GKOSLoggers();
      }
      v11 = os_log_GKAccount;
      if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = v19[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fetched primary iCloud player: %@", buf, 0xCu);
      }
      v13 = 0;
      uint64_t v14 = v19[5];
    }
    v4[2](v4, v14, v13);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    v9 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_1000BAC4C(v9);
    }
  }
}

+ (BOOL)isOwnZoneID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ownerName];
  if ([v5 isEqualToString:CKCurrentUserDefaultName])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v7 = [v4 ownerName];
    id v8 = [a1 sessionCache];
    v9 = [v8 userRecordID];
    id v10 = [v9 recordName];
    unsigned __int8 v6 = [v7 isEqualToString:v10];
  }
  return v6;
}

+ (id)databaseForZoneID:(id)a3
{
  if ([a1 isOwnZoneID:a3]) {
    +[GKCloudKitMultiplayerUtils privateDatabase];
  }
  else {
  v3 = +[GKCloudKitMultiplayerUtils sharedDatabase];
  }

  return v3;
}

+ (void)bundleIDsForContainerName:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[GKDispatchGroup dispatchGroupWithName:@"bundleIDsForContainerName"];
    if (v6)
    {
      v9 = [a1 sessionCache];
      id v10 = [v9 bundleIDsForContainerName:v6];
      [v8 setResult:v10];

      v11 = [v8 result];

      if (!v11)
      {
        uint64_t v12 = +[CKContainer containerWithIdentifier:v6];
        v13 = v12;
        if (v12)
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1000B6F6C;
          v19[3] = &unk_1002D48B0;
          id v20 = v12;
          id v21 = v6;
          id v22 = v9;
          id v23 = v8;
          [v23 perform:v19];

          uint64_t v14 = v20;
        }
        else
        {
          id v24 = v6;
          uint64_t v14 = +[NSArray arrayWithObjects:&v24 count:1];
          [v8 setResult:v14];
        }
      }
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B71D4;
    v16[3] = &unk_1002D3930;
    id v17 = v8;
    id v18 = v7;
    id v15 = v8;
    [v15 notifyOnMainQueueWithBlock:v16];
  }
}

+ (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [v6 share];
  v9 = [v8 recordID];

  id v10 = [v9 zoneID];
  v11 = [v10 zoneName];

  if (([v11 isEqualToString:@"com.apple.legacygaming.invites"] & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_1000BAD08();
    }
LABEL_17:
    v7[2](v7, 0);
    goto LABEL_19;
  }
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  v13 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Handle CloudKit share metadata - %@", buf, 0xCu);
  }
  uint64_t v14 = +[GKReporter reporter];
  [v14 recordMessageInviteProcessingTimestamp];

  id v15 = +[GKInviteURLManager sharedManager];
  v16 = [v15 acceptingInProgressRecordIDs];
  unsigned int v17 = [v16 containsObject:v9];

  if (!v17)
  {
    id v21 = +[GKInviteURLManager sharedManager];
    id v22 = [v21 acceptingInProgressRecordIDs];
    [v22 addObject:v9];

    id v23 = +[GKDispatchGroup dispatchGroupWithName:@"acceptShareWithShareMetadata"];
    LOBYTE(v22) = [v6 participantStatus] != (id)2;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000B7614;
    v30[3] = &unk_1002D8D78;
    id v33 = a1;
    id v31 = v6;
    char v34 = (char)v22;
    id v24 = v23;
    id v32 = v24;
    [v24 perform:v30];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B7724;
    v26[3] = &unk_1002D3AE8;
    id v27 = v9;
    id v28 = v24;
    v29 = v7;
    id v25 = v24;
    [v25 notifyOnMainQueueWithBlock:v26];

    goto LABEL_19;
  }
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers();
  }
  v19 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Already processing same share metadata, returning.", buf, 2u);
  }
  if (v7) {
    goto LABEL_17;
  }
LABEL_19:
}

+ (void)handleLegacyShareMetadata:(id)a3 needsAccept:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = +[GKDispatchGroup dispatchGroupWithName:@"acceptShareWithShareMetadata"];
  if (v6)
  {
    v11 = v18;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B798C;
    v18[3] = &unk_1002D4900;
    v18[4] = v8;
    v18[6] = a1;
    v18[5] = v10;
  }
  else
  {
    v11 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000B7BA4;
    v17[3] = &unk_1002D4900;
    v17[4] = v8;
    v17[5] = v10;
    void v17[6] = a1;
  }
  [v10 perform:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B7EC8;
  v14[3] = &unk_1002D3930;
  id v15 = v10;
  id v16 = v9;
  id v12 = v10;
  id v13 = v9;
  [v12 notifyOnMainQueueWithBlock:v14];
}

+ (void)acceptShareMetadata:(id)a3 retryCount:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc((Class)CKAcceptSharesOperation);
  id v25 = v8;
  v11 = +[NSArray arrayWithObjects:&v25 count:1];
  id v12 = [v10 initWithShareMetadatas:v11];

  id v13 = +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer];
  [v12 setConfiguration:v13];

  unsigned int v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1000B80D0;
  id v20 = &unk_1002D8E18;
  id v22 = v9;
  id v23 = a1;
  id v21 = v8;
  int v24 = a4;
  id v14 = v9;
  id v15 = v8;
  [v12 setAcceptSharesCompletionBlock:&v17];
  id v16 = +[CKContainer containerWithIdentifier:@"com.apple.socialgaming.sessions", v17, v18, v19, v20];
  [v16 addOperation:v12];
}

+ (id)packFakeRealTimeBulletinWithZoneData:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "packFakeRealTimeBulletinWithZoneData: %@", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = +[GKPlayerCredentialController sharedController];
  id v8 = +[GKDataRequestManager sharedManager];
  id v9 = [v7 primaryCredentialForEnvironment:[v8 currentEnvironment]];

  [v6 setObject:&off_1002F20F0 forKeyedSubscript:GKPushCommandKey];
  v78 = v9;
  id v10 = [v9 playerInternal];
  v11 = [v10 playerID];
  [v6 setObject:v11 forKeyedSubscript:@"i"];

  id v12 = [v3 objectForKeyedSubscript:@"session-token"];

  if (v12)
  {
    id v13 = [v3 objectForKeyedSubscript:@"session-token"];
    [v6 setObject:v13 forKeyedSubscript:@"s"];
  }
  else
  {
    [v6 setObject:&stru_1002E4F58 forKeyedSubscript:@"s"];
  }
  id v14 = [v3 objectForKeyedSubscript:@"playerID"];

  if (v14)
  {
    id v15 = [v3 objectForKeyedSubscript:@"playerID"];
    [v6 setObject:v15 forKeyedSubscript:@"I"];
  }
  else
  {
    [v6 setObject:&stru_1002E4F58 forKeyedSubscript:@"I"];
  }
  id v16 = [v3 objectForKeyedSubscript:@"self-push-token"];

  if (v16)
  {
    unsigned int v17 = [v3 objectForKeyedSubscript:@"self-push-token"];
    [v6 setObject:v17 forKeyedSubscript:@"P"];
  }
  else
  {
    [v6 setObject:&stru_1002E4F58 forKeyedSubscript:@"P"];
  }
  uint64_t v18 = [v3 objectForKeyedSubscript:@"self-nat-type"];

  if (v18)
  {
    v19 = [v3 objectForKeyedSubscript:@"self-nat-type"];
    [v6 setObject:v19 forKeyedSubscript:@"N"];
  }
  else
  {
    [v6 setObject:&stru_1002E4F58 forKeyedSubscript:@"N"];
  }
  id v20 = [v3 objectForKeyedSubscript:@"self-nat-ip"];

  if (v20)
  {
    id v21 = [v3 objectForKeyedSubscript:@"self-nat-ip"];
    [v6 setObject:v21 forKeyedSubscript:@"A"];
  }
  else
  {
    [v6 setObject:&stru_1002E4F58 forKeyedSubscript:@"A"];
  }
  id v22 = [v3 objectForKeyedSubscript:@"self-blob"];

  if (v22)
  {
    id v23 = [v3 objectForKeyedSubscript:@"self-blob"];
    [v6 setObject:v23 forKeyedSubscript:@"B"];
  }
  else
  {
    [v6 setObject:&stru_1002E4F58 forKeyedSubscript:@"B"];
  }
  int v24 = [v3 objectForKeyedSubscript:@"blob-type"];

  if (v24)
  {
    id v25 = [v3 objectForKeyedSubscript:@"blob-type"];
    [v6 setObject:v25 forKeyedSubscript:@"g"];
  }
  else
  {
    [v6 setObject:&stru_1002E4F58 forKeyedSubscript:@"g"];
  }
  v26 = [v3 objectForKeyedSubscript:@"self-nat-type"];
  id v27 = [v26 integerValue];

  *(void *)buf = v27;
  id v28 = [&stru_1002E4F58 dataUsingEncoding:4];
  v29 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[v28 length] + 2);
  [v29 appendBytes:buf length:1];
  v30 = [v3 objectForKeyedSubscript:@"matchType"];
  id v31 = [v30 integerValue];

  BOOL v80 = v31 == (id)1;
  [v29 appendBytes:&v80 length:1];
  [v29 appendData:v28];
  [v29 appendBytes:&unk_10024F2A0 length:1];
  id v32 = [v3 objectForKeyedSubscript:@"inviteVersion"];
  uint64_t v33 = [v32 unsignedIntValue];

  uint64_t v79 = v33;
  [v29 appendBytes:&v79 length:1];
  char v34 = [v29 base64EncodedStringWithOptions:0];
  v35 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v34, @"s", 0];
  id v36 = [v3 objectForKeyedSubscript:@"g"];

  if (v36)
  {
    v37 = [v3 objectForKeyedSubscript:@"g"];
    [v35 setObject:v37 forKey:@"g"];
  }
  else
  {
    [v35 setObject:&stru_1002E4F58 forKey:@"g"];
  }
  v38 = [v3 objectForKeyedSubscript:@"a"];

  if (v38)
  {
    v39 = [v3 objectForKeyedSubscript:@"a"];
    [v35 setObject:v39 forKey:@"a"];
  }
  else
  {
    [v35 setObject:&stru_1002E4F58 forKey:@"a"];
  }
  uint64_t v40 = GKTransportPseudonymKey;
  uint64_t v41 = [v3 objectForKeyedSubscript:GKTransportPseudonymKey];
  v42 = (void *)v41;
  if (v41) {
    CFStringRef v43 = (const __CFString *)v41;
  }
  else {
    CFStringRef v43 = &stru_1002E4F58;
  }
  [v35 setObject:v43 forKey:v40];

  uint64_t v44 = GKInviteSessionIDKey;
  uint64_t v45 = [v3 objectForKeyedSubscript:GKInviteSessionIDKey];
  v46 = (void *)v45;
  if (v45) {
    CFStringRef v47 = (const __CFString *)v45;
  }
  else {
    CFStringRef v47 = &stru_1002E4F58;
  }
  [v35 setObject:v47 forKey:v44];

  uint64_t v48 = GKSuggestedTransportVersionPushShortKey;
  v49 = [v3 objectForKeyedSubscript:GKSuggestedTransportVersionPushShortKey];
  if (v49)
  {
    [v35 setObject:v49 forKey:v48];
  }
  else
  {
    v50 = +[NSNumber numberWithInteger:1];
    [v35 setObject:v50 forKey:v48];
  }
  uint64_t v51 = GKInviteArchivedParticipantInfoKey;
  v52 = [v3 objectForKeyedSubscript:GKInviteArchivedParticipantInfoKey];

  if (v52)
  {
    v53 = [v3 objectForKeyedSubscript:v51];
    v54 = +[NSKeyedUnarchiver unarchiveObjectWithData:v53];

    uint64_t v55 = GKInviteGameParticipantsKey;
    v56 = [v54 objectForKeyedSubscript:GKInviteGameParticipantsKey];

    if (v56)
    {
      v57 = [v54 objectForKeyedSubscript:v55];
      [v35 setObject:v57 forKey:v55];
    }
    uint64_t v58 = GKInviteLobbyParticipantsKey;
    v59 = [v54 objectForKeyedSubscript:GKInviteLobbyParticipantsKey];

    if (v59)
    {
      v60 = [v54 objectForKeyedSubscript:v58];
      [v35 setObject:v60 forKey:v58];
    }
  }
  [v6 setObject:v35 forKeyedSubscript:@"x"];
  v61 = +[NSMutableDictionary dictionary];
  uint64_t v62 = [v3 objectForKeyedSubscript:@"bundle-id"];
  v63 = (void *)v62;
  if (v62) {
    CFStringRef v64 = (const __CFString *)v62;
  }
  else {
    CFStringRef v64 = &stru_1002E4F58;
  }
  [v61 setObject:v64 forKey:@"i"];

  uint64_t v65 = [v3 objectForKeyedSubscript:@"bundle-version"];
  v66 = (void *)v65;
  if (v65) {
    CFStringRef v67 = (const __CFString *)v65;
  }
  else {
    CFStringRef v67 = &stru_1002E4F58;
  }
  [v61 setObject:v67 forKey:@"v"];

  uint64_t v68 = [v3 objectForKeyedSubscript:@"short-bundle-version"];
  v69 = (void *)v68;
  if (v68) {
    CFStringRef v70 = (const __CFString *)v68;
  }
  else {
    CFStringRef v70 = &stru_1002E4F58;
  }
  [v61 setObject:v70 forKey:@"V"];

  uint64_t v71 = [v3 objectForKeyedSubscript:@"adam-id"];
  v72 = (void *)v71;
  if (v71) {
    CFStringRef v73 = (const __CFString *)v71;
  }
  else {
    CFStringRef v73 = &stru_1002E4F58;
  }
  [v61 setObject:v73 forKey:@"a"];

  uint64_t v74 = [v3 objectForKeyedSubscript:@"p"];
  v75 = (void *)v74;
  if (v74) {
    CFStringRef v76 = (const __CFString *)v74;
  }
  else {
    CFStringRef v76 = &stru_1002E4F58;
  }
  [v61 setObject:v76 forKey:@"p"];

  [v6 setObject:v61 forKeyedSubscript:@"d"];
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:GKInviteIsFromMessageKey];

  return v6;
}

+ (id)packFakeTurnBasedBulletinWithZoneData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[GKPlayerCredentialController sharedController];
  id v6 = +[GKDataRequestManager sharedManager];
  id v7 = [v5 primaryCredentialForEnvironment:[v6 currentEnvironment]];

  [v4 setObject:&off_1002F2108 forKeyedSubscript:GKPushCommandKey];
  id v8 = [v7 playerInternal];
  id v9 = [v8 playerID];
  [v4 setObject:v9 forKeyedSubscript:@"i"];

  [v4 setObject:&stru_1002E4F58 forKeyedSubscript:@"m"];
  id v10 = +[NSNumber numberWithInteger:1];
  [v4 setObject:v10 forKeyedSubscript:@"t"];

  v11 = [v3 objectForKeyedSubscript:@"session-id"];

  if (v11)
  {
    id v12 = [v3 objectForKeyedSubscript:@"session-id"];
    [v4 setObject:v12 forKeyedSubscript:@"s"];
  }
  else
  {
    [v4 setObject:&stru_1002E4F58 forKeyedSubscript:@"s"];
  }
  id v13 = [v3 objectForKeyedSubscript:@"playerID"];

  if (v13)
  {
    id v14 = [v3 objectForKeyedSubscript:@"playerID"];
    [v4 setObject:v14 forKeyedSubscript:@"I"];
  }
  else
  {
    [v4 setObject:&stru_1002E4F58 forKeyedSubscript:@"I"];
  }
  id v15 = +[NSMutableDictionary dictionary];
  id v16 = [v3 objectForKeyedSubscript:@"bundle-id"];

  if (v16)
  {
    unsigned int v17 = [v3 objectForKeyedSubscript:@"bundle-id"];
    [v15 setObject:v17 forKey:@"i"];
  }
  else
  {
    [v15 setObject:&stru_1002E4F58 forKey:@"i"];
  }
  uint64_t v18 = [v3 objectForKeyedSubscript:@"bundle-version"];

  if (v18)
  {
    v19 = [v3 objectForKeyedSubscript:@"bundle-version"];
    [v15 setObject:v19 forKey:@"v"];
  }
  else
  {
    [v15 setObject:&stru_1002E4F58 forKey:@"v"];
  }
  id v20 = [v3 objectForKeyedSubscript:@"short-bundle-version"];

  if (v20)
  {
    id v21 = [v3 objectForKeyedSubscript:@"short-bundle-version"];
    [v15 setObject:v21 forKey:@"V"];
  }
  else
  {
    [v15 setObject:&stru_1002E4F58 forKey:@"V"];
  }
  id v22 = [v3 objectForKeyedSubscript:@"adam-id"];

  if (v22)
  {
    id v23 = [v3 objectForKeyedSubscript:@"adam-id"];
    [v15 setObject:v23 forKey:@"a"];
  }
  else
  {
    [v15 setObject:&stru_1002E4F58 forKey:@"a"];
  }
  [v4 setObject:v15 forKeyedSubscript:@"d"];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:GKInviteIsFromMessageKey];

  return v4;
}

+ (void)generateAndStoreInviteBulletinForRecord:(id)a3 database:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[GKInviteURLManager sharedManager];
  unsigned int v8 = [v7 isRecordEqualToMostRecentInviteShare:v5];

  if (v8)
  {
    id v9 = [v5 objectForKeyedSubscript:@"connectionData"];

    if (v9)
    {
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKCloudKitMultiplayer.m", 556, "+[GKCloudKitMultiplayer generateAndStoreInviteBulletinForRecord:database:]");
      v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000B95AC;
      v15[3] = &unk_1002D3A70;
      id v16 = v5;
      id v17 = v6;
      [v11 perform:v15];
      [v11 notifyOnMainQueueWithBlock:&stru_1002D8E60];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v14 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        sub_1000BAEAC();
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    id v13 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_1000BAF14(v13, v5);
    }
  }
}

+ (id)msgServiceQueue
{
  if (qword_1003296D8 != -1) {
    dispatch_once(&qword_1003296D8, &stru_1002D8E80);
  }
  v2 = (void *)qword_1003296D0;

  return v2;
}

+ (void)getAssociatedAccountsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() msgServiceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9C48;
  block[3] = &unk_1002D3A20;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (id)formattedContact:(id)a3
{
  id v3 = a3;
  if (IMStringIsEmail())
  {
    id v4 = [v3 lowercaseString];
    id v5 = +[NSMutableString stringWithString:v4];
LABEL_5:

    goto LABEL_7;
  }
  if (IMStringIsPhoneNumber())
  {
    id v4 = +[NSCharacterSet punctuationCharacterSet];
    id v6 = [v3 stringByRemovingCharactersFromSet:v4];
    id v7 = +[NSCharacterSet symbolCharacterSet];
    unsigned int v8 = [v6 stringByRemovingCharactersFromSet:v7];
    id v5 = [v8 stringByRemovingWhitespace];

    goto LABEL_5;
  }
  id v5 = +[NSMutableString string];
LABEL_7:

  return v5;
}

+ (id)lastSevenDigits:(id)a3
{
  id v3 = a3;
  if ([v3 length] == (id)7) {
    id v4 = 0;
  }
  else {
    id v4 = (char *)[v3 length] - 7;
  }
  id v5 = [v3 substringFromIndex:v4];

  return v5;
}

+ (void)searchAndSaveIdentityForRecord:(id)a3 database:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GK-InviteMessage: begin searchAndSaveIdentityForRecord", buf, 2u);
  }
  id v13 = +[GKPlayerCredentialController sharedController];
  id v14 = +[GKDataRequestManager sharedManager];
  id v15 = [v13 primaryCredentialForEnvironment:[v14 currentEnvironment]];

  id v16 = [v15 playerInternal];
  id v17 = [v16 playerID];

  if (v17)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000BA12C;
    v20[3] = &unk_1002D8EA8;
    id v21 = v8;
    id v25 = a1;
    id v22 = v17;
    id v23 = v9;
    id v24 = v10;
    +[GKCloudKitMultiplayer getAssociatedAccountsWithCompletionHandler:v20];
  }
  else if (v10)
  {
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers();
    }
    v19 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_1000BB0CC(v19);
    }
    (*((void (**)(id, id, void))v10 + 2))(v10, v8, 0);
  }
}

+ (void)deleteInviteRecordWithRecordID:(id)a3 fromDatabase:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a4;
    id v7 = objc_alloc((Class)CKModifyRecordsOperation);
    id v12 = v5;
    id v8 = +[NSArray arrayWithObjects:&v12 count:1];
    id v9 = [v7 initWithRecordsToSave:0 recordIDsToDelete:v8];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BAB64;
    v10[3] = &unk_1002D8ED0;
    id v11 = v5;
    [v9 setModifyRecordsCompletionBlock:v10];
    [v6 addOperation:v9];
  }
}

@end