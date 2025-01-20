@interface TextStyleEditingController
- (_TtC8PaperKit26TextStyleEditingController)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
- (void)didTapBoldTextStyle;
- (void)didTapColorSwatchWithSender:(id)a3;
- (void)didTapFontButton;
- (void)didTapFontSizeButton;
- (void)didTapItalicTextStyle;
- (void)didTapStrikethroughTextStyle;
- (void)didTapUnderlineTextStyle;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)textAlignmentControlValueChanged;
- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4;
- (void)valueEditingViewController:(id)a3 didFinishChangingValue:(int64_t)a4;
- (void)valueEditingViewController:(id)a3 didStartChangingValue:(int64_t)a4;
@end

@implementation TextStyleEditingController

- (void)didTapFontButton
{
  v2 = self;
  TextStyleEditingController.didTapFontButton()();
}

- (void)didTapFontSizeButton
{
  v2 = self;
  TextStyleEditingController.didTapFontSizeButton()();
}

- (void)textAlignmentControlValueChanged
{
  v2 = self;
  TextStyleEditingController.textAlignmentControlValueChanged()();
}

- (void)didTapBoldTextStyle
{
  v2 = self;
  TextStyleEditingController.didTapBoldTextStyle()();
}

- (void)didTapItalicTextStyle
{
  v2 = self;
  TextStyleEditingController.didTapItalicTextStyle()();
}

- (void)didTapUnderlineTextStyle
{
  v2 = self;
  TextStyleEditingController.didTapUnderlineTextStyle()();
}

- (void)didTapStrikethroughTextStyle
{
  v2 = self;
  TextStyleEditingController.didTapStrikethroughTextStyle()();
}

- (void)didTapColorSwatchWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  TextStyleEditingController.didTapColorSwatch(sender:)((uint64_t)v4);
}

- (void)valueEditingViewController:(id)a3 didStartChangingValue:(int64_t)a4
{
}

- (void)valueEditingViewController:(id)a3 didFinishChangingValue:(int64_t)a4
{
}

- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4
{
  type metadata accessor for FontSizeViewController();
  if (swift_dynamicCastClass())
  {
    v7 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_controller);
    id v8 = a3;
    v9 = self;
    if (v7)
    {
      CanvasElementController.setSelectionFontSize(_:)(a4);
    }
    TextStyleEditingController.updateUI()();
  }
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4 = (UIFontPickerViewController *)a3;
  v5 = self;
  TextStyleEditingController.fontPickerViewControllerDidPickFont(_:)(v4);
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v8 = (UIColorPickerViewController *)a3;
  id v9 = a4;
  v10 = self;
  TextStyleEditingController.colorPickerViewController(_:didSelect:continuously:)(v8, (UIColor)v9, a5);
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_isColorPickerPresented) = 0;
  id v4 = a3;
  v5 = self;
  TextStyleEditingController.updateUI()();
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

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = (_TtC8PaperKit26TextStyleEditingController *)a3;
  id v6 = self;
  v5 = (_TtC8PaperKit26TextStyleEditingController *)[(TextStyleEditingController *)v4 presentedViewController];
  self;
  if (swift_dynamicCastObjCClass())
  {

    *((unsigned char *)&v6->super.isa + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_isColorPickerPresented) = 0;
    TextStyleEditingController.updateUI()();
  }
  else
  {

    id v4 = v6;
    id v6 = v5;
  }
}

- (_TtC8PaperKit26TextStyleEditingController)init
{
  result = (_TtC8PaperKit26TextStyleEditingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_textStyleEditingView));
  id v3 = *(id *)&self->displayAttributes[OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_displayAttributes + 8];
  objc_release(*(id *)&self->displayAttributes[OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_displayAttributes
                                             + 48]);
  swift_bridgeObjectRelease();
}

@end