@interface UIKeyboardCandidateViewConfigurationHandwritingPad
- (id)initialState;
@end

@implementation UIKeyboardCandidateViewConfigurationHandwritingPad

- (id)initialState
{
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardCandidateViewConfigurationHandwritingPad;
  v3 = [(UIKeyboardCandidateViewConfigurationHandwriting *)&v21 initialState];
  v4 = [v3 style];
  [v4 setMinimumCellWidth:60.0];

  v5 = [v3 style];
  [v5 setMinimumCellPadding:18.0];

  v6 = [v3 style];
  objc_msgSend(v6, "setExtraCellPadding:", 8.0, 0.0, 8.0, 0.0);

  v7 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v8 = objc_msgSend(v7, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 9.5, 9.5, 55.0);
  v9 = [v3 style];
  [v9 setLeftEdgeSeparatorImage:v8];

  v10 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v11 = objc_msgSend(v10, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 1, 9.5, 9.5, 55.0);
  v12 = [v3 style];
  [v12 setRightEdgeSeparatorImage:v11];

  v13 = [v3 style];
  v14 = [v13 leftEdgeSeparatorImage];
  v15 = [v3 style];
  [v15 setSlottedCellSeparatorImage:v14];

  v16 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  v17 = [(UIKeyboardCandidateViewConfiguration *)self highlightedBackgroundColor];
  v18 = objc_msgSend(v16, "highlightedBarCellBackgroundImageWithColor:insets:", v17, 8.0, 2.0, 6.0, 2.0);
  v19 = [v3 style];
  [v19 setHighlightedCellBackgroundImage:v18];

  return v3;
}

@end