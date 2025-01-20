@interface NSManagedObjectContext(MTSyncInfo)
- (id)_allOrderedSyncInfoSinceRevision:()MTSyncInfo revisionProperty:;
- (id)syncInfosByUuids:()MTSyncInfo;
- (uint64_t)_largestRevisionForRevisionProperty:()MTSyncInfo;
- (uint64_t)allOrderedSyncInfoSinceRevision:()MTSyncInfo;
- (uint64_t)allOrderedSyncInfoWithArtworkUpdatesSinceRevision:()MTSyncInfo;
- (uint64_t)currentSyncAnchorRevision;
@end

@implementation NSManagedObjectContext(MTSyncInfo)

- (uint64_t)currentSyncAnchorRevision
{
  uint64_t v2 = [a1 _largestRevisionForRevisionProperty:@"updateRevision"];
  uint64_t result = [a1 _largestRevisionForRevisionProperty:@"artworkUpdateRevision"];
  if (v2 > result) {
    return v2;
  }
  return result;
}

- (uint64_t)allOrderedSyncInfoSinceRevision:()MTSyncInfo
{
  return [a1 _allOrderedSyncInfoSinceRevision:a3 revisionProperty:@"updateRevision"];
}

- (uint64_t)allOrderedSyncInfoWithArtworkUpdatesSinceRevision:()MTSyncInfo
{
  return [a1 _allOrderedSyncInfoSinceRevision:a3 revisionProperty:@"artworkUpdateRevision"];
}

- (id)syncInfosByUuids:()MTSyncInfo
{
  v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = [a3 allObjects];
  v6 = [v4 predicateWithFormat:@"(%K in %@)", @"uuid", v5];

  v7 = [a1 objectsInEntity:@"MTSyncInfo" predicate:v6 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  return v7;
}

- (id)_allOrderedSyncInfoSinceRevision:()MTSyncInfo revisionProperty:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = a4;
  v9 = [v7 numberWithLongLong:a3];
  v10 = [v6 predicateWithFormat:@"%K > %@", v8, v9];

  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v8 ascending:1];

  v15[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  v13 = [a1 objectsInEntity:@"MTSyncInfo" predicate:v10 sortDescriptors:v12];

  return v13;
}

- (uint64_t)_largestRevisionForRevisionProperty:()MTSyncInfo
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] truePredicate];
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v4 ascending:0];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  id v8 = [a1 objectsInEntity:@"MTSyncInfo" predicate:v5 sortDescriptors:v7 returnsObjectsAsFaults:0 limit:1];
  v9 = [v8 firstObject];

  if (v9)
  {
    v10 = [v9 valueForKey:v4];
    uint64_t v11 = [v10 longLongValue];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end