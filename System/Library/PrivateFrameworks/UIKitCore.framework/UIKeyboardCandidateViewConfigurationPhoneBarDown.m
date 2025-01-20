@interface UIKeyboardCandidateViewConfigurationPhoneBarDown
- (BOOL)allowsPullDownGesture;
- (BOOL)shouldResizeKeyboardBackdrop;
- (BOOL)willCoverKeyboardLayout;
- (id)extendedScrolledState;
- (id)extendedState;
- (id)initialState;
- (unint64_t)rowsToExtend;
@end

@implementation UIKeyboardCandidateViewConfigurationPhoneBarDown

- (id)initialState
{
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarDown;
  v2 = [(UIKeyboardCandidateViewConfigurationPhoneBar *)&v18 initialState];
  [v2 setArrowButtonDirection:1];
  [v2 setSortControlPosition:4];
  v3 = [v2 style];
  [v3 rowHeight];
  double v5 = v4;
  v6 = [v2 style];
  objc_msgSend(v6, "setGridPadding:", 0.0, 1.0, 0.0, v5);

  v7 = [v2 style];
  [v7 rowHeight];
  double v9 = v8;
  v10 = [v2 style];
  objc_msgSend(v10, "setGridLinePadding:", 0.0, 0.0, 0.0, v9);

  v11 = [v2 style];
  [v11 rowHeight];
  double v13 = v12;
  v14 = [v2 style];
  objc_msgSend(v14, "setSortControlPadding:", 0.0, 0.0, 0.0, v13);

  v15 = [v2 style];
  objc_msgSend(v15, "setGridLineOffset:", 0.0, 4.0);

  v16 = [v2 style];
  [v16 setDoNotClipToBounds:1];

  return v2;
}

- (id)extendedState
{
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarDown;
  v3 = [(UIKeyboardCandidateViewConfigurationPhoneBar *)&v12 extendedState];
  [v3 setArrowButtonDirection:0];
  [v3 setInlineTextViewPosition:0];
  [v3 setArrowButtonPosition:7];
  [v3 setSortControlPosition:4];
  double v4 = [v3 style];
  objc_msgSend(v4, "setExtraCellPadding:", 8.0, 0.0, 0.0, 0.0);

  double v5 = +[UIKeyboardImpl sharedInstance];
  objc_msgSend(v3, "setHasBackdrop:", objc_msgSend(v5, "_isBackdropVisible"));

  v6 = [v3 style];
  [v6 setDoNotClipToBounds:1];

  v7 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  double v8 = [(UIKeyboardCandidateViewConfiguration *)self highlightedBackgroundColor];
  double v9 = objc_msgSend(v7, "highlightedBarCellBackgroundImageWithColor:insets:", v8, 8.0, 2.0, 0.0, 2.0);
  v10 = [v3 style];
  [v10 setHighlightedCellBackgroundImage:v9];

  return v3;
}

- (id)extendedScrolledState
{
  return 0;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 0;
}

- (BOOL)willCoverKeyboardLayout
{
  return 1;
}

- (BOOL)allowsPullDownGesture
{
  return 1;
}

@end