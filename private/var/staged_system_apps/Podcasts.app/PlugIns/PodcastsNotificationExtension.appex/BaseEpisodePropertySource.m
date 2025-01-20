@interface BaseEpisodePropertySource
+ (id)defaultCombiningString;
+ (id)defaultSortOrderSortDescriptorsForPodcastUuid:(id)a3;
- (NSDictionary)sortPropertyValues;
- (id)__urlIfCanFindDatabaseEpisodeForUuid:(id)a3 urlBlock:(id)a4;
- (id)__urlIfCanFindDatabasePodcastForUuid:(id)a3 urlBlock:(id)a4;
- (id)_localizedDateStringForDate:(id)a3;
- (id)_localizedStringByCombiningWithString:(id)a3 firstComponent:(id)a4 secondComponent:(id)a5;
- (id)_localizedStringForDuration:(double)a3;
- (id)_localizedStringForDuration:(double)a3 podcastTitle:(id)a4;
- (id)_openEpisodeDetailInAppURLForEpisodeUuid:(id)a3 episodeStoreTrackId:(int64_t)a4 podcastStoreCollectionId:(int64_t)a5;
- (id)_openPodcastDetailInAppURLForPodcastUuid:(id)a3 podcastStoreCollectionId:(int64_t)a4;
- (id)valueForUndefinedKey:(id)a3;
- (void)_initiatePlaybackWithDefaultBehaviorForEpisodeUUid:(id)a3 episodeStoreTrackId:(int64_t)a4 podcastUuid:(id)a5 podcastStoreCollectionId:(int64_t)a6 completion:(id)a7;
- (void)setSortPropertyValues:(id)a3;
@end

@implementation BaseEpisodePropertySource

+ (id)defaultSortOrderSortDescriptorsForPodcastUuid:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000DA90;
  v20 = sub_10000DAA0;
  id v21 = 0;
  if (+[MTDB canExtensionOpenDatabase])
  {
    v4 = +[MTDB sharedInstance];
    v5 = [v4 mainOrPrivateContext];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000DAA8;
    v12[3] = &unk_10002CC88;
    id v6 = v5;
    id v13 = v6;
    id v14 = v3;
    v15 = &v16;
    [v6 performBlockAndWait:v12];
  }
  v7 = (void *)v17[5];
  if (!v7)
  {
    uint64_t v8 = +[MTPodcast sortDescriptorsForNewestOnTop];
    v9 = (void *)v17[5];
    v17[5] = v8;

    v7 = (void *)v17[5];
  }
  id v10 = v7;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BaseEpisodePropertySource *)self sortPropertyValues];
  if (v5
    && (id v6 = (void *)v5,
        +[MTPodcast allPossibleEpisodeListSortOrderProperties](MTPodcast, "allPossibleEpisodeListSortOrderProperties"), v7 = objc_claimAutoreleasedReturnValue(), unsigned int v8 = [v7 containsObject:v4], v7, v6, v8))
  {
    v9 = [(BaseEpisodePropertySource *)self sortPropertyValues];
    id v10 = [v9 objectForKey:v4];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BaseEpisodePropertySource;
    id v10 = [(BaseEpisodePropertySource *)&v12 valueForUndefinedKey:v4];
  }

  return v10;
}

+ (id)defaultCombiningString
{
  return +[NSString stringWithFormat:@"%@%@%@", @" ", @"·", @" "];
}

- (id)_localizedDateStringForDate:(id)a3
{
  if (a3)
  {
    id v4 = [a3 friendlyDisplayString];
  }
  else
  {
    id v4 = &stru_10002D2B8;
  }
  return v4;
}

- (id)_localizedStringByCombiningWithString:(id)a3 firstComponent:(id)a4 secondComponent:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    id v10 = +[NSString stringWithFormat:@"%@%@%@", v8, v7, v9];
LABEL_8:
    v11 = v10;
    goto LABEL_9;
  }
  if ([v8 length])
  {
    id v10 = (__CFString *)v8;
    goto LABEL_8;
  }
  if ([v9 length])
  {
    id v10 = (__CFString *)v9;
    goto LABEL_8;
  }
  v11 = &stru_10002D2B8;
LABEL_9:

  return v11;
}

- (id)_localizedStringForDuration:(double)a3
{
  return [(BaseEpisodePropertySource *)self _localizedStringForDuration:0 podcastTitle:a3];
}

- (id)_localizedStringForDuration:(double)a3 podcastTitle:(id)a4
{
  id v6 = a4;
  if (a3 <= 1.0)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = +[NSString prettyShortStringWithDuration:a3];
  }
  id v8 = [(id)objc_opt_class() defaultCombiningString];
  id v9 = [(BaseEpisodePropertySource *)self _localizedStringByCombiningWithString:v8 firstComponent:v7 secondComponent:v6];

  return v9;
}

- (id)_openPodcastDetailInAppURLForPodcastUuid:(id)a3 podcastStoreCollectionId:(int64_t)a4
{
  id v7 = a3;
  if (!+[NSThread isMainThread])
  {
    id v8 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      v11 = NSStringFromSelector(a2);
      int v17 = 138412546;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "-[%@ %@] must be used from main thread only", (uint8_t *)&v17, 0x16u);
    }
  }
  objc_super v12 = [(BaseEpisodePropertySource *)self __urlIfCanFindDatabasePodcastForUuid:v7 urlBlock:&stru_10002CD78];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = +[NSURL mt_displayURLForPodcastStoreCollectionId:a4];
  }
  v15 = v14;

  return v15;
}

- (id)_openEpisodeDetailInAppURLForEpisodeUuid:(id)a3 episodeStoreTrackId:(int64_t)a4 podcastStoreCollectionId:(int64_t)a5
{
  id v9 = a3;
  if (!+[NSThread isMainThread])
  {
    id v10 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      objc_super v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(a2);
      int v19 = 138412546;
      v20 = v12;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "-[%@ %@] must be used from main thread only", (uint8_t *)&v19, 0x16u);
    }
  }
  id v14 = [(BaseEpisodePropertySource *)self __urlIfCanFindDatabaseEpisodeForUuid:v9 urlBlock:&stru_10002CDB8];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSURL mt_displayURLForEpisodeStoreTrackId:a4 inPodcastWithStoreCollectionId:a5];
  }
  int v17 = v16;

  return v17;
}

- (void)_initiatePlaybackWithDefaultBehaviorForEpisodeUUid:(id)a3 episodeStoreTrackId:(int64_t)a4 podcastUuid:(id)a5 podcastStoreCollectionId:(int64_t)a6 completion:(id)a7
{
  id v10 = a7;
  if (!+[NSThread isMainThread])
  {
    v11 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "-[%@ %@] must be used from main thread only", buf, 0x16u);
    }
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000E374;
  v24[3] = &unk_10002CDE0;
  id v25 = v10;
  id v15 = v10;
  id v16 = objc_retainBlock(v24);
  int v17 = +[MTPlaybackIdentifierUtil sharedInstance];
  uint64_t v18 = [v17 universalPlaybackQueueIdentifierForPodcastFeedUrl:0 podcastStoreId:a6 episodeGuid:0 episodeStoreId:a4 sampPlaybackOrder:0];

  int v19 = +[MTPlaybackIdentifierUtil sharedInstance];
  v20 = [v19 playbackRequestURLWithPlayReason:13 baseRequestURLString:v18];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000E38C;
  v22[3] = &unk_10002CDE0;
  id v23 = v16;
  __int16 v21 = v16;
  +[MTExtensionPlaybackController setQueueWithPlaybackRequestIdentifier:v20 completion:v22];
}

- (id)__urlIfCanFindDatabaseEpisodeForUuid:(id)a3 urlBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_10000DA90;
    __int16 v21 = sub_10000DAA0;
    id v22 = 0;
    if ([v5 length]
      && +[MTDB canExtensionOpenDatabase])
    {
      id v7 = +[MTDB sharedInstance];
      id v8 = [v7 mainOrPrivateContext];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000E54C;
      v12[3] = &unk_10002CE08;
      id v9 = v8;
      id v13 = v9;
      id v14 = v5;
      id v16 = &v17;
      id v15 = v6;
      [v9 performBlockAndWait:v12];
    }
    id v10 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)__urlIfCanFindDatabasePodcastForUuid:(id)a3 urlBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_10000DA90;
    __int16 v21 = sub_10000DAA0;
    id v22 = 0;
    if ([v5 length]
      && +[MTDB canExtensionOpenDatabase])
    {
      id v7 = +[MTDB sharedInstance];
      id v8 = [v7 mainOrPrivateContext];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000E7A4;
      v12[3] = &unk_10002CE08;
      id v9 = v8;
      id v13 = v9;
      id v14 = v5;
      id v16 = &v17;
      id v15 = v6;
      [v9 performBlockAndWait:v12];
    }
    id v10 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSDictionary)sortPropertyValues
{
  return self->_sortPropertyValues;
}

- (void)setSortPropertyValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end