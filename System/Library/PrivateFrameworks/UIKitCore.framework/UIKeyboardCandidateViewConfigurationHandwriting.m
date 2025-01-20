@interface UIKeyboardCandidateViewConfigurationHandwriting
- (id)initialState;
@end

@implementation UIKeyboardCandidateViewConfigurationHandwriting

- (id)initialState
{
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardCandidateViewConfigurationHandwriting;
  v3 = [(UIKeyboardCandidateViewConfiguration *)&v20 initialState];
  v4 = [v3 style];
  [v4 setBackgroundColor:0];

  v5 = [v3 style];
  [v5 setCellBackgroundColor:0];

  v6 = [v3 style];
  [v6 setGridBackgroundColor:0];

  v7 = [v3 style];
  [v7 setSingleSlottedCellMargin:0.0];

  v8 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v9 = objc_msgSend(v8, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 4.0, 4.0, 42.0);
  v10 = [v3 style];
  [v10 setRightEdgeSeparatorImage:v9];

  v11 = [v3 style];
  [v11 setArrowButtonSeparatorImage:0];

  v12 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v13 = objc_msgSend(v12, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 6.0, 4.0, 42.0);
  v14 = [v3 style];
  [v14 setSlottedCellSeparatorImage:v13];

  v15 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v16 = [(UIKeyboardCandidateViewConfiguration *)self highlightedBackgroundColor];
  v17 = objc_msgSend(v15, "highlightedBarCellBackgroundImageWithColor:insets:", v16, 2.0, 2.0, 2.0, 2.0);
  v18 = [v3 style];
  [v18 setHighlightedCellBackgroundImage:v17];

  return v3;
}

@end