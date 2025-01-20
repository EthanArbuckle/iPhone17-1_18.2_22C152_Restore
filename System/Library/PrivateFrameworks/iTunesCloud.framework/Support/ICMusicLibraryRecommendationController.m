@interface ICMusicLibraryRecommendationController
+ (ICMusicLibraryRecommendationController)sharedLibraryRecommendationController;
- (BOOL)_setupCacheDirectoryStructureWithPath:(id)a3;
- (ICMusicLibraryRecommendationController)init;
- (id)_cacheDirectoryPath;
- (id)_createLocalNotificationDictionaryForRecommendationResult:(id)a3 storePlatformMetadata:(id)a4 recommendationID:(id)a5 identifier:(id)a6;
- (id)_getNetworkConstraints;
- (id)_optInMessageContentForPriorityMessageContent:(id)a3;
- (id)_retrievePreviousRecommendationMatchesFromCache;
- (id)_storeRequestContext;
- (id)_wrapAndCacheResponseModelWithCompiledMLModel:(id)a3;
- (void)_cacheMatchedRecommendations:(id)a3;
- (void)_cleanupExpiredApplicationMessages;
- (void)_clearMLModelCache;
- (void)_clearRecommendationsData;
- (void)_computeLibraryRecommendationWithResponse:(id)a3 completionHandler:(id)a4;
- (void)_createApplicationMessagesForResult:(id)a3 artistNewContentResponse:(id)a4 completion:(id)a5;
- (void)_fetchRecommendationsSetAndModelWithCompletionHandler:(id)a3;
- (void)_handleNewArtistContentResponseNotification:(id)a3;
- (void)_handleRecommendationsResponseModel:(id)a3 completion:(id)a4;
- (void)_optInMessageForPriorityMessage:(id)a3 completion:(id)a4;
- (void)_performRecommendationsRequest;
- (void)_performRecommendationsUpdate;
- (void)_updateOptInIfNecessary;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)handleAccountStateChange:(id)a3;
- (void)scheduleRecommendationsRefreshTimer;
- (void)startSystemService;
- (void)stopSystemService;
@end

@implementation ICMusicLibraryRecommendationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDSID, 0);
  objc_storeStrong((id *)&self->_subscriptionObservationToken, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_affinityAnalyzer, 0);
}

- (id)_createLocalNotificationDictionaryForRecommendationResult:(id)a3 storePlatformMetadata:(id)a4 recommendationID:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  id v64 = a5;
  id v65 = a6;
  v54 = +[NSMutableDictionary dictionary];
  id v9 = [v8 storeAdamID];
  v55 = ICBundleIdentifierForSystemApplicationType();
  v10 = +[NSBundle mediaPlayerBundle];
  uint64_t v11 = [v10 localizedStringForKey:@"NEW_ALBUM_NOTIFICATION_TITLE" value:&stru_1001BF9F0 table:@"MediaPlayer"];

  v12 = +[NSBundle mediaPlayerBundle];
  uint64_t v13 = [v12 localizedStringForKey:@"NEW_ALBUM_NOTIFICATION_BODY_FORMAT" value:&stru_1001BF9F0 table:@"MediaPlayer"];

  v14 = [v8 name];
  v59 = v8;
  v15 = [v8 artistName];
  v62 = (void *)v13;
  uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v15);

  v76[0] = @"title";
  v76[1] = @"body";
  v63 = (void *)v11;
  v77[0] = v11;
  v77[1] = v16;
  v61 = (void *)v16;
  v60 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
  objc_msgSend(v54, "setObject:forKey:");
  v17 = +[NSMutableArray array];
  v75[0] = &off_1001CC200;
  v74[0] = @"_tp";
  v74[1] = @"_url";
  v18 = +[NSString stringWithFormat:@"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100", v9];
  v75[1] = v18;
  v74[2] = @"_mt";
  v73[0] = @"tap";
  v72[0] = @"actionType";
  v72[1] = @"actionUrl";
  v19 = +[NSString stringWithFormat:@"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100", v9];
  v73[1] = v19;
  v73[2] = @"notificationAction";
  v72[2] = @"eventType";
  v72[3] = @"eventVersion";
  v73[3] = &off_1001CC200;
  v73[4] = v65;
  v72[4] = @"notificationId";
  v72[5] = @"targetType";
  v73[5] = @"notification";
  v73[6] = v64;
  v72[6] = @"recoId";
  v72[7] = @"topic";
  v73[7] = @"xp_amp_notifications";
  v73[8] = v55;
  v72[8] = @"app";
  v72[9] = @"notificationType";
  v72[10] = @"details";
  v73[9] = @"Content";
  v73[10] = &off_1001CCDF8;
  v20 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:11];
  v75[2] = v20;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];

  v58 = (void *)v21;
  [v17 addObject:v21];
  v70[0] = @"_tl";
  v22 = +[NSBundle mediaPlayerBundle];
  v23 = [v22 localizedStringForKey:@"NEW_ALBUM_NOTIFICATION_GOTO_BUTTON_TITLE" value:&stru_1001BF9F0 table:@"MediaPlayer"];
  v71[0] = v23;
  v70[1] = @"_url";
  v24 = +[NSString stringWithFormat:@"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100", v9];
  v71[1] = v24;
  v70[2] = @"_mt";
  v69[0] = @"goToAlbum";
  v68[0] = @"actionType";
  v68[1] = @"actionUrl";
  v25 = +[NSString stringWithFormat:@"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100", v9];
  v69[1] = v25;
  v69[2] = @"notificationAction";
  v68[2] = @"eventType";
  v68[3] = @"eventVersion";
  v69[3] = &off_1001CC200;
  v69[4] = v65;
  v68[4] = @"notificationId";
  v68[5] = @"targetId";
  v69[5] = @"AmpMusic.Notifications.NewRelease.Buttons.GoToAlbum";
  v69[6] = @"button";
  v68[6] = @"targetType";
  v68[7] = @"recoId";
  v69[7] = v64;
  v69[8] = @"xp_amp_notifications";
  v68[8] = @"topic";
  v68[9] = @"app";
  v69[9] = v55;
  v69[10] = @"Content";
  v68[10] = @"notificationType";
  v68[11] = @"details";
  v69[11] = &off_1001CCE20;
  v26 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:12];
  v71[2] = v26;
  uint64_t v27 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:3];

  v57 = (void *)v27;
  [v17 addObject:v27];
  [v54 setObject:v17 forKey:@"_ba"];
  [v54 setObject:&off_1001CC200 forKey:@"content-available"];
  v28 = +[ICUserIdentityStore defaultIdentityStore];
  v29 = +[ICUserIdentity activeAccount];
  v30 = [v28 DSIDForUserIdentity:v29 outError:0];

  if (v30)
  {
    v31 = [v30 stringValue];
    [v54 setObject:v31 forKey:@"_ds"];
  }
  else
  {
    [v54 setObject:@"0" forKey:@"_ds"];
  }
  v32 = [v59 artworkInfos];
  v33 = [v32 firstObject];

  v56 = v33;
  v34 = objc_msgSend(v33, "artworkURLWithSize:cropStyle:format:", ICStoreArtworkInfoCropStyleBoundedBox, ICStoreArtworkInfoImageFormatJPEG, 210.0, 210.0);
  v35 = v34;
  if (v34)
  {
    v36 = [v34 absoluteString];
    [v54 setObject:v36 forKey:@"_au"];
  }
  [v54 setObject:&off_1001CC218 forKey:@"_it"];
  if ([v59 isExplicit]) {
    CFStringRef v37 = @"true";
  }
  else {
    CFStringRef v37 = @"false";
  }
  [v54 setObject:v37 forKey:@"_ex"];
  v38 = +[NSString stringWithFormat:@"ams_%@", v65];
  [v54 setObject:v38 forKey:@"_id"];

  [v54 setObject:v55 forKey:@"_bid"];
  v39 = [v59 releaseDate];
  if (v39)
  {
    v40 = +[NSDate now];
    id v41 = [v39 compare:v40];

    if (v41 == (id)1)
    {
      id v42 = objc_alloc_init((Class)NSDateFormatter);
      [v42 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
      id v43 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
      [v42 setLocale:v43];

      v44 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
      [v42 setTimeZone:v44];

      v45 = [v42 stringFromDate:v39];
      [v54 setObject:v45 forKey:@"_st"];
    }
  }
  v66[0] = @"eventType";
  v66[1] = @"eventVersion";
  v67[0] = @"notificationRequest";
  v67[1] = &off_1001CC200;
  v66[2] = @"isExplicit";
  unsigned int v46 = [v59 isExplicit];
  CFStringRef v47 = @"0";
  if (v46) {
    CFStringRef v47 = @"1";
  }
  v67[2] = v47;
  v66[3] = @"language";
  v48 = +[ICDeviceInfo currentDeviceInfo];
  uint64_t v49 = [v48 currentLocale];
  v50 = (void *)v49;
  CFStringRef v51 = &stru_1001BF9F0;
  if (v49) {
    CFStringRef v51 = (const __CFString *)v49;
  }
  v67[3] = v51;
  v67[4] = v65;
  v66[4] = @"notificationId";
  v66[5] = @"notificationType";
  v67[5] = @"Content";
  v67[6] = @"29";
  v66[6] = @"platformId";
  v66[7] = @"platformName";
  v67[7] = @"P84";
  v67[8] = v64;
  v66[8] = @"recoId";
  v66[9] = @"topic";
  v67[9] = @"xp_amp_notifications";
  v67[10] = v55;
  v66[10] = @"app";
  v66[11] = @"details";
  v67[11] = &off_1001CCE48;
  v52 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:12];

  [v54 setObject:v52 forKey:@"_mt"];

  return v54;
}

- (void)_updateOptInIfNecessary
{
  v3 = ICBundleIdentifierForSystemApplicationType();
  v4 = +[ICInAppMessageManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BCA5C;
  v6[3] = &unk_1001BDF70;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 messageEntriesForBundleIdentifier:v5 completion:v6];
}

- (void)_optInMessageForPriorityMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICInAppMessageManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BD7BC;
  v11[3] = &unk_1001BCAE0;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 messageEntryWithIdentifier:@"non-subscriber-notification-content-opt-in" bundleIdentifier:@"com.apple.amp.inappmessages.private" completion:v11];
}

- (id)_optInMessageContentForPriorityMessageContent:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ICIAMMessageContent);
  [v4 setIdentifier:@"album-lockup"];
  id v5 = objc_alloc_init((Class)ICIAMParameter);
  [v5 setKey:@"albumTitle"];
  id v6 = [v3 title];
  [v5 setValue:v6];

  id v7 = objc_alloc_init((Class)ICIAMParameter);
  [v7 setKey:@"artistName"];
  id v8 = [v3 subtitle];
  [v7 setValue:v8];

  [v4 addContentParameters:v5];
  [v4 addContentParameters:v7];
  id v9 = [v3 images];

  id v10 = [v9 firstObject];
  [v4 addImages:v10];

  return v4;
}

- (void)_createApplicationMessagesForResult:(id)a3 artistNewContentResponse:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)ICStorePlatformRequest);
  id v12 = [(ICMusicLibraryRecommendationController *)self _storeRequestContext];
  [v11 setRequestContext:v12];

  id v13 = [v8 adamID];
  v14 = [v13 stringValue];

  v26 = v14;
  v15 = +[NSArray arrayWithObjects:&v26 count:1];
  [v11 setItemIdentifiers:v15];

  [v11 setPersonalizationStyle:1];
  [v11 setKeyProfile:ICStorePlatformKeyProfilePlaylistProduct];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000BDCE4;
  v21[3] = &unk_1001BCAB8;
  id v24 = v9;
  id v25 = v10;
  v21[4] = self;
  id v22 = v14;
  id v23 = v8;
  id v16 = v9;
  id v17 = v8;
  id v18 = v14;
  id v19 = v10;
  id v20 = [v11 performWithResponseHandler:v21];
}

- (void)_cleanupExpiredApplicationMessages
{
  id v3 = ICBundleIdentifierForSystemApplicationType();
  id v4 = +[ICInAppMessageManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BF6EC;
  v6[3] = &unk_1001BDF70;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  [v4 messageEntriesForBundleIdentifier:v5 completion:v6];
}

- (id)_retrievePreviousRecommendationMatchesFromCache
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1000BFB54;
  id v12 = sub_1000BFB64;
  id v13 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BFB6C;
  v7[3] = &unk_1001BE648;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  id v3 = (void *)v9[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSArray array];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_cacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v3 = [v2 firstObject];

  id v4 = [v3 stringByAppendingPathComponent:@"Caches/com.apple.iTunesCloud/LibraryRecommendations/ResourceCache"];

  return v4;
}

- (id)_getNetworkConstraints
{
  v2 = ICBundleIdentifierForSystemApplicationType();
  id v3 = [objc_alloc((Class)ICNetworkConstraints) initWithBundleIdentifier:v2];

  return v3;
}

- (id)_storeRequestContext
{
  id v2 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:&stru_1001BCA20];

  return v2;
}

- (id)_wrapAndCacheResponseModelWithCompiledMLModel:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 hasModel])
  {
    id v13 = 0;
    v14 = 0;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  id v6 = +[NSFileManager defaultManager];
  uint64_t v7 = [(ICMusicLibraryRecommendationController *)self _cacheDirectoryPath];
  uint64_t v8 = +[NSURL fileURLWithPath:v7];
  v40 = [v8 URLByAppendingPathComponent:@"serializedRecommendationsResponse"];
  v39 = [v8 URLByAppendingPathComponent:@"compiledMLModel.mlmodelc"];
  v38 = (void *)v7;
  unsigned int v37 = [(ICMusicLibraryRecommendationController *)self _setupCacheDirectoryStructureWithPath:v7];
  if (v37)
  {
    v34 = [v5 data];
    v35 = [v5 model];
    id v9 = [v8 URLByAppendingPathComponent:@"modelDataBlob.bin"];
    uint64_t v10 = [v9 path];
    unsigned int v11 = [v6 fileExistsAtPath:v10];

    if (v11)
    {
      v48[0] = 0;
      [v6 removeItemAtURL:v9 error:v48];
      id v12 = v48[0];
    }
    else
    {
      id v12 = 0;
    }
    id v17 = [v9 path];
    id v47 = v12;
    [v35 writeToFile:v17 options:1 error:&v47];
    id v18 = v47;

    id v46 = v18;
    v36 = +[MLModel compileModelAtURL:v9 error:&v46];
    id v19 = v46;

    if (v19) {
      +[NSException raise:NSInternalInconsistencyException, @"MLModel compileModelAtURL failed with error %@", v19 format];
    }
    id v45 = v19;
    v33 = +[MLModel modelWithContentsOfURL:v36 error:&v45];
    id v20 = v45;

    uint64_t v21 = v20;
    if (v20) {
      +[NSException raise:NSInternalInconsistencyException, @"MLModel modelWithContentsOfURL failed with error %@", v20 format];
    }
    id v22 = [v39 path];
    unsigned int v23 = [v6 fileExistsAtPath:v22];

    if (v23)
    {
      v44 = v21;
      id v24 = &v44;
      [v6 replaceItemAtURL:v39 withItemAtURL:v36 backupItemName:0 options:1 resultingItemURL:0 error:&v44];
    }
    else
    {
      id v43 = v21;
      id v24 = &v43;
      [v6 copyItemAtURL:v36 toURL:v39 error:&v43];
    }
    id v25 = *v24;

    v26 = [v40 path];
    unsigned int v27 = [v6 fileExistsAtPath:v26];

    if (v27)
    {
      id v42 = v25;
      [v6 removeItemAtURL:v40 error:&v42];
      id v13 = v42;
    }
    else
    {
      id v13 = v25;
    }
    v28 = [v40 path];
    [v34 writeToFile:v28 atomically:1];

    v29 = [v9 path];
    unsigned int v30 = [v6 fileExistsAtPath:v29];

    if (v30)
    {
      v31 = [v9 path];
      id v41 = v13;
      [v6 removeItemAtPath:v31 error:&v41];
      id v32 = v41;

      id v13 = v32;
    }
    v14 = [[ICMusicLibraryRecommendationsResponse alloc] initWithNewArtistContentResponseModel:v5 andMLModel:v33];
  }
  else
  {
    id v13 = 0;
    v14 = 0;
  }

  if (!v37) {
    goto LABEL_7;
  }
  v14 = v14;
  v15 = v14;
LABEL_8:

  return v15;
}

- (BOOL)_setupCacheDirectoryStructureWithPath:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  char v16 = 0;
  unsigned int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v16];
  if (v6) {
    BOOL v7 = v16 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v15 = 0;
    [v5 removeItemAtPath:v4 error:&v15];
    id v9 = v15;
  }
  else
  {
    if (v6) {
      BOOL v8 = v16 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      BOOL v12 = 1;
      goto LABEL_16;
    }
    id v9 = 0;
  }
  id v14 = v9;
  BOOL v12 = 1;
  [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v10 = v14;

  if (v10)
  {
    unsigned int v11 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ failed to create cache directory structure err=%{public}@", buf, 0x16u);
    }

    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

- (void)_clearMLModelCache
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(ICMusicLibraryRecommendationController *)self _cacheDirectoryPath];
  id v5 = +[NSURL fileURLWithPath:v4];
  unsigned int v6 = [v5 URLByAppendingPathComponent:@"compiledMLModel.mlmodelc"];
  BOOL v7 = [v6 path];
  unsigned int v8 = [v3 fileExistsAtPath:v7];

  if (v8)
  {
    id v11 = 0;
    [v3 removeItemAtURL:v6 error:&v11];
    id v9 = v11;
    if (v9)
    {
      id v10 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v13 = self;
        __int16 v14 = 2114;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to remove cached MLModel. err=%{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_fetchRecommendationsSetAndModelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [ICMusicLibraryRecommendationsRequest alloc];
  unsigned int v6 = [(ICMusicLibraryRecommendationController *)self _storeRequestContext];
  BOOL v7 = [(ICMusicLibraryRecommendationsRequest *)v5 initWithStoreRequestContext:v6 params:&off_1001CCDD0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C07C0;
  v9[3] = &unk_1001BCA00;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(ICMusicLibraryRecommendationsRequest *)v7 performRequestWithResponseHandler:v9];
}

- (void)_computeLibraryRecommendationWithResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 responseModel];
  id v9 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning Affininity Analysis using MLModel.", buf, 0xCu);
  }

  affinityAnalyzer = self->_affinityAnalyzer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C0A3C;
  v14[3] = &unk_1001BC9D8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  [(ICMusicLibraryArtistAffinityAnalyzer *)affinityAnalyzer performLibraryAnalysisFromResponse:v11 withCompletionHandler:v14];
}

- (void)_handleRecommendationsResponseModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 artistContentsCount];
    id v10 = [v6 recoId];
    *(_DWORD *)buf = 138543874;
    id v16 = self;
    __int16 v17 = 2048;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Received New Release Recommendations response, %lu new release albums, recoID: %@.", buf, 0x20u);
  }
  id v11 = [(ICMusicLibraryRecommendationController *)self _wrapAndCacheResponseModelWithCompiledMLModel:v6];
  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C1190;
    v12[3] = &unk_1001BC9B0;
    v12[4] = self;
    id v14 = v7;
    id v13 = v6;
    [(ICMusicLibraryRecommendationController *)self _computeLibraryRecommendationWithResponse:v11 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_performRecommendationsRequest
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating recommendations", buf, 0xCu);
  }

  id v4 = +[ICUserIdentityStore defaultIdentityStore];
  id v5 = +[ICUserIdentity activeAccount];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C1984;
  v6[3] = &unk_1001BC960;
  void v6[4] = self;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v6];
}

- (void)_performRecommendationsUpdate
{
  [(ICMusicLibraryRecommendationController *)self _cleanupExpiredApplicationMessages];
  self->_failedToPerformAnalysis = 0;
  id v3 = [(ICMusicLibraryRecommendationController *)self _getNetworkConstraints];
  id v4 = +[ICEnvironmentMonitor sharedMonitor];
  if ([v4 isWiFiAssociated])
  {
  }
  else
  {
    unsigned __int8 v5 = [v3 shouldAllowDataForCellularNetworkTypes];

    if ((v5 & 1) == 0)
    {
LABEL_8:
      self->_failedToPerformAnalysis = 1;
      goto LABEL_19;
    }
  }
  id v6 = +[ICPrivacyInfo sharedPrivacyInfo];
  unsigned int v7 = [v6 privacyAcknowledgementRequiredForMusic];

  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping recommendations update because the user needs to accept the privacy notice", buf, 0xCu);
    }

    goto LABEL_8;
  }
  if (CFPreferencesGetAppBooleanValue(@"UserRequestedSubscriptionHidden", @"com.apple.mobileipod", 0))
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Will not perform recommendations update. The user has disabled Apple Music.", buf, 0xCu);
    }
  }
  else
  {
    if ([v3 shouldAllowDataForCellularNetworkTypes])
    {
      id v10 = +[ICEnvironmentMonitor sharedMonitor];
      unsigned __int8 v11 = [v10 isWiFiAssociated];

      if ((v11 & 1) == 0)
      {
        id v12 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v15 = self;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing recommendations update on cellular network", buf, 0xCu);
        }
      }
    }
    id v9 = +[ICMusicAccountNotificationsSettingsManager sharedManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000C218C;
    v13[3] = &unk_1001BC8E8;
    v13[4] = self;
    [v9 getAccountNotificationsWithCompletionHandler:v13];
  }

LABEL_19:
}

- (void)_cacheMatchedRecommendations:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C2410;
  v7[3] = &unk_1001BECC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)_clearRecommendationsData
{
  id v3 = [(ICMusicLibraryRecommendationController *)self _cacheDirectoryPath];
  id v4 = +[NSURL URLWithString:v3];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = [v4 URLByAppendingPathComponent:@"serializedRecommendationsResponse"];
    unsigned int v7 = [v5 URLByAppendingPathComponent:@"compiledMLModel.mlmodelc"];
    id v8 = [v5 URLByAppendingPathComponent:@"musicRecommendationsData"];
    id v9 = +[NSFileManager defaultManager];
    id v10 = [v6 path];
    id v18 = 0;
    [v9 removeItemAtPath:v10 error:&v18];
    id v11 = v18;

    id v12 = [v7 path];
    id v17 = v11;
    [v9 removeItemAtPath:v12 error:&v17];
    id v13 = v17;

    id v14 = [v8 path];
    id v16 = v13;
    [v9 removeItemAtPath:v14 error:&v16];
    id v15 = v16;
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@ Cache Directory URL is nil failed to clear cached recommendations data with path received: %{public}@", buf, 0x16u);
    }
    id v15 = 0;
  }
}

- (void)_handleNewArtistContentResponseNotification:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:@"ICMusicLibraryRecommendationsHandleNewArtistContentFilePath"];

  id v6 = +[NSFileManager defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    id v12 = 0;
    unsigned int v7 = +[NSString stringWithContentsOfFile:v5 encoding:4 error:&v12];
    id v8 = v12;
    id v9 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v7 options:1];
    if (!v9 || v8)
    {
      id v10 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v14 = self;
        __int16 v15 = 2114;
        id v16 = v5;
        __int16 v17 = 2114;
        id v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create NSData blob from filePath=%{public}@ err=%{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v10 = [[AMPMusicArtistNewContentResponse alloc] initWithData:v9];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000C2B80;
      v11[3] = &unk_1001BE408;
      v11[4] = self;
      [(ICMusicLibraryRecommendationController *)self _handleRecommendationsResponseModel:v10 completion:v11];
    }
  }
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v9 = a3;
  id v4 = [(ICMusicLibraryRecommendationController *)self _getNetworkConstraints];
  unsigned __int8 v5 = +[NSDate now];
  [v5 timeIntervalSince1970];
  if (self->_failedToPerformAnalysis)
  {
    double v7 = v6;
    double lastTimePeriodicXPCFired = self->_lastTimePeriodicXPCFired;
    if (((uint64_t)[v9 networkType] > 999
       || [v4 shouldAllowDataForCellularNetworkTypes])
      && v7 - lastTimePeriodicXPCFired >= self->_refreshIntervalFromBag * 0.7)
    {
      [(ICMusicLibraryRecommendationController *)self _performRecommendationsUpdate];
    }
  }
}

- (void)handleAccountStateChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 userIdentityStore];
  double v6 = [v4 userIdentity];

  double v7 = [v5 DSIDForUserIdentity:v6 outError:0];

  if (v7)
  {
    [(ICMusicLibraryRecommendationController *)self startSystemService];
  }
  else
  {
    [(ICMusicLibraryRecommendationController *)self _clearRecommendationsData];
    [(ICMusicLibraryRecommendationController *)self stopSystemService];
  }
  lastSeenDSID = self->_lastSeenDSID;
  self->_lastSeenDSID = v7;
}

- (void)scheduleRecommendationsRefreshTimer
{
  id v3 = +[ICDefaults standardDefaults];
  if ([v3 shouldReduceLibraryRecommendationsXPCInterval])
  {

LABEL_7:
    double v7 = +[ICURLBagProvider sharedBagProvider];
    id v8 = [(ICMusicLibraryRecommendationController *)self _storeRequestContext];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C2F40;
    v9[3] = &unk_1001BC8C0;
    v9[4] = self;
    [v7 getBagForRequestContext:v8 forceRefetch:0 withCompletionHandler:v9];

    return;
  }
  id v4 = +[ICDefaults standardDefaults];
  unsigned int v5 = [v4 shouldForceLibraryRecommendationAnalysis];

  if (!v5) {
    goto LABEL_7;
  }
  double v6 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Forcing library recommendation analysis without a timer.", buf, 0xCu);
  }

  [(ICMusicLibraryRecommendationController *)self _performRecommendationsUpdate];
}

- (void)stopSystemService
{
  if (self->_isSystemService)
  {
    id v3 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping system service...", (uint8_t *)&v8, 0xCu);
    }

    self->_isSystemService = 0;
    self->_refreshIntervalFromBag = 0.0;
    id v4 = +[ICEnvironmentMonitor sharedMonitor];
    [v4 unregisterObserver:self];

    xpc_activity_unregister((const char *)[@"com.apple.itunescloud.library_recommendations_refresh" UTF8String]);
    if (self->_subscriptionObservationToken)
    {
      unsigned int v5 = +[ICUserIdentity autoupdatingActiveAccount];
      double v6 = +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:v5];

      [v6 endObservingSubscriptionStatusWithToken:self->_subscriptionObservationToken];
      subscriptionObservationToken = self->_subscriptionObservationToken;
      self->_subscriptionObservationToken = 0;
    }
    [(ICMusicLibraryRecommendationController *)self _cleanupExpiredApplicationMessages];
  }
}

- (void)startSystemService
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting system service...", buf, 0xCu);
  }

  if (!self->_isSystemService)
  {
    self->_isSystemService = 1;
    id v4 = +[ICEnvironmentMonitor sharedMonitor];
    [v4 registerObserver:self];

    unsigned int v5 = +[ICUserIdentity autoupdatingActiveAccount];
    double v6 = +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:v5];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C34F0;
    v9[3] = &unk_1001BC870;
    v9[4] = self;
    double v7 = [v6 beginObservingSubscriptionStatusWithHandler:v9];
    subscriptionObservationToken = self->_subscriptionObservationToken;
    self->_subscriptionObservationToken = v7;
  }
}

- (void)dealloc
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsHandleNewArtistContentResponseNotification"];
  [v3 removeObserver:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsClearCacheNotification"];

  v4.receiver = self;
  v4.super_class = (Class)ICMusicLibraryRecommendationController;
  [(ICMusicLibraryRecommendationController *)&v4 dealloc];
}

- (ICMusicLibraryRecommendationController)init
{
  v15.receiver = self;
  v15.super_class = (Class)ICMusicLibraryRecommendationController;
  id v2 = [(ICMusicLibraryRecommendationController *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    v2->_isSystemService = 0;
    objc_super v4 = +[ICUserIdentityStore defaultIdentityStore];
    unsigned int v5 = +[ICUserIdentity activeAccount];
    uint64_t v6 = [v4 DSIDForUserIdentity:v5 outError:0];
    lastSeenDSID = v3->_lastSeenDSID;
    v3->_lastSeenDSID = (NSNumber *)v6;

    subscriptionObservationToken = v3->_subscriptionObservationToken;
    v3->_subscriptionObservationToken = 0;

    v3->_failedToPerformAnalysis = 0;
    v3->_double lastTimePeriodicXPCFired = 0.0;
    v3->_refreshIntervalFromBag = 0.0;
    id v9 = objc_alloc_init(ICMusicLibraryArtistAffinityAnalyzer);
    affinityAnalyzer = v3->_affinityAnalyzer;
    v3->_affinityAnalyzer = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.itunescloud.ICMusicLibraryRecommendationController.accessQueue", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v11;

    *(_WORD *)&v3->_userHasOptedIn = 0;
    id v13 = +[NSDistributedNotificationCenter defaultCenter];
    [v13 addObserver:v3 selector:"_handleNewArtistContentResponseNotification:" name:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsHandleNewArtistContentResponseNotification" object:0];
    [v13 addObserver:v3 selector:"_clearRecommendationsData" name:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsClearCacheNotification" object:0];
  }
  return v3;
}

+ (ICMusicLibraryRecommendationController)sharedLibraryRecommendationController
{
  if (qword_1001F38F8 != -1) {
    dispatch_once(&qword_1001F38F8, &stru_1001BC848);
  }
  id v2 = (void *)qword_1001F3900;

  return (ICMusicLibraryRecommendationController *)v2;
}

@end