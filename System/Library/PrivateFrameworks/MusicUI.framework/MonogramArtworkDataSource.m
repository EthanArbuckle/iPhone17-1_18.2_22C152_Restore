@interface MonogramArtworkDataSource
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (_TtC7MusicUI25MonogramArtworkDataSource)init;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MonogramArtworkDataSource

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
  return 0;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_229777400(v7, v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_229777E60();
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_229777EE0(v4);

  return v6;
}

- (_TtC7MusicUI25MonogramArtworkDataSource)init
{
  return (_TtC7MusicUI25MonogramArtworkDataSource *)sub_22977843C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI25MonogramArtworkDataSource____lazy_storage___monogramRenderer));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI25MonogramArtworkDataSource_cache);
}

@end