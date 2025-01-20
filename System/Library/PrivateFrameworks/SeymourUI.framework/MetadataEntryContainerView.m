@interface MetadataEntryContainerView
- (UIView)viewForFirstBaselineLayout;
- (UIView)viewForLastBaselineLayout;
- (_TtC9SeymourUI26MetadataEntryContainerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI26MetadataEntryContainerView)initWithFrame:(CGRect)a3;
@end

@implementation MetadataEntryContainerView

- (UIView)viewForFirstBaselineLayout
{
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_views;
  swift_beginAccess();
  if (*(void *)(*(void *)v3 + 16))
  {
    v4 = (UIView *)*(id *)(*(void *)v3 + 32);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)type metadata accessor for MetadataEntryContainerView();
    v4 = [(MetadataEntryContainerView *)&v6 viewForFirstBaselineLayout];
  }

  return v4;
}

- (UIView)viewForLastBaselineLayout
{
  v2 = self;
  id v3 = sub_23A29E8E0();

  return (UIView *)v3;
}

- (_TtC9SeymourUI26MetadataEntryContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_layout) = (Class)0x4024000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_views) = (Class)MEMORY[0x263F8EE78];
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_onAction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC9SeymourUI26MetadataEntryContainerView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI26MetadataEntryContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI26MetadataEntryContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_onAction);

  sub_239C25118(v3);
}

@end