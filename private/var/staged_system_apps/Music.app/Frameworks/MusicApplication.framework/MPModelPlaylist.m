@interface MPModelPlaylist
- (NSArray)legacyPreferredTracklistSortDescriptors;
- (NSArray)preferredTracklistSortDescriptors;
- (NSString)ownerName;
- (NSString)shortDescription;
- (NSString)sortStorageKeyDomain;
- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (void)loadCatalogSongsWithCompletionHandler:(id)a3;
- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4;
- (void)loadLibrarySongsWithCompletionHandler:(id)a3;
@end

@implementation MPModelPlaylist

- (NSString)ownerName
{
  v2 = self;
  sub_D04B0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)loadCatalogSongsWithCompletionHandler:(id)a3
{
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_17AE68((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_CD8BD0, (uint64_t)sub_17CDEC, (uint64_t)&block_descriptor_65);
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
}

- (void)loadLibrarySongsWithCompletionHandler:(id)a3
{
}

- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_17AE68((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_CD8A18, (uint64_t)sub_17C9C0, (uint64_t)&block_descriptor_30_0);
}

- (NSString)sortStorageKeyDomain
{
  v2 = self;
  MPModelPlaylist.sortStorageKeyDomain.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_AB64D0();
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
  return (NSArray *)sub_6CE358(self, (uint64_t)a2, MPModelPlaylist.legacyPreferredTracklistSortDescriptors.getter);
}

- (NSArray)preferredTracklistSortDescriptors
{
  return (NSArray *)sub_6CE358(self, (uint64_t)a2, MPModelPlaylist.preferredTracklistSortDescriptors.getter);
}

- (NSString)shortDescription
{
  return (NSString *)sub_7CFD48(self, (uint64_t)a2, (void (*)(void))sub_7CF638);
}

@end