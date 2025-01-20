@interface CarouselSinglePageLayout
- (_TtC12PhotosUICore24CarouselSinglePageLayout)init;
- (void)displayScaleDidChange;
- (void)entityManagerDidChange;
- (void)updateIfNeeded;
- (void)updateMaskingEffects;
@end

@implementation CarouselSinglePageLayout

- (_TtC12PhotosUICore24CarouselSinglePageLayout)init
{
  return (_TtC12PhotosUICore24CarouselSinglePageLayout *)CarouselSinglePageLayout.init()();
}

- (void)updateMaskingEffects
{
  v2 = self;
  sub_1A9FE9584();
}

- (void)displayScaleDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CarouselSinglePageLayout();
  v2 = v4.receiver;
  id v3 = [(PXGLayout *)&v4 displayScaleDidChange];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xD0))(v3);
}

- (void)updateIfNeeded
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore24CarouselSinglePageLayout_updater);
  if (v2)
  {
    id v3 = self;
    objc_msgSend(v2, sel_updateIfNeeded);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for CarouselSinglePageLayout();
    [(PXGLayout *)&v4 updateIfNeeded];
  }
  else
  {
    __break(1u);
  }
}

- (void)entityManagerDidChange
{
  v2 = self;
  sub_1A9FE983C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore24CarouselSinglePageLayout_updater);
}

@end