@interface TVSummaryFooterView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI19TVSummaryFooterView)initWithCoder:(id)a3;
- (_TtC9SeymourUI19TVSummaryFooterView)initWithFrame:(CGRect)a3;
- (void)cooldownButtonTapped;
- (void)doneButtonTapped;
@end

@implementation TVSummaryFooterView

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_239F8A8D4();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v3 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC9SeymourUI19TVSummaryFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19TVSummaryFooterView *)sub_239F8AA28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19TVSummaryFooterView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onDoneButtonTap);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onCooldownButtonTap);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC9SeymourUI19TVSummaryFooterView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)doneButtonTapped
{
}

- (void)cooldownButtonTapped
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_cooldownButton));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onDoneButtonTap));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onCooldownButtonTap);

  sub_239C25118(v3);
}

@end