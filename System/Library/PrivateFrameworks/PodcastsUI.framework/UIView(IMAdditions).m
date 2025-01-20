@interface UIView(IMAdditions)
- (BOOL)isHorizontallyCompact;
- (BOOL)isHorizontallyRegular;
- (BOOL)isHorizontallySpecified;
- (BOOL)isVerticallyCompact;
- (BOOL)isVerticallyRegular;
- (BOOL)isVerticallySpecified;
- (BOOL)isViewSizeFullScreenInWindow:()IMAdditions ignoreInWindowCheck:;
- (double)adjustRectCenter:()IMAdditions fromView:;
- (id)ancestorOfClass:()IMAdditions;
- (id)debugingBorderColor;
- (id)findFirstResponder;
- (id)imageSnapshot;
- (id)snapshot_cg;
- (id)subviewOfClass:()IMAdditions;
- (void)attachPopUpAnimation;
- (void)debugHighlightView;
- (void)debugHighlightViewBlue;
- (void)debugHighlightViewWithColor:()IMAdditions width:;
- (void)printResponderChain;
- (void)setDebugingBorderColor:()IMAdditions;
- (void)setRoundedCorners:()IMAdditions radius:;
@end

@implementation UIView(IMAdditions)

- (void)debugHighlightView
{
  id v2 = [MEMORY[0x1E4FB1618] redColor];
  [a1 debugHighlightViewWithColor:v2 width:2.0];
}

- (void)debugHighlightViewBlue
{
  id v2 = [MEMORY[0x1E4FB1618] blueColor];
  [a1 debugHighlightViewWithColor:v2 width:2.0];
}

- (void)debugHighlightViewWithColor:()IMAdditions width:
{
  id v6 = a3;
  uint64_t v7 = [v6 CGColor];
  v8 = [a1 layer];
  [v8 setBorderColor:v7];

  v9 = [a1 layer];
  [v9 setBorderWidth:a4];

  v10 = [a1 layer];
  [v10 setCornerRadius:4.0];

  v11 = [v6 colorWithAlphaComponent:0.3];

  id v14 = v11;
  uint64_t v12 = [v14 CGColor];
  v13 = [a1 layer];
  [v13 setBackgroundColor:v12];
}

- (id)snapshot_cg
{
  [a1 bounds];
  size_t v3 = vcvtd_n_u64_f64(v2, 2uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  [a1 bounds];
  size_t v6 = (unint64_t)v5;
  [a1 bounds];
  v8 = CGBitmapContextCreate(0, v6, (unint64_t)v7, 8uLL, v3, DeviceRGB, 0x4001u);
  v9 = [a1 layer];
  [v9 renderInContext:v8];

  Image = CGBitmapContextCreateImage(v8);
  v11 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
  CGImageRelease(Image);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v8);

  return v11;
}

- (id)imageSnapshot
{
  [a1 bounds];
  if (v2 <= 0.0 || ([a1 bounds], v3 <= 0.0))
  {
    uint64_t v12 = [MEMORY[0x1E4F91F10] sharedLogger];
    [v12 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Extensions/UIKit/UIView+IMAdditions.m", 66, @"Snapshotting a CGSizeZero view: %@", a1 lineNumber format];

    v11 = 0;
  }
  else
  {
    [a1 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    char v8 = [a1 isOpaque];
    v15.width = v5;
    v15.height = v7;
    IMGraphicsBeginImageContextWithOptions(v15, v8, 0.0);
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    v10 = [a1 layer];
    [v10 renderInContext:CurrentContext];

    v11 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v11;
}

- (id)subviewOfClass:()IMAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [a1 subviews];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v9;

    if (v10) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "subviewOfClass:", a3, (void)v18);
        if (v16)
        {
          id v10 = (id)v16;
          goto LABEL_21;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_21:

LABEL_22:

  return v10;
}

- (id)ancestorOfClass:()IMAdditions
{
  uint64_t v1 = [a1 superview];
  if (v1)
  {
    double v2 = (void *)v1;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = [v2 superview];

      double v2 = (void *)v3;
      if (!v3) {
        goto LABEL_5;
      }
    }
    id v4 = v2;
  }
  else
  {
LABEL_5:
    id v4 = 0;
  }

  return v4;
}

- (id)findFirstResponder
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1 isFirstResponder])
  {
    id v2 = a1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = objc_msgSend(a1, "subviews", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) findFirstResponder];
          if (v8)
          {
            id v2 = (id)v8;

            goto LABEL_13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v2 = 0;
  }
LABEL_13:

  return v2;
}

- (void)printResponderChain
{
  id v1 = a1;
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = 1;
    do
    {
      id v4 = [v2 description];
      uint64_t v5 = (const char *)[v4 cStringUsingEncoding:30];

      printf("%lu. %s\n", v3++, v5);
      uint64_t v6 = [v2 nextResponder];

      id v2 = (void *)v6;
    }
    while (v6);
  }
}

- (void)setRoundedCorners:()IMAdditions radius:
{
  [a1 bounds];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  CGFloat MinX = CGRectGetMinX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v31);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, MinX, MidY);
  if (a4) {
    double v16 = a2;
  }
  else {
    double v16 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, v16);
  if ((a4 & 2) != 0) {
    double v17 = a2;
  }
  else {
    double v17 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, v17);
  if ((a4 & 8) != 0) {
    double v18 = a2;
  }
  else {
    double v18 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MidX, MaxY, v18);
  if ((a4 & 4) != 0) {
    double v19 = a2;
  }
  else {
    double v19 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MidY, v19);
  CGPathCloseSubpath(Mutable);
  id v24 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  [v24 setPath:Mutable];
  long long v20 = [a1 layer];
  [v20 setMask:0];

  long long v21 = [a1 layer];
  [v21 setMask:v24];

  CFRelease(Mutable);
}

- (void)attachPopUpAnimation
{
  id v2 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  memset(&v23, 0, sizeof(v23));
  CATransform3DMakeScale(&v23, 0.5, 0.5, 1.0);
  memset(&v22, 0, sizeof(v22));
  CATransform3DMakeScale(&v22, 1.2, 1.2, 1.0);
  memset(&v21, 0, sizeof(v21));
  CATransform3DMakeScale(&v21, 0.9, 0.9, 1.0);
  memset(&v20, 0, sizeof(v20));
  CATransform3DMakeScale(&v20, 1.0, 1.0, 1.0);
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  CATransform3D v19 = v23;
  id v4 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v19];
  CATransform3D v19 = v22;
  uint64_t v5 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v19];
  CATransform3D v19 = v21;
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v19];
  CATransform3D v19 = v20;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v19];
  uint64_t v8 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, v7, 0);

  [v2 setValues:v8];
  v9 = (void *)MEMORY[0x1E4F1C978];
  long long v10 = [NSNumber numberWithFloat:0.0];
  LODWORD(v11) = 0.5;
  long long v12 = [NSNumber numberWithFloat:v11];
  LODWORD(v13) = *(_DWORD *)"fff?";
  uint64_t v14 = [NSNumber numberWithFloat:v13];
  LODWORD(v15) = 1.0;
  double v16 = [NSNumber numberWithFloat:v15];
  double v17 = objc_msgSend(v9, "arrayWithObjects:", v10, v12, v14, v16, 0);

  [v2 setKeyTimes:v17];
  [v2 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v2 setRemovedOnCompletion:0];
  [v2 setDuration:0.2];
  double v18 = [a1 layer];
  [v18 addAnimation:v2 forKey:@"popup"];
}

- (id)debugingBorderColor
{
  id v1 = (void *)MEMORY[0x1E4FB1618];
  id v2 = [a1 layer];
  uint64_t v3 = objc_msgSend(v1, "colorWithCGColor:", objc_msgSend(v2, "borderColor"));

  return v3;
}

- (void)setDebugingBorderColor:()IMAdditions
{
  id v4 = a3;
  uint64_t v5 = [v4 CGColor];
  uint64_t v6 = [a1 layer];
  [v6 setBorderColor:v5];

  if (v4) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  id v8 = [a1 layer];
  [v8 setBorderWidth:v7];
}

- (BOOL)isViewSizeFullScreenInWindow:()IMAdditions ignoreInWindowCheck:
{
  id v6 = a3;
  [a1 bounds];
  double v10 = v9;
  double v12 = v11;
  if (v6)
  {
    double v13 = v7;
    double v14 = v8;
    double v15 = [a1 window];

    if (v15)
    {
      objc_msgSend(a1, "convertRect:toView:", v6, v13, v14, v10, v12);
      objc_msgSend(v6, "convertRect:toWindow:", 0);
      double v10 = v16;
      double v12 = v17;
    }
    double v18 = [v6 screen];
  }
  else
  {
    double v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  CATransform3D v19 = v18;
  [v18 bounds];
  double v21 = v20;
  double v23 = v22;

  BOOL v24 = v12 == v23 && v10 == v21;
  if (v24 || (a4 & 1) != 0)
  {
    if (v24)
    {
      BOOL v26 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    long long v25 = [a1 window];

    if (v25)
    {
      BOOL v26 = 0;
      goto LABEL_18;
    }
  }
  BOOL v26 = v10 == v23 && v12 == v21;
LABEL_18:

  return v26;
}

- (double)adjustRectCenter:()IMAdditions fromView:
{
  id v12 = a7;
  v25.origin.CGFloat x = a2;
  v25.origin.CGFloat y = a3;
  v25.size.CGFloat width = a4;
  v25.size.CGFloat height = a5;
  double MidX = CGRectGetMidX(v25);
  v26.origin.CGFloat x = a2;
  v26.origin.CGFloat y = a3;
  v26.size.CGFloat width = a4;
  v26.size.CGFloat height = a5;
  double MidY = CGRectGetMidY(v26);
  objc_msgSend(a1, "convertPoint:fromView:", v12, MidX, MidY);
  double v16 = v15;
  double v18 = v17;

  CGFloat v19 = a2;
  CGFloat v20 = a3;
  CGFloat v21 = a4;
  CGFloat v22 = a5;

  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v19, v16 - MidX, v18 - MidY);
  return result;
}

- (BOOL)isHorizontallySpecified
{
  id v1 = [a1 traitCollection];
  BOOL v2 = [v1 horizontalSizeClass] != 0;

  return v2;
}

- (BOOL)isHorizontallyCompact
{
  id v1 = [a1 traitCollection];
  BOOL v2 = [v1 horizontalSizeClass] == 1;

  return v2;
}

- (BOOL)isHorizontallyRegular
{
  id v1 = [a1 traitCollection];
  BOOL v2 = [v1 horizontalSizeClass] == 2;

  return v2;
}

- (BOOL)isVerticallySpecified
{
  id v1 = [a1 traitCollection];
  BOOL v2 = [v1 verticalSizeClass] != 0;

  return v2;
}

- (BOOL)isVerticallyCompact
{
  id v1 = [a1 traitCollection];
  BOOL v2 = [v1 verticalSizeClass] == 1;

  return v2;
}

- (BOOL)isVerticallyRegular
{
  id v1 = [a1 traitCollection];
  BOOL v2 = [v1 verticalSizeClass] == 2;

  return v2;
}

@end