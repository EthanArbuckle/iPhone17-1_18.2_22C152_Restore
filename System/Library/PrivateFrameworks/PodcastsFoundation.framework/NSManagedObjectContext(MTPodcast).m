@interface NSManagedObjectContext(MTPodcast)
- (id)podcastForFeedUrl:()MTPodcast;
- (id)podcastForPodcastPID:()MTPodcast;
- (id)podcastForStoreId:()MTPodcast;
- (uint64_t)_nextSortOrderWithRequest:()MTPodcast;
- (uint64_t)countOfPodcasts;
- (uint64_t)countOfSubscribedAndNotHiddenPodcasts;
- (uint64_t)dictionaryForPodcastUuid:()MTPodcast;
- (uint64_t)dictionaryWithProperties:()MTPodcast podcastUuid:;
- (uint64_t)nextSortOrderForPodcasts;
- (uint64_t)podcastForUuid:()MTPodcast;
- (uint64_t)valueForProperty:()MTPodcast podcastUuid:;
@end

@implementation NSManagedObjectContext(MTPodcast)

- (uint64_t)podcastForUuid:()MTPodcast
{
  return [a1 objectForUuid:a3 entityName:@"MTPodcast"];
}

- (id)podcastForFeedUrl:()MTPodcast
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NSManagedObjectContext_MTPodcast__podcastForFeedUrl___block_invoke;
  v8[3] = &unk_1E5E61780;
  v8[4] = a1;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)podcastForStoreId:()MTPodcast
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__NSManagedObjectContext_MTPodcast__podcastForStoreId___block_invoke;
  v5[3] = &unk_1E5E617A8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = a1;
  [a1 performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)podcastForPodcastPID:()MTPodcast
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__NSManagedObjectContext_MTPodcast__podcastForPodcastPID___block_invoke;
  v5[3] = &unk_1E5E617A8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = a1;
  [a1 performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (uint64_t)dictionaryForPodcastUuid:()MTPodcast
{
  return [a1 objectDictionaryForUuid:a3 entityName:@"MTPodcast"];
}

- (uint64_t)dictionaryWithProperties:()MTPodcast podcastUuid:
{
  return [a1 objectDictionaryForUuid:a4 propertiesToFetch:a3 entityName:@"MTPodcast"];
}

- (uint64_t)valueForProperty:()MTPodcast podcastUuid:
{
  return [a1 valueForProperty:a3 objectUuid:a4 entityName:@"MTPodcast"];
}

- (uint64_t)countOfPodcasts
{
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"MTPodcast"];
  id v3 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  [v2 setPredicate:v3];

  uint64_t v4 = [a1 countForFetchRequest:v2 error:0];
  return v4;
}

- (uint64_t)countOfSubscribedAndNotHiddenPodcasts
{
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"MTPodcast"];
  id v3 = +[MTPodcast predicateForSubscribedAndNotHidden];
  [v2 setPredicate:v3];

  uint64_t v4 = [a1 countForFetchRequest:v2 error:0];
  return v4;
}

- (uint64_t)nextSortOrderForPodcasts
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"MTPodcast"];
  id v3 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  [v2 setPredicate:v3];

  uint64_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortOrder" ascending:0];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v2 setSortDescriptors:v5];

  [v2 setFetchLimit:1];
  uint64_t v6 = [a1 _nextSortOrderWithRequest:v2];

  return v6;
}

- (uint64_t)_nextSortOrderWithRequest:()MTPodcast
{
  uint64_t v9 = 0;
  id v3 = [a1 executeFetchRequest:a3 error:&v9];
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 firstObject];
    uint64_t v6 = [v5 valueForKey:@"sortOrder"];
    uint64_t v7 = [v6 unsignedIntegerValue] + 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end