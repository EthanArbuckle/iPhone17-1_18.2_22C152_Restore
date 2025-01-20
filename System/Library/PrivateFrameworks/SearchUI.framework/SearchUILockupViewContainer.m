@interface SearchUILockupViewContainer
- (ASCLockupView)lockupView;
- (SearchUILockupViewContainer)initWithLockupView:(id)a3;
- (void)didMoveToWindow;
- (void)setLockupView:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchUILockupViewContainer

- (SearchUILockupViewContainer)initWithLockupView:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)SearchUILockupViewContainer;
  v7 = [(NUIContainerBoxView *)&v9 initWithArrangedSubviews:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_lockupView, a3);
  }

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUILockupViewContainer;
  [(SearchUILockupViewContainer *)&v9 traitCollectionDidChange:v4];
  id v5 = [(SearchUILockupViewContainer *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUILockupViewContainer *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(SearchUILockupViewContainer *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUILockupViewContainer;
  [(SearchUILockupViewContainer *)&v3 didMoveToWindow];
  [(SearchUILockupViewContainer *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SearchUILockupViewContainer;
  [(SearchUILockupViewContainer *)&v15 tlk_updateForAppearance:v9];
  int v10 = [v9 isVibrant];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F4BB28]);
    objc_super v3 = [v9 quaternaryColor];
    id v4 = [v9 secondaryButtonColor];
    id v5 = [v9 secondaryColor];
    v6 = [v9 secondaryButtonColor];
    uint64_t v7 = [v9 tertiaryColor];
    v12 = (void *)[v11 initWithTitleBackgroundColor:v3 titleTextColor:v4 subtitleTextColor:v5 iconTintColor:v6 progressColor:v7];
  }
  else
  {
    v12 = 0;
  }
  v13 = [(SearchUILockupViewContainer *)self lockupView];
  [v13 setOfferTheme:v12];

  if (v10)
  {
  }
  v14 = [(SearchUILockupViewContainer *)self lockupView];
  [v9 enableAppearanceForView:v14];
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end