@interface _UITextFormattingViewControllerDelegateBox
- (BOOL)textFormattingViewController:(id)a3 shouldPresentColorPicker:(id)a4;
- (BOOL)textFormattingViewController:(id)a3 shouldPresentFontPicker:(id)a4;
- (_TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox)init;
- (id)_disabledComponentsForTextFormattingViewController:(id)a3;
- (void)textFormattingDidFinish:(id)a3;
- (void)textFormattingViewController:(id)a3 didChangeValue:(id)a4;
@end

@implementation _UITextFormattingViewControllerDelegateBox

- (void)textFormattingViewController:(id)a3 didChangeValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_185B1F114((uint64_t)v6, v7);
}

- (BOOL)textFormattingViewController:(id)a3 shouldPresentFontPicker:(id)a4
{
  id v7 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x18C109380]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v10 = *(uint64_t (**)(id, id, uint64_t, uint64_t))(v8 + 16);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    char v14 = v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

- (BOOL)textFormattingViewController:(id)a3 shouldPresentColorPicker:(id)a4
{
  id v7 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x18C109380]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v10 = *(uint64_t (**)(id, id, uint64_t, uint64_t))(v8 + 24);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    char v14 = v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

- (void)textFormattingDidFinish:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x18C109380]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 32);
    id v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (id)_disabledComponentsForTextFormattingViewController:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x18C109380]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 40);
    id v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  type metadata accessor for ComponentKey(0);
  sub_185B1FA70();
  id v11 = (void *)sub_186A1ED6C();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _UITextFormattingViewControllerDelegateBox();
  return [(_UITextFormattingViewControllerDelegateBox *)&v4 init];
}

- (void).cxx_destruct
{
}

@end