@interface SFPrivateBrowsingExplanationModuleCell
+ (NSString)reuseIdentifier;
- (SFPrivateBrowsingExplanationModuleCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_setExplanationView:(id)a3 animated:(BOOL)a4;
- (void)configureUsingBanner:(id)a3;
- (void)layoutSubviews;
@end

@implementation SFPrivateBrowsingExplanationModuleCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"PrivateBrowsingExplanationBanner";
}

- (SFPrivateBrowsingExplanationModuleCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFPrivateBrowsingExplanationModuleCell;
  v3 = -[SFPrivateBrowsingExplanationModuleCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIVisualEffectView sf_startPageCellBackgroundEffectViewWithShadow:1];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SFBannerBackgroundView *)v4;

    [(SFBannerBackgroundView *)v3->_backgroundView setBannerStyle:1];
    [(SFBannerBackgroundView *)v3->_backgroundView _setGroupName:0];
    [(SFPrivateBrowsingExplanationModuleCell *)v3 setBackgroundView:v3->_backgroundView];
    [(SFPrivateBrowsingExplanationModuleCell *)v3 setOverrideUserInterfaceStyle:2];
    v6 = v3;
  }

  return v3;
}

- (void)configureUsingBanner:(id)a3
{
  id v9 = a3;
  [(SFPrivateBrowsingExplanationModuleCell *)self invalidateIntrinsicContentSize];
  explanationView = self->_explanationView;
  if (explanationView
    && ([(SFPrivateBrowsingExplanationModuleContentView *)explanationView banner],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 privateBrowsingExplanationState],
        uint64_t v7 = [v9 privateBrowsingExplanationState],
        v5,
        v6 == v7))
  {
    [(SFPrivateBrowsingExplanationModuleContentView *)self->_explanationView setBanner:v9];
  }
  else
  {
    objc_super v8 = [[SFPrivateBrowsingExplanationModuleContentView alloc] initWithBanner:v9];
    [(SFPrivateBrowsingExplanationModuleCell *)self _setExplanationView:v8 animated:self->_explanationView != 0];
  }
}

- (void)_setExplanationView:(id)a3 animated:(BOOL)a4
{
  uint64_t v7 = (SFPrivateBrowsingExplanationModuleContentView *)a3;
  objc_super v8 = self->_explanationView;
  if (v8 != v7)
  {
    objc_storeStrong((id *)&self->_explanationView, a3);
    id v9 = [(SFPrivateBrowsingExplanationModuleCell *)self contentView];
    [v9 addSubview:v7];

    [(SFPrivateBrowsingExplanationModuleCell *)self setNeedsLayout];
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4FB1EB0];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke;
      v20[3] = &unk_1E54E9A60;
      v11 = v7;
      v21 = v11;
      v22 = self;
      [v10 performWithoutAnimation:v20];
      v12 = (void *)MEMORY[0x1E4FB1EB0];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_2;
      v18[3] = &unk_1E54E9858;
      v19 = v8;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_3;
      v16[3] = &unk_1E54E9998;
      v17 = v19;
      [v12 animateWithDuration:50331744 delay:v18 options:v16 animations:0.2 completion:0.0];
      v13 = (void *)MEMORY[0x1E4FB1EB0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_4;
      v14[3] = &unk_1E54E9858;
      v15 = v11;
      [v13 animateWithDuration:50331744 delay:v14 options:0 animations:0.5 completion:0.06];
    }
    else
    {
      [(SFPrivateBrowsingExplanationModuleContentView *)v8 removeFromSuperview];
    }
  }
}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __71__SFPrivateBrowsingExplanationModuleCell__setExplanationView_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SFPrivateBrowsingExplanationModuleCell;
  [(SFPrivateBrowsingExplanationModuleCell *)&v4 layoutSubviews];
  v3 = [(SFPrivateBrowsingExplanationModuleCell *)self contentView];
  [v3 bounds];
  -[SFPrivateBrowsingExplanationModuleContentView setFrame:](self->_explanationView, "setFrame:");
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFPrivateBrowsingExplanationModuleCell;
  objc_super v4 = [(SFPrivateBrowsingExplanationModuleCell *)&v12 preferredLayoutAttributesFittingAttributes:a3];
  [v4 bounds];
  -[SFPrivateBrowsingExplanationModuleContentView setFrame:](self->_explanationView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v14), 2000.0);
  [(SFPrivateBrowsingExplanationModuleContentView *)self->_explanationView layoutIfNeeded];
  [(SFPrivateBrowsingExplanationModuleContentView *)self->_explanationView sizeToFit];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFPrivateBrowsingExplanationModuleContentView *)self->_explanationView bounds];
  objc_msgSend(v4, "setFrame:", v6, v8, v10, CGRectGetHeight(v15));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end