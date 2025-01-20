@interface NoteDebugStatusController
+ (_TtC11MobileNotes25NoteDebugStatusController)sharedController;
- (ICNote)currentNote;
- (_TtC11MobileNotes25NoteDebugStatusController)init;
- (void)setCurrentNote:(id)a3;
@end

@implementation NoteDebugStatusController

+ (_TtC11MobileNotes25NoteDebugStatusController)sharedController
{
  if (qword_10069AFC0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1006CE0D8;

  return (_TtC11MobileNotes25NoteDebugStatusController *)v2;
}

- (ICNote)currentNote
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();

  return (ICNote *)v5;
}

- (void)setCurrentNote:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  v6 = self;
  static Published.subscript.setter();
}

- (_TtC11MobileNotes25NoteDebugStatusController)init
{
  return (_TtC11MobileNotes25NoteDebugStatusController *)sub_1003D5A8C();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MobileNotes25NoteDebugStatusController__currentNote;
  uint64_t v3 = sub_10002F214(&qword_1006A5C58);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end