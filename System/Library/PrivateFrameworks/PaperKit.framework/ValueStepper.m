@interface ValueStepper
- (_TtC8PaperKit12ValueStepper)initWithCoder:(id)a3;
- (_TtC8PaperKit12ValueStepper)initWithFrame:(CGRect)a3;
- (void)didTapLeftButton;
- (void)didTapRightButton;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ValueStepper

- (_TtC8PaperKit12ValueStepper)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ValueStepper.init(coder:)();
}

- (void)didTapLeftButton
{
  v2 = self;
  ValueStepper.didTapLeftButton()();
}

- (void)didTapRightButton
{
  v2 = self;
  ValueStepper.didTapRightButton()();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ValueStepper *)&v6 traitCollectionDidChange:v4];
  ValueStepper.updateUI()();
}

- (_TtC8PaperKit12ValueStepper)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit12ValueStepper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit12ValueStepper_decreaseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit12ValueStepper_increaseButton));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit12ValueStepper_contentStackView));
  swift_bridgeObjectRelease();
}

@end