@interface _UITextFieldVisualStyle
+ (id)inferredVisualStyleWithStyleSubject:(id)a3;
- (BOOL)textShouldUseVibrancy;
- (_UITextFieldVisualStyle)initWithStyleSubject:(id)a3;
- (_UITextFieldVisualStyleSubject)styleSubject;
- (id)defaultFocusedTextColor;
- (id)defaultTextColor;
- (id)defaultTextColorForKeyboardAppearance;
- (id)parentViewForTextContentView;
- (id)placeholderColor;
- (void)handleTextVibrancy;
- (void)setStyleSubject:(id)a3;
@end

@implementation _UITextFieldVisualStyle

- (_UITextFieldVisualStyleSubject)styleSubject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleSubject);
  return (_UITextFieldVisualStyleSubject *)WeakRetained;
}

+ (id)inferredVisualStyleWithStyleSubject:(id)a3
{
  id v3 = a3;
  v4 = [[_UITextFieldVisualStyle_iOS alloc] initWithStyleSubject:v3];

  return v4;
}

- (_UITextFieldVisualStyle)initWithStyleSubject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldVisualStyle;
  v5 = [(_UITextFieldVisualStyle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_styleSubject, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id)defaultTextColor
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITextFieldVisualStyle.m", 42, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (id)defaultTextColorForKeyboardAppearance
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITextFieldVisualStyle.m", 48, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (id)defaultFocusedTextColor
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITextFieldVisualStyle.m", 54, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (id)placeholderColor
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITextFieldVisualStyle.m", 60, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (id)parentViewForTextContentView
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITextFieldVisualStyle.m", 66, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (BOOL)textShouldUseVibrancy
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITextFieldVisualStyle.m", 72, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (void)handleTextVibrancy
{
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"_UITextFieldVisualStyle.m", 78, @"%@ should provide an implementation for %@", v5, v6 object file lineNumber description];
}

- (void)setStyleSubject:(id)a3
{
}

@end