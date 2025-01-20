@interface _TFTextFormattingContentViewController
- (BOOL)_canShowWhileLocked;
- (_TFTextFormattingContentViewController)init;
- (_TFTextFormattingContentViewController)initWithCoder:(id)a3;
- (_TFTextFormattingContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4;
- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4;
- (void)_presentTypographySettingsForFont:(id)a3;
- (void)_setConfiguration:(id)a3;
- (void)_setDisabledComponents:(id)a3;
- (void)_setFormattingDescriptor:(id)a3;
- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4;
- (void)_textFormattingDidFinish;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation _TFTextFormattingContentViewController

- (_TFTextFormattingContentViewController)init
{
  return (_TFTextFormattingContentViewController *)sub_25EAF3198();
}

- (_TFTextFormattingContentViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TFTextFormattingContentViewController_viewState;
  type metadata accessor for TextFormattingState();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_25EAF8CE8();
  uint64_t v7 = OBJC_IVAR____TFTextFormattingContentViewController_configuration;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D08]), sel_init);

  result = (_TFTextFormattingContentViewController *)sub_25EB4E5B8();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_25EAF3800();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_25EAF3958();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TFTextFormattingContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TFTextFormattingContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTextFormattingContentViewController_configuration);
}

- (void)_setConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _TFTextFormattingContentViewController._setConfiguration(_:)(v4);
}

- (void)_setFormattingDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _TFTextFormattingContentViewController._setFormattingDescriptor(_:)();
}

- (void)_setDisabledComponents:(id)a3
{
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    v8 = self;
    id v9 = a4;
    uint64_t v10 = sub_25EB4D148();
    unint64_t v12 = v11;
  }
  else
  {
    id v13 = a3;
    v14 = self;
    uint64_t v10 = 0;
    unint64_t v12 = 0xF000000000000000;
  }
  id v15 = [(_TFTextFormattingContentViewController *)self parentViewController];
  if (v15)
  {
    v16 = v15;
    uint64_t v17 = swift_dynamicCastObjCProtocolConditional();
    if (v17)
    {
      v18 = (void *)v17;
      if (v12 >> 60 == 15) {
        v19 = 0;
      }
      else {
        v19 = (void *)sub_25EB4D138();
      }
      objc_msgSend(v18, sel__textFormattingDidChangeValue_textAttributesData_, a3, v19);
    }
  }
  sub_25EAF5B64(v10, v12);
}

- (void)_textFormattingDidFinish
{
  uint64_t v5 = self;
  id v2 = [(_TFTextFormattingContentViewController *)v5 parentViewController];
  if (v2)
  {
    v3 = v2;
    id v4 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v4) {
      objc_msgSend(v4, sel__textFormattingDidFinish);
    }
  }
  else
  {
  }
}

- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v13 = self;
  id v10 = [(_TFTextFormattingContentViewController *)v13 parentViewController];
  if (v10)
  {
    unint64_t v11 = v10;
    unint64_t v12 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v12) {
      objc_msgSend(v12, sel__presentColorPicker_selectedColor_, v9, x, y, width, height);
    }
  }
  else
  {
  }
}

- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  sub_25EAEFEE4(0, &qword_26A740CB0);
  sub_25EB4E178();
  id v6 = a3;
  id v7 = self;
  id v8 = [(_TFTextFormattingContentViewController *)v7 parentViewController];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = swift_dynamicCastObjCProtocolConditional();
    if (v10)
    {
      unint64_t v11 = (void *)v10;
      unint64_t v12 = (void *)sub_25EB4E158();
      objc_msgSend(v11, sel__presentFontPickerWithConfiguration_selectedFonts_, v6, v12);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)_presentTypographySettingsForFont:(id)a3
{
  id v4 = a3;
  id v8 = self;
  id v5 = [(_TFTextFormattingContentViewController *)v8 parentViewController];
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v7) {
      objc_msgSend(v7, sel__presentTypographySettingsForFont_, v4);
    }
  }
  else
  {
  }
}

@end