@interface _UIAlertControllerModernTVActionBackgroundView
+ (CGSize)backgroundInsetAmount;
- (BOOL)shouldUseTintColorAsHighlightColor;
- (BOOL)vibrantCompositing:(unint64_t)a3;
- (CGSize)_shadowOffset;
- (UIVisualEffectView)effectView;
- (_UIAlertControllerModernTVActionBackgroundView)initWithFrame:(CGRect)a3;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (void)_updateBackgroundColor;
- (void)_userInterfaceStyleChanged;
- (void)setEffectView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setShouldUseTintColorAsHighlightColor:(BOOL)a3;
- (void)setVibrantCompositing:(BOOL)a3 forState:(unint64_t)a4;
- (void)updateCompositingForHighlighted:(BOOL)a3;
@end

@implementation _UIAlertControllerModernTVActionBackgroundView

+ (CGSize)backgroundInsetAmount
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_UIAlertControllerModernTVActionBackgroundView)initWithFrame:(CGRect)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_UIAlertControllerModernTVActionBackgroundView;
  double v3 = -[_UIAlertControllerTVBackgroundView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_UIAlertControllerTVBackgroundView *)v3 shadowView];
    [v5 setShadowExpansion:35.0];

    [(_UIAlertControllerTVBackgroundView *)v4 setAlpha:0 forState:1.0];
    [(_UIAlertControllerTVBackgroundView *)v4 setAlpha:1 forState:0.75];
    v6 = self;
    v11[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v8 = [(UIView *)v4 registerForTraitChanges:v7 withAction:sel__userInterfaceStyleChanged];
  }
  return v4;
}

- (void)_updateBackgroundColor
{
  BOOL v3 = [(_UIAlertControllerTVBackgroundView *)self isHighlighted];
  id v6 = [(_UIAlertControllerTVBackgroundView *)self backgroundView];
  if (v3
    && ![(_UIAlertControllerModernTVActionBackgroundView *)self shouldUseTintColorAsHighlightColor])
  {
    uint64_t v4 = +[UIColor whiteColor];
  }
  else
  {
    uint64_t v4 = [(UIView *)self tintColor];
  }
  v5 = (void *)v4;
  [v6 setBackgroundColor:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIAlertControllerTVBackgroundView *)self isHighlighted] != a3)
  {
    [(_UIAlertControllerTVBackgroundView *)self _alphaForHighlighted:[(_UIAlertControllerTVBackgroundView *)self isHighlighted] pressed:[(_UIAlertControllerTVBackgroundView *)self isPressed]];
    double v6 = v5;
    [(_UIAlertControllerTVBackgroundView *)self _alphaForHighlighted:v3 pressed:[(_UIAlertControllerTVBackgroundView *)self isPressed]];
    uint64_t v8 = v7;
    if ([(_UIAlertControllerModernTVActionBackgroundView *)self shouldUseTintColorAsHighlightColor])
    {
      [(UIView *)self tintColor];
    }
    else
    {
      +[UIColor whiteColor];
    v9 = };
    objc_super v10 = v9;
    if (v3)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(UIView *)self tintColor];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke;
    aBlock[3] = &unk_1E52E89B8;
    aBlock[4] = self;
    id v12 = v11;
    id v19 = v12;
    BOOL v21 = v3;
    uint64_t v20 = v8;
    v13 = (void (**)(void))_Block_copy(aBlock);
    if (+[UIView areAnimationsEnabled])
    {
      if (v3) {
        double v14 = 0.1;
      }
      else {
        double v14 = 0.2;
      }
      v15 = [(_UIAlertControllerTVBackgroundView *)self backgroundView];
      [v15 setAlpha:v6];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke_2;
      v16[3] = &unk_1E52DA040;
      v17 = v13;
      +[UIView animateWithDuration:v16 animations:v14];
    }
    else
    {
      v13[2](v13);
    }
    [(_UIAlertControllerTVBackgroundView *)self setIsHighlighted:v3];
  }
}

- (void)updateCompositingForHighlighted:(BOOL)a3
{
  if (a3 || ![(_UIAlertControllerModernTVActionBackgroundView *)self vibrantCompositing:0])
  {
    double v14 = [(_UIAlertControllerTVBackgroundView *)self backgroundView];
    v15 = [v14 layer];
    [v15 setCompositingFilter:0];

    v16 = [(UIView *)self layer];
    [v16 setAllowsGroupOpacity:1];

    id v12 = [(UIView *)self layer];
    id v17 = v12;
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v4 = [(UIView *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    BOOL v6 = v5 == 1000 || v5 == 2;
    uint64_t v7 = (id *)MEMORY[0x1E4F3A2E8];
    if (!v6) {
      uint64_t v7 = (id *)MEMORY[0x1E4F3A2E0];
    }
    id v8 = *v7;
    v9 = [(_UIAlertControllerTVBackgroundView *)self backgroundView];
    objc_super v10 = [v9 layer];
    [v10 setCompositingFilter:v8];

    id v11 = [(UIView *)self layer];
    [v11 setAllowsGroupOpacity:0];

    id v12 = [(UIView *)self layer];
    id v17 = v12;
    uint64_t v13 = 0;
  }
  [v12 setAllowsGroupBlending:v13];
}

- (void)_userInterfaceStyleChanged
{
  BOOL v3 = [(_UIAlertControllerTVBackgroundView *)self isHighlighted];
  [(_UIAlertControllerModernTVActionBackgroundView *)self updateCompositingForHighlighted:v3];
}

- (void)setVibrantCompositing:(BOOL)a3 forState:(unint64_t)a4
{
  BOOL v5 = a3;
  vibrancies = self->_vibrancies;
  if (!vibrancies)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_vibrancies;
    self->_vibrancies = v8;

    vibrancies = self->_vibrancies;
  }
  objc_super v10 = [NSNumber numberWithBool:v5];
  id v11 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)vibrancies setObject:v10 forKey:v11];

  BOOL v12 = [(_UIAlertControllerTVBackgroundView *)self isHighlighted];
  [(_UIAlertControllerModernTVActionBackgroundView *)self updateCompositingForHighlighted:v12];
}

- (BOOL)vibrantCompositing:(unint64_t)a3
{
  vibrancies = self->_vibrancies;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  BOOL v5 = [(NSMutableDictionary *)vibrancies objectForKey:v4];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (CGSize)_shadowOffset
{
  double v2 = 0.0;
  double v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.2;
}

- (double)_shadowRadius
{
  return 11.0;
}

- (BOOL)shouldUseTintColorAsHighlightColor
{
  return self->_shouldUseTintColorAsHighlightColor;
}

- (void)setShouldUseTintColorAsHighlightColor:(BOOL)a3
{
  self->_shouldUseTintColorAsHighlightColor = a3;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_vibrancies, 0);
}

@end