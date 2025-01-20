@interface TTRIReminderTitleTextView
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (NSString)accessibilityValue;
- (UITextInputDelegate)inputDelegate;
- (_TtC15RemindersUICore25TTRIReminderTitleTextView)initWithCoder:(id)a3;
- (void)adoptForeignHashtag:(id)a3;
- (void)beginSelectionChange;
- (void)bulletedListStyleAction:(id)a3;
- (void)convertTextToHashtag:(id)a3;
- (void)copy:(id)a3;
- (void)dashedListStyleAction:(id)a3;
- (void)deleteBackward;
- (void)endSelectionChange;
- (void)insertTextSuggestion:(id)a3;
- (void)layoutSubviews;
- (void)numberedListStyleAction:(id)a3;
- (void)paste:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)removeHashtagAttribute:(id)a3;
- (void)removeHashtagAttributedText:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation TTRIReminderTitleTextView

- (_TtC15RemindersUICore25TTRIReminderTitleTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s15RemindersUICore25TTRIReminderTitleTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)bulletedListStyleAction:(id)a3
{
}

- (void)dashedListStyleAction:(id)a3
{
}

- (void)numberedListStyleAction:(id)a3
{
}

- (UITextInputDelegate)inputDelegate
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  v2 = [(TTRIReminderTitleTextView *)&v4 inputDelegate];

  return v2;
}

- (void)setInputDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  swift_unknownObjectRetain();
  id v4 = v5.receiver;
  [(TTRIReminderTitleTextView *)&v5 setInputDelegate:a3];
  sub_1B94F72CC();

  swift_unknownObjectRelease();
}

- (void)deleteBackward
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  id v2 = v9.receiver;
  [(TTRIReminderTitleTextView *)&v9 deleteBackward];
  id v3 = objc_msgSend(v2, sel_delegate, v9.receiver, v9.super_class);
  if (v3)
  {
    id v4 = v3;
    swift_getObjectType();
    uint64_t v5 = swift_conformsToProtocol2();
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    if (v5) {
      id v7 = v4;
    }
    else {
      id v7 = 0;
    }
    if (v7)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(id, uint64_t, uint64_t))(v6 + 80))(v2, ObjectType, v6);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)insertTextSuggestion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  TTRIReminderTitleTextView.insert(_:)((UITextSuggestion_optional *)a3);
}

- (void)copy:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (void)toggleBoldface:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self;
  }
  id v6 = [(TTRIReminderTitleTextView *)self selectedRange];
  uint64_t v8 = v7;
  id v9 = [(TTRIReminderTitleTextView *)self delegate];
  if (v9)
  {
    id v10 = v9;
    swift_getObjectType();
    uint64_t v11 = swift_conformsToProtocol2();
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v11) {
      id v13 = v10;
    }
    else {
      id v13 = 0;
    }
    if (v13)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v12 + 48))(self, v6, v8, ObjectType, v12);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B90CCA68((uint64_t)&v15, &qword_1EB9B4D10);
}

- (void)toggleItalics:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self;
  }
  id v6 = [(TTRIReminderTitleTextView *)self selectedRange];
  uint64_t v8 = v7;
  id v9 = [(TTRIReminderTitleTextView *)self delegate];
  if (v9)
  {
    id v10 = v9;
    swift_getObjectType();
    uint64_t v11 = swift_conformsToProtocol2();
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v11) {
      id v13 = v10;
    }
    else {
      id v13 = 0;
    }
    if (v13)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v12 + 56))(self, v6, v8, ObjectType, v12);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B90CCA68((uint64_t)&v15, &qword_1EB9B4D10);
}

- (void)toggleUnderline:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self;
  }
  id v6 = [(TTRIReminderTitleTextView *)self selectedRange];
  uint64_t v8 = v7;
  id v9 = [(TTRIReminderTitleTextView *)self delegate];
  if (v9)
  {
    id v10 = v9;
    swift_getObjectType();
    uint64_t v11 = swift_conformsToProtocol2();
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v11) {
      id v13 = v10;
    }
    else {
      id v13 = 0;
    }
    if (v13)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v12 + 64))(self, v6, v8, ObjectType, v12);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B90CCA68((uint64_t)&v15, &qword_1EB9B4D10);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  unsigned __int8 v8 = TTRIReminderTitleTextView.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_1B90CCA68((uint64_t)v10, &qword_1EB9B4D10);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TTRIReminderTitleTextView.validate(_:)((UICommand)v4);
}

- (void)beginSelectionChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  id v2 = (char *)v4.receiver;
  [(TTRIReminderTitleTextView *)&v4 beginSelectionChange];
  id v3 = &v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_isChangingSelection];
  swift_beginAccess();
  *id v3 = 1;
}

- (void)endSelectionChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  id v2 = v4.receiver;
  [(TTRIReminderTitleTextView *)&v4 endSelectionChange];
  id v3 = &v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_isChangingSelection];
  swift_beginAccess();
  *id v3 = 0;
  v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_needsAdjustSelectionToSelectToken] = 1;
  objc_msgSend(v2, sel_setNeedsLayout);
  v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_needsAdjustInternalTypingAttributes] = 1;
  objc_msgSend(v2, sel_setNeedsLayout);
}

- (void)layoutSubviews
{
  id v2 = self;
  TTRIReminderTitleTextView.layoutSubviews()();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B90BFD68(0, (unint64_t *)&unk_1E9F02210);
  sub_1B94FA1A0();
  uint64_t v6 = sub_1B996F260();
  uint64_t v7 = self;
  id v8 = a4;
  id v9 = [(TTRIReminderTitleTextView *)v7 delegate];
  if (!v9) {
    goto LABEL_12;
  }
  id v10 = v9;
  swift_getObjectType();
  uint64_t v11 = swift_conformsToProtocol2();
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v11) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }
  if (!v13)
  {
    swift_unknownObjectRelease();
    goto LABEL_12;
  }
  uint64_t ObjectType = swift_getObjectType();
  char v15 = (*(uint64_t (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, uint64_t, uint64_t, uint64_t))(v12 + 88))(v7, v6, ObjectType, v12);
  swift_unknownObjectRelease();
  if ((v15 & 1) == 0)
  {
LABEL_12:
    long long v16 = (void *)sub_1B996F250();
    v17.receiver = v7;
    v17.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
    [(TTRIReminderTitleTextView *)&v17 pressesBegan:v16 withEvent:v8];

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }

  swift_bridgeObjectRelease();
LABEL_13:
}

- (NSString)accessibilityValue
{
  id v2 = self;
  id v3 = [(TTRIReminderTitleTextView *)v2 text];
  if (v3)
  {
    objc_super v4 = v3;
    sub_1B996E9F0();

    id v5 = (void *)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    id v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)canBecomeFocused
{
  id v2 = self;
  if ([(TTRIReminderTitleTextView *)v2 isEditing])
  {

    return 1;
  }
  else if (_AXSFullKeyboardAccessEnabled())
  {
    int IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();

    return IsHardwareKeyboardAttached != 0;
  }
  else
  {

    return 0;
  }
}

- (void)removeHashtagAttribute:(id)a3
{
}

- (void)removeHashtagAttributedText:(id)a3
{
}

- (void)adoptForeignHashtag:(id)a3
{
}

- (void)convertTextToHashtag:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self;
  }
  id v6 = [(TTRIReminderTitleTextView *)self delegate];
  if (v6)
  {
    id v7 = v6;
    swift_getObjectType();
    uint64_t v8 = swift_conformsToProtocol2();
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v8) {
      id v10 = v7;
    }
    else {
      id v10 = 0;
    }
    if (v10)
    {
      uint64_t ObjectType = swift_getObjectType();
      id v12 = [(TTRIReminderTitleTextView *)self selectedRange];
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v9 + 40))(self, v12, v13, ObjectType, v9);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B90CCA68((uint64_t)&v14, &qword_1EB9B4D10);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_reminderTextStorage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end