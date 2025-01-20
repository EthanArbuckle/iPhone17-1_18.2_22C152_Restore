@interface UIKeyboardCandidateViewConfigurationPhoneBar
- (BOOL)shouldResizeKeyboardBackdrop;
- (BOOL)shouldUsePredictionViewSecureRenderTraits;
- (id)extendedScrolledState;
- (id)extendedState;
- (id)initialState;
- (unint64_t)rowsToExtend;
@end

@implementation UIKeyboardCandidateViewConfigurationPhoneBar

- (id)initialState
{
  v25.receiver = self;
  v25.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBar;
  v3 = [(UIKeyboardCandidateViewConfiguration *)&v25 initialState];
  [v3 setSortControlPosition:5];
  [v3 setDisambiguationGridPosition:2];
  [v3 setArrowButtonPosition:7];
  [v3 setArrowButtonDirection:0];
  [v3 setBorders:0];
  v4 = +[UIKeyboardImpl sharedInstance];
  if (([v4 _isBackdropVisible] & 1) == 0)
  {

    goto LABEL_5;
  }
  v5 = +[UIKeyboardImpl activeInstance];
  v6 = [v5 textInputTraits];
  uint64_t v7 = [v6 keyboardAppearance];

  if (v7 == 13)
  {
LABEL_5:
    [v3 setHasBackdrop:0];
    v8 = [v3 style];
    [v8 setArrowButtonBackgroundHidden:1];
  }
  v9 = [v3 style];
  objc_msgSend(v9, "setExtraCellPadding:", 8.0, 0.0, 0.0, 0.0);

  v10 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v11 = objc_msgSend(v10, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 1, 6.0, 4.0, 42.0);
  v12 = [v3 style];
  [v12 setArrowButtonSeparatorImage:v11];

  v13 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v14 = objc_msgSend(v13, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 6.0, 4.0, 42.0);
  v15 = [v3 style];
  [v15 setSlottedCellSeparatorImage:v14];

  v16 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v17 = [(UIKeyboardCandidateViewConfiguration *)self highlightedBackgroundColor];
  v18 = objc_msgSend(v16, "highlightedBarCellBackgroundImageWithColor:insets:", v17, 8.0, 2.0, 0.0, 2.0);
  v19 = [v3 style];
  [v19 setHighlightedCellBackgroundImage:v18];

  v20 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v21 = [(UIKeyboardCandidateViewConfiguration *)self highlightedBackgroundColor];
  v22 = objc_msgSend(v20, "highlightedBarCellBackgroundImageWithColor:insets:", v21, 4.0, 3.0, 4.0, 3.0);
  v23 = [v3 disambiguationStyle];
  [v23 setHighlightedCellBackgroundImage:v22];

  return v3;
}

- (id)extendedState
{
  v3 = [(UIKeyboardCandidateViewConfigurationPhoneBar *)self initialState];
  [v3 setPrimaryGridRowType:1];
  [v3 setArrowButtonDirection:1];
  [v3 setInlineTextViewPosition:1];
  [v3 setSortControlPosition:2];
  [v3 setBorders:0];
  v4 = [v3 style];
  [v4 setColumnsCount:6];

  v5 = [v3 style];
  objc_msgSend(v5, "setExtraCellPadding:", 0.0, 0.0, 0.0, 0.0);

  v6 = [v3 style];
  [v6 setArrowButtonSeparatorImage:0];

  uint64_t v7 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v8 = [(UIKeyboardCandidateViewConfiguration *)self highlightedBackgroundColor];
  v9 = objc_msgSend(v7, "highlightedBarCellBackgroundImageWithColor:insets:", v8, 4.0, 2.0, 4.0, 2.0);
  v10 = [v3 style];
  [v10 setHighlightedCellBackgroundImage:v9];

  v11 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorBlack_Alpha8")];
  v12 = [v3 style];
  [v12 setGroupHeaderBackgroundColor:v11];

  return v3;
}

- (id)extendedScrolledState
{
  v2 = [(UIKeyboardCandidateViewConfigurationPhoneBar *)self extendedState];
  v3 = [v2 style];
  [v3 setShowsIndex:1];

  return v2;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 1;
}

- (BOOL)shouldUsePredictionViewSecureRenderTraits
{
  return 1;
}

@end