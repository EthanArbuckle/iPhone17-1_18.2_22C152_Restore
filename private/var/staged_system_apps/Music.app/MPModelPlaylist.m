@interface MPModelPlaylist
- (NSArray)legacyPreferredTracklistSortDescriptors;
- (NSArray)preferredTracklistSortDescriptors;
- (NSString)shortDescription;
- (NSString)sortStorageKeyDomain;
@end

@implementation MPModelPlaylist

- (NSString)sortStorageKeyDomain
{
  v2 = self;
  MPModelPlaylist.sortStorageKeyDomain.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)legacyPreferredTracklistSortDescriptors
{
  return (NSArray *)sub_1009AE284(self, (uint64_t)a2, MPModelPlaylist.legacyPreferredTracklistSortDescriptors.getter);
}

- (NSArray)preferredTracklistSortDescriptors
{
  return (NSArray *)sub_1009AE284(self, (uint64_t)a2, MPModelPlaylist.preferredTracklistSortDescriptors.getter);
}

- (NSString)shortDescription
{
  return (NSString *)sub_100A9CD80(self, (uint64_t)a2, (void (*)(void))sub_100A9C670);
}

@end