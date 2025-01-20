@interface SPCoreSpotlightDatastore
+ (BOOL)_isKeyboardCJK:(id)a3;
+ (SPCoreSpotlightDatastore)sharedInstance;
+ (id)_makeUniqueFetchAttributesWithAttributes:(id)a3 extraAttributes:(id)a4;
+ (id)getResources;
+ (id)removedDuplicatePhotosSectionsFromSections:(id)a3 isPhotosScopedSearch:(BOOL)a4;
+ (id)sectionWithBundleIdentifier:(id)a3 andAddToMap:(id)a4;
+ (void)_handleRemoteProxyError:(id)a3;
+ (void)initialize;
+ (void)modifyBatchSize:(unint64_t *)a3 batchIncrement:(unint64_t *)a4 batches:(unint64_t *)a5 withSectionsCount:(unint64_t)a6;
+ (void)setButtonOnPhotosInAppSection:(id)a3 withQuery:(id)a4 queryString:(id)a5 queryParams:(id)a6;
+ (void)setResources:(id)a3;
+ (void)updatePhoneFavorites;
- (BOOL)topHitNominatedByPommesScoringforBundleIdentifier:(id)a3;
- (id)_topHitQueryParametersForSearchString:(id)a3 searchEntities:(id)a4 contextIdentifier:(id)a5 queryKind:(unint64_t)a6 needsFuzzy:(BOOL)a7 checkForMath:(BOOL)a8 isCJK:(BOOL)a9 disableNLP:(BOOL)a10 disableOCR:(BOOL)a11 previousQueryKind:(unint64_t)a12 clientBundle:(id)a13 keyboardLanguage:(id)a14 queryID:(int64_t)a15;
- (id)coreSpotlightQueryTaskWithQuery:(id)a3 reuseTask:(id)a4;
- (id)performQuery:(id)a3;
- (id)performQuery:(id)a3 isCorrectedQuery:(BOOL)a4 reuseTask:(id)a5 needsFuzzy:(BOOL)a6 pommesRewrite:(id)a7 embeddingsRequery:(BOOL)a8;
- (id)rankingQueriesAddingQueryTerms:(id)a3 rankingQueries:(id)a4;
- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 resultsHandler:(id)a5 completionHandler:(id)a6;
- (unsigned)domain;
- (void)activate;
- (void)clearInput;
- (void)deactivate;
- (void)dealloc;
- (void)hideIrrelevantCalendarResultsForSection:(id)a3;
- (void)loadTrialDataOnActivate;
- (void)performQueryRewriteForQuery:(id)a3 withCorrection:(id)a4 task:(id)a5;
- (void)preheat;
- (void)processSection:(id)a3 forQuery:(id)a4 rawQuery:(id)a5 usingTopHitThreshold:;
- (void)processUserActivitiesForSection:(id)a3;
- (void)removeDuplicatesInSection:(id)a3 query:(id)a4;
- (void)sortResultsInSection:(id)a3 currentTime:(double)a4;
- (void)updateCoreSuggestionsSection:(id)a3;
- (void)updateMailVIPList;
@end

@implementation SPCoreSpotlightDatastore

+ (SPCoreSpotlightDatastore)sharedInstance
{
  if (qword_1000A8F08 != -1) {
    dispatch_once(&qword_1000A8F08, &stru_1000932E0);
  }
  v2 = (void *)qword_1000A8F00;

  return (SPCoreSpotlightDatastore *)v2;
}

- (void)loadTrialDataOnActivate
{
  *((unsigned char *)self + 57) |= 1u;
}

+ (id)getResources
{
  v2 = (void *)qword_1000A8F10;
  if (!qword_1000A8F10)
  {
    v3 = +[SRResourcesManager sharedResourcesManager];
    uint64_t v4 = [v3 resourcesForClient:@"Spotlight" options:&off_100099050];
    v5 = (void *)qword_1000A8F10;
    qword_1000A8F10 = v4;

    SSDefaultsSetResources();
    v2 = (void *)qword_1000A8F10;
  }

  return v2;
}

+ (void)setResources:(id)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v49 = a1;
    uint64_t v3 = SSSectionIdentifierSyndicatedPhotos;
    v54[0] = SSSectionIdentifierSyndicatedLinks;
    v54[1] = SSSectionIdentifierSyndicatedPhotos;
    uint64_t v4 = SSSectionIdentifierSyndicatedPhotosMessages;
    uint64_t v5 = SSSectionIdentifierSyndicatedPhotosNotes;
    v54[2] = SSSectionIdentifierSyndicatedPhotosMessages;
    v54[3] = SSSectionIdentifierSyndicatedPhotosNotes;
    uint64_t v6 = SSSectionIdentifierSyndicatedPhotosFiles;
    uint64_t v7 = SSSectionIdentifierSyndicatedPhotosFromPhotos;
    v54[4] = SSSectionIdentifierSyndicatedPhotosFiles;
    v54[5] = SSSectionIdentifierSyndicatedPhotosFromPhotos;
    uint64_t v8 = SSPhotosBundleIdentifier;
    v54[6] = SSContactsBundleIdentifier;
    v54[7] = SSPhotosBundleIdentifier;
    v9 = +[NSArray arrayWithObjects:v54 count:8];
    uint64_t v10 = +[NSSet setWithArray:v9];
    v11 = (void *)qword_1000A8F28;
    qword_1000A8F28 = v10;

    id v12 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"com.apple.application", @"com.apple.mobilesafari", @"com.apple.Preferences", @"com.apple.MobileAddressBook", @"com.apple.shortcuts", 0);
    v13 = (void *)qword_1000A8F38;
    qword_1000A8F38 = (uint64_t)v12;

    v53[0] = v3;
    v53[1] = v4;
    v53[2] = v5;
    v53[3] = v6;
    v53[4] = v7;
    v53[5] = v8;
    v14 = +[NSArray arrayWithObjects:v53 count:6];
    uint64_t v15 = +[NSSet setWithArray:v14];
    v16 = (void *)qword_1000A8F30;
    qword_1000A8F30 = v15;

    id v17 = objc_alloc((Class)NSSet);
    uint64_t v52 = v3;
    v18 = +[NSArray arrayWithObjects:&v52 count:1];
    id v19 = [v17 initWithArray:v18];
    v20 = (void *)qword_1000A8F18;
    qword_1000A8F18 = (uint64_t)v19;

    id v21 = objc_alloc((Class)NSSet);
    v51[0] = v4;
    v51[1] = v5;
    v51[2] = v6;
    v51[3] = v7;
    v22 = +[NSArray arrayWithObjects:v51 count:4];
    id v23 = [v21 initWithArray:v22];
    v24 = (void *)qword_1000A8F20;
    qword_1000A8F20 = (uint64_t)v23;

    uint64_t v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = (void *)qword_1000A8F40;
    qword_1000A8F40 = v25;

    id v27 = objc_alloc((Class)NSUserDefaults);
    id v28 = [v27 initWithSuiteName:SpotlightDaemonBundleID];
    v29 = (void *)qword_1000A8F48;
    qword_1000A8F48 = (uint64_t)v28;

    byte_1000A8F50 = os_variant_has_internal_diagnostics();
    qword_1000A8F58 = (uint64_t)[(id)qword_1000A8F48 integerForKey:@"meContactExists"];
    uint64_t v30 = [(id)qword_1000A8F48 objectForKey:@"meContactIdentifier"];
    v31 = (void *)qword_1000A8EE8;
    qword_1000A8EE8 = v30;

    uint64_t v32 = [(id)qword_1000A8F48 objectForKey:@"meEmailAddresses"];
    v33 = (void *)qword_1000A8EF0;
    qword_1000A8EF0 = v32;

    dispatch_group_t v34 = dispatch_group_create();
    v35 = (void *)qword_1000A8F60;
    qword_1000A8F60 = (uint64_t)v34;

    if (byte_1000A8F50)
    {
      v36 = NSHomeDirectory();
      v37 = [v36 stringByAppendingString:@"/Library/Logs/CrashReporter/DiagnosticLogs/Search/Ranking"];

      v38 = +[NSFileManager defaultManager];
      [v38 createDirectoryAtPath:v37 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v39 = +[SRResourcesManager sharedResourcesManager];
    [v39 loadAllParameters];

    if (!qword_1000A8F10)
    {
      v40 = +[SRResourcesManager sharedResourcesManager];
      uint64_t v41 = [v40 resourcesForClient:@"Spotlight" options:&off_100099078];
      v42 = (void *)qword_1000A8F10;
      qword_1000A8F10 = v41;

      SSDefaultsSetResources();
    }
    +[SSRankingManager reloadRankingParametersFromTrial];
    +[SSRankingManager getSuggestionsRankingThresholds];
    SISetCompletionRankingWeights();
    v43 = qword_1000A8F60;
    v44 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000353AC;
    block[3] = &unk_1000923B8;
    block[4] = v49;
    dispatch_group_async(v43, v44, block);

    id v45 = objc_alloc((Class)NSOrderedSet);
    v46 = rankingAttributeNameArray();
    id v47 = [v45 initWithArray:v46];
    v48 = (void *)qword_1000A8F78;
    qword_1000A8F78 = (uint64_t)v47;
  }
}

+ (void)_handleRemoteProxyError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100065834(v3);
  }
}

- (void)updateMailVIPList
{
  id v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDVIPServicesProtocol];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035974;
  v8[3] = &unk_100091E18;
  v8[4] = self;
  uint64_t v4 = +[MSXPCService remoteProxyForXPCInterface:v3 connectionErrorHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000359C8;
  v6[3] = &unk_100093308;
  id v7 = (id)os_transaction_create();
  id v5 = v7;
  [v4 orderedVIPAddressesAndUnreadCountsWithCompletion:v6];
}

+ (void)updatePhoneFavorites
{
  v2 = +[CNFavorites sharedInstance];
  id v3 = [v2 entries];
  id v4 = [v3 copy];

  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v10), "contactProperty", (void)v16);
        id v12 = [v11 contact];

        v13 = [v12 identifier];
        [v5 addObject:v13];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F80);
  id v14 = [v5 copy];
  uint64_t v15 = (void *)qword_1000A8EF8;
  qword_1000A8EF8 = (uint64_t)v14;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F80);
}

- (void)dealloc
{
  notify_cancel(self->_changedToken);
  v3.receiver = self;
  v3.super_class = (Class)SPCoreSpotlightDatastore;
  [(SPCoreSpotlightDatastore *)&v3 dealloc];
}

- (void)preheat
{
  uint64_t v2 = si_tracing_current_span();
  long long v9 = *(_OWORD *)v2;
  long long v10 = *(_OWORD *)(v2 + 16);
  uint64_t v11 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v5 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = spanid;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 28) = 102;
  *(void *)(v2 + 32) = "-[SPCoreSpotlightDatastore preheat]";
  si_tracing_log_span_begin();
  id v6 = +[SDController rankQueue];
  qos_class_t v7 = qos_class_self();
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v7, 0, &stru_100093328);
  tracing_dispatch_async();

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v2 = v9;
  *(_OWORD *)(v2 + 16) = v10;
  *(void *)(v2 + 32) = v11;
}

- (void)activate
{
  uint64_t v3 = si_tracing_current_span();
  long long v4 = *(_OWORD *)(v3 + 16);
  long long v32 = *(_OWORD *)v3;
  long long v33 = v4;
  uint64_t v34 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v5;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v7;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPCoreSpotlightDatastore activate]";
  si_tracing_log_span_begin();
  char v8 = *((unsigned char *)self + 8);
  if ((v8 & 0x20) == 0)
  {
    long long v9 = +[SDController workQueue];
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &stru_100093348);
    tracing_dispatch_async();

    if (*((unsigned char *)self + 57))
    {
      uint64_t v11 = dispatch_get_global_queue(25, 0);
      tracing_dispatch_async();

      *((unsigned char *)self + 57) &= ~1u;
    }
    id v12 = +[PRSModelManager sharedModelManager];
    [v12 activate];

    v13 = +[CSFileProviderContainerCache sharedInstance];
    [v13 refreshCache];

    id v14 = +[MCProfileConnection sharedConnection];
    *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | (4
                                                        * ([v14 effectiveBoolValueForSetting:MCFeatureExplicitContentAllowed] != 2));
    *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xF7 | (8
                                                        * ([v14 effectiveBoolValueForSetting:MCFeatureMusicVideosAllowed] != 2));
    uint64_t v15 = [v14 effectiveValueForSetting:MCFeatureMaximumMoviesRating];
    maxMovieRating = self->_maxMovieRating;
    self->_maxMovieRating = v15;

    long long v17 = [v14 effectiveValueForSetting:MCFeatureMaximumTVShowsRating];
    maxTVShowRating = self->_maxTVShowRating;
    self->_maxTVShowRating = v17;

    if ([v14 isBookstoreEroticaAllowed]) {
      char v19 = 16;
    }
    else {
      char v19 = 0;
    }
    *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xEF | v19;
    v20 = SPFastHiddenAppsGetNoBuild();
    id v21 = [v20 mutableCopy];

    v22 = +[SDAppUninstallMonitor applicationsExcludedFromUninstall];
    [v21 minusSet:v22];

    id v23 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v36 = [v21 count];
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%lu hiddenApps set during activate", buf, 0xCu);
    }

    uint64_t v24 = [v21 allObjects];
    uint64_t v25 = (void *)qword_1000A8F88;
    qword_1000A8F88 = v24;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100036534;
    block[3] = &unk_1000921B0;
    block[4] = self;
    if (qword_1000A8F90 != -1) {
      dispatch_once(&qword_1000A8F90, block);
    }

    char v8 = *((unsigned char *)self + 8);
  }
  *((unsigned char *)self + 8) = v8 | 0x20;
  int v26 = atomic_load((unsigned int *)&dword_1000A8EE0);
  if (v26 <= 0)
  {
    [(SPCoreSpotlightDatastore *)self preheat];
    atomic_store(1u, (unsigned int *)&dword_1000A8EE0);
  }
  else
  {
    atomic_fetch_add(&dword_1000A8EE0, 1u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F98);
  id v27 = (NSDictionary *)+[SSRankingFeedbackHandler copyRenderEngagementCounts];
  renderEngagementCounts = self->_renderEngagementCounts;
  self->_renderEngagementCounts = v27;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F98);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100036610;
  v30[3] = &unk_1000921B0;
  v30[4] = self;
  if (qword_1000A8FA0 != -1) {
    dispatch_once(&qword_1000A8FA0, v30);
  }
  si_tracing_log_span_end();
  long long v29 = v33;
  *(_OWORD *)uint64_t v3 = v32;
  *(_OWORD *)(v3 + 16) = v29;
  *(void *)(v3 + 32) = v34;
}

- (void)deactivate
{
  uint64_t v3 = si_tracing_current_span();
  long long v4 = *(_OWORD *)(v3 + 16);
  long long v23 = *(_OWORD *)v3;
  long long v24 = v4;
  uint64_t v25 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v5;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v7;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPCoreSpotlightDatastore deactivate]";
  si_tracing_log_span_begin();
  char v8 = *((unsigned char *)self + 8);
  if ((v8 & 0x20) != 0)
  {
    long long v9 = +[SRResourcesManager sharedResourcesManager];
    [v9 loadAllParameters];

    if (!qword_1000A8F10)
    {
      dispatch_block_t v10 = SPLogForSPLogCategoryDefault();
      os_log_type_t v11 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(v10, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Resources object being created in [SPCoreSpotlightDatastore deactivate]", v22, 2u);
      }

      id v12 = +[SRResourcesManager sharedResourcesManager];
      uint64_t v13 = [v12 resourcesForClient:@"Spotlight" options:&off_1000990C8];
      id v14 = (void *)qword_1000A8F10;
      qword_1000A8F10 = v13;

      SSDefaultsSetResources();
    }
    +[SSRankingManager reloadRankingParametersFromTrial];
    +[SSRankingManager getSuggestionsRankingThresholds];
    SISetCompletionRankingWeights();
    uint64_t v15 = +[PRSModelManager sharedModelManager];
    [v15 deactivate];

    long long v16 = +[PRSModelManager sharedModelManager];
    [v16 triggerUpdate];

    [(SPCoreSpotlightDatastore *)self updateMailVIPList];
    [(id)objc_opt_class() updatePhoneFavorites];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F80);
    id v17 = (id)qword_1000A8F68;
    id v18 = (id)qword_1000A8EF8;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F80);
    +[PRSQueryRankingConfiguration updateMailVIP:v17 phoneFavorites:v18 meEmailAddresses:qword_1000A8EF0];
    +[PRSRankingItemRanker clearState];
    char v19 = +[SDController workQueue];
    dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &stru_100093388);
    tracing_dispatch_async();

    char v8 = *((unsigned char *)self + 8);
  }
  *((unsigned char *)self + 8) = v8 & 0xDF;
  si_tracing_log_span_end();
  long long v21 = v24;
  *(_OWORD *)uint64_t v3 = v23;
  *(_OWORD *)(v3 + 16) = v21;
  *(void *)(v3 + 32) = v25;
}

- (void)clearInput
{
  uint64_t v3 = si_tracing_current_span();
  long long v9 = *(_OWORD *)v3;
  long long v10 = *(_OWORD *)(v3 + 16);
  uint64_t v11 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v6 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v6;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPCoreSpotlightDatastore clearInput]";
  si_tracing_log_span_begin();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F98);
  uint64_t v7 = (NSDictionary *)+[SSRankingFeedbackHandler copyRenderEngagementCounts];
  renderEngagementCounts = self->_renderEngagementCounts;
  self->_renderEngagementCounts = v7;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F98);
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v9;
  *(_OWORD *)(v3 + 16) = v10;
  *(void *)(v3 + 32) = v11;
}

- (void)updateCoreSuggestionsSection:(id)a3
{
  id v30 = a3;
  uint64_t v3 = si_tracing_current_span();
  long long v4 = *(_OWORD *)(v3 + 16);
  long long v39 = *(_OWORD *)v3;
  long long v40 = v4;
  uint64_t v41 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v5;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v7;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPCoreSpotlightDatastore updateCoreSuggestionsSection:]";
  si_tracing_log_span_begin();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  char v8 = [v30 results];
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v9)
  {
    long long v10 = 0;
    uint64_t v11 = *(void *)v36;
    while (2)
    {
      id v12 = 0;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v12);
        if (v13)
        {
          uint64_t v15 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) relatedBundleID];
          unsigned __int8 v16 = [v13 isEqualToString:v15];

          if ((v16 & 1) == 0)
          {

            goto LABEL_14;
          }
        }
        long long v10 = [v14 relatedBundleID];

        id v12 = (char *)v12 + 1;
        uint64_t v13 = v10;
      }
      while (v9 != v12);
      id v9 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    if (v10)
    {
      id v28 = +[SDLocUtilities displayNameForBundleIdentifer:v10];
      if (v28)
      {
        id v17 = [(id)qword_1000A8F40 localizedStringForKey:@"DOMAIN_PSEUDOCONTACT_TEMPLATE" value:&stru_100094088 table:@"Search"];
        long long v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v28);

        int v18 = 0;
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_14:

    long long v10 = 0;
  }
  long long v29 = [(id)qword_1000A8F40 localizedStringForKey:@"DOMAIN_PSEUDOCONTACT_APPS" value:&stru_100094088 table:@"Search"];
  id v28 = 0;
  int v18 = 1;
LABEL_16:
  [v30 setTitle:v29];
  if (v18)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    char v19 = [v30 results];
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v32;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v19);
          }
          long long v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v24 = [v23 relatedBundleID];

          if (v24)
          {
            uint64_t v25 = [v23 relatedBundleID];
            int v26 = +[SDLocUtilities displayNameForBundleIdentifer:v25];
            [v23 setFootnote:v26];
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v20);
    }
  }
  si_tracing_log_span_end();
  long long v27 = v40;
  *(_OWORD *)uint64_t v3 = v39;
  *(_OWORD *)(v3 + 16) = v27;
  *(void *)(v3 + 32) = v41;
}

- (BOOL)topHitNominatedByPommesScoringforBundleIdentifier:(id)a3
{
  uint64_t v3 = qword_1000A8FB0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000A8FB0, &stru_1000933A8);
  }
  unsigned __int8 v5 = [(id)qword_1000A8FA8 containsObject:v4];

  return v5;
}

- (void)processSection:(id)a3 forQuery:(id)a4 rawQuery:(id)a5 usingTopHitThreshold:
{
  uint64_t v7 = v6;
  uint64_t v8 = v5;
  id v11 = a3;
  id v120 = a4;
  id v111 = a5;
  uint64_t v12 = si_tracing_current_span();
  long long v13 = *(_OWORD *)(v12 + 16);
  long long v140 = *(_OWORD *)v12;
  long long v141 = v13;
  uint64_t v142 = *(void *)(v12 + 32);
  uint64_t v14 = *(void *)v12;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v16 = *(void *)(v12 + 8);
  *(void *)uint64_t v12 = v14;
  *(void *)(v12 + 8) = spanid;
  *(void *)(v12 + 16) = v16;
  *(unsigned char *)(v12 + 28) = 102;
  *(void *)(v12 + 32) = "-[SPCoreSpotlightDatastore processSection:forQuery:rawQuery:usingTopHitThreshold:]";
  si_tracing_log_span_begin();
  uint64_t v112 = v12;
  unsigned int v17 = [v120 isPeopleSearch];
  uint64_t v18 = SPMaxVisibleResultsCountPerSection();
  char v19 = [v11 bundleIdentifier];
  int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

  uint64_t v21 = 50;
  if (!IsSyndicatedPhotos) {
    uint64_t v21 = v18;
  }
  if (((IsSyndicatedPhotos ^ 1 | v17) & 1) == 0)
  {
    if SSSnippetModernizationEnabled() && ([v120 isPhotosSearch]) {
      uint64_t v21 = 50;
    }
    else {
      uint64_t v21 = 20;
    }
  }
  if (v17) {
    uint64_t v21 = 50;
  }
  if (v21 <= 0) {
    uint64_t v22 = 3;
  }
  else {
    uint64_t v22 = v21;
  }
  [v11 setMaxInitiallyVisibleResults:v22];
  long long v23 = [v11 bundleIdentifier];
  v114 = +[SDLocUtilities displayNameForBundleIdentifer:v23];

  if (v114) {
    [v11 setTitle:v114];
  }
  long long v24 = [v11 bundleIdentifier];
  unsigned int v25 = [v24 isEqualToString:CoreSuggestionsBundleID];

  if (v25) {
    [(SPCoreSpotlightDatastore *)self updateCoreSuggestionsSection:v11];
  }
  int v26 = [v11 title];

  if (!v26)
  {
    [v11 setTitle:@"?"];
    [v11 setResults:&__NSArray0__struct];
  }
  long long v27 = [v11 bundleIdentifier];
  unsigned int v28 = [v27 isEqual:SafariBundleID];

  unsigned int v110 = v28;
  if (v28)
  {
    uint64_t EvaluatorWithBlock = _MDCreateSimpleQueryEvaluatorWithBlock();
    if (EvaluatorWithBlock) {
      _MDSimpleQuerySetWidcardAttributes();
    }
    uint64_t v113 = EvaluatorWithBlock;
    id v119 = objc_alloc_init((Class)NSMutableSet);
    id v117 = objc_alloc_init((Class)NSMutableDictionary);
    id v115 = objc_alloc_init((Class)NSMutableSet);
    id v123 = objc_alloc_init((Class)NSMutableDictionary);
    id v121 = objc_alloc_init((Class)NSMutableSet);
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v30 = [v11 resultSet];
    id v31 = [v30 countByEnumeratingWithState:&v136 objects:v147 count:16];
    if (v31)
    {
      id obj = v30;
      uint64_t v130 = *(void *)v137;
      do
      {
        long long v32 = 0;
        do
        {
          if (*(void *)v137 != v130) {
            objc_enumerationMutation(obj);
          }
          long long v33 = *(void **)(*((void *)&v136 + 1) + 8 * (void)v32);
          if (objc_opt_respondsToSelector())
          {
            long long v34 = [v33 contentURL];
            if (v34)
            {
              long long v35 = [v33 title];
              long long v36 = [v35 text];
              BOOL v37 = v36 == 0;

              if (!v37)
              {
                long long v38 = [v33 contentURL];
                long long v39 = +[NSURL URLWithString:v38];

                if (!v39) {
                  goto LABEL_52;
                }
                long long v40 = +[NSURLComponents componentsWithURL:v39 resolvingAgainstBaseURL:1];
                uint64_t v41 = v40;
                if (!v40) {
                  goto LABEL_51;
                }
                [v40 setQuery:0];
                [v41 setFragment:0];
                v126 = v41;
                v124 = [v41 string];
                objc_msgSend(v123, "objectForKey:");
                id v128 = (id)objc_claimAutoreleasedReturnValue();
                v42 = [v33 title];
                v43 = [v42 text];
                v127 = [v128 objectForKey:v43];

                if (v127)
                {
                  v44 = [v127 contentURL];
                  unint64_t v45 = (unint64_t)[v44 length];
                  v46 = [v33 contentURL];
                  LOBYTE(v45) = v45 > (unint64_t)[v46 length];

                  if (v45)
                  {
                    [v121 addObject:v127];
                    id v47 = [v33 title];
                    v125 = [v47 text];
                    [v128 setObject:v33 forKey:v125];
                    goto LABEL_49;
                  }
                  [v121 addObject:v33];
LABEL_50:

                  uint64_t v41 = v126;
LABEL_51:

LABEL_52:
                  goto LABEL_53;
                }
                if (!v128)
                {
                  id v128 = objc_alloc_init((Class)NSMutableDictionary);
                  [v123 setObject:v128 forKey:v124];
                }
                v48 = [v33 title];
                id v49 = [v48 text];
                [v128 setObject:v33 forKey:v49];

                [v126 setPath:@"/"];
                v50 = [v126 URL];
                v125 = [v50 host];
                v51 = [v50 scheme];
                v122 = v50;
                if (v51) {
                  BOOL v52 = v125 == 0;
                }
                else {
                  BOOL v52 = 1;
                }
                char v53 = v52;

                if (v53) {
                  goto LABEL_44;
                }
                v54 = [v122 scheme];
                id v118 = [v54 caseInsensitiveCompare:@"https"];

                id v47 = v122;
                if ([v122 isEqual:v39])
                {
                  [v119 addObject:v125];
                  [v117 removeObjectForKey:v125];
                  [v115 removeObject:v125];
                }
                else if (([v119 containsObject:v125] & 1) == 0)
                {
                  v55 = [v117 objectForKeyedSubscript:v125];
                  if (v55)
                  {
                    unsigned __int8 v56 = [v115 containsObject:v125];
                    if (v118) {
                      char v57 = 1;
                    }
                    else {
                      char v57 = v56;
                    }

                    if ((v113 == 0) | v57 & 1) {
                      goto LABEL_44;
                    }
                  }
                  else if (!v113)
                  {
                    goto LABEL_44;
                  }
                  if (_MDSimpleQueryObjectMatches())
                  {
                    v58 = [v33 title];
                    v59 = [v58 text];
                    BOOL v60 = _MDStringPrefixOfString() == -1;

                    if (v60)
                    {
                      v61 = objc_opt_new();
                      v109 = objc_opt_new();
                      v107 = objc_opt_new();
                      [v107 setBundleIdentifier:SafariBundleID];
                      [v109 setThumbnail:v107];
                      v62 = +[SFRichText textWithString:v125];
                      [v109 setTitle:v62];

                      v63 = +[SFPunchout punchoutWithURL:v122];
                      v146 = v63;
                      v64 = +[NSArray arrayWithObjects:&v146 count:1];
                      [v109 setPunchoutOptions:v64];

                      v65 = +[SFRichText textWithString:v125];
                      v145 = v65;
                      v66 = +[NSArray arrayWithObjects:&v145 count:1];
                      [v109 setDescriptions:v66];

                      v67 = objc_opt_new();
                      [v61 setInlineCard:v67];

                      v144 = v109;
                      v68 = +[NSArray arrayWithObjects:&v144 count:1];
                      v69 = [v61 inlineCard];
                      [v69 setCardSections:v68];

                      v108 = [v122 absoluteString];
                      [v61 setContentURL:v108];
                      objc_msgSend(v61, "setTopHit:", objc_msgSend(v33, "topHit"));
                      objc_msgSend(v61, "setForceNoTopHit:", objc_msgSend(v33, "forceNoTopHit"));
                      id v70 = [v33 score];
                      objc_msgSend(v61, "setScore:", v70, v71);
                      v72 = [v33 protectionClass];
                      [v61 setProtectionClass:v72];

                      [v33 rankingScore];
                      objc_msgSend(v61, "setRankingScore:");
                      v73 = [v33 applicationBundleIdentifier];
                      [v61 setApplicationBundleIdentifier:v73];

                      v74 = [v33 sectionBundleIdentifier];
                      [v61 setSectionBundleIdentifier:v74];

                      v75 = [v33 resultBundleId];
                      [v61 setResultBundleId:v75];

                      objc_msgSend(v61, "setType:", objc_msgSend(v33, "type"));
                      objc_msgSend(v61, "setQueryId:", objc_msgSend(v33, "queryId"));
                      [v61 setCompletedQuery:v125];
                      [v61 setCompletion:v125];
                      v76 = SyntheticBookmarkIdentifierPrefix;
                      v77 = [v33 identifier];
                      v78 = [(__CFString *)v76 stringByAppendingString:v77];
                      [v61 setIdentifier:v78];

                      v79 = [v33 rankingItem];
                      [v79 attributes];
                      uint64_t v80 = SSCompactRankingAttrsCopy();

                      SSCompactRankingAttrsUpdateValue();
                      SSCompactRankingAttrsUpdateValue();
                      SSCompactRankingAttrsUpdateValue();
                      id v81 = [objc_alloc((Class)PRSRankingItem) initWithAttrs:v80];
                      [v61 setRankingItem:v81];

                      v106 = [v33 rankingItem];
                      v82 = [v106 L2FeatureVector];
                      [v82 originalL2Score];
                      int v84 = v83;
                      v85 = [v61 rankingItem];
                      v86 = [v85 L2FeatureVector];
                      LODWORD(v87) = v84;
                      [v86 setOriginalL2Score:v87];

                      [v117 setObject:v61 forKey:v125];
                      if (!v118) {
                        [v115 addObject:v125];
                      }
                    }
                  }
LABEL_44:
                  id v47 = v122;
                }
LABEL_49:

                goto LABEL_50;
              }
            }
          }
LABEL_53:
          long long v32 = (char *)v32 + 1;
        }
        while (v31 != v32);
        id v30 = obj;
        id v88 = [obj countByEnumeratingWithState:&v136 objects:v147 count:16];
        id v31 = v88;
      }
      while (v88);
    }

    if (v113) {
      _MDSimpleQueryDeallocate();
    }
    if ([v117 count])
    {
      v89 = [v117 allValues];
      v90 = [v11 resultSet];
      [v90 addObjectsFromArray:v89];
    }
    v91 = [v11 resultSet];
    [v91 minusSet:v121];
  }
  int v131 = SSEnableSpotlightTopHitPersonalizedRanking();
  if (v131)
  {
    v92 = [v11 bundleIdentifier];
    unsigned __int8 v93 = [(SPCoreSpotlightDatastore *)self topHitNominatedByPommesScoringforBundleIdentifier:v92];
  }
  else
  {
    unsigned __int8 v93 = 0;
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v94 = [v11 resultSet];
  id v95 = [v94 countByEnumeratingWithState:&v132 objects:v143 count:16];
  if (v95)
  {
    uint64_t v96 = *(void *)v133;
    do
    {
      for (i = 0; i != v95; i = (char *)i + 1)
      {
        if (*(void *)v133 != v96) {
          objc_enumerationMutation(v94);
        }
        v98 = *(void **)(*((void *)&v132 + 1) + 8 * i);
        unint64_t v99 = (unint64_t)[v98 score];
        if (v99 & v8 | v100 & v7) {
          char v101 = v93;
        }
        else {
          char v101 = 1;
        }
        if ((v101 & 1) == 0 && [v98 topHit] != 2) {
          [v98 setTopHit:1];
        }
        v102 = [v11 bundleIdentifier];
        [v98 setSectionBundleIdentifier:v102];
      }
      id v95 = [v94 countByEnumeratingWithState:&v132 objects:v143 count:16];
    }
    while (v95);
  }

  if (((v131 | v110 ^ 1) & 1) == 0)
  {
    v103 = [v120 queryContext];
    v104 = [v103 searchString];
    +[SSRankingManager determineTopHitsForSafariSection:v11 forQuery:v104];

    +[SSRankingManager moveSafariTopHitsToTopOfSection:v11];
  }
  [v120 currentTime];
  -[SPCoreSpotlightDatastore sortResultsInSection:currentTime:](self, "sortResultsInSection:currentTime:", v11);
  [(SPCoreSpotlightDatastore *)self processUserActivitiesForSection:v11];
  [(SPCoreSpotlightDatastore *)self removeDuplicatesInSection:v11 query:v120];

  si_tracing_log_span_end();
  long long v105 = v141;
  *(_OWORD *)uint64_t v112 = v140;
  *(_OWORD *)(v112 + 16) = v105;
  *(void *)(v112 + 32) = v142;
}

- (void)hideIrrelevantCalendarResultsForSection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = si_tracing_current_span();
  long long v5 = *(_OWORD *)(v4 + 16);
  long long v45 = *(_OWORD *)v4;
  long long v46 = v5;
  uint64_t v47 = *(void *)(v4 + 32);
  uint64_t v6 = *(void *)v4;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v4 + 8);
  *(void *)uint64_t v4 = v6;
  *(void *)(v4 + 8) = spanid;
  *(void *)(v4 + 16) = v8;
  *(unsigned char *)(v4 + 28) = 102;
  *(void *)(v4 + 32) = "-[SPCoreSpotlightDatastore hideIrrelevantCalendarResultsForSection:]";
  si_tracing_log_span_begin();
  uint64_t v27 = v4;
  id v30 = objc_alloc_init((Class)NSMutableArray);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = [v3 resultSet];
  id v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
  unsigned int v28 = v3;
  id v11 = 0;
  uint64_t v12 = 0;
  if (v10)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v31 = 0;
    uint64_t v13 = 0;
    uint64_t v34 = *(void *)v42;
    id obj = v9;
    do
    {
      id v35 = v10;
      uint64_t v14 = 0;
      uint64_t v15 = v12;
      do
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v14);
        uint64_t v39 = -1;
        uint64_t v40 = -1;
        uint64_t v37 = -1;
        uint64_t v38 = -1;
        uint64_t v36 = -1;
        unsigned int v17 = objc_msgSend(v16, "interestingDate", v27);
        uint64_t v18 = [v16 compatibilityTitle];
        if (!v17)
        {
          uint64_t v12 = v15;
LABEL_28:
          [v30 addObject:v16];
          goto LABEL_29;
        }
        char v19 = +[SSDateFormatManager calendar];
        [v19 getEra:0 year:&v40 month:&v39 day:&v38 fromDate:v17];

        id v20 = +[SSDateFormatManager calendar];
        [v20 getEra:0 yearForWeekOfYear:0 weekOfYear:&v36 weekday:&v37 fromDate:v17];

        uint64_t v21 = [v16 domainIdentifier];
        uint64_t v12 = (void *)v21;
        BOOL v22 = 0;
        if (v18 && v21)
        {
          if ([v15 isEqualToString:v21]
            && [v11 isEqualToString:v18])
          {
            BOOL v22 = v37 == v32 || v38 == v33;
            if (v40 == v13 && v39 == v31 && (v38 == v33 - 1 || v38 == v33 + 1)) {
              BOOL v22 = 1;
            }
          }
          else
          {
            BOOL v22 = 0;
          }
        }
        id v25 = v18;

        uint64_t v32 = v37;
        uint64_t v33 = v38;
        uint64_t v31 = v39;
        id v11 = v25;
        uint64_t v13 = v40;
        if (!v22) {
          goto LABEL_28;
        }
LABEL_29:

        uint64_t v14 = (char *)v14 + 1;
        uint64_t v15 = v12;
      }
      while (v35 != v14);
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v10);
  }

  [v28 clearResults];
  [v28 addResultsFromArray:v30];

  si_tracing_log_span_end();
  long long v26 = v46;
  *(_OWORD *)uint64_t v27 = v45;
  *(_OWORD *)(v27 + 16) = v26;
  *(void *)(v27 + 32) = v47;
}

- (void)removeDuplicatesInSection:(id)a3 query:(id)a4
{
  id v76 = a3;
  id v73 = a4;
  uint64_t v6 = si_tracing_current_span();
  long long v7 = *(_OWORD *)(v6 + 16);
  long long v90 = *(_OWORD *)v6;
  long long v91 = v7;
  uint64_t v92 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)v6;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v10 = *(void *)(v6 + 8);
  *(void *)uint64_t v6 = v8;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = v10;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "-[SPCoreSpotlightDatastore removeDuplicatesInSection:query:]";
  si_tracing_log_span_begin();
  uint64_t v72 = v6;
  id v11 = [v76 results];
  id v12 = [v11 copy];

  id v13 = objc_alloc_init((Class)NSMutableSet);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v12;
  id v14 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v87;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v87 != v15) {
          objc_enumerationMutation(obj);
        }
        unsigned int v17 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        uint64_t v18 = [v17 sectionBundleIdentifier];
        char v19 = [v17 externalIdentifier];
        if (v19)
        {
          if ([v13 containsObject:v19])
          {
            [v76 removeResults:v17];
            id v20 = SPLogForSPLogCategoryQuery();
            BOOL v21 = gSPLogDebugAsDefault == 0;
            uint64_t p_cache = (2 * v21);
            if (os_log_type_enabled(v20, (os_log_type_t)(2 * v21)))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v96 = v18;
              __int16 v97 = 2112;
              v98 = v19;
              _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)p_cache, "Remove duplicate for %@ / %@", buf, 0x16u);
            }
          }
          else
          {
            [v13 addObject:v19];
          }
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v14);
  }

  uint64_t j = [v73 queryContext];
  id v23 = [(id)j queryKind];
  long long v24 = [v73 queryContext];
  id v25 = [v24 clientBundleID];
  if (qword_1000A9020 != -1) {
    dispatch_once(&qword_1000A9020, &stru_100093820);
  }
  if (byte_1000A9019) {
    goto LABEL_17;
  }
  if (!byte_1000A9018)
  {
    char v71 = 0;
    goto LABEL_19;
  }
  if (([v25 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v25 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_17:
    char v26 = 1;
  }
  else
  {
    unsigned __int8 v35 = [v25 hasPrefix:@"com.apple.ondeviceeval"];
    if (v23 == (id)12) {
      char v26 = 1;
    }
    else {
      char v26 = v35;
    }
  }
  char v71 = v26;
LABEL_19:

  if (v71) {
    goto LABEL_61;
  }
  uint64_t v27 = [v76 bundleIdentifier];
  unsigned int v28 = [v27 isEqualToString:PRSRankingMessagesBundleString];

  if (v28)
  {
    [v13 removeAllObjects];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v74 = obj;
    id v29 = [v74 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v29)
    {
      id v30 = 0;
      uint64_t v31 = *(void *)v83;
      uint64_t p_cache = (uint64_t)&OBJC_METACLASS___SPCoreSpotlightDatastore.cache;
      while (1)
      {
        for (uint64_t j = 0; (id)j != v29; ++j)
        {
          if (*(void *)v83 != v31) {
            objc_enumerationMutation(v74);
          }
          uint64_t v32 = *(void **)(*((void *)&v82 + 1) + 8 * j);
          uint64_t v33 = [v32 domainIdentifier];

          unsigned int v34 = [v33 isEqualToString:MessagesAttachmentDomain];
          if ((v34 | [v33 isEqualToString:MessagesChatDomain]) == 1)
          {
            id v30 = [v32 accountIdentifier];

            if (!v30) {
              continue;
            }
          }
          else
          {
            id v30 = v33;
            if (!v33) {
              continue;
            }
          }
          if ([v13 containsObject:v30]) {
            [v76 removeResults:v32];
          }
          else {
            [v13 addObject:v30];
          }
        }
        id v29 = [v74 countByEnumeratingWithState:&v82 objects:v94 count:16];
        if (!v29)
        {

          goto LABEL_44;
        }
      }
    }
    id v30 = v74;
LABEL_44:
  }
  uint64_t v36 = [v76 bundleIdentifier];
  unsigned int v37 = [v36 isEqualToString:PRSRankingPodcastsBundleString];

  if (!v37) {
    goto LABEL_61;
  }
  [v13 removeAllObjects];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t j = (uint64_t)obj;
  id v38 = [(id)j countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (!v38) {
    goto LABEL_60;
  }
  uint64_t v39 = *(void *)v79;
  do
  {
    for (k = 0; k != v38; k = (char *)k + 1)
    {
      if (*(void *)v79 != v39) {
        objc_enumerationMutation((id)j);
      }
      uint64_t p_cache = *(void *)(*((void *)&v78 + 1) + 8 * (void)k);
      long long v41 = [(id)p_cache stringForDedupe];
      if (v41)
      {
        long long v42 = [(id)p_cache domainIdentifier];
        if ([v42 isEqualToString:@"com.apple.siri.interactions"])
        {
        }
        else
        {
          long long v43 = [(id)p_cache domainIdentifier];
          unsigned int v44 = [v43 isEqualToString:@"com.apple.siri.upcomingmedia"];

          if (!v44) {
            continue;
          }
        }
        long long v45 = [(id)p_cache stringForDedupe];
        unsigned int v46 = [v13 containsObject:v45];

        if (v46)
        {
          [v76 removeResults:p_cache];
        }
        else
        {
          uint64_t v47 = [(id)p_cache stringForDedupe];
          [v13 addObject:v47];
        }
      }
    }
    id v38 = [(id)j countByEnumeratingWithState:&v78 objects:v93 count:16];
  }
  while (v38);
LABEL_60:

LABEL_61:
  v48 = [v76 bundleIdentifier];
  id v49 = (void *)SSPommesRankingForSectionBundle();

  if (v49)
  {
    id v49 = [v73 queryContext];
    v50 = [v49 searchString];
    SSRearrangeDuplicatesInSection();
  }
  if (SSEnableSpotlightTopHitPersonalizedRanking())
  {
    v51 = [v73 queryContext];
    BOOL v52 = [v51 searchEntities];
    id v53 = [v52 count];
    if (v53)
    {
      id v49 = [v73 queryContext];
      uint64_t j = [v49 searchEntities];
      uint64_t p_cache = [(id)j lastObject];
      if ([(id)p_cache isScopedSearch])
      {
        uint64_t v54 = 1;
        goto LABEL_68;
      }
    }
    v55 = [v73 queryContext];
    uint64_t v54 = (uint64_t)[v55 isAdvancedSyntax];

    if (v53)
    {
LABEL_68:
    }
    unsigned __int8 v56 = [v73 queryContext];
    v69 = [v56 searchString];
    v75 = [v73 queryContext];
    id v68 = [v75 queryIdent];
    id v70 = [v73 queryContext];
    char v57 = [v70 searchEntities];
    id v58 = [v57 count];
    v59 = [v73 queryContext];
    [v59 currentTime];
    double v61 = v60;
    v62 = [v73 queryContext];
    id v63 = [v62 queryKind];
    v64 = [v73 queryContext];
    v65 = [v64 clientBundleID];
    LOBYTE(v67) = v71;
    +[PRSRankingItemRanker thresholdResultsInSection:v76 userQuery:v69 queryID:v68 isEntitiesSearch:v58 != 0 currentTime:v54 isScopedSearch:v63 queryKind:v61 clientBundleID:v65 isSearchToolClient:v67];
  }
  si_tracing_log_span_end();
  long long v66 = v91;
  *(_OWORD *)uint64_t v72 = v90;
  *(_OWORD *)(v72 + 16) = v66;
  *(void *)(v72 + 32) = v92;
}

- (void)processUserActivitiesForSection:(id)a3
{
  id v94 = a3;
  uint64_t v3 = si_tracing_current_span();
  long long v4 = *(_OWORD *)(v3 + 16);
  long long v118 = *(_OWORD *)v3;
  long long v119 = v4;
  uint64_t v120 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v5;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v7;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPCoreSpotlightDatastore processUserActivitiesForSection:]";
  si_tracing_log_span_begin();
  uint64_t v89 = v3;
  id v95 = objc_alloc_init((Class)NSMutableDictionary);
  id v93 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v8 = [v94 results];
  id v9 = [v8 copy];

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v114 objects:v127 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v115;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v115 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "externalIdentifier", v89);
        if (!v15)
        {
          uint64_t v16 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v126 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "result missing identifier %@", buf, 0xCu);
          }
        }
        unsigned int v17 = [v14 userActivityRequiredString];
        if (v15) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 0;
        }
        int v19 = v18;

        if (v19)
        {
          [v95 setObject:v14 forKey:v15];
          id v20 = [v14 compatibilityTitle];
          if (v20) {
            [v93 addObject:v20];
          }
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v114 objects:v127 count:16];
    }
    while (v11);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v21 = v10;
  id v22 = [v21 countByEnumeratingWithState:&v110 objects:v124 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v111;
    do
    {
      for (uint64_t j = 0; j != v22; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v111 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v110 + 1) + 8 * (void)j);
        char v26 = objc_msgSend(v25, "relatedUniqueIdentifier", v89);
        if (v26)
        {
          uint64_t v27 = [v25 userActivityRequiredString];
          BOOL v28 = v27 == 0;

          if (v28)
          {
            id v29 = [v95 objectForKey:v26];
            BOOL v30 = v29 == 0;

            if (v30)
            {
              [v95 setObject:v25 forKey:v26];
              uint64_t v31 = [v25 compatibilityTitle];
              if (v31) {
                [v93 addObject:v31];
              }
            }
          }
        }
      }
      id v22 = [v21 countByEnumeratingWithState:&v110 objects:v124 count:16];
    }
    while (v22);
  }

  id v90 = objc_alloc_init((Class)NSMutableDictionary);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obj = v21;
  id v32 = [obj countByEnumeratingWithState:&v106 objects:v123 count:16];
  if (v32)
  {
    uint64_t v96 = *(void *)v107;
    do
    {
      id v97 = v32;
      for (k = 0; k != v97; k = (char *)k + 1)
      {
        if (*(void *)v107 != v96) {
          objc_enumerationMutation(obj);
        }
        unsigned int v34 = *(void **)(*((void *)&v106 + 1) + 8 * (void)k);
        unsigned __int8 v35 = objc_msgSend(v34, "compatibilityTitle", v89);
        if (!v35 && ([v34 hasDetail] & 1) == 0)
        {
          uint64_t v36 = [v34 sectionBundleIdentifier];
          int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();
          if (IsSyndicatedPhotos
            && ([v34 contentType],
                long long v91 = objc_claimAutoreleasedReturnValue(),
                ![v91 isEqualToString:@"public.item"]))
          {
          }
          else
          {
            id v38 = [v34 identifier];
            unsigned __int8 v39 = [v38 hasPrefix:SyntheticBookmarkIdentifierPrefix];

            if (IsSyndicatedPhotos) {
            if ((v39 & 1) == 0)
            }
            {
              [v94 removeResults:v34];
              goto LABEL_68;
            }
          }
        }
        uint64_t v40 = [v34 userActivityRequiredString];

        if (v40)
        {
          long long v41 = [v34 relatedUniqueIdentifier];
          if (v41)
          {
            long long v42 = [v34 fileProviderIdentifier];

            if (!v42)
            {
              long long v43 = [v95 objectForKey:v41];
              unsigned int v44 = v43;
              if (v43)
              {
                id v45 = [v43 score];
                unint64_t v47 = v46;
                id v48 = [v34 score];
                objc_msgSend(v44, "setScore:", __PAIR128__(v49, (unint64_t)v48) + __PAIR128__(v47, (unint64_t)v45));
                [v94 removeResults:v34];
                if (([v44 hasAssociatedUserActivity] & 1) == 0)
                {
                  objc_msgSend(v44, "setPubliclyIndexable:", objc_msgSend(v34, "publiclyIndexable"));
                  [v44 setHasAssociatedUserActivity:1];
                  v50 = [v34 launchDates];
                  [v44 setLaunchDates:v50];
                  goto LABEL_65;
                }
              }
              else
              {
                v51 = [v90 objectForKey:v41];
                v50 = v51;
                if (v51)
                {
                  id v52 = [v51 score];
                  unint64_t v54 = v53;
                  id v55 = [v34 score];
                  unint64_t v56 = (unint64_t)v55;
                  unint64_t v58 = v57;
                  if (__PAIR128__(v57, (unint64_t)v55) >= __PAIR128__(v54, (unint64_t)v52))
                  {
                    id v61 = [v34 buddyScore];
                    objc_msgSend(v34, "setBuddyScore:", __PAIR128__(v62, (unint64_t)v61) + __PAIR128__(v54, (unint64_t)v52));
                    [v94 removeResults:v50];
                    [v90 setObject:v34 forKey:v41];
                  }
                  else
                  {
                    id v59 = [v50 buddyScore];
                    objc_msgSend(v50, "setBuddyScore:", __PAIR128__(v60, (unint64_t)v59) + __PAIR128__(v58, v56));
                    [v94 removeResults:v34];
                  }
                }
                else
                {
                  [v90 setObject:v34 forKey:v41];
                }
LABEL_65:
              }
            }
          }
          else if (v35)
          {
            if ([v93 containsObject:v35]
              && ([v34 hasDetail] & 1) == 0)
            {
              [v94 removeResults:v34];
            }
            else
            {
              [v93 addObject:v35];
            }
          }
        }
LABEL_68:
      }
      id v32 = [obj countByEnumeratingWithState:&v106 objects:v123 count:16];
    }
    while (v32);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v63 = [v94 resultSet];
  id v64 = [v63 countByEnumeratingWithState:&v102 objects:v122 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v103;
    do
    {
      for (m = 0; m != v64; m = (char *)m + 1)
      {
        if (*(void *)v103 != v65) {
          objc_enumerationMutation(v63);
        }
        uint64_t v67 = *(void **)(*((void *)&v102 + 1) + 8 * (void)m);
        id v68 = objc_msgSend(v67, "score", v89);
        unint64_t v70 = v69;
        id v71 = [v67 buddyScore];
        objc_msgSend(v67, "setScore:", __PAIR128__(v72, (unint64_t)v71) + __PAIR128__(v70, (unint64_t)v68));
      }
      id v64 = [v63 countByEnumeratingWithState:&v102 objects:v122 count:16];
    }
    while (v64);
  }

  id v73 = objc_alloc_init((Class)NSMutableDictionary);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v74 = obj;
  id v75 = [v74 countByEnumeratingWithState:&v98 objects:v121 count:16];
  if (v75)
  {
    uint64_t v76 = *(void *)v99;
    do
    {
      for (n = 0; n != v75; n = (char *)n + 1)
      {
        if (*(void *)v99 != v76) {
          objc_enumerationMutation(v74);
        }
        long long v78 = *(void **)(*((void *)&v98 + 1) + 8 * (void)n);
        long long v79 = objc_msgSend(v78, "itemIdentifier", v89);

        if (v79)
        {
          long long v80 = [v78 itemIdentifier];
          long long v81 = [v73 objectForKey:v80];

          if (v81)
          {
            id v82 = [v81 score];
            unint64_t v84 = v83;
            id v85 = [v78 score];
            if (__PAIR128__(v86, (unint64_t)v85) < __PAIR128__(v84, (unint64_t)v82))
            {
              [v94 removeResults:v78];
LABEL_88:

              continue;
            }
            [v94 removeResults:v81];
          }
          long long v87 = [v78 itemIdentifier];
          [v73 setObject:v78 forKey:v87];

          goto LABEL_88;
        }
      }
      id v75 = [v74 countByEnumeratingWithState:&v98 objects:v121 count:16];
    }
    while (v75);
  }

  si_tracing_log_span_end();
  long long v88 = v119;
  *(_OWORD *)uint64_t v89 = v118;
  *(_OWORD *)(v89 + 16) = v88;
  *(void *)(v89 + 32) = v120;
}

- (void)sortResultsInSection:(id)a3 currentTime:(double)a4
{
  id v12 = a3;
  uint64_t v6 = si_tracing_current_span();
  long long v13 = *(_OWORD *)v6;
  long long v14 = *(_OWORD *)(v6 + 16);
  uint64_t v15 = *(void *)(v6 + 32);
  uint64_t v7 = *(void *)v6;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v6 + 8);
  *(void *)uint64_t v6 = v7;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = v9;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "-[SPCoreSpotlightDatastore sortResultsInSection:currentTime:]";
  si_tracing_log_span_begin();
  +[PRSRankingItemRanker sortResultsInSection:v12 currentTime:a4];
  id v10 = [v12 bundleIdentifier];
  unsigned int v11 = [v10 isEqual:SSCalendarBundleIdentifier];

  if (v11) {
    [(SPCoreSpotlightDatastore *)self hideIrrelevantCalendarResultsForSection:v12];
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v13;
  *(_OWORD *)(v6 + 16) = v14;
  *(void *)(v6 + 32) = v15;
}

- (id)rankingQueriesAddingQueryTerms:(id)a3 rankingQueries:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (char *)[v5 count];
  if (v7)
  {
    uint64_t v8 = [v5 objectAtIndex:v7 - 1];
    uint64_t v9 = [v6 arrayByAddingObject:v8];

    id v6 = (id)v9;
  }

  return v6;
}

- (id)performQuery:(id)a3
{
  return [(SPCoreSpotlightDatastore *)self performQuery:a3 isCorrectedQuery:0 reuseTask:0 needsFuzzy:0 pommesRewrite:0 embeddingsRequery:0];
}

- (id)_topHitQueryParametersForSearchString:(id)a3 searchEntities:(id)a4 contextIdentifier:(id)a5 queryKind:(unint64_t)a6 needsFuzzy:(BOOL)a7 checkForMath:(BOOL)a8 isCJK:(BOOL)a9 disableNLP:(BOOL)a10 disableOCR:(BOOL)a11 previousQueryKind:(unint64_t)a12 clientBundle:(id)a13 keyboardLanguage:(id)a14 queryID:(int64_t)a15
{
  BOOL v113 = a8;
  BOOL v119 = a7;
  id v17 = a3;
  id v126 = a4;
  id v117 = a5;
  id v124 = a13;
  id v123 = a14;
  uint64_t v18 = si_tracing_current_span();
  long long v19 = *(_OWORD *)(v18 + 16);
  long long v148 = *(_OWORD *)v18;
  long long v149 = v19;
  uint64_t v150 = *(void *)(v18 + 32);
  uint64_t v20 = *(void *)v18;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v22 = *(void *)(v18 + 8);
  *(void *)uint64_t v18 = v20;
  *(void *)(v18 + 8) = spanid;
  *(void *)(v18 + 16) = v22;
  *(unsigned char *)(v18 + 28) = 102;
  *(void *)(v18 + 32) = "-[SPCoreSpotlightDatastore _topHitQueryParametersForSearchString:searchEntities:contextIdentif"
                          "ier:queryKind:needsFuzzy:checkForMath:isCJK:disableNLP:disableOCR:previousQueryKind:clientBund"
                          "le:keyboardLanguage:queryID:]";
  si_tracing_log_span_begin();
  uint64_t v120 = v18;
  uint64_t v23 = SPLogForSPLogCategoryDefault();
  os_log_type_t v24 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v23, v24))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v152) = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "[SPCoreSpotlightDatastore]QOS _topHitQueryParameters: %d", buf, 8u);
  }

  id v25 = objc_opt_new();
  [v25 setObject:&__kCFBooleanFalse forKey:@"isNLQuery"];
  [v25 setObject:&__kCFBooleanFalse forKey:@"isAdvancedSyntax"];
  [v25 setObject:&__kCFBooleanFalse forKey:@"isMath"];
  [v25 setObject:&__NSArray0__struct forKey:@"suggestions"];
  [v25 setObject:&__NSDictionary0__struct forKey:@"rankCategories"];
  [v25 setObject:&__NSDictionary0__struct forKey:@"rankTerms"];
  [v25 setObject:&__NSArray0__struct forKey:@"queryTerms"];
  [v25 setObject:&stru_100094088 forKey:@"query"];
  [v25 setObject:&stru_100094088 forKey:@"completionString"];
  [v25 setObject:&off_100098B70 forKey:@"completionCount"];
  [v25 setObject:&off_100098B70 forKey:@"completionOptions"];
  [v25 setObject:&__NSArray0__struct forKey:@"completionAttributes"];
  id v128 = v25;
  if (!qword_1000A8F58 && !qword_1000A8EE8) {
    dispatch_group_wait((dispatch_group_t)qword_1000A8F60, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v26 = v17;
  id v116 = [v26 length];
  v127 = v26;
  id v115 = [v26 length];
  long long v135 = objc_opt_new();
  long long v134 = objc_opt_new();
  v125 = objc_opt_new();
  long long v133 = objc_opt_new();
  long long v132 = objc_opt_new();
  if (v126 && [v126 count] && objc_msgSend(v126, "count"))
  {
    long long v146 = 0u;
    long long v147 = 0u;
    long long v145 = 0u;
    long long v144 = 0u;
    id obj = v126;
    id v27 = [obj countByEnumeratingWithState:&v144 objects:v156 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v145;
      uint64_t v29 = (uint64_t)v26;
      do
      {
        BOOL v30 = 0;
        uint64_t v31 = (void *)v29;
        do
        {
          if (*(void *)v145 != v28) {
            objc_enumerationMutation(obj);
          }
          id v32 = *(void **)(*((void *)&v144 + 1) + 8 * (void)v30);
          uint64_t v29 = [v32 queryString];

          uint64_t v33 = [v32 spotlightQueryString];
          if (v33) {
            [v135 addObject:v33];
          }
          unsigned int v34 = [v32 spotlightFilterQueries];
          if (v34) {
            [v134 addObjectsFromArray:v34];
          }
          unsigned __int8 v35 = [v32 spotlightRankCategories];
          if (v35) {
            [v132 addEntriesFromDictionary:v35];
          }
          uint64_t v36 = [v32 spotlightRankTerms];
          if (v36) {
            [v133 addEntriesFromDictionary:v36];
          }
          unsigned int v37 = [v32 isScopedSearch];
          uint64_t v38 = (uint64_t)[v32 isNLPEntitySearch];

          BOOL v30 = (char *)v30 + 1;
          uint64_t v31 = (void *)v29;
        }
        while (v27 != v30);
        id v27 = [obj countByEnumeratingWithState:&v144 objects:v156 count:16];
      }
      while (v27);
    }
    else
    {
      unsigned int v37 = 0;
      uint64_t v38 = 0;
      uint64_t v29 = (uint64_t)v127;
    }

    uint64_t v40 = [v133 keysSortedByValueUsingSelector:"compare:"];
    [v125 addObjectsFromArray:v40];

    unsigned __int8 v39 = (void *)v29;
  }
  else
  {
    unsigned int v37 = 0;
    uint64_t v38 = 0;
    unsigned __int8 v39 = v127;
  }
  long long v118 = v39;
  if (![v39 length] || (!objc_msgSend(v135, "count") ? (int v41 = 1) : (int v41 = v37), v41 != 1))
  {
    unsigned int v121 = 0;
    id obja = v127;
    goto LABEL_136;
  }
  if (a6 - 1 < 8 && ((0xE3u >> (a6 - 1)) & 1) != 0)
  {
    char v42 = 0;
    goto LABEL_48;
  }
  if (a12 - 1 < 2)
  {
    if (a6 != 10) {
      goto LABEL_42;
    }
LABEL_41:
    char v42 = 0;
    goto LABEL_48;
  }
  if (a6 == 10 && a12 - 6 < 3) {
    goto LABEL_41;
  }
LABEL_42:
  if (a6 == 11 && v124)
  {
    char v42 = 0;
    if (v119) {
      char v42 = [v124 isEqualToString:PRSRankingSearchBundleString] ^ 1;
    }
  }
  else
  {
    char v42 = 0;
  }
LABEL_48:
  BYTE3(v105) = v42;
  BYTE2(v105) = v113;
  BYTE1(v105) = v37;
  LOBYTE(v105) = a11;
  long long v43 = SSDefaultQueryParseResultsForQueryString();
  long long v112 = v43;
  if (v43)
  {
    unsigned int v44 = objc_msgSend(v43, "objectForKeyedSubscript:", @"query", v105);
    if (SSEnableAppSearchV2() && (a6 > 0xA || ((1 << a6) & 0x430) == 0))
    {
      id v45 = SPFastApplicationsNamesGetNoBuild();
      if ([v45 count])
      {
        unint64_t v46 = getAppCorrectionIfAny();
        long long v110 = v45;
        if ([v46 count])
        {
          long long v142 = 0u;
          long long v143 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          id objb = v46;
          id v47 = [objb countByEnumeratingWithState:&v140 objects:v155 count:16];
          long long v106 = v46;
          if (v47)
          {
            uint64_t v48 = *(void *)v141;
            do
            {
              id v49 = v47;
              v50 = 0;
              v51 = v44;
              do
              {
                if (*(void *)v141 != v48) {
                  objc_enumerationMutation(objb);
                }
                uint64_t v52 = *(void *)(*((void *)&v140 + 1) + 8 * (void)v50);
                unint64_t v53 = SPLogForSPLogCategoryDefault();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  CSRedactString();
                  id v54 = (id)objc_claimAutoreleasedReturnValue();
                  CSRedactString();
                  id v55 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  id v152 = v54;
                  __int16 v153 = 2112;
                  id v154 = v55;
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <AppSpellCorrection> query: %@, app correction: %@", buf, 0x16u);
                }
                unsigned int v44 = [v51 stringByAppendingFormat:@" || ((kMDItemDisplayName=\"%@\"cwd) && (kMDItemContentType == \"com.apple.application\"", v52];

                v50 = (char *)v50 + 1;
                v51 = v44;
              }
              while (v49 != v50);
              id v47 = [objb countByEnumeratingWithState:&v140 objects:v155 count:16];
            }
            while (v47);
          }

          unint64_t v46 = v106;
        }

        id v45 = v110;
      }
    }
    id obja = [v112 objectForKeyedSubscript:@"completionString"];

    if (v113)
    {
      unint64_t v56 = [v112 objectForKeyedSubscript:@"isMath"];
      if (v56)
      {
        unint64_t v57 = [v112 objectForKeyedSubscript:@"isMath"];
        unsigned int v121 = [v57 BOOLValue];
      }
      else
      {
        unsigned int v121 = 0;
      }
    }
    else
    {
      unsigned int v121 = 0;
    }
  }
  else
  {
    unsigned int v121 = 0;
    unsigned int v44 = 0;
    id obja = v127;
  }
  BOOL v58 = 0;
  id v59 = 0;
  if ((unint64_t)v116 >= 3 && !a10)
  {
    unint64_t v60 = +[NSMutableDictionary dictionary];
    id v61 = v60;
    if (v117) {
      [v60 setObject:v117 forKeyedSubscript:@"kMDQueryOptionContextIdentifier"];
    }
    if (objc_msgSend(v123, "length", v105)) {
      [v61 setValue:v123 forKey:@"keyboardLanguage"];
    }
    unint64_t v62 = +[NSNumber numberWithInteger:a15];
    [v61 setValue:v62 forKey:@"queryID"];

    long long v107 = SSGetCurrentLocale();
    if (v107)
    {
      id v63 = [v107 languageIdentifier];
      BOOL v64 = [v63 length] == 0;

      if (!v64)
      {
        uint64_t v65 = [v107 languageIdentifier];
        [v61 setValue:v65 forKey:@"localeLanguage"];
      }
    }
    id v66 = v124;
    if (qword_1000A9020 != -1) {
      dispatch_once(&qword_1000A9020, &stru_100093820);
    }
    if (byte_1000A9019) {
      goto LABEL_85;
    }
    if (!byte_1000A9018)
    {

      goto LABEL_87;
    }
    if (([v66 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v66 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
LABEL_85:
    }
    else
    {
      unsigned int v73 = [v66 hasPrefix:@"com.apple.ondeviceeval"];
      if (a6 == 12) {
        int v74 = 1;
      }
      else {
        int v74 = v73;
      }

      if (!v74) {
        goto LABEL_87;
      }
    }
    [v61 setValue:&__kCFBooleanTrue forKey:@"isSearchToolClient"];
LABEL_87:
    uint64_t v67 = SSQueryParseResultsForQueryString();
    id v59 = v67;
    if (v67)
    {
      long long v114 = [v67 objectForKeyedSubscript:@"nlQuery"];
      long long v111 = [v59 objectForKeyedSubscript:@"annQuery"];
      id v68 = [v59 objectForKeyedSubscript:@"isNLQuery"];
      uint64_t v38 = (uint64_t)[v68 BOOLValue];

      long long v109 = [v59 objectForKeyedSubscript:@"rankCategories"];
      unint64_t v69 = [v59 objectForKeyedSubscript:@"rankTerms"];
      long long v108 = [v59 objectForKeyedSubscript:@"queryTerms"];
      unint64_t v70 = [v59 objectForKeyedSubscript:@"suggestions"];
      id v71 = [v59 objectForKeyedSubscript:@"filterQueries"];
      if ([v71 count]) {
        [v128 setObject:v71 forKey:@"filterQueries"];
      }
      unint64_t v72 = [v59 objectForKeyedSubscript:@"queryUnderstandingOutput"];
      [v128 setObject:v72 forKey:@"queryUnderstandingOutput"];
      BOOL v58 = v72 != 0;
    }
    else
    {
      long long v108 = 0;
      long long v109 = 0;
      unint64_t v69 = 0;
      unint64_t v70 = 0;
      long long v114 = 0;
      long long v111 = 0;
      BOOL v58 = 0;
    }

    goto LABEL_102;
  }
  long long v108 = 0;
  long long v109 = 0;
  unint64_t v69 = 0;
  unint64_t v70 = 0;
  long long v114 = 0;
  long long v111 = 0;
LABEL_102:
  if (!v44)
  {
    uint64_t v139 = 0;
    id v75 = SSPhraseQueryEscapeString();
    id v76 = 0;
    if ((unint64_t)v116 > 2) {
      int v77 = 1;
    }
    else {
      int v77 = v37;
    }
    if (v77 == 1) {
      +[NSString stringWithFormat:@"(**=\"%@*\"cwdt)", v75];
    }
    else {
    unsigned int v44 = +[NSString stringWithFormat:@"((*=\"%@*\"cwdt) || (kMDItemTextContent=\"%@\"cwdt))", v75, v75];
    }
  }
  long long v78 = v44;
  long long v79 = v78;
  if (v114) {
    int v80 = v38;
  }
  else {
    int v80 = 0;
  }
  if (v80 == 1)
  {
    if (v109) {
      [v132 addEntriesFromDictionary:v109];
    }
    if (v69) {
      [v133 addEntriesFromDictionary:v69];
    }
    if (v108) {
      [v125 addObjectsFromArray:v108];
    }
    long long v81 = v79;
    if (objc_msgSend(v114, "length", v105))
    {
      long long v81 = +[NSString stringWithFormat:@"(%@ || %@)", v114, v79];
    }
    if (v70) {
      [v128 setObject:v70 forKey:@"suggestions"];
    }
    uint64_t v38 = 1;
  }
  else
  {
    long long v81 = v78;
    if (v58)
    {
      if (v109) {
        [v132 addEntriesFromDictionary:v109];
      }
      if (v69) {
        [v133 addEntriesFromDictionary:v69];
      }
      uint64_t v38 = 1;
      long long v81 = v79;
    }
  }
  if (objc_msgSend(v111, "length", v105))
  {
    uint64_t v82 = +[NSString stringWithFormat:@"(%@ || %@)", v111, v81];

    long long v81 = (__CFString *)v82;
  }
  if (!v81) {
    long long v81 = @"*=*";
  }
  [v135 addObject:v81];

  unsigned __int8 v39 = v118;
LABEL_136:
  int v83 = _os_feature_enabled_impl();
  int v84 = _os_feature_enabled_impl();
  if (a6 - 1 <= 1)
  {
    int v85 = v84;
    id v86 = [v39 length];
    BOOL v87 = (unint64_t)v86 > 3;
    if ((unint64_t)v86 <= 3 && ((v83 ^ 1) & 1) == 0) {
      BOOL v87 = [v39 length] != 0;
    }
    if (v87 && v115)
    {
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472;
      v137[2] = sub_10003AAE4;
      v137[3] = &unk_100093408;
      char v138 = v83;
      long long v88 = v137;
      if (qword_1000A8FC8 != -1) {
        dispatch_once(&qword_1000A8FC8, v88);
      }

      if (v83)
      {
        if (v85) {
          uint64_t v89 = 16768;
        }
        else {
          uint64_t v89 = 384;
        }
        id v90 = (id)qword_1000A8FB8;
        uint64_t v91 = 50;
        goto LABEL_165;
      }
      uint64_t v92 = SIGetCompletionOptionsFromRankingWeights();
      uint64_t v89 = v92;
      if ((unint64_t)v115 > 5)
      {
        if ((unint64_t)v115 <= 8)
        {
          if (v115 == (id)8)
          {
            uint64_t v91 = 50;
          }
          else if ((unint64_t)v115 <= 6)
          {
            uint64_t v91 = 25;
          }
          else
          {
            uint64_t v91 = 40;
          }
        }
        else
        {
          uint64_t v91 = 65;
        }
        goto LABEL_164;
      }
      if (v92)
      {
        if ((unint64_t)v115 >= 5) {
          goto LABEL_152;
        }
      }
      else if ((unint64_t)v115 >= 3)
      {
LABEL_152:
        uint64_t v91 = 20;
        goto LABEL_164;
      }
      id v90 = (id)qword_1000A8FC0;
      uint64_t v91 = 20;
      if (v90)
      {
LABEL_165:
        [v128 setObject:obja forKey:@"completionString"];
        id v93 = +[NSNumber numberWithUnsignedInt:v89];
        [v128 setObject:v93 forKey:@"completionOptions"];

        id v94 = +[NSNumber numberWithInteger:v91];
        [v128 setObject:v94 forKey:@"completionCount"];

        [v128 setObject:v90 forKey:@"completionAttributes"];
        goto LABEL_166;
      }
LABEL_164:
      id v90 = (id)qword_1000A8FB8;
      uint64_t v89 = v89 | 0x60;
      goto LABEL_165;
    }
  }
LABEL_166:
  if ([v135 count])
  {
    id v95 = [v135 componentsJoinedByString:@" && "];
  }
  else
  {
    id v95 = @"(true)");
  }
  if ([v134 count])
  {
    id v96 = [v134 componentsJoinedByString:@" && "];

    if (v96)
    {
      uint64_t v97 = +[NSString stringWithFormat:@"((%@) && (%@))", v95, v96];

      id v95 = (__CFString *)v97;
    }
  }
  else
  {
    id v96 = 0;
  }
  [v128 setObject:v132 forKey:@"rankCategories"];
  [v128 setObject:v133 forKey:@"rankTerms"];
  [v128 setObject:v125 forKey:@"queryTerms"];
  long long v98 = +[NSNumber numberWithBool:v38];
  [v128 setObject:v98 forKey:@"isNLQuery"];

  long long v99 = +[NSNumber numberWithBool:0];
  [v128 setObject:v99 forKey:@"isAdvancedSyntax"];

  long long v100 = +[NSNumber numberWithBool:v121];
  [v128 setObject:v100 forKey:@"isMath"];

  [v128 setObject:v95 forKey:@"query"];
  id v136 = v128;
  _checkMatch(v38, v124, v123, v127, v95, v119, &v136);
  id v101 = v136;

  id v102 = v101;
  si_tracing_log_span_end();
  long long v103 = v149;
  *(_OWORD *)uint64_t v120 = v148;
  *(_OWORD *)(v120 + 16) = v103;
  *(void *)(v120 + 32) = v150;

  return v102;
}

- (id)coreSpotlightQueryTaskWithQuery:(id)a3 reuseTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = (SPCoreSpotlightQueryTask *)v7;
    [(SPCoreSpotlightQueryTask *)v9 reset];
  }
  else
  {
    uint64_t v9 = [[SPCoreSpotlightQueryTask alloc] initWithStore:self resultPipe:v6];
    [(SPCoreSpotlightQueryTask *)v9 setPriorityIndexEnabled:self->_priorityIndexEnabled];
  }

  return v9;
}

- (id)performQuery:(id)a3 isCorrectedQuery:(BOOL)a4 reuseTask:(id)a5 needsFuzzy:(BOOL)a6 pommesRewrite:(id)a7 embeddingsRequery:(BOOL)a8
{
  BOOL v362 = a8;
  BOOL v359 = a6;
  id v374 = a3;
  id v365 = a5;
  id v364 = a7;
  uint64_t v10 = si_tracing_current_span();
  long long v11 = *(_OWORD *)(v10 + 16);
  long long v481 = *(_OWORD *)v10;
  long long v482 = v11;
  uint64_t v483 = *(void *)(v10 + 32);
  uint64_t v373 = v10;
  uint64_t v12 = *(void *)v10;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v14 = *(void *)(v373 + 8);
  *(void *)uint64_t v373 = v12;
  *(void *)(v373 + 8) = spanid;
  *(void *)(v373 + 16) = v14;
  *(unsigned char *)(v373 + 28) = 102;
  *(void *)(v373 + 32) = "-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:e"
                           "mbeddingsRequery:]";
  si_tracing_log_span_begin();
  if (qword_1000A8FE0 != -1) {
    dispatch_once(&qword_1000A8FE0, &stru_100093428);
  }
  uint64_t v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "QOS performQuery: %d", buf, 8u);
  }

  id v17 = (void *)qword_1000A8F10;
  id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E3D90047-9384-482F-8CAF-739CA04382BE"];
  objc_msgSend(v17, "logForTrigger:queryID:", v18, objc_msgSend(v374, "queryIdent"));

  if (qword_1000A8FF0 != -1) {
    dispatch_once(&qword_1000A8FF0, &stru_100093448);
  }
  long long v19 = [v374 queryContext];
  v371 = [v19 getTrimmedSearchString];

  uint64_t v20 = [v374 queryContext];
  uint64_t v369 = (uint64_t)[v20 queryKind];

  id v21 = [v374 queryContext];
  [v21 whyQuery];

  if (![v371 length] && (unint64_t)(v369 - 9) >= 0xFFFFFFFFFFFFFFFBLL)
  {
    id v22 = 0;
    goto LABEL_256;
  }
  [v374 externalID];
  kdebug_trace();
  uint64_t v23 = SPLogForSPLogCategoryTelemetry();
  unsigned int v24 = [v374 externalID];
  if (v24 && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v24, "coreSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
  }

  v477[0] = 0;
  v477[1] = v477;
  v477[2] = 0x3810000000;
  v477[3] = &unk_100088103;
  __uint64_t v478 = 0;
  uint64_t v480 = 0;
  uint64_t v479 = 0;
  __uint64_t v25 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v480 = 0;
  __uint64_t v478 = v25;
  uint64_t v479 = 0;
  if ((*((unsigned char *)self + 8) & 0x20) != 0) {
    atomic_fetch_add(&dword_1000A8EE0, 1u);
  }
  else {
    [(SPCoreSpotlightDatastore *)self activate];
  }
  [v374 currentTime];
  uint64_t v27 = v26;
  uint64_t v28 = [v374 queryContext];
  v368 = [v28 searchString];

  if (byte_1000A8F50) {
    [(id)qword_1000A8F48 setObject:v368 forKey:@"lastQueryString"];
  }
  if ([v374 isCJK]) {
    char v29 = 2;
  }
  else {
    char v29 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFD | v29;
  if (([v374 previousQueryKind] == (id)1 || objc_msgSend(v374, "previousQueryKind") == (id)2)
    && v369 == 10)
  {
    uint64_t v369 = (uint64_t)[v374 previousQueryKind];
  }
  BOOL v30 = [v374 queryContext];
  BOOL v31 = [v30 deviceAuthenticationState] == (id)2;

  if (v31)
  {
    id v32 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Skipping corespotlight query because of biometryLockout", buf, 2u);
    }

    uint64_t v33 = [(SPCoreSpotlightDatastore *)self coreSpotlightQueryTaskWithQuery:v374 reuseTask:v365];
    [v33 finish];
    id v22 = 0;

    goto LABEL_255;
  }
  unsigned int v34 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = [v374 hash];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#query corespotlight start (qid: %lld)", buf, 0xCu);
  }

  v358 = sub_10004DA44();
  v355 = [v374 itemRanker];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F80);
  id v346 = (id)qword_1000A8EF8;
  id v347 = (id)qword_1000A8F68;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F80);
  uint64_t v36 = [v374 queryContext];
  unsigned int v37 = [v36 searchEntities];
  if (!v37)
  {
    unsigned int v348 = 0;
    v345 = 0;
    goto LABEL_35;
  }
  uint64_t v38 = [v374 queryContext];
  unsigned __int8 v39 = [v38 searchEntities];
  BOOL v40 = [v39 count] == 0;

  if (!v40)
  {
    int v41 = [v374 queryContext];
    char v42 = [v41 searchEntities];
    uint64_t v36 = [v42 lastObject];

    unsigned int v348 = [v36 isScopedSearch];
    v345 = [v36 tokenText];
    uint64_t v43 = [v36 currentSearchString];

    v368 = (void *)v43;
LABEL_35:

    goto LABEL_37;
  }
  unsigned int v348 = 0;
  v345 = 0;
LABEL_37:
  v375 = objc_opt_new();
  [v375 setFetchAttributes:v358];
  [v374 currentTime];
  objc_msgSend(v375, "setCurrentTime:");
  unsigned int v44 = [v374 queryContext];
  id v45 = [v44 keyboardPrimaryLanguage];
  [v375 setKeyboardLanguage:v45];

  unint64_t v46 = [v364 searchQueryContext];
  id v47 = [v46 rewriteContext];
  [v375 setRewriteContext:v47];

  [v375 setEntitledAttributes:7];
  [v375 setDisableNLP:0];
  objc_msgSend(v375, "setQueryID:", objc_msgSend(v374, "hash"));
  [v375 setUserQuery:v368];
  uint64_t v48 = [v374 queryContext];
  objc_msgSend(v375, "setFetchl2Signals:", objc_msgSend(v48, "fetchL2Signals"));

  [v375 setPriorityIndexQuery:1];
  id v49 = [v374 queryContext];
  objc_msgSend(v375, "setEnableInstantAnswers:", objc_msgSend(v49, "enablePersonalAnswers"));

  v50 = (uint64_t (*)(uint64_t, uint64_t))[v374 maxCount];
  if (v50 == (uint64_t (*)(uint64_t, uint64_t))13)
  {
    uint64_t v51 = 20;
  }
  else
  {
    v351 = v50;
    if (v50 != (uint64_t (*)(uint64_t, uint64_t))50) {
      goto LABEL_42;
    }
    uint64_t v51 = 100;
  }
  v351 = (uint64_t (*)(uint64_t, uint64_t))v51;
LABEL_42:
  uint64_t v52 = SPLogForSPLogCategoryDefault();
  os_log_type_t v53 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v52, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v351;
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "Rank count:%d", buf, 8u);
  }

  if (([v374 cancelled] & 1) == 0)
  {
    if (a4 || v359 || v362)
    {
      [v374 setPreviousQueryKind:v369];
      uint64_t v369 = 10;
    }
    if (v362)
    {
      id v54 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
      id v476 = v54;
      uint64_t v55 = [v355 requery:&v476];
      id v336 = v476;

      [v355 resetWithSearchString:v55];
      unint64_t v56 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v55;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Word embeddings on, new search string = %@", buf, 0xCu);
      }

      v368 = (void *)v55;
    }
    else
    {
      id v336 = 0;
    }
    v366 = [v374 queryContext];
    v353 = [v366 searchEntities];
    unint64_t v57 = [v374 connection];
    BOOL v58 = [v57 bundleID];
    char v59 = *((unsigned char *)self + 8);
    unsigned __int8 v60 = [v375 disableNLP];
    id v61 = [v374 queryContext];
    unsigned __int8 v62 = [v61 disableOCR];
    id v63 = [v374 previousQueryKind];
    BOOL v64 = [v374 itemRanker];
    uint64_t v65 = [v64 keyboardLanguage];
    id v66 = [v374 queryID];
    uint64_t v338 = PRSRankingSearchBundleString;
    BYTE2(v286) = v62;
    BYTE1(v286) = v60;
    LOBYTE(v286) = (v59 & 2) != 0;
    v361 = -[SPCoreSpotlightDatastore _topHitQueryParametersForSearchString:searchEntities:contextIdentifier:queryKind:needsFuzzy:checkForMath:isCJK:disableNLP:disableOCR:previousQueryKind:clientBundle:keyboardLanguage:queryID:](self, "_topHitQueryParametersForSearchString:searchEntities:contextIdentifier:queryKind:needsFuzzy:checkForMath:isCJK:disableNLP:disableOCR:previousQueryKind:clientBundle:keyboardLanguage:queryID:", v368, v353, v58, v369, v359, 1, v286, v63, PRSRankingSearchBundleString, v65, v66);

    uint64_t v67 = [v361 objectForKeyedSubscript:@"queryUnderstandingOutput"];
    id v68 = [v374 queryContext];
    [v68 setQueryUnderstandingOutput:v67];

    unint64_t v69 = [v361 objectForKeyedSubscript:@"queryUnderstandingOutput"];
    [v375 setQueryUnderstandingOutput:v69];

    v354 = [v361 objectForKeyedSubscript:@"query"];
    v334 = [v361 objectForKeyedSubscript:@"filterQueries"];
    v333 = [v361 objectForKeyedSubscript:@"suggestions"];
    unint64_t v70 = [v361 objectForKeyedSubscript:@"isMath"];
    unsigned __int8 v328 = [v70 BOOLValue];

    id v71 = [v361 objectForKeyedSubscript:@"isNLQuery"];
    id v72 = [v71 BOOLValue];

    unsigned int v73 = [v374 queryContext];
    id v74 = [v73 queryKind];
    id v75 = [v374 queryContext];
    id v76 = [v75 clientBundleID];
    if (qword_1000A9020 != -1) {
      dispatch_once(&qword_1000A9020, &stru_100093820);
    }
    if (byte_1000A9019) {
      goto LABEL_58;
    }
    if (!byte_1000A9018)
    {
      unsigned int v342 = 0;
LABEL_60:

      unsigned int v78 = [v375 enableInstantAnswers];
      unsigned int v79 = +[CSInstantAnswers isInstantAnswerTriggerQuery:v368 isCJK:(*((unsigned __int8 *)self + 8) >> 1) & 1 isSearchTool:v342];
      int v80 = v78 | v342;
      if (v78 | v342)
      {
        long long v81 = +[SPCoreSpotlightIndexer sharedInstance];
        id v475 = 0;
        id v474 = 0;
        [v81 processSearchString:v368 intoTrimmedString:&v475 andTokens:&v474];
        id v337 = v475;
        id v340 = v474;
      }
      else
      {
        id v337 = 0;
        id v340 = 0;
      }
      uint64_t v82 = [v375 queryUnderstandingOutput];
      v341 = +[CSPersonalAnswers personalAnswersEventIntentForQUOutput:v82];

      if (v341) {
        int v83 = v80;
      }
      else {
        int v83 = 0;
      }
      if ((v83 & v79 & 1) == 0) {
        [v375 setDisableBundles:&off_100099200];
      }
      int v84 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        CSRedactString();
        id v85 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v85;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v80;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v79;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "[personal answers][query] For Query = %@, personalAnswersAllowed = %d, isPersonalAnswersTriggeringQuery = %d", buf, 0x18u);
      }
      if ((v80 & v79) != 1) {
        goto LABEL_113;
      }
      if (+[CSInstantAnswers overrideParsedQuery:v368])
      {
        id v86 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          CSRedactString();
          id v87 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v87;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "[personal answers][query] Overriding parsed query for searchString = %@", buf, 0xCu);
        }
      }
      long long v88 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        CSRedactString();
        id v89 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v89;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "[personal answers][query] using fallback personalAnswerQuery for searchString = %@", buf, 0xCu);
      }
      if ((unint64_t)[v340 count] >= 2) {
        unint64_t v90 = 2;
      }
      else {
        unint64_t v90 = 3;
      }
      char v91 = *((unsigned char *)self + 8);
      if ((v91 & 2) != 0)
      {
        if ((unint64_t)[v337 length] < 3)
        {
          BOOL v92 = 1;
LABEL_94:
          id v94 = +[NSMutableSet set];
          id v95 = +[CSPersonalAnswers personalAnswersFallbackQueries:v340 queryComponents:&__NSArray0__struct searchString:v337 answerAttributeIntents:v94 isShortQuery:v92 locale:@"en"];
          if (v95)
          {
            id v96 = +[CSPersonalAnswers attributesFromIntent:v94];
            uint64_t v97 = [v375 fetchAttributes];
            long long v98 = [v96 allObjects];
            long long v99 = [v97 arrayByAddingObjectsFromArray:v98];
            [v375 setFetchAttributes:v99];

            [v375 setInstantAnswersBundleIDs:&off_100099218];
            [v375 setInstantAnswersQueries:v95];
            long long v100 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
              sub_100065A14();
            }

            [v375 setDisableBundles:&__NSArray0__struct];
            if (!v341)
            {
              id v101 = objc_opt_new();
              id v102 = objc_alloc((Class)NSString);
              id v103 = [v102 initWithFormat:@"(%@ != %@)", MDItemBundleID, @"com.apple.spotlight.events"];
              [v101 addObject:v354];
              [v101 addObject:v103];
              uint64_t v104 = [v101 componentsJoinedByString:@" && "];

              v354 = (void *)v104;
            }
            uint64_t v105 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              CSRedactString();
              id v106 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v106;
              _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "[personal answers][query] Modified queryString = %@", buf, 0xCu);
            }
            long long v107 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
              sub_1000659A0();
            }

            long long v108 = [v94 allObjects];
            [v375 setAnswerAttributes:v108];

            long long v109 = [v94 allObjects];
            long long v110 = [v374 queryContext];
            [v110 setAnswerAttributes:v109];
          }
          long long v111 = [v374 queryContext];
          long long v112 = [v111 answerAttributes];
          if ([v112 count]) {
            BOOL v113 = 1;
          }
          else {
            BOOL v113 = v341 == 0;
          }
          int v114 = !v113;

          if (v114)
          {
            id v115 = +[CSPersonalAnswers attributeIntentsFromQU:v341];
            id v116 = [v374 queryContext];
            [v116 setAnswerAttributes:v115];
          }
LABEL_113:
          if (v342)
          {
            id v117 = +[SPCoreSpotlightIndexer sharedInstance];
            char v118 = objc_opt_respondsToSelector();

            if (v118)
            {
              BOOL v119 = +[SPCoreSpotlightIndexer sharedInstance];
              [v119 rewriteFirstPassQueryWithQueryString:v354 context:v375 trimmedSearchStringTokens:v340 populateDateSynonyms:1];
            }
          }
          [v375 setMaxCount:v351];
          [v375 setGrouped:v351 != 0];
          if (v362 && v368)
          {
            if ([v336 count])
            {
              uint64_t v120 = [v336 componentsJoinedByString:@" || "];
              uint64_t v121 = +[NSString stringWithFormat:@"(%@ || %@)", v354, v120];

              v354 = (void *)v121;
            }
            v122 = SPLogForSPLogCategoryDefault();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v354;
              _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Word embeddings on, new query string = %@", buf, 0xCu);
            }
          }
          id v123 = [v361 objectForKeyedSubscript:@"completionString"];
          id v124 = [v123 length];

          if (v124)
          {
            v125 = [v361 objectForKeyedSubscript:@"completionString"];
            [v375 setCompletionString:v125];

            id v126 = [v361 objectForKeyedSubscript:@"completionCount"];
            objc_msgSend(v375, "setCompletionResultCount:", (int)objc_msgSend(v126, "intValue"));

            v127 = [v361 objectForKeyedSubscript:@"completionOptions"];
            objc_msgSend(v375, "setCompletionOptions:", objc_msgSend(v127, "unsignedIntValue"));

            id v128 = [v361 objectForKeyedSubscript:@"completionAttributes"];
            [v375 setCompletionAttributes:v128];
          }
          v129 = SPLogForSPLogCategoryDefault();
          os_log_type_t v130 = 2 * (gSPLogDebugAsDefault == 0);
          if (os_log_type_enabled(v129, v130))
          {
            id v131 = v72;
            id v132 = [v375 dominantRankingQueryCount];
            id v133 = [v375 dominatedRankingQueryCount];
            long long v134 = (uint64_t (*)(uint64_t, uint64_t))[v375 shortcutBit];
            id v135 = [v375 highMatchBit];
            id v136 = [v375 lowMatchBit];
            id v137 = [v375 highRecencyBit];
            id v138 = [v375 lowRecencyBit];
            *(_DWORD *)buf = 134219520;
            *(void *)&uint8_t buf[4] = v132;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v133;
            *(_WORD *)&buf[22] = 2048;
            v495 = v134;
            *(_WORD *)v496 = 2048;
            *(void *)&v496[2] = v135;
            *(_WORD *)&v496[10] = 2048;
            *(void *)&v496[12] = v136;
            __int16 v497 = 2048;
            id v498 = v137;
            __int16 v499 = 2048;
            id v500 = v138;
            _os_log_impl((void *)&_mh_execute_header, v129, v130, "dominantRankingQueryCount:%ld dominatedRankingQueryCount:%ld shortcutBit:%ld, highMatchBit:%ld, lowMatchBit:%ld, highRecencyBit:%ld, lowRecencyBit:%ld", buf, 0x48u);
            id v72 = v131;
          }

          uint64_t v139 = SPLogForSPLogCategoryDefault();
          os_log_type_t v140 = 2 * (gSPLogDebugAsDefault == 0);
          if (os_log_type_enabled(v139, v140))
          {
            long long v141 = [v375 rankingQueries];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v354;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v141;
            *(_WORD *)&buf[22] = 2048;
            v495 = v351;
            _os_log_impl((void *)&_mh_execute_header, v139, v140, "Query string: %@\n\tRanking: %@\n\tmaxCount:%lld", buf, 0x20u);
          }
          uint64_t v470 = 0;
          v471 = &v470;
          uint64_t v472 = 0x2020000000;
          unsigned __int8 v473 = 0;
          unsigned __int8 v473 = [v374 isPeopleSearch];
          uint64_t v142 = qword_1000A8EE8;
          uint64_t v143 = qword_1000A8EF0;
          id v144 = (id)v369;
          if (v369 == 10) {
            id v144 = [v374 previousQueryKind];
          }
          int v145 = *((unsigned __int8 *)v471 + 24);
          long long v146 = [v375 keyboardLanguage];
          LOBYTE(v287) = v145 != 0;
          v367 = [v355 rankingConfigurationWithMeContact:v142 emailAddresses:v143 phoneFavorites:v346 vipList:v347 clientBundle:v338 isScopedSearch:v348 spotlightQuery:v354 userQuery:v368 tokenString:v345 queryKind:v144 isPeopleSearch:v287 keyboardLanguage:v146];

          long long v147 = [v375 completionString];

          if (v147)
          {
            id v148 = [v367 fuzzyMatchMask];
            objc_msgSend(v375, "setFuzzyMask:", v148, v149);
            id v150 = [v367 fuzzyMatchCheck];
            objc_msgSend(v375, "setFuzzyMatch:", v150, v151);
          }
          id v152 = [v367 rankingQueries];
          uint64_t v153 = [v361 objectForKeyedSubscript:@"queryTerms"];
          v335 = [v361 objectForKeyedSubscript:@"rankCategories"];
          id v154 = [v152 count];
          v332 = (void *)v153;
          if (v72)
          {
            if (v153)
            {
              v155 = PRSRankingItemRankerAddJunkFilter();
              uint64_t v156 = [(SPCoreSpotlightDatastore *)self rankingQueriesAddingQueryTerms:v155 rankingQueries:v152];

              id v152 = (void *)v156;
            }
            if (v335)
            {
              v157 = [v335 keysSortedByValueUsingSelector:"compare:"];
              [v355 setRankCategories:v157];
            }
            [v355 setIsNLSearch:1];
          }
          v158 = [v152 count];
          [v375 setParseUserQuery:v72];
          [v375 setRankingQueries:v152];
          objc_msgSend(v375, "setStrongRankingQueryCount:", objc_msgSend(v367, "strongRankingQueryCount"));
          char v349 = (_BYTE)v158 - (_BYTE)v154;
          objc_msgSend(v375, "setDominantRankingQueryCount:", (char *)objc_msgSend(v367, "dominantRankingQueryCount") + v158 - v154);
          objc_msgSend(v375, "setDominatedRankingQueryCount:", objc_msgSend(v367, "dominatedRankingQueryCount"));
          objc_msgSend(v375, "setShortcutBit:", objc_msgSend(v367, "shortcutBit"));
          objc_msgSend(v375, "setHighMatchBit:", objc_msgSend(v367, "highMatchBit"));
          objc_msgSend(v375, "setLowMatchBit:", objc_msgSend(v367, "lowMatchBit"));
          objc_msgSend(v375, "setHighRecencyBit:", objc_msgSend(v367, "highRecencyBit"));
          objc_msgSend(v375, "setLowRecencyBit:", objc_msgSend(v367, "lowRecencyBit"));
          v331 = v152;
          v159 = [v367 requiredAttributes];
          v339 = [v159 array];

          v160 = [v375 fetchAttributes];
          v161 = +[NSSet setWithArray:v160];

          v162 = objc_opt_class();
          v163 = [v375 fetchAttributes];
          v164 = [v162 _makeUniqueFetchAttributesWithAttributes:v163 extraAttributes:v339];
          [v375 setFetchAttributes:v164];

          v165 = [v375 fetchAttributes];
          id v166 = [v165 count];

          Mutable = CFBitVectorCreateMutable(kCFAllocatorDefault, (CFIndex)v166);
          CFBitVectorSetCount(Mutable, (CFIndex)v166);
          long long v468 = 0u;
          long long v469 = 0u;
          long long v466 = 0u;
          long long v467 = 0u;
          v168 = [v375 fetchAttributes];
          id v169 = [v168 countByEnumeratingWithState:&v466 objects:v493 count:16];
          if (v169)
          {
            uint64_t v170 = 0;
            uint64_t v171 = *(void *)v467;
            do
            {
              for (i = 0; i != v169; i = (char *)i + 1)
              {
                if (*(void *)v467 != v171) {
                  objc_enumerationMutation(v168);
                }
                v173 = *(void **)(*((void *)&v466 + 1) + 8 * i);
                v174 = [v375 fetchAttributes];
                if (objc_claimAutoreleasedReturnValue() ! = [v174 objectAtIndex:(char *)i + v170]; {
                  __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]", "SPCoreSpotlightDatastore.m", 3272, "[queryContext.fetchAttributes objectAtIndex:(NSUInteger)bvi] == s");
                }

                if ([v161 containsObject:v173]) {
                  CFBitVectorSetBitAtIndex(Mutable, (CFIndex)i + v170, 1u);
                }
              }
              id v169 = [v168 countByEnumeratingWithState:&v466 objects:v493 count:16];
              v170 += (uint64_t)i;
            }
            while (v169);

            [v375 setNonTopHitFetchAttributeIndexesBits:Mutable];
          }
          else
          {
          }
          CFIndex v175 = 0;
          v176 = "[originalFetchSet containsObject:[queryContext.fetchAttributes objectAtIndex:(NSUInteger)i]]";
          while (v175 < CFBitVectorGetCount(Mutable))
          {
            if (CFBitVectorGetBitAtIndex(Mutable, v175))
            {
              v177 = [v375 fetchAttributes];
              v178 = [v177 objectAtIndex:v175];
              if (([v161 containsObject:v178] & 1) == 0)
              {
                int v285 = 3284;
                goto LABEL_260;
              }
            }
            else
            {
              v177 = [v375 fetchAttributes];
              v178 = [v177 objectAtIndex:v175];
              if ([v161 containsObject:v178])
              {
                int v285 = 3286;
                v176 = "![originalFetchSet containsObject:[queryContext.fetchAttributes objectAtIndex:(NSUInteger)i]]";
LABEL_260:
                __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]", "SPCoreSpotlightDatastore.m", v285, v176);
              }
            }

            ++v175;
          }
          CFRelease(Mutable);
          if (!v354)
          {
            id v22 = 0;
LABEL_253:

            _Block_object_dispose(&v470, 8);
            goto LABEL_254;
          }
          objc_msgSend(v374, "setAllowAnonymousDataCollection:", objc_msgSend(v367, "allowAnonymousDataCollection"));
          [v375 setInternal:1];
          [v375 setLowPriority:0];
          char v179 = v349 + [v367 rankingBitCount] - 3;
          uint64_t v180 = -1 << v179;
          BOOL v181 = (v179 & 0x40) == 0;
          if ((v179 & 0x40) != 0) {
            uint64_t v182 = 0;
          }
          else {
            uint64_t v182 = -1 << v179;
          }
          unint64_t v183 = v180 | (0x7FFFFFFFFFFFFFFFuLL >> ~v179);
          if (v181) {
            unint64_t v184 = v183;
          }
          else {
            unint64_t v184 = v180;
          }
          v185 = SPLogForSPLogCategoryDefault();
          unint64_t v320 = v184;
          uint64_t v322 = v182;
          os_log_type_t v186 = 2 * (gSPLogDebugAsDefault == 0);
          if (os_log_type_enabled(v185, v186))
          {
            v187 = [v375 rankingQueries];
            unsigned int v188 = [v187 count];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v188;
            _os_log_impl((void *)&_mh_execute_header, v185, v186, "ranking queries count %d", buf, 8u);
          }
          v350 = +[NSMutableArray array];
          [v350 addObject:@"kMDItemDisableSearchInSpotlight!=1"];
          if ([v334 count]) {
            [v350 addObjectsFromArray:v334];
          }
          if ((*((unsigned char *)self + 8) & 4) != 0) {
            CFStringRef v189 = @"!(kMDItemContentRating=1 && (_kMDItemBundleID=com.apple.mobileslideshow || _kMDItemBundleID=com.apple.MobileSMS))";
          }
          else {
            CFStringRef v189 = @"(kMDItemContentRating!=1)";
          }
          [v350 addObject:v189];
          char v190 = *((unsigned char *)self + 8);
          if ((v190 & 8) == 0)
          {
            v191 = +[NSString stringWithFormat:@"(%@ != \"%@\")", MDItemMediaTypes, CSMediaTypeMusicVideo];
            [v350 addObject:v191];

            char v190 = *((unsigned char *)self + 8);
          }
          if ((v190 & 0x10) == 0) {
            [v350 addObject:@"(!(_kMDItemBundleID=com.apple.iBooks && kMDItemGenre=Erotica))"];
          }
          if ([v374 parsecAvailable]) {
            [v350 addObject:@"(!(_kMDItemBundleID=com.apple.Maps))"];
          }
          v192 = [v374 queryContext];
          BOOL v193 = [v192 deviceAuthenticationState] == 0;

          if (!v193)
          {
            v492[0] = SPApplicationBundleIdGeneralApplication;
            v492[1] = SPApplicationBundleIdGeneralAppClips;
            v492[2] = PRSRankingShortcutsBundleString;
            v194 = +[NSArray arrayWithObjects:v492 count:3];
            [v375 setBundleIDs:v194];

            NSFileProtectionType v491 = NSFileProtectionCompleteUntilFirstUserAuthentication;
            v195 = +[NSArray arrayWithObjects:&v491 count:1];
            [v375 setProtectionClasses:v195];

LABEL_196:
            [v350 addObject:@"(_kMDItemUserActivityType != \"com.apple.stocks.v2.ForYouFeed\" && _kMDItemUserActivityType != \"com.apple.stocks.v2.SymbolFeed\""];
            v204 = +[SPCoreSpotlightIndexer sharedInstance];
            char v205 = objc_opt_respondsToSelector();

            if (v205)
            {
              v206 = +[SPCoreSpotlightIndexer sharedInstance];
              v204 = [v206 fileProviderDomainFilterQueries];

              if (v204) {
                [v350 addObjectsFromArray:v204];
              }
            }
            [v350 addObject:@"(kMDItemIsTrashed!=1)"];
            if ([v350 count])
            {
              v207 = [v375 filterQueries];
              if (v207)
              {
                v204 = [v375 filterQueries];
                v208 = [v204 arrayByAddingObjectsFromArray:v350];
              }
              else
              {
                v208 = v350;
              }
              [v375 setFilterQueries:v208];
              if (v207)
              {
              }
            }
            [v350 addObject:@"(_kMDItemUserActivityType != \"com.apple.stocks.v2.ForYouFeed\" && _kMDItemUserActivityType != \"com.apple.stocks.v2.SymbolFeed\""];
            v209 = [v374 disabledBundles];
            if ([v209 count])
            {
              id v210 = [v209 arrayByAddingObjectsFromArray:qword_1000A8F88];
            }
            else
            {
              id v210 = (id)qword_1000A8F88;
            }
            v211 = v210;

            uint64_t v212 = PRSRankingPeopleFindMyBundleString;
            unsigned int v213 = [v211 containsObject:PRSRankingPeopleFindMyBundleString];
            uint64_t v214 = PRSRankingFindMyBundleString;
            unsigned int v215 = [v211 containsObject:PRSRankingFindMyBundleString];
            if (((v213 ^ 1 | v215) & 1) == 0 || (uint64_t v214 = v212, ((v213 | v215 ^ 1) & 1) == 0))
            {
              uint64_t v216 = [v211 arrayByAddingObject:v214];

              v211 = (void *)v216;
            }
            if ([v211 containsObject:PRSRankingContactsBundleString])
            {
              uint64_t v217 = PRSRankingPersonBundleString;
              if (([v211 containsObject:PRSRankingPersonBundleString] & 1) == 0)
              {
                uint64_t v218 = [v211 arrayByAddingObject:v217];

                v211 = (void *)v218;
              }
            }
            v219 = [v375 disableBundles];
            v220 = [v219 arrayByAddingObjectsFromArray:v211];
            [v375 setDisableBundles:v220];
            v324 = v211;

            v330 = [v374 disabledApps];
            if ([v330 count])
            {
              id v327 = +[NSSet setWithArray:v330];
            }
            else
            {
              id v327 = 0;
            }
            v221 = [v375 bundleIDs];
            BOOL v222 = [v221 count] == 0;

            if (v222)
            {
              [v375 setPommes:1];
            }
            else
            {
              if (v342) {
                +[SDPommesFeature allBundleIDsUsingPommesRankingSearchTool];
              }
              else {
              v223 = +[SDPommesFeature allBundleIDsUsingPommesRanking];
              }
              v224 = +[NSSet setWithArray:v223];

              v225 = [v375 bundleIDs];
              v226 = +[NSSet setWithArray:v225];

              objc_msgSend(v375, "setPommes:", objc_msgSend(v224, "intersectsSet:", v226));
            }
            v227 = [v374 queryContext];
            unsigned int v228 = [v227 hasMarkedText];

            if (v228)
            {
              v229 = [v374 queryContext];
              v230 = [v229 markedTextArray];
              [v375 setMarkedTextArray:v230];
            }
            if ([v374 cancelled])
            {
              id v22 = 0;
            }
            else
            {
              v231 = SPLogForSPLogCategoryQuery();
              os_log_type_t v232 = 2 * (gSPLogDebugAsDefault == 0);
              if (os_log_type_enabled(v231, v232))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v354;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v324;
                _os_log_impl((void *)&_mh_execute_header, v231, v232, "Starting query:%@, disabledBundleIds:%@", buf, 0x16u);
              }

              v325 = [(SPCoreSpotlightDatastore *)self coreSpotlightQueryTaskWithQuery:v374 reuseTask:v365];
              v233 = [v375 rankingQueries];
              v234 = [v325 rankingInfo];
              [v234 setRankingQueries:v233];

              long long v464 = 0u;
              long long v465 = 0u;
              long long v462 = 0u;
              long long v463 = 0u;
              v235 = [v375 rankingQueries];
              id v236 = [v235 countByEnumeratingWithState:&v462 objects:v490 count:16];
              if (v236)
              {
                uint64_t v237 = *(void *)v463;
                do
                {
                  for (uint64_t j = 0; j != v236; uint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v463 != v237) {
                      objc_enumerationMutation(v235);
                    }
                    v239 = *(void **)(*((void *)&v462 + 1) + 8 * (void)j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v240 = [v239 objectForKey:@"kCIBitCount"];
                        [v240 integerValue];
                      }
                    }
                  }
                  id v236 = [v235 countByEnumeratingWithState:&v462 objects:v490 count:16];
                }
                while (v236);
              }

              v241 = [v374 queryContext];
              v242 = [v241 searchEntities];
              v243 = [v325 rankingInfo];
              [v243 setDisableResultTruncation:v242 == 0];

              [v325 beginQuery:v374];
              v461[0] = 0;
              v461[1] = v461;
              v461[2] = 0x2020000000;
              v461[3] = 0;
              v343 = objc_opt_new();
              LOBYTE(v241) = [v374 isPhotosSearch];
              uint64_t v244 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSSectionIdentifierSyndicatedLinks andAddToMap:v343];
              v245 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSSectionIdentifierSyndicatedPhotos andAddToMap:v343];
              [(id)objc_opt_class() setButtonOnPhotosInAppSection:v245 withQuery:v374 queryString:v354 queryParams:v361];
              [v245 setDoNotFold:0];
              v314 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSSectionIdentifierSyndicatedPhotosMessages andAddToMap:v343];
              v312 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSSectionIdentifierSyndicatedPhotosNotes andAddToMap:v343];
              v311 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSSectionIdentifierSyndicatedPhotosFiles andAddToMap:v343];
              v310 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSSectionIdentifierSyndicatedPhotosFromPhotos andAddToMap:v343];
              v246 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSContactsBundleIdentifier andAddToMap:v343];
              [v246 setDoNotFold:0];
              v309 = v246;
              v308 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSPeopleBundleIdentifier andAddToMap:v343];
              v307 = [(id)objc_opt_class() sectionWithBundleIdentifier:SSPhotosBundleIdentifier andAddToMap:v343];
              v247 = [v375 fetchAttributes];
              v248 = (char *)[v247 count];
              v304 = v245;
              v305 = (void *)v244;
              char v306 = (char)v241;
              v302 = objc_opt_new();
              id v249 = objc_alloc_init((Class)NSMutableIndexSet);
              if (v248)
              {
                for (k = 0; k != v248; ++k)
                {
                  v251 = [v367 requiredAttributes];
                  v252 = [v247 objectAtIndexedSubscript:k];
                  unsigned int v253 = [v251 containsObject:v252];

                  if (v253) {
                    [v249 addIndex:k];
                  }
                }
              }
              v459[0] = 0;
              v459[1] = v459;
              v459[2] = 0x2020000000;
              char v460 = 0;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              v495 = sub_10003E634;
              *(void *)v496 = sub_10003E644;
              *(void *)&v496[8] = 0;
              *(void *)&v496[8] = objc_opt_new();
              v254 = [v374 queryContext];
              v319 = +[SSSuggestionResultBuilder buildResultsWithSuggestionsData:v333 queryContext:v254];

              [*(id *)(*(void *)&buf[8] + 40) addObjectsFromArray:v319];
              id v299 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:66307 valueOptions:0 capacity:256];
              id v255 = [objc_alloc((Class)NSPointerFunctions) initWithOptions:258];
              [v255 setAcquireFunction:0];
              [v255 setRelinquishFunction:sub_10003E64C];
              id v256 = objc_alloc((Class)NSMapTable);
              id v257 = [objc_alloc((Class)NSPointerFunctions) initWithOptions:66307];
              id v296 = [v256 initWithKeyPointerFunctions:v257 valuePointerFunctions:v255 capacity:256];
              v318 = v255;

              id v258 = objc_alloc((Class)NSMapTable);
              id v259 = [objc_alloc((Class)NSPointerFunctions) initWithOptions:66307];
              id v260 = [v258 initWithKeyPointerFunctions:v259 valuePointerFunctions:v255 capacity:256];

              id v261 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.feature.extraction", 0, objc_msgSend(v375, "queryID"));
              id v294 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.indomain.score.computation", 0, objc_msgSend(v375, "queryID"));
              v295 = v261;
              v458[0] = 0;
              v458[1] = v458;
              v458[2] = 0x2020000000;
              v458[3] = 0;
              long long v262 = *(_OWORD *)(v373 + 16);
              long long v455 = *(_OWORD *)v373;
              long long v456 = v262;
              uint64_t v457 = *(void *)(v373 + 32);
              uint64_t v449 = 0;
              v450 = &v449;
              uint64_t v451 = 0x3032000000;
              v452 = sub_10003E650;
              v453 = sub_10003E67C;
              id v454 = 0;
              v440[0] = _NSConcreteStackBlock;
              v440[1] = 3221225472;
              v440[2] = sub_10003E684;
              v440[3] = &unk_100093498;
              uint64_t v448 = v457;
              long long v447 = v262;
              long long v446 = v455;
              id val = v374;
              id v441 = val;
              id v263 = v325;
              id v442 = v263;
              v443 = &v449;
              v444 = v459;
              v445 = buf;
              id v316 = [v440 copy];
              v430[0] = _NSConcreteStackBlock;
              v430[1] = 3221225472;
              v430[2] = sub_10003EEAC;
              v430[3] = &unk_1000934C0;
              long long v435 = v455;
              long long v436 = v456;
              uint64_t v437 = v457;
              uint64_t v438 = v27;
              v439 = v351;
              id v300 = v299;
              id v431 = v300;
              v434 = &v470;
              id v264 = v296;
              id v432 = v264;
              id v265 = v260;
              id v433 = v265;
              v326 = objc_retainBlock(v430);
              id v352 = v263;
              os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F98);
              id v297 = [(NSDictionary *)self->_renderEngagementCounts copy];
              os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F98);
              id location = 0;
              objc_initWeak(&location, val);
              id from = 0;
              objc_initWeak(&from, v263);
              *(void *)v484 = 0;
              v485 = v484;
              uint64_t v486 = 0x3032000000;
              v487 = sub_10003E634;
              v488 = sub_10003E644;
              id v489 = 0;
              v266 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
              v267 = dispatch_queue_attr_make_with_overcommit();
              qos_class_t v268 = qos_class_self();
              v269 = dispatch_queue_attr_make_with_qos_class(v267, v268, 0);
              dispatch_queue_t v270 = dispatch_queue_create("result processing", v269);

              v383[0] = _NSConcreteStackBlock;
              v383[1] = 3221225472;
              v383[2] = sub_1000404B0;
              v383[3] = &unk_1000935D8;
              long long v417 = v455;
              long long v418 = v456;
              uint64_t v419 = v457;
              objc_copyWeak(&v415, &location);
              objc_copyWeak(&v416, &from);
              v293 = v270;
              v384 = v293;
              id v290 = v300;
              id v385 = v290;
              id v291 = v264;
              id v386 = v291;
              id v292 = v265;
              id v387 = v292;
              id v388 = v368;
              id v389 = v327;
              v409 = v484;
              v420 = v248;
              id v289 = v249;
              id v390 = v289;
              id v271 = v375;
              id v391 = v271;
              id v392 = v355;
              id v301 = v297;
              id v393 = v301;
              id v288 = v343;
              id v394 = v288;
              id v344 = v302;
              id v395 = v344;
              v410 = v461;
              id v298 = v314;
              id v396 = v298;
              id v303 = v312;
              id v397 = v303;
              id v313 = v311;
              id v398 = v313;
              id v272 = v307;
              uint64_t v421 = v369;
              v411 = v459;
              id v315 = v272;
              id v399 = v272;
              v400 = self;
              BOOL v423 = v362;
              unsigned __int8 v424 = v328;
              id v273 = v354;
              id v401 = v273;
              BOOL v425 = a4;
              char v426 = v306;
              BOOL v427 = v359;
              v383[5] = v320;
              v383[4] = v322;
              id v357 = v309;
              id v402 = v357;
              id v360 = v308;
              id v403 = v360;
              id v321 = v305;
              id v404 = v321;
              id v323 = v304;
              id v405 = v323;
              id v329 = v310;
              id v406 = v329;
              v412 = buf;
              v413 = v458;
              v414 = v477;
              id v370 = v294;
              id v407 = v370;
              id v363 = v295;
              id v408 = v363;
              uint64_t v422 = v27;
              v274 = objc_retainBlock(v383);
              v275 = (void *)v450[5];
              v450[5] = (uint64_t)v274;

              id v382 = 0;
              objc_initWeak(&v382, self);
              v276 = +[SPCoreSpotlightIndexer sharedInstance];
              v376[0] = _NSConcreteStackBlock;
              v376[1] = 3221225472;
              v376[2] = sub_100044D58;
              v376[3] = &unk_100093600;
              objc_copyWeak(&v377, &v382);
              objc_copyWeak(&v378, &from);
              long long v379 = v455;
              long long v380 = v456;
              uint64_t v381 = v457;
              v376[4] = &v449;
              v277 = [v276 taskForTopHitQueryWithQueryString:v273 queryContext:v271 eventHandler:v326 resultsHandler:v316 completionHandler:v376];
              [v352 setJob:v277];

              objc_destroyWeak(&v378);
              objc_destroyWeak(&v377);
              objc_destroyWeak(&v382);

              objc_destroyWeak(&v416);
              objc_destroyWeak(&v415);

              _Block_object_dispose(v484, 8);
              objc_destroyWeak(&from);
              objc_destroyWeak(&location);
              if ([val cancelled])
              {
                id v22 = 0;
              }
              else
              {
                v278 = SPLogForSPLogCategoryDefault();
                os_log_type_t v279 = 2 * (gSPLogDebugAsDefault == 0);
                if (os_log_type_enabled(v278, v279))
                {
                  qos_class_t v280 = qos_class_self();
                  *(_DWORD *)v484 = 67109120;
                  *(_DWORD *)&v484[4] = v280;
                  _os_log_impl((void *)&_mh_execute_header, v278, v279, "QOS pre startQueryTask: %d", v484, 8u);
                }

                v281 = +[SPCoreSpotlightIndexer sharedInstance];
                v282 = [v352 job];
                [v281 startQueryTask:v282];

                id v22 = v352;
              }

              _Block_object_dispose(&v449, 8);
              _Block_object_dispose(v458, 8);

              _Block_object_dispose(buf, 8);
              _Block_object_dispose(v459, 8);

              _Block_object_dispose(v461, 8);
            }

            goto LABEL_253;
          }
          maxMovieRating = self->_maxMovieRating;
          if (maxMovieRating && [(NSNumber *)maxMovieRating intValue] <= 999)
          {
            uint64_t v197 = [(NSNumber *)self->_maxMovieRating intValue];
            v198 = +[NSString stringWithFormat:@"(%@!=\"%@\" || %@<=%d)", MDItemMediaTypes, CSMediaTypeMovie, MDItemExtendedContentRating, v197];
            [v350 addObject:v198];
          }
          maxTVShowRating = self->_maxTVShowRating;
          if (maxTVShowRating && [(NSNumber *)maxTVShowRating intValue] <= 999)
          {
            uint64_t v200 = [(NSNumber *)self->_maxTVShowRating intValue];
            v201 = +[NSString stringWithFormat:@"(%@!=\"%@\" || %@<=%d)", MDItemMediaTypes, CSMediaTypeTVShow, MDItemExtendedContentRating, v200];
            [v350 addObject:v201];
          }
          id v202 = [v374 contentFilters];
          if (!v202) {
            goto LABEL_196;
          }
          if (v202)
          {
            if ((v202 & 2) != 0) {
              CFStringRef v203 = @"(kMDItemIsLocal=1 || _kMDItemBundleID!=com.apple.Music || _kMDItemBundleID!=com.apple.videos)";
            }
            else {
              CFStringRef v203 = @"(kMDItemIsLocal=1 || _kMDItemBundleID!=com.apple.Music)";
            }
          }
          else
          {
            if ((v202 & 2) == 0) {
              goto LABEL_196;
            }
            CFStringRef v203 = @"(kMDItemIsLocal=1 || _kMDItemBundleID!=com.apple.videos)";
          }
          [v350 addObject:v203];
          goto LABEL_196;
        }
        char v91 = *((unsigned char *)self + 8);
      }
      BOOL v92 = (v91 & 2) == 0 && (unint64_t)[v337 length] <= v90;
      goto LABEL_94;
    }
    if (([v76 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v76 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
LABEL_58:
      int v77 = 1;
    }
    else
    {
      unsigned int v93 = [v76 hasPrefix:@"com.apple.ondeviceeval"];
      if (v74 == (id)12) {
        int v77 = 1;
      }
      else {
        int v77 = v93;
      }
    }
    unsigned int v342 = v77;
    goto LABEL_60;
  }
  id v22 = 0;
LABEL_254:

LABEL_255:
  _Block_object_dispose(v477, 8);
LABEL_256:

  si_tracing_log_span_end();
  long long v283 = v482;
  *(_OWORD *)uint64_t v373 = v481;
  *(_OWORD *)(v373 + 16) = v283;
  *(void *)(v373 + 32) = v483;

  return v22;
}

+ (void)modifyBatchSize:(unint64_t *)a3 batchIncrement:(unint64_t *)a4 batches:(unint64_t *)a5 withSectionsCount:(unint64_t)a6
{
  if (qword_1000A9010 != -1) {
    dispatch_once(&qword_1000A9010, &stru_100093620);
  }
  unint64_t v10 = a6 / 7;
  unint64_t v11 = a6 % 7 != 0;
  if (a6 % 7) {
    ++v10;
  }
  if (v10 % dword_1000A9008)
  {
    unint64_t v12 = 6;
    unint64_t v13 = 4;
    while (1)
    {
      unint64_t v10 = a6 / v12;
      unint64_t v11 = a6 % v12 != 0;
      if (a6 % v12) {
        ++v10;
      }
      if (v12 <= 4) {
        break;
      }
      --v12;
      if (!(v10 % dword_1000A9008))
      {
        unint64_t v13 = v12 + 1;
        break;
      }
    }
  }
  else
  {
    unint64_t v13 = 7;
  }
  *a3 = v13;
  *a4 = v11;
  *a5 = v10;
}

+ (id)sectionWithBundleIdentifier:(id)a3 andAddToMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:v5];
  }
  else
  {
    uint64_t v8 = +[SFMutableResultSection mutableSectionWithBundleId:v5];
    [v8 setDomain:1];
    [v8 setDoNotFold:1];
    [v6 setObject:v8 forKey:v5];
  }

  return v8;
}

+ (void)setButtonOnPhotosInAppSection:(id)a3 withQuery:(id)a4 queryString:(id)a5 queryParams:(id)a6
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 queryContext];
  unint64_t v10 = [v9 searchEntities];
  unint64_t v11 = [v10 lastObject];

  if (v11)
  {
    unint64_t v12 = [v11 currentSearchString];
  }
  else
  {
    unint64_t v13 = [v7 queryContext];
    unint64_t v12 = [v13 searchString];
  }
  if (!v12) {
    unint64_t v12 = &stru_100094088;
  }
  if (([v7 isPeopleSearch] & 1) == 0)
  {
    CFStringRef v26 = @"kMDQueryOptionContextIdentifier";
    uint64_t v14 = [v7 connection];
    uint64_t v15 = [v14 bundleID];
    os_log_type_t v16 = (void *)v15;
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    else {
      CFStringRef v17 = &stru_100094088;
    }
    CFStringRef v27 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    uint64_t v19 = SSQueryParserStripKindFromString();

    unint64_t v12 = (__CFString *)v19;
  }
  uint64_t v20 = +[SPSearchEntity searchEntityWithPhotosSearchString:v12 fromSuggestion:0];
  id v21 = [v20 command];
  id v22 = objc_opt_new();
  [v22 setSymbolName:@"chevron.forward"];
  uint64_t v23 = objc_opt_new();
  unsigned int v24 = +[NSBundle bundleForClass:objc_opt_class()];
  __uint64_t v25 = [v24 localizedStringForKey:@"SHOW_MORE" value:&stru_100094088 table:@"SpotlightServices"];
  [v23 setTitle:v25];

  [v23 setImage:v22];
  [v23 setCommand:v21];
  [v8 setButton:v23];
}

+ (id)removedDuplicatePhotosSectionsFromSections:(id)a3 isPhotosScopedSearch:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    goto LABEL_15;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  id v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v34;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v6);
      }
      unint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      unint64_t v13 = (void *)qword_1000A8F20;
      uint64_t v14 = [v12 bundleIdentifier];
      if ([v13 containsObject:v14])
      {
        uint64_t v15 = [v12 results];
        id v16 = [v15 count];

        if (v16) {
          ++v9;
        }
      }
      else
      {
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  }
  while (v8);
  if (v9 == 1) {
LABEL_15:
  }
    CFStringRef v17 = &qword_1000A8F18;
  else {
LABEL_16:
  }
    CFStringRef v17 = &qword_1000A8F20;
  id v18 = (id)*v17;
  id v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = v6;
  id v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v22; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        __uint64_t v25 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
        CFStringRef v26 = objc_msgSend(v25, "bundleIdentifier", (void)v29);
        unsigned __int8 v27 = [v18 containsObject:v26];

        if ((v27 & 1) == 0) {
          [v19 addObject:v25];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v22);
  }

  return v19;
}

- (void)performQueryRewriteForQuery:(id)a3 withCorrection:(id)a4 task:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 cancelled] & 1) == 0)
  {
    unint64_t v11 = [v8 correctedQueryWithCorrection:v9];
    unint64_t v12 = SPLogForSPLogCategoryQuery();
    os_log_type_t v13 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v12, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      uint64_t v14 = [v8 queryContext];
      uint64_t v15 = [v14 searchString];
      int v17 = 138412546;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "CoreSpotlight performing rewriting query %@ with correction %@", (uint8_t *)&v17, 0x16u);
    }
    id v16 = [(SPCoreSpotlightDatastore *)self performQuery:v11 isCorrectedQuery:1 reuseTask:v10 needsFuzzy:1 pommesRewrite:0 embeddingsRequery:0];
  }
}

- (unsigned)domain
{
  return 1;
}

+ (id)_makeUniqueFetchAttributesWithAttributes:(id)a3 extraAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v5, "count") + (void)objc_msgSend(v6, "count"));
  id v8 = +[NSMutableSet setWithArray:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = (id)qword_1000A8F78;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v14, (void)v17) & 1) != 0
          || [v6 containsObject:v14])
        {
          [v7 addObject:v14];
          [v8 removeObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    uint64_t v15 = [v8 allObjects];
    [v7 addObjectsFromArray:v15];
  }

  return v7;
}

+ (BOOL)_isKeyboardCJK:(id)a3
{
  uint64_t v3 = [a3 lowercaseString];
  if (([v3 hasPrefix:@"ja"] & 1) != 0
    || ([v3 hasPrefix:@"zh"] & 1) != 0
    || ([v3 hasPrefix:@"ko"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 hasPrefix:@"yue"];
  }

  return v4;
}

- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 resultsHandler:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v168 = a5;
  id v166 = a6;
  uint64_t v380 = 0;
  uint64_t v381 = &v380;
  uint64_t v382 = 0x3032000000;
  v383 = sub_10003E634;
  v384 = sub_10003E644;
  id v385 = 0;
  id v164 = v9;
  id v385 = v164;
  if (!v381[5]) {
    __assert_rtn("-[SPCoreSpotlightDatastore taskForTopHitQueryWithQueryString:queryContext:resultsHandler:completionHandler:]", "SPCoreSpotlightDatastore.m", 4953, "queryString");
  }
  id v11 = [v10 maxCount];
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11) {
    uint64_t v12 = (uint64_t)v11;
  }
  unint64_t v172 = v12;
  if ((uint64_t)[v10 maxRankedResultCount] < 1)
  {
    uint64_t v14 = 100;
  }
  else
  {
    id v13 = [v10 maxRankedResultCount];
    uint64_t v14 = 100;
    if ((unint64_t)v13 < 0x64) {
      uint64_t v14 = (uint64_t)v13;
    }
  }
  unint64_t v178 = v14;
  v191 = v10;
  if ([v10 internal])
  {
    uint64_t v15 = [v10 bundleIDs];
    if ([v15 count] == (id)1) {
      [v15 firstObject];
    }
    else {
    v177 = [v10 clientBundleID];
    }
  }
  else
  {
    v177 = [v10 clientBundleID];
  }
  char v179 = [v10 userQuery];
  unsigned int v171 = [v177 isEqualToString:PRSRankingMailBundleString];
  if (v171)
  {
    id v16 = [v179 length];
    if ((unint64_t)v16 < 5)
    {
      uint64_t v17 = 20;
    }
    else if ((unint64_t)v16 <= 8)
    {
      if (v16 == (id)8)
      {
        uint64_t v17 = 50;
      }
      else
      {
        uint64_t v17 = 25;
        if ((unint64_t)v16 > 6) {
          uint64_t v17 = 40;
        }
      }
    }
    else
    {
      uint64_t v17 = 65;
    }
    unint64_t v178 = v17;
    if ([v10 generateSuggestions])
    {
      id v18 = [v179 length];
      uint64_t v19 = v178;
      if (!v18) {
        uint64_t v19 = 100;
      }
      unint64_t v178 = v19;
    }
  }
  v176 = [v10 keyboardLanguage];
  id obj = [v10 fetchAttributes];
  unsigned __int8 v175 = +[SDSearchQuery isCJK];
  unsigned __int8 v170 = +[SPCoreSpotlightDatastore _isKeyboardCJK:v176];
  id v20 = objc_alloc((Class)PRSRankingItemRanker);
  id v21 = [v10 queryID];
  [v10 currentTime];
  id v22 = objc_msgSend(v20, "initWithSearchString:queryID:language:currentTime:", v179, v21, v176);
  [v22 activate];
  v173 = v22;
  uint64_t v374 = 0;
  v375 = &v374;
  uint64_t v376 = 0x3032000000;
  id v377 = sub_10003E634;
  id v378 = sub_10003E644;
  id v379 = 0;
  if (v179 && [v10 parseUserQuery])
  {
    if ([v10 maxCount])
    {
      id v23 = [v10 maxCount];
      if ((unint64_t)v23 <= v178) {
        id v24 = (id)v178;
      }
      else {
        id v24 = v23;
      }
    }
    else
    {
      id v24 = 0;
    }
    [v10 setMaxCount:v24];
    [v10 setGrouped:v178 != 0];
    *(_WORD *)((char *)&v162 + 1) = [v10 disableNLP];
    LOBYTE(v162) = v175;
    uint64_t v26 = -[SPCoreSpotlightDatastore _topHitQueryParametersForSearchString:searchEntities:contextIdentifier:queryKind:needsFuzzy:checkForMath:isCJK:disableNLP:disableOCR:previousQueryKind:clientBundle:keyboardLanguage:queryID:](self, "_topHitQueryParametersForSearchString:searchEntities:contextIdentifier:queryKind:needsFuzzy:checkForMath:isCJK:disableNLP:disableOCR:previousQueryKind:clientBundle:keyboardLanguage:queryID:", v179, &__NSArray0__struct, v162, 11, v177, v176, [v10 queryID]);
    unsigned __int8 v27 = (void *)v375[5];
    v375[5] = v26;

    uint64_t v28 = [(id)v375[5] objectForKeyedSubscript:@"query"];
    id v29 = [v28 mutableCopy];

    if ([v29 length]
      && [(id)v381[5] length]
      && ([v29 isEqualToString:v381[5]] & 1) == 0)
    {
      objc_msgSend(v29, "appendString:", @"&&(");
      [v29 appendString:v381[5]];
      [v29 appendString:@""]);
      uint64_t v30 = +[NSString stringWithFormat:@"(%@)", v29];
      long long v31 = (void *)v381[5];
      v381[5] = v30;
    }
  }
  else
  {
    if (v172 <= v178) {
      unint64_t v25 = v178;
    }
    else {
      unint64_t v25 = v172;
    }
    [v10 setMaxCount:v25];
  }
  uint64_t v368 = 0;
  uint64_t v369 = &v368;
  uint64_t v370 = 0x3032000000;
  v371 = sub_10003E634;
  v372 = sub_10003E644;
  id v373 = 0;
  if (v171)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F80);
    id v32 = (id)qword_1000A8EF8;
    id v33 = (id)qword_1000A8F68;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F80);
    uint64_t v34 = qword_1000A8EE8;
    uint64_t v35 = qword_1000A8EF0;
    uint64_t v36 = v381[5];
    unsigned int v37 = [v10 keyboardLanguage];
    LOBYTE(v163) = 0;
    uint64_t v38 = objc_msgSend(v173, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", v34, v35, v32, v33, v177, 0, v36, v179, 0, 11, v163, v37, v164, v166, v168);
    unsigned __int8 v39 = (void *)v369[5];
    v369[5] = v38;
  }
  else
  {
    uint64_t v40 = v381[5];
    id v32 = [v10 keyboardLanguage];
    LOBYTE(v163) = 0;
    uint64_t v41 = objc_msgSend(v173, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", 0, 0, 0, 0, v177, 0, v40, v179, 0, 11, v163, v32, v164, v166, v168);
    id v33 = (id)v369[5];
    v369[5] = v41;
  }

  char v42 = [v191 completionString];

  if (v42)
  {
    id v43 = [(id)v369[5] fuzzyMatchMask];
    objc_msgSend(v191, "setFuzzyMask:", v43, v44);
    id v45 = [(id)v369[5] fuzzyMatchCheck];
    objc_msgSend(v191, "setFuzzyMatch:", v45, v46);
  }
  id v47 = [v191 bundleIDs];
  id v48 = [v47 count];

  if (v48)
  {
    id v49 = +[NSMutableString string];
    objc_msgSend(v49, "appendFormat:", @"FieldMatch(%@,"), MDItemBundleID;
    long long v367 = 0u;
    long long v366 = 0u;
    long long v365 = 0u;
    long long v364 = 0u;
    v50 = [v191 bundleIDs];
    id v51 = [v50 countByEnumeratingWithState:&v364 objects:v394 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v365;
      do
      {
        for (i = 0; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v365 != v52) {
            objc_enumerationMutation(v50);
          }
          [v49 appendFormat:@"%@,", *(void *)(*((void *)&v364 + 1) + 8 * i)];
        }
        id v51 = [v50 countByEnumeratingWithState:&v364 objects:v394 count:16];
      }
      while (v51);
    }

    id v54 = objc_msgSend(v49, "substringToIndex:", (char *)objc_msgSend(v49, "length") - 1);
    id v55 = [v54 mutableCopy];

    [v55 appendString:@""]);
    unint64_t v56 = +[NSMutableArray arrayWithObject:v55];
    unint64_t v57 = [(id)v375[5] objectForKeyedSubscript:@"filterQueries"];
    if ([v57 count]) {
      [v56 addObjectsFromArray:v57];
    }
    BOOL v58 = [v191 filterQueries];
    BOOL v59 = v58 == 0;

    if (v59)
    {
      [v191 setFilterQueries:v56];
    }
    else
    {
      unsigned __int8 v60 = [v191 filterQueries];
      id v61 = [v60 arrayByAddingObjectsFromArray:v56];
      [v191 setFilterQueries:v61];
    }
  }
  uint64_t v358 = 0;
  BOOL v359 = &v358;
  uint64_t v360 = 0x3032000000;
  v361 = sub_10003E634;
  BOOL v362 = sub_10003E644;
  id v363 = 0;
  id v363 = [(id)v369[5] rankingQueries];
  unsigned __int8 v62 = (void *)v375[5];
  id v63 = v191;
  if (v62)
  {
    BOOL v64 = [v62 objectForKeyedSubscript:@"queryTerms"];
    uint64_t v65 = [(id)v375[5] objectForKeyedSubscript:@"rankCategories"];
    [(id)v359[5] count];
    id v66 = [(id)v375[5] objectForKeyedSubscript:@"isNLQuery"];
    id v67 = [v66 BOOLValue];

    if (v67)
    {
      if (v64)
      {
        id v68 = PRSRankingItemRankerAddJunkFilter();
        uint64_t v69 = [(SPCoreSpotlightDatastore *)self rankingQueriesAddingQueryTerms:v68 rankingQueries:v359[5]];
        unint64_t v70 = (void *)v359[5];
        v359[5] = v69;
      }
      if (v65)
      {
        id v71 = [v65 keysSortedByValueUsingSelector:"compare:"];
        [v173 setRankCategories:v71];
      }
      [v173 setIsNLSearch:1];
    }
    [(id)v359[5] count];

    id v63 = v191;
  }
  else
  {
    id v67 = 0;
  }
  [v63 setParseUserQuery:v67];
  [v63 setRankingQueries:v359[5]];
  objc_msgSend(v63, "setStrongRankingQueryCount:", objc_msgSend((id)v369[5], "strongRankingQueryCount"));
  objc_msgSend(v63, "setDominantRankingQueryCount:", objc_msgSend((id)v369[5], "dominantRankingQueryCount"));
  objc_msgSend(v63, "setDominatedRankingQueryCount:", objc_msgSend((id)v369[5], "dominatedRankingQueryCount"));
  objc_msgSend(v63, "setShortcutBit:", objc_msgSend((id)v369[5], "shortcutBit"));
  objc_msgSend(v63, "setHighMatchBit:", objc_msgSend((id)v369[5], "highMatchBit"));
  objc_msgSend(v63, "setLowMatchBit:", objc_msgSend((id)v369[5], "lowMatchBit"));
  objc_msgSend(v63, "setHighRecencyBit:", objc_msgSend((id)v369[5], "highRecencyBit"));
  objc_msgSend(v63, "setLowRecencyBit:", objc_msgSend((id)v369[5], "lowRecencyBit"));
  uint64_t v352 = 0;
  v353 = &v352;
  uint64_t v354 = 0x3032000000;
  v355 = sub_10003E634;
  v356 = sub_10003E644;
  id v357 = 0;
  id v72 = [(id)v369[5] requiredAttributes];
  id v357 = [v72 array];

  unsigned int v73 = [v191 bundleIDs];
  if ([v73 count] == (id)1)
  {
    id v74 = [v191 bundleIDs];
    id v75 = [v74 objectAtIndexedSubscript:0];
    int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

    if (!IsSyndicatedPhotos) {
      goto LABEL_74;
    }
    uint64_t v77 = +[SSPommesPhotosRanker PhotosRankingRequiredAttributes];
    unsigned int v73 = (void *)v353[5];
    v353[5] = v77;
  }

LABEL_74:
  unsigned int v78 = [v191 fetchAttributes];
  unsigned int v79 = [v78 count];

  int v80 = [v191 fetchAttributes];
  char v190 = +[NSSet setWithArray:v80];

  long long v81 = objc_opt_class();
  uint64_t v82 = [v191 fetchAttributes];
  int v83 = [v81 _makeUniqueFetchAttributesWithAttributes:v82 extraAttributes:v353[5]];
  [v191 setFetchAttributes:v83];

  int v84 = [v191 fetchAttributes];
  objc_msgSend(v191, "setTopHitExtraFetchAttributeCount:", (unsigned char *)objc_msgSend(v84, "count") - v79);

  id v85 = [v191 fetchAttributes];
  id v86 = [v85 count];

  Mutable = CFBitVectorCreateMutable(kCFAllocatorDefault, (CFIndex)v86);
  CFBitVectorSetCount(Mutable, (CFIndex)v86);
  long long v351 = 0u;
  long long v350 = 0u;
  long long v349 = 0u;
  long long v348 = 0u;
  long long v88 = [v191 fetchAttributes];
  id v89 = [v88 countByEnumeratingWithState:&v348 objects:v393 count:16];
  if (v89)
  {
    uint64_t v90 = 0;
    uint64_t v91 = *(void *)v349;
    do
    {
      for (uint64_t j = 0; j != v89; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v349 != v91) {
          objc_enumerationMutation(v88);
        }
        unsigned int v93 = *(void **)(*((void *)&v348 + 1) + 8 * (void)j);
        id v94 = [v191 fetchAttributes];
        if (objc_claimAutoreleasedReturnValue() ! = [v94 objectAtIndex:(char *)j + v90]; {
          __assert_rtn("-[SPCoreSpotlightDatastore taskForTopHitQueryWithQueryString:queryContext:resultsHandler:completionHandler:]", "SPCoreSpotlightDatastore.m", 5147, "[queryContext.fetchAttributes objectAtIndex:(NSUInteger)bvi] == s");
        }

        if ([v190 containsObject:v93]) {
          CFBitVectorSetBitAtIndex(Mutable, (CFIndex)j + v90, 1u);
        }
      }
      id v89 = [v88 countByEnumeratingWithState:&v348 objects:v393 count:16];
      v90 += (uint64_t)j;
    }
    while (v89);

    [v191 setNonTopHitFetchAttributeIndexesBits:Mutable];
  }
  else
  {
  }
  CFIndex v95 = 0;
  id v96 = "[originalFetchSet containsObject:[queryContext.fetchAttributes objectAtIndex:(NSUInteger)i]]";
  while (v95 < CFBitVectorGetCount(Mutable))
  {
    if (CFBitVectorGetBitAtIndex(Mutable, v95))
    {
      uint64_t v97 = [v191 fetchAttributes];
      long long v98 = [v97 objectAtIndex:v95];
      if (([v190 containsObject:v98] & 1) == 0)
      {
        int v161 = 5159;
        goto LABEL_139;
      }
    }
    else
    {
      uint64_t v97 = [v191 fetchAttributes];
      long long v98 = [v97 objectAtIndex:v95];
      if ([v190 containsObject:v98])
      {
        int v161 = 5161;
        id v96 = "![originalFetchSet containsObject:[queryContext.fetchAttributes objectAtIndex:(NSUInteger)i]]";
LABEL_139:
        __assert_rtn("-[SPCoreSpotlightDatastore taskForTopHitQueryWithQueryString:queryContext:resultsHandler:completionHandler:]", "SPCoreSpotlightDatastore.m", v161, v96);
      }
    }

    ++v95;
  }
  CFRelease(Mutable);
  uint64_t v342 = 0;
  v343 = &v342;
  uint64_t v344 = 0x3032000000;
  v345 = sub_10003E634;
  id v346 = sub_10003E644;
  id v347 = 0;
  id v347 = [v191 fetchAttributes];
  uint64_t v338 = 0;
  v339 = &v338;
  uint64_t v340 = 0x2020000000;
  id v341 = 0;
  id v341 = [(id)v343[5] count];
  v336[0] = 0;
  v336[1] = v336;
  v336[2] = 0x3032000000;
  v336[3] = sub_10003E634;
  v336[4] = sub_10003E644;
  id v337 = 0;
  id v337 = (id)objc_opt_new();
  v334[0] = 0;
  v334[1] = v334;
  v334[2] = 0x3032000000;
  v334[3] = sub_10003E634;
  v334[4] = sub_10003E644;
  id v335 = 0;
  id v335 = (id)objc_opt_new();
  uint64_t v328 = 0;
  id v329 = &v328;
  uint64_t v330 = 0x3032000000;
  v331 = sub_10003E634;
  v332 = sub_10003E644;
  id v333 = 0;
  id v99 = objc_alloc((Class)NSMutableData);
  id v333 = [v99 initWithLength:((unint64_t)(8 * v339[3] + 504) >> 6) + 8];
  uint64_t v324 = 0;
  v325 = &v324;
  uint64_t v326 = 0x2020000000;
  id v327 = 0;
  id v327 = [ (id) v329[5] mutableBytes];
  long long v100 = (void *)v325[3];
  uint64_t v101 = v339[3];
  *long long v100 = v101;
  bzero(v100 + 1, (unint64_t)(8 * v101 + 504) >> 6);
  uint64_t v320 = 0;
  id v321 = &v320;
  uint64_t v322 = 0x2020000000;
  uint64_t v323 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v316 = 0;
  v317 = &v316;
  uint64_t v318 = 0x2020000000;
  uint64_t v319 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v312 = 0;
  id v313 = &v312;
  uint64_t v314 = 0x2020000000;
  uint64_t v315 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v308 = 0;
  v309 = &v308;
  uint64_t v310 = 0x2020000000;
  uint64_t v311 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v304 = 0;
  v305 = &v304;
  uint64_t v306 = 0x2020000000;
  uint64_t v307 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v300 = 0;
  id v301 = &v300;
  uint64_t v302 = 0x2020000000;
  uint64_t v303 = 0x7FFFFFFFFFFFFFFFLL;
  if (v339[3])
  {
    unint64_t v102 = 0;
    uint64_t v103 = MDItemContentCreationDate;
    uint64_t v104 = MDItemBundleID;
    uint64_t v185 = MDMailConversationID;
    uint64_t v182 = MDQueryResultScoreL1;
    while (1)
    {
      uint64_t v105 = [(id)v369[5] requiredAttributes];
      id v106 = [(id)v343[5] objectAtIndexedSubscript:v102];
      unsigned int v107 = [v105 containsObject:v106];

      if (v107)
      {
        long long v108 = (unint64_t *)v325[3];
        if (*v108 > v102) {
          v108[(v102 >> 6) + 1] |= 1 << v102;
        }
      }
      long long v109 = [(id)v343[5] objectAtIndexedSubscript:v102];
      unsigned int v110 = [v109 isEqualToString:v103];

      if (v110) {
        break;
      }
      long long v112 = [(id)v343[5] objectAtIndexedSubscript:v102];
      unsigned int v113 = [v112 isEqualToString:v104];

      if (v113)
      {
        long long v111 = v317;
        goto LABEL_110;
      }
      int v114 = [(id)v343[5] objectAtIndexedSubscript:v102];
      unsigned int v115 = [v114 isEqualToString:@"kMDQueryResultNewMatchedExtraQueriesField"];

      if (v115)
      {
        long long v111 = v313;
        goto LABEL_110;
      }
      id v116 = [(id)v343[5] objectAtIndexedSubscript:v102];
      unsigned int v117 = [v116 isEqualToString:@"_kMDItemExternalID"];

      if (v117)
      {
        long long v111 = v309;
        goto LABEL_110;
      }
      char v118 = [(id)v343[5] objectAtIndexedSubscript:v102];
      unsigned int v119 = [v118 isEqualToString:v185];

      if (v119)
      {
        long long v111 = v305;
        goto LABEL_110;
      }
      uint64_t v120 = [(id)v343[5] objectAtIndexedSubscript:v102];
      unsigned int v121 = [v120 isEqualToString:v182];

      if (v121)
      {
        long long v111 = v301;
        goto LABEL_110;
      }
LABEL_111:
      if (++v102 >= v339[3]) {
        goto LABEL_112;
      }
    }
    long long v111 = v321;
LABEL_110:
    v111[3] = v102;
    goto LABEL_111;
  }
LABEL_112:
  uint64_t v296 = 0;
  id v297 = &v296;
  uint64_t v298 = 0x2020000000;
  uint64_t v299 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v292 = 0;
  v293 = &v292;
  uint64_t v294 = 0x2020000000;
  uint64_t v295 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v288 = 0;
  id v289 = &v288;
  uint64_t v290 = 0x2020000000;
  uint64_t v291 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v282 = 0;
  long long v283 = &v282;
  uint64_t v284 = 0x3032000000;
  int v285 = sub_10003E634;
  uint64_t v286 = sub_10003E644;
  id v287 = 0;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [obj count]);
  id v287 = (id)objc_claimAutoreleasedReturnValue();
  v122 = +[NSOrderedSet orderedSetWithArray:v343[5]];
  long long v281 = 0u;
  long long v279 = 0u;
  long long v280 = 0u;
  long long v278 = 0u;
  id obja = obj;
  id v123 = [obja countByEnumeratingWithState:&v278 objects:v392 count:16];
  if (!v123) {
    goto LABEL_129;
  }
  uint64_t v124 = *(void *)v279;
  uint64_t v186 = MDQueryResultScoreL2;
  uint64_t v183 = MDQueryResultScoreL1;
  uint64_t v180 = MDItemPhotosL2Signals;
  do
  {
    for (k = 0; k != v123; k = (char *)k + 1)
    {
      if (*(void *)v279 != v124) {
        objc_enumerationMutation(obja);
      }
      id v126 = *(void **)(*((void *)&v278 + 1) + 8 * (void)k);
      id v127 = [v122 indexOfObject:v126];
      id v128 = (void *)v283[5];
      v129 = +[NSNumber numberWithInteger:v127];
      [v128 addObject:v129];

      if (v293[3] == 0x7FFFFFFFFFFFFFFFLL && [v126 isEqualToString:v186])
      {
        os_log_type_t v130 = v293;
LABEL_126:
        v130[3] = (uint64_t)v127;
        continue;
      }
      if (v297[3] == 0x7FFFFFFFFFFFFFFFLL && [v126 isEqualToString:v183])
      {
        os_log_type_t v130 = v297;
        goto LABEL_126;
      }
      if (v289[3] == 0x7FFFFFFFFFFFFFFFLL && [v126 isEqualToString:v180])
      {
        os_log_type_t v130 = v289;
        goto LABEL_126;
      }
    }
    id v123 = [obja countByEnumeratingWithState:&v278 objects:v392 count:16];
  }
  while (v123);
LABEL_129:

  uint64_t v272 = 0;
  id v273 = &v272;
  uint64_t v274 = 0x3032000000;
  v275 = sub_10003E634;
  v276 = sub_10003E644;
  id v277 = 0;
  v266[0] = _NSConcreteStackBlock;
  v266[1] = 3221225472;
  v266[2] = sub_1000478CC;
  v266[3] = &unk_100093648;
  qos_class_t v268 = &v282;
  v269 = &v296;
  dispatch_queue_t v270 = &v292;
  id v271 = &v288;
  id v131 = v169;
  id v267 = v131;
  id v132 = objc_retainBlock(v266);
  v255[0] = _NSConcreteStackBlock;
  v255[1] = 3221225472;
  v255[2] = sub_100047CD4;
  v255[3] = &unk_100093698;
  id v260 = &v272;
  id v133 = v173;
  id v256 = v133;
  id v261 = v334;
  unint64_t v262 = v178;
  unint64_t v263 = v172;
  id v134 = v191;
  id v257 = v134;
  unsigned __int8 v264 = v175;
  id v135 = v177;
  id v258 = v135;
  unsigned __int8 v265 = v170;
  id v136 = v132;
  id v259 = v136;
  id v137 = objc_retainBlock(v255);
  v245[0] = _NSConcreteStackBlock;
  v245[1] = 3221225472;
  v245[2] = sub_100048160;
  v245[3] = &unk_1000936E8;
  v250 = &v272;
  id v138 = v133;
  id v246 = v138;
  unint64_t v252 = v178;
  id v139 = v134;
  id v247 = v139;
  id v140 = v135;
  id v248 = v140;
  v251 = &v368;
  unsigned __int8 v253 = v175;
  unsigned __int8 v254 = v170;
  long long v141 = v136;
  id v249 = v141;
  v244[0] = 0;
  v244[1] = v244;
  v244[2] = 0x2020000000;
  v244[3] = 0;
  v226[0] = _NSConcreteStackBlock;
  v226[1] = 3221225472;
  v226[2] = sub_1000486C8;
  v226[3] = &unk_100093788;
  v231 = v334;
  uint64_t v142 = objc_retainBlock(v245);
  id v227 = v142;
  id v143 = v131;
  id v228 = v143;
  os_log_type_t v232 = v336;
  v192 = v141;
  id v229 = v192;
  v233 = &v272;
  v234 = &v338;
  v235 = &v320;
  id v236 = &v316;
  uint64_t v237 = &v312;
  v238 = &v308;
  v239 = &v304;
  v240 = &v300;
  v241 = &v324;
  v242 = &v342;
  id v144 = v137;
  id v230 = v144;
  v243 = v244;
  id v145 = [v226 copy];
  long long v146 = SPLogForSPLogCategoryQuery();
  os_log_type_t v147 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v146, v147))
  {
    uint64_t v148 = v381[5];
    *(_DWORD *)buf = 138412802;
    id v387 = v179;
    __int16 v388 = 2112;
    uint64_t v389 = v148;
    __int16 v390 = 2048;
    unint64_t v391 = v178;
    _os_log_impl((void *)&_mh_execute_header, v146, v147, "Starting topHit query, searchString:\"%@\", queryString:\"%@\", hitCount:%lu", buf, 0x20u);
  }

  uint64_t v149 = +[SPCoreSpotlightIndexer sharedInstance];
  uint64_t v150 = v381[5];
  v193[0] = _NSConcreteStackBlock;
  v193[1] = 3221225472;
  v193[2] = sub_100049378;
  v193[3] = &unk_100093800;
  v204 = v336;
  id v151 = v167;
  id v201 = v151;
  id v184 = v140;
  id v194 = v184;
  id v181 = v143;
  id v202 = v181;
  id v152 = v138;
  id v195 = v152;
  char v205 = v244;
  id v187 = v179;
  id v196 = v187;
  id v153 = v139;
  unint64_t v222 = v172;
  v206 = &v374;
  id v197 = v153;
  v198 = self;
  unsigned __int8 v224 = v175;
  id v154 = v176;
  id v199 = v154;
  v207 = &v380;
  char v225 = v171;
  v208 = &v368;
  v209 = &v358;
  id v210 = &v352;
  v211 = &v342;
  uint64_t v212 = &v338;
  unsigned int v213 = &v328;
  uint64_t v214 = &v324;
  unsigned int v215 = &v320;
  uint64_t v216 = &v316;
  uint64_t v217 = &v312;
  uint64_t v218 = &v308;
  v219 = &v304;
  v220 = &v300;
  v221 = &v282;
  id v155 = obja;
  id v200 = v155;
  id v156 = v145;
  id v203 = v156;
  unint64_t v223 = v178;
  uint64_t v157 = [v149 taskForTopHitQueryWithQueryString:v150 queryContext:v153 eventHandler:0 resultsHandler:v156 completionHandler:v193];
  v158 = (void *)v273[5];
  v273[5] = v157;

  id v159 = (id)v273[5];
  _Block_object_dispose(v244, 8);

  _Block_object_dispose(&v272, 8);
  _Block_object_dispose(&v282, 8);

  _Block_object_dispose(&v288, 8);
  _Block_object_dispose(&v292, 8);
  _Block_object_dispose(&v296, 8);
  _Block_object_dispose(&v300, 8);
  _Block_object_dispose(&v304, 8);
  _Block_object_dispose(&v308, 8);
  _Block_object_dispose(&v312, 8);
  _Block_object_dispose(&v316, 8);
  _Block_object_dispose(&v320, 8);
  _Block_object_dispose(&v324, 8);
  _Block_object_dispose(&v328, 8);

  _Block_object_dispose(v334, 8);
  _Block_object_dispose(v336, 8);

  _Block_object_dispose(&v338, 8);
  _Block_object_dispose(&v342, 8);

  _Block_object_dispose(&v352, 8);
  _Block_object_dispose(&v358, 8);

  _Block_object_dispose(&v368, 8);
  _Block_object_dispose(&v374, 8);

  _Block_object_dispose(&v380, 8);

  return v159;
}

- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v14) {
    sub_100065C74();
  }
  uint64_t v17 = v16;
  id v18 = [(SPCoreSpotlightDatastore *)self taskForTopHitQueryWithQueryString:v12 queryContext:v13 resultsHandler:v15 completionHandler:v16];

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_renderEngagementCounts, 0);
  objc_storeStrong((id *)&self->_maxMovieRating, 0);
  objc_storeStrong((id *)&self->_maxTVShowRating, 0);

  objc_storeStrong((id *)&self->_queryQueue, 0);
}

@end