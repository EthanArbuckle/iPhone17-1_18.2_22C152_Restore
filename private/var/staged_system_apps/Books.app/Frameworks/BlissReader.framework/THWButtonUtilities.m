@interface THWButtonUtilities
+ (id)navigationArrowImageWithSize:(CGSize)a3 direction:(int)a4 color:(id)a5 highlighted:(BOOL)a6 contentsScale:(double)a7;
@end

@implementation THWButtonUtilities

+ (id)navigationArrowImageWithSize:(CGSize)a3 direction:(int)a4 color:(id)a5 highlighted:(BOOL)a6 contentsScale:(double)a7
{
  BOOL v8 = a6;
  TSDMultiplySizeScalar();
  TSDRectWithSize();
  uint64_t v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v18 = v17;
  v19 = (CGContext *)TSDBitmapContextCreate();
  id v20 = +[TSUImage imageNamed:@"ib_chevron_forward" inBundle:THBundle()];
  [v20 size];
  CGContextSaveGState(v19);
  if (a4 == 4)
  {
    CGContextScaleCTM(v19, -1.0, 1.0);
    CGContextTranslateCTM(v19, -v16, 0.0);
  }
  TSDMultiplySizeScalar();
  TSDRectWithSize();
  TSDCenterRectOverRect();
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  TSDRoundedPointForScale();
  CGFloat v26 = v25;
  uint64_t v36 = v12;
  uint64_t v38 = v18;
  double v28 = v27 + a7;
  CGFloat v29 = v16;
  CGFloat v30 = v14;
  if (v8) {
    double v31 = 0.5;
  }
  else {
    double v31 = 1.0;
  }
  v32 = [v20 CGImageForContentsScale:a7 v36 v38];
  v40.origin.x = v28;
  v40.origin.y = v26;
  v40.size.width = v22;
  v40.size.height = v24;
  CGContextClipToMask(v19, v40, v32);
  CGContextSetBlendMode(v19, kCGBlendModeMultiply);
  CGContextSetFillColorWithColor(v19, (CGColorRef)objc_msgSend(objc_msgSend(a5, "colorWithAlphaComponent:", v31), "CGColor"));
  v41.origin.x = v28;
  v41.origin.y = v26;
  v41.size.width = v22;
  v41.size.height = v24;
  CGContextFillRect(v19, v41);
  CGContextRestoreGState(v19);
  CGContextSetStrokeColorWithColor(v19, (CGColorRef)objc_msgSend(objc_msgSend(a5, "colorWithAlphaComponent:", v31 * 0.4), "CGColor"));
  CGContextSetLineWidth(v19, a7);
  v42.origin.x = v37;
  v42.size.height = v39;
  v42.origin.y = v30;
  v42.size.width = v29;
  CGRect v43 = CGRectInset(v42, a7 * 0.5, a7 * 0.5);
  CGContextStrokeEllipseInRect(v19, v43);
  Image = CGBitmapContextCreateImage(v19);
  v34 = +[TSUImage imageWithCGImage:Image];
  CGImageRelease(Image);
  CGContextRelease(v19);
  return v34;
}

@end