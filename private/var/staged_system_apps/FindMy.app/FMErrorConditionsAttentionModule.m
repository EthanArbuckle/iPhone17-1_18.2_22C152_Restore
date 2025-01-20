@interface FMErrorConditionsAttentionModule
- (_TtC6FindMy32FMErrorConditionsAttentionModule)initWithCoder:(id)a3;
- (_TtC6FindMy32FMErrorConditionsAttentionModule)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation FMErrorConditionsAttentionModule

- (_TtC6FindMy32FMErrorConditionsAttentionModule)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005039F4();
}

- (void)dealloc
{
  v2 = self;
  sub_10050235C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMErrorConditionsAttentionModule_verticalStackView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMErrorConditionsAttentionModule_airplaneModeOnAttention));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy32FMErrorConditionsAttentionModule_bluetoothOffAttention);
}

- (_TtC6FindMy32FMErrorConditionsAttentionModule)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy32FMErrorConditionsAttentionModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end