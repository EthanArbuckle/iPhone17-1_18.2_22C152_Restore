@interface _UILegibilityView
- (BOOL)hidesImage;
- (BOOL)usesColorFilters;
- (BOOL)usesSecondaryColor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)image;
- (UIImage)shadowImage;
- (UIImageView)imageView;
- (UIImageView)shadowImageView;
- (_UILegibilitySettings)settings;
- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5;
- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5 shadowImage:(id)a6;
- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5 shadowImage:(id)a6 options:(int64_t)a7;
- (_UILegibilityView)initWithStyle:(int64_t)a3 image:(id)a4;
- (_UILegibilityView)initWithStyle:(int64_t)a3 image:(id)a4 shadowImage:(id)a5;
- (double)strength;
- (id)drawingColor;
- (int64_t)options;
- (int64_t)style;
- (void)_updateFilters;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHidesImage:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 shadowImage:(id)a4;
- (void)setImageView:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setSettings:(id)a3;
- (void)setSettings:(id)a3 image:(id)a4 shadowImage:(id)a5;
- (void)setShadowImage:(id)a3;
- (void)setShadowImageView:(id)a3;
- (void)setStrength:(double)a3;
- (void)setStyle:(int64_t)a3 image:(id)a4 shadowImage:(id)a5;
- (void)updateForChangedSettings:(id)a3;
@end

@implementation _UILegibilityView

- (_UILegibilityView)initWithStyle:(int64_t)a3 image:(id)a4
{
  return [(_UILegibilityView *)self initWithStyle:a3 image:a4 shadowImage:0];
}

- (_UILegibilityView)initWithStyle:(int64_t)a3 image:(id)a4 shadowImage:(id)a5
{
  id v7 = +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", a3, a4, a5);
  return [(_UILegibilityView *)self initWithSettings:v7 strength:a4 image:0 shadowImage:0 options:1.5];
}

- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5
{
  return [(_UILegibilityView *)self initWithSettings:a3 strength:a5 image:0 shadowImage:0 options:a4];
}

- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5 shadowImage:(id)a6
{
  return [(_UILegibilityView *)self initWithSettings:a3 strength:a5 image:a6 shadowImage:0 options:a4];
}

- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5 shadowImage:(id)a6 options:(int64_t)a7
{
  [a5 size];
  double v14 = v13;
  [a5 size];
  v19.receiver = self;
  v19.super_class = (Class)_UILegibilityView;
  v16 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, 0.0, 0.0, v14, v15);
  v17 = v16;
  if (v16)
  {
    [(CALayer *)[(UIView *)v16 layer] setAllowsGroupBlending:0];
    [(_UILegibilityView *)v17 setStrength:a4];
    [(_UILegibilityView *)v17 setOptions:a7];
    [(_UILegibilityView *)v17 setSettings:a3 image:a5 shadowImage:a6];
  }
  return v17;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void)dealloc
{
  _DecrementImageUsage((uint64_t)self->_image);

  self->_settings = 0;
  self->_image = 0;

  self->_shadowImage = 0;
  [(UIView *)self->_imageView removeFromSuperview];

  self->_imageView = 0;
  [(UIView *)self->_shadowImageView removeFromSuperview];

  self->_shadowImageView = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityView;
  [(UIView *)&v3 dealloc];
}

- (int64_t)style
{
  v2 = [(_UILegibilityView *)self settings];
  return [(_UILegibilitySettings *)v2 style];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = [(_UILegibilityView *)self image];
  [(UIImage *)v3 size];
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setHidesImage:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidesImage = a3;
  double v4 = [(_UILegibilityView *)self imageView];
  [(UIImageView *)v4 setHidden:v3];
}

- (void)setImage:(id)a3
{
  image = self->_image;
  if (image != a3)
  {
    _DecrementImageUsage((uint64_t)image);

    self->_image = (UIImage *)a3;
    if (a3)
    {
      if (qword_1EB25A0D0 != -1) {
        dispatch_once(&qword_1EB25A0D0, &__block_literal_global_433);
      }
      v6 = (void *)qword_1EB25A0C8;
      [v6 addObject:a3];
    }
  }
}

- (void)setImage:(id)a3 shadowImage:(id)a4
{
  id v7 = [(_UILegibilityView *)self settings];
  [(_UILegibilityView *)self setSettings:v7 image:a3 shadowImage:a4];
}

- (void)setStyle:(int64_t)a3 image:(id)a4 shadowImage:(id)a5
{
  id v8 = +[_UILegibilitySettings sharedInstanceForStyle:a3];
  [(_UILegibilityView *)self setSettings:v8 image:a4 shadowImage:a5];
}

- (void)setSettings:(id)a3 image:(id)a4 shadowImage:(id)a5
{
  -[_UILegibilityView setSettings:](self, "setSettings:");
  [(_UILegibilityView *)self setImage:a4];
  [(_UILegibilityView *)self setShadowImage:a5];
  if (a4 && ([a4 size], v9 >= 1.0) && (objc_msgSend(a4, "size"), v10 >= 1.0))
  {
    if (__51___UILegibilityView_setSettings_image_shadowImage___block_invoke(a4)) {
      a4 = (id)objc_msgSend(a4, "imageWithTintColor:", -[_UILegibilityView drawingColor](self, "drawingColor"));
    }
    v12 = [(_UILegibilityView *)self imageView];
    if (v12)
    {
      double v13 = (_UILegibilityImageView *)v12;
      [(UIImageView *)v12 setImage:a4];
      [(UIView *)[(_UILegibilityView *)self imageView] sizeToFit];
    }
    else
    {
      double v13 = [(UIImageView *)[_UILegibilityImageView alloc] initWithImage:a4];
      [(_UILegibilityView *)self setImageView:v13];
      [(UIView *)self addSubview:v13];
    }
    [(UIImageView *)v13 setHidden:self->_hidesImage];
    if (![(_UILegibilityView *)self shadowImage])
    {
      double v14 = (_UILegibilitySettings *)a3;
      if ([(_UILegibilityView *)self usesColorFilters])
      {
        double v14 = [[_UILegibilitySettings alloc] initWithStyle:[(_UILegibilitySettings *)self->_settings style] primaryColor:[(_UILegibilitySettings *)self->_settings primaryColor] secondaryColor:[(_UILegibilitySettings *)self->_settings secondaryColor] shadowColor:+[UIColor whiteColor]];
        [(_UILegibilitySettings *)self->_settings minFillHeight];
        -[_UILegibilitySettings setMinFillHeight:](v14, "setMinFillHeight:");
      }
      [(_UILegibilityView *)self strength];
      if (v15 != 0.0)
      {
        v16 = [(_UILegibilityView *)self image];
        [(_UILegibilityView *)self strength];
        -[_UILegibilityView setShadowImage:](self, "setShadowImage:", -[UIImage _imageForLegibilitySettings:strength:alphaOnly:](v16, "_imageForLegibilitySettings:strength:alphaOnly:", v14, 1));
      }
    }
    v17 = [(_UILegibilityView *)self shadowImageView];
    if (v17)
    {
      v18 = (_UILegibilityImageView *)v17;
      [(UIImageView *)v17 setImage:[(_UILegibilityView *)self shadowImage]];
      [(UIView *)v18 sizeToFit];
    }
    else
    {
      v18 = [(UIImageView *)[_UILegibilityImageView alloc] initWithImage:[(_UILegibilityView *)self shadowImage]];
      [(_UILegibilityView *)self setShadowImageView:v18];
      [(UIView *)self addSubview:v18];
      [(UIView *)self sendSubviewToBack:v18];
    }
    [(UIImageView *)v18 _applySettingsForLegibilityStyle:[(_UILegibilityView *)self style]];
    if (__51___UILegibilityView_setSettings_image_shadowImage___block_invoke([(UIImageView *)v18 image])) {
      uint64_t v19 = objc_msgSend((id)objc_msgSend(a3, "shadowColor"), "CGColor");
    }
    else {
      uint64_t v19 = 0;
    }
    [(CALayer *)[(UIView *)v18 layer] setContentsMultiplyColor:v19];
    [(_UILegibilityView *)self _updateFilters];
  }
  else
  {
    [(_UILegibilityView *)self setImage:0];
    [(UIImageView *)[(_UILegibilityView *)self imageView] setImage:0];
    v11 = [(_UILegibilityView *)self shadowImageView];
    [(UIImageView *)v11 setImage:0];
  }
}

- (void)updateForChangedSettings:(id)a3
{
  double v15 = [(_UILegibilityView *)self settings];
  [(_UILegibilityView *)self setSettings:a3];
  if ([(_UILegibilityView *)self usesColorFilters]
    && [(_UILegibilityView *)self image]
    && [(_UILegibilityView *)self imageView])
  {
    [(UIImageView *)[(_UILegibilityView *)self shadowImageView] _applySettingsForLegibilityStyle:[(_UILegibilityView *)self style]];
    [(_UILegibilityView *)self _updateFilters];
  }
  else
  {
    [(_UILegibilityView *)self updateImage];
    [a3 shadowRadius];
    double v6 = v5;
    [(_UILegibilitySettings *)v15 shadowRadius];
    if (vabdd_f64(v6, v7) <= 2.22044605e-16
      && ([a3 shadowAlpha],
          double v9 = v8,
          [(_UILegibilitySettings *)v15 shadowAlpha],
          vabdd_f64(v9, v10) <= 2.22044605e-16)
      && ([a3 minFillHeight],
          double v12 = v11,
          [(_UILegibilitySettings *)v15 minFillHeight],
          vabdd_f64(v12, v13) <= 2.22044605e-16))
    {
      double v14 = [(_UILegibilityView *)self shadowImage];
    }
    else
    {
      double v14 = 0;
    }
    [(_UILegibilityView *)self setSettings:a3 image:[(_UILegibilityView *)self image] shadowImage:v14];
  }
}

- (void)layoutSubviews
{
  [+[UIScreen mainScreen] scale];
  double v4 = v3;
  [(UIView *)[(_UILegibilityView *)self imageView] frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self bounds];
  double v17 = UIRectCenteredIntegralRectScale(v6, v8, v10, v12, v13, v14, v15, v16, v4);
  -[UIImageView setFrame:]([(_UILegibilityView *)self imageView], "setFrame:", v17, v18, v19, v20);
  [(UIView *)[(_UILegibilityView *)self shadowImageView] frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(UIView *)self bounds];
  double v33 = UIRectCenteredIntegralRectScale(v22, v24, v26, v28, v29, v30, v31, v32, v4);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [(_UILegibilityView *)self shadowImageView];
  -[UIImageView setFrame:](v40, "setFrame:", v33, v35, v37, v39);
}

- (BOOL)usesColorFilters
{
  return ((unint64_t)[(_UILegibilityView *)self options] >> 1) & 1;
}

- (BOOL)usesSecondaryColor
{
  return [(_UILegibilityView *)self options] & 1;
}

- (id)drawingColor
{
  BOOL v3 = [(_UILegibilityView *)self usesSecondaryColor];
  double v4 = [(_UILegibilityView *)self settings];
  if (v3)
  {
    return [(_UILegibilitySettings *)v4 secondaryColor];
  }
  else
  {
    return [(_UILegibilitySettings *)v4 primaryColor];
  }
}

- (void)_updateFilters
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(_UILegibilityView *)self usesColorFilters])
  {
    uint64_t v3 = *MEMORY[0x1E4F3A2A8];
    double v4 = (void *)[MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    [v4 setName:v3];
    objc_msgSend(v4, "setValue:forKey:", objc_msgSend(-[_UILegibilityView drawingColor](self, "drawingColor"), "CGColor"), @"inputColor");
    v8[0] = v4;
    -[CALayer setFilters:](-[UIView layer](-[_UILegibilityView imageView](self, "imageView"), "layer"), "setFilters:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
    double v5 = (void *)[MEMORY[0x1E4F39BC0] filterWithType:v3];
    [v5 setName:v3];
    objc_msgSend(v5, "setValue:forKey:", -[UIColor CGColor](-[_UILegibilitySettings shadowColor](-[_UILegibilityView settings](self, "settings"), "shadowColor"), "CGColor"), @"inputColor");
    double v7 = v5;
    -[CALayer setFilters:](-[UIView layer](-[_UILegibilityView shadowImageView](self, "shadowImageView"), "layer"), "setFilters:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1]);
  }
  else
  {
    [(CALayer *)[(UIView *)[(_UILegibilityView *)self imageView] layer] setFilters:0];
    double v6 = [(UIView *)[(_UILegibilityView *)self shadowImageView] layer];
    [(CALayer *)v6 setFilters:0];
  }
}

- (_UILegibilitySettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

@end