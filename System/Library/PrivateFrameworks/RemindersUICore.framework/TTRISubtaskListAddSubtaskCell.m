@interface TTRISubtaskListAddSubtaskCell
- (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation TTRISubtaskListAddSubtaskCell

- (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1B996E9F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell *)sub_1B91DFE6C(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell_isForGroceries) = 0;
  id v4 = a3;

  result = (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B91E017C();
}

@end