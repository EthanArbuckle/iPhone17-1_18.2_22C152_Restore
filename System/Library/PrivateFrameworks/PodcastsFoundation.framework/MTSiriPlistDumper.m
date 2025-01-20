@interface MTSiriPlistDumper
- (MTSiriPlistDumper)initWithBackgroundTaskManager:(id)a3;
- (_TtC18PodcastsFoundation11SiriDonator)siriDonator;
- (id)_childFromPlistAtIndex:(int64_t)a3 plistArray:(id)a4;
- (id)createDiffWithAddedPodcasts:(id)a3 addedStations:(id)a4 removedPodcasts:(id)a5 removedStations:(id)a6;
- (id)subtractDictionary:(id)a3 fromDictionary:(id)a4 uniqueKey:(id)a5;
- (void)dumpPlist;
- (void)writeDiffs:(id)a3 stationItems:(id)a4 existingPodcastItems:(id)a5 existingStationItems:(id)a6;
@end

@implementation MTSiriPlistDumper

uint64_t __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectForKey:*(void *)(a1 + 32)];
}

uint64_t __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKey:*(void *)(a1 + 32)];
}

void __30__MTSiriPlistDumper_dumpPlist__block_invoke(id *a1)
{
  v54[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"MTPodcast"];
  v3 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  [v2 setPredicate:v3];

  v54[0] = @"title";
  v54[1] = @"storeCollectionId";
  v54[2] = @"uuid";
  v54[3] = @"feedURL";
  v54[4] = @"updatedFeedURL";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:5];
  [v2 setPropertiesToFetch:v4];

  v37 = v2;
  [a1[4] executeFetchRequest:v2 error:0];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v51[0] = @"title";
        uint64_t v10 = [v9 title];
        v11 = (void *)v10;
        if (v10) {
          v12 = (__CFString *)v10;
        }
        else {
          v12 = &stru_1F03A51F0;
        }
        v52[0] = v12;
        v51[1] = @"storeId";
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v9, "storeCollectionId"));
        v52[1] = v13;
        v51[2] = @"feedUrl";
        uint64_t v14 = [v9 feedURL];
        v15 = (void *)v14;
        if (v14) {
          v16 = (__CFString *)v14;
        }
        else {
          v16 = &stru_1F03A51F0;
        }
        v52[2] = v16;
        v51[3] = @"uuid";
        uint64_t v17 = [v9 uuid];
        v18 = (void *)v17;
        if (v17) {
          v19 = (__CFString *)v17;
        }
        else {
          v19 = &stru_1F03A51F0;
        }
        v52[3] = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:4];

        [a1[5] addObject:v20];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v6);
  }
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"MTPlaylist"];
  v22 = +[MTPlaylist topLevelPlaylistsPredicate];
  [v21 setPredicate:v22];

  v50[0] = @"title";
  v50[1] = @"uuid";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  [v21 setPropertiesToFetch:v23];

  v24 = [a1[4] executeFetchRequest:v21 error:0];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v47[0] = @"title";
        uint64_t v30 = [v29 title];
        v31 = (void *)v30;
        if (v30) {
          v32 = (__CFString *)v30;
        }
        else {
          v32 = &stru_1F03A51F0;
        }
        v47[1] = @"uuid";
        v48[0] = v32;
        uint64_t v33 = [v29 uuid];
        v34 = (void *)v33;
        if (v33) {
          v35 = (__CFString *)v33;
        }
        else {
          v35 = &stru_1F03A51F0;
        }
        v48[1] = v35;
        v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

        [a1[6] addObject:v36];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v26);
  }
}

- (void)dumpPlist
{
  v35[3] = *MEMORY[0x1E4F143B8];
  if (!+[PFClientUtil isRunningOnHomepod]
    || os_feature_enabled_siri_donation_homepod())
  {
    siriDonator = self->_siriDonator;
    if (siriDonator) {
      [(SiriDonator *)siriDonator startDonation];
    }
  }
  v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = +[MTDB sharedInstance];
  uint64_t v7 = [v6 mainOrPrivateContext];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __30__MTSiriPlistDumper_dumpPlist__block_invoke;
  v24[3] = &unk_1E5E62180;
  id v25 = v7;
  id v8 = v4;
  id v26 = v8;
  id v9 = v5;
  id v27 = v9;
  id v21 = v25;
  [v25 performBlockAndWait:v24];
  v34[0] = @"title";
  v34[1] = @"children";
  v35[0] = @"Library";
  v35[1] = v8;
  v34[2] = @"uuid";
  v35[2] = @"Podcasts";
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
  v32[0] = @"title";
  v32[1] = @"children";
  v33[0] = @"Stations";
  v33[1] = v9;
  v32[2] = @"uuid";
  v33[2] = @"Stations";
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  v30[1] = @"children";
  v31[0] = @"Root";
  v29[0] = v23;
  v29[1] = v22;
  v30[0] = @"title";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v31[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  v12 = +[MTConstants documentsDirectory];
  v13 = [v12 URLByAppendingPathComponent:@"PodcastsDB.plist"];
  uint64_t v14 = [v13 path];

  id v15 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v15 fileExistsAtPath:v14])
  {
    v16 = [v15 contentsAtPath:v14];
    if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v16 options:0 format:0 error:0];
      v18 = [(MTSiriPlistDumper *)self _childFromPlistAtIndex:0 plistArray:v17];
      v19 = [(MTSiriPlistDumper *)self _childFromPlistAtIndex:1 plistArray:v17];
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F1CBF0];
      v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
    v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [(MTSiriPlistDumper *)self writeDiffs:v8 stationItems:v9 existingPodcastItems:v18 existingStationItems:v19];
  [v15 removeItemAtPath:v14 error:0];
  v28 = v11;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  [v20 writeToFile:v14 atomically:1];
}

uint64_t __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = [*(id *)(a1 + 40) containsObject:v3];

  return v4;
}

- (MTSiriPlistDumper)initWithBackgroundTaskManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSiriPlistDumper;
  uint64_t v5 = [(MTSiriPlistDumper *)&v9 init];
  if (v5
    && (!+[PFClientUtil isRunningOnHomepod]
     || os_feature_enabled_siri_donation_homepod()))
  {
    uint64_t v6 = [[_TtC18PodcastsFoundation11SiriDonator alloc] initWithBackgroundTaskManager:v4];
    siriDonator = v5->_siriDonator;
    v5->_siriDonator = v6;
  }
  return v5;
}

- (void)writeDiffs:(id)a3 stationItems:(id)a4 existingPodcastItems:(id)a5 existingStationItems:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v25 = a5;
  id v27 = a6;
  v12 = +[MTConstants documentsDirectory];
  v13 = [v12 URLByAppendingPathComponent:@"PodcastsDiff.plist"];
  uint64_t v14 = [v13 path];

  id v15 = objc_opt_new();
  id v16 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v16 fileExistsAtPath:v14])
  {
    uint64_t v17 = [v16 contentsAtPath:v14];
    if (v17)
    {
      v18 = [MEMORY[0x1E4F28F98] propertyListWithData:v17 options:0 format:0 error:0];
      if ([v18 count])
      {
        uint64_t v19 = [MEMORY[0x1E4F1CA48] arrayWithArray:v18];

        id v15 = (void *)v19;
      }
    }
  }
  if (objc_msgSend(v15, "count", v25) && (unint64_t)objc_msgSend(v15, "count") < 0x65)
  {
    v20 = [(MTSiriPlistDumper *)self subtractDictionary:v26 fromDictionary:v10 uniqueKey:@"uuid"];
    id v21 = [(MTSiriPlistDumper *)self subtractDictionary:v27 fromDictionary:v11 uniqueKey:@"uuid"];
    v22 = [(MTSiriPlistDumper *)self subtractDictionary:v10 fromDictionary:v26 uniqueKey:@"uuid"];
    v23 = [(MTSiriPlistDumper *)self subtractDictionary:v11 fromDictionary:v27 uniqueKey:@"uuid"];
    if (![v20 count]
      && ![v21 count]
      && ![v22 count]
      && ![v23 count])
    {

      goto LABEL_16;
    }
    v24 = [(MTSiriPlistDumper *)self createDiffWithAddedPodcasts:v20 addedStations:v21 removedPodcasts:v22 removedStations:v23];
    [v15 addObject:v24];
  }
  else
  {
    v20 = [(MTSiriPlistDumper *)self createDiffWithAddedPodcasts:v10 addedStations:v11 removedPodcasts:MEMORY[0x1E4F1CBF0] removedStations:MEMORY[0x1E4F1CBF0]];
    [v15 removeAllObjects];
    [v15 addObject:v20];
  }

  [v16 removeItemAtPath:v14 error:0];
  [v15 writeToFile:v14 atomically:1];
LABEL_16:
}

- (id)subtractDictionary:(id)a3 fromDictionary:(id)a4 uniqueKey:(id)a5
{
  id v7 = a5;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke;
  v26[3] = &unk_1E5E637D8;
  id v8 = v7;
  id v27 = v8;
  id v9 = a4;
  id v10 = objc_msgSend(a3, "mt_compactMap:", v26);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_2;
  v24[3] = &unk_1E5E637D8;
  id v12 = v8;
  id v25 = v12;
  v13 = objc_msgSend(v9, "mt_compactMap:", v24);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v13];
  [v14 minusSet:v11];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_3;
  v21[3] = &unk_1E5E63800;
  id v22 = v12;
  id v23 = v14;
  id v15 = v14;
  id v16 = v12;
  uint64_t v17 = objc_msgSend(v9, "mt_filter:", v21);

  if (v17) {
    v18 = v17;
  }
  else {
    v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v19 = v18;

  return v19;
}

- (id)_childFromPlistAtIndex:(int64_t)a3 plistArray:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 objectForKey:@"children"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count] > (unint64_t)a3)
      {
        id v8 = [v7 objectAtIndex:a3];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v8 objectForKey:@"children"];
        }
        else
        {
          id v9 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
      else
      {
        id v9 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)createDiffWithAddedPodcasts:(id)a3 addedStations:(id)a4 removedPodcasts:(id)a5 removedStations:(id)a6
{
  v24[3] = *MEMORY[0x1E4F143B8];
  v23[0] = @"uuid";
  id v9 = NSString;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v9 UUID];
  v24[0] = v14;
  v23[1] = @"podcasts";
  v21[0] = @"inserted";
  v21[1] = @"deleted";
  v22[0] = v13;
  v22[1] = v11;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[1] = v15;
  v23[2] = @"stations";
  v19[0] = @"inserted";
  v19[1] = @"deleted";
  v20[0] = v12;
  v20[1] = v10;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  return v17;
}

- (_TtC18PodcastsFoundation11SiriDonator)siriDonator
{
  return self->_siriDonator;
}

- (void).cxx_destruct
{
}

@end