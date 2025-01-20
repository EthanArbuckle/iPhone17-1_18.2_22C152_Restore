@interface VUIRoomBannerImageDecorator
- (BOOL)needsAlphaForImage:(id)a3;
- (id)decoratorIdentifier;
- (void)drawInContext:(id)a3 imageRect:(CGRect)a4;
@end

@implementation VUIRoomBannerImageDecorator

- (id)decoratorIdentifier
{
  v5.receiver = self;
  v5.super_class = (Class)VUIRoomBannerImageDecorator;
  v2 = [(VUIImageScaleDecorator *)&v5 decoratorIdentifier];
  v3 = [v2 stringByAppendingString:@"_ru"];

  return v3;
}

- (BOOL)needsAlphaForImage:(id)a3
{
  return 1;
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
  double height = a4.size.height;
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (height > 120.0)
  {
    CGContextTranslateCTM((CGContextRef)[v5 CGContext], 0.0, height);
    CGContextScaleCTM((CGContextRef)[v6 CGContext], 1.0, -1.0);
    id v7 = [MEMORY[0x1E4F428B8] blackColor];
    v15[0] = [v7 CGColor];
    id v8 = [MEMORY[0x1E4F428B8] clearColor];
    v15[1] = [v8 CGColor];
    CFArrayRef v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

    CGGradientRef v10 = CGGradientCreateWithColors(0, v9, 0);
    if (v10)
    {
      v11 = v10;
      CGFloat v12 = *MEMORY[0x1E4F1DAD8];
      CGFloat v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      CGContextSetBlendMode((CGContextRef)[v6 CGContext], kCGBlendModeDestinationIn);
      v14 = (CGContext *)[v6 CGContext];
      v16.y = 120.0;
      v16.x = 0.0;
      v17.x = v12;
      v17.y = v13;
      CGContextDrawLinearGradient(v14, v11, v16, v17, 0);
      CGGradientRelease(v11);
    }
  }
}

@end