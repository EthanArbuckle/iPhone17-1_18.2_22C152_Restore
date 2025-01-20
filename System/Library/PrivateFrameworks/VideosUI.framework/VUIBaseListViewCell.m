@interface VUIBaseListViewCell
- (BOOL)_descendantsShouldHighlight;
- (BOOL)canBecomeFocused;
- (BOOL)isDisabled;
- (BOOL)shouldAppearSelected;
- (BOOL)visualEffectViewBackgroundEnabled;
- (VUIBaseListViewCell)initWithFrame:(CGRect)a3;
- (VUIBaseListViewCellDelegate)delegate;
- (_UIFloatingContentView)floatingView;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)contentView;
- (unint64_t)_floatingViewControlState;
- (void)_updateSelectedBackgroundColor;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setFloatingView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldAppearSelected:(BOOL)a3;
- (void)setVisualEffectViewBackgroundEnabled:(BOOL)a3;
- (void)updateFloatingViewControlStateForPreviouslyFocusedView:(id)a3;
@end

@implementation VUIBaseListViewCell

- (VUIBaseListViewCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIBaseListViewCell;
  return -[VUIBaseListViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setVisualEffectViewBackgroundEnabled:(BOOL)a3
{
  if (self->_visualEffectViewBackgroundEnabled != a3)
  {
    self->_visualEffectViewBackgroundEnabled = a3;
    if (a3)
    {
      objc_super v4 = [(VUIBaseListViewCell *)self traitCollection];
      if ([v4 userInterfaceStyle] == 2) {
        uint64_t v5 = 4015;
      }
      else {
        uint64_t v5 = 4014;
      }

      id v6 = objc_alloc(MEMORY[0x1E4FB1F00]);
      v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:v5];
      v8 = (UIVisualEffectView *)[v6 initWithEffect:v7];
      backgroundVisualEffectView = self->_backgroundVisualEffectView;
      self->_backgroundVisualEffectView = v8;

      v10 = self->_backgroundVisualEffectView;
      [(_UIFloatingContentView *)self->_floatingView cornerRadius];
      -[UIVisualEffectView _setCornerRadius:](v10, "_setCornerRadius:");
      v11 = [(_UIFloatingContentView *)self->_floatingView visualEffectContainerView];
      [v11 addSubview:self->_backgroundVisualEffectView];

      [(VUIBaseListViewCell *)self setNeedsLayout];
    }
    else
    {
      [(UIVisualEffectView *)self->_backgroundVisualEffectView removeFromSuperview];
      v12 = self->_backgroundVisualEffectView;
      self->_backgroundVisualEffectView = 0;
    }
  }
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (void)setShouldAppearSelected:(BOOL)a3
{
  if (self->_shouldAppearSelected != a3)
  {
    self->_shouldAppearSelected = a3;
    floatingView = self->_floatingView;
    unint64_t v5 = [(VUIBaseListViewCell *)self _floatingViewControlState];
    id v6 = [(VUIBaseListViewCell *)self _currentFocusAnimationCoordinator];
    [(_UIFloatingContentView *)floatingView setControlState:v5 withAnimationCoordinator:v6];
  }
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  id v13 = a3;
  if (a4 == 1)
  {
    objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
    v10 = [(VUIBaseListViewCell *)self selectedBackgroundView];

    if (!v10)
    {
      v11 = objc_opt_new();
      [(VUIBaseListViewCell *)self setSelectedBackgroundView:v11];
    }
    v9 = [(VUIBaseListViewCell *)self selectedBackgroundView];
  }
  else
  {
    if (a4) {
      goto LABEL_10;
    }
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    v7 = [(VUIBaseListViewCell *)self backgroundView];

    if (!v7)
    {
      v8 = objc_opt_new();
      [(VUIBaseListViewCell *)self setBackgroundView:v8];
    }
    v9 = [(VUIBaseListViewCell *)self backgroundView];
  }
  v12 = v9;
  [v9 setBackgroundColor:v13];

LABEL_10:
}

- (BOOL)canBecomeFocused
{
  return ![(VUIBaseListViewCell *)self isDisabled];
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  if (self->_floatingView)
  {
    objc_super v4 = [(_UIFloatingContentView *)self->_floatingView _preferredConfigurationForFocusAnimation:a3 inContext:a4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIBaseListViewCell;
    objc_super v4 = [(VUIBaseListViewCell *)&v6 _preferredConfigurationForFocusAnimation:a3 inContext:a4];
  }
  return v4;
}

- (void)updateFloatingViewControlStateForPreviouslyFocusedView:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(VUIBaseListViewCell *)self delegate];
  unint64_t v5 = v4;
  if (v4) {
    self->_shouldAppearSelected = [v4 listCell:self shouldAppearSelectedForPreviouslyFocusedView:v9];
  }
  floatingView = self->_floatingView;
  unint64_t v7 = [(VUIBaseListViewCell *)self _floatingViewControlState];
  v8 = [(VUIBaseListViewCell *)self _currentFocusAnimationCoordinator];
  [(_UIFloatingContentView *)floatingView setControlState:v7 withAnimationCoordinator:v8];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VUIBaseListViewCell *)self isFocused];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(VUIBaseListViewCell *)self contentView];
  v10 = [v9 subviews];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v14++) setSelected:v8 animated:1 withAnimationCoordinator:v7];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  v15 = [v6 previouslyFocusedView];
  [(VUIBaseListViewCell *)self updateFloatingViewControlStateForPreviouslyFocusedView:v15];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VUIBaseListViewCell;
  -[VUIBaseListViewCell setHighlighted:](&v16, sel_setHighlighted_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = [(VUIBaseListViewCell *)self contentView];
  id v6 = [v5 subviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 setHighlighted:v3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VUIBaseListViewCell;
  -[VUIBaseListViewCell setSelected:](&v17, sel_setSelected_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [(VUIBaseListViewCell *)self contentView];
  uint64_t v8 = [v7 subviews];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setSelected:v5 animated:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 allObjects];
  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = [v9 type];

  if ([v6 count] == 1
    && (v10 & 0xFFFFFFFFFFFFFFFDLL) == 4
    && [(VUIBaseListViewCell *)self isFocused])
  {
    [(_UIFloatingContentView *)self->_floatingView setControlState:[(VUIBaseListViewCell *)self _floatingViewControlState] | 1 animated:1];
  }
  v11.receiver = self;
  v11.super_class = (Class)VUIBaseListViewCell;
  [(VUIBaseListViewCell *)&v11 pressesBegan:v6 withEvent:v7];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VUIBaseListViewCell;
  id v6 = a3;
  [(VUIBaseListViewCell *)&v11 pressesCancelled:v6 withEvent:a4];
  id v7 = objc_msgSend(v6, "allObjects", v11.receiver, v11.super_class);
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 type];

  uint64_t v10 = [v6 count];
  if (v10 == 1 && (v9 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    [(_UIFloatingContentView *)self->_floatingView setControlState:[(VUIBaseListViewCell *)self _floatingViewControlState] animated:1];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VUIBaseListViewCell;
  id v6 = a3;
  [(VUIBaseListViewCell *)&v11 pressesEnded:v6 withEvent:a4];
  id v7 = objc_msgSend(v6, "allObjects", v11.receiver, v11.super_class);
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 type];

  uint64_t v10 = [v6 count];
  if (v10 == 1 && (v9 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    [(_UIFloatingContentView *)self->_floatingView setControlState:[(VUIBaseListViewCell *)self _floatingViewControlState] animated:1];
  }
}

- (id)contentView
{
  if (self->_floatingView)
  {
    v2 = [(_UIFloatingContentView *)self->_floatingView contentView];
  }
  else
  {
    v2 = self;
  }
  return v2;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VUIBaseListViewCell;
  [(VUIBaseListViewCell *)&v6 layoutSubviews];
  floatingView = self->_floatingView;
  [(VUIBaseListViewCell *)self bounds];
  -[_UIFloatingContentView setFrame:](floatingView, "setFrame:");
  [(_UIFloatingContentView *)self->_floatingView layoutIfNeeded];
  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  if (backgroundVisualEffectView)
  {
    [(_UIFloatingContentView *)self->_floatingView bounds];
    -[UIVisualEffectView setFrame:](backgroundVisualEffectView, "setFrame:");
    BOOL v5 = self->_backgroundVisualEffectView;
    [(_UIFloatingContentView *)self->_floatingView cornerRadius];
    -[UIVisualEffectView _setCornerRadius:](v5, "_setCornerRadius:");
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)VUIBaseListViewCell;
  [(VUIBaseListViewCell *)&v3 prepareForReuse];
  self->_shouldAppearSelected = 0;
  [(_UIFloatingContentView *)self->_floatingView setControlState:0 animated:0];
}

- (unint64_t)_floatingViewControlState
{
  int v3 = [(VUIBaseListViewCell *)self isFocused];
  unint64_t v4 = 8;
  if (!v3) {
    unint64_t v4 = 0;
  }
  if (self->_shouldAppearSelected) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

- (void)_updateSelectedBackgroundColor
{
  int v3 = (void *)MEMORY[0x1E4FB1618];
  unint64_t v4 = [(VUIBaseListViewCell *)self traitCollection];
  objc_msgSend(v3, "colorWithWhite:alpha:", 0.0, dbl_1E38FE0B0[objc_msgSend(v4, "userInterfaceStyle") == 2]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIFloatingContentView *)self->_floatingView setBackgroundColor:v9 forState:4];
  BOOL v5 = [(VUIBaseListViewCell *)self traitCollection];
  if ([v5 userInterfaceStyle] == 2) {
    uint64_t v6 = 4015;
  }
  else {
    uint64_t v6 = 4014;
  }

  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  uint64_t v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:v6];
  [(UIVisualEffectView *)backgroundVisualEffectView setEffect:v8];
}

- (BOOL)visualEffectViewBackgroundEnabled
{
  return self->_visualEffectViewBackgroundEnabled;
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
}

- (VUIBaseListViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIBaseListViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)shouldAppearSelected
{
  return self->_shouldAppearSelected;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end