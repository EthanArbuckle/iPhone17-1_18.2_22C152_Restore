@interface _UITextFieldVisualStyle_iOS
- (BOOL)textShouldUseVibrancy;
- (id)defaultFocusedTextColor;
- (id)defaultTextColor;
- (id)defaultTextColorForKeyboardAppearance;
- (id)parentViewForTextContentView;
- (id)placeholderColor;
@end

@implementation _UITextFieldVisualStyle_iOS

- (id)parentViewForTextContentView
{
  v2 = [(_UITextFieldVisualStyle *)self styleSubject];
  v3 = [v2 _contentView];

  return v3;
}

- (id)defaultTextColor
{
  return +[UIColor labelColor];
}

- (id)defaultTextColorForKeyboardAppearance
{
  return +[UIColor labelColor];
}

- (id)defaultFocusedTextColor
{
  return 0;
}

- (id)placeholderColor
{
  return +[UIColor placeholderTextColor];
}

- (BOOL)textShouldUseVibrancy
{
  return 0;
}

@end