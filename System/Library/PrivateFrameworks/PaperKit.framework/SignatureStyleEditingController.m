@interface SignatureStyleEditingController
- (_TtC8PaperKit31SignatureStyleEditingController)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
- (void)didTapColorSwatchWithSender:(id)a3;
- (void)didTapStrokeWidthControlWithSender:(id)a3;
@end

@implementation SignatureStyleEditingController

- (void)didTapStrokeWidthControlWithSender:(id)a3
{
  v5 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit31SignatureStyleEditingController_controller, a2);
  swift_unknownObjectRetain();
  v6 = self;
  if (v5)
  {
    CanvasElementController.changeSelectedStrokeWidth(_:)((double)(uint64_t)objc_msgSend(a3, sel_width));
  }
  SignatureStyleEditingController.updateUI()();
  swift_unknownObjectRelease();
}

- (void)didTapColorSwatchWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  SignatureStyleEditingController.didTapColorSwatch(sender:)((uint64_t)v4);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_presentedViewController);
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();

  if (v7) {
    int64_t v8 = -2;
  }
  else {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = self;
  id v9 = objc_msgSend(v6, sel_presentedViewController);
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();

  if (v10) {
    int64_t v11 = -2;
  }
  else {
    int64_t v11 = -1;
  }

  return v11;
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  specialized SignatureStyleEditingController.colorPickerViewController(_:didSelect:continuously:)((uint64_t)v9, a5);
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit31SignatureStyleEditingController_isColorPickerPresented) = 0;
  id v4 = a3;
  v5 = self;
  SignatureStyleEditingController.updateUI()();
}

- (_TtC8PaperKit31SignatureStyleEditingController)init
{
  result = (_TtC8PaperKit31SignatureStyleEditingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit31SignatureStyleEditingController_signatureStyleEditingView);
}

@end