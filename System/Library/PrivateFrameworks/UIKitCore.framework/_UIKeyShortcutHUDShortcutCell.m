@interface _UIKeyShortcutHUDShortcutCell
- (_UIKeyShortcutHUDShortcut)shortcut;
- (_UIKeyShortcutHUDShortcutCell)initWithFrame:(CGRect)a3;
- (_UIKeyShortcutHUDShortcutInputAccessoryView)shortcutInputAccessoryView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)configureWithShortcut:(id)a3;
- (void)setShortcut:(id)a3;
@end

@implementation _UIKeyShortcutHUDShortcutCell

- (_UIKeyShortcutHUDShortcutCell)initWithFrame:(CGRect)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyShortcutHUDShortcutCell;
  v3 = -[_UIKeyShortcutHUDCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    shortcutInputAccessoryView = v3->_shortcutInputAccessoryView;
    v3->_shortcutInputAccessoryView = (_UIKeyShortcutHUDShortcutInputAccessoryView *)v4;

    v6 = [[UICellAccessoryCustomView alloc] initWithCustomView:v3->_shortcutInputAccessoryView placement:1];
    [(UICellAccessory *)v6 setReservedLayoutWidth:0.0];
    v10[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UICollectionViewListCell *)v3 setAccessories:v7];
  }
  return v3;
}

- (void)configureWithShortcut:(id)a3
{
  id v4 = a3;
  [(_UIKeyShortcutHUDShortcutCell *)self setShortcut:v4];
  id v8 = [(_UIKeyShortcutHUDCell *)self defaultContentConfiguration];
  v5 = [v4 hudTitle];
  [v8 setText:v5];

  v6 = [v4 subtitle];
  [v8 setSecondaryText:v6];

  v7 = [(_UIKeyShortcutHUDShortcutInputAccessoryView *)self->_shortcutInputAccessoryView shortcutInputView];
  [v7 setShortcut:v4];

  [(UICollectionViewCell *)self setContentConfiguration:v8];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)_UIKeyShortcutHUDShortcutCell;
  id v4 = [(UICollectionReusableView *)&v19 preferredLayoutAttributesFittingAttributes:a3];
  v5 = +[UIKeyShortcutHUDMetrics currentMetrics];
  [v4 size];
  double v7 = v6;
  p_shortcut = &self->_shortcut;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortcut);
  [v5 cellWidthForShortcut:WeakRetained];
  double v11 = v10;

  objc_msgSend(v4, "setSize:", v11, v7);
  if ([v5 shouldAlignShortcutModifiersAndInputInColumn])
  {
    v12 = [(_UIKeyShortcutHUDShortcutInputAccessoryView *)self->_shortcutInputAccessoryView shortcutInputView];
    id v13 = objc_loadWeakRetained((id *)p_shortcut);
    [v5 modifiersWidthForShortcut:v13];
    double v15 = v14;
    id v16 = objc_loadWeakRetained((id *)p_shortcut);
    [v5 inputWidthForShortcut:v16];
    [v12 setModifiersWidth:v15 inputWidth:v17];
  }
  return v4;
}

- (_UIKeyShortcutHUDShortcutInputAccessoryView)shortcutInputAccessoryView
{
  return self->_shortcutInputAccessoryView;
}

- (_UIKeyShortcutHUDShortcut)shortcut
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortcut);
  return (_UIKeyShortcutHUDShortcut *)WeakRetained;
}

- (void)setShortcut:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shortcut);
  objc_storeStrong((id *)&self->_shortcutInputAccessoryView, 0);
}

@end