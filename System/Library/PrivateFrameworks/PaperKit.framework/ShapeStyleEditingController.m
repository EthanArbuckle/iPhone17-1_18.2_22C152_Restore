@interface ShapeStyleEditingController
- (_TtC8PaperKit27ShapeStyleEditingController)init;
- (void)_colorPickerViewControllerDidDeselectColor:(id)a3;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)didChangeOpacitySlider;
- (void)didFinishChangingOpacitySlider;
- (void)didStartChangingOpacitySlider;
- (void)didTapArrowColorButtonForEvent:(id)a3;
- (void)didTapCompactOpacityButtonForEvent:(id)a3;
- (void)didTapFillColorButton;
- (void)didTapStrokeColorButton;
- (void)didTapStrokeWidthButton;
- (void)lineTypeControlValueChanged;
- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4;
- (void)valueEditingViewController:(id)a3 didFinishChangingValue:(int64_t)a4;
- (void)valueEditingViewController:(id)a3 didStartChangingValue:(int64_t)a4;
@end

@implementation ShapeStyleEditingController

- (void)didTapStrokeColorButton
{
  v2 = self;
  ShapeStyleEditingController.didTapStrokeColorButton()();
}

- (void)didTapFillColorButton
{
  v2 = self;
  ShapeStyleEditingController.didTapFillColorButton()();
}

- (void)didTapArrowColorButtonForEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  ShapeStyleEditingController.didTapStrokeColorButton()(&OBJC_IVAR____TtC8PaperKit21ShapeStyleEditingView_compactColorControlForArrows);
}

- (void)didTapStrokeWidthButton
{
  v2 = self;
  ShapeStyleEditingController.didTapStrokeWidthButton()();
}

- (void)didTapCompactOpacityButtonForEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized ShapeStyleEditingController.didTapCompactOpacityButton(forEvent:)();
}

- (void)didStartChangingOpacitySlider
{
  v2 = self;
  ShapeStyleEditingController.didStartChangingOpacitySlider()();
}

- (void)didFinishChangingOpacitySlider
{
  v2 = self;
  ShapeStyleEditingController.didFinishChangingOpacitySlider()();
}

- (void)didChangeOpacitySlider
{
  v2 = self;
  ShapeStyleEditingController.didChangeOpacitySlider()();
}

- (void)lineTypeControlValueChanged
{
  v2 = self;
  ShapeStyleEditingController.lineTypeControlValueChanged()();
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  if (!a5)
  {
    int v6 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_editingAttribute);
    if (v6 != 2)
    {
      id v8 = a3;
      id v9 = a4;
      v10 = self;
      ShapeStyleEditingController.canvasUserInterfaceStyle.getter();
      v11.value.super.Class isa = (Class)static PKInkingTool.convertColor(_:from:to:)();
      Class isa = v11.value.super.isa;
      if (v6) {
        ShapeStyleEditingController.changeFillColor(_:)(v11);
      }
      else {
        ShapeStyleEditingController.changeStrokeColor(_:)(v11);
      }
    }
  }
}

- (void)_colorPickerViewControllerDidDeselectColor:(id)a3
{
  int v3 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_editingAttribute);
  if (v3 != 2)
  {
    id v5 = a3;
    int v6 = self;
    v7.is_nil = (char)v6;
    id v8 = v6;
    v7.value.super.Class isa = 0;
    if (v3) {
      ShapeStyleEditingController.changeFillColor(_:)(v7);
    }
    else {
      ShapeStyleEditingController.changeStrokeColor(_:)(v7);
    }
  }
}

- (void)valueEditingViewController:(id)a3 didStartChangingValue:(int64_t)a4
{
  id v5 = a3;
  int v6 = self;
  ShapeStyleEditingController.didStartChangingOpacitySlider()();
}

- (void)valueEditingViewController:(id)a3 didFinishChangingValue:(int64_t)a4
{
  id v5 = a3;
  int v6 = self;
  ShapeStyleEditingController.didFinishChangingOpacitySlider()();
}

- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4
{
  id v6 = a3;
  UIColor_optional v7 = self;
  specialized ShapeStyleEditingController.valueEditingViewController(_:didChangeValue:)(a4);
}

- (_TtC8PaperKit27ShapeStyleEditingController)init
{
  result = (_TtC8PaperKit27ShapeStyleEditingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_shapeStyleEditingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_defaultStrokeColor));
  int v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_defaultFillColor);
}

@end