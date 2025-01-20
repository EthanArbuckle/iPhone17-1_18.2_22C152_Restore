@interface AddressEditorView.Coordinator
- (_TtCV9PassKitUI17AddressEditorView11Coordinator)init;
- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4;
- (void)addressEditorViewControllerDidCancel:(id)a3;
@end

@implementation AddressEditorView.Coordinator

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  v4 = *(void (**)(void))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV9PassKitUI17AddressEditorView11Coordinator_dismiss);
  id v5 = a3;
  v6 = self;
  v4(0);
}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV9PassKitUI17AddressEditorView11Coordinator_dismiss);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v6(a4);
}

- (_TtCV9PassKitUI17AddressEditorView11Coordinator)init
{
  result = (_TtCV9PassKitUI17AddressEditorView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end