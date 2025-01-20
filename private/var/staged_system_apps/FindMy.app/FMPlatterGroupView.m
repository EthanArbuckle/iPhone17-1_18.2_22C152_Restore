@interface FMPlatterGroupView
- (_TtC6FindMy18FMPlatterGroupView)init;
- (_TtC6FindMy18FMPlatterGroupView)initWithCoder:(id)a3;
- (_TtC6FindMy18FMPlatterGroupView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMPlatterGroupView

- (_TtC6FindMy18FMPlatterGroupView)init
{
  uint64_t v3 = OBJC_IVAR____TtC6FindMy18FMPlatterGroupView_contentStackView;
  id v4 = objc_allocWithZone((Class)UIStackView);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)[v4 init];

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for FMPlatterGroupView();
  v6 = -[FMPlatterGroupView initWithFrame:](&v10, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v7 = *(void (**)(void))((swift_isaMask & (uint64_t)v6->super.super.super.isa) + 0x58);
  v8 = v6;
  v7();
  sub_10011574C();
  (*(void (**)(void))((swift_isaMask & (uint64_t)v8->super.super.super.isa) + 0x68))();

  return v8;
}

- (_TtC6FindMy18FMPlatterGroupView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy18FMPlatterGroupView_contentStackView;
  id v6 = objc_allocWithZone((Class)UIStackView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy18FMPlatterGroupView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1001159E8((uint64_t)a3);
}

- (_TtC6FindMy18FMPlatterGroupView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy18FMPlatterGroupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMPlatterGroupView_contentStackView));
}

@end