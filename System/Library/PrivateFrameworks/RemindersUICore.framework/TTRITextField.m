@interface TTRITextField
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC15RemindersUICore13TTRITextField)initWithCoder:(id)a3;
- (_TtC15RemindersUICore13TTRITextField)initWithFrame:(CGRect)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityUserInputLabels:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation TTRITextField

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1B932ACA0(self, (uint64_t)a2, (void (*)(void))TTRITextField.accessibilityLabel.getter);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1B932ACA0(self, (uint64_t)a2, (void (*)(void))TTRITextField.accessibilityValue.getter);
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = TTRITextField.accessibilityUserInputLabels.getter();

  if (v3)
  {
    v4 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  if (a3)
  {
    sub_1B996EE50();
    v4 = self;
    v5 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRITextField();
  [(TTRITextField *)&v7 setAccessibilityUserInputLabels:v5];
}

- (_TtC15RemindersUICore13TTRITextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore13TTRITextField_ttriAccessibilityLabeledWithPlaceholder) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRITextField();
  return -[TTRITextField initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore13TTRITextField)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore13TTRITextField_ttriAccessibilityLabeledWithPlaceholder) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRITextField();
  return [(TTRITextField *)&v5 initWithCoder:a3];
}

@end