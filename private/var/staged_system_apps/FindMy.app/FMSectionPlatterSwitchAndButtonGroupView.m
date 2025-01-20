@interface FMSectionPlatterSwitchAndButtonGroupView
- (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView)initWithCoder:(id)a3;
- (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView)initWithFrame:(CGRect)a3;
- (void)handleActionWithSender:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMSectionPlatterSwitchAndButtonGroupView

- (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001763E0();
}

- (void)handleActionWithSender:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 16);
    id v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10017602C((uint64_t)a3);
}

- (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_switchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_actionButton));
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_delegate;

  sub_100068760((uint64_t)v3);
}

@end