@interface _SBSUIWallpaperGradientView
+ (Class)layerClass;
- (_SBSUIWallpaperGradientView)initWithFrame:(CGRect)a3;
@end

@implementation _SBSUIWallpaperGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_SBSUIWallpaperGradientView)initWithFrame:(CGRect)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_SBSUIWallpaperGradientView;
  v3 = -[_SBSUIWallpaperGradientView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_SBSUIWallpaperGradientView *)v3 setUserInteractionEnabled:0];
    v5 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0];
    v6 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5];
    v7 = [(_SBSUIWallpaperGradientView *)v4 layer];
    id v8 = v5;
    v13[0] = [v8 CGColor];
    id v9 = v6;
    v13[1] = [v9 CGColor];
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    [v7 setColors:v10];
  }
  return v4;
}

@end