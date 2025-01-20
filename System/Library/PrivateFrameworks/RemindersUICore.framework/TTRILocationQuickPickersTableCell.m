@interface TTRILocationQuickPickersTableCell
+ (Class)containerViewClass;
- (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRILocationQuickPickersTableCell

+ (Class)containerViewClass
{
  sub_1B90BFD68(0, &qword_1E9F07280);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell *)TTRILocationQuickPickersTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRILocationQuickPickersTableCell_labeledIconsView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRILocationQuickPickersTableCell_scrollView);
}

@end