@interface UIKeyboardCandidateViewConfigurationPadFloatingBar
- (BOOL)allowsPullDownGesture;
- (BOOL)willCoverKeyboardLayout;
- (id)extendedState;
- (id)initialState;
@end

@implementation UIKeyboardCandidateViewConfigurationPadFloatingBar

- (id)initialState
{
  v15.receiver = self;
  v15.super_class = (Class)UIKeyboardCandidateViewConfigurationPadFloatingBar;
  v2 = [(UIKeyboardCandidateViewConfigurationPhoneBarDown *)&v15 initialState];
  [v2 setHasBackdrop:1];
  +[UIKeyboardPopoverContainer cornerRadius];
  double v4 = v3;
  v5 = [v2 style];
  [v5 setCornerRadius:v4];

  v6 = [v2 style];
  [v6 setMaskedCorners:3];

  [v2 setBorders:10];
  v7 = +[UIKeyboardPopoverContainer borderColor];
  v8 = [v2 style];
  [v8 setLineColor:v7];

  v9 = [v2 style];
  [v9 setDoNotClipToBounds:1];

  v10 = [v2 style];
  [v10 rowHeight];
  double v12 = v11;
  v13 = [v2 style];
  objc_msgSend(v13, "setGridPadding:", 0.0, 3.0, 0.0, v12);

  return v2;
}

- (id)extendedState
{
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardCandidateViewConfigurationPadFloatingBar;
  v2 = [(UIKeyboardCandidateViewConfigurationPhoneBarDown *)&v13 extendedState];
  [v2 setHasBackdrop:1];
  double v3 = +[UIColor clearColor];
  double v4 = [v2 style];
  [v4 setGridBackgroundColor:v3];

  v5 = [v2 style];
  [v5 setColumnsCount:4];

  +[UIKeyboardPopoverContainer cornerRadius];
  double v7 = v6;
  v8 = [v2 style];
  [v8 setCornerRadius:v7];

  [v2 setBorders:10];
  v9 = +[UIKeyboardPopoverContainer borderColor];
  v10 = [v2 style];
  [v10 setLineColor:v9];

  double v11 = [v2 style];
  [v11 setDoNotClipToBounds:1];

  return v2;
}

- (BOOL)allowsPullDownGesture
{
  return 1;
}

- (BOOL)willCoverKeyboardLayout
{
  return 1;
}

@end