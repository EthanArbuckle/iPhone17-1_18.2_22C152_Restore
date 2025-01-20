@interface MFTransform
- (BOOL)isUpsideDown;
- (CGAffineTransform)getTransformMatrix;
- (CGAffineTransform)getWorldMatrix;
- (CGPoint)DPtoLP:(CGPoint)a3;
- (CGPoint)LPtoDP:(CGPoint)a3;
- (CGPoint)getViewportExtent;
- (CGPoint)getViewportOrg;
- (CGPoint)getWindowExtent;
- (CGPoint)getWindowOrg;
- (MFTransform)initWithDriver:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)getMapMode;
- (int)modifyWorldTransform:(const CGAffineTransform *)a3 in_command:(int)a4;
- (int)offsetViewportOrg:(int)a3 in_y:(int)a4;
- (int)offsetWindowOrg:(int)a3 in_y:(int)a4;
- (int)scaleViewportExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6;
- (int)scaleWindowExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6;
- (int)setMapMode:(int)a3;
- (int)setViewportExt:(int)a3 in_y:(int)a4;
- (int)setViewportOrg:(int)a3 in_y:(int)a4;
- (int)setWindowExt:(int)a3 in_y:(int)a4;
- (int)setWindowOrg:(int)a3 in_y:(int)a4;
- (int)setWorldTransform:(const CGAffineTransform *)a3;
- (int)updateTransform;
- (void)setTransformMatrix:(CGAffineTransform *)a3;
- (void)setViewportExt:(CGPoint)a3;
- (void)setViewportOrg:(CGPoint)a3;
- (void)setWindowExt:(CGPoint)a3;
- (void)setWindowOrg:(CGPoint)a3;
- (void)setWorldMatrix:(CGAffineTransform *)a3;
@end

@implementation MFTransform

- (MFTransform)initWithDriver:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MFTransform;
  v6 = [(MFTransform *)&v18 init];
  v7 = (MFTransform *)v6;
  if (v6)
  {
    v8 = (_OWORD *)MEMORY[0x263F000D0];
    long long v9 = *MEMORY[0x263F000D0];
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)(v6 + 40) = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)(v6 + 24) = v10;
    *(_OWORD *)(v6 + 8) = v9;
    *((void *)v6 + 7) = 0;
    *((void *)v6 + 8) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v6 + 72) = _Q0;
    *((void *)v6 + 11) = 0;
    *((void *)v6 + 12) = 0;
    *(_OWORD *)(v6 + 104) = _Q0;
    long long v16 = v8[1];
    *(_OWORD *)(v6 + 120) = *v8;
    *(_OWORD *)(v6 + 136) = v16;
    *(_OWORD *)(v6 + 152) = v8[2];
    *((_DWORD *)v6 + 42) = 1;
    objc_storeStrong((id *)v6 + 22, a3);
  }

  return v7;
}

- (int)setMapMode:(int)a3
{
  self->m_mapMode = a3;
  if ((a3 - 7) >= 2)
  {
    if (a3 == 1)
    {
      __asm { FMOV            V0.2D, #1.0 }
      self->m_windowExt = _Q0;
      double v8 = 1.0;
LABEL_6:
      self->m_viewportExt.x = v8;
      self->m_viewportExt.y = v8;
      return [(MFTransform *)self updateTransform];
    }
    if ((a3 - 2) <= 4)
    {
      self->m_windowExt = (CGPoint)xmmword_238EDE5F0;
      double v8 = -[MFTransform setMapMode:]::metricSize[a3 - 2] * 72.0;
      goto LABEL_6;
    }
  }
  return 0;
}

- (int)updateTransform
{
  long long v3 = *(_OWORD *)&self->m_world.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->m_world.a;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->m_world.tx;
  t2.b = 0.0;
  t2.c = 0.0;
  float64x2_t v4 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64((float64x2_t)self->m_viewportExt, (float64x2_t)self->m_windowExt)));
  float64x2_t v5 = vmlsq_f64((float64x2_t)self->m_viewportOrg, v4, (float64x2_t)self->m_windowOrg);
  t2.d = v4.f64[1];
  t2.a = v4.f64[0];
  *(float64x2_t *)&t2.tx = v5;
  CGAffineTransformConcat(&v13, &t1, &t2);
  long long v6 = *(_OWORD *)&v13.c;
  *(_OWORD *)&self->m_combinedTransform.a = *(_OWORD *)&v13.a;
  *(_OWORD *)&self->m_combinedTransform.c = v6;
  *(_OWORD *)&self->m_combinedTransform.tx = *(_OWORD *)&v13.tx;
  m_deviceDriver = self->m_deviceDriver;
  long long v8 = *(_OWORD *)&self->m_combinedTransform.c;
  v10[0] = *(_OWORD *)&self->m_combinedTransform.a;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&self->m_combinedTransform.tx;
  return [(MFDeviceDriver *)m_deviceDriver activateTransform:v10];
}

- (id)copyWithZone:(_NSZone *)a3
{
  float64x2_t v4 = [+[MFTransform allocWithZone:a3] initWithDriver:self->m_deviceDriver];
  [(MFTransform *)self getWorldMatrix];
  [(MFTransform *)v4 setWorldMatrix:v7];
  [(MFTransform *)self getWindowOrg];
  -[MFTransform setWindowOrg:](v4, "setWindowOrg:");
  [(MFTransform *)self getWindowExtent];
  -[MFTransform setWindowExt:](v4, "setWindowExt:");
  [(MFTransform *)self getViewportOrg];
  -[MFTransform setViewportOrg:](v4, "setViewportOrg:");
  [(MFTransform *)self getViewportExtent];
  -[MFTransform setViewportExt:](v4, "setViewportExt:");
  [(MFTransform *)self getTransformMatrix];
  [(MFTransform *)v4 setTransformMatrix:&v6];
  [(MFTransform *)v4 setMapMode:[(MFTransform *)self getMapMode]];
  return v4;
}

- (CGAffineTransform)getWorldMatrix
{
  long long v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self->ty;
  return self;
}

- (void)setWorldMatrix:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_world.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_world.c = v4;
  *(_OWORD *)&self->m_world.a = v3;
}

- (CGPoint)getWindowOrg
{
  double x = self->m_windowOrg.x;
  double y = self->m_windowOrg.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setWindowOrg:(CGPoint)a3
{
  self->m_windowOrg = a3;
}

- (CGPoint)getWindowExtent
{
  double x = self->m_windowExt.x;
  double y = self->m_windowExt.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setWindowExt:(CGPoint)a3
{
  self->m_windowExt = a3;
}

- (CGPoint)getViewportOrg
{
  double x = self->m_viewportOrg.x;
  double y = self->m_viewportOrg.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setViewportOrg:(CGPoint)a3
{
  self->m_viewportOrg = a3;
}

- (CGPoint)getViewportExtent
{
  double x = self->m_viewportExt.x;
  double y = self->m_viewportExt.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setViewportExt:(CGPoint)a3
{
  self->m_viewportExt = a3;
}

- (CGAffineTransform)getTransformMatrix
{
  long long v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].b;
  return self;
}

- (void)setTransformMatrix:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_combinedTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_combinedTransform.c = v4;
  *(_OWORD *)&self->m_combinedTransform.a = v3;
}

- (int)getMapMode
{
  return self->m_mapMode;
}

- (int)setWorldTransform:(const CGAffineTransform *)a3
{
  if (fabs(a3->a * a3->d - a3->b * a3->c) < 1.00000001e-10) {
    return -1;
  }
  long long v4 = *(_OWORD *)&a3->a;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_world.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_world.c = v5;
  *(_OWORD *)&self->m_world.a = v4;
  return [(MFTransform *)self updateTransform];
}

- (int)modifyWorldTransform:(const CGAffineTransform *)a3 in_command:(int)a4
{
  if (a4 == 3)
  {
    if (fabs(a3->a * a3->d - a3->b * a3->c) >= 1.00000001e-10)
    {
      long long v12 = *(_OWORD *)&self->m_world.c;
      *(_OWORD *)&t1.a = *(_OWORD *)&self->m_world.a;
      *(_OWORD *)&t1.c = v12;
      *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->m_world.tx;
      long long v13 = *(_OWORD *)&a3->c;
      long long v15 = *(_OWORD *)&a3->a;
      long long v16 = v13;
      long long v17 = *(_OWORD *)&a3->tx;
      p_CGAffineTransform t1 = &t1;
      long long v10 = (CGAffineTransform *)&v15;
      goto LABEL_10;
    }
    return -1;
  }
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      long long v5 = *MEMORY[0x263F000D0];
      long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&self->m_world.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      *(_OWORD *)&self->m_world.c = v6;
      *(_OWORD *)&self->m_world.a = v5;
    }
    return [(MFTransform *)self updateTransform];
  }
  if (fabs(a3->a * a3->d - a3->b * a3->c) < 1.00000001e-10) {
    return -1;
  }
  long long v7 = *(_OWORD *)&a3->c;
  long long v22 = *(_OWORD *)&a3->a;
  long long v23 = v7;
  long long v24 = *(_OWORD *)&a3->tx;
  long long v8 = *(_OWORD *)&self->m_world.c;
  long long v19 = *(_OWORD *)&self->m_world.a;
  long long v20 = v8;
  long long v21 = *(_OWORD *)&self->m_world.tx;
  p_CGAffineTransform t1 = (CGAffineTransform *)&v22;
  long long v10 = (CGAffineTransform *)&v19;
LABEL_10:
  CGAffineTransformConcat(&v25, p_t1, v10);
  long long v14 = *(_OWORD *)&v25.c;
  *(_OWORD *)&self->m_world.a = *(_OWORD *)&v25.a;
  *(_OWORD *)&self->m_world.c = v14;
  *(_OWORD *)&self->m_world.tdouble x = *(_OWORD *)&v25.tx;
  return [(MFTransform *)self updateTransform];
}

- (BOOL)isUpsideDown
{
  return self->m_combinedTransform.d < 0.0;
}

- (int)setWindowExt:(int)a3 in_y:(int)a4
{
  int v4 = -1;
  if (a3 && a4)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      self->m_windowExt.double x = (double)a3;
      self->m_windowExt.double y = (double)a4;
      return [(MFTransform *)self updateTransform];
    }
    return 0;
  }
  return v4;
}

- (int)setViewportExt:(int)a3 in_y:(int)a4
{
  int v4 = -1;
  if (a3 && a4)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      self->m_viewportExt.double x = (double)a3;
      self->m_viewportExt.double y = (double)a4;
      return [(MFTransform *)self updateTransform];
    }
    return 0;
  }
  return v4;
}

- (int)scaleWindowExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  int v6 = -1;
  if (a3 && a4 && a5 && a6)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      CGFloat v7 = self->m_windowExt.y * (double)a5 / (double)a6;
      self->m_windowExt.double x = self->m_windowExt.x * (double)a3 / (double)a4;
      self->m_windowExt.double y = v7;
      return [(MFTransform *)self updateTransform];
    }
    return 0;
  }
  return v6;
}

- (int)scaleViewportExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  int v6 = -1;
  if (a3 && a4 && a5 && a6)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      CGFloat v7 = self->m_viewportExt.y * (double)a5 / (double)a6;
      self->m_viewportExt.double x = self->m_viewportExt.x * (double)a3 / (double)a4;
      self->m_viewportExt.double y = v7;
      return [(MFTransform *)self updateTransform];
    }
    return 0;
  }
  return v6;
}

- (int)setWindowOrg:(int)a3 in_y:(int)a4
{
  self->m_windowOrg.double x = (double)a3;
  self->m_windowOrg.double y = (double)a4;
  return [(MFTransform *)self updateTransform];
}

- (int)setViewportOrg:(int)a3 in_y:(int)a4
{
  self->m_viewportOrg.double x = (double)a3;
  self->m_viewportOrg.double y = (double)a4;
  return [(MFTransform *)self updateTransform];
}

- (int)offsetWindowOrg:(int)a3 in_y:(int)a4
{
  CGFloat v4 = self->m_windowOrg.y + (double)a4;
  self->m_windowOrg.double x = self->m_windowOrg.x + (double)a3;
  self->m_windowOrg.double y = v4;
  return [(MFTransform *)self updateTransform];
}

- (int)offsetViewportOrg:(int)a3 in_y:(int)a4
{
  CGFloat v4 = self->m_viewportOrg.y + (double)a4;
  self->m_viewportOrg.double x = self->m_viewportOrg.x + (double)a3;
  self->m_viewportOrg.double y = v4;
  return [(MFTransform *)self updateTransform];
}

- (CGPoint)DPtoLP:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  memset(&v9, 0, sizeof(v9));
  long long v3 = *(_OWORD *)&self->m_combinedTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->m_combinedTransform.a;
  *(_OWORD *)&v8.c = v3;
  *(_OWORD *)&v8.tdouble x = *(_OWORD *)&self->m_combinedTransform.tx;
  CGAffineTransformInvert(&v9, &v8);
  float64x2_t v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  double v5 = v4.f64[1];
  result.double x = v4.f64[0];
  result.double y = v5;
  return result;
}

- (CGPoint)LPtoDP:(CGPoint)a3
{
  float64x2_t v3 = vaddq_f64(*(float64x2_t *)&self->m_combinedTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->m_combinedTransform.c, a3.y), *(float64x2_t *)&self->m_combinedTransform.a, a3.x));
  double v4 = v3.f64[1];
  result.double x = v3.f64[0];
  result.double y = v4;
  return result;
}

- (void).cxx_destruct
{
}

@end