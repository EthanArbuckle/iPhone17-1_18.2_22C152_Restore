@interface UIColorWell
+ (id)styleForColorWell:(id)a3;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)supportsAlpha;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (NSString)title;
- (UIColor)selectedColor;
- (UIColorWell)initWithCoder:(id)a3;
- (UIColorWell)initWithFrame:(CGRect)a3;
- (_UIColorWellDelegate)_delegate;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_colorPickerViewControllerDidDeselectColor:(id)a3;
- (void)_colorPickerViewControllerDidHideEyedropper:(id)a3;
- (void)_colorPickerViewControllerDidShowEyedropper:(id)a3;
- (void)_commonInit;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_setSelectedColor:(id)a3 notifyingStyle:(BOOL)a4 notifyingUIPicker:(BOOL)a5 sendingAction:(BOOL)a6;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setPickerTitle:(id)a3;
- (void)setSelectedColor:(UIColor *)selectedColor;
- (void)setSupportsAlpha:(BOOL)supportsAlpha;
- (void)set_delegate:(id)a3;
- (void)styleDidSelectColor:(id)a3;
- (void)styleRequestedColorPickerPresentation;
@end

@implementation UIColorWell

- (void)_commonInit
{
  self->_supportsAlpha = 1;
  v3 = +[UIColorWell styleForColorWell:self];
  style = self->_style;
  self->_style = v3;

  [(_UIColorWellVisualStyle *)self->_style setSupportsAlpha:self->_supportsAlpha];
  v5 = self->_style;
  [(UIView *)self bounds];
  -[UIView setFrame:](v5, "setFrame:");
  [(UIView *)self addSubview:self->_style];
  if ([(_UIColorWellVisualStyle *)self->_style wantsSystemDragAndDrop])
  {
    v6 = [[UIDragInteraction alloc] initWithDelegate:self];
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v6;

    [(UIView *)self addInteraction:self->_dragInteraction];
    v8 = [[UIDropInteraction alloc] initWithDelegate:self];
    dropInteraction = self->_dropInteraction;
    self->_dropInteraction = v8;

    v10 = self->_dropInteraction;
    [(UIView *)self addInteraction:v10];
  }
}

- (UIColorWell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIColorWell;
  v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UIColorWell *)v3 _commonInit];
  }
  return v4;
}

- (UIColorWell)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIColorWell;
  v5 = [(UIControl *)&v10 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    [(UIColorWell *)v5 _commonInit];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIColorWellColor"];
    [(UIColorWell *)v6 setSelectedColor:v7];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIColorWellTitle"];
    [(UIColorWell *)v6 setPickerTitle:v8];
    -[UIColorWell setSupportsAlpha:](v6, "setSupportsAlpha:", [v4 decodeBoolForKey:@"UIColorWellSupportsAlpha"]);
  }
  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIColorWell;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->_style) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIColorWell;
  id v4 = a3;
  [(UIControl *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedColor, @"UIColorWellColor", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_title forKey:@"UIColorWellTitle"];
  [v4 encodeBool:self->_supportsAlpha forKey:@"UIColorWellSupportsAlpha"];
}

- (void)setPickerTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(_UIColorWellVisualStyle *)self->_style setPickerTitle:v5];
}

- (void)setSupportsAlpha:(BOOL)supportsAlpha
{
  self->_supportsAlpha = supportsAlpha;
  -[_UIColorWellVisualStyle setSupportsAlpha:](self->_style, "setSupportsAlpha:");
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
}

- (void)_setSelectedColor:(id)a3 notifyingStyle:(BOOL)a4 notifyingUIPicker:(BOOL)a5 sendingAction:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v12 = a3;
  [(UIColorWell *)self willChangeValueForKey:@"selectedColor"];
  objc_storeStrong((id *)&self->_selectedColor, a3);
  [(UIColorWell *)self didChangeValueForKey:@"selectedColor"];
  if (v8)
  {
    [(_UIColorWellVisualStyle *)self->_style setSelectedColor:v12];
    if (!v7)
    {
LABEL_3:
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v7)
  {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_colorPicker);
  [WeakRetained _setSelectedColor:v12];

  if (v6) {
LABEL_4:
  }
    [(UIControl *)self sendActionsForControlEvents:4096];
LABEL_5:
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  -[_UIColorWellVisualStyle intrinsicSizeWithinSize:](self->_style, "intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)UIColorWell;
  [(UIView *)&v9 layoutSubviews];
  if ([(_UIColorWellVisualStyle *)self->_style wantsExtraTouchInsets])
  {
    [(UIView *)self bounds];
    if (v3 + -44.0 <= 0.0) {
      double v5 = (v3 + -44.0) * 0.5;
    }
    else {
      double v5 = 0.0;
    }
    if (v4 + -44.0 <= 0.0) {
      double v6 = (v4 + -44.0) * 0.5;
    }
    else {
      double v6 = 0.0;
    }
    -[UIView _setTouchInsets:](self, "_setTouchInsets:", v6, v5, v6, v5);
  }
  style = self->_style;
  [(UIView *)self frame];
  double Width = CGRectGetWidth(v10);
  [(UIView *)self frame];
  -[UIView setFrame:](style, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v11));
}

- (void)styleDidSelectColor:(id)a3
{
}

- (void)styleRequestedColorPickerPresentation
{
  obj = objc_alloc_init(UIColorPickerViewController);
  [(UIColorPickerViewController *)obj _setSelectedColor:self->_selectedColor];
  [(UIColorPickerViewController *)obj setSupportsAlpha:self->_supportsAlpha];
  [(UIColorPickerViewController *)obj setTitle:self->_title];
  [(UIColorPickerViewController *)obj setDelegate:self];
  [(UIViewController *)obj setModalPresentationStyle:7];
  double v3 = [(UIViewController *)obj popoverPresentationController];
  [v3 setSourceView:self];

  double v4 = [(UIColorWell *)self _delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(UIColorWell *)self _delegate];
    [v6 _colorWell:self willPresentColorPickerViewController:obj];
  }
  BOOL v7 = [(UIView *)self _viewControllerForAncestor];
  [v7 presentViewController:obj animated:1 completion:0];

  objc_storeWeak((id *)&self->_colorPicker, obj);
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
}

- (void)_colorPickerViewControllerDidDeselectColor:(id)a3
{
}

- (void)_colorPickerViewControllerDidShowEyedropper:(id)a3
{
  double v4 = [(UIColorWell *)self _delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIColorWell *)self _delegate];
    [v6 _colorWellDidShowEyedropper:self];
  }
}

- (void)_colorPickerViewControllerDidHideEyedropper:(id)a3
{
  double v4 = [(UIColorWell *)self _delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIColorWell *)self _delegate];
    [v6 _colorWellDidHideEyedropper:self];
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28D78]);
  id v6 = [(UIColorWell *)self selectedColor];
  BOOL v7 = (void *)[v5 initWithObject:v6];

  BOOL v8 = [[UIDragItem alloc] initWithItemProvider:v7];
  v11[0] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = [UITargetedDragPreview alloc];
  style = self->_style;
  BOOL v8 = [(_UIColorWellVisualStyle *)style dragPreviewParameters];
  objc_super v9 = [(UITargetedPreview *)v6 initWithView:style parameters:v8];

  return v9;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v4 = a4;
  id v5 = self;
  char v6 = [v4 canLoadObjectsOfClass:v5];

  return v6;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v4 = [[UIDropProposal alloc] initWithDropOperation:2];
  return v4;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__UIColorWell_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E52D99A8;
  v8[4] = self;
  id v7 = (id)[v5 loadObjectsOfClass:v6 completion:v8];
}

void __43__UIColorWell_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 firstObject];
  [v2 _setSelectedColor:v3 notifyingStyle:1 notifyingUIPicker:1 sendingAction:1];
}

+ (id)styleForColorWell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 traitCollection];
  [v4 userInterfaceIdiom];

  id v5 = [[_UIColorWelliOSVisualStyle alloc] initWithColorWell:v3];
  return v5;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (_UIColorWellDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);
  return (_UIColorWellDelegate *)WeakRetained;
}

- (void)set_delegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_colorPicker);
  objc_storeStrong((id *)&self->_style, 0);
}

@end