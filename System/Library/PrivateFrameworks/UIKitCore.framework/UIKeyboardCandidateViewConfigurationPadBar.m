@interface UIKeyboardCandidateViewConfigurationPadBar
- (BOOL)shouldAlwaysShowSortControl;
- (BOOL)shouldResizeKeyboardBackdrop;
- (double)candidateDefaultFontSize;
- (id)arrowButtonSeparatorImage;
- (id)edgeSeparatorImage;
- (id)extendedScrolledState;
- (id)extendedState;
- (id)initialState;
- (unint64_t)rowsToExtend;
@end

@implementation UIKeyboardCandidateViewConfigurationPadBar

- (id)arrowButtonSeparatorImage
{
  v3 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v4 = objc_msgSend(v3, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 1, 9.5, 9.5, 55.0);

  return v4;
}

- (id)edgeSeparatorImage
{
  v3 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v4 = objc_msgSend(v3, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 9.5, 9.5, 55.0);

  return v4;
}

- (id)initialState
{
  v30.receiver = self;
  v30.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBar;
  v3 = [(UIKeyboardCandidateViewConfigurationPhoneBar *)&v30 initialState];
  [v3 setDisambiguationGridPosition:0];
  v4 = +[UIColor clearColor];
  v5 = [v3 style];
  [v5 setBackgroundColor:v4];

  v6 = +[UIColor clearColor];
  v7 = [v3 style];
  [v7 setArrowButtonBackgroundColor:v6];

  v8 = +[UIColor clearColor];
  v9 = [v3 style];
  [v9 setGridBackgroundColor:v8];

  v10 = +[UIColor clearColor];
  v11 = [v3 style];
  [v11 setSortControlBackgroundColor:v10];

  [v3 setHasBackdrop:1];
  [v3 setBorders:0];
  [v3 setSortControlPosition:0];
  v12 = [v3 style];
  [v12 setMinimumCellWidth:60.0];

  v13 = [v3 style];
  [v13 setMinimumCellPadding:18.0];

  v14 = [v3 style];
  objc_msgSend(v14, "setExtraCellPadding:", 8.0, 0.0, 8.0, 0.0);

  v15 = [v3 style];
  [v15 setSingleSlottedCellMargin:0.0];

  v16 = [(UIKeyboardCandidateViewConfigurationPadBar *)self edgeSeparatorImage];
  v17 = [v3 style];
  [v17 setLeftEdgeSeparatorImage:v16];

  v18 = [(UIKeyboardCandidateViewConfigurationPadBar *)self edgeSeparatorImage];
  v19 = [v3 style];
  [v19 setRightEdgeSeparatorImage:v18];

  v20 = [(UIKeyboardCandidateViewConfigurationPadBar *)self arrowButtonSeparatorImage];
  v21 = [v3 style];
  [v21 setArrowButtonSeparatorImage:v20];

  v22 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v23 = objc_msgSend(v22, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 9.5, 9.5, 55.0);
  v24 = [v3 style];
  [v24 setSlottedCellSeparatorImage:v23];

  v25 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v26 = [(UIKeyboardCandidateViewConfiguration *)self highlightedBackgroundColor];
  v27 = objc_msgSend(v25, "highlightedBarCellBackgroundImageWithColor:insets:", v26, 8.0, 2.0, 6.0, 2.0);
  v28 = [v3 style];
  [v28 setHighlightedCellBackgroundImage:v27];

  return v3;
}

- (id)extendedState
{
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBar;
  v2 = [(UIKeyboardCandidateViewConfigurationPhoneBar *)&v13 extendedState];
  [v2 setSortControlPosition:1];
  [v2 setInlineTextViewPosition:0];
  v3 = +[UIColor clearColor];
  v4 = [v2 style];
  [v4 setGridBackgroundColor:v3];

  v5 = [v2 style];
  [v5 setColumnsCount:13];

  v6 = [v2 style];
  [v6 setLeftEdgeSeparatorImage:0];

  v7 = [v2 style];
  [v7 setRightEdgeSeparatorImage:0];

  v8 = [v2 style];
  [v8 setArrowButtonSeparatorImage:0];

  double v9 = UIKBCornerRadius();
  v10 = [v2 style];
  [v10 setCornerRadius:v9];

  v11 = [v2 style];
  [v11 setMaskedCorners:3];

  return v2;
}

- (id)extendedScrolledState
{
  return 0;
}

- (double)candidateDefaultFontSize
{
  return 22.0;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 0;
}

- (unint64_t)rowsToExtend
{
  return 4;
}

- (BOOL)shouldAlwaysShowSortControl
{
  return 1;
}

@end