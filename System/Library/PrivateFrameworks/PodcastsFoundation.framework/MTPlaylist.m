@interface MTPlaylist
+ (id)predicateForIsHidden:(BOOL)a3;
+ (id)predicateForStationUUID:(id)a3;
+ (id)predicateForStationsWithUUIDs:(id)a3;
+ (id)propertiesToObserveForDownloadableEpisodes;
+ (id)sortDescriptors;
+ (id)topLevelPlaylistsPredicate;
- (BOOL)isFolder;
- (BOOL)isITunesPlaylist;
- (BOOL)needsUpdate;
- (void)setMediaLibraryId:(int64_t)a3;
- (void)setNeedsUpdate:(BOOL)a3;
@end

@implementation MTPlaylist

+ (id)topLevelPlaylistsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0 AND %K = 0", @"mediaLibraryId", @"hidden");
}

+ (id)sortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortOrder" ascending:0];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (BOOL)needsUpdate
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 5) & 1;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTPlaylist *)self flags];
  if (((((v5 & 0x20) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 32;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFFDFLL | v6];
  }
}

+ (id)predicateForIsHidden:(BOOL)a3
{
  BOOL v3 = &unk_1F03D86A0;
  if (a3) {
    BOOL v3 = &unk_1F03D8688;
  }
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"hidden", v3];
}

+ (id)predicateForStationUUID:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", a3];
}

+ (id)predicateForStationsWithUUIDs:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"uuid", a3];
}

- (BOOL)isFolder
{
  return [(MTPlaylist *)self flags] & 1;
}

- (BOOL)isITunesPlaylist
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 1) & 1;
}

- (void)setMediaLibraryId:(int64_t)a3
{
  if ([(MTPlaylist *)self mediaLibraryId] != a3)
  {
    [(MTPlaylist *)self willChangeValueForKey:@"mediaLibraryId"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTPlaylist *)self setPrimitiveValue:v5 forKey:@"mediaLibraryId"];

    [(MTPlaylist *)self didChangeValueForKey:@"mediaLibraryId"];
  }
}

+ (id)propertiesToObserveForDownloadableEpisodes
{
  v6[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"uuid";
  v6[1] = @"unplayedCount";
  v6[2] = @"episodes";
  void v6[3] = @"deletedEpisodes";
  v6[4] = @"settings";
  v6[5] = @"sortOrder";
  v6[6] = @"defaultSettings";
  v6[7] = @"containerOrder";
  v6[8] = @"hidden";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:9];
  v4 = [v2 setWithArray:v3];

  return v4;
}

@end