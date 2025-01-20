@interface PlusMinusButton
- (BOOL)isEnabled;
- (_TtC13SleepHealthUI15PlusMinusButton)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI15PlusMinusButton)initWithFrame:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation PlusMinusButton

- (_TtC13SleepHealthUI15PlusMinusButton)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI15PlusMinusButton *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlusMinusButton();
  return [(PlusMinusButton *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlusMinusButton();
  id v4 = v7.receiver;
  [(PlusMinusButton *)&v7 setEnabled:v3];
  unsigned int v5 = objc_msgSend(v4, sel_isEnabled, v7.receiver, v7.super_class);
  double v6 = 0.5;
  if (v5) {
    double v6 = 1.0;
  }
  objc_msgSend(v4, sel_setAlpha_, v6);
}

- (_TtC13SleepHealthUI15PlusMinusButton)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI15PlusMinusButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end