@interface SSFlashView
+ (Class)_flashViewClass;
+ (double)expectedAnimationDurationForStyle:(unint64_t)a3;
+ (id)flashViewForStyle:(unint64_t)a3;
- (SSFlashView)initWithFrame:(CGRect)a3;
- (unint64_t)style;
- (void)flashWithCompletion:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation SSFlashView

+ (Class)_flashViewClass
{
  UIAccessibilityIsReduceTransparencyEnabled();
  v2 = objc_opt_class();
  return (Class)v2;
}

+ (id)flashViewForStyle:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)[a1 _flashViewClass]);
  [v4 setStyle:a3];
  return v4;
}

- (SSFlashView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSFlashView;
  v3 = -[SSFlashView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSFlashView *)v3 setUserInteractionEnabled:0];
  return v3;
}

+ (double)expectedAnimationDurationForStyle:(unint64_t)a3
{
  id v4 = (void *)[a1 _flashViewClass];
  [v4 expectedAnimationDurationForStyle:a3];
  return result;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  [(SSFlashView *)self setNeedsLayout];
}

- (void)flashWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (unint64_t)style
{
  return self->_style;
}

@end