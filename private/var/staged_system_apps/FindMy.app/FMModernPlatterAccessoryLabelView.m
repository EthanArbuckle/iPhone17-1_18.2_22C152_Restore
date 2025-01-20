@interface FMModernPlatterAccessoryLabelView
- (_TtC6FindMy33FMModernPlatterAccessoryLabelView)initWithCoder:(id)a3;
- (_TtC6FindMy33FMModernPlatterAccessoryLabelView)initWithFrame:(CGRect)a3;
@end

@implementation FMModernPlatterAccessoryLabelView

- (_TtC6FindMy33FMModernPlatterAccessoryLabelView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_label;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_chevron;
  id v9 = sub_1003E798C();
  v10 = (objc_class *)[objc_allocWithZone((Class)UIImageView) initWithImage:v9];

  *(Class *)((char *)&self->super.super.super.super.isa + v8) = v10;
  result = (_TtC6FindMy33FMModernPlatterAccessoryLabelView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy33FMModernPlatterAccessoryLabelView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy33FMModernPlatterAccessoryLabelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_label));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_chevron);
}

@end