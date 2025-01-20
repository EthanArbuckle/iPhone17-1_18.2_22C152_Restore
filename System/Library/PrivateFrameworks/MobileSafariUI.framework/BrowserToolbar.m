@interface BrowserToolbar
- (BrowserToolbar)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4;
- (UIToolbar)replacementToolbar;
- (double)alpha;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_updateItemsForReplacementToolbar;
- (void)layoutSubviews;
- (void)setItems:(id)a3 animated:(BOOL)a4;
- (void)setReplacementToolbar:(id)a3 tintStyle:(int64_t)a4 withAnimationDelay:(double)a5;
@end

@implementation BrowserToolbar

- (double)alpha
{
  v3 = [(BrowserToolbar *)self delegate];
  if (!self->_isHitTesting
    || (objc_opt_respondsToSelector() & 1) == 0
    || (double v4 = 1.0, ([v3 browserToolbarShouldHitTestAsOpaque:self] & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)BrowserToolbar;
    [(BrowserToolbar *)&v7 alpha];
    double v4 = v5;
  }

  return v4;
}

- (void)_updateItemsForReplacementToolbar
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(BrowserToolbar *)self items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 view];
        v10 = v9;
        if (self->_replacementToolbar) {
          double v11 = 0.0;
        }
        else {
          double v11 = 1.0;
        }
        [v9 setAlpha:v11];

        v12 = [v8 view];
        [v12 setExclusiveTouch:1];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BrowserToolbar *)self items];
  v8 = v7;
  if (v7 != v6 && ([v7 isEqualToArray:v6] & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)BrowserToolbar;
    [(_SFToolbar *)&v9 setItems:v6 animated:v4];
    [(BrowserToolbar *)self _updateItemsForReplacementToolbar];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BrowserToolbar;
  [(_SFToolbar *)&v3 layoutSubviews];
  [(BrowserToolbar *)self _updateItemsForReplacementToolbar];
}

- (void)_sceneWillEnterForeground:(id)a3
{
  BOOL v4 = [a3 object];
  uint64_t v5 = [(BrowserToolbar *)self window];
  id v6 = [v5 windowScene];

  if (v4 == v6)
  {
    [(_SFToolbar *)self setUsesLegacyDarkBackdrop:0];
  }
}

- (BrowserToolbar)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BrowserToolbar;
  BOOL v4 = [(_SFToolbar *)&v9 initWithPlacement:a3 hideBackground:a4];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    [(BrowserToolbar *)v4 setTintColor:v5];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
    [v6 addObserver:v4 selector:sel__sceneWillEnterForeground_ name:*MEMORY[0x1E4FB2EB0] object:0];
    id v7 = v4;
  }
  return v4;
}

- (void)setReplacementToolbar:(id)a3 tintStyle:(int64_t)a4 withAnimationDelay:(double)a5
{
  objc_super v9 = (UIToolbar *)a3;
  replacementToolbar = self->_replacementToolbar;
  if (replacementToolbar == v9)
  {
    long long v16 = [MEMORY[0x1E4F78548] themeWithBarTintStyle:a4];
    [(_SFToolbar *)self setTheme:v16];
  }
  else
  {
    double v11 = replacementToolbar;
    objc_storeStrong((id *)&self->_replacementToolbar, a3);
    [(UIToolbar *)v9 setAutoresizingMask:18];
    [(BrowserToolbar *)self addSubview:v9];
    v12 = (void *)MEMORY[0x1E4FB1EB0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke;
    v24[3] = &unk_1E6D77D90;
    v24[4] = self;
    long long v13 = v9;
    v25 = v13;
    [v12 performWithoutAnimation:v24];
    long long v14 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_2;
    v19[3] = &unk_1E6D78B38;
    v20 = v11;
    v21 = v13;
    v22 = self;
    int64_t v23 = a4;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_3;
    v17[3] = &unk_1E6D7A168;
    v17[4] = self;
    uint64_t v18 = v20;
    long long v15 = v20;
    [v14 animateWithDuration:0 delay:v19 options:v17 animations:0.0 completion:a5];
  }
}

uint64_t __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[78])
  {
    objc_super v3 = [v2 window];
    BOOL v4 = [v3 windowScene];
    objc_msgSend(*(id *)(a1 + 32), "setUsesLegacyDarkBackdrop:", objc_msgSend(v4, "activationState") == 2);
  }
  else
  {
    [v2 setUsesLegacyDarkBackdrop:0];
  }
  [*(id *)(a1 + 40) setAlpha:0.0];
  uint64_t v5 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];
  return objc_msgSend(v5, "setFrame:");
}

void __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  [*(id *)(a1 + 48) _updateItemsForReplacementToolbar];
  id v2 = [MEMORY[0x1E4F78548] themeWithBarTintStyle:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) setTheme:v2];
}

void *__69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v2 + 624) != result) {
    return (void *)[result removeFromSuperview];
  }
  return result;
}

- (void)_sceneDidEnterBackground:(id)a3
{
  BOOL v4 = [a3 object];
  uint64_t v5 = [(BrowserToolbar *)self window];
  id v6 = [v5 windowScene];

  if (v4 == v6)
  {
    BOOL v7 = self->_replacementToolbar != 0;
    [(_SFToolbar *)self setUsesLegacyDarkBackdrop:v7];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  self->_isHitTesting = 1;
  v7.receiver = self;
  v7.super_class = (Class)BrowserToolbar;
  uint64_t v5 = -[BrowserToolbar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  self->_isHitTesting = 0;
  return v5;
}

- (UIToolbar)replacementToolbar
{
  return self->_replacementToolbar;
}

- (void).cxx_destruct
{
}

@end