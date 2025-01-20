@interface TabGroupSwitcherView
- (BOOL)showsTabGroupSwitcherToolbar;
- (SFCapsuleCollectionViewToolbarContentProviding)alternateToolbarContentProvider;
- (id)initWithTabGroupSwitcher:(id *)a1;
- (void)layoutSubviews;
- (void)setShowsTabGroupSwitcherToolbar:(BOOL)a3;
- (void)updateToolbarTheme;
@end

@implementation TabGroupSwitcherView

- (id)initWithTabGroupSwitcher:(id *)a1
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)TabGroupSwitcherView;
    v4 = (id *)objc_msgSendSuper2(&v26, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 51, v3);
      a1[54] = (id)0x3FF0000000000000;
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F78450]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      id v6 = a1[56];
      a1[56] = (id)v5;

      [a1[56] setAutoresizingMask:18];
      [a1[56] setDataSource:v3];
      [a1 addSubview:a1[56]];
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F78218]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      id v8 = a1[55];
      a1[55] = (id)v7;

      [a1[55] setAutoresizingMask:18];
      [a1[55] setCapsuleWidth:0.4];
      [a1[55] setDataSource:v3];
      [a1[55] setDelegate:v3];
      [a1[55] setInactiveCapsuleAlpha:0.4];
      [a1[55] setKeepsCapsulesAboveKeyboard:0];
      [a1[55] setLayoutStyle:1];
      v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(a1[55], "setSelectionGestureLimit:", objc_msgSend(v9, "integerForKey:", *MEMORY[0x1E4F786B8]));

      [a1[55] setSelectionThreshold:0.5];
      [a1[55] setUsesFastDeceleration:1];
      [a1[55] addGestureObserver:v3];
      [a1 addSubview:a1[55]];
      objc_initWeak(&location, v3);
      id v10 = a1[55];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke;
      v23[3] = &unk_1E6D78BC8;
      objc_copyWeak(&v24, &location);
      [v10 registerContentViewIdentifier:@"tab-group" block:v23];
      objc_initWeak(&from, a1);
      id v11 = a1[55];
      v27[0] = objc_opt_class();
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke_2;
      v20 = &unk_1E6D7B700;
      objc_copyWeak(&v21, &from);
      id v13 = (id)[v11 registerForTraitChanges:v12 withHandler:&v17];

      uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1F00], "safari_statusBarGradientBlurEffectView", v17, v18, v19, v20);
      id v15 = a1[52];
      a1[52] = (id)v14;

      [a1 addSubview:a1[52]];
      [a1 updateToolbarTheme];
      a1 = a1;
      objc_destroyWeak(&v21);
      objc_destroyWeak(&from);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

id __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F783B8]);
  [v2 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:WeakRetained];
    [v2 addInteraction:v4];
  }
  return v2;
}

void __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateToolbarTheme];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TabGroupSwitcherView;
  [(TabGroupSwitcherView *)&v6 layoutSubviews];
  [(TabGroupSwitcherView *)self bounds];
  double Width = CGRectGetWidth(v7);
  [(TabGroupSwitcherView *)self safeAreaInsets];
  -[UIVisualEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", 0.0, 0.0, Width, v4 * self->_tabViewPresentationProgress);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  -[TabGroupSwitcherViewController viewDidLayoutSubviews]((uint64_t)WeakRetained);
}

- (void)updateToolbarTheme
{
  id v3 = [(SFCapsuleCollectionView *)self->_capsuleView traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [MEMORY[0x1E4F78548] themeWithBarTintStyle:v5];
  [(SFCapsuleCollectionView *)self->_capsuleView setTheme:v6];
}

- (BOOL)showsTabGroupSwitcherToolbar
{
  return [(SFCapsuleCollectionView *)self->_capsuleView isHidden] ^ 1;
}

- (void)setShowsTabGroupSwitcherToolbar:(BOOL)a3
{
  BOOL v4 = !a3;
  [(SFCapsuleCollectionView *)self->_capsuleView setHidden:v4];
  [(UIVisualEffectView *)self->_statusBarBackdrop setHidden:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  -[TabGroupSwitcherViewController recenterViews]((uint64_t)WeakRetained);
}

- (SFCapsuleCollectionViewToolbarContentProviding)alternateToolbarContentProvider
{
  return self->_capsuleView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_capsuleView, 0);
  objc_destroyWeak((id *)&self->_tabGroupSwitcher);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end