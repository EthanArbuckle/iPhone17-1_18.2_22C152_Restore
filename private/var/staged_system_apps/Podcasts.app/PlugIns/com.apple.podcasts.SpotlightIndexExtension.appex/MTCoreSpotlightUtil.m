@interface MTCoreSpotlightUtil
+ (id)_uniqueIdentifierForPodcast:(id)a3;
+ (id)fetchRequestForIndexType:(int)a3;
+ (id)fetchRequestForIndexType:(int)a3 additionalPredicate:(id)a4;
+ (id)uniqueIdentifierForObject:(id)a3;
+ (void)configureArtworkForSearchableItemAttributeSet:(id)a3 withPodcastUuid:(id)a4 completion:(id)a5;
+ (void)prepareSearchableItemForEpisode:(id)a3 annotator:(id)a4 completion:(id)a5;
+ (void)prepareSearchableItemForObject:(id)a3 annotator:(id)a4 completion:(id)a5;
+ (void)prepareSearchableItemForPodcast:(id)a3 annotator:(id)a4 completion:(id)a5;
+ (void)prepareSearchableItemForStation:(id)a3 annotator:(id)a4 completion:(id)a5;
+ (void)prepareSearchableItemsForObjectInArray:(id)a3 annotator:(id)a4 completion:(id)a5;
@end

@implementation MTCoreSpotlightUtil

+ (void)prepareSearchableItemForObject:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 prepareSearchableItemForPodcast:v8 annotator:v9 completion:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a1 prepareSearchableItemForEpisode:v8 annotator:v9 completion:v10];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a1 prepareSearchableItemForStation:v8 annotator:v9 completion:v10];
      }
      else
      {
        v12 = _MTLogCategorySpotlight();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalid object, can not index %@", (uint8_t *)&v13, 0xCu);
        }

        v10[2](v10, 0);
      }
    }
  }
}

+ (void)prepareSearchableItemsForObjectInArray:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = a3;
    v10 = +[NSMutableArray array];
    dispatch_group_t v11 = dispatch_group_create();
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000B3D4;
    v26[3] = &unk_100014B58;
    dispatch_queue_t v27 = dispatch_queue_create(0, 0);
    id v12 = v10;
    id v28 = v12;
    int v13 = v27;
    id v14 = objc_retainBlock(v26);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000B494;
    v22[3] = &unk_100014BA8;
    dispatch_group_t v23 = v11;
    id v24 = v7;
    id v25 = v14;
    v15 = v14;
    v16 = v11;
    [v9 enumerateObjectsUsingBlock:v22];

    v17 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B5BC;
    block[3] = &unk_100014BD0;
    id v20 = v12;
    id v21 = v8;
    id v18 = v12;
    dispatch_group_notify(v16, v17, block);
  }
}

+ (id)uniqueIdentifierForObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [a1 _uniqueIdentifierForPodcast:v4];
LABEL_3:
    v6 = &stru_1000150F0;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v4 guid];
    id v8 = v7;
    if (v7) {
      v6 = v7;
    }
    else {
      v6 = &stru_1000150F0;
    }
    v10 = @"e";
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_3;
    }
    id v9 = [v4 uuid];
    id v8 = v9;
    if (v9) {
      v6 = v9;
    }
    else {
      v6 = &stru_1000150F0;
    }
    v10 = @"s";
  }
  v5 = [(__CFString *)v10 stringByAppendingString:v6];

LABEL_16:

  return v5;
}

+ (id)fetchRequestForIndexType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[NSPredicate predicateWithValue:1];
  v6 = [a1 fetchRequestForIndexType:v3 additionalPredicate:v5];

  return v6;
}

+ (void)configureArtworkForSearchableItemAttributeSet:(id)a3 withPodcastUuid:(id)a4 completion:(id)a5
{
  id v6 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B8E4;
  v13[3] = &unk_100014BF8;
  id v7 = a5;
  id v14 = v7;
  id v8 = objc_retainBlock(v13);
  if ([v6 length])
  {
    id v9 = +[MTImageStore defaultStore];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000B8FC;
    v10[3] = &unk_100014C48;
    dispatch_group_t v11 = v8;
    uint64_t v12 = 0x4056800000000000;
    [v9 asyncImageURLForKey:v6 squareDimension:0 cacheKeyModifier:v10 completionHandler:90.0];
  }
  else
  {
    ((void (*)(void *, void))v8[2])(v8, 0);
  }
}

+ (id)_uniqueIdentifierForPodcast:(id)a3
{
  id v3 = a3;
  id v4 = [v3 currentFeedURL];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 absoluteString];
  }
  else
  {
    id v7 = [v3 uuid];
    id v8 = v7;
    if (v7) {
      id v6 = v7;
    }
    else {
      id v6 = &stru_1000150F0;
    }
  }
  id v9 = [@"p" stringByAppendingString:v6];

  return v9;
}

+ (id)fetchRequestForIndexType:(int)a3 additionalPredicate:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 2:
      id v13 = objc_alloc((Class)NSFetchRequest);
      id v7 = [v13 initWithEntityName:kMTPlaylistEntityName];
      id v14 = +[MTPlaylist topLevelPlaylistsPredicate];
      v15 = [v14 AND:v5];
      [v7 setPredicate:v15];

      id v16 = objc_alloc((Class)NSSortDescriptor);
      id v11 = [v16 initWithKey:kPlaylistTitle ascending:1];
      id v23 = v11;
      uint64_t v12 = &v23;
      goto LABEL_7;
    case 1:
      id v17 = objc_alloc((Class)NSFetchRequest);
      id v7 = [v17 initWithEntityName:kMTEpisodeEntityName];
      id v18 = +[MTEpisode predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
      v19 = [v18 AND:v5];
      [v7 setPredicate:v19];

      id v20 = objc_alloc((Class)NSSortDescriptor);
      id v11 = [v20 initWithKey:kEpisodePubDate ascending:1];
      id v24 = v11;
      uint64_t v12 = &v24;
      goto LABEL_7;
    case 0:
      id v6 = objc_alloc((Class)NSFetchRequest);
      id v7 = [v6 initWithEntityName:kMTPodcastEntityName];
      id v8 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
      id v9 = [v8 AND:v5];
      [v7 setPredicate:v9];

      id v10 = objc_alloc((Class)NSSortDescriptor);
      id v11 = [v10 initWithKey:kPodcastAddedDate ascending:1];
      id v25 = v11;
      uint64_t v12 = &v25;
LABEL_7:
      id v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 1, v23, v24, v25);
      [v7 setSortDescriptors:v21];

      goto LABEL_9;
  }
  id v7 = 0;
LABEL_9:
  [v7 setFetchLimit:1];

  return v7;
}

+ (void)prepareSearchableItemForPodcast:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = a4;
    id v11 = [v8 uuid];
    uint64_t v12 = [v8 title];
    id v13 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithItemContentType:kUTTypeAudiovisualContent];
    id v14 = +[NSDate distantFuture];
    [v13 setExpirationDate:v14];

    [v13 setDisplayName:v12];
    v15 = [v8 currentFeedURL];
    [v13 setContentURL:v15];

    id v16 = [v8 bestDescription];
    [v13 setContentDescription:v16];

    [v13 setContentType:@"com.apple.podcasts.show"];
    id v17 = [v8 bestDescription];
    [v13 setInformation:v17];

    [v8 downloadedDate];
    if (v18 != 0.0)
    {
      [v8 downloadedDate];
      v19 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v13 setDownloadedDate:v19];
    }
    [v8 lastTouchDate];
    if (v20 != 0.0)
    {
      [v8 lastTouchDate];
      id v21 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v13 setLastUsedDate:v21];
    }
    v22 = [v8 author];

    if (v22)
    {
      id v23 = [v8 author];
      v36 = v23;
      id v24 = +[NSArray arrayWithObjects:&v36 count:1];
      [v13 setAuthorNames:v24];
    }
    id v25 = [a1 uniqueIdentifierForObject:v8];
    id v26 = objc_alloc_init((Class)CSSearchableItem);
    [v26 setUniqueIdentifier:v25];
    [v26 setAttributeSet:v13];
    dispatch_queue_t v27 = [v10 annotateItem:v26 withManagedObject:v8];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000C09C;
    v31[3] = &unk_100014C70;
    id v32 = v27;
    id v33 = v11;
    id v34 = v12;
    id v35 = v9;
    id v28 = v12;
    id v29 = v11;
    id v30 = v27;
    [a1 configureArtworkForSearchableItemAttributeSet:v13 withPodcastUuid:v29 completion:v31];
  }
}

+ (void)prepareSearchableItemForEpisode:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = a4;
    v47 = [v8 uuid];
    id v11 = [v8 title];
    id v12 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithItemContentType:kUTTypeAudiovisualContent];
    id v13 = +[NSDate distantFuture];
    [v12 setExpirationDate:v13];

    id v14 = [v8 bestTitle];
    [v12 setDisplayName:v14];

    v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 playCount]);
    [v12 setPlayCount:v15];

    id v16 = [v8 podcast];
    id v17 = [v16 title];
    [v12 setContainerTitle:v17];

    double v18 = [v8 bestSummary];
    [v12 setContentDescription:v18];

    [v12 setContentType:@"com.apple.podcasts.episode"];
    v19 = [v8 bestSummary];
    [v12 setInformation:v19];

    [v8 duration];
    double v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v12 setDuration:v20];

    id v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isDownloaded]);
    [v12 setLocal:v21];

    v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 externalType]);
    [v12 setStreamable:v22];

    id v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isExplicit]);
    [v12 setContentRating:v23];

    [v8 pubDate];
    if (v24 != 0.0)
    {
      [v8 pubDate];
      id v25 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v12 setContentCreationDate:v25];
    }
    [v8 downloadDate];
    if (v26 != 0.0)
    {
      [v8 downloadDate];
      dispatch_queue_t v27 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v12 setDownloadedDate:v27];
    }
    [v8 lastDatePlayed];
    if (v28 != 0.0)
    {
      [v8 lastDatePlayed];
      id v29 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v12 setLastUsedDate:v29];
    }
    if (![v8 playState])
    {
      [v8 lastDatePlayed];
      if (v30 != 0.0)
      {
        [v8 lastDatePlayed];
        v31 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
        [v12 setCompletionDate:v31];
      }
    }
    id v32 = [v8 author];

    if (v32)
    {
      id v33 = [v8 author];
      v53 = v33;
      id v34 = +[NSArray arrayWithObjects:&v53 count:1];
      [v12 setAuthorNames:v34];
    }
    id v35 = [v8 assetURL];

    if (v35)
    {
      v36 = [v8 assetURL];
      v37 = +[NSURL URLWithString:v36];
      [v12 setContentURL:v37];
    }
    v38 = [a1 uniqueIdentifierForObject:v8];
    v39 = [v8 podcast];
    v40 = +[MTCoreSpotlightUtil uniqueIdentifierForObject:v39];

    [v12 setRelatedUniqueIdentifier:v40];
    [v12 setDomainIdentifier:v40];
    id v41 = objc_alloc_init((Class)CSSearchableItem);
    [v41 setUniqueIdentifier:v38];
    [v41 setAttributeSet:v12];
    v42 = [v10 annotateItem:v41 withManagedObject:v8];

    v43 = [v8 podcastUuid];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10000C6C4;
    v48[3] = &unk_100014C70;
    id v49 = v42;
    id v50 = v47;
    id v51 = v11;
    id v52 = v9;
    id v44 = v11;
    id v45 = v47;
    id v46 = v42;
    [a1 configureArtworkForSearchableItemAttributeSet:v12 withPodcastUuid:v43 completion:v48];
  }
}

+ (void)prepareSearchableItemForStation:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v18 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithItemContentType:kUTTypeAudiovisualContent];
  id v11 = +[NSDate distantFuture];
  [v10 setExpirationDate:v11];

  id v12 = [v18 title];
  [v10 setDisplayName:v12];

  [v10 setContentType:@"com.apple.podcasts.station"];
  [v18 generatedDate];
  if (v13 != 0.0)
  {
    [v18 generatedDate];
    id v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v10 setContentCreationDate:v14];
  }
  id v15 = objc_alloc_init((Class)CSSearchableItem);
  id v16 = [a1 uniqueIdentifierForObject:v18];
  [v15 setUniqueIdentifier:v16];

  [v15 setAttributeSet:v10];
  id v17 = [v9 annotateItem:v15 withManagedObject:v18];

  v8[2](v8, v17);
}

@end