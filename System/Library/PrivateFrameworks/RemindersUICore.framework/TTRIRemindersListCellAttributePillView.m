@interface TTRIRemindersListCellAttributePillView
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC15RemindersUICore38TTRIRemindersListCellAttributePillView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore38TTRIRemindersListCellAttributePillView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIRemindersListCellAttributePillView

- (_TtC15RemindersUICore38TTRIRemindersListCellAttributePillView)initWithFrame:(CGRect)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_iconView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_labelView) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_iconViewHidden) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_stackView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIRemindersListCellAttributePillView();
  v3 = -[TTRIRemindersListCellAttributePillView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1B94E4878();

  return v3;
}

- (_TtC15RemindersUICore38TTRIRemindersListCellAttributePillView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore38TTRIRemindersListCellAttributePillView *)sub_1B94E4484(a3);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIRemindersListCellAttributePillView();
  v2 = (char *)v5.receiver;
  [(TTRIRemindersListCellAttributePillView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_stackView];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);
  }
  else
  {
    __break(1u);
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_stackView);
  if (v3) {
    objc_msgSend(v3, sel_sizeThatFits_, result.width, result.height);
  }
  else {
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_labelView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore38TTRIRemindersListCellAttributePillView_stackView);
}

@end