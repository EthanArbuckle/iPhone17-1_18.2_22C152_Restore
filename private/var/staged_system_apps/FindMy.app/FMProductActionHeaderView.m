@interface FMProductActionHeaderView
- (_TtC6FindMy25FMProductActionHeaderView)init;
- (_TtC6FindMy25FMProductActionHeaderView)initWithCoder:(id)a3;
- (_TtC6FindMy25FMProductActionHeaderView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMProductActionHeaderView

- (_TtC6FindMy25FMProductActionHeaderView)init
{
  return (_TtC6FindMy25FMProductActionHeaderView *)sub_10047886C();
}

- (_TtC6FindMy25FMProductActionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100479658();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMProductActionHeaderView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMProductActionHeaderView *)&v6 traitCollectionDidChange:v4];
  sub_1004791F4();
}

- (_TtC6FindMy25FMProductActionHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy25FMProductActionHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000AFBAC((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_productImageAdjustmentsURL);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_secondaryLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_productImageView);
}

@end