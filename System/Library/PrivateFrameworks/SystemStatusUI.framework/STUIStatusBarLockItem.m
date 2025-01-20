@interface STUIStatusBarLockItem
+ (STUIStatusBarIdentifier)textDisplayIdentifier;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)showsLock;
- (NSTimer)lockDisappearanceTimer;
- (STUIStatusBarLockView)lockView;
- (_UIExpandingGlyphsView)stringView;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (int64_t)unlockFailureCount;
- (void)_create_lockView;
- (void)_create_stringView;
- (void)setLockDisappearanceTimer:(id)a3;
- (void)setLockView:(id)a3;
- (void)setShowsLock:(BOOL)a3;
- (void)setStringView:(id)a3;
- (void)setUnlockFailureCount:(int64_t)a3;
@end

@implementation STUIStatusBarLockItem

+ (STUIStatusBarIdentifier)textDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"textDisplayIdentifier"];
}

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA9788]];
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarLockItem;
  if (![(STUIStatusBarItem *)&v8 canEnableDisplayItem:a3 fromData:a4]) {
    return [(STUIStatusBarLockItem *)self showsLock];
  }
  BOOL v5 = 1;
  [(STUIStatusBarLockItem *)self setShowsLock:1];
  v6 = [(STUIStatusBarLockItem *)self lockDisappearanceTimer];
  [v6 invalidate];

  [(STUIStatusBarLockItem *)self setLockDisappearanceTimer:0];
  return v5;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)STUIStatusBarLockItem;
  objc_super v8 = [(STUIStatusBarItem *)&v37 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v6 data];
  v10 = [v9 lockEntry];

  v11 = [v7 identifier];
  v12 = [(id)objc_opt_class() defaultDisplayIdentifier];

  if (v11 != v12)
  {
    v13 = [v7 identifier];
    v14 = [(id)objc_opt_class() textDisplayIdentifier];

    if (v13 != v14) {
      goto LABEL_23;
    }
    uint64_t v15 = -[STUIStatusBarLockItem showsLock](self, "showsLock") ? [v10 isEnabled] ^ 1 : 0;
    [v7 setEnabled:v15];
    if (![v7 isEnabled]) {
      goto LABEL_23;
    }
    v35 = [(STUIStatusBarLockItem *)self stringView];
    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v34 = [v19 localizedStringForKey:@"UIStatusBar: Unlocked" value:@"Unlocked" table:0];

    id v33 = objc_alloc(MEMORY[0x1E4F28B18]);
    v38[0] = *MEMORY[0x1E4FB06F8];
    v20 = [v6 styleAttributes];
    v21 = [v20 font];
    v39[0] = v21;
    v38[1] = *MEMORY[0x1E4FB0700];
    v22 = [v6 styleAttributes];
    v23 = [v22 textColor];
    v39[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    v25 = (void *)[v33 initWithString:v34 attributes:v24];

    v26 = v35;
    [v35 setAttributedString:v25];
    [v35 baselineOffset];
    double v28 = v27;
    [v35 intrinsicContentSize];
    [v7 setBaselineOffset:v28 - v29];

    goto LABEL_16;
  }
  if (![v6 dataChanged]) {
    goto LABEL_23;
  }
  if (([v10 isEnabled] & 1) == 0 && -[STUIStatusBarLockItem showsLock](self, "showsLock"))
  {
    v16 = [(STUIStatusBarItem *)self statusBar];
    int v17 = [v16 areAnimationsEnabled];

    if (!v17)
    {
      [(STUIStatusBarLockItem *)self setShowsLock:0];
      [v7 setEnabled:0];
      goto LABEL_18;
    }
    v18 = [(STUIStatusBarLockItem *)self lockView];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke;
    v36[3] = &unk_1E6AA3FA8;
    v36[4] = self;
    [v18 animateUnlockWithCompletionBlock:v36];
    goto LABEL_12;
  }
  if ([v10 isEnabled])
  {
    v18 = [(STUIStatusBarLockItem *)self lockView];
    [v18 resetLock];
LABEL_12:
  }
LABEL_18:
  if ([v10 unlockFailureCount] != self->_unlockFailureCount)
  {
    self->_unlockFailureCount = [v10 unlockFailureCount];
    if (([v6 enablementChanged] & 1) == 0)
    {
      if ([v7 isEnabled])
      {
        v30 = [(STUIStatusBarItem *)self statusBar];
        int v31 = [v30 areAnimationsEnabled];

        if (v31)
        {
          v26 = [(STUIStatusBarLockItem *)self lockView];
          [v26 jiggleWithCompletionBlock:0];
LABEL_16:
        }
      }
    }
  }
LABEL_23:

  return v8;
}

void __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2;
    v5[3] = &unk_1E6AA4808;
    v5[4] = *(void *)(a1 + 32);
    v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:1.0];
    [*(id *)(a1 + 32) setLockDisappearanceTimer:v3];
  }
  else
  {
    [*(id *)(a1 + 32) setShowsLock:0];
    id v4 = [*(id *)(a1 + 32) statusBar];
    [v4 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

void __51__STUIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowsLock:0];
  id v2 = [*(id *)(a1 + 32) statusBar];
  [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarLockItem;
  id v4 = a3;
  BOOL v5 = [(STUIStatusBarItem *)&v19 additionAnimationForDisplayItemWithIdentifier:v4];
  id v6 = [(id)objc_opt_class() textDisplayIdentifier];

  if (v6 == v4)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke;
    v18[3] = &unk_1E6AA4460;
    v18[4] = self;
    id v7 = +[STUIStatusBarAnimation animationWithBlock:v18];

    objc_super v8 = [(id)objc_opt_class() defaultDisplayIdentifier];
    v9 = [(STUIStatusBarItem *)self displayItemForIdentifier:v8];

    [v9 absoluteFrame];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4;
    v17[3] = &unk_1E6AA4830;
    v17[5] = v10;
    v17[6] = v11;
    v17[7] = v12;
    v17[8] = v13;
    v17[4] = self;
    v14 = +[STUIStatusBarAnimation animationWithBlock:v17];
    uint64_t v15 = [v9 identifier];
    [v7 addSubAnimation:v14 forDisplayItemWithIdentifier:v15];

    BOOL v5 = v7;
  }
  return v5;
}

void __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [*(id *)(a1 + 32) statusBar];
  v9 = [v8 styleAttributes];
  uint64_t v10 = [v9 effectiveLayoutDirection];

  [v6 absoluteFrame];
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;
  BOOL v15 = v10 == 1;
  double v16 = CGRectGetWidth(v36) * 0.5;
  double v17 = -v16;
  if (v10 == 1) {
    double v17 = v16;
  }
  double v18 = x + v17;
  [v6 setFloating:1];
  objc_msgSend(v6, "setAbsoluteFrame:", v18, y, width, height);
  objc_super v19 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v20 = *(void *)(a1 + 32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2;
  v30[3] = &unk_1E6AA38D8;
  id v31 = v6;
  double v32 = x;
  double v33 = y;
  double v34 = width;
  double v35 = height;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  double v27 = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3;
  double v28 = &unk_1E6AA4200;
  id v29 = v7;
  id v21 = v7;
  id v22 = v6;
  [v19 _animateWithDuration:0 delay:v20 options:v30 factory:&v25 animations:0.91 completion:0.0];
  v23 = objc_msgSend(*(id *)(a1 + 32), "stringView", v25, v26, v27, v28);
  [v23 setExpandsFromLeftToRight:v15];

  v24 = [*(id *)(a1 + 32) stringView];
  [v24 animateCompletionBlock:0];
}

uint64_t __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);
  return [v2 setFloating:0];
}

uint64_t __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [v6 absoluteFrame];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (!CGRectEqualToRect(v20, *(CGRect *)(a1 + 40)))
  {
    [v6 setFloating:1];
    objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    uint64_t v12 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v13 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5;
    v14[3] = &unk_1E6AA38D8;
    id v15 = v6;
    CGFloat v16 = x;
    CGFloat v17 = y;
    CGFloat v18 = width;
    CGFloat v19 = height;
    [v12 _animateWithDuration:0 delay:v13 options:v14 factory:v7 animations:0.91 completion:0.0];
  }
}

uint64_t __71__STUIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);
  return [v2 setFloating:0];
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a4];
  [v4 setMass:2.0];
  [v4 setStiffness:300.0];
  [v4 setDamping:400.0];
  [v4 setDuration:0.91];
  id v5 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v6) = 1046809695;
  LODWORD(v7) = 990250344;
  LODWORD(v8) = 1057860847;
  LODWORD(v9) = 1064564184;
  uint64_t v10 = (void *)[v5 initWithControlPoints:v6 :v7 :v8 :v9];
  [v4 setTimingFunction:v10];

  return v4;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() textDisplayIdentifier];
  if ((id)v5 == v4)
  {
    BOOL v8 = [(STUIStatusBarLockItem *)self showsLock];

    if (v8)
    {
      double v7 = 0;
      goto LABEL_7;
    }
    double v7 = +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:0.25];
    double v6 = [(id)objc_opt_class() defaultDisplayIdentifier];
    [v7 addSubAnimation:v7 forDisplayItemWithIdentifier:v6];
  }
  else
  {
    double v6 = (void *)v5;
    double v7 = 0;
  }

LABEL_7:
  return v7;
}

- (STUIStatusBarLockView)lockView
{
  lockView = self->_lockView;
  if (!lockView)
  {
    [(STUIStatusBarLockItem *)self _create_lockView];
    lockView = self->_lockView;
  }
  return lockView;
}

- (void)_create_lockView
{
  v3 = [STUIStatusBarLockView alloc];
  id v4 = -[STUIStatusBarLockView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  lockView = self->_lockView;
  self->_lockView = v4;
  MEMORY[0x1F41817F8](v4, lockView);
}

- (_UIExpandingGlyphsView)stringView
{
  stringView = self->_stringView;
  if (!stringView)
  {
    [(STUIStatusBarLockItem *)self _create_stringView];
    stringView = self->_stringView;
  }
  return stringView;
}

- (void)_create_stringView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB20F0]);
  id v4 = (_UIExpandingGlyphsView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stringView = self->_stringView;
  self->_stringView = v4;

  double v6 = self->_stringView;
  [(_UIExpandingGlyphsView *)v6 setFadesOut:0];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v7 = [(STUIStatusBarLockItem *)self lockView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() textDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v7 = [(STUIStatusBarLockItem *)self stringView];
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)STUIStatusBarLockItem;
      uint64_t v7 = [(STUIStatusBarItem *)&v10 viewForIdentifier:v4];
    }
  }
  BOOL v8 = (void *)v7;

  return v8;
}

- (void)setLockView:(id)a3
{
}

- (void)setStringView:(id)a3
{
}

- (NSTimer)lockDisappearanceTimer
{
  return self->_lockDisappearanceTimer;
}

- (void)setLockDisappearanceTimer:(id)a3
{
}

- (BOOL)showsLock
{
  return self->_showsLock;
}

- (void)setShowsLock:(BOOL)a3
{
  self->_showsLock = a3;
}

- (int64_t)unlockFailureCount
{
  return self->_unlockFailureCount;
}

- (void)setUnlockFailureCount:(int64_t)a3
{
  self->_unlockFailureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockDisappearanceTimer, 0);
  objc_storeStrong((id *)&self->_stringView, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
}

@end