@interface UGCGlyphButtonView
+ (id)_sharedThumbButtonConfig;
+ (id)dislikeButtonView;
+ (id)likeButtonView;
- (BOOL)isEnabled;
- (BOOL)isMuted;
- (BOOL)isSelected;
- (CALayer)animationLayer;
- (CALayer)contentLayer;
- (CALayer)selectionLayer;
- (CGSize)intrinsicContentSize;
- (UGCGlyphButtonAppearance)glyphAppearance;
- (UGCGlyphButtonView)initWithAppearance:(id)a3;
- (UGCGlyphButtonViewDelegate)delegate;
- (UIImageView)glyph;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)animationDuration;
- (void)_handleGlyphTap;
- (void)_setupButton;
- (void)_updateAppearanceAnimated:(BOOL)a3;
- (void)_updateGlyphAppearance;
- (void)setAnimationLayer:(id)a3;
- (void)setContentLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setGlyph:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectionLayer:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
@end

@implementation UGCGlyphButtonView

- (double)animationDuration
{
  return 0.25;
}

+ (id)_sharedThumbButtonConfig
{
  v2 = objc_alloc_init(UGCGlyphButtonAppearance);
  v3 = +[MapsTheme ugcGlyphButtonViewUnselectedBackgroundColor];
  [(UGCGlyphButtonAppearance *)v2 setUnselectedBackgroundColor:v3];

  v4 = +[MapsTheme ugcGlyphButtonViewUnselectedGlyphColor];
  [(UGCGlyphButtonAppearance *)v2 setUnselectedGlyphColor:v4];

  v5 = +[MapsTheme ugcGlyphButtonViewSelectedGlyphColor];
  [(UGCGlyphButtonAppearance *)v2 setSelectedGlyphColor:v5];

  v6 = +[MapsTheme ugcGlyphButtonViewSelectedBackgroundColor];
  [(UGCGlyphButtonAppearance *)v2 setSelectedBackgroundColor:v6];

  return v2;
}

+ (id)likeButtonView
{
  v2 = [UGCLikeGlyphButtonView alloc];
  v3 = +[UGCGlyphButtonAppearance thumbsUpButtonAppearance];
  v4 = [(UGCGlyphButtonView *)v2 initWithAppearance:v3];

  return v4;
}

+ (id)dislikeButtonView
{
  v2 = [UGCDislikeGlyphButtonView alloc];
  v3 = +[UGCGlyphButtonAppearance thumbsDownButtonAppearance];
  v4 = [(UGCGlyphButtonView *)v2 initWithAppearance:v3];

  return v4;
}

- (UGCGlyphButtonView)initWithAppearance:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCGlyphButtonView;
  v6 = -[UGCGlyphButtonView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_glyphAppearance, a3);
    v8 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:1 view:v7];
    feedbackGenerator = v7->_feedbackGenerator;
    v7->_feedbackGenerator = v8;

    [(UGCGlyphButtonView *)v7 _setupButton];
  }

  return v7;
}

- (void)_setupButton
{
  [(UGCGlyphButtonView *)self _setCornerRadius:20.0];
  self->_selected = 0;
  self->_enabled = 1;
  v3 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  glyph = self->_glyph;
  self->_glyph = v3;

  [(UIImageView *)self->_glyph setMinimumContentSizeCategory:UIContentSizeCategoryLarge];
  [(UIImageView *)self->_glyph setMaximumContentSizeCategory:UIContentSizeCategoryLarge];
  [(UIImageView *)self->_glyph setContentMode:4];
  id v5 = +[UGCFontManager ratingGlyphButtonFont];
  v6 = +[UIImageSymbolConfiguration configurationWithFont:v5];

  [(UIImageView *)self->_glyph setPreferredSymbolConfiguration:v6];
  [(UGCGlyphButtonView *)self addSubview:self->_glyph];
  id v7 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleGlyphTap"];
  [(UGCGlyphButtonView *)self setTapGestureRecognizer:v7];

  v8 = [(UGCGlyphButtonView *)self tapGestureRecognizer];
  [(UGCGlyphButtonView *)self addGestureRecognizer:v8];

  [(UGCGlyphButtonView *)self _updateAppearanceAnimated:0];
  id v9 = [objc_alloc((Class)MUEdgeLayout) initWithItem:self->_glyph container:self];
  id v10 = [objc_alloc((Class)MUSizeLayout) initWithItem:self->_glyph size:40.0, 40.0];
  v12[0] = v9;
  v12[1] = v10;
  objc_super v11 = +[NSArray arrayWithObjects:v12 count:2];
  +[NSLayoutConstraint _mapsui_activateLayouts:v11];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:");
    [(UGCGlyphButtonView *)self _updateAppearanceAnimated:0];
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_selected != a3)
  {
    BOOL v4 = a4;
    self->_selected = a3;
    if (a4) {
      [(UIImpactFeedbackGenerator *)self->_feedbackGenerator impactOccurred];
    }
    [(UGCGlyphButtonView *)self _updateAppearanceAnimated:v4];
  }
}

- (void)setMuted:(BOOL)a3
{
  if (self->_muted != a3)
  {
    self->_muted = a3;
    [(UGCGlyphButtonView *)self _updateAppearanceAnimated:0];
  }
}

- (void)_updateAppearanceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UGCGlyphButtonView *)self layer];
  [v5 removeAllAnimations];

  [(UGCGlyphButtonView *)self _updateGlyphAppearance];
  if (v3)
  {
    v6 = [(UGCGlyphButtonView *)self layer];
    [v6 convertTime:0 fromLayer:CACurrentMediaTime()];
    double v8 = v7;

    [(UGCGlyphButtonView *)self animationDuration];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A83B44;
    v10[3] = &unk_1012E5D08;
    v10[4] = self;
    [(UGCGlyphButtonView *)self animateWithBeginTime:v10 completionDelay:v8 completion:v9];
  }
}

- (void)_updateGlyphAppearance
{
  if (self->_selected)
  {
    BOOL v3 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance selectedGlyphName];
    id v16 = +[UIImage systemImageNamed:v3];

    BOOL v4 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance selectedBackgroundColor];
    id v5 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance selectedGlyphColor];
    uint64_t v6 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance selectedGlyphFontSize];
  }
  else
  {
    glyphAppearance = self->_glyphAppearance;
    if (self->_muted)
    {
      double v8 = [(UGCGlyphButtonAppearance *)glyphAppearance mutedGlyphName];
      id v16 = +[UIImage systemImageNamed:v8];

      BOOL v4 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance mutedBackgroundColor];
      id v5 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance mutedGlyphColor];
      [(UGCGlyphButtonAppearance *)self->_glyphAppearance mutedGlyphFontSize];
    }
    else
    {
      double v9 = [(UGCGlyphButtonAppearance *)glyphAppearance unselectedGlyphName];
      id v16 = +[UIImage systemImageNamed:v9];

      BOOL v4 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance unselectedBackgroundColor];
      id v5 = [(UGCGlyphButtonAppearance *)self->_glyphAppearance unselectedGlyphColor];
      [(UGCGlyphButtonAppearance *)self->_glyphAppearance unselectedGlyphFontSize];
    uint64_t v6 = };
  }
  id v10 = (void *)v6;
  if (!self->_enabled)
  {
    uint64_t v11 = [v5 colorWithAlphaComponent:0.3];

    id v5 = (void *)v11;
  }
  [(UGCGlyphButtonView *)self setBackgroundColor:v4];
  v12 = [(UGCGlyphButtonView *)self glyph];
  [v12 setImage:v16];

  v13 = [(UGCGlyphButtonView *)self glyph];
  [v13 setTintColor:v5];

  v14 = [(UGCGlyphButtonView *)self glyph];
  v15 = +[UIImageSymbolConfiguration configurationWithFont:v10];
  [v14 setPreferredSymbolConfiguration:v15];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 40.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_handleGlyphTap
{
  [(UIImpactFeedbackGenerator *)self->_feedbackGenerator prepare];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didTapOnGlyphView:self];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (UGCGlyphButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCGlyphButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
}

- (UGCGlyphButtonAppearance)glyphAppearance
{
  return self->_glyphAppearance;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (CALayer)animationLayer
{
  return self->_animationLayer;
}

- (void)setAnimationLayer:(id)a3
{
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (CALayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_animationLayer, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_glyphAppearance, 0);
  objc_storeStrong((id *)&self->_glyph, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end