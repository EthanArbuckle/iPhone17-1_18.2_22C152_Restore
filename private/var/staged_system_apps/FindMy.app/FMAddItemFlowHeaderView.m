@interface FMAddItemFlowHeaderView
- (_TtC6FindMy23FMAddItemFlowHeaderView)init;
- (_TtC6FindMy23FMAddItemFlowHeaderView)initWithCoder:(id)a3;
- (_TtC6FindMy23FMAddItemFlowHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation FMAddItemFlowHeaderView

- (_TtC6FindMy23FMAddItemFlowHeaderView)init
{
  return (_TtC6FindMy23FMAddItemFlowHeaderView *)sub_1003C5218();
}

- (_TtC6FindMy23FMAddItemFlowHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_headerLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_subheaderLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UILabel) init];

  result = (_TtC6FindMy23FMAddItemFlowHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy23FMAddItemFlowHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy23FMAddItemFlowHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_headerLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_subheaderLabel);
}

@end