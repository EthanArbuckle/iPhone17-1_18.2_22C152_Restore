@interface CarouselContentLayout
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSIndexSet)axSpriteIndexes;
- (_TtC12PhotosUICore21CarouselContentLayout)init;
- (_TtC12PhotosUICore21CarouselContentLayout)initWithComposition:(id)a3;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)alphaDidChange;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)update;
- (void)updateContent;
- (void)updateDisplayedPageRange;
- (void)updateDisplayedPages;
- (void)updatePageControl;
@end

@implementation CarouselContentLayout

- (void)updateContent
{
  v2 = self;
  sub_1A9D83C9C();
}

- (void)updateDisplayedPageRange
{
  v2 = self;
  sub_1A9D84218();
}

- (void)updateDisplayedPages
{
}

- (void)updatePageControl
{
  v2 = self;
  sub_1A9D84678();
}

- (void)update
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_updater);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_updateIfNeeded);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for CarouselContentLayout();
    [(PXGCompositeLayout *)&v4 update];
  }
  else
  {
    __break(1u);
  }
}

- (void)alphaDidChange
{
}

- (void)referenceDepthDidChange
{
}

- (void)referenceSizeDidChange
{
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  v8 = (void *)sub_1A9D850F0(a4);

  return v8;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  sub_1A9B21070(0, (unint64_t *)&unk_1E98220B8);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_pageControlConfiguration));
}

- (NSIndexSet)axSpriteIndexes
{
  uint64_t v2 = sub_1AB230A8C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB230A7C();
  v7 = (void *)sub_1AB2309CC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (NSIndexSet *)v7;
}

- (_TtC12PhotosUICore21CarouselContentLayout)initWithComposition:(id)a3
{
  id v3 = a3;
  result = (_TtC12PhotosUICore21CarouselContentLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore21CarouselContentLayout)init
{
  result = (_TtC12PhotosUICore21CarouselContentLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_layoutSpec);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_fullsizeFrameRectsStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_pageControlConfiguration));
  swift_bridgeObjectRelease();
  swift_release();
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_mostFocusedPageChangeHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_updater);
}

@end