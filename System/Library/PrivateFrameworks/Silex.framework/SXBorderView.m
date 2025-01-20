@interface SXBorderView
+ (Class)layerClass;
- (SXBorderView)init;
- (void)drawRect:(CGRect)a3;
@end

@implementation SXBorderView

- (SXBorderView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SXBorderView;
  v2 = [(SXBorderView *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C550] clearColor];
    [(SXBorderView *)v2 setBackgroundColor:v3];

    [(SXBorderView *)v2 setOpaque:0];
    [(SXBorderView *)v2 setUserInteractionEnabled:0];
  }
  return v2;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SXBorderView;
  -[SXBorderView drawRect:](&v24, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = [(SXBorderView *)self backgroundColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v9 CGColor]);

  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v25);
  CGContextSaveGState(CurrentContext);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v27);
  CGContextTranslateCTM(CurrentContext, MinX, MaxY);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 scale];
  CGFloat v14 = v13;

  CGAffineTransformMakeScale(&v23, v14, v14);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRect v29 = CGRectApplyAffineTransform(v28, &v23);
  CGFloat v15 = v29.origin.x;
  CGFloat v16 = v29.origin.y;
  CGFloat v17 = v29.size.width;
  CGFloat v18 = v29.size.height;
  if (self) {
    image = self->_image;
  }
  else {
    image = 0;
  }
  v20 = [(UIImage *)image CGImage];
  v30.origin.CGFloat x = v15;
  v30.origin.CGFloat y = v16;
  v30.size.CGFloat width = v17;
  v30.size.CGFloat height = v18;
  v21 = CGImageCreateWithImageInRect(v20, v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat v22 = CGRectGetWidth(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  v33.size.CGFloat height = CGRectGetHeight(v32);
  v33.origin.CGFloat x = 0.0;
  v33.origin.CGFloat y = 0.0;
  v33.size.CGFloat width = v22;
  CGContextDrawImage(CurrentContext, v33, v21);
  CGImageRelease(v21);
  CGContextRestoreGState(CurrentContext);
}

- (void).cxx_destruct
{
}

@end