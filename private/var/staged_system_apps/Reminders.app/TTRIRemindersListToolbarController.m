@interface TTRIRemindersListToolbarController
- (void)newReminderAction:(id)a3;
- (void)toolbarFileGroceryRadar:(id)a3;
@end

@implementation TTRIRemindersListToolbarController

- (void)newReminderAction:(id)a3
{
  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
    swift_retain();
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1003479BC();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  sub_10003B6F8((uint64_t)v3, &qword_100788D60);
}

- (void)toolbarFileGroceryRadar:(id)a3
{
  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    swift_retain();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void *)(Strong + OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 768))(v6, ObjectType, v4);
    if (v7)
    {
      sub_100038D28(v6, v7);
      sub_100559C78();
      sub_100038CD8((uint64_t)v6);
    }
    else
    {
      sub_10003B6F8((uint64_t)v6, &qword_100796838);
    }
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  sub_10003B6F8((uint64_t)v8, &qword_100788D60);
}

@end