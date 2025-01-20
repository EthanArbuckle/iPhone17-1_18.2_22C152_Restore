@interface TTRIRemindersCommonPresenter
- (void)dismissViewContact:(id)a3;
- (void)representedListWasDeleted;
- (void)willNavigateTo;
@end

@implementation TTRIRemindersCommonPresenter

- (void)dismissViewContact:(id)a3
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
    memset(v6, 0, sizeof(v6));
    swift_retain();
  }
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong
    && (v4 = Strong,
        id v5 = [Strong presentedViewController],
        v4,
        v5))
  {
    [v5 dismissViewControllerAnimated:1 completion:0];
    swift_release();
  }
  else
  {
    swift_release();
  }
  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (void)willNavigateTo
{
  swift_retain();
  sub_1001C1CE8();

  swift_release();
}

- (void)representedListWasDeleted
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v3 = *(void *)&self->moduleDelegate[15];
    uint64_t ObjectType = swift_getObjectType();
    v6[3] = type metadata accessor for TTRIRemindersCommonPresenter(0);
    v6[4] = &off_10073CC68;
    v6[0] = self;
    id v5 = *(void (**)(void *, void, uint64_t, uint64_t))(v3 + 16);
    swift_retain_n();
    v5(v6, 0, ObjectType, v3);
    swift_unknownObjectRelease();
    sub_100038CD8((uint64_t)v6);
    swift_release();
  }
}

@end