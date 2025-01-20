@interface TTRIRemindersListEditableSectionNameViewController
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (BOOL)textViewShouldEndEditing:(id)a3;
- (_TtC9Reminders50TTRIRemindersListEditableSectionNameViewController)init;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TTRIRemindersListEditableSectionNameViewController

- (_TtC9Reminders50TTRIRemindersListEditableSectionNameViewController)init
{
  result = (_TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_nameTextView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_previousTextColor));

  swift_bridgeObjectRelease();
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_10051F7DC();

  return v6 & 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10024752C(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == 10 && v7 == 0xE100000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v8 = *(void *)&self->presenter[OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_presenter];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = *(void *)(v8 + 8);
    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 32);
    id v12 = a3;
    v13 = self;
    v11(ObjectType, v10);
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v15 = *(void *)&self->presenter[OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_presenter];
    uint64_t v16 = swift_getObjectType();
    uint64_t v17 = *(void *)(v15 + 8);
    v18 = *(void (**)(uint64_t, uint64_t))(v17 + 24);
    id v19 = a3;
    v20 = self;
    v18(v16, v17);
    BOOL v14 = 1;
  }

  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100247838(v4);
}

@end