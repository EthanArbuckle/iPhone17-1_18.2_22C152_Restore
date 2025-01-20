@interface TTRIReminderCellNotesViewController
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (_TtC15RemindersUICore35TTRIReminderCellNotesViewController)init;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TTRIReminderCellNotesViewController

- (_TtC15RemindersUICore35TTRIReminderCellNotesViewController)init
{
  result = (_TtC15RemindersUICore35TTRIReminderCellNotesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_notesTextView));
  swift_release();

  swift_release();
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  v3 = (void *)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_presenter)
                + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellNotesPresenter_quickBar);
  if (*v3)
  {
    uint64_t v6 = v3[1];
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, char **, uint64_t, uint64_t))(v6 + 16);
    id v9 = a3;
    v10 = self;
    v8(v9, &protocol witness table for UITextView, ObjectType, v6);
  }
  return 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B94057A0();
  uint64_t v6 = *(Class *)((char *)&v5->super.isa
                + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_notesTextView);
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_msgSend(v7, sel_textStorage);
    NSMutableAttributedString.clearLinks()();
  }
  else
  {
    __break(1u);
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_notesTextView);
  if (v3)
  {
    id v5 = a3;
    uint64_t v6 = self;
    id v7 = v3;
    TTRIReminderTitleTextView.adjustStateAfterSelectionChange()();
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1B996E9F0();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B93FDD20(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B93FE37C(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = (void *)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_presenter)
                + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellNotesPresenter_quickBar);
  if (*v4)
  {
    uint64_t v5 = v4[1];
    uint64_t ObjectType = swift_getObjectType();
    id v7 = *(void (**)(id, char **, uint64_t, uint64_t))(v5 + 24);
    id v8 = a3;
    uint64_t v9 = self;
    v7(v8, &protocol witness table for UITextView, ObjectType, v5);
  }
  else
  {
    id v10 = a3;
    unint64_t v11 = self;
  }
  sub_1B9405A6C();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v5 = sub_1B996A580();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996A520();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 1;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  Swift::Int length = a4.length;
  Swift::Int location = a4.location;
  sub_1B90BFD68(0, (unint64_t *)&unk_1E9F00990);
  uint64_t v9 = sub_1B996EE50();
  type metadata accessor for TTRIReminderTitleTextView();
  if (swift_dynamicCastClass())
  {
    id v10 = a3;
    unint64_t v11 = self;
    v12.Swift::Int location = location;
    v12.Swift::Int length = length;
    v13 = (void *)TTRIReminderTitleTextView.editMenuForTextIn(_:suggestedActions:)(v12, (Swift::OpaquePointer)v9);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = 0;
  }

  return v13;
}

@end