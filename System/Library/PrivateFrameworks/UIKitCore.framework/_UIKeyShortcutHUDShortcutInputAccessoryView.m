@interface _UIKeyShortcutHUDShortcutInputAccessoryView
- (_UIKeyShortcutHUDShortcutInputAccessoryView)initWithFrame:(CGRect)a3;
- (_UIKeyShortcutHUDShortcutInputView)shortcutInputView;
- (void)_commonInit;
@end

@implementation _UIKeyShortcutHUDShortcutInputAccessoryView

- (_UIKeyShortcutHUDShortcutInputAccessoryView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDShortcutInputAccessoryView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIKeyShortcutHUDShortcutInputAccessoryView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v3 = (_UIKeyShortcutHUDShortcutInputView *)objc_opt_new();
  shortcutInputView = self->_shortcutInputView;
  self->_shortcutInputView = v3;

  [(UIView *)self->_shortcutInputView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:self->_shortcutInputView];
  v15 = (void *)MEMORY[0x1E4F5B268];
  v16 = [(UIView *)self->_shortcutInputView leadingAnchor];
  v5 = [(UIView *)self leadingAnchor];
  objc_super v6 = +[UIKeyShortcutHUDMetrics currentMetrics];
  [v6 minShortcutNameKeyCombinationSpacing];
  v7 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v5);
  v17[0] = v7;
  v8 = [(UIView *)self->_shortcutInputView trailingAnchor];
  v9 = [(UIView *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v17[1] = v10;
  v11 = [(UIView *)self->_shortcutInputView centerYAnchor];
  v12 = [(UIView *)self centerYAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v17[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  [v15 activateConstraints:v14];
}

- (_UIKeyShortcutHUDShortcutInputView)shortcutInputView
{
  return self->_shortcutInputView;
}

- (void).cxx_destruct
{
}

@end