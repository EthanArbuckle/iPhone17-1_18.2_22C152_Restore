@interface _TVUberBlurImageDecorator
- (UIColor)gradientColor;
- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5;
- (id)decoratorIdentifier;
- (unint64_t)blurStyle;
- (unint64_t)blurType;
- (void)setBlurStyle:(unint64_t)a3;
- (void)setBlurType:(unint64_t)a3;
- (void)setGradientColor:(id)a3;
@end

@implementation _TVUberBlurImageDecorator

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263F1C6B0];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = v7;
  uint64_t v10 = [v9 image];

  v11 = (void *)[v8 initWithCGImage:v10];
  v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  if (self->_blurType > 1)
  {
    v43 = [(_TVUberBlurImageDecorator *)self gradientColor];
    v44 = v43;
    if (v43)
    {
      id v45 = v43;
    }
    else
    {
      id v45 = [MEMORY[0x263F1C550] colorWithRed:0.117647059 green:0.117647059 blue:0.117647059 alpha:0.2];
    }
    id v40 = v45;

    v46 = _TVBlurredImageWithOptionsAndOverlayColorForImage(v11, 13, v40, v14, v16, 2.0);
    v47 = v46;
    if (v46)
    {
      v42 = CGImageRetain((CGImageRef)[v46 CGImage]);
      if (v42) {
        goto LABEL_22;
      }
    }
    if ([v47 ioSurface])
    {
      [v47 ioSurface];
      v42 = (CGImage *)_UICreateCGImageFromIOSurfaceWithOptions();
      if (v42)
      {
LABEL_22:
        id v89 = v40;
        v90 = v47;
        v48 = [MEMORY[0x263F1C920] mainScreen];
        [v48 scale];
        CGFloat v50 = v49;
        v99.width = v14;
        v99.height = v16;
        UIGraphicsBeginImageContextWithOptions(v99, 0, v50);

        c = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(c, 0.0, v16);
        CGContextScaleCTM(c, 1.0, -1.0);
        v51 = +[TVMLUtilities TVMLKitBundle];
        v52 = objc_msgSend(v51, "tv_imageNamed:", @"Music_Uber_Blur_Gradient");

        id v53 = v52;
        v54 = (CGImage *)[v53 CGImage];
        size_t Width = CGImageGetWidth(v54);
        size_t Height = CGImageGetHeight(v54);
        v57 = v11;
        size_t BitsPerComponent = CGImageGetBitsPerComponent(v54);
        size_t BitsPerPixel = CGImageGetBitsPerPixel(v54);
        size_t BytesPerRow = CGImageGetBytesPerRow(v54);
        DataProvider = CGImageGetDataProvider(v54);
        Decode = CGImageGetDecode(v54);
        size_t v63 = BitsPerComponent;
        v11 = v57;
        v64 = v42;
        v65 = CGImageMaskCreate(Width, Height, v63, BitsPerPixel, BytesPerRow, DataProvider, Decode, 0);
        CGContextSetBlendMode(c, kCGBlendModeCopy);
        [v11 size];
        CGFloat v67 = v66;
        CGFloat v69 = v68;
        double v70 = v14 / v66;
        double v71 = v16 / v68;
        if (v70 < v71) {
          double v70 = v71;
        }
        CGAffineTransformMakeScale(&v91, v70, v70);
        v103.origin.double x = 0.0;
        v103.origin.double y = 0.0;
        v103.size.width = v67;
        v103.size.height = v69;
        CGRect v104 = CGRectApplyAffineTransform(v103, &v91);
        CGFloat v72 = *MEMORY[0x263F00148];
        double v73 = *(double *)(MEMORY[0x263F00148] + 8);
        +[TVMLUtilities centerRect:inRect:](TVMLUtilities, "centerRect:inRect:", v104.origin.x, v104.origin.y, v104.size.width, v104.size.height, *MEMORY[0x263F00148], v73, v14, v16);
        CGFloat v75 = v74;
        CGFloat v77 = v76;
        CGFloat v79 = v78;
        CGFloat v81 = v80;
        v82 = (CGImage *)[v11 CGImage];
        v105.origin.double x = v75;
        v105.origin.double y = v77;
        v105.size.width = v79;
        v105.size.height = v81;
        CGContextDrawImage(c, v105, v82);
        CGContextSetBlendMode(c, kCGBlendModeNormal);
        v83 = CGImageCreateWithMask(v42, v65);
        [v53 size];
        v106.size.width = v84;
        v106.size.height = v85;
        v106.origin.double x = v72;
        v106.origin.double y = v73;
        CGContextDrawImage(c, v106, v83);
        v86 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        if (v86) {
          v42 = -[TVImage initWithCGImageRef:preserveAlpha:]([TVImage alloc], "initWithCGImageRef:preserveAlpha:", [v86 CGImage], 0);
        }
        else {
          v42 = 0;
        }
        CFRelease(v83);
        CFRelease(v65);
        CFRelease(v64);

        id v40 = v89;
        v47 = v90;
      }
    }
    else
    {
      v42 = 0;
    }

    goto LABEL_30;
  }
  [v11 size];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v21 = v14 / v17;
  double v22 = v16 / v19;
  if (v21 < v22) {
    double v21 = v22;
  }
  CGAffineTransformMakeScale(&v92, v21, v21);
  v101.origin.double x = 0.0;
  v101.origin.double y = 0.0;
  v101.size.width = v18;
  v101.size.height = v20;
  CGRect v102 = CGRectApplyAffineTransform(v101, &v92);
  double x = v102.origin.x;
  double y = v102.origin.y;
  double v25 = v102.size.width;
  double v26 = v102.size.height;
  v27 = [MEMORY[0x263F1C920] mainScreen];
  [v27 scale];
  CGFloat v29 = v28;
  v97.width = v14;
  v97.height = v16;
  UIGraphicsBeginImageContextWithOptions(v97, 0, v29);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  +[TVMLUtilities centerRect:inRect:](TVMLUtilities, "centerRect:inRect:", x, y, v25, v26, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v14, v16);
  double v31 = 1.0;
  objc_msgSend(v11, "drawInRect:blendMode:alpha:", 17);
  CGContextRestoreGState(CurrentContext);
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v33 = DeviceRGB;
    if (self->_blurStyle != 1) {
      double v31 = 0.0;
    }
    *(_OWORD *)locations = xmmword_230C37E80;
    id v34 = [MEMORY[0x263F1C550] colorWithWhite:v31 alpha:0.2];
    v93[0] = [v34 CGColor];
    id v35 = [MEMORY[0x263F1C550] colorWithWhite:v31 alpha:0.0];
    v93[1] = [v35 CGColor];
    CFArrayRef v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];

    v37 = CGGradientCreateWithColors(v33, v36, locations);
    if (v37)
    {
      v38 = v37;
      double v39 = 0.598958333;
      if (self->_blurType == 1) {
        double v39 = 0.5;
      }
      v98.double x = v14 * v39;
      v100.double x = v98.x + v14 * 0.104166667;
      v98.double y = 0.0;
      v100.double y = 0.0;
      CGContextDrawLinearGradient(CurrentContext, v37, v98, v100, 3u);
      CFRelease(v38);
    }
    CFRelease(v33);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (v40)
  {
    v41 = [TVImage alloc];
    id v40 = v40;
    v42 = -[TVImage initWithCGImageRef:preserveAlpha:](v41, "initWithCGImageRef:preserveAlpha:", [v40 CGImage], 0);
  }
  else
  {
    v42 = 0;
  }
LABEL_30:

  return v42;
}

- (id)decoratorIdentifier
{
  return @"uber";
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (void)setGradientColor:(id)a3
{
}

- (unint64_t)blurType
{
  return self->_blurType;
}

- (void)setBlurType:(unint64_t)a3
{
  self->_blurType = a3;
}

- (unint64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(unint64_t)a3
{
  self->_blurStyle = a3;
}

- (void).cxx_destruct
{
}

@end