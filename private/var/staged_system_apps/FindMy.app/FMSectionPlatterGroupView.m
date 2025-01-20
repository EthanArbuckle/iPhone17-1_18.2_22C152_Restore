@interface FMSectionPlatterGroupView
- (_TtC6FindMy25FMSectionPlatterGroupView)init;
- (_TtC6FindMy25FMSectionPlatterGroupView)initWithCoder:(id)a3;
- (_TtC6FindMy25FMSectionPlatterGroupView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMSectionPlatterGroupView

- (_TtC6FindMy25FMSectionPlatterGroupView)init
{
  return (_TtC6FindMy25FMSectionPlatterGroupView *)sub_1004DF594();
}

- (_TtC6FindMy25FMSectionPlatterGroupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004DF9B0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1004DF748((uint64_t)a3);
}

- (_TtC6FindMy25FMSectionPlatterGroupView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy25FMSectionPlatterGroupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMSectionPlatterGroupView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMSectionPlatterGroupView_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMSectionPlatterGroupView_contentStackView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy25FMSectionPlatterGroupView_contentView);
}

@end