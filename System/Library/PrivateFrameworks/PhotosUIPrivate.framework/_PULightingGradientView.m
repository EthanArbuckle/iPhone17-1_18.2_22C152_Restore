@interface _PULightingGradientView
- (BOOL)isOpaque;
- (_PULightingGradientView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation _PULightingGradientView

- (void)drawRect:(CGRect)a3
{
  v27[5] = *MEMORY[0x1E4F143B8];
  [(_PULightingGradientView *)self bounds];
  if (v5 > 0.0)
  {
    CGFloat v7 = v3;
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CurrentContext = UIGraphicsGetCurrentContext();
    v30.origin.x = v7;
    v30.origin.y = v8;
    v30.size.width = v9;
    v30.size.height = v10;
    CGContextClearRect(CurrentContext, v30);
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    v13 = [MEMORY[0x1E4FB1618] blackColor];
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [v14 set];

    v31.origin.x = v7;
    v31.origin.y = v8;
    v31.size.width = v9;
    v31.size.height = v10;
    CGContextFillRect(CurrentContext, v31);
    v32.origin.x = v7;
    v32.origin.y = v8;
    v32.size.width = v9;
    v32.size.height = v10;
    CGContextClipToRect(CurrentContext, v32);
    id v15 = v12;
    v16 = [v15 CGColor];
    id v17 = v13;
    v18 = [v17 CGColor];
    v27[0] = v18;
    v27[1] = v18;
    v27[2] = v18;
    v27[3] = v16;
    v27[4] = v16;
    CFArrayRef v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
    id v20 = v15;
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v20, "CGColor", 0, 0x3FE0000000000000, 0x3FECCCCCCCCCCCCDLL, 0x3FEFD70A3D70A3D7, 0x3FF0000000000000, 0));
    v22 = CGGradientCreateWithColors(ColorSpace, v19, (const CGFloat *)&v26);
    v33.origin.x = v7;
    v33.origin.y = v8;
    v33.size.width = v9;
    v33.size.height = v10;
    CGFloat MinX = CGRectGetMinX(v33);
    v34.origin.x = v7;
    v34.origin.y = v8;
    v34.size.width = v9;
    v34.size.height = v10;
    CGFloat MinY = CGRectGetMinY(v34);
    v35.origin.x = v7;
    v35.origin.y = v8;
    v35.size.width = v9;
    v35.size.height = v10;
    CGFloat v25 = CGRectGetMinX(v35);
    v36.origin.x = v7;
    v36.origin.y = v8;
    v36.size.width = v9;
    v36.size.height = v10;
    v29.y = CGRectGetMaxY(v36);
    v28.x = MinX;
    v28.y = MinY;
    v29.x = v25;
    CGContextDrawLinearGradient(CurrentContext, v22, v28, v29, 0);
    CGGradientRelease(v22);
  }
}

- (BOOL)isOpaque
{
  return 0;
}

- (_PULightingGradientView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PULightingGradientView;
  double v3 = -[_PULightingGradientView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(_PULightingGradientView *)v3 setContentMode:3];
    [(_PULightingGradientView *)v4 setBackgroundColor:0];
    [(_PULightingGradientView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

@end