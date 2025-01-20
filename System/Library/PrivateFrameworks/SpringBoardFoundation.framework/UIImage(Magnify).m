@interface UIImage(Magnify)
- (id)sbf_resizedImageForCurrentMagnifyMode;
@end

@implementation UIImage(Magnify)

- (id)sbf_resizedImageForCurrentMagnifyMode
{
  v2 = +[SBFMagnifyMode currentMagnifyMode];
  [v2 zoomFactor];
  *(float *)&double v3 = fabsf(*(float *)&v3 + -1.0);
  if (v2) {
    BOOL v4 = *(float *)&v3 < 2.2204e-16;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    id v11 = a1;
  }
  else
  {
    objc_msgSend(v2, "zoomFactor", v3);
    CGFloat v6 = 1.0 / v5;
    [a1 size];
    double v8 = v7;
    double v10 = v9;
    CGAffineTransformMakeScale(&v14, v6, v6);
    objc_msgSend(a1, "sbf_resizeImageToSize:", v10 * v14.c + v14.a * v8, v10 * v14.d + v14.b * v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

@end