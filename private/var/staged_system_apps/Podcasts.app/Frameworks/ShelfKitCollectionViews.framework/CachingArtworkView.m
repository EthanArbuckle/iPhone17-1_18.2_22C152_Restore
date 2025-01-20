@interface CachingArtworkView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC23ShelfKitCollectionViews18CachingArtworkView)init;
- (_TtC23ShelfKitCollectionViews18CachingArtworkView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation CachingArtworkView

- (_TtC23ShelfKitCollectionViews18CachingArtworkView)init
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_subscription) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_subscribedRequest;
  uint64_t v4 = sub_37C3C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_imageProvider;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_pageRenderController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_objectGraph) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CachingArtworkView();
  return -[ArtworkView initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC23ShelfKitCollectionViews18CachingArtworkView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews18CachingArtworkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_subscribedRequest, &qword_471D70);
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_imageProvider, &qword_471D78);
  swift_release();

  swift_release();
}

- (CGRect)frame
{
  sub_2861C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v7 = self;
  sub_28798((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_2861C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v7 = self;
  sub_28798((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

@end