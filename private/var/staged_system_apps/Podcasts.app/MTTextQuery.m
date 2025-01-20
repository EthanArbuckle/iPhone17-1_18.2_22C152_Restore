@interface MTTextQuery
- (id)titleForPodcastUuid:(id)a3;
- (void)runQueryWithText:(id)a3;
@end

@implementation MTTextQuery

- (void)runQueryWithText:(id)a3
{
  id v4 = a3;
  v5 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:0];
  v71[0] = v5;
  v6 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:0];
  v71[1] = v6;
  v7 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:1];
  v71[2] = v7;
  uint64_t v57 = kEpisodeTitle;
  v8 = +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:");
  v71[3] = v8;
  v9 = +[NSArray arrayWithObjects:v71 count:4];
  [(MTLibraryQuery *)self setEpisodeSortDescriptors:v9];

  uint64_t v55 = kPodcastTitle;
  v10 = +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:");
  v11 = +[NSArray arrayWithObject:v10];
  v49 = self;
  [(MTLibraryQuery *)self setPodcastSortDescriptors:v11];

  v12 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v50 = v4;
  v13 = [v4 stringByTrimmingCharactersInSet:v12];
  v14 = +[NSCharacterSet whitespaceCharacterSet];
  v15 = [v13 componentsSeparatedByCharactersInSet:v14];

  v65 = +[NSMutableArray array];
  v64 = +[NSMutableArray array];
  v63 = +[NSMutableArray array];
  v62 = +[NSMutableArray array];
  v61 = +[NSMutableArray array];
  v60 = +[NSMutableArray array];
  v59 = +[NSMutableArray array];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v15;
  id v16 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v53 = *(void *)v67;
    uint64_t v52 = kPodcastDescription;
    uint64_t v18 = kEpisodeDescription;
    uint64_t v19 = kChannelName;
    uint64_t v20 = kChannelSubscriptionName;
    uint64_t v21 = kChannelShowCount;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v67 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        v24 = +[NSPredicate predicateWithFormat:@"%K contains[cl] %@", v55, v23];
        [v65 addObject:v24];

        v25 = +[NSPredicate predicateWithFormat:@"%K contains[cl] %@", v52, v23];
        [v64 addObject:v25];

        v26 = +[NSPredicate predicateWithFormat:@"%K contains[cl] %@", v57, v23];
        [v63 addObject:v26];

        v27 = +[NSPredicate predicateWithFormat:@"%K contains[cl] %@", v18, v23];
        [v62 addObject:v27];

        v28 = +[NSPredicate predicateWithFormat:@"%K contains[cl] %@", v19, v23];
        [v61 addObject:v28];

        v29 = +[NSPredicate predicateWithFormat:@"%K contains[cl] %@", v20, v23];
        [v60 addObject:v29];

        v30 = +[NSPredicate predicateWithFormat:@"%K > %@", v21, &off_1005794D0];
        [v59 addObject:v30];
      }
      id v17 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v17);
  }

  v31 = +[NSCompoundPredicate andPredicateWithSubpredicates:v65];
  v32 = +[NSCompoundPredicate andPredicateWithSubpredicates:v64];
  v33 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  v34 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v31, v32, 0);
  v58 = +[NSCompoundPredicate orPredicateWithSubpredicates:v34];

  v35 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v33, v58, 0);
  v56 = +[NSCompoundPredicate andPredicateWithSubpredicates:v35];

  v36 = +[NSCompoundPredicate andPredicateWithSubpredicates:v63];

  v37 = +[NSCompoundPredicate andPredicateWithSubpredicates:v62];

  v38 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v36, v37, 0);
  v39 = +[NSCompoundPredicate orPredicateWithSubpredicates:v38];

  id v40 = v39;
  v54 = +[MTEpisode predicateForEpisodesInSearchResults];

  v41 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v54, v40, 0);

  v42 = +[NSCompoundPredicate andPredicateWithSubpredicates:v41];

  v43 = [v61 arrayByAddingObjectsFromArray:v59];
  v44 = +[NSCompoundPredicate andPredicateWithSubpredicates:v43];

  v45 = [v60 arrayByAddingObjectsFromArray:v59];
  v46 = +[NSCompoundPredicate andPredicateWithSubpredicates:v45];

  v47 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v44, v46, 0);
  v48 = +[NSCompoundPredicate orPredicateWithSubpredicates:v47];

  [(MTLibraryQuery *)v49 runQueryWithPodcastPredicate:v56 episodePredicate:v42 channelPredicate:v48];
}

- (id)titleForPodcastUuid:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100056ED0;
  uint64_t v18 = sub_100057240;
  id v19 = 0;
  if (v3)
  {
    id v4 = +[MTDB sharedInstance];
    v5 = [v4 mainOrPrivateContext];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000889FC;
    v10[3] = &unk_10054DA00;
    id v6 = v5;
    id v11 = v6;
    id v12 = v3;
    v13 = &v14;
    [v6 performBlockAndWait:v10];

    v7 = (void *)v15[5];
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v14, 8);

  return v8;
}

@end