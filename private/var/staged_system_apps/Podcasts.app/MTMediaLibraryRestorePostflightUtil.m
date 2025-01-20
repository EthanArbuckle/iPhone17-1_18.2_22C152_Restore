@interface MTMediaLibraryRestorePostflightUtil
+ (id)downloadCandidateMediaItems;
+ (id)postRestoreCandidateMediaItems;
+ (id)uuidsByRemovingDownloadCandidatesFromEpisodeUuids:(id)a3;
@end

@implementation MTMediaLibraryRestorePostflightUtil

+ (id)downloadCandidateMediaItems
{
  v2 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyIsLocal];
  v3 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyNeedsRestore];
  uint64_t v4 = MPMediaEntityPropertyKeepLocal;
  v5 = +[MPMediaPropertyPredicate predicateWithValue:&off_100579608 forProperty:MPMediaEntityPropertyKeepLocal];
  v6 = +[MPMediaPropertyPredicate predicateWithValue:&off_100579620 forProperty:v4];
  v16[0] = v5;
  v16[1] = v6;
  v7 = +[NSArray arrayWithObjects:v16 count:2];
  v8 = +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:v7];

  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v8;
  v9 = +[NSArray arrayWithObjects:v15 count:3];
  v10 = +[MPMediaCompoundAllPredicate predicateMatchingPredicates:v9];

  v11 = +[MPMediaQuery mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:v10 disableSystemPredicates:1];
  v12 = +[NSSet setWithArray:v11];
  v13 = [v12 objectsPassingTest:&stru_10054FAB0];

  return v13;
}

+ (id)postRestoreCandidateMediaItems
{
  v2 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyIsLocal];
  v3 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyNeedsRestore];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&off_100579620 forProperty:MPMediaEntityPropertyKeepLocal];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v5 = +[NSArray arrayWithObjects:v10 count:3];
  v6 = +[MPMediaCompoundAllPredicate predicateMatchingPredicates:v5];

  v7 = +[MPMediaQuery mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:v6 disableSystemPredicates:1];
  v8 = +[NSSet setWithArray:v7];

  return v8;
}

+ (id)uuidsByRemovingDownloadCandidatesFromEpisodeUuids:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100056F5C;
    v23 = sub_100057278;
    id v5 = v4;
    id v24 = v5;
    v6 = [a1 downloadCandidateMediaItems];
    v7 = [v6 mt_compactMap:&stru_10054FAD0];

    v8 = +[MTDB sharedInstance];
    v9 = [v8 mainOrPrivateContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A626C;
    v14[3] = &unk_10054FB60;
    v18 = &v19;
    id v15 = v5;
    id v10 = v9;
    id v16 = v10;
    id v11 = v7;
    id v17 = v11;
    [v10 performBlockAndWait:v14];
    id v12 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v12 = v4;
  }

  return v12;
}

@end