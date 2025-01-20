@interface PKAppearanceSpecifier
- (BOOL)hasDarkAppearance;
- (UIColor)altTextColor;
- (UIColor)backgroundColor;
- (UIColor)buttonBackgroundColor;
- (UIColor)buttonDisabledTextColor;
- (UIColor)buttonTextColor;
- (UIColor)cameraCaptureMaskColor;
- (UIColor)cameraCaptureMaskOutlineColor;
- (UIColor)continueButtonTintColor;
- (UIColor)editableInsertionPointColor;
- (UIColor)editablePlaceholderTextColor;
- (UIColor)editableSelectionBarColor;
- (UIColor)editableSelectionHighlightColor;
- (UIColor)editableTextColor;
- (UIColor)footerHyperlinkColor;
- (UIColor)foregroundColor;
- (UIColor)progressBarTintColor;
- (UIColor)progressBarTrackTintColor;
- (UIColor)searchBarTintcolor;
- (UIColor)tableViewCellAccessoryColor;
- (UIColor)tableViewCellAccessoryHighlightColor;
- (UIColor)tableViewCellHighlightColor;
- (UIColor)tableViewSeparatorColor;
- (UIColor)textColor;
- (UIColor)tintColor;
- (UIImage)navBarPointImage;
- (UIImage)navBarShadowPointImage;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAltTextColor:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonBackgroundColor:(id)a3;
- (void)setButtonDisabledTextColor:(id)a3;
- (void)setButtonTextColor:(id)a3;
- (void)setCameraCaptureMaskColor:(id)a3;
- (void)setCameraCaptureMaskOutlineColor:(id)a3;
- (void)setContinueButtonTintColor:(id)a3;
- (void)setEditableInsertionPointColor:(id)a3;
- (void)setEditablePlaceholderTextColor:(id)a3;
- (void)setEditableSelectionBarColor:(id)a3;
- (void)setEditableSelectionHighlightColor:(id)a3;
- (void)setEditableTextColor:(id)a3;
- (void)setFooterHyperlinkColor:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHasDarkAppearance:(BOOL)a3;
- (void)setNavBarPointImage:(id)a3;
- (void)setNavBarShadowPointImage:(id)a3;
- (void)setProgressBarTintColor:(id)a3;
- (void)setProgressBarTrackTintColor:(id)a3;
- (void)setSearchBarTintcolor:(id)a3;
- (void)setTableViewCellAccessoryColor:(id)a3;
- (void)setTableViewCellAccessoryHighlightColor:(id)a3;
- (void)setTableViewCellHighlightColor:(id)a3;
- (void)setTableViewSeparatorColor:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation PKAppearanceSpecifier

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setHasDarkAppearance:self->_hasDarkAppearance];
  [v4 setBackgroundColor:self->_backgroundColor];
  [v4 setForegroundColor:self->_foregroundColor];
  [v4 setTintColor:self->_tintColor];
  [v4 setTableViewSeparatorColor:self->_tableViewSeparatorColor];
  [v4 setTableViewCellHighlightColor:self->_tableViewCellHighlightColor];
  [v4 setTableViewCellAccessoryColor:self->_tableViewCellAccessoryColor];
  [v4 setTableViewCellAccessoryHighlightColor:self->_tableViewCellAccessoryHighlightColor];
  [v4 setTextColor:self->_textColor];
  [v4 setAltTextColor:self->_altTextColor];
  [v4 setButtonTextColor:self->_buttonTextColor];
  [v4 setButtonDisabledTextColor:self->_buttonDisabledTextColor];
  [v4 setButtonBackgroundColor:self->_buttonBackgroundColor];
  [v4 setContinueButtonTintColor:self->_continueButtonTintColor];
  [v4 setEditableTextColor:self->_editableTextColor];
  [v4 setEditablePlaceholderTextColor:self->_editablePlaceholderTextColor];
  [v4 setEditableInsertionPointColor:self->_editableInsertionPointColor];
  [v4 setEditableSelectionBarColor:self->_editableSelectionBarColor];
  [v4 setEditableSelectionHighlightColor:self->_editableSelectionHighlightColor];
  [v4 setFooterHyperlinkColor:self->_footerHyperlinkColor];
  [v4 setProgressBarTintColor:self->_progressBarTintColor];
  [v4 setProgressBarTrackTintColor:self->_progressBarTrackTintColor];
  [v4 setCameraCaptureMaskColor:self->_cameraCaptureMaskColor];
  [v4 setCameraCaptureMaskOutlineColor:self->_cameraCaptureMaskOutlineColor];
  [v4 setNavBarPointImage:self->_navBarPointImage];
  [v4 setNavBarShadowPointImage:self->_navBarShadowPointImage];
  return v4;
}

- (BOOL)hasDarkAppearance
{
  return self->_hasDarkAppearance;
}

- (void)setHasDarkAppearance:(BOOL)a3
{
  self->_hasDarkAppearance = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)tableViewSeparatorColor
{
  return self->_tableViewSeparatorColor;
}

- (void)setTableViewSeparatorColor:(id)a3
{
}

- (UIColor)tableViewCellHighlightColor
{
  return self->_tableViewCellHighlightColor;
}

- (void)setTableViewCellHighlightColor:(id)a3
{
}

- (UIColor)tableViewCellAccessoryColor
{
  return self->_tableViewCellAccessoryColor;
}

- (void)setTableViewCellAccessoryColor:(id)a3
{
}

- (UIColor)tableViewCellAccessoryHighlightColor
{
  return self->_tableViewCellAccessoryHighlightColor;
}

- (void)setTableViewCellAccessoryHighlightColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)altTextColor
{
  return self->_altTextColor;
}

- (void)setAltTextColor:(id)a3
{
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
}

- (UIColor)buttonDisabledTextColor
{
  return self->_buttonDisabledTextColor;
}

- (void)setButtonDisabledTextColor:(id)a3
{
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (void)setButtonBackgroundColor:(id)a3
{
}

- (UIColor)continueButtonTintColor
{
  return self->_continueButtonTintColor;
}

- (void)setContinueButtonTintColor:(id)a3
{
}

- (UIColor)editableTextColor
{
  return self->_editableTextColor;
}

- (void)setEditableTextColor:(id)a3
{
}

- (UIColor)editablePlaceholderTextColor
{
  return self->_editablePlaceholderTextColor;
}

- (void)setEditablePlaceholderTextColor:(id)a3
{
}

- (UIColor)editableInsertionPointColor
{
  return self->_editableInsertionPointColor;
}

- (void)setEditableInsertionPointColor:(id)a3
{
}

- (UIColor)editableSelectionBarColor
{
  return self->_editableSelectionBarColor;
}

- (void)setEditableSelectionBarColor:(id)a3
{
}

- (UIColor)editableSelectionHighlightColor
{
  return self->_editableSelectionHighlightColor;
}

- (void)setEditableSelectionHighlightColor:(id)a3
{
}

- (UIColor)footerHyperlinkColor
{
  return self->_footerHyperlinkColor;
}

- (void)setFooterHyperlinkColor:(id)a3
{
}

- (UIColor)progressBarTintColor
{
  return self->_progressBarTintColor;
}

- (void)setProgressBarTintColor:(id)a3
{
}

- (UIColor)progressBarTrackTintColor
{
  return self->_progressBarTrackTintColor;
}

- (void)setProgressBarTrackTintColor:(id)a3
{
}

- (UIColor)searchBarTintcolor
{
  return self->_searchBarTintcolor;
}

- (void)setSearchBarTintcolor:(id)a3
{
}

- (UIColor)cameraCaptureMaskColor
{
  return self->_cameraCaptureMaskColor;
}

- (void)setCameraCaptureMaskColor:(id)a3
{
}

- (UIColor)cameraCaptureMaskOutlineColor
{
  return self->_cameraCaptureMaskOutlineColor;
}

- (void)setCameraCaptureMaskOutlineColor:(id)a3
{
}

- (UIImage)navBarPointImage
{
  return self->_navBarPointImage;
}

- (void)setNavBarPointImage:(id)a3
{
}

- (UIImage)navBarShadowPointImage
{
  return self->_navBarShadowPointImage;
}

- (void)setNavBarShadowPointImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarShadowPointImage, 0);
  objc_storeStrong((id *)&self->_navBarPointImage, 0);
  objc_storeStrong((id *)&self->_cameraCaptureMaskOutlineColor, 0);
  objc_storeStrong((id *)&self->_cameraCaptureMaskColor, 0);
  objc_storeStrong((id *)&self->_searchBarTintcolor, 0);
  objc_storeStrong((id *)&self->_progressBarTrackTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarTintColor, 0);
  objc_storeStrong((id *)&self->_footerHyperlinkColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionBarColor, 0);
  objc_storeStrong((id *)&self->_editableInsertionPointColor, 0);
  objc_storeStrong((id *)&self->_editablePlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextColor, 0);
  objc_storeStrong((id *)&self->_continueButtonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_buttonDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_altTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellAccessoryHighlightColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellAccessoryColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellHighlightColor, 0);
  objc_storeStrong((id *)&self->_tableViewSeparatorColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end