@interface FMListFooterActionsView
- (_TtC6FindMy23FMListFooterActionsView)init;
- (_TtC6FindMy23FMListFooterActionsView)initWithCoder:(id)a3;
- (_TtC6FindMy23FMListFooterActionsView)initWithFrame:(CGRect)a3;
@end

@implementation FMListFooterActionsView

- (_TtC6FindMy23FMListFooterActionsView)init
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMListFooterActionsView_actions) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMListFooterActionsView();
  v2 = -[FMListFooterActionsView initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [(FMListFooterActionsView *)v2 setAxis:1];
  [(FMListFooterActionsView *)v2 setAlignment:0];

  return v2;
}

- (void).cxx_destruct
{
}

- (_TtC6FindMy23FMListFooterActionsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMListFooterActionsView_actions) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC6FindMy23FMListFooterActionsView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy23FMListFooterActionsView)initWithFrame:(CGRect)a3
{
}

@end