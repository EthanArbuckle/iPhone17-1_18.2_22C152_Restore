@interface TTRITextCellTextFieldTextArea
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC15RemindersUICore29TTRITextCellTextFieldTextArea)init;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textFieldEditingChanged;
@end

@implementation TTRITextCellTextFieldTextArea

- (void)textFieldEditingChanged
{
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC15RemindersUICore29TTRITextCellTextFieldTextArea)init
{
  result = (_TtC15RemindersUICore29TTRITextCellTextFieldTextArea *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_textField);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 48);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  sub_1B996E9F0();
  v7 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v7))
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    v12 = *(uint64_t (**)(void))(v8 + 16);
    id v13 = a3;
    v9 = self;
    char v10 = v12();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    char v10 = 1;
  }
  return v10 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t v4 = self;
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (!MEMORY[0x1BA9DB180](v5))
  {
    id v10 = a3;
    v11 = v4;
    goto LABEL_5;
  }
  uint64_t v6 = *((void *)v5 + 1);
  swift_getObjectType();
  v7 = *(uint64_t (**)(void))(v6 + 32);
  id v8 = a3;
  v9 = v4;
  LOBYTE(v6) = v7();
  swift_unknownObjectRelease();
  if ((v6 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(a3, sel_resignFirstResponder);
    goto LABEL_6;
  }
  a3 = v8;
  uint64_t v4 = v9;
LABEL_6:

  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  uint64_t v4 = (UITextField *)a3;
  v5 = self;
  TTRITextCellTextFieldTextArea.textFieldDidEndEditing(_:)(v4);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end