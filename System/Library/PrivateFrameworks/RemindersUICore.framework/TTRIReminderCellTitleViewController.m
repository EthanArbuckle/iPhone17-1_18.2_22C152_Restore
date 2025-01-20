@interface TTRIReminderCellTitleViewController
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (_TtC15RemindersUICore35TTRIReminderCellTitleViewController)init;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TTRIReminderCellTitleViewController

- (_TtC15RemindersUICore35TTRIReminderCellTitleViewController)init
{
  result = (_TtC15RemindersUICore35TTRIReminderCellTitleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellTitleViewController_titleTextView));

  swift_release();
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellTitleViewController_presenter);
  v5 = (_TtC15RemindersUICore35TTRIReminderCellTitleViewController *)a3;
  v6 = self;
  BOOL result = sub_1B9402628();
  BOOL v8 = result;
  if (!result) {
    goto LABEL_5;
  }
  v9 = *(Class *)((char *)&v6->super.isa
                + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellTitleViewController_titleTextView);
  if (v9)
  {
    if (*(void *)(v4 + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellTitlePresenter_quickBar))
    {
      uint64_t v10 = *(void *)(v4 + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellTitlePresenter_quickBar + 8);
      swift_getObjectType();
      v11 = *(void (**)(void))(v10 + 16);
      v12 = v9;
      v11();

      v5 = v6;
      v6 = v12;
    }
LABEL_5:

    return v8;
  }
  __break(1u);
  return result;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B93FC8F4();
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B93FCB2C();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1B996E9F0();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B93FB970(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B93FBE88(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B93FCC2C();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v5 = sub_1B996A580();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  BOOL v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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