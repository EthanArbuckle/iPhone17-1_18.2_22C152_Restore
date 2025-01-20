@interface SwitchCell
- (_TtC28MomentsOnboardingAndSettings10SwitchCell)initWithCoder:(id)a3;
- (_TtC28MomentsOnboardingAndSettings10SwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SwitchCell

- (_TtC28MomentsOnboardingAndSettings10SwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
    void *v7 = 0;
    v7[1] = 0;
    v8 = (void *)MEMORY[0x25A2AF5D0](v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
    void *v9 = 0;
    v9[1] = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SwitchCell();
  v10 = [(SwitchCell *)&v12 initWithStyle:a3 reuseIdentifier:v8];

  return v10;
}

- (_TtC28MomentsOnboardingAndSettings10SwitchCell)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
  uint64_t v6 = (objc_class *)type metadata accessor for SwitchCell();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(SwitchCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange));
}

@end