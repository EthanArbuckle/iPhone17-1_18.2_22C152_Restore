@interface SearchUIBackgroundView
- (BOOL)isInPreviewPlatter;
- (BOOL)shouldUseInsetRoundedSections;
- (SearchUIBackgroundView)init;
- (UIView)platterView;
- (void)didMoveToWindow;
- (void)setInPreviewPlatter:(BOOL)a3;
- (void)setPlatterView:(id)a3;
- (void)setShouldUseInsetRoundedSections:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchUIBackgroundView

- (SearchUIBackgroundView)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIBackgroundView;
  v2 = [(SearchUIBackgroundView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(SearchUIBackgroundView *)v2 layer];
    [v4 setHitTestsAsOpaque:1];
  }
  return v3;
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  if (self->_shouldUseInsetRoundedSections != a3)
  {
    self->_shouldUseInsetRoundedSections = a3;
    [(SearchUIBackgroundView *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIBackgroundView;
  [(SearchUIBackgroundView *)&v12 tlk_updateForAppearance:v4];
  if ([v4 isVibrant]
    && [(SearchUIBackgroundView *)self isInPreviewPlatter])
  {
    v5 = [(SearchUIBackgroundView *)self platterView];

    if (!v5)
    {
      if (+[SearchUIUtilities isIpad]) {
        uint64_t v6 = 53;
      }
      else {
        uint64_t v6 = 12;
      }
      v7 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:v6 configuration:1];
      [v7 setGroupNameBase:@"SearchUIPreviewPlatter"];
      [(SearchUIBackgroundView *)self insertSubview:v7 atIndex:0];
      +[SearchUIAutoLayout fillContainerWithView:v7];
      [(SearchUIBackgroundView *)self setPlatterView:v7];
    }
    v8 = [(SearchUIBackgroundView *)self platterView];
    [v8 setHidden:0];

    [(SearchUIBackgroundView *)self setBackgroundColor:0];
  }
  else
  {
    v9 = [(SearchUIBackgroundView *)self platterView];
    [v9 setHidden:1];

    if ([(SearchUIBackgroundView *)self isInPreviewPlatter])
    {
      uint64_t v10 = [v4 platterColor];
    }
    else
    {
      if ([(SearchUIBackgroundView *)self shouldUseInsetRoundedSections]) {
        [v4 groupedBackgroundColor];
      }
      else {
      uint64_t v10 = [v4 backgroundColor];
      }
    }
    v11 = (void *)v10;
    [(SearchUIBackgroundView *)self setBackgroundColor:v10];
  }
}

- (BOOL)isInPreviewPlatter
{
  return self->_inPreviewPlatter;
}

- (BOOL)shouldUseInsetRoundedSections
{
  return self->_shouldUseInsetRoundedSections;
}

- (UIView)platterView
{
  return (UIView *)objc_getProperty(self, a2, 416, 1);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIBackgroundView;
  [(SearchUIBackgroundView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SearchUIBackgroundView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIBackgroundView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  uint64_t v6 = [(SearchUIBackgroundView *)self traitCollection];
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
  v3.super_class = (Class)SearchUIBackgroundView;
  [(SearchUIBackgroundView *)&v3 didMoveToWindow];
  [(SearchUIBackgroundView *)self tlk_updateWithCurrentAppearance];
}

- (void)setInPreviewPlatter:(BOOL)a3
{
  if (self->_inPreviewPlatter != a3)
  {
    self->_inPreviewPlatter = a3;
    [(SearchUIBackgroundView *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)setPlatterView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end