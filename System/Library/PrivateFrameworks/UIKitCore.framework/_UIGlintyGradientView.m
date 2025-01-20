@interface _UIGlintyGradientView
+ (Class)layerClass;
- (_UIGlintyGradientView)initWithFrame:(CGRect)a3;
@end

@implementation _UIGlintyGradientView

- (_UIGlintyGradientView)initWithFrame:(CGRect)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_UIGlintyGradientView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor colorWithWhite:0.05 alpha:1.0];
    v5 = +[UIColor colorWithWhite:0.95 alpha:1.0];
    v6 = [(_UIGlintyGradientView *)v3 gradientLayer];
    id v7 = v4;
    v14[0] = [v7 CGColor];
    id v8 = v5;
    v14[1] = [v8 CGColor];
    id v9 = v7;
    v14[2] = [v9 CGColor];
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    [v6 setColors:v10];

    objc_msgSend(v6, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v6, "setEndPoint:", 0.5, 1.0);
    v11 = v3;
  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end