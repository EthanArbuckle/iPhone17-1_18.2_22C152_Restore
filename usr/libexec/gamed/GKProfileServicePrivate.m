@interface GKProfileServicePrivate
+ (Class)interfaceClass;
+ (id)cacheKeyForScopedIDs:(id)a3;
+ (id)cacheKeyForScopedIDsWithGameBundleID:(id)a3 playerID:(id)a4;
+ (id)makeGKScopedIDsFromInternal:(id)a3;
+ (id)parseContactAssociationIDsFromRelationships:(id)a3 contactAssociationIDMap:(id)a4 contacts:(id)a5;
+ (id)scopedIDsFetchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4;
+ (unint64_t)requiredEntitlements;
- (id)contactsIntegrationController;
- (id)fetchScopedIDsCacheKeysWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5;
- (id)filterPlayerIDsThatNeedPreloading:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5;
- (id)loadCachedScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 error:(id *)a5 moc:(id)a6;
- (void)allowFriendInvitesFrom:(unint64_t)a3 handler:(id)a4;
- (void)cachePhotos:(id)a3 avatarType:(id)a4 fileNames:(id)a5 handler:(id)a6;
- (void)clearContactsIntegrationCachesWithCompletionHandler:(id)a3;
- (void)clearScopedIdsCacheWithHandler:(id)a3;
- (void)deletePhotoWithHandler:(id)a3;
- (void)denyFriendInvitesFrom:(unint64_t)a3 handler:(id)a4;
- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 cachedScopedIDs:(id)a5 handler:(id)a6;
- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDsCacheKeys:(id)a5 cacheOnly:(BOOL)a6 handler:(id)a7;
- (void)fetchAndCacheScopedPlayerIDsForRequest:(id)a3 scopedIDsCacheKeys:(id)a4 cacheOnly:(BOOL)a5 handler:(id)a6;
- (void)filterForContactIDsSupportingFriendingViaPushFromContactIDs:(id)a3 withCompletion:(id)a4;
- (void)getContactAssociationIDsForContacts:(id)a3 shouldRefresh:(BOOL)a4 completionHandler:(id)a5;
- (void)getContactsForContactAssociationIDs:(id)a3 completionHandler:(id)a4;
- (void)getContactsIntegrationConsentWithCompletionHandler:(id)a3;
- (void)getContextualPromptStatesWithCompletion:(id)a3;
- (void)getFriendingViaPushEnabledWithCompletion:(id)a3;
- (void)getGameCenterRelationshipsForContact:(id)a3 shouldRefresh:(BOOL)a4 completionHandler:(id)a5;
- (void)getNicknameSuggestions:(int64_t)a3 handler:(id)a4;
- (void)getProfilePrivacyWithHandler:(id)a3;
- (void)getProfilesForPlayerIDs:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5;
- (void)getProfilesForPlayerIDs:(id)a3 playerIdToContactAssociationIdMap:(id)a4 handler:(id)a5;
- (void)getTermsAndConditionsURLWithHandler:(id)a3;
- (void)invalidateCachedProfileForLocalPlayerWithHandler:(id)a3;
- (void)loadProfileForPlayer:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6;
- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5;
- (void)preloadInstalledGamesScopedPlayerIDs:(id)a3 completion:(id)a4;
- (void)setArcadeSubscriptionExpiration:(id)a3 handler:(id)a4;
- (void)setContactsIntegrationConsent:(int)a3 withCompletionHandler:(id)a4;
- (void)setFindable:(BOOL)a3 handler:(id)a4;
- (void)setFriendInvitesAllowedFlag:(id)a3 source:(unint64_t)a4 handler:(id)a5;
- (void)setGlobalFriendListAccess:(int)a3 handler:(id)a4;
- (void)setPhotoData:(id)a3 avatarType:(id)a4 handler:(id)a5;
- (void)setPlayerNickname:(id)a3 suggestionsCount:(int64_t)a4 handler:(id)a5;
- (void)setPrivacyNoticeVersion:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)setProfilePrivacy:(int)a3 handler:(id)a4;
- (void)setProfileSettings:(id)a3 handler:(id)a4;
- (void)setStatus:(id)a3 handler:(id)a4;
- (void)startContactsIntegrationIDSSyncForHandles:(id)a3 completionHandler:(id)a4;
- (void)startContactsIntegrationSyncWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateContactsIntegrationInfoFromLocalPlayerProfile:(id)a3 completionHandler:(id)a4;
@end

@implementation GKProfileServicePrivate

- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[NSPredicate predicateWithBlock:&stru_1002D54F0];
  v12 = [v10 filteredArrayUsingPredicate:v11];

  if ([v12 count] && objc_msgSend(v8, "count"))
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1689, "-[GKProfileServicePrivate loadScopedPlayerIDs:gameBundleIDs:handler:]");
    v14 = [(GKService *)self transactionGroupWithName:v13];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000426CC;
    v27[3] = &unk_1002D4FB0;
    v27[4] = self;
    id v15 = v12;
    id v28 = v15;
    id v16 = v8;
    id v29 = v16;
    id v17 = v14;
    id v30 = v17;
    [v17 performOnManagedObjectContext:v27];
    v18 = [(GKService *)self clientProxy];
    v19 = [v18 replyQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004277C;
    v21[3] = &unk_1002D5518;
    id v22 = v17;
    id v23 = v15;
    id v24 = v16;
    v25 = self;
    id v26 = v9;
    id v20 = v17;
    [v20 notifyOnQueue:v19 block:v21];
  }
  else
  {
    (*((void (**)(id, void *, void))v9 + 2))(v9, &__NSArray0__struct, 0);
  }
}

+ (unint64_t)requiredEntitlements
{
  return 0x20000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)setStatus:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if ((unint64_t)[v8 length] >= 0x8D)
  {
    id v9 = [v8 substringToIndex:140];
  }
  id v10 = [(GKService *)self clientProxy];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 608, "-[GKProfileServicePrivate setStatus:handler:]");
  v12 = [(GKService *)self transactionGroupWithName:v11];

  v13 = [(GKService *)self clientProxy];
  v14 = [v13 replyQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100039688;
  v22[3] = &unk_1002D48B0;
  id v15 = v12;
  id v23 = v15;
  id v16 = v9;
  id v24 = v16;
  id v17 = v10;
  id v25 = v17;
  id v26 = self;
  [v15 performOnQueue:v14 block:v22];

  if (v7)
  {
    v18 = [v17 replyQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100039948;
    v19[3] = &unk_1002D3930;
    id v21 = v7;
    id v20 = v15;
    [v20 notifyOnQueue:v18 block:v19];
  }
}

- (void)cachePhotos:(id)a3 avatarType:(id)a4 fileNames:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 641, "-[GKProfileServicePrivate cachePhotos:avatarType:fileNames:handler:]");
  id v15 = [(GKService *)self transactionGroupWithName:v14];

  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100039BD0;
  v26[3] = &unk_1002D4518;
  id v18 = v15;
  id v27 = v18;
  id v19 = v11;
  id v28 = v19;
  id v29 = self;
  id v20 = v10;
  id v30 = v20;
  id v21 = v12;
  id v31 = v21;
  [v18 performOnQueue:v17 block:v26];

  if (v13)
  {
    id v22 = [(GKService *)self clientProxy];
    id v23 = [v22 replyQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100039EE0;
    v24[3] = &unk_1002D3A20;
    id v25 = v13;
    [v18 notifyOnQueue:v23 block:v24];
  }
}

- (void)setPhotoData:(id)a3 avatarType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 673, "-[GKProfileServicePrivate setPhotoData:avatarType:handler:]");
  id v12 = [(GKService *)self transactionGroupWithName:v11];

  id v13 = [(GKService *)self clientProxy];
  v14 = [v13 replyQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003A0F0;
  v22[3] = &unk_1002D48B0;
  id v15 = v12;
  id v23 = v15;
  id v24 = self;
  id v16 = v8;
  id v25 = v16;
  id v17 = v9;
  id v26 = v17;
  [v15 performOnQueue:v14 block:v22];

  if (v10)
  {
    id v18 = [(GKService *)self clientProxy];
    id v19 = [v18 replyQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003A4DC;
    v20[3] = &unk_1002D3A20;
    id v21 = v10;
    [v15 notifyOnQueue:v19 block:v20];
  }
}

- (void)deletePhotoWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKProfileService: deletePhotoWithHandler", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 709, "-[GKProfileServicePrivate deletePhotoWithHandler:]");
  id v8 = [(GKService *)self transactionGroupWithName:v7];

  id v9 = [(GKService *)self clientProxy];
  id v10 = [v9 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003A6FC;
  v16[3] = &unk_1002D3A70;
  id v11 = v8;
  id v17 = v11;
  id v18 = self;
  [v11 performOnQueue:v10 block:v16];

  if (v4)
  {
    id v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003A98C;
    v14[3] = &unk_1002D3A20;
    id v15 = v4;
    [v11 notifyOnQueue:v13 block:v14];
  }
}

- (void)setFindable:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 739, "-[GKProfileServicePrivate setFindable:handler:]");
  id v8 = [(GKService *)self transactionGroupWithName:v7];

  id v9 = [v8 context];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003AACC;
  v12[3] = &unk_1002D5028;
  BOOL v16 = a3;
  id v13 = v8;
  v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 performBlock:v12];
}

- (void)setPlayerNickname:(id)a3 suggestionsCount:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 772, "-[GKProfileServicePrivate setPlayerNickname:suggestionsCount:handler:]");
    id v11 = [(GKService *)self transactionGroupWithName:v10];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003B05C;
    v20[3] = &unk_1002D5078;
    int64_t v24 = a4;
    id v21 = v8;
    id v22 = self;
    id v12 = v11;
    id v23 = v12;
    [v12 performOnManagedObjectContext:v20];
    id v13 = [(GKService *)self clientProxy];
    v14 = [v13 replyQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003B568;
    v17[3] = &unk_1002D3930;
    id v18 = v12;
    id v19 = v9;
    id v15 = v12;
    [v15 notifyOnQueue:v14 block:v17];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100044CD8();
    }
    id v15 = +[NSError userErrorForCode:17 underlyingError:0];
    (*((void (**)(id, void *, void, id))v9 + 2))(v9, &__NSArray0__struct, 0, v15);
  }
}

- (void)getNicknameSuggestions:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  CFStringRef v24 = @"suggestions-count";
  id v7 = +[NSNumber numberWithInteger:a3];
  id v25 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 820, "-[GKProfileServicePrivate getNicknameSuggestions:handler:]");
  id v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003B844;
  v20[3] = &unk_1002D3980;
  id v21 = v8;
  id v22 = self;
  id v11 = v10;
  id v23 = v11;
  id v12 = v8;
  [v11 perform:v20];
  id v13 = [(GKService *)self clientProxy];
  v14 = [v13 replyQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003BA54;
  v17[3] = &unk_1002D3930;
  id v18 = v11;
  id v19 = v6;
  id v15 = v11;
  id v16 = v6;
  [v15 notifyOnQueue:v14 block:v17];
}

- (void)getTermsAndConditionsURLWithHandler:(id)a3
{
  id v4 = a3;
  CFStringRef v21 = @"key";
  CFStringRef v22 = @"TD.termsOfServiceURL";
  id v5 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 844, "-[GKProfileServicePrivate getTermsAndConditionsURLWithHandler:]");
  id v7 = +[GKDispatchGroup dispatchGroupWithName:v6];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003BCE4;
  v17[3] = &unk_1002D3980;
  id v18 = v5;
  id v19 = self;
  id v8 = v7;
  id v20 = v8;
  id v9 = v5;
  [v8 perform:v17];
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003BEF0;
  v14[3] = &unk_1002D3930;
  id v15 = v8;
  id v16 = v4;
  id v12 = v8;
  id v13 = v4;
  [v12 notifyOnQueue:v11 block:v14];
}

- (void)setGlobalFriendListAccess:(int)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 866, "-[GKProfileServicePrivate setGlobalFriendListAccess:handler:]");
  id v8 = [(GKService *)self transactionGroupWithName:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003C108;
  v17[3] = &unk_1002D5118;
  int v19 = a3;
  void v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  [v9 performOnManagedObjectContext:v17];
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003C3E8;
  v14[3] = &unk_1002D3930;
  id v15 = v9;
  id v16 = v6;
  id v12 = v9;
  id v13 = v6;
  [v12 notifyOnQueue:v11 block:v14];
}

- (void)setArcadeSubscriptionExpiration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 908, "-[GKProfileServicePrivate setArcadeSubscriptionExpiration:handler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003C608;
  v19[3] = &unk_1002D3980;
  id v20 = v6;
  CFStringRef v21 = self;
  id v10 = v9;
  id v22 = v10;
  id v11 = v6;
  [v10 perform:v19];
  id v12 = [(GKService *)self clientProxy];
  id v13 = [v12 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003C790;
  v16[3] = &unk_1002D3930;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)allowFriendInvitesFrom:(unint64_t)a3 handler:(id)a4
{
}

- (void)denyFriendInvitesFrom:(unint64_t)a3 handler:(id)a4
{
}

- (void)setFriendInvitesAllowedFlag:(id)a3 source:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  id v11 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = +[NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKProfileService: setFriendInvitesAllowedFlag: %@, source: %@", buf, 0x16u);
  }
  id v14 = +[NSMutableDictionary dictionary];
  id v15 = v14;
  if (a4) {
    [v14 setObject:v8 forKeyedSubscript:@"allow-friend-invites-from-challenges"];
  }
  if ((a4 & 2) != 0) {
    [v15 setObject:v8 forKeyedSubscript:@"allow-friend-invites-from-multiplayer-invites"];
  }
  if ([v15 count])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003CA2C;
    v17[3] = &unk_1002D5140;
    id v18 = v9;
    [(GKProfileServicePrivate *)self setProfileSettings:v15 handler:v17];
    id v16 = v18;
  }
  else
  {
    id v16 = +[NSError userErrorForCode:17 description:@"At least one source must be selected"];
    (*((void (**)(id, void *))v9 + 2))(v9, v16);
  }
}

- (void)setPrivacyNoticeVersion:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKProfileService: setPrivacyNoticeVersion:%lu", buf, 0xCu);
  }
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  id v10 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412290;
    unint64_t v21 = (unint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Syncing the privacy notice version (%@) to the server...", buf, 0xCu);
  }
  uint64_t v18 = GKAccountPrivacyNoticeVersionKey;
  id v13 = +[NSNumber numberWithUnsignedInteger:a3];
  int v19 = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003CD60;
  v16[3] = &unk_1002D5140;
  id v17 = v6;
  id v15 = v6;
  [(GKProfileServicePrivate *)self setProfileSettings:v14 handler:v16];
}

- (void)setProfilePrivacy:(int)a3 handler:(id)a4
{
  id v6 = a4;
  CFStringRef v7 = @"everyone";
  if (a3 == 2) {
    CFStringRef v7 = @"me";
  }
  if (a3 == 1) {
    CFStringRef v8 = @"friends";
  }
  else {
    CFStringRef v8 = v7;
  }
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  id v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKProfileService: setProfilePrivacy:%@", buf, 0xCu);
  }
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 995, "-[GKProfileServicePrivate setProfilePrivacy:handler:]");
  id v12 = [(GKService *)self transactionGroupWithName:v11];

  id v13 = [(GKService *)self clientProxy];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003D100;
  v24[3] = &unk_1002D5168;
  int v28 = a3;
  id v25 = (__CFString *)v8;
  id v26 = self;
  id v14 = v12;
  id v27 = v14;
  [v14 performOnManagedObjectContext:v24];
  id v15 = [(GKService *)self clientProxy];
  id v16 = [v15 replyQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003D418;
  v20[3] = &unk_1002D3A48;
  id v21 = v14;
  id v22 = v13;
  id v23 = v6;
  id v17 = v6;
  id v18 = v13;
  id v19 = v14;
  [v19 notifyOnQueue:v16 block:v20];
}

- (void)setProfileSettings:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1039, "-[GKProfileServicePrivate setProfileSettings:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003D660;
  v19[3] = &unk_1002D3D30;
  id v20 = v6;
  id v21 = self;
  id v10 = v9;
  id v22 = v10;
  id v11 = v6;
  [v10 performOnManagedObjectContext:v19];
  id v12 = [(GKService *)self clientProxy];
  id v13 = [v12 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003D860;
  v16[3] = &unk_1002D3930;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)invalidateCachedProfileForLocalPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1064, "-[GKProfileServicePrivate invalidateCachedProfileForLocalPlayerWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  [v6 performOnManagedObjectContext:&stru_1002D51D0];
  if (v4)
  {
    id v7 = [(GKService *)self clientProxy];
    CFStringRef v8 = [v7 replyQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003DA84;
    v9[3] = &unk_1002D3A20;
    id v10 = v4;
    [v6 notifyOnQueue:v8 block:v9];
  }
}

- (void)getProfilePrivacyWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKProfileService: getProfilePrivacyWithHandler", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1081, "-[GKProfileServicePrivate getProfilePrivacyWithHandler:]");
  CFStringRef v8 = [(GKService *)self transactionGroupWithName:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003DC7C;
  v17[3] = &unk_1002D51F8;
  id v9 = v8;
  id v18 = v9;
  [v9 performOnManagedObjectContext:v17];
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003DD2C;
  v14[3] = &unk_1002D3C38;
  id v15 = v9;
  id v16 = v4;
  id v12 = v4;
  id v13 = v9;
  [v13 notifyOnQueue:v11 block:v14];
}

- (id)contactsIntegrationController
{
  return +[GKContactsIntegrationController sharedController];
}

- (void)getContactsIntegrationConsentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKProfileService: getContactsIntegrationConsentWithCompletionHandler", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1104, "-[GKProfileServicePrivate getContactsIntegrationConsentWithCompletionHandler:]");
  CFStringRef v8 = [(GKService *)self transactionGroupWithName:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003DF88;
  v17[3] = &unk_1002D51F8;
  id v9 = v8;
  id v18 = v9;
  [v9 performOnManagedObjectContext:v17];
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003E0E4;
  v14[3] = &unk_1002D3C38;
  id v15 = v9;
  id v16 = v4;
  id v12 = v4;
  id v13 = v9;
  [v13 notifyOnQueue:v11 block:v14];
}

- (void)setContactsIntegrationConsent:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  CFStringRef v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKProfileService: setContactsIntegrationConsent:%d", buf, 8u);
  }
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1123, "-[GKProfileServicePrivate setContactsIntegrationConsent:withCompletionHandler:]");
  id v10 = [(GKService *)self transactionGroupWithName:v9];

  id v11 = [(GKService *)self clientProxy];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003E3A8;
  v22[3] = &unk_1002D5118;
  int v24 = a3;
  void v22[4] = self;
  id v12 = v10;
  id v23 = v12;
  [v12 performOnManagedObjectContext:v22];
  id v13 = [(GKService *)self clientProxy];
  id v14 = [v13 replyQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003E990;
  v18[3] = &unk_1002D3A48;
  id v19 = v12;
  id v20 = v11;
  id v21 = v6;
  id v15 = v6;
  id v16 = v11;
  id v17 = v12;
  [v17 notifyOnQueue:v14 block:v18];
}

- (void)updateContactsIntegrationInfoFromLocalPlayerProfile:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKProfileServicePrivate updateContactsIntegrationInfoFromLocalPlayerProfile:completionHandler:]", v9);
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"];
    id v12 = [v11 lastPathComponent];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKProfileServicePrivate updateContactsIntegrationInfoFromLocalPlayerProfile:completionHandler:]", [v12 UTF8String], 1191);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  id v14 = +[GKPlayerCredentialController sharedController];
  id v15 = [v6 contactsAssociationID];
  id v16 = [v6 contactsIntegrationConsent];
  id v17 = [v6 serviceLastUpdatedTimestamp];
  id v18 = [(GKService *)self clientProxy];
  id v19 = [v18 environment];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003EC4C;
  v21[3] = &unk_1002D45D8;
  id v22 = v7;
  id v20 = v7;
  [v14 setContactAssociationID:v15 contactIntegrationConsent:v16 serviceLastUpdateTimestamp:v17 forEnvironment:v19 forcefully:0 completionHandler:v21];
}

- (void)getGameCenterRelationshipsForContact:(id)a3 shouldRefresh:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1225, "-[GKProfileServicePrivate getGameCenterRelationshipsForContact:shouldRefresh:completionHandler:]");
      id v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10003EF00;
      v23[3] = &unk_1002D3FB8;
      v23[4] = self;
      id v24 = v8;
      BOOL v26 = a4;
      id v12 = v11;
      id v25 = v12;
      [v12 perform:v23];
      id v13 = [(GKService *)self clientProxy];
      id v14 = [v13 replyQueue];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10003F09C;
      v20[3] = &unk_1002D3930;
      id v21 = v12;
      id v22 = v9;
      id v15 = v12;
      [v15 notifyOnQueue:v14 block:v20];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v18 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_100045108();
      }
      id v19 = +[NSError errorWithDomain:GKContactsIntegrationErrorDomain code:8 userInfo:0];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v19);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers();
    }
    id v17 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100045078(v17);
    }
  }
}

- (void)getContactAssociationIDsForContacts:(id)a3 shouldRefresh:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1260, "-[GKProfileServicePrivate getContactAssociationIDsForContacts:shouldRefresh:completionHandler:]");
      id v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10003F3AC;
      v22[3] = &unk_1002D3FB8;
      void v22[4] = self;
      id v23 = v8;
      BOOL v25 = a4;
      id v12 = v11;
      id v24 = v12;
      [v12 perform:v22];
      id v13 = [(GKService *)self clientProxy];
      id v14 = [v13 replyQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10003F614;
      v19[3] = &unk_1002D3930;
      id v20 = v12;
      id v21 = v9;
      id v15 = v12;
      [v15 notifyOnQueue:v14 block:v19];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_100045108();
      }
      id v18 = +[NSError errorWithDomain:GKContactsIntegrationErrorDomain code:8 userInfo:0];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v18);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_10004513C();
    }
  }
}

- (void)getContactsForContactAssociationIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1305, "-[GKProfileServicePrivate getContactsForContactAssociationIDs:completionHandler:]");
    id v9 = [(GKService *)self transactionGroupWithName:v8];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003F888;
    v18[3] = &unk_1002D3D30;
    void v18[4] = self;
    id v19 = v6;
    id v10 = v9;
    id v20 = v10;
    [v10 performOnManagedObjectContext:v18];
    id v11 = [(GKService *)self clientProxy];
    id v12 = [v11 replyQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F930;
    v15[3] = &unk_1002D3930;
    id v16 = v10;
    id v17 = v7;
    id v13 = v10;
    [v13 notifyOnQueue:v12 block:v15];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100045234();
    }
  }
}

- (void)clearContactsIntegrationCachesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(GKProfileServicePrivate *)self contactsIntegrationController];
  [v5 clearCachesWithCompletionHandler:v4];
}

- (void)startContactsIntegrationSyncWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(GKProfileServicePrivate *)self contactsIntegrationController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003FAA8;
  v9[3] = &unk_1002D3A20;
  id v10 = v6;
  id v8 = v6;
  [v7 startWithOptions:a3 completion:v9];
}

- (void)startContactsIntegrationIDSSyncForHandles:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKProfileServicePrivate *)self contactsIntegrationController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003FC00;
  v11[3] = &unk_1002D3BC8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 syncIDSDataForHandles:v10 forcefully:1 completion:v11];
}

- (void)filterForContactIDsSupportingFriendingViaPushFromContactIDs:(id)a3 withCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FD54;
  v7[3] = &unk_1002D52C0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(GKProfileServicePrivate *)v8 getFriendingViaPushEnabledWithCompletion:v7];
}

- (void)getFriendingViaPushEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self transport];
  id v6 = [v5 storeBag];

  if (v6)
  {
    uint64_t v13 = GKFriendingViaPushEnabled;
    id v7 = +[NSArray arrayWithObjects:&v13 count:1];
    id v8 = [(GKService *)self clientProxy];
    id v9 = [v8 replyQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100040320;
    v11[3] = &unk_1002D5140;
    id v12 = v4;
    [v6 getValuesForKeys:v7 queue:v9 completion:v11];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100045340();
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (void)getProfilesForPlayerIDs:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1398, "-[GKProfileServicePrivate getProfilesForPlayerIDs:fetchOptions:handler:]");
  id v11 = [(GKService *)self transactionGroupWithName:v10];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000405D8;
  v21[3] = &unk_1002D5310;
  void v21[4] = self;
  id v22 = v8;
  id v12 = v11;
  id v23 = v12;
  unint64_t v24 = a4;
  id v13 = v8;
  [v12 perform:v21];
  id v14 = [(GKService *)self clientProxy];
  id v15 = [v14 replyQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100040820;
  v18[3] = &unk_1002D3C38;
  id v19 = v12;
  id v20 = v9;
  id v16 = v9;
  id v17 = v12;
  [v17 notifyOnQueue:v15 block:v18];
}

- (void)getProfilesForPlayerIDs:(id)a3 playerIdToContactAssociationIdMap:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1434, "-[GKProfileServicePrivate getProfilesForPlayerIDs:playerIdToContactAssociationIdMap:handler:]");
  id v12 = [(GKService *)self transactionGroupWithName:v11];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100040B10;
  v23[3] = &unk_1002D48B0;
  v23[4] = self;
  id v24 = v8;
  id v13 = v12;
  id v25 = v13;
  id v26 = v9;
  id v14 = v9;
  id v15 = v8;
  [v13 perform:v23];
  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100040D84;
  v20[3] = &unk_1002D3C38;
  id v21 = v13;
  id v22 = v10;
  id v18 = v10;
  id v19 = v13;
  [v19 notifyOnQueue:v17 block:v20];
}

- (void)loadProfileForPlayer:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  if (v10)
  {
    id v34 = v10;
    id v14 = +[NSArray arrayWithObjects:&v34 count:1];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1481, "-[GKProfileServicePrivate loadProfileForPlayer:pieces:context:handler:]");
    id v16 = [(GKService *)self clientProxy];
    id v17 = +[GKCacheTransactionGroup transactionGroupWithName:v15 context:v11 client:v16];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100041174;
    v26[3] = &unk_1002D53B0;
    id v27 = v10;
    id v18 = v14;
    unsigned __int8 v32 = a4;
    id v28 = v18;
    id v29 = self;
    id v19 = v17;
    id v30 = v19;
    id v31 = v33;
    [v19 performOnManagedObjectContext:v26];
    if (v13)
    {
      id v20 = [(GKService *)self clientProxy];
      id v21 = [v20 replyQueue];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100041740;
      v22[3] = &unk_1002D4248;
      id v24 = v13;
      id v25 = v33;
      id v23 = v19;
      [v23 notifyOnQueue:v21 block:v22];
    }
  }
  else if (v12)
  {
    (*((void (**)(id, void, double))v12 + 2))(v12, 0, 0.0);
  }
  _Block_object_dispose(v33, 8);
}

- (void)preloadInstalledGamesScopedPlayerIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004191C;
  v13[3] = &unk_1002D3A20;
  id v7 = a4;
  id v14 = v7;
  id v8 = objc_retainBlock(v13);
  if ([v6 count])
  {
    id v9 = +[GKService serviceFromService:self];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100041934;
    v10[3] = &unk_1002D5428;
    id v12 = v8;
    v10[4] = self;
    id v11 = v6;
    [v9 fetchInstalledGameIdCacheWithHandler:v10];
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

+ (id)scopedIDsFetchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKCDScopedIds _gkFetchRequest];
  id v8 = +[NSPredicate predicateWithFormat:@"playerId IN %@ AND gameBundleId IN %@ AND fetchedOn != nil", v6, v5];

  [v7 setPredicate:v8];

  return v7;
}

- (id)filterPlayerIDsThatNeedPreloading:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v10, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v11 = +[NSThread callStackSymbols];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKProfileServicePrivate filterPlayerIDsThatNeedPreloading:gameBundleIDs:moc:]", v11);
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"];
    id v14 = [v13 lastPathComponent];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v12, "-[GKProfileServicePrivate filterPlayerIDsThatNeedPreloading:gameBundleIDs:moc:]", [v14 UTF8String], 1631);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }

  id v16 = +[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:v7 gameBundleIDs:v8];
  id v17 = objc_opt_new();
  [v17 setName:@"gameBundleIDCount"];
  id v18 = +[NSExpression expressionForKeyPath:@"gameBundleId"];
  v38 = v18;
  id v19 = +[NSArray arrayWithObjects:&v38 count:1];
  id v20 = +[NSExpression expressionForFunction:@"count:" arguments:v19];
  [v17 setExpression:v20];

  [v17 setExpressionResultType:200];
  v37[0] = @"playerId";
  v37[1] = v17;
  id v21 = +[NSArray arrayWithObjects:v37 count:2];
  [v16 setPropertiesToFetch:v21];

  [v16 setPropertiesToGroupBy:&off_1002F2E58];
  [v16 setResultType:2];
  id v22 = [v17 name];
  id v23 = +[NSExpression expressionForVariable:v22];
  id v24 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"%@ >= %d", v23, [v8 count]);
  [v16 setHavingPredicate:v24];

  id v36 = 0;
  id v25 = [v9 executeFetchRequest:v16 error:&v36];
  id v26 = v36;
  if (v26)
  {
    if (!os_log_GKGeneral) {
      id v27 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10004568C();
    }
    id v28 = &__NSArray0__struct;
  }
  else
  {
    id v29 = [v25 _gkMapWithBlock:&stru_1002D5468];
    id v30 = +[NSSet setWithArray:v29];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100042404;
    v34[3] = &unk_1002D5490;
    id v35 = v30;
    id v31 = v30;
    unsigned __int8 v32 = +[NSPredicate predicateWithBlock:v34];
    id v28 = [v7 filteredArrayUsingPredicate:v32];
  }

  return v28;
}

- (id)fetchScopedIDsCacheKeysWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v10, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v11 = +[NSThread callStackSymbols];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKProfileServicePrivate fetchScopedIDsCacheKeysWithPlayerIDs:gameBundleIDs:moc:]", v11);
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"];
    id v14 = [v13 lastPathComponent];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v12, "-[GKProfileServicePrivate fetchScopedIDsCacheKeysWithPlayerIDs:gameBundleIDs:moc:]", [v14 UTF8String], 1660);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }

  id v16 = +[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:v7 gameBundleIDs:v8];
  [v16 setPropertiesToFetch:&off_1002F2E70];
  [v16 setResultType:2];
  uint64_t v21 = 0;
  id v17 = [v9 executeFetchRequest:v16 error:&v21];
  id v18 = [v17 _gkMapWithBlock:&stru_1002D54B0];
  id v19 = +[NSSet setWithArray:v18];

  return v19;
}

+ (id)makeGKScopedIDsFromInternal:(id)a3
{
  id v3 = a3;
  id v4 = [v3 gamePlayerId];
  if (![v4 length])
  {
    id v10 = 0;
    goto LABEL_5;
  }
  id v5 = [v3 teamPlayerId];
  id v6 = [v5 length];

  if (v6)
  {
    id v4 = [v3 playerId];
    id v7 = [v3 gameBundleId];
    id v8 = [v3 gamePlayerId];
    id v9 = [v3 teamPlayerId];
    id v10 = +[GKScopedIDs makePersistentWithPlayerID:v4 gameBundleID:v7 gamePlayerID:v8 teamPlayerID:v9];

LABEL_5:
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)loadCachedScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 error:(id *)a5 moc:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v12 = +[NSThread callStackSymbols];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKProfileServicePrivate loadCachedScopedPlayerIDs:gameBundleIDs:error:moc:]", v12);
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"];
    id v15 = [v14 lastPathComponent];
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v13, "-[GKProfileServicePrivate loadCachedScopedPlayerIDs:gameBundleIDs:error:moc:]", [v15 UTF8String], 1760);

    +[NSException raise:@"GameKit Exception", @"%@", v16 format];
  }

  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    id v17 = +[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:v8 gameBundleIDs:v9];
    id v39 = 0;
    id v18 = [v10 executeFetchRequest:v17 error:&v39];
    id v19 = v39;
    id v20 = v19;
    if (v19)
    {
      if (a5) {
        *a5 = v19;
      }
      id v21 = &__NSArray0__struct;
    }
    else
    {
      id v31 = v17;
      id v33 = v8;
      id v22 = +[NSMutableArray array];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v18;
      id v24 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_10004305C;
            v34[3] = &unk_1002D5540;
            void v34[4] = v28;
            if (([v22 _gkContainsObjectPassingTest:v34] & 1) == 0)
            {
              id v29 = +[GKProfileServicePrivate makeGKScopedIDsFromInternal:v28];
              if (v29) {
                [v22 addObject:v29];
              }
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v25);
      }

      id v21 = [v22 copy];
      id v8 = v33;
      id v17 = v31;
      id v20 = 0;
    }
  }
  else
  {
    id v21 = &__NSArray0__struct;
  }

  return v21;
}

+ (id)cacheKeyForScopedIDs:(id)a3
{
  id v3 = a3;
  id v4 = [v3 gameBundleID];
  id v5 = [v3 playerID];

  id v6 = +[GKProfileServicePrivate cacheKeyForScopedIDsWithGameBundleID:v4 playerID:v5];

  return v6;
}

+ (id)cacheKeyForScopedIDsWithGameBundleID:(id)a3 playerID:(id)a4
{
  return +[NSString stringWithFormat:@"%@:%@", a3, a4];
}

- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 cachedScopedIDs:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [a5 _gkMapWithBlock:&stru_1002D5580];
  id v14 = +[NSSet setWithArray:v13];

  [(GKProfileServicePrivate *)self fetchAndCacheScopedPlayerIDs:v12 gameBundleIDs:v11 scopedIDsCacheKeys:v14 cacheOnly:0 handler:v10];
}

- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDsCacheKeys:(id)a5 cacheOnly:(BOOL)a6 handler:(id)a7
{
  id v12 = a3;
  id v33 = a5;
  id v13 = a7;
  id v14 = +[GKScopedIDsUtils filterUnsupportedGameBundleIDs:a4];
  if ([v14 count])
  {
    id v32 = v12;
    id v15 = +[GKScopedIDsUtils batchRequestWithPlayerIDs:v12 gameBundleIDs:v14 desiredSize:1000];
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1836, "-[GKProfileServicePrivate fetchAndCacheScopedPlayerIDs:gameBundleIDs:scopedIDsCacheKeys:cacheOnly:handler:]");
    id v17 = +[GKDispatchGroup dispatchGroupWithName:v16];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v15;
    id v19 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100043650;
          v38[3] = &unk_1002D55A8;
          v38[4] = self;
          v38[5] = v23;
          id v39 = v33;
          BOOL v41 = a6;
          id v40 = v17;
          [v40 perform:v38];
        }
        id v20 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v20);
    }

    id v24 = [(GKService *)self clientProxy];
    id v25 = [v24 replyQueue];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100043868;
    v34[3] = &unk_1002D55D0;
    BOOL v37 = a6;
    id v35 = v17;
    id v36 = v13;
    id v26 = v17;
    id v27 = v13;
    [v26 notifyOnQueue:v25 block:v34];

    id v12 = v32;
  }
  else
  {
    uint64_t v28 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v29 = (id)GKOSLoggers();
      uint64_t v28 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10004582C();
    }
    id v30 = [(GKService *)self clientProxy];
    id v31 = [v30 replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043634;
    block[3] = &unk_1002D3A20;
    id v47 = v13;
    id v18 = v13;
    dispatch_async(v31, block);

    id v27 = v47;
  }
}

- (void)fetchAndCacheScopedPlayerIDsForRequest:(id)a3 scopedIDsCacheKeys:(id)a4 cacheOnly:(BOOL)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v14 = [(GKService *)self clientProxy];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100043B90;
  v17[3] = &unk_1002D5620;
  id v18 = v10;
  id v19 = v11;
  void v17[4] = self;
  BOOL v20 = a5;
  id v15 = v10;
  id v16 = v11;
  [v13 issueRequest:v12 bagKey:@"gk-get-scoped-ids" clientProxy:v14 handler:v17];
}

- (void)clearScopedIdsCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1935, "-[GKProfileServicePrivate clearScopedIdsCacheWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100044384;
  v15[3] = &unk_1002D51F8;
  id v7 = v6;
  id v16 = v7;
  [v7 performOnManagedObjectContext:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044458;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)getContextualPromptStatesWithCompletion:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKProfileService: getContextualPromptStatesWithCompletion", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 1955, "-[GKProfileServicePrivate getContextualPromptStatesWithCompletion:]");
  id v8 = [(GKService *)self transactionGroupWithName:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000446BC;
  v17[3] = &unk_1002D4078;
  void v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  [v9 performOnManagedObjectContext:v17];
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100044858;
  v14[3] = &unk_1002D3930;
  id v15 = v9;
  id v16 = v4;
  id v12 = v9;
  id v13 = v4;
  [v12 notifyOnQueue:v11 block:v14];
}

+ (id)parseContactAssociationIDsFromRelationships:(id)a3 contactAssociationIDMap:(id)a4 contacts:(id)a5
{
  sub_100163CE4(0, &qword_100328298);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100163CE4(0, (unint64_t *)&qword_100326320);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1001CDC80(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1001CE1D8();
  v8.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

@end