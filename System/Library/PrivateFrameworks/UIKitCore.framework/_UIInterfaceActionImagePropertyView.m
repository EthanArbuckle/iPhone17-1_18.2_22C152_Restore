@interface _UIInterfaceActionImagePropertyView
- (BOOL)isUsedToOccupySpaceIfNoImage;
- (CGSize)_sizeToOccupy;
- (NSString)imageProperty;
- (UIInterfaceAction)action;
- (_UIInterfaceActionImagePropertyView)initWithAction:(id)a3 imageProperty:(id)a4;
- (id)_interfaceActionViewState;
- (id)_visualStyle;
- (void)_applyVisualStyleToImageView;
- (void)_reloadImageContent;
- (void)dealloc;
- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4;
- (void)setImage:(id)a3;
- (void)tintColorDidChange;
@end

@implementation _UIInterfaceActionImagePropertyView

- (_UIInterfaceActionImagePropertyView)initWithAction:(id)a3 imageProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIInterfaceActionImagePropertyView;
  v9 = [(UIImageView *)&v20 initWithImage:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_imageProperty, a4);
    [(UIImageView *)v10 _setDefaultRenderingMode:2];
    v11 = [(UIView *)v10 widthAnchor];
    uint64_t v12 = [v11 constraintEqualToConstant:0.0];
    imageWidthConstraint = v10->_imageWidthConstraint;
    v10->_imageWidthConstraint = (NSLayoutConstraint *)v12;

    [(NSLayoutConstraint *)v10->_imageWidthConstraint setIdentifier:@"imageWidth"];
    v14 = [(UIView *)v10 heightAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:0.0];
    imageHeightConstraint = v10->_imageHeightConstraint;
    v10->_imageHeightConstraint = (NSLayoutConstraint *)v15;

    [(NSLayoutConstraint *)v10->_imageHeightConstraint setIdentifier:@"imageHeight"];
    LODWORD(v17) = 1148846080;
    [(UIView *)v10 setContentHuggingPriority:1 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(UIView *)v10 setContentHuggingPriority:0 forAxis:v18];
    [(_UIInterfaceActionImagePropertyView *)v10 _reloadImageContent];
    [(UIInterfaceAction *)v10->_action _addActionDisplayPropertyObserver:v10];
  }

  return v10;
}

- (void)dealloc
{
  [(UIInterfaceAction *)self->_action _removeActionDisplayPropertyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionImagePropertyView;
  [(UIImageView *)&v3 dealloc];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(UIImageView *)self image];

  if (v5 != v4)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_imageWidthConstraint, self->_imageHeightConstraint, 0);
    [(_UIInterfaceActionImagePropertyView *)self _sizeToOccupy];
    if (v4)
    {
      [v4 size];
      double v10 = v9;
      double v12 = v11;
      [v4 alignmentRectInsets];
      double v14 = v13;
      [v4 alignmentRectInsets];
      double v16 = v10 - (v14 + v15);
      [v4 alignmentRectInsets];
      double v18 = v17;
      [v4 alignmentRectInsets];
      double v20 = v12 - (v18 + v19);
      [(NSLayoutConstraint *)self->_imageWidthConstraint setConstant:v16];
      imageHeightConstraint = self->_imageHeightConstraint;
      double v22 = v20;
    }
    else
    {
      double v23 = v7;
      double v24 = v8;
      if (![(_UIInterfaceActionImagePropertyView *)self isUsedToOccupySpaceIfNoImage])
      {
        [MEMORY[0x1E4F5B268] deactivateConstraints:v6];
        goto LABEL_8;
      }
      [(NSLayoutConstraint *)self->_imageWidthConstraint setConstant:v23];
      imageHeightConstraint = self->_imageHeightConstraint;
      double v22 = v24;
    }
    [(NSLayoutConstraint *)imageHeightConstraint setConstant:v22];
    [MEMORY[0x1E4F5B268] activateConstraints:v6];
LABEL_8:
    v25.receiver = self;
    v25.super_class = (Class)_UIInterfaceActionImagePropertyView;
    [(UIImageView *)&v25 setImage:v4];
  }
}

- (BOOL)isUsedToOccupySpaceIfNoImage
{
  [(_UIInterfaceActionImagePropertyView *)self _sizeToOccupy];
  return v3 != *(double *)(MEMORY[0x1E4F1DB30] + 8) || v2 != *MEMORY[0x1E4F1DB30];
}

- (void)tintColorDidChange
{
  [(_UIInterfaceActionImagePropertyView *)self _reloadImageContent];
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionImagePropertyView;
  [(UIImageView *)&v3 tintColorDidChange];
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  id v8 = a4;
  if ([v8 containsObject:self->_imageProperty])
  {
    [(_UIInterfaceActionImagePropertyView *)self _reloadImageContent];
  }
  else
  {
    id v5 = [(_UIInterfaceActionImagePropertyView *)self _visualStyle];
    v6 = [v5 actionPropertiesAffectingImageViewStyling];
    BOOL v7 = +[UIInterfaceAction changedProperties:v8 containsAny:v6];

    if (v7) {
      [(_UIInterfaceActionImagePropertyView *)self _applyVisualStyleToImageView];
    }
  }
}

- (void)_applyVisualStyleToImageView
{
  objc_super v3 = [(UIImageView *)self image];

  if (v3)
  {
    id v6 = [(_UIInterfaceActionImagePropertyView *)self _visualStyle];
    imageProperty = self->_imageProperty;
    id v5 = [(_UIInterfaceActionImagePropertyView *)self _interfaceActionViewState];
    [v6 configureAttributesForImageView:self imageProperty:imageProperty actionViewState:v5];
  }
}

- (id)_interfaceActionViewState
{
  objc_super v3 = [(_UIInterfaceActionImagePropertyView *)self action];
  id v4 = +[UIInterfaceActionViewState viewStateForActionRepresentationViewDescendantView:self action:v3];

  return v4;
}

- (CGSize)_sizeToOccupy
{
  objc_super v3 = [(_UIInterfaceActionImagePropertyView *)self action];
  [v3 _layoutSizeForImageProperty:self->_imageProperty];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_reloadImageContent
{
  objc_super v3 = [(_UIInterfaceActionImagePropertyView *)self action];
  id v5 = [v3 valueForKey:self->_imageProperty];

  [(_UIInterfaceActionImagePropertyView *)self setImage:v5];
  double v4 = 1.0;
  if (!v5) {
    double v4 = 0.0;
  }
  [(UIView *)self setAlpha:v4];
  [(_UIInterfaceActionImagePropertyView *)self _applyVisualStyleToImageView];
}

- (id)_visualStyle
{
  return [(UIInterfaceAction *)self->_action _visualStyle];
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (NSString)imageProperty
{
  return self->_imageProperty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperty, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
}

@end