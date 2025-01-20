@interface MTEpisodeLookupUtil
+ (id)sharedInstance;
- (id)_entityForFetchRequest:(id)a3;
- (id)_entityForFetchRequest:(id)a3 context:(id)a4;
- (id)_episodeMatchFromPredicate:(id)a3;
- (id)_episodeMatchFromPredicate:(id)a3 context:(id)a4;
- (id)_podcastMatchFromPredicate:(id)a3;
- (id)_podcastMatchFromPredicate:(id)a3 context:(id)a4;
- (id)findEpisodeWithRequest:(id)a3;
- (id)findEpisodeWithRequest:(id)a3 context:(id)a4;
- (id)findPodcastWithFeedUrl:(id)a3;
@end

@implementation MTEpisodeLookupUtil

uint64_t __37__MTEpisodeLookupUtil_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MTEpisodeLookupUtil);
  uint64_t v1 = sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

- (id)findEpisodeWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[MTDB sharedInstance];
  v6 = [v5 mainOrPrivateContext];

  v7 = [(MTEpisodeLookupUtil *)self findEpisodeWithRequest:v4 context:v6];

  return v7;
}

- (id)findEpisodeWithRequest:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uuid];
  if ([v8 length])
  {
    v9 = +[MTEpisode predicateForEpisodeUuid:v8];
    v10 = [(MTEpisodeLookupUtil *)self _episodeMatchFromPredicate:v9];

    if (v10) {
      goto LABEL_27;
    }
  }
  uint64_t v11 = [v6 storeTrackId];
  if (+[MTStoreIdentifier isNotEmpty:v11])
  {
    v12 = +[MTEpisode predicateForEpisodeStoreTrackId:v11];
    v10 = [(MTEpisodeLookupUtil *)self _episodeMatchFromPredicate:v12 context:v7];

    if (v10) {
      goto LABEL_27;
    }
  }
  if ([v6 persistentID])
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
    v14 = +[MTEpisode predicateForPersistentId:v13];

    v10 = [(MTEpisodeLookupUtil *)self _episodeMatchFromPredicate:v14 context:v7];

    if (v10) {
      goto LABEL_27;
    }
  }
  v15 = [v6 podcastFeedUrl];
  v16 = [v6 episodeGuid];
  if (![v15 length] || !objc_msgSend(v16, "length")) {
    goto LABEL_12;
  }
  v17 = [(MTEpisodeLookupUtil *)self findPodcastWithFeedUrl:v15];
  v18 = v17;
  if (!v17) {
    goto LABEL_11;
  }
  v19 = [v17 uuid];
  v20 = +[MTEpisode predicateForEpisodeGuid:v16 onPodcastUuid:v19];

  v10 = [(MTEpisodeLookupUtil *)self _episodeMatchFromPredicate:v20];

  if (!v10)
  {
LABEL_11:

LABEL_12:
    v18 = [v6 episodeTitle];
    v21 = [v6 podcastTitle];
    v22 = [v6 streamUrl];
    if ([v21 length] && objc_msgSend(v18, "length"))
    {
      uint64_t v34 = +[MTPodcast predicateForPodcastWithTitle:v21];
      v23 = -[MTEpisodeLookupUtil _podcastMatchFromPredicate:](self, "_podcastMatchFromPredicate:");
      if (v23)
      {
        v32 = v16;
        v33 = v23;
        v24 = [v23 uuid];
        uint64_t v25 = +[MTEpisode predicateForEpisodeTitle:v18 onPodcastUuid:v24];

        v31 = (void *)v25;
        v10 = [(MTEpisodeLookupUtil *)self _episodeMatchFromPredicate:v25];
        if (!v10
          || ![v22 length]
          || ([v10 enclosureURL],
              v26 = objc_claimAutoreleasedReturnValue(),
              char v27 = [v26 isEqualToString:v22],
              v26,
              (v27 & 1) == 0))
        {
          if (v22
            || ([v10 enclosureURL],
                v28 = objc_claimAutoreleasedReturnValue(),
                v28,
                v28))
          {

            v10 = 0;
          }
        }
        v16 = v32;
        v29 = (void *)v34;

        v23 = v33;
      }
      else
      {
        v10 = 0;
        v29 = (void *)v34;
      }
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_27:

  return v10;
}

- (id)findPodcastWithFeedUrl:(id)a3
{
  id v4 = +[MTPodcast predicateForPodcastWithFeedUrl:a3];
  v5 = [(MTEpisodeLookupUtil *)self _podcastMatchFromPredicate:v4];

  return v5;
}

- (id)_podcastMatchFromPredicate:(id)a3
{
  return [(MTEpisodeLookupUtil *)self _podcastMatchFromPredicate:a3 context:0];
}

- (id)_podcastMatchFromPredicate:(id)a3 context:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithEntityName:@"MTPodcast"];
  [v9 setPredicate:v8];

  [v9 setFetchLimit:1];
  v10 = [(MTEpisodeLookupUtil *)self _entityForFetchRequest:v9 context:v7];

  return v10;
}

- (id)_episodeMatchFromPredicate:(id)a3
{
  return [(MTEpisodeLookupUtil *)self _episodeMatchFromPredicate:a3 context:0];
}

- (id)_episodeMatchFromPredicate:(id)a3 context:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithEntityName:@"MTEpisode"];
  [v9 setPredicate:v8];

  [v9 setFetchLimit:1];
  v10 = [(MTEpisodeLookupUtil *)self _entityForFetchRequest:v9 context:v7];

  return v10;
}

- (id)_entityForFetchRequest:(id)a3
{
  return [(MTEpisodeLookupUtil *)self _entityForFetchRequest:a3 context:0];
}

- (id)_entityForFetchRequest:(id)a3 context:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = +[MTDB sharedInstance];
    id v6 = [v7 mainOrPrivateContext];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __54__MTEpisodeLookupUtil__entityForFetchRequest_context___block_invoke;
  v17 = &unk_1E5E617F8;
  v20 = &v22;
  id v8 = v6;
  id v18 = v8;
  id v9 = v5;
  id v19 = v9;
  v21 = &v28;
  [v8 performBlockAndWait:&v14];
  if (v29[5])
  {
    v10 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v29[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v11;
      _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_DEFAULT, "Error fetching entity: %@", buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend((id)v23[5], "firstObject", v14, v15, v16, v17, v18);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __54__MTEpisodeLookupUtil__entityForFetchRequest_context___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end