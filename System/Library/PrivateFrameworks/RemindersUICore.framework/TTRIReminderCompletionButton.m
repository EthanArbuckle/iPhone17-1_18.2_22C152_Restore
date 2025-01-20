@interface TTRIReminderCompletionButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityUserInputLabels;
- (_TtC15RemindersUICore28TTRIReminderCompletionButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore28TTRIReminderCompletionButton)initWithFrame:(CGRect)a3;
- (void)onButtonPress:(id)a3;
- (void)updateConfiguration;
@end

@implementation TTRIReminderCompletionButton

- (_TtC15RemindersUICore28TTRIReminderCompletionButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_preferredSymbolConfiguration) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_scale) = 1;
  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_icon) = xmmword_1B998B580;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_prefersFadedAppearance) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_togglesSelectionOnPress) = 1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[TTRIExpandedHitTestButton initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  sub_1B96B357C();

  return v9;
}

- (_TtC15RemindersUICore28TTRIReminderCompletionButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s15RemindersUICore28TTRIReminderCompletionButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(TTRIReminderCompletionButton *)self intrinsicContentSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)updateConfiguration
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRIReminderCompletionButton *)&v3 updateConfiguration];
  sub_1B96B38C4();
}

- (NSArray)accessibilityUserInputLabels
{
  id v2 = self;
  uint64_t v3 = TTRIReminderCompletionButton.accessibilityUserInputLabels.getter();

  if (v3)
  {
    double v4 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)onButtonPress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B96B50F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_preferredSymbolConfiguration));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_icon);
  id v4 = *(char **)((char *)&self->super.super.super.super.super._responderFlags
                + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_icon);

  sub_1B94D6AEC(v3, v4);
}

@end