@interface _UIPageIndicatorImageView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)sizeForImage:(id)a3 traits:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_UIPageIndicatorImageView)initWithCoder:(id)a3;
- (_UIPageIndicatorImageView)initWithFrame:(CGRect)a3;
- (_UIPageIndicatorView)indicatorView;
- (void)_updateSymbolConfiguration;
- (void)invalidateIntrinsicContentSize;
- (void)prepare;
- (void)setImage:(id)a3;
- (void)setIndicatorView:(id)a3;
@end

@implementation _UIPageIndicatorImageView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.vibrantColorMatrix.inputColorMatrix"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPageIndicatorImageView;
    BOOL v5 = [(UIImageView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)invalidateIntrinsicContentSize
{
  __asm { FMOV            V0.2D, #-1.0 }
  self->_cachedSize = _Q0;
  v7.receiver = self;
  v7.super_class = (Class)_UIPageIndicatorImageView;
  [(UIView *)&v7 invalidateIntrinsicContentSize];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = [(UIImageView *)self image];
  [(_UIPageIndicatorImageView *)self sizeForImage:v4 traits:0];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  double v5 = [(UIImageView *)self image];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    self->_cachedSize = _Q0;
    if (([v4 isSymbolImage] & 1) == 0)
    {
      id v12 = v4;
      [v12 size];
      if (v13 > 42.0 || v14 > 42.0)
      {
        BOOL v16 = v13 <= v14;
        double v17 = v13 * 42.0 / v14;
        double v18 = v14 * 42.0 / 42.0;
        if (v16) {
          double v18 = 42.0;
        }
        else {
          double v17 = 42.0;
        }
        objc_msgSend(v12, "imageByPreparingThumbnailOfSize:", v17, v18);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = v12;
      }
      v19 = v15;

      id v4 = [v19 imageWithRenderingMode:2];
    }
    v21.receiver = self;
    v21.super_class = (Class)_UIPageIndicatorImageView;
    [(UIImageView *)&v21 setImage:v4];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __38___UIPageIndicatorImageView_setImage___block_invoke;
    v20[3] = &unk_1E52D9F70;
    v20[4] = self;
    +[UIView performWithoutAnimation:v20];
  }
}

- (CGSize)sizeForImage:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UIImageView *)self image];
  int v9 = [v8 isEqual:v6];
  if (!v9)
  {

LABEL_12:
    if (v7)
    {
      id v12 = -[UIView _contentSizeCategoryLimitedTraitCollection:](self, v7);
    }
    else
    {
      BOOL v16 = [(UIView *)self traitCollection];
      id v12 = -[UIView _contentSizeCategoryLimitedTraitCollection:](self, v16);
    }
    goto LABEL_15;
  }
  if (!v7)
  {

LABEL_7:
    double width = self->_cachedSize.width;
    double height = self->_cachedSize.height;
    if (width != -1.0 || height != -1.0) {
      goto LABEL_27;
    }
    goto LABEL_12;
  }
  double v10 = [(UIView *)self traitCollection];
  int v11 = [v10 isEqual:v7];

  if (v11) {
    goto LABEL_7;
  }
  id v12 = -[UIView _contentSizeCategoryLimitedTraitCollection:](self, v7);
  int v9 = 0;
LABEL_15:
  double v17 = [(UIImageView *)self _symbolConfigurationForImage:v6];
  double v18 = [v17 configurationWithTraitCollection:v12];

  if (([v6 isSymbolImage] & 1) == 0)
  {
    id v19 = v6;
    [v19 size];
    if (v20 > 42.0 || v21 > 42.0)
    {
      BOOL v23 = v20 <= v21;
      double v24 = v20 * 42.0 / v21;
      double v25 = v21 * 42.0 / 42.0;
      if (v23) {
        double v25 = 42.0;
      }
      else {
        double v24 = 42.0;
      }
      objc_msgSend(v19, "imageByPreparingThumbnailOfSize:", v24, v25);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = v19;
    }
    id v6 = v22;
  }
  v26 = [v6 imageWithConfiguration:v18];
  [v26 size];
  double width = v27;
  double height = v28;

  if (v9)
  {
    self->_cachedSize.double width = width;
    self->_cachedSize.double height = height;
  }

LABEL_27:
  double v29 = width;
  double v30 = height;
  result.double height = v30;
  result.double width = v29;
  return result;
}

- (void)setIndicatorView:(id)a3
{
  self->_indicatorView = (_UIPageIndicatorView *)a3;
}

- (_UIPageIndicatorImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorImageView;
  v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(_UIPageIndicatorImageView *)v3 prepare];
  }
  return v4;
}

- (void)prepare
{
  v13[1] = *MEMORY[0x1E4F143B8];
  __asm { FMOV            V0.2D, #-1.0 }
  self->_cachedSize = _Q0;
  [(_UIPageIndicatorImageView *)self _updateSymbolConfiguration];
  v13[0] = objc_opt_class();
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v9 = [(UIView *)self registerForTraitChanges:v8 withAction:sel__updateSymbolConfiguration];

  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v11 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v10, sel_invalidateIntrinsicContentSize, v12[0]);
}

- (void)_updateSymbolConfiguration
{
  v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  switch(v4)
  {
    case 8:
      goto LABEL_4;
    case 5:
      double v5 = 8.0;
      goto LABEL_6;
    case 2:
LABEL_4:
      double v5 = 12.0;
LABEL_6:
      uint64_t v6 = +[UIImageSymbolConfiguration configurationWithPointSize:v5];
      goto LABEL_8;
  }
  uint64_t v6 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleFootnote" scale:1];
LABEL_8:
  id v7 = (id)v6;
  [(UIImageView *)self setPreferredSymbolConfiguration:v6];
}

- (_UIPageIndicatorImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorImageView;
  v3 = [(UIImageView *)&v6 initWithCoder:a3];
  uint64_t v4 = v3;
  if (v3) {
    [(_UIPageIndicatorImageView *)v3 prepare];
  }
  return v4;
}

- (_UIPageIndicatorView)indicatorView
{
  return self->_indicatorView;
}

@end