@interface _UIStatusBarLockItem
+ (_UIStatusBarIdentifier)textDisplayIdentifier;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)showsLock;
- (NSTimer)lockDisappearanceTimer;
- (_UIExpandingGlyphsView)stringView;
- (_UIStatusBarLockView)lockView;
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

@implementation _UIStatusBarLockItem

+ (_UIStatusBarIdentifier)textDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"textDisplayIdentifier"];
}

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"lockEntry"];
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarLockItem;
  if (![(_UIStatusBarItem *)&v8 canEnableDisplayItem:a3 fromData:a4]) {
    return [(_UIStatusBarLockItem *)self showsLock];
  }
  BOOL v5 = 1;
  [(_UIStatusBarLockItem *)self setShowsLock:1];
  v6 = [(_UIStatusBarLockItem *)self lockDisappearanceTimer];
  [v6 invalidate];

  [(_UIStatusBarLockItem *)self setLockDisappearanceTimer:0];
  return v5;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)_UIStatusBarLockItem;
  objc_super v8 = [(_UIStatusBarItem *)&v36 applyUpdate:v6 toDisplayItem:v7];
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
    uint64_t v15 = -[_UIStatusBarLockItem showsLock](self, "showsLock") ? [v10 isEnabled] ^ 1 : 0;
    [v7 setEnabled:v15];
    if (![v7 isEnabled]) {
      goto LABEL_23;
    }
    v34 = [(_UIStatusBarLockItem *)self stringView];
    v33 = _UILocalizedStringInSystemLanguage(@"UIStatusBar: Unlocked", @"Unlocked");
    id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
    v37[0] = *(void *)off_1E52D2040;
    v19 = [v6 styleAttributes];
    v20 = [v19 font];
    v38[0] = v20;
    v37[1] = *(void *)off_1E52D2048;
    v21 = [v6 styleAttributes];
    v22 = [v21 textColor];
    v38[1] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    v24 = (void *)[v32 initWithString:v33 attributes:v23];

    v25 = v34;
    [v34 setAttributedString:v24];
    [v34 baselineOffset];
    double v27 = v26;
    [v34 intrinsicContentSize];
    [v7 setBaselineOffset:v27 - v28];

    goto LABEL_16;
  }
  if (![v6 dataChanged]) {
    goto LABEL_23;
  }
  if (([v10 isEnabled] & 1) == 0 && -[_UIStatusBarLockItem showsLock](self, "showsLock"))
  {
    v16 = [(_UIStatusBarItem *)self statusBar];
    int v17 = [v16 areAnimationsEnabled];

    if (!v17)
    {
      [(_UIStatusBarLockItem *)self setShowsLock:0];
      [v7 setEnabled:0];
      goto LABEL_18;
    }
    v18 = [(_UIStatusBarLockItem *)self lockView];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke;
    v35[3] = &unk_1E52DC3A0;
    v35[4] = self;
    [v18 animateUnlockWithCompletionBlock:v35];
    goto LABEL_12;
  }
  if ([v10 isEnabled])
  {
    v18 = [(_UIStatusBarLockItem *)self lockView];
    [v18 resetLock];
LABEL_12:
  }
LABEL_18:
  if ([v10 unlockFailureCount] != self->_unlockFailureCount)
  {
    self->_unlockFailureCount = [v10 unlockFailureCount];
    if (([v6 enabilityChanged] & 1) == 0)
    {
      if ([v7 isEnabled])
      {
        v29 = [(_UIStatusBarItem *)self statusBar];
        int v30 = [v29 areAnimationsEnabled];

        if (v30)
        {
          v25 = [(_UIStatusBarLockItem *)self lockView];
          [v25 jiggleWithCompletionBlock:0];
LABEL_16:
        }
      }
    }
  }
LABEL_23:

  return v8;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)_UIStatusBarLockItem;
  id v4 = a3;
  BOOL v5 = [(_UIStatusBarItem *)&v19 additionAnimationForDisplayItemWithIdentifier:v4];
  id v6 = [(id)objc_opt_class() textDisplayIdentifier];

  if (v6 == v4)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke;
    v18[3] = &unk_1E53051A0;
    v18[4] = self;
    id v7 = +[_UIStatusBarAnimation animationWithBlock:v18];

    objc_super v8 = [(id)objc_opt_class() defaultDisplayIdentifier];
    v9 = [(_UIStatusBarItem *)self displayItemForIdentifier:v8];

    [v9 absoluteFrame];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4;
    v17[3] = &unk_1E5305570;
    v17[5] = v10;
    v17[6] = v11;
    v17[7] = v12;
    v17[8] = v13;
    v17[4] = self;
    v14 = +[_UIStatusBarAnimation animationWithBlock:v17];
    uint64_t v15 = [v9 identifier];
    [v7 addSubAnimation:v14 forDisplayItemWithIdentifier:v15];

    BOOL v5 = v7;
  }
  return v5;
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
    BOOL v8 = [(_UIStatusBarLockItem *)self showsLock];

    if (v8)
    {
      double v7 = 0;
      goto LABEL_7;
    }
    double v7 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.25];
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

- (_UIStatusBarLockView)lockView
{
  lockView = self->_lockView;
  if (!lockView)
  {
    [(_UIStatusBarLockItem *)self _create_lockView];
    lockView = self->_lockView;
  }
  return lockView;
}

- (void)_create_lockView
{
  v3 = [_UIStatusBarLockView alloc];
  id v4 = -[_UIStatusBarLockView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  lockView = self->_lockView;
  self->_lockView = v4;
}

- (_UIExpandingGlyphsView)stringView
{
  stringView = self->_stringView;
  if (!stringView)
  {
    [(_UIStatusBarLockItem *)self _create_stringView];
    stringView = self->_stringView;
  }
  return stringView;
}

- (void)_create_stringView
{
  v3 = [_UIExpandingGlyphsView alloc];
  id v4 = -[_UIExpandingGlyphsView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
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
    uint64_t v7 = [(_UIStatusBarLockItem *)self lockView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() textDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v7 = [(_UIStatusBarLockItem *)self stringView];
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)_UIStatusBarLockItem;
      uint64_t v7 = [(_UIStatusBarItem *)&v10 viewForIdentifier:v4];
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