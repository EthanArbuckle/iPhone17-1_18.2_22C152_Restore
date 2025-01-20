@interface TTRILocationTableCell
- (BOOL)ttriAccessibilityIsSpeakThisElement;
- (CGPoint)accessibilityActivationPoint;
- (_TtC15RemindersUICore21TTRILocationTableCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore21TTRILocationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRILocationTableCell

- (_TtC15RemindersUICore21TTRILocationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1B996E9F0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC15RemindersUICore21TTRILocationTableCell *)sub_1B97EC99C(v4, v5);
}

- (_TtC15RemindersUICore21TTRILocationTableCell)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICore21TTRILocationTableCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore21TTRILocationTableCell_infoButton));
}

- (CGPoint)accessibilityActivationPoint
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore21TTRILocationTableCell_infoButton), sel_accessibilityActivationPoint);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)ttriAccessibilityIsSpeakThisElement
{
  return 1;
}

@end