@interface SummaryPlatterButtonView
- (_TtC9SeymourUI24SummaryPlatterButtonView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24SummaryPlatterButtonView)initWithFrame:(CGRect)a3;
- (void)handleButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SummaryPlatterButtonView

- (_TtC9SeymourUI24SummaryPlatterButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24SummaryPlatterButtonView *)sub_23A34BBA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24SummaryPlatterButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A34CFDC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A34C82C(a3);
}

- (void)handleButtonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_onTapped);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_239D03E2C((uint64_t)v2);
    v2(v3);
    sub_239C25118((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_styleProvider);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_styleProvider);
  id v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_styleProvider);
  swift_bridgeObjectRelease();

  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_onTapped);

  sub_239C25118(v6);
}

@end