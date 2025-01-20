@interface SBFStatusBarLegibilityView
+ (id)gradientViewWithOpacities:(const double *)a3 locations:(id)a4;
+ (id)statusBarGradientView;
- (BOOL)forceLegibilityGradientHidden;
- (UIImageView)leftCornerView;
- (UIImageView)rightCornerView;
- (UIView)statusBarGradientView;
- (_UILegibilitySettings)legibilitySettings;
- (double)strength;
- (void)_configureAsPad;
- (void)_configureAsPhone;
- (void)_configureWithLegibilitySettings:(id)a3 forceLegibilityGradientHidden:(BOOL)a4;
- (void)layoutSubviews;
- (void)setForceLegibilityGradientHidden:(BOOL)a3;
- (void)setLeftCornerView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setRightCornerView:(id)a3;
- (void)setStatusBarGradientView:(id)a3;
@end

@implementation SBFStatusBarLegibilityView

- (double)strength
{
  return 1.0;
}

- (void)setForceLegibilityGradientHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ((BSEqualBools() & 1) == 0)
  {
    self->_forceLegibilityGradientHidden = v3;
    legibilitySettings = self->_legibilitySettings;
    [(SBFStatusBarLegibilityView *)self _configureWithLegibilitySettings:legibilitySettings forceLegibilityGradientHidden:v3];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBFStatusBarLegibilityView *)self _configureWithLegibilitySettings:v5 forceLegibilityGradientHidden:self->_forceLegibilityGradientHidden];
  }
}

- (void)_configureWithLegibilitySettings:(id)a3 forceLegibilityGradientHidden:(BOOL)a4
{
  uint64_t v7 = [a3 style];
  if (!a3 || v7 == 2 || a4)
  {
    v9 = [(SBFStatusBarLegibilityView *)self statusBarGradientView];
    [v9 removeFromSuperview];

    [(SBFStatusBarLegibilityView *)self setStatusBarGradientView:0];
    v10 = [(SBFStatusBarLegibilityView *)self leftCornerView];
    [v10 removeFromSuperview];

    [(SBFStatusBarLegibilityView *)self setLeftCornerView:0];
    v11 = [(SBFStatusBarLegibilityView *)self rightCornerView];
    [v11 removeFromSuperview];

    [(SBFStatusBarLegibilityView *)self setRightCornerView:0];
  }
  else
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_6;
      }
    }
    else
    {
      v12 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      if (v13 != 1)
      {
LABEL_6:
        v8 = [(SBFStatusBarLegibilityView *)self statusBarGradientView];

        if (!v8)
        {
          [(SBFStatusBarLegibilityView *)self _configureAsPhone];
        }
        return;
      }
    }
    v14 = [(SBFStatusBarLegibilityView *)self leftCornerView];
    if (v14)
    {
    }
    else
    {
      v15 = [(SBFStatusBarLegibilityView *)self rightCornerView];

      if (!v15)
      {
        [(SBFStatusBarLegibilityView *)self _configureAsPad];
      }
    }
  }
}

+ (id)gradientViewWithOpacities:(const double *)a3 locations:(id)a4
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_alloc_init(SBStatusBarLegibilityGradientView);
  uint64_t v7 = [(SBStatusBarLegibilityGradientView *)v6 layer];
  CFIndex v8 = [v5 count];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8, MEMORY[0x1E4F1D510]);
  for (i = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]); v8; --v8)
  {
    components[0] = 0.0;
    components[1] = *a3;
    CGColorRef v11 = CGColorCreate(i, components);
    if (v11)
    {
      CGColorRef v12 = v11;
      CFArrayAppendValue(Mutable, v11);
      CFRelease(v12);
    }
    ++a3;
  }
  [v7 setColors:Mutable];
  CFRelease(Mutable);
  CGColorSpaceRelease(i);
  [v7 setLocations:v5];
  objc_msgSend(v7, "setStartPoint:", 0.5, 1.0);
  objc_msgSend(v7, "setEndPoint:", 0.5, 0.0);
  uint64_t v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A078]];
  v14 = [(SBStatusBarLegibilityGradientView *)v6 layer];
  [v14 setCompositingFilter:v13];

  return v6;
}

+ (id)statusBarGradientView
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4[12] = xmmword_18B5E42B0;
  v4[13] = unk_18B5E42C0;
  v4[14] = xmmword_18B5E42D0;
  uint64_t v5 = 0x3FA999999999999ALL;
  v4[8] = xmmword_18B5E4270;
  v4[9] = unk_18B5E4280;
  v4[10] = xmmword_18B5E4290;
  v4[11] = unk_18B5E42A0;
  v4[4] = xmmword_18B5E4230;
  v4[5] = unk_18B5E4240;
  v4[6] = xmmword_18B5E4250;
  v4[7] = unk_18B5E4260;
  v4[0] = xmmword_18B5E41F0;
  v4[1] = unk_18B5E4200;
  v4[2] = xmmword_18B5E4210;
  v4[3] = unk_18B5E4220;
  v2 = [a1 gradientViewWithOpacities:v4 locations:&unk_1ED89EAA0];
  return v2;
}

- (void)_configureAsPhone
{
  BOOL v3 = [(SBFStatusBarLegibilityView *)self layer];
  [v3 setAllowsGroupBlending:0];

  id v4 = [(id)objc_opt_class() statusBarGradientView];
  [(SBFStatusBarLegibilityView *)self addSubview:v4];
  [(SBFStatusBarLegibilityView *)self setStatusBarGradientView:v4];
}

- (void)_configureAsPad
{
  id v10 = [MEMORY[0x1E4F42A80] imageNamed:@"StatusBarLegibilityShadow"];
  BOOL v3 = [v10 imageWithHorizontallyFlippedOrientation];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v10];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v3];
  uint64_t v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A078]];
  uint64_t v7 = [v4 layer];
  [v7 setCompositingFilter:v6];

  CFIndex v8 = [v5 layer];
  [v8 setCompositingFilter:v6];

  v9 = [(SBFStatusBarLegibilityView *)self layer];
  [v9 setAllowsGroupBlending:0];

  [(SBFStatusBarLegibilityView *)self addSubview:v4];
  [(SBFStatusBarLegibilityView *)self addSubview:v5];
  [(SBFStatusBarLegibilityView *)self setLeftCornerView:v4];
  [(SBFStatusBarLegibilityView *)self setRightCornerView:v5];
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)SBFStatusBarLegibilityView;
  [(SBFStatusBarLegibilityView *)&v32 layoutSubviews];
  [(SBFStatusBarLegibilityView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGColorRef v11 = [(SBFStatusBarLegibilityView *)self statusBarGradientView];
  if (v11)
  {
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    CGRectDivide(v33, &slice, &remainder, 100.0, CGRectMinYEdge);
    objc_msgSend(v11, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGColorRef v12 = [(SBFStatusBarLegibilityView *)self leftCornerView];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 frame];
    objc_msgSend(v13, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  v14 = [(SBFStatusBarLegibilityView *)self rightCornerView];
  v15 = v14;
  if (v14)
  {
    [v14 frame];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    CGFloat rect = v10;
    CGFloat v24 = v8;
    CGFloat v25 = v6;
    CGFloat v26 = v4;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v17;
    v35.origin.y = v19;
    v35.size.width = v21;
    v35.size.height = v23;
    double v28 = MaxX - CGRectGetWidth(v35);
    v36.origin.x = v26;
    v36.origin.y = v25;
    v36.size.width = v24;
    v36.size.height = rect;
    objc_msgSend(v15, "setFrame:", v28, CGRectGetMinY(v36), v21, v23);
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)forceLegibilityGradientHidden
{
  return self->_forceLegibilityGradientHidden;
}

- (UIView)statusBarGradientView
{
  return self->_statusBarGradientView;
}

- (void)setStatusBarGradientView:(id)a3
{
}

- (UIImageView)leftCornerView
{
  return self->_leftCornerView;
}

- (void)setLeftCornerView:(id)a3
{
}

- (UIImageView)rightCornerView
{
  return self->_rightCornerView;
}

- (void)setRightCornerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightCornerView, 0);
  objc_storeStrong((id *)&self->_leftCornerView, 0);
  objc_storeStrong((id *)&self->_statusBarGradientView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end