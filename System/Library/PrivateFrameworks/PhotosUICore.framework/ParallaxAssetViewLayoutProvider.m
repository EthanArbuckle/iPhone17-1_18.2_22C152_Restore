@interface ParallaxAssetViewLayoutProvider
- (_TtC12PhotosUICore31ParallaxAssetViewLayoutProvider)init;
- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8;
@end

@implementation ParallaxAssetViewLayoutProvider

- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  swift_unknownObjectRetain();
  id v17 = a6;
  v18 = self;
  sub_1A9D67280(v16, a5, (uint64_t)v17, a7, x, y, width, height);

  swift_unknownObjectRelease();
  sub_1A9B21070(0, (unint64_t *)&unk_1E9821C08);
  v19 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return v19;
}

- (_TtC12PhotosUICore31ParallaxAssetViewLayoutProvider)init
{
  result = (_TtC12PhotosUICore31ParallaxAssetViewLayoutProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore31ParallaxAssetViewLayoutProvider_renderContext);
}

@end