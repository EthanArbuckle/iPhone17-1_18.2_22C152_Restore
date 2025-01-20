@interface PhoneSessionContinueOnWatchView
- (_TtC9SeymourUI31PhoneSessionContinueOnWatchView)initWithCoder:(id)a3;
- (_TtC9SeymourUI31PhoneSessionContinueOnWatchView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PhoneSessionContinueOnWatchView

- (_TtC9SeymourUI31PhoneSessionContinueOnWatchView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239CB9230();
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PhoneSessionContinueOnWatchView();
  id v4 = a3;
  id v5 = v12.receiver;
  [(PhoneSessionContinueOnWatchView *)&v12 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v12.receiver, v12.super_class);
  objc_msgSend(v5, sel_bounds);
  BOOL v11 = sub_23A623F04(v6, v7, v8, v9, v10);
  sub_23A733B9C(v11, MEMORY[0x263F8EE78], a3);

  objc_msgSend(v5, sel_setNeedsUpdateConstraints);
}

- (_TtC9SeymourUI31PhoneSessionContinueOnWatchView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI31PhoneSessionContinueOnWatchView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI31PhoneSessionContinueOnWatchView_titleLabel);
}

@end