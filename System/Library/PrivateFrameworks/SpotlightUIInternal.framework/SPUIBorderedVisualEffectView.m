@interface SPUIBorderedVisualEffectView
- (SPUIBorderedVisualEffectView)initWithEffect:(id)a3;
- (void)didMoveToWindow;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SPUIBorderedVisualEffectView

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUIBorderedVisualEffectView;
  [(SPUIBorderedVisualEffectView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SPUIBorderedVisualEffectView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SPUIBorderedVisualEffectView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(SPUIBorderedVisualEffectView *)self traitCollection];
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
  v3.super_class = (Class)SPUIBorderedVisualEffectView;
  [(SPUIBorderedVisualEffectView *)&v3 didMoveToWindow];
  [(SPUIBorderedVisualEffectView *)self tlk_updateWithCurrentAppearance];
}

- (SPUIBorderedVisualEffectView)initWithEffect:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SPUIBorderedVisualEffectView;
  objc_super v3 = [(SPUIBorderedVisualEffectView *)&v9 initWithEffect:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.06];
    uint64_t v5 = [v4 CGColor];
    v6 = [(SPUIBorderedVisualEffectView *)v3 contentView];
    uint64_t v7 = [v6 layer];
    [v7 setBorderColor:v5];
  }
  return v3;
}

- (void)tlk_updateForAppearance:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SPUIBorderedVisualEffectView;
  id v4 = a3;
  [(SPUIBorderedVisualEffectView *)&v10 tlk_updateForAppearance:v4];
  int v5 = objc_msgSend(v4, "isDark", v10.receiver, v10.super_class);

  double v6 = 0.0;
  if (v5)
  {
    [MEMORY[0x263F7E3D0] pixelWidthForView:self];
    double v6 = v7;
  }
  uint64_t v8 = [(SPUIBorderedVisualEffectView *)self contentView];
  objc_super v9 = [v8 layer];
  [v9 setBorderWidth:v6];
}

@end