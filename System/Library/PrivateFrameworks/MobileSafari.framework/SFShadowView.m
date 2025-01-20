@interface SFShadowView
- (BOOL)isVibrancyEnabled;
- (CGRect)frameWithContentWithFrame:(CGRect)a3;
- (SFShadowView)initWithFrame:(CGRect)a3;
- (void)setVibrancyEnabled:(BOOL)a3;
- (void)updateAppearance;
@end

@implementation SFShadowView

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  return CGRectInset(a3, -self->_shadowRadius, -self->_shadowRadius);
}

- (SFShadowView)initWithFrame:(CGRect)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SFShadowView;
  v3 = -[SFShadowView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (shadowImage_onceToken_0 != -1) {
      dispatch_once(&shadowImage_onceToken_0, &__block_literal_global_26);
    }
    id v4 = (id)shadowImage_image_0;
    [v4 scale];
    BOOL v6 = v5 == 2.0;
    double v7 = 60.0;
    if (v6) {
      double v7 = 40.0;
    }
    v3->_shadowRadius = v7;
    [(SFShadowView *)v3 setImage:v4];
    v3->_vibrancyEnabled = 1;
    v13[0] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v9 = (id)[(SFShadowView *)v3 registerForTraitChanges:v8 withTarget:v3 action:sel_updateAppearance];

    [(SFShadowView *)v3 updateAppearance];
    v10 = v3;
  }
  return v3;
}

- (void)updateAppearance
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL vibrancyEnabled = self->_vibrancyEnabled;
  if (self->_vibrancyEnabled)
  {
    v2 = [(SFShadowView *)self traitCollection];
    if ([v2 userInterfaceStyle] == 2) {
      double v5 = &darkColorMatrix;
    }
    else {
      double v5 = &lightColorMatrix;
    }
    long long v7 = v5[3];
    long long v15 = v5[2];
    long long v16 = v7;
    long long v17 = v5[4];
    long long v8 = v5[1];
    long long v13 = *v5;
    long long v14 = v8;
    id v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    v12[2] = v15;
    v12[3] = v16;
    v12[4] = v17;
    v12[0] = v13;
    v12[1] = v14;
    v10 = [MEMORY[0x1E4F29238] valueWithBytes:v12 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
    [v9 setValue:v10 forKey:*MEMORY[0x1E4F3A168]];

    v18[0] = v9;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v11 = [(SFShadowView *)self layer];
  [v11 setFilters:v6];

  if (vibrancyEnabled)
  {
  }
}

- (void)setVibrancyEnabled:(BOOL)a3
{
  if (self->_vibrancyEnabled != a3)
  {
    self->_BOOL vibrancyEnabled = a3;
    [(SFShadowView *)self updateAppearance];
  }
}

- (BOOL)isVibrancyEnabled
{
  return self->_vibrancyEnabled;
}

@end