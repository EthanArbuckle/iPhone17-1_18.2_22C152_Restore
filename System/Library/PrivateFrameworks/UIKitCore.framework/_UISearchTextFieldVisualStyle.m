@interface _UISearchTextFieldVisualStyle
+ (double)defaultHeightForBarMetrics:(int64_t)a3;
- (BOOL)usesCustomIntrinsicSize;
- (NSNumber)clearButtonInnerInset;
- (NSNumber)clearButtonOuterInset;
- (UIColor)defaultLeftViewTintColor;
- (UIColor)filledLeftViewTintColor;
- (UIFont)dynamicSearchFieldFont;
- (UISearchTextField)searchTextField;
- (_UISearchTextFieldVisualStyle)initWithInstance:(id)a3;
- (double)backgroundCornerRadius;
- (double)defaultHeight;
- (double)leftViewInset;
- (double)leftViewInsetAddition;
- (double)leftViewToPlaceholderCenteredMargin;
- (double)rightViewInset;
- (double)searchBookmarkButtonOffset;
- (double)searchResultsListButtonOffset;
- (double)searchTextResultsPadding;
- (double)textLeadingInset;
- (double)textLeftInsetLegacy;
- (double)textRightInset;
@end

@implementation _UISearchTextFieldVisualStyle

- (UIFont)dynamicSearchFieldFont
{
  return (UIFont *)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
}

- (NSNumber)clearButtonOuterInset
{
  return 0;
}

- (NSNumber)clearButtonInnerInset
{
  return 0;
}

- (double)rightViewInset
{
  return 1.0;
}

- (double)leftViewInset
{
  BOOL v2 = UISearchBarUsesModernAppearance();
  double result = 8.0;
  if (v2) {
    return 6.0;
  }
  return result;
}

- (double)leftViewInsetAddition
{
  return 0.0;
}

- (double)searchBookmarkButtonOffset
{
  return 9.0;
}

- (double)textLeadingInset
{
  return 5.0;
}

- (_UISearchTextFieldVisualStyle)initWithInstance:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchTextFieldVisualStyle;
  v5 = [(_UISearchTextFieldVisualStyle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_searchTextField, v4);
  }

  return v6;
}

- (UIColor)defaultLeftViewTintColor
{
  return +[UIColor secondaryLabelColor];
}

- (double)backgroundCornerRadius
{
  return 10.0;
}

- (void).cxx_destruct
{
}

- (BOOL)usesCustomIntrinsicSize
{
  return 1;
}

- (double)defaultHeight
{
  return 28.0;
}

+ (double)defaultHeightForBarMetrics:(int64_t)a3
{
  return 28.0;
}

- (double)textLeftInsetLegacy
{
  return 1.0;
}

- (double)textRightInset
{
  return 10.0;
}

- (double)leftViewToPlaceholderCenteredMargin
{
  return 8.0;
}

- (double)searchResultsListButtonOffset
{
  return 8.0;
}

- (double)searchTextResultsPadding
{
  return 10.0;
}

- (UIColor)filledLeftViewTintColor
{
  return +[UIColor secondaryLabelColor];
}

- (UISearchTextField)searchTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchTextField);
  return (UISearchTextField *)WeakRetained;
}

@end