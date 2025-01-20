@interface _UITextFieldVisualStyle_tvOS
- (BOOL)textShouldUseVibrancy;
- (id)_defaultEditingFont;
- (id)_defaultTextColorBlackKeyboard;
- (id)_defaultTextColorDarkKeyboard;
- (id)_defaultTextColorForUserInterfaceStyle;
- (id)_defaultTextColorLightKeyboard;
- (id)_placeholderTextColorBlackKeyboard;
- (id)_placeholderTextColorDarkKeyboard;
- (id)_placeholderTextColorFocused;
- (id)_placeholderTextColorLightKeyboard;
- (id)defaultFocusedTextColor;
- (id)defaultTextColor;
- (id)defaultTextColorForKeyboardAppearance;
- (id)editingProcessorOverridingEditingAttributes:(id)a3;
- (id)parentViewForTextContentView;
- (id)placeholderColor;
- (void)handleTextVibrancy;
@end

@implementation _UITextFieldVisualStyle_tvOS

- (id)defaultTextColor
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  char v4 = [v3 _shouldDetermineInterfaceStyleTextColor];

  if ((v4 & 1) != 0 && dyld_program_sdk_at_least())
  {
    v5 = [(_UITextFieldVisualStyle_tvOS *)self _defaultTextColorForUserInterfaceStyle];
  }
  else
  {
    v5 = [(_UITextFieldVisualStyle_tvOS *)self defaultTextColorForKeyboardAppearance];
  }
  return v5;
}

- (id)defaultTextColorForKeyboardAppearance
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  uint64_t v4 = [v3 _keyboardAppearance];

  if (v4 == 1)
  {
    v5 = [(_UITextFieldVisualStyle_tvOS *)self _defaultTextColorDarkKeyboard];
  }
  else if (v4 == 10)
  {
    v5 = [(_UITextFieldVisualStyle_tvOS *)self _defaultTextColorForUserInterfaceStyle];
  }
  else
  {
    if (v4 == 9) {
      [(_UITextFieldVisualStyle_tvOS *)self _defaultTextColorBlackKeyboard];
    }
    else {
    v5 = [(_UITextFieldVisualStyle_tvOS *)self _defaultTextColorLightKeyboard];
    }
  }
  return v5;
}

- (id)defaultFocusedTextColor
{
  return +[UIColor blackColor];
}

- (id)placeholderColor
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  if ([v3 _isFocused])
  {
    uint64_t v4 = [(_UITextFieldVisualStyle *)self styleSubject];
    int v5 = [v4 _fieldEditorAttached];

    if (!v5)
    {
      uint64_t v6 = [(_UITextFieldVisualStyle_tvOS *)self _placeholderTextColorFocused];
LABEL_15:
      id v12 = (id)v6;
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_UITextFieldVisualStyle *)self styleSubject];
  uint64_t v8 = [v7 _keyboardAppearance];

  v9 = [(_UITextFieldVisualStyle *)self styleSubject];
  uint64_t v10 = [v9 _userInterfaceStyle];

  if (v8 == 1)
  {
    uint64_t v6 = [(_UITextFieldVisualStyle_tvOS *)self _placeholderTextColorDarkKeyboard];
    goto LABEL_15;
  }
  if (v8 != 10)
  {
    if (v8 == 9) {
      [(_UITextFieldVisualStyle_tvOS *)self _placeholderTextColorBlackKeyboard];
    }
    else {
    uint64_t v6 = [(_UITextFieldVisualStyle_tvOS *)self _placeholderTextColorLightKeyboard];
    }
    goto LABEL_15;
  }
  if (v10 == 1000 || v10 == 2)
  {
    v11 = [(_UITextFieldVisualStyle_tvOS *)self _placeholderTextColorDarkKeyboard];
  }
  else
  {
    v11 = [(_UITextFieldVisualStyle_tvOS *)self _placeholderTextColorLightKeyboard];
  }
  v14 = v11;
  id v12 = v11;

LABEL_16:
  return v12;
}

- (id)parentViewForTextContentView
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  uint64_t v4 = [v3 _contentView];

  int v5 = [(_UITextFieldVisualStyle *)self styleSubject];
  uint64_t v6 = [v5 _contentBackdropView];
  v7 = [v6 contentView];

  if (v7 && [(_UITextFieldVisualStyle_tvOS *)self textShouldUseVibrancy])
  {
    id v8 = v7;

    uint64_t v4 = v8;
  }
  [v4 setClipsToBounds:0];

  return v4;
}

- (void)handleTextVibrancy
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  char v4 = [v3 _fieldEditorAttached];

  if ((v4 & 1) == 0)
  {
    int v5 = [(_UITextFieldVisualStyle *)self styleSubject];
    id v10 = [v5 _textCanvasView];

    if ([(_UITextFieldVisualStyle_tvOS *)self textShouldUseVibrancy])
    {
      uint64_t v6 = [(_UITextFieldVisualStyle *)self styleSubject];
      id v7 = [v6 _currentTextColor];
      uint64_t v8 = [v7 CGColor];
      v9 = [v10 layer];
      [v9 setContentsMultiplyColor:v8];
    }
    else
    {
      uint64_t v6 = [v10 layer];
      [v6 setContentsMultiplyColor:0];
    }
  }
}

- (BOOL)textShouldUseVibrancy
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 0;
  }
  uint64_t v6 = [(_UITextFieldVisualStyle *)self styleSubject];
  char v7 = [v6 _textShouldUseVibrancy];

  return v7;
}

- (id)editingProcessorOverridingEditingAttributes:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)_defaultTextColorForUserInterfaceStyle
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  uint64_t v4 = [v3 _userInterfaceStyle];

  if (v4 == 2) {
    [(_UITextFieldVisualStyle_tvOS *)self _defaultTextColorDarkKeyboard];
  }
  else {
  int v5 = [(_UITextFieldVisualStyle_tvOS *)self _defaultTextColorLightKeyboard];
  }
  return v5;
}

- (id)_defaultTextColorLightKeyboard
{
  return +[UIColor colorWithWhite:0.0 alpha:0.6];
}

- (id)_defaultTextColorDarkKeyboard
{
  return +[UIColor colorWithWhite:1.0 alpha:0.6];
}

- (id)_defaultTextColorBlackKeyboard
{
  return +[UIColor whiteColor];
}

- (id)_placeholderTextColorLightKeyboard
{
  return +[UIColor colorWithWhite:0.0 alpha:0.3];
}

- (id)_placeholderTextColorDarkKeyboard
{
  return +[UIColor colorWithWhite:1.0 alpha:0.25];
}

- (id)_placeholderTextColorBlackKeyboard
{
  return +[UIColor whiteColor];
}

- (id)_placeholderTextColorFocused
{
  return +[UIColor _systemMidGrayTintColor];
}

- (id)_defaultEditingFont
{
  v3 = [(_UITextFieldVisualStyle *)self styleSubject];
  int v4 = [v3 _textShouldFillFieldEditorHeight];

  int v5 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  if (v4)
  {
    uint64_t v6 = [(_UITextFieldVisualStyle *)self styleSubject];
    [v6 _fieldEditorHeight];
    uint64_t v7 = objc_msgSend(v5, "fontWithSize:");

    int v5 = (void *)v7;
  }
  return v5;
}

@end