@interface TTRIRemindersListCellAssigneeView
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC15RemindersUICore33TTRIRemindersListCellAssigneeView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore33TTRIRemindersListCellAssigneeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIRemindersListCellAssigneeView

- (_TtC15RemindersUICore33TTRIRemindersListCellAssigneeView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore33TTRIRemindersListCellAssigneeView *)_s15RemindersUICore33TTRIRemindersListCellAssigneeViewC5frameACSo6CGRectV_tcfc_0();
}

- (_TtC15RemindersUICore33TTRIRemindersListCellAssigneeView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore33TTRIRemindersListCellAssigneeView *)TTRIRemindersListCellAssigneeView.init(coder:)(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  TTRIRemindersListCellAssigneeView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellAssigneeView_stackView);
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
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellAssigneeView_contact));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellAssigneeView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellAssigneeView_avatarViewController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellAssigneeView_stackView);
}

@end