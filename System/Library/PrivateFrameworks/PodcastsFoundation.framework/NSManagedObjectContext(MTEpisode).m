@interface NSManagedObjectContext(MTEpisode)
- (id)episodeForStoreTrackID:()MTEpisode;
- (id)episodesForManagedObjectIDs:()MTEpisode;
- (id)episodesForStoreTrackIDs:()MTEpisode;
- (id)episodesForUuids:()MTEpisode;
- (id)existingEpisodeWithID:()MTEpisode;
- (uint64_t)dictionaryForEpisodeUuid:()MTEpisode;
- (uint64_t)dictionaryWithProperties:()MTEpisode episodeUuid:;
- (uint64_t)episodeForUuid:()MTEpisode;
- (uint64_t)episodeForUuid:()MTEpisode returnsObjectAsFault:;
- (uint64_t)valueForProperty:()MTEpisode episodeUuid:;
@end

@implementation NSManagedObjectContext(MTEpisode)

- (uint64_t)episodeForUuid:()MTEpisode
{
  return [a1 objectForUuid:a3 entityName:@"MTEpisode"];
}

- (id)existingEpisodeWithID:()MTEpisode
{
  if (a3)
  {
    id v7 = 0;
    v3 = [a1 existingObjectWithID:a3 error:&v7];
    id v4 = v7;
    v5 = v4;
    if (!v3 && v4) {
      [v4 logAndThrow:0];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)episodeForUuid:()MTEpisode returnsObjectAsFault:
{
  return [a1 objectForUuid:a3 entityName:@"MTEpisode" returnsObjectAsFault:a4];
}

- (id)episodesForUuids:()MTEpisode
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  v3 = +[MTEpisode predicateForEpisodeUuids:v2];
  id v4 = [a1 objectsInEntity:@"MTEpisode" predicate:v3 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  return v4;
}

- (id)episodesForManagedObjectIDs:()MTEpisode
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C108], "predicateForObjectsWithManagedObjectIDs:");
  v3 = [a1 objectsInEntity:@"MTEpisode" predicate:v2 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  return v3;
}

- (id)episodeForStoreTrackID:()MTEpisode
{
  v2 = +[MTEpisode predicateForEpisodeStoreTrackId:](MTEpisode, "predicateForEpisodeStoreTrackId:");
  v3 = [a1 objectInEntity:@"MTEpisode" predicate:v2];

  return v3;
}

- (id)episodesForStoreTrackIDs:()MTEpisode
{
  v2 = +[MTEpisode predicateForEpisodeStoreTrackIds:](MTEpisode, "predicateForEpisodeStoreTrackIds:");
  v3 = [a1 objectsInEntity:@"MTEpisode" predicate:v2 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  return v3;
}

- (uint64_t)dictionaryForEpisodeUuid:()MTEpisode
{
  return [a1 objectDictionaryForUuid:a3 entityName:@"MTEpisode"];
}

- (uint64_t)dictionaryWithProperties:()MTEpisode episodeUuid:
{
  return [a1 objectDictionaryForUuid:a4 propertiesToFetch:a3 entityName:@"MTEpisode"];
}

- (uint64_t)valueForProperty:()MTEpisode episodeUuid:
{
  return [a1 valueForProperty:a3 objectUuid:a4 entityName:@"MTEpisode"];
}

@end