@interface PhoneSessionOngoingWorkoutDetectedView
- (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView)initWithCoder:(id)a3;
- (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PhoneSessionOngoingWorkoutDetectedView

- (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A734BBC();
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PhoneSessionOngoingWorkoutDetectedView();
  id v4 = a3;
  id v5 = v12.receiver;
  [(PhoneSessionOngoingWorkoutDetectedView *)&v12 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v12.receiver, v12.super_class);
  objc_msgSend(v5, sel_bounds);
  BOOL v11 = sub_23A623F04(v6, v7, v8, v9, v10);
  sub_23A733BB8(v11, MEMORY[0x263F8EE78], a3, &OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_previousBounds, &OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_landscapeConstraints, &OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_portraitConstraints);

  objc_msgSend(v5, sel_setNeedsUpdateConstraints);
}

- (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_stackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_descriptionLabel);
}

@end