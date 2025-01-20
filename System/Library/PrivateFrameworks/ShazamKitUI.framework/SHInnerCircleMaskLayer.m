@interface SHInnerCircleMaskLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)setup;
@end

@implementation SHInnerCircleMaskLayer

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"innerCircleRelativeSize"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SHInnerCircleMaskLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)setup
{
  [(SHInnerCircleMaskLayer *)self setNeedsDisplayOnBoundsChange:1];
  +[SHPalette contentsScale];
  -[SHInnerCircleMaskLayer setContentsScale:](self, "setContentsScale:");
}

- (void)drawInContext:(CGContext *)a3
{
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
  CGFloat x = ClipBoundingBox.origin.x;
  CGFloat y = ClipBoundingBox.origin.y;
  CGFloat width = ClipBoundingBox.size.width;
  CGFloat height = ClipBoundingBox.size.height;
  Mutable = CGPathCreateMutable();
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v24);
  v10 = [(SHPaletteLayer *)self palette];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v10 blackColor]);

  CGContextAddPath(a3, Mutable);
  CGContextDrawPath(a3, kCGPathFill);
  CGPathRelease(Mutable);
  [(SHInnerCircleMaskLayer *)self innerCircleRelativeSize];
  CGFloat v12 = 1.0 / v11;
  [(SHInnerCircleMaskLayer *)self innerCircleRelativeSize];
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformScale(&v22, &v21, v12, 1.0 / v13);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRect v26 = CGRectApplyAffineTransform(v25, &v22);
  double v15 = v26.size.width;
  double v16 = v26.size.height;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v17 = CGRectGetMidX(v26) - v15 * 0.5;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMidY(v27) - v16 * 0.5;
  v19 = CGPathCreateMutable();
  v28.origin.CGFloat x = v17;
  v28.origin.CGFloat y = v18;
  v28.size.CGFloat width = v15;
  v28.size.CGFloat height = v16;
  CGPathAddEllipseInRect(v19, 0, v28);
  v20 = [(SHPaletteLayer *)self palette];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v20 clearColor]);

  CGContextSetBlendMode(a3, kCGBlendModeClear);
  CGContextBeginPath(a3);
  CGContextAddPath(a3, v19);
  CGContextDrawPath(a3, kCGPathFill);
  CGPathRelease(v19);
  CGContextSetBlendMode(a3, kCGBlendModeNormal);
}

@end