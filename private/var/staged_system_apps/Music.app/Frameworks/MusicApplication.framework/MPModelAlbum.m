@interface MPModelAlbum
+ (id)requiredLibraryNavigationHandlerProperties;
- (NSString)shortDescription;
- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (id)pickableObjectFor:(int64_t)a3;
- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (void)loadCatalogSongsWithCompletionHandler:(id)a3;
- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4;
- (void)loadLibrarySongsWithCompletionHandler:(id)a3;
@end

@implementation MPModelAlbum

- (id)pickableObjectFor:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (void)loadCatalogSongsWithCompletionHandler:(id)a3
{
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  v10 = MPModelAlbum.orphanMusicVideo.getter();

  if (v10)
  {
    swift_release();
    v11 = 0;
  }
  else
  {
    v13[4] = sub_17CDEC;
    v13[5] = v7;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_1DC200;
    v13[3] = &block_descriptor_140;
    v11 = _Block_copy(v13);
    swift_release();
  }

  return v11;
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
}

- (void)loadLibrarySongsWithCompletionHandler:(id)a3
{
}

- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  v10 = MPModelAlbum.orphanMusicVideo.getter();

  if (v10)
  {
    swift_release();
    v11 = 0;
  }
  else
  {
    v13[4] = sub_17CDEC;
    v13[5] = v7;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_1DC200;
    v13[3] = &block_descriptor_113_0;
    v11 = _Block_copy(v13);
    swift_release();
  }

  return v11;
}

+ (id)requiredLibraryNavigationHandlerProperties
{
  id v2 = sub_17B900();

  return v2;
}

- (NSString)shortDescription
{
  id v2 = self;
  id v3 = [(MPModelAlbum *)v2 title];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = sub_AB6510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = (void *)0xEE006D75626C4120;
    uint64_t v5 = 0x64656C7469746E55;
  }
  v11._countAndFlagsBits = v5;
  v11._object = v7;
  sub_AB6700(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 34;
  v12._object = (void *)0xE100000000000000;
  sub_AB6700(v12);

  NSString v8 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

@end