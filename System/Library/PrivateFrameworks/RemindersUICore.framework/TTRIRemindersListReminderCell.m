@interface TTRIRemindersListReminderCell
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
@end

@implementation TTRIRemindersListReminderCell

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  v6 = (char *)self + direct field offset for TTRIRemindersListReminderCell.delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v6))
  {
    uint64_t v7 = *((void *)v6 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 88);
    id v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    v8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  v6 = (char *)self + direct field offset for TTRIRemindersListReminderCell.delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v6))
  {
    uint64_t v7 = *((void *)v6 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 96);
    id v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    v8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 0;
}

@end