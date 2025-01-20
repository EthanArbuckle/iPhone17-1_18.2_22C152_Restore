@interface PlaylistCovers.ArtworkDataSource
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (_TtCO9MusicCore14PlaylistCovers17ArtworkDataSource)init;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4;
@end

@implementation PlaylistCovers.ArtworkDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = PlaylistCovers.ArtworkDataSource.existingRepresentation(for:)(v4);

  return v6;
}

- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100063814(&qword_1010C0040);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1010C4248;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1010C4258;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100A05D4C((uint64_t)v9, (uint64_t)&unk_1010C4268, (uint64_t)v14);
  swift_release();
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 token];
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  type metadata accessor for PlaylistCovers.ArtworkToken();
  if (swift_dynamicCast()) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (_TtCO9MusicCore14PlaylistCovers17ArtworkDataSource)init
{
  uint64_t v3 = OBJC_IVAR____TtCO9MusicCore14PlaylistCovers17ArtworkDataSource_cache;
  id v4 = objc_allocWithZone((Class)NSCache);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for PlaylistCovers.ArtworkDataSource();
  return [(PlaylistCovers.ArtworkDataSource *)&v7 init];
}

- (void).cxx_destruct
{
}

@end