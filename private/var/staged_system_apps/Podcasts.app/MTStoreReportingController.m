@interface MTStoreReportingController
+ (id)reportingStringForPlayReason:(unint64_t)a3;
- (id)_dictionaryForPodcastUuid:(id)a3;
- (id)pageTypeForReportType:(int)a3;
- (void)recordMetricsEventForType:(int)a3 withData:(id)a4;
- (void)reportBrowse:(id)a3;
- (void)reportPlaybackFromStore:(id)a3 reason:(unint64_t)a4;
- (void)reportWithType:(int)a3 userInfo:(id)a4 location:(id)a5 reason:(unint64_t)a6;
@end

@implementation MTStoreReportingController

- (void)reportWithType:(int)a3 userInfo:(id)a4 location:(id)a5 reason:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a3;
  id v92 = a4;
  v10 = (__CFString *)a5;
  v11 = +[NSMutableDictionary dictionaryWithObject:@"3" forKey:@"v"];
  v12 = v11;
  if (v10) {
    CFStringRef v13 = v10;
  }
  else {
    CFStringRef v13 = &stru_10056A8A0;
  }
  [v11 setObject:v13 forKey:@"pageLocation"];

  [v12 setObject:@"1" forKey:@"podcastType"];
  switch((int)v8)
  {
    case 0:
    case 1:
      v14 = [v92 objectForKey:kPodcastStoreCollectionId];
      if ([v14 unsignedLongLongValue]) {
        [v12 setObject:v14 forKey:@"podcastId"];
      }
      uint64_t v15 = kPodcastTitle;
      v16 = [v92 objectForKey:kPodcastTitle];
      id v17 = [v16 length];

      if (v17)
      {
        v18 = [v92 objectForKey:v15];
        [v12 setObject:v18 forKey:@"podcastName"];
      }
      uint64_t v19 = kPodcastUpdatedFeedUrl;
      v20 = [v92 objectForKey:kPodcastUpdatedFeedUrl];
      id v21 = [v20 length];

      if (v21
        || (uint64_t v19 = kPodcastFeedUrl,
            [v92 objectForKey:kPodcastFeedUrl],
            v22 = objc_claimAutoreleasedReturnValue(),
            id v23 = [v22 length],
            v22,
            v23))
      {
        v24 = [v92 objectForKey:v19];
        [v12 setObject:v24 forKey:@"feedUrl"];
      }
      uint64_t v25 = kEpisodeGuid;
      v26 = [v92 objectForKey:kEpisodeGuid];
      id v27 = [v26 length];

      if (v27)
      {
        v28 = [v92 objectForKey:v25];
        [v12 setObject:v28 forKey:@"episodeGuid"];
      }
      uint64_t v29 = kEpisodeEnclosureUrl;
      v30 = [v92 objectForKey:kEpisodeEnclosureUrl];
      id v31 = [v30 length];

      if (v31)
      {
        v32 = [v92 objectForKey:v29];
        [v12 setObject:v32 forKey:@"episodeUrl"];
      }
      uint64_t v33 = kEpisodeUti;
      v34 = [v92 objectForKey:kEpisodeUti];
      id v35 = [v34 length];

      if (v35)
      {
        v36 = [v92 objectForKey:v33];
        [v12 setObject:v36 forKey:@"episodeType"];
      }
      v37 = [v92 objectForKey:kMTEpisodeRestoreResultKey];
      id v38 = [v37 length];

      if (v38)
      {
        v39 = [v92 objectForKey:kMTEpisodeRestoreResultKey];
        [v12 setObject:v39 forKey:kMTEpisodeRestoreResultKey];
      }
      v40 = [v92 objectForKey:kMTEpisodeRestoreTypeKey];
      id v41 = [v40 length];

      if (v41)
      {
        v42 = [v92 objectForKey:kMTEpisodeRestoreTypeKey];
        [v12 setObject:v42 forKey:kMTEpisodeRestoreTypeKey];
      }
      v43 = [v92 objectForKey:v33];
      unsigned __int8 v44 = [v43 isEqualToString:@"audio"];

      if (v44)
      {
        CFStringRef v45 = @"episode";
      }
      else
      {
        v76 = [v92 objectForKey:v33];
        unsigned int v77 = [v76 isEqualToString:@"video"];

        if (!v77) {
          goto LABEL_57;
        }
        CFStringRef v45 = @"movie";
      }
      [v12 setObject:v45 forKey:@"episodeKind"];
      goto LABEL_57;
    case 2:
    case 3:
      uint64_t v46 = kEpisodeGuid;
      v47 = [v92 objectForKey:kEpisodeGuid];
      id v48 = [v47 length];

      if (v48)
      {
        v49 = [v92 objectForKey:v46];
        [v12 setObject:v49 forKey:@"episodeGuid"];
      }
      uint64_t v50 = kEpisodeEnclosureUrl;
      v51 = [v92 objectForKey:kEpisodeEnclosureUrl];
      id v52 = [v51 length];

      if (v52)
      {
        v53 = [v92 objectForKey:v50];
        [v12 setObject:v53 forKey:@"episodeUrl"];
      }
      uint64_t v54 = kEpisodeUti;
      v55 = [v92 objectForKey:kEpisodeUti];
      unsigned __int8 v56 = [v55 isEqualToString:kUTTypeAudio];

      if (v56)
      {
        CFStringRef v57 = @"episode";
      }
      else
      {
        v78 = [v92 objectForKey:v54];
        unsigned int v79 = [v78 isEqualToString:kUTTypeMovie];

        if (!v79) {
          goto LABEL_49;
        }
        CFStringRef v57 = @"movie";
      }
      [v12 setObject:v57 forKey:@"episodeKind"];
LABEL_49:
      v80 = [v92 objectForKey:kEpisodePodcastUuid];
      v14 = [(MTStoreReportingController *)self _dictionaryForPodcastUuid:v80];

      v67 = [v14 objectForKey:kPodcastStoreCollectionId];
      if ([v67 unsignedLongLongValue]) {
        [v12 setObject:v67 forKey:@"podcastId"];
      }
      uint64_t v81 = kPodcastTitle;
      v82 = [v14 objectForKey:kPodcastTitle];
      id v83 = [v82 length];

      if (v83)
      {
        v84 = [v14 objectForKey:v81];
        [v12 setObject:v84 forKey:@"podcastName"];
      }
      uint64_t v85 = kPodcastUpdatedFeedUrl;
      v86 = [v14 objectForKey:kPodcastUpdatedFeedUrl];
      id v87 = [v86 length];

      if (v87
        || (uint64_t v85 = kPodcastFeedUrl,
            [v14 objectForKey:kPodcastFeedUrl],
            v88 = objc_claimAutoreleasedReturnValue(),
            id v89 = [v88 length],
            v88,
            v89))
      {
        v90 = [v14 objectForKey:v85];
        [v12 setObject:v90 forKey:@"feedUrl"];
      }
LABEL_56:

LABEL_57:
LABEL_58:
      if (a6)
      {
        v91 = [(id)objc_opt_class() reportingStringForPlayReason:a6];
        [v12 setObject:v91 forKey:@"play_source"];
      }
      [(MTStoreReportingController *)self recordMetricsEventForType:v8 withData:v12];

      return;
    case 4:
      v14 = [v92 objectForKey:kPodcastStoreCollectionId];
      if ([v14 unsignedLongLongValue]) {
        [v12 setObject:v14 forKey:@"podcastId"];
      }
      uint64_t v58 = kPodcastTitle;
      v59 = [v92 objectForKey:kPodcastTitle];
      id v60 = [v59 length];

      if (v60)
      {
        v61 = [v92 objectForKey:v58];
        [v12 setObject:v61 forKey:@"podcastName"];
      }
      uint64_t v62 = kPodcastUpdatedFeedUrl;
      v63 = [v92 objectForKey:kPodcastUpdatedFeedUrl];
      id v64 = [v63 length];

      if (!v64)
      {
        uint64_t v62 = kPodcastFeedUrl;
        v65 = [v92 objectForKey:kPodcastFeedUrl];
        id v66 = [v65 length];

        if (!v66) {
          goto LABEL_57;
        }
      }
      v67 = [v92 objectForKey:v62];
      [v12 setObject:v67 forKey:@"feedUrl"];
      goto LABEL_56;
    case 6:
      uint64_t v68 = kEpisodeRestoredCount;
      v14 = [v92 objectForKey:kEpisodeRestoredCount];
      if ([v14 unsignedLongLongValue]) {
        [v12 setObject:v14 forKey:v68];
      }
      uint64_t v69 = kEpisodeRestoreRequested;
      v70 = [v92 objectForKey:kEpisodeRestoreRequested];
      id v71 = [v70 BOOLValue];

      v72 = +[NSNumber numberWithBool:v71];
      [v12 setObject:v72 forKey:v69];

      uint64_t v73 = kEpisodeRestoreIsRetry;
      v74 = [v92 objectForKey:kEpisodeRestoreIsRetry];
      if ([v74 BOOLValue]) {
        v75 = &__kCFBooleanTrue;
      }
      else {
        v75 = &__kCFBooleanFalse;
      }
      [v12 setObject:v75 forKey:v73];

      goto LABEL_57;
    default:
      goto LABEL_58;
  }
}

- (void)reportPlaybackFromStore:(id)a3 reason:(unint64_t)a4
{
  if (a3)
  {
    [a3 dictionaryByDecomposingQueryStringWithURLDecode:1 a4];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(MTStoreReportingController *)self recordMetricsEventForType:2 withData:v5];
  }
}

- (void)reportBrowse:(id)a3
{
  if (a3)
  {
    id v4 = [a3 dictionaryByDecomposingQueryStringWithURLDecode:1];
    [(MTStoreReportingController *)self recordMetricsEventForType:5 withData:v4];
  }
}

- (id)_dictionaryForPodcastUuid:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100056E90;
  v18 = sub_100057220;
  id v19 = 0;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007BF0C;
  v10[3] = &unk_10054E280;
  CFStringRef v13 = &v14;
  id v6 = v5;
  id v11 = v6;
  id v7 = v3;
  id v12 = v7;
  [v6 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

- (void)recordMetricsEventForType:(int)a3 withData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setEventType:@"reporting_event"];
  id v8 = [(MTStoreReportingController *)self pageTypeForReportType:v4];
  [v7 setPageType:v8];

  [v7 im_addPropertiesWithDictionary:v6];
  v9 = objc_opt_new();
  [v9 setEventType:@"reporting_event"];
  v10 = [(MTStoreReportingController *)self pageTypeForReportType:v4];
  [v9 setPageType:v10];

  [v9 im_addPropertiesWithDictionary:v6];
  id v11 = +[AnalyticsIdentifierManager sharedInstance];
  id v12 = [v11 identifierPromise];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007C0F4;
  v14[3] = &unk_10054E780;
  id v15 = v9;
  id v13 = v9;
  [v12 addFinishBlock:v14];
}

- (id)pageTypeForReportType:(int)a3
{
  if ((a3 - 1) > 5) {
    return @"download";
  }
  else {
    return *(&off_10054E7A0 + a3 - 1);
  }
}

+ (id)reportingStringForPlayReason:(unint64_t)a3
{
  if (a3 > 0xF) {
    return @"unknown";
  }
  else {
    return *(&off_10054E7D0 + a3);
  }
}

@end