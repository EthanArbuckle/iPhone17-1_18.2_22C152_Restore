@interface PhotosPagingSecondaryToolbarController
- (_TtC12PhotosUICore38PhotosPagingSecondaryToolbarController)initWithContainerView:(id)a3 styleGuideProvider:(id)a4;
- (void)isShowingGradientDidChange;
- (void)pageControlValueDidChange;
@end

@implementation PhotosPagingSecondaryToolbarController

- (_TtC12PhotosUICore38PhotosPagingSecondaryToolbarController)initWithContainerView:(id)a3 styleGuideProvider:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC12PhotosUICore38PhotosPagingSecondaryToolbarController *)sub_1AA377078(v5, (uint64_t)a4);
}

- (void)isShowingGradientDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosPagingSecondaryToolbarController();
  v2 = v7.receiver;
  id v3 = [(PXSecondaryToolbarController *)&v7 isShowingGradientDidChange];
  if ((*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x80))(v3))
  {
    uint64_t v5 = v4;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void *, uint64_t, uint64_t))(v5 + 24))(v2, ObjectType, v5);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)pageControlValueDidChange
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x80);
  v6 = self;
  if (v2())
  {
    uint64_t v4 = v3;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC12PhotosUICore38PhotosPagingSecondaryToolbarController *, uint64_t, uint64_t))(v4 + 8))(v6, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_customCenterControl));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_lensControl));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_defaultCenterControl);
}

@end