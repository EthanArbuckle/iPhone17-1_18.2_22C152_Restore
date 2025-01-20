@interface _UIKeyboardPopover
- (_UIKeyboardPopover)initWithPopoverView:(id)a3;
- (int)textEffectsVisibilityLevel;
- (int)textEffectsVisibilityLevelInKeyboardWindow;
- (void)_setRenderConfig:(id)a3;
@end

@implementation _UIKeyboardPopover

- (_UIKeyboardPopover)initWithPopoverView:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UIKeyboardPopover;
  v6 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_popoverView = (id *)&v6->_popoverView;
    objc_storeStrong((id *)&v6->_popoverView, a3);
    [(UIView *)v7 addSubview:*p_popoverView];
    [*p_popoverView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [*p_popoverView topAnchor];
    v10 = [(UIView *)v7 topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    v12 = [*p_popoverView leftAnchor];
    v13 = [(UIView *)v7 leftAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [*p_popoverView widthAnchor];
    v16 = [(UIView *)v7 widthAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [*p_popoverView heightAnchor];
    v19 = [(UIView *)v7 heightAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];
  }
  return v7;
}

- (int)textEffectsVisibilityLevel
{
  return 7;
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 7;
}

- (void)_setRenderConfig:(id)a3
{
  id v4 = a3;
  id v5 = +[UIKeyboardPopoverContainer borderColor];
  uint64_t v6 = [v5 CGColor];
  v7 = [(_UIPopoverView *)self->_popoverView contentView];
  v8 = [v7 layer];
  [v8 setBorderColor:v6];

  id v9 = [(_UIPopoverView *)self->_popoverView contentView];
  [v9 _setRenderConfig:v4];
}

- (void).cxx_destruct
{
}

@end