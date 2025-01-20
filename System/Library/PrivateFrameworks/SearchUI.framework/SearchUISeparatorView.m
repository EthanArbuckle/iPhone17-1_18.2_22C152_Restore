@interface SearchUISeparatorView
+ (id)separatorColorForAppearance:(id)a3;
+ (unint64_t)separatorProminenceForAppearance:(id)a3;
- (CGSize)intrinsicContentSize;
- (SearchUISeparatorView)init;
- (double)separatorHeight;
- (void)didMoveToWindow;
- (void)setSeparatorHeight:(double)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchUISeparatorView

+ (id)separatorColorForAppearance:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "colorForProminence:", objc_msgSend((id)objc_opt_class(), "separatorProminenceForAppearance:", v3));
  int v5 = [v3 isVibrant];

  if (v5)
  {
    double v9 = 0.0;
    [v4 getWhite:0 alpha:&v9];
    id v6 = [v4 colorWithAlphaComponent:v9 * 0.75];
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;

  return v7;
}

+ (unint64_t)separatorProminenceForAppearance:(id)a3
{
  if ([a3 isVibrant]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (SearchUISeparatorView)init
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUISeparatorView;
  v2 = [(TLKProminenceView *)&v8 initWithProminence:3];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    v4 = [v3 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    double v6 = 1.0;
    if (!IsAccessibilityCategory) {
      objc_msgSend(MEMORY[0x1E4FAE198], "pixelWidthForView:", v2, 1.0);
    }
    v2->_separatorHeight = v6;
  }
  return v2;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  [(SearchUISeparatorView *)self separatorHeight];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUISeparatorView;
  [(TLKProminenceView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(SearchUISeparatorView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUISeparatorView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(SearchUISeparatorView *)self traitCollection];
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
  v3.super_class = (Class)SearchUISeparatorView;
  [(TLKProminenceView *)&v3 didMoveToWindow];
  [(SearchUISeparatorView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUISeparatorView;
  id v4 = a3;
  [(TLKProminenceView *)&v6 tlk_updateForAppearance:v4];
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "separatorProminenceForAppearance:", v4, v6.receiver, v6.super_class);

  [(TLKProminenceView *)self setProminence:v5];
}

- (double)separatorHeight
{
  return self->_separatorHeight;
}

- (void)setSeparatorHeight:(double)a3
{
  self->_separatorHeight = a3;
}

@end