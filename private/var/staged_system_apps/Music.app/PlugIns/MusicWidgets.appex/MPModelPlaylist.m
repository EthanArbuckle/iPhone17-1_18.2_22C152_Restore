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
    NSString v5 = sub_100534CA0();
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
  return (NSArray *)sub_1002675C8(self, (uint64_t)a2, MPModelPlaylist.legacyPreferredTracklistSortDescriptors.getter);
}

- (NSArray)preferredTracklistSortDescriptors
{
  return (NSArray *)sub_1002675C8(self, (uint64_t)a2, MPModelPlaylist.preferredTracklistSortDescriptors.getter);
}

- (NSString)shortDescription
{
  return (NSString *)sub_10036AD70(self, (uint64_t)a2, (void (*)(void))sub_10036A660);
}

@end