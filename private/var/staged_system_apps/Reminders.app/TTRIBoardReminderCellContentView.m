@interface TTRIBoardReminderCellContentView
- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithArrangedSubviews:(id)a3;
- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithCoder:(id)a3;
- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithFrame:(CGRect)a3;
- (void)didPressAssigneeIndicator:(id)a3;
- (void)layoutSubviews;
@end

@implementation TTRIBoardReminderCellContentView

- (void)layoutSubviews
{
  v2 = self;
  sub_1004F8C9C();
}

- (void)didPressAssigneeIndicator:(id)a3
{
  v3 = self;
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  v6 = &v3->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_appliedConfiguration];
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for TTRIBoardReminderCellContentConfiguration();
  if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    __break(1u);
  }
  else
  {
    v8 = *(void (**)(void))&v6[*(int *)(v7 + 104) + 24];
    if (v8)
    {
      swift_retain();
      v9 = (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1004F9C40();
      v8();
      sub_1000499C4((uint64_t)v8);

      v3 = v9;
    }

    sub_10003B6F8((uint64_t)v10, &qword_100788D60);
  }
}

- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1004FEA80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithArrangedSubviews:(id)a3
{
  if (a3)
  {
    sub_1000368FC(0, (unint64_t *)&qword_100788600);
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1004FEDD8(v3);
}

- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithCoder:(id)a3
{
  return (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1004FF184(a3);
}

- (void).cxx_destruct
{
  swift_release();
  sub_10003B6F8((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_titleModuleState], &qword_1007A24E8);
  sub_10003B6F8((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_notesModuleState], &qword_1007A2510);
  sub_10003B6F8((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_autoCompleteModuleState], &qword_1007A2568);
  swift_release();

  sub_10003B6F8((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_appliedConfiguration], &qword_100794B10);
}

@end