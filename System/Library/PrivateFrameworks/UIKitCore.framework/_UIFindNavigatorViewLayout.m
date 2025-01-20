@interface _UIFindNavigatorViewLayout
- (BOOL)isEqual:(id)a3;
- (BOOL)replaceFieldVisible;
- (BOOL)showsReplaceInOptionsMenu;
- (BOOL)usesAssistantBarHeight;
- (BOOL)usesNextAndPreviousArrows;
- (BOOL)usesSymbolForDoneButton;
- (CGSize)preferredContentSize;
- (NSString)preferredMaximumContentSizeCategory;
- (UIButton)doneButton;
- (UIButton)nextResultButton;
- (UIButton)previousResultButton;
- (UIButton)replaceButton;
- (UIColor)preferredOpaqueBackgroundColor;
- (UIFont)preferredTextFieldFont;
- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImageForTextFields;
- (UIView)replaceTextField;
- (UIView)searchTextField;
- (double)preferredCornerRadius;
- (double)preferredHorizontalPadding;
- (double)preferredVerticalPadding;
- (id)commonButtonConfig:(id)a3;
- (id)commonButtonConfigWithImageName:(id)a3 isAccessory:(BOOL)a4;
- (id)commonButtonConfigWithTitle:(id)a3;
- (int64_t)assistantBarStyle;
- (void)setAssistantBarStyle:(int64_t)a3;
- (void)setDoneButton:(id)a3;
- (void)setNextResultButton:(id)a3;
- (void)setPreviousResultButton:(id)a3;
- (void)setReplaceButton:(id)a3;
- (void)setReplaceFieldVisible:(BOOL)a3;
- (void)setReplaceTextField:(id)a3;
- (void)setSearchTextField:(id)a3;
- (void)setUsesAssistantBarHeight:(BOOL)a3;
@end

@implementation _UIFindNavigatorViewLayout

- (BOOL)isEqual:(id)a3
{
  v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return [v3 isEqual:v4];
}

- (CGSize)preferredContentSize
{
  if (self->_usesAssistantBarHeight)
  {
    v3 = [(UIView *)self traitCollection];
    +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v3];
  }
  else
  {
    v3 = [(_UIFindNavigatorViewLayout *)self preferredTextFieldFont];
    [v3 _scaledValueForValue:49.0];
    UIRoundToViewScale(self);
  }
  double v5 = v4;

  double v6 = -1.0;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSString)preferredMaximumContentSizeCategory
{
  return (NSString *)@"UICTContentSizeCategoryAccessibilityM";
}

- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImageForTextFields
{
  return +[UIImageSymbolConfiguration configurationWithScale:2];
}

- (UIFont)preferredTextFieldFont
{
  v2 = [(_UIFindNavigatorViewLayout *)self preferredMaximumContentSizeCategory];
  v3 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleBody" maximumContentSizeCategory:v2];

  return (UIFont *)v3;
}

- (UIColor)preferredOpaqueBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (double)preferredCornerRadius
{
  return 0.0;
}

- (double)preferredHorizontalPadding
{
  return 4.0;
}

- (double)preferredVerticalPadding
{
  return 4.0;
}

- (BOOL)showsReplaceInOptionsMenu
{
  return 1;
}

- (id)commonButtonConfig:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  double v4 = +[UIButtonConfiguration borderlessButtonConfiguration];
  [v4 setMacIdiomStyle:1];
  v3[2](v3, v4);

  return v4;
}

- (id)commonButtonConfigWithTitle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke;
  v8[3] = &unk_1E52D9ED0;
  id v5 = v4;
  id v9 = v5;
  objc_copyWeak(&v10, &location);
  double v6 = [(_UIFindNavigatorViewLayout *)self commonButtonConfig:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v6;
}

- (id)commonButtonConfigWithImageName:(id)a3 isAccessory:(BOOL)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74___UIFindNavigatorViewLayout_commonButtonConfigWithImageName_isAccessory___block_invoke;
  v9[3] = &unk_1E52D9EF8;
  id v10 = v5;
  id v6 = v5;
  double v7 = [(_UIFindNavigatorViewLayout *)self commonButtonConfig:v9];

  return v7;
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  self->_assistantBarStyle = a3;
  [(UIView *)self setNeedsLayout];
}

- (UIButton)nextResultButton
{
  return self->_nextResultButton;
}

- (void)setNextResultButton:(id)a3
{
}

- (UIButton)previousResultButton
{
  return self->_previousResultButton;
}

- (void)setPreviousResultButton:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIButton)replaceButton
{
  return self->_replaceButton;
}

- (void)setReplaceButton:(id)a3
{
}

- (UIView)searchTextField
{
  return self->_searchTextField;
}

- (void)setSearchTextField:(id)a3
{
}

- (UIView)replaceTextField
{
  return self->_replaceTextField;
}

- (void)setReplaceTextField:(id)a3
{
}

- (BOOL)replaceFieldVisible
{
  return self->_replaceFieldVisible;
}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  self->_replaceFieldVisible = a3;
}

- (BOOL)usesAssistantBarHeight
{
  return self->_usesAssistantBarHeight;
}

- (void)setUsesAssistantBarHeight:(BOOL)a3
{
  self->_usesAssistantBarHeight = a3;
}

- (int64_t)assistantBarStyle
{
  return self->_assistantBarStyle;
}

- (BOOL)usesSymbolForDoneButton
{
  return self->_usesSymbolForDoneButton;
}

- (BOOL)usesNextAndPreviousArrows
{
  return self->_usesNextAndPreviousArrows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceTextField, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_storeStrong((id *)&self->_replaceButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_previousResultButton, 0);
  objc_storeStrong((id *)&self->_nextResultButton, 0);
}

@end