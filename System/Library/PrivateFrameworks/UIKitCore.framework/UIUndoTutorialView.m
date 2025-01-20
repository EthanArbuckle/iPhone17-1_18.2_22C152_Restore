@interface UIUndoTutorialView
- (BOOL)presentsFullScreen;
- (UIUndoTutorialView)initWithKeyboardAppearance:(int64_t)a3;
- (id)largeTitle;
- (void)updateConstraints;
@end

@implementation UIUndoTutorialView

- (UIUndoTutorialView)initWithKeyboardAppearance:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIUndoTutorialView;
  v3 = [(UIKBTutorialModalDisplay *)&v7 initWithKeyboardAppearance:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (id)largeTitle
{
  return _UILocalizedStringInSystemLanguage(@"Productivity Gestures", @"Productivity Gestures");
}

- (BOOL)presentsFullScreen
{
  return 1;
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)UIUndoTutorialView;
  [(UIKBEditingGesturesIntroduction *)&v4 updateConstraints];
  v3 = [(UIKBEditingGesturesIntroduction *)self topPaddingConstraint];
  [v3 setConstant:0.0];
}

@end