@interface NEFeedNavImageAssetHandle
- (NEFeedNavImageAssetHandle)init;
- (NEFeedNavImageAssetHandle)initWithIdentifier:(id)a3 feedNavImage:(id)a4 feedNavImageSize:(CGSize)a5 feedNavImageStyler:(id)a6 scale:(double)a7;
- (NEFeedNavImageAssetHandle)initWithTag:(id)a3 feedNavImageSize:(CGSize)a4 feedNavImageStyler:(id)a5 scale:(double)a6 overrideFallbackColor:(id)a7;
@end

@implementation NEFeedNavImageAssetHandle

- (NEFeedNavImageAssetHandle)initWithIdentifier:(id)a3 feedNavImage:(id)a4 feedNavImageSize:(CGSize)a5 feedNavImageStyler:(id)a6 scale:(double)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v12 = sub_1DFDFDD20();
  uint64_t v14 = v13;
  id v15 = a4;
  swift_unknownObjectRetain();
  v16 = (NEFeedNavImageAssetHandle *)sub_1DF53D7A8(v12, v14, v15, (uint64_t)a6, width, height, a7);

  swift_unknownObjectRelease();
  return v16;
}

- (NEFeedNavImageAssetHandle)initWithTag:(id)a3 feedNavImageSize:(CGSize)a4 feedNavImageStyler:(id)a5 scale:(double)a6 overrideFallbackColor:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v13 = a7;
  uint64_t v14 = (NEFeedNavImageAssetHandle *)sub_1DF53D698((uint64_t)a3, (uint64_t)a5, a7, width, height, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v14;
}

- (NEFeedNavImageAssetHandle)init
{
  result = (NEFeedNavImageAssetHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NEFeedNavImageAssetHandle_overrideFallbackColor);
}

@end