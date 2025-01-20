@interface _UIAlertControllerModernTVBackgroundView
+ (CGSize)backgroundInsetAmount;
+ (double)contentCornerRadius;
+ (double)platterHairlineWidth;
+ (id)newBackgroundVisualEffectInAlertGroup;
- (_UIAlertControllerModernTVBackgroundView)initWithFrame:(CGRect)a3;
- (void)_configurePlatterHairline;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
@end

@implementation _UIAlertControllerModernTVBackgroundView

+ (CGSize)backgroundInsetAmount
{
  double v2 = 32.0;
  double v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)contentCornerRadius
{
  return 48.0;
}

+ (double)platterHairlineWidth
{
  return 1.0;
}

+ (id)newBackgroundVisualEffectInAlertGroup
{
  double v2 = objc_alloc_init(UIVisualEffectView);
  double v3 = +[UIBlurEffect effectWithStyle:5002];
  [(UIVisualEffectView *)v2 setEffect:v3];
  [(UIVisualEffectView *)v2 _setGroupName:@"_UIAlertControllerModernBackgroundEffectView"];

  return v2;
}

- (_UIAlertControllerModernTVBackgroundView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerModernTVBackgroundView;
  double v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIVisualEffectView);
    v5 = +[UIBlurEffect effectWithStyle:5002];
    [(UIVisualEffectView *)v4 setEffect:v5];
    [(UIVisualEffectView *)v4 _setGroupName:@"_UIAlertControllerModernBackgroundEffectView"];

    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(UIView *)v3 bounds];
    -[UIView setFrame:](v4, "setFrame:");
    [(UIView *)v4 setAutoresizingMask:18];
    [(UIView *)v3 addSubview:v4];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerModernTVBackgroundView;
  [(UIView *)&v3 layoutSubviews];
  [(_UIAlertControllerModernTVBackgroundView *)self _configurePlatterHairline];
}

- (void)_configurePlatterHairline
{
  objc_super v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257998, @"TVAlert_DarkModeBackgroundHairlineAlpha"))double v5 = 0.1; {
  else
  }
    double v5 = *(double *)&qword_1EB2579A0;
  BOOL v6 = v4 == 1000 || v4 == 2;
  if (v6 && v5 > 0.0)
  {
    int v7 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_9, @"TVAlert_DarkModeBackgroundHairlineWhite");
    double v8 = *(double *)&qword_1EB257990;
    if (v7) {
      double v8 = 1.0;
    }
    id v9 = +[UIColor colorWithWhite:v8 alpha:v5];
    uint64_t v10 = [v9 CGColor];
    v11 = [(UIView *)self layer];
    [v11 setBorderColor:v10];

    [(id)objc_opt_class() platterHairlineWidth];
    double v13 = v12;
    v14 = [(UIView *)self layer];
    id v17 = v14;
    double v15 = v13;
  }
  else
  {
    v16 = [(UIView *)self layer];
    [v16 setBorderColor:0];

    v14 = [(UIView *)self layer];
    id v17 = v14;
    double v15 = 0.0;
  }
  [v14 setBorderWidth:v15];
}

- (void)setCornerRadius:(double)a3
{
  [(UIView *)self setClipsToBounds:1];
  double v5 = [(UIView *)self layer];
  [v5 setCornerRadius:a3];

  id v6 = [(UIView *)self layer];
  [v6 setCornerCurve:*MEMORY[0x1E4F39EA8]];
}

@end