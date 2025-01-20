@interface UIKeyboardCandidateViewConfigurationPadBarLandscape
- (id)extendedState;
- (id)initialState;
- (unint64_t)maxNumberOfProactiveCandidates;
@end

@implementation UIKeyboardCandidateViewConfigurationPadBarLandscape

- (id)initialState
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBarLandscape;
  v2 = [(UIKeyboardCandidateViewConfigurationPadBar *)&v5 initialState];
  v3 = [v2 style];
  [v3 setMaxNumberOfProactiveCells:3];

  return v2;
}

- (id)extendedState
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBarLandscape;
  v2 = [(UIKeyboardCandidateViewConfigurationPadBar *)&v5 extendedState];
  v3 = [v2 style];
  [v3 setColumnsCount:19];

  return v2;
}

- (unint64_t)maxNumberOfProactiveCandidates
{
  return 3;
}

@end