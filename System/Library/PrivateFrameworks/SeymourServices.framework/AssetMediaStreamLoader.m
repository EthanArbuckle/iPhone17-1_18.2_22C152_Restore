@interface AssetMediaStreamLoader
- (_TtC15SeymourServices22AssetMediaStreamLoader)init;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 willDownloadToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation AssetMediaStreamLoader

- (_TtC15SeymourServices22AssetMediaStreamLoader)init
{
  result = (_TtC15SeymourServices22AssetMediaStreamLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader_assetFileStore);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader_persistenceStore);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader____lazy_storage___userInitiatedSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader____lazy_storage___systemPrefetchSession));
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1D6E0B694(v8, v9, a5);
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  uint64_t v8 = sub_1D6FA02E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D6FA0280();
  v16 = self;
  id v17 = a4;
  v18 = v11;
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1D6FA6C00();

  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8
{
  sub_1D67D9774(0, &qword_1EA805ED8);
  unint64_t v12 = sub_1D6FA9B90();
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  v16 = self;
  sub_1D6E5F6EC(v14, v12);

  swift_bridgeObjectRelease();
}

@end