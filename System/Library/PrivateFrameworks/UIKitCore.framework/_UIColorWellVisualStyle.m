@interface _UIColorWellVisualStyle
- (BOOL)supportsAlpha;
- (BOOL)wantsExtraTouchInsets;
- (BOOL)wantsSystemDragAndDrop;
- (CGSize)intrinsicSizeWithinSize:(CGSize)a3;
- (NSString)pickerTitle;
- (UIColor)selectedColor;
- (UIDragPreviewParameters)dragPreviewParameters;
- (_UIColorWellControl)colorWell;
- (_UIColorWellVisualStyle)initWithColorWell:(id)a3;
- (void)setColorWell:(id)a3;
- (void)setPickerTitle:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)setSelectedColor:(id)a3 notifyingPicker:(BOOL)a4;
- (void)setSupportsAlpha:(BOOL)a3;
- (void)setWantsExtraTouchInsets:(BOOL)a3;
- (void)setWantsSystemDragAndDrop:(BOOL)a3;
@end

@implementation _UIColorWellVisualStyle

- (_UIColorWellVisualStyle)initWithColorWell:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIColorWellVisualStyle;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    [(_UIColorWellVisualStyle *)v5 setColorWell:v4];
  }

  return v6;
}

- (void)setSelectedColor:(id)a3 notifyingPicker:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_super v8 = NSStringFromSelector(a2);
  [v9 handleFailureInMethod:a2, self, @"_UIColorWellVisualStyle.m", 21, @"%@ should provide an implementation for %@", v7, v8 object file lineNumber description];
}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.width, a3.height);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_super v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"_UIColorWellVisualStyle.m", 25, @"%@ should provide an implementation for %@", v7, v8 object file lineNumber description];

  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v10;
  result.width = v9;
  return result;
}

- (_UIColorWellControl)colorWell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_colorWell);
  return (_UIColorWellControl *)WeakRetained;
}

- (void)setColorWell:(id)a3
{
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (NSString)pickerTitle
{
  return self->_pickerTitle;
}

- (void)setPickerTitle:(id)a3
{
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (void)setSupportsAlpha:(BOOL)a3
{
  self->_supportsAlpha = a3;
}

- (BOOL)wantsSystemDragAndDrop
{
  return self->_wantsSystemDragAndDrop;
}

- (void)setWantsSystemDragAndDrop:(BOOL)a3
{
  self->_wantsSystemDragAndDrop = a3;
}

- (BOOL)wantsExtraTouchInsets
{
  return self->_wantsExtraTouchInsets;
}

- (void)setWantsExtraTouchInsets:(BOOL)a3
{
  self->_wantsExtraTouchInsets = a3;
}

- (UIDragPreviewParameters)dragPreviewParameters
{
  return self->_dragPreviewParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragPreviewParameters, 0);
  objc_storeStrong((id *)&self->_pickerTitle, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_destroyWeak((id *)&self->_colorWell);
}

@end