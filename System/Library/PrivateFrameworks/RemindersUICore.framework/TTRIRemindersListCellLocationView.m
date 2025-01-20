@interface TTRIRemindersListCellLocationView
- (_TtC15RemindersUICore33TTRIRemindersListCellLocationView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore33TTRIRemindersListCellLocationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIRemindersListCellLocationView

- (void)layoutSubviews
{
  v2 = self;
  sub_1B94E5A54();
}

- (_TtC15RemindersUICore33TTRIRemindersListCellLocationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_iconBackingView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[TTRIRemindersListCellAttributePillView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore33TTRIRemindersListCellLocationView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_iconBackingView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TTRIRemindersListCellAttributePillView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_imageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_iconBackingView);
}

@end