@interface AssetActivityItemProviderWrapper
- (_NSRange)pageRangeForAnnotation:(id)a3;
- (_TtC5Books32AssetActivityItemProviderWrapper)init;
- (id)chapterTitleForAnnotation:(id)a3;
@end

@implementation AssetActivityItemProviderWrapper

- (_TtC5Books32AssetActivityItemProviderWrapper)init
{
  result = (_TtC5Books32AssetActivityItemProviderWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_paginationService);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_bookProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_progressKitController));

  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_cachedStoreShortURL, (uint64_t *)&unk_100B26930);
}

- (_NSRange)pageRangeForAnnotation:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = sub_10023D1D8(a3);
  NSUInteger v8 = v7;
  swift_unknownObjectRelease();

  NSUInteger v9 = (NSUInteger)v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)chapterTitleForAnnotation:(id)a3
{
  v3 = self;
  v4 = (void *)swift_unknownObjectRetain();
  sub_10023D494(v4);
  uint64_t v6 = v5;
  swift_unknownObjectRelease();

  if (v6)
  {
    NSString v7 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

@end