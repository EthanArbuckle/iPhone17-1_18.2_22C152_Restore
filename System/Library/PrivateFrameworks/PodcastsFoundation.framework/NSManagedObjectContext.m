@interface NSManagedObjectContext
@end

@implementation NSManagedObjectContext

void __55__NSManagedObjectContext_MTPodcast__podcastForFeedUrl___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = +[MTPodcast predicateForPodcastWithFeedUrl:a1[5]];
  id v7 = [v2 objectsInEntity:@"MTPodcast" predicate:v3 sortDescriptors:0];

  uint64_t v4 = [v7 firstObject];
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __55__NSManagedObjectContext_MTPodcast__podcastForStoreId___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = +[MTPodcast predicateForPodcastStoreId:a1[6]];
  id v7 = [v2 objectsInEntity:@"MTPodcast" predicate:v3 sortDescriptors:0 returnsObjectsAsFaults:0 limit:1];

  uint64_t v4 = [v7 firstObject];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __67__NSManagedObjectContext_MTAdditions__performBlockAndWaitWithSave___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1AD11A870]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = *(void **)(a1 + 32);
  return [v3 saveInCurrentBlock];
}

uint64_t __53__NSManagedObjectContext_MTPlaylist__deletePlaylist___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

void __73__NSManagedObjectContext_MTAdditions__titlesOfObjectsInEntity_predicate___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = [v4 valueForKey:@"title"];
  uint64_t v7 = *(void *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (v5) {
    [v5 logAndThrow:1];
  }
}

void __55__NSManagedObjectContext_MTChannel__channelForStoreId___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = +[MTChannel predicateForChannelWithStoreId:a1[6]];
  id v7 = [v2 objectsInEntity:@"MTChannel" predicate:v3 sortDescriptors:0 returnsObjectsAsFaults:1 limit:1];

  uint64_t v4 = [v7 firstObject];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __58__NSManagedObjectContext_MTPodcast__podcastForPodcastPID___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = +[MTPodcast predicateForPodcastWithPodcastPID:a1[6]];
  id v7 = [v2 objectsInEntity:@"MTPodcast" predicate:v3 sortDescriptors:0];

  uint64_t v4 = [v7 firstObject];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end