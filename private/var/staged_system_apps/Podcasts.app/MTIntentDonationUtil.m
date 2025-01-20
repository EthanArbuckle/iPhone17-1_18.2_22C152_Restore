@interface MTIntentDonationUtil
- (BOOL)canContinueIntentWithUserActivityType:(id)a3;
- (BOOL)continueIntentsUserActivity:(id)a3;
- (Class)interactionClass;
- (MTDefaultsChangeNotifier)defaultsObserver;
- (MTImageStore)imageStore;
- (MTIntentDonationUtil)init;
- (MTPlaybackIdentifierComposing)identifierComposer;
- (NSMutableDictionary)cachedScores;
- (OS_dispatch_queue)donationQueue;
- (id)defaultPodcastArtworkData;
- (id)peopleScoresFromMediaData:(id)a3 keyedOnQid:(BOOL)a4;
- (id)topicScoresFromMediaData:(id)a3;
- (void)donateEpisodeUuid:(id)a3;
- (void)donateEpisodeUuid:(id)a3 completion:(id)a4;
- (void)donateEpisodeUuid:(id)a3 stationUuid:(id)a4 isPlaybackFromSiri:(BOOL)a5 completion:(id)a6;
- (void)donateManifestCurrentItem:(id)a3;
- (void)donateManifestCurrentItem:(id)a3 playReason:(unint64_t)a4;
- (void)fetchMediaDataForEpisodeStoreId:(int64_t)a3 podcastStoreId:(int64_t)a4 completion:(id)a5;
- (void)prepareImageDataForPodcastUuid:(id)a3 completion:(id)a4;
- (void)prepareIntentForEpisodeUuid:(id)a3 stationUuid:(id)a4 includeImage:(BOOL)a5 includeStorePlatformData:(BOOL)a6 completion:(id)a7;
- (void)removeAllDonations;
- (void)removeDonationForEpisodeUuid:(id)a3;
- (void)removeDonationForPodcastUuid:(id)a3;
- (void)removeDonationsForEpisodeUuids:(id)a3;
- (void)removeDonationsForPodcastUuids:(id)a3;
- (void)setCachedScores:(id)a3;
- (void)setDefaultsObserver:(id)a3;
- (void)setDonationQueue:(id)a3;
- (void)setIdentifierComposer:(id)a3;
- (void)setImageStore:(id)a3;
- (void)setInteractionClass:(Class)a3;
@end

@implementation MTIntentDonationUtil

- (BOOL)canContinueIntentWithUserActivityType:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unsigned __int8 v6 = [v3 isEqualToString:v5];

  return v6;
}

- (MTIntentDonationUtil)init
{
  v21.receiver = self;
  v21.super_class = (Class)MTIntentDonationUtil;
  v2 = [(MTIntentDonationUtil *)&v21 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, -15);
    dispatch_queue_t v5 = dispatch_queue_create("MTIntentDonationUtil.donation_queue", v4);
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[MTImageStore defaultStore];
    imageStore = v2->_imageStore;
    v2->_imageStore = (MTImageStore *)v7;

    uint64_t v9 = objc_opt_class();
    Class interactionClass = v2->_interactionClass;
    v2->_Class interactionClass = (Class)v9;

    uint64_t v11 = +[MTPlaybackIdentifierUtil sharedInstance];
    identifierComposer = v2->_identifierComposer;
    v2->_identifierComposer = (MTPlaybackIdentifierComposing *)v11;

    v13 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
    uint64_t v14 = kMTShowSiriSuggestionsKey;
    uint64_t v22 = kMTShowSiriSuggestionsKey;
    v15 = +[NSArray arrayWithObjects:&v22 count:1];
    v16 = +[NSSet setWithArray:v15];

    v17 = [[MTDefaultsChangeNotifier alloc] initWithProperties:v16 defaults:v13];
    defaultsObserver = v2->_defaultsObserver;
    v2->_defaultsObserver = v17;

    [(MTDictionaryDiff *)v2->_defaultsObserver addCallback:&stru_1005503B0];
    [(MTDefaultsChangeNotifier *)v2->_defaultsObserver start];
    int v19 = [v13 BOOLForKey:v14];
    sub_10001ECC4(kMTApplicationBundleIdentifier, v19);
  }
  return v2;
}

- (void)donateManifestCurrentItem:(id)a3
{
}

- (void)donateManifestCurrentItem:(id)a3 playReason:(unint64_t)a4
{
  id v10 = a3;
  unsigned __int8 v6 = [v10 currentItem];
  uint64_t v7 = [v6 episode];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = [v10 playlistUuid];
  if (v7)
  {
LABEL_5:
    uint64_t v9 = [v7 uuid];
    [(MTIntentDonationUtil *)self donateEpisodeUuid:v9 stationUuid:v8 isPlaybackFromSiri:a4 == 9 completion:0];
  }
LABEL_6:
}

- (void)donateEpisodeUuid:(id)a3
{
}

- (void)donateEpisodeUuid:(id)a3 completion:(id)a4
{
}

- (void)donateEpisodeUuid:(id)a3 stationUuid:(id)a4 isPlaybackFromSiri:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 length])
  {
    v13 = [(MTIntentDonationUtil *)self donationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BB99C;
    block[3] = &unk_100550428;
    block[4] = self;
    id v15 = v10;
    id v16 = v11;
    id v17 = v12;
    BOOL v18 = a5;
    dispatch_async(v13, block);
  }
  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

- (void)removeDonationForPodcastUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(objc_class *)[(MTIntentDonationUtil *)self interactionClass] deleteInteractionsWithGroupIdentifier:v4 completion:0];
  }
}

- (void)removeDonationsForPodcastUuids:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MTIntentDonationUtil *)self removeDonationForPodcastUuid:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeDonationForEpisodeUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(MTIntentDonationUtil *)self interactionClass];
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(objc_class *)v5 deleteInteractionsWithIdentifiers:v6 completion:0];
  }
}

- (void)removeDonationsForEpisodeUuids:(id)a3
{
  id v4 = a3;
  [(objc_class *)[(MTIntentDonationUtil *)self interactionClass] deleteInteractionsWithIdentifiers:v4 completion:0];
}

- (void)removeAllDonations
{
  v2 = [(MTIntentDonationUtil *)self interactionClass];

  [(objc_class *)v2 deleteAllInteractionsWithCompletion:0];
}

- (BOOL)continueIntentsUserActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityType];
  LODWORD(self) = [(MTIntentDonationUtil *)self canContinueIntentWithUserActivityType:v5];

  if (self)
  {
    id v6 = [v4 interaction];
    id v7 = [v6 intent];

    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v17 = 0;
LABEL_16:

      goto LABEL_17;
    }
    id v8 = v7;
    long long v9 = +[MTDB sharedInstance];
    long long v10 = [v9 mainOrPrivateContext];

    long long v11 = [v8 mediaContainer];
    id v12 = [v11 type];

    if (v12 == (id)6)
    {
      BOOL v18 = [v8 mediaContainer];
      int v19 = [v18 identifier];

      v20 = [v8 mediaItems];
      objc_super v21 = [v20 firstObject];
      uint64_t v22 = [v21 identifier];

      v23 = [[MTURLCommandRequest alloc] initWithURLString:v19];
      v24 = [[MTURLCommandRequest alloc] initWithURLString:v22];
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = sub_100056F9C;
      v50 = sub_100057298;
      id v51 = 0;
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x3032000000;
      v39 = sub_100056F9C;
      v40 = sub_100057298;
      id v41 = 0;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000BC4C4;
      v30[3] = &unk_100550450;
      v34 = &v46;
      id v31 = v10;
      v25 = v23;
      v32 = v25;
      v35 = &v36;
      v26 = v24;
      v33 = v26;
      [v31 performBlockAndWait:v30];
      uint64_t v27 = v47[5];
      if (v27)
      {
        v28 = +[MTApplication appController];
        [v28 presentPodcast:v47[5] episode:v37[5] podcastTab:0 startPlayback:0 animated:0];
      }
      _Block_object_dispose(&v36, 8);

      _Block_object_dispose(&v46, 8);
      if (v27) {
        goto LABEL_12;
      }
    }
    else if (v12 == (id)8)
    {
      v13 = [v8 mediaContainer];
      uint64_t v14 = [v13 identifier];

      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = sub_100056F9C;
      v50 = sub_100057298;
      id v51 = 0;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000BC474;
      v42[3] = &unk_10054E280;
      v45 = &v46;
      id v43 = v10;
      id v15 = v14;
      id v44 = v15;
      [v43 performBlockAndWait:v42];
      if (v47[5])
      {
        id v16 = +[MTApplication appController];
        [v16 presentStation:v47[5] new:0];

        _Block_object_dispose(&v46, 8);
LABEL_12:
        BOOL v17 = 1;
LABEL_15:

        goto LABEL_16;
      }

      _Block_object_dispose(&v46, 8);
    }
    BOOL v17 = 0;
    goto LABEL_15;
  }
  BOOL v17 = 0;
LABEL_17:

  return v17;
}

- (void)prepareIntentForEpisodeUuid:(id)a3 stationUuid:(id)a4 includeImage:(BOOL)a5 includeStorePlatformData:(BOOL)a6 completion:(id)a7
{
  BOOL v22 = a5;
  id v9 = a3;
  id v10 = a4;
  id v25 = a7;
  long long v11 = +[MTDB sharedInstance];
  id v12 = [v11 mainOrPrivateContext];

  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = sub_100056F9C;
  v90[4] = sub_100057298;
  id v91 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = sub_100056F9C;
  v88[4] = sub_100057298;
  id v89 = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v87[3] = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = sub_100056F9C;
  v85 = sub_100057298;
  id v86 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = sub_100056F9C;
  v79[4] = sub_100057298;
  id v80 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v78[3] = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = sub_100056F9C;
  v76[4] = sub_100057298;
  id v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = sub_100056F9C;
  v74[4] = sub_100057298;
  id v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = sub_100056F9C;
  v72[4] = sub_100057298;
  id v73 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_100056F9C;
  v70 = sub_100057298;
  id v13 = v9;
  id v71 = v13;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_100056F9C;
  v64[4] = sub_100057298;
  id v24 = v10;
  id v65 = v24;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  char v63 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000BCC88;
  v47[3] = &unk_100550478;
  id v14 = v12;
  id v48 = v14;
  id v15 = v13;
  id v49 = v15;
  v50 = &v66;
  id v51 = v88;
  v52 = v87;
  v53 = v90;
  v54 = &v81;
  v55 = v79;
  v56 = v78;
  v57 = v76;
  v58 = v72;
  v59 = v62;
  v60 = v64;
  v61 = v74;
  [v14 performBlockAndWait:v47];
  if ([(id)v67[5] length] && objc_msgSend((id)v82[5], "length"))
  {
    id v16 = v15;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000BCE9C;
    v33[3] = &unk_1005504A0;
    v35 = v64;
    v33[4] = self;
    uint64_t v36 = &v66;
    v37 = v88;
    uint64_t v38 = v87;
    v39 = v79;
    v40 = v74;
    id v41 = &v81;
    v42 = v78;
    id v43 = v76;
    id v44 = v72;
    v45 = v90;
    uint64_t v46 = v62;
    id v34 = v25;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000BD29C;
    v28[3] = &unk_1005504F0;
    BOOL v32 = a6;
    v28[4] = self;
    v30 = v87;
    id v31 = v78;
    BOOL v17 = objc_retainBlock(v33);
    id v29 = v17;
    BOOL v18 = objc_retainBlock(v28);
    int v19 = v18;
    if (v22)
    {
      uint64_t v20 = v82[5];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000BD3B4;
      v26[3] = &unk_100550518;
      v26[4] = self;
      uint64_t v27 = v18;
      [(MTIntentDonationUtil *)self prepareImageDataForPodcastUuid:v20 completion:v26];
    }
    else
    {
      ((void (*)(void *, void))v18[2])(v18, 0);
    }

    id v15 = v16;
  }
  else if (v25)
  {
    (*((void (**)(id, void))v25 + 2))(v25, 0);
  }

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(v72, 8);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v79, 8);

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(v87, 8);
  _Block_object_dispose(v88, 8);

  _Block_object_dispose(v90, 8);
}

- (void)prepareImageDataForPodcastUuid:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PUIObjCArtworkProvider shared];
  double v9 = kMTIntentsArtworkSize;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BD5D0;
  v11[3] = &unk_100550540;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 artworkPathForShow:v7 size:v11 completionHandler:v9];
}

- (void)fetchMediaDataForEpisodeStoreId:(int64_t)a3 podcastStoreId:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = +[NSMutableArray arrayWithCapacity:2];
  double v9 = +[MTStoreIdentifier validatedIdNumberFromStoreId:a3];
  id v10 = [v9 stringValue];

  if ([v10 length]) {
    [v8 addObject:v10];
  }
  long long v11 = +[NSString stringWithFormat:@"%lld", a4];
  if ([v11 length]) {
    [v8 addObject:v11];
  }
  id v12 = [objc_alloc((Class)IMContentLookupService) initWithIds:v8];
  [v12 setProfile:kProductProfile];
  [v12 setVersion:2];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000BD7FC;
  v16[3] = &unk_100550568;
  id v17 = v10;
  id v18 = v11;
  id v19 = v7;
  id v13 = v7;
  id v14 = v11;
  id v15 = v10;
  [v12 request:v16];
}

- (id)peopleScoresFromMediaData:(id)a3 keyedOnQid:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 count]
    && ([v5 objectForKey:@"credits"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    id v8 = [v5 objectForKey:@"credits"];
    double v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      if (v4) {
        CFStringRef v14 = @"wikiQid";
      }
      else {
        CFStringRef v14 = @"name";
      }
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKey:v14, v18];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 length]) {
            [v9 setObject:&off_100579638 forKey:v16];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    double v9 = &__NSDictionary0__struct;
  }

  return v9;
}

- (id)topicScoresFromMediaData:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKey:@"topics"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 objectForKey:@"topics"];
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = [v12 objectForKey:@"relevance"];
          [v13 floatValue];
          int v15 = v14;

          LODWORD(v16) = v15;
          id v17 = +[NSNumber numberWithFloat:v16];
          long long v18 = [v12 objectForKey:@"wikiQid"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 length]) {
            [v20 setObject:v17 forKey:v18];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v20 = &__NSDictionary0__struct;
  }

  return v20;
}

- (id)defaultPodcastArtworkData
{
  if (qword_10060A720 != -1) {
    dispatch_once(&qword_10060A720, &stru_100550588);
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100056F9C;
  id v9 = sub_100057298;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDEEC;
  block[3] = &unk_10054D8A0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_10060A728, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (MTImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
}

- (Class)interactionClass
{
  return self->_interactionClass;
}

- (void)setInteractionClass:(Class)a3
{
}

- (MTPlaybackIdentifierComposing)identifierComposer
{
  return self->_identifierComposer;
}

- (void)setIdentifierComposer:(id)a3
{
}

- (OS_dispatch_queue)donationQueue
{
  return self->_donationQueue;
}

- (void)setDonationQueue:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsObserver
{
  return self->_defaultsObserver;
}

- (void)setDefaultsObserver:(id)a3
{
}

- (NSMutableDictionary)cachedScores
{
  return self->_cachedScores;
}

- (void)setCachedScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedScores, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_identifierComposer, 0);
  objc_storeStrong((id *)&self->_interactionClass, 0);

  objc_storeStrong((id *)&self->_imageStore, 0);
}

@end