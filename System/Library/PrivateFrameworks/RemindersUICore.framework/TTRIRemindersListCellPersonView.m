@interface TTRIRemindersListCellPersonView
- (_TtC15RemindersUICore31TTRIRemindersListCellPersonView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore31TTRIRemindersListCellPersonView)initWithFrame:(CGRect)a3;
@end

@implementation TTRIRemindersListCellPersonView

- (_TtC15RemindersUICore31TTRIRemindersListCellPersonView)initWithFrame:(CGRect)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_contact) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_name);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_avatarViewController) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[TTRIRemindersListCellAttributePillView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1B9501F94();
  sub_1B950214C();

  return v6;
}

- (_TtC15RemindersUICore31TTRIRemindersListCellPersonView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore31TTRIRemindersListCellPersonView *)sub_1B950237C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_contact));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_avatarViewController);
}

@end