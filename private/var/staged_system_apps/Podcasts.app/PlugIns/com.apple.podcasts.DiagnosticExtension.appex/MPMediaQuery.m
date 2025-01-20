@interface MPMediaQuery
+ (id)mt_allItemsForPodcastsApp;
+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 disableSystemPredicates:(BOOL)a4;
+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 includePendingDeletions:(BOOL)a4 disableSystemPredicates:(BOOL)a5;
+ (id)mt_iTunesUQuery;
+ (id)mt_podcastsQuery;
@end

@implementation MPMediaQuery

+ (id)mt_allItemsForPodcastsApp
{
  return [a1 mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:0 includePendingDeletions:0 disableSystemPredicates:0];
}

+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 disableSystemPredicates:(BOOL)a4
{
  return [a1 mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:a3 includePendingDeletions:0 disableSystemPredicates:a4];
}

+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 includePendingDeletions:(BOOL)a4 disableSystemPredicates:(BOOL)a5
{
  id v6 = a3;
  v7 = +[MPMediaQuery mt_podcastsQuery];
  v8 = v7;
  if (v6) {
    [v7 addFilterPredicate:v6];
  }
  v23 = v8;
  v9 = +[NSArray arrayWithObjects:&v23 count:1];
  v10 = +[MPMediaQuery mt_iTunesUQuery];
  v11 = v10;
  if (v6) {
    [v10 addFilterPredicate:v6];
  }
  v12 = [v9 arrayByAddingObject:v11];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100004CF4;
  v21 = sub_100004D04;
  id v22 = &__NSArray0__struct;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004D0C;
  v15[3] = &unk_1000083F8;
  BOOL v16 = a5;
  v15[4] = &v17;
  [v12 enumerateObjectsUsingBlock:v15];
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

+ (id)mt_podcastsQuery
{
  v2 = +[MPMediaQuery podcastsQuery];
  [v2 setGroupingType:6];

  return v2;
}

+ (id)mt_iTunesUQuery
{
  id v2 = objc_alloc_init((Class)MPMediaQuery);
  v3 = +[NSNumber numberWithInt:4104];
  v4 = +[MPMediaPropertyPredicate predicateWithValue:v3 forProperty:MPMediaItemPropertyMediaType];
  [v2 addFilterPredicate:v4];

  [v2 setGroupingType:1];

  return v2;
}

@end