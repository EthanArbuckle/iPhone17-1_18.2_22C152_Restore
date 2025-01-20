@interface _UIStretchableShadow
+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4;
+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4 isContinuousCorner:(BOOL)a5 white:(double)a6;
+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4 white:(double)a5;
+ (id)_generateShadowWithRadius:(double)a3 cornerRadius:(double)a4 isContinuousCorner:(BOOL)a5 color:(id)a6;
@end

@implementation _UIStretchableShadow

+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4
{
  return (CGImage *)[a1 shadowWithRadius:0 cornerRadius:a3 isContinuousCorner:a4 white:0.0];
}

+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4 white:(double)a5
{
  return (CGImage *)[a1 shadowWithRadius:0 cornerRadius:a3 isContinuousCorner:a4 white:a5];
}

+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4 isContinuousCorner:(BOOL)a5 white:(double)a6
{
  BOOL v7 = a5;
  if (_MergedGlobals_956 != -1) {
    dispatch_once(&_MergedGlobals_956, &__block_literal_global_45);
  }
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%f-%f-%f", *(void *)&a3, *(void *)&a4, *(void *)&a6);
  v12 = [(id)qword_1EB25F108 objectForKey:v11];
  if (!v12)
  {
    v13 = +[UIColor colorWithWhite:a6 alpha:1.0];
    v14 = [a1 _generateShadowWithRadius:v7 cornerRadius:v13 isContinuousCorner:a3 color:a4];

    id v15 = v14;
    v12 = [v15 CGImage];
    [(id)qword_1EB25F108 setObject:v12 forKey:v11];
  }
  return (CGImage *)v12;
}

+ (id)_generateShadowWithRadius:(double)a3 cornerRadius:(double)a4 isContinuousCorner:(BOOL)a5 color:(id)a6
{
  double v8 = a3 + a3;
  double v9 = a3 + a3 + a4 + a3 + a3 + a4;
  double v11 = a3 + a3 + v9;
  v12 = (CGColor *)[a6 CGColor];
  _UIGraphicsBeginImageContextWithOptions(0, 0, v8 + v8 + v9, v8 + v8 + v9, 1.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v14 = 0;
  }
  else {
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  double v10 = v8 + v8 + v9;
  double v15 = (v10 - v9) * 0.5;
  v21.width = 0.0;
  v21.height = v11;
  CGContextSetShadowWithColor(v14, v21, v8, v12);
  CGContextSetFillColorWithColor(v14, v12);
  if (a4 <= 0.0)
  {
    v22.origin.x = (v10 - v9) * 0.5;
    v22.origin.y = -v9;
    v22.size.width = v9;
    v22.size.height = v9;
    CGContextFillRect(v14, v22);
  }
  else
  {
    double v16 = -v9;
    if (a5) {
      +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, v15, v16, v9, v9, a4, a4);
    }
    else {
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v15, v16, v9, v9, a4);
    }
    id v17 = objc_claimAutoreleasedReturnValue();
    CGContextAddPath(v14, (CGPathRef)[v17 CGPath]);
    CGContextFillPath(v14);
  }
  v18 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  return v18;
}

@end