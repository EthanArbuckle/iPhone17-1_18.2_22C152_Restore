@interface PhotosPageContainerView.Configuration
- (PXGSingleViewLayout)weakLayout;
- (_TtCC12PhotosUICore23PhotosPageContainerView13Configuration)init;
- (void)setWeakLayout:(id)a3;
@end

@implementation PhotosPageContainerView.Configuration

- (PXGSingleViewLayout)weakLayout
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_weakLayout);
  swift_beginAccess();
  return (PXGSingleViewLayout *)*v2;
}

- (void)setWeakLayout:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_weakLayout);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtCC12PhotosUICore23PhotosPageContainerView13Configuration)init
{
  result = (_TtCC12PhotosUICore23PhotosPageContainerView13Configuration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_weakLayout));
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_willAdd));
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_didAdd));
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_willRemove));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_didRemove);
  sub_1A9BB8934(v3);
}

@end