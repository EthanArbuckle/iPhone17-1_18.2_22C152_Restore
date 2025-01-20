@interface TTRISubtaskListCellTitleViewController
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (_TtC15RemindersUICore38TTRISubtaskListCellTitleViewController)init;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TTRISubtaskListCellTitleViewController

- (_TtC15RemindersUICore38TTRISubtaskListCellTitleViewController)init
{
  result = (_TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15RemindersUICore38TTRISubtaskListCellTitleViewController_titleTextView);
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v5 = (id)MEMORY[0x1BA9DB180](*(char **)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore38TTRISubtaskListCellTitleViewController_presenter)+ 48, a2);
  if (v5)
  {
    v6 = v5;
    id v7 = a3;
    v8 = self;
    id v5 = objc_msgSend(v6, sel_tableView);
    if (v5)
    {
      v9 = v5;
      unsigned __int8 v10 = objc_msgSend(v5, sel_hasActiveDrag);

      if (v10)
      {

        swift_unknownObjectRelease();
        LOBYTE(v5) = 0;
        return (char)v5;
      }
      id v5 = objc_msgSend(v6, sel_tableView);
      if (v5)
      {
        v11 = v5;
        unsigned __int8 v12 = objc_msgSend(v5, sel_hasActiveDrop);

        swift_unknownObjectRelease();
        LOBYTE(v5) = v12 ^ 1;
        return (char)v5;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return (char)v5;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B98CBC50();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1B996E9F0();
  uint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B98CBFD4(location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B98CB4AC(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  char v4 = *((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC15RemindersUICore38TTRISubtaskListCellTitleViewController_userPressedReturn);
  id v5 = a3;
  v6 = self;
  sub_1B98CC75C(v4);
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
    uint64_t v11 = self;
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