@interface UIKeyboardCandidateViewConfigurationTenKey
- (id)initialState;
- (unint64_t)maxNumberOfProactiveCandidates;
@end

@implementation UIKeyboardCandidateViewConfigurationTenKey

- (id)initialState
{
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardCandidateViewConfigurationTenKey;
  v3 = [(UIKeyboardCandidateViewConfiguration *)&v20 initialState];
  [v3 setSortControlPosition:4];
  [v3 setPrimaryGridRowType:1];
  [v3 setDisambiguationGridRowType:1];
  [v3 setDisambiguationGridPosition:1];
  v4 = +[UIColor clearColor];
  v5 = [v3 style];
  [v5 setSortControlBackgroundColor:v4];

  if ([(UIKeyboardCandidateViewConfiguration *)self darkKeyboard]) {
    +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorWhite_Alpha30")];
  }
  else {
  v6 = +[UIColor whiteColor];
  }
  v7 = [v3 style];
  [v7 setGridBackgroundColor:v6];

  if ([(UIKeyboardCandidateViewConfiguration *)self darkKeyboard]) {
    +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorWhite_Alpha30")];
  }
  else {
  v8 = +[UIColor whiteColor];
  }
  v9 = [v3 disambiguationStyle];
  [v9 setGridBackgroundColor:v8];

  BOOL v10 = [(UIKeyboardCandidateViewConfiguration *)self darkKeyboard];
  v11 = UIKBColorWhite_Alpha60;
  if (!v10) {
    v11 = UIKBCandidateBarCellSecondaryCandidateText;
  }
  v12 = +[UIColor colorWithCGColor:UIKBGetNamedColor(*v11)];
  v13 = [v3 disambiguationStyle];
  [v13 setTextColor:v12];

  if ([(UIKeyboardCandidateViewConfiguration *)self darkKeyboard]) {
    +[UIColor whiteColor];
  }
  else {
  v14 = +[UIColor systemBlueColor];
  }
  v15 = [v3 disambiguationStyle];
  [v15 setHighlightedTextColor:v14];

  v16 = [v3 disambiguationStyle];
  [v16 setHighlightedCellBackgroundImage:0];

  v17 = [v3 style];
  [v17 setFillGridWithLines:1];

  v18 = [v3 style];
  [v18 setMaxNumberOfProactiveCells:1];

  return v3;
}

- (unint64_t)maxNumberOfProactiveCandidates
{
  return 4;
}

@end