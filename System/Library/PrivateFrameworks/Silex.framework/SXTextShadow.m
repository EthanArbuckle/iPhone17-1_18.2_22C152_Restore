@interface SXTextShadow
- (id)TSDShadow;
@end

@implementation SXTextShadow

- (id)TSDShadow
{
  [(SXTextShadow *)self offset];
  long double v4 = v3;
  [(SXTextShadow *)self offset];
  long double v6 = atan2(v4, v5) * 57.2957795;
  [(SXTextShadow *)self offset];
  double v8 = v7 * v7;
  [(SXTextShadow *)self offset];
  double v10 = sqrt(v8 + v9 * v9);
  v11 = (void *)MEMORY[0x263F7C6E0];
  [(SXTextShadow *)self radius];
  double v13 = v12;
  [(SXTextShadow *)self opacity];
  double v15 = v14;
  id v16 = [(SXTextShadow *)self color];
  v17 = objc_msgSend(v11, "shadowWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend(v16, "CGColor"), 1, (double)v6, v10, v13, v15);

  return v17;
}

@end