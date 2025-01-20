@interface TTRIRemindersListReminderCellGrid
- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithArrangedSubviewRows:(id)a3;
- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithCoder:(id)a3;
- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
@end

@implementation TTRIRemindersListReminderCellGrid

- (void)layoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(TTRIRemindersListReminderCellGrid *)&v5 layoutMarginsDidChange];
  v3 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate];
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_1B90C337C((uint64_t)v3);
  }
}

- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
  void *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[NUIContainerGridView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithArrangedSubviewRows:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9ACBC0);
    sub_1B996EE50();
    v6 = (Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
    void *v6 = 0;
    v6[1] = 0;
    a3 = (id)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = (Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
    void *v7 = 0;
    v7[1] = 0;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = [(NUIContainerGridView *)&v10 initWithArrangedSubviewRows:a3];

  return v8;
}

- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
  void *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(TTRIRemindersListReminderCellGrid *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1B90C337C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate));
}

@end