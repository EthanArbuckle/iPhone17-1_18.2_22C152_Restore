@interface PKConnectedCircleView
- (CGRect)_targetViewRectForBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKConnectedCircleView)init;
- (PKConnectedCircleView)initWithFrame:(CGRect)a3;
- (PKConnectedCircleView)initWithSize:(CGSize)a3;
- (PKGradientVerticalConnector)bottomConnector;
- (PKGradientVerticalConnector)topConnector;
- (UIView)targetView;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBottomConnector:(id)a3;
- (void)setTargetView:(id)a3;
- (void)setTopConnector:(id)a3;
@end

@implementation PKConnectedCircleView

- (PKConnectedCircleView)initWithSize:(CGSize)a3
{
  return -[PKConnectedCircleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
}

- (PKConnectedCircleView)init
{
  return -[PKConnectedCircleView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKConnectedCircleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKConnectedCircleView;
  v3 = -[PKConnectedCircleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKConnectedCircleView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)setTargetView:(id)a3
{
  id v8 = a3;
  p_targetView = &self->_targetView;
  char v6 = PKEqualObjects();
  v7 = v8;
  if ((v6 & 1) == 0)
  {
    if (*p_targetView) {
      [(UIView *)*p_targetView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_targetView, a3);
    [(PKConnectedCircleView *)self addSubview:*p_targetView];
    [(PKConnectedCircleView *)self setNeedsLayout];
    [(PKConnectedCircleView *)self setNeedsDisplay];
    v7 = v8;
  }
}

- (void)setTopConnector:(id)a3
{
  v5 = (PKGradientVerticalConnector *)a3;
  if (self->_topConnector != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_topConnector, a3);
    [(PKConnectedCircleView *)self setNeedsLayout];
    [(PKConnectedCircleView *)self setNeedsDisplay];
    v5 = v6;
  }
}

- (void)setBottomConnector:(id)a3
{
  v5 = (PKGradientVerticalConnector *)a3;
  if (self->_bottomConnector != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_bottomConnector, a3);
    [(PKConnectedCircleView *)self setNeedsLayout];
    [(PKConnectedCircleView *)self setNeedsDisplay];
    v5 = v6;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  [(UIView *)self->_targetView sizeThatFits:a3.width];
  if (*(_OWORD *)&self->_topConnector != 0) {
    double v5 = fmax(v5, 2.0);
  }
  double v6 = height;
  result.CGFloat height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKConnectedCircleView;
  [(PKConnectedCircleView *)&v3 layoutSubviews];
  [(PKConnectedCircleView *)self bounds];
  -[PKConnectedCircleView _targetViewRectForBounds:](self, "_targetViewRectForBounds:");
  -[UIView setFrame:](self->_targetView, "setFrame:");
}

- (CGRect)_targetViewRectForBounds:(CGRect)a3
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  targetView = self->_targetView;
  if (targetView)
  {
    -[UIView sizeThatFits:](targetView, "sizeThatFits:", a3.size.width, a3.size.height);
    PKRectCenteredIntegralRect();
    double v4 = v8;
    double v3 = v9;
  }
  else
  {
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v10 = v4;
  double v11 = v3;
  result.size.CGFloat height = v7;
  result.size.width = v6;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  [(PKConnectedCircleView *)self bounds];
  -[PKConnectedCircleView _targetViewRectForBounds:](self, "_targetViewRectForBounds:");
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CurrentContext = UIGraphicsGetCurrentContext();
  if (*(_OWORD *)&self->_topConnector != 0)
  {
    *(_OWORD *)locations = xmmword_1A0444DA0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    topConnector = self->_topConnector;
    if (topConnector)
    {
      uint64_t v19 = [(PKGradientVerticalConnector *)topConnector topGradientColor];
      if (v19)
      {
        v20 = (void *)v19;
        v21 = [(PKGradientVerticalConnector *)self->_topConnector bottomGradientColor];

        if (v21)
        {
          id v22 = [(PKGradientVerticalConnector *)self->_topConnector topGradientColor];
          v66[0] = [v22 CGColor];
          id v23 = [(PKGradientVerticalConnector *)self->_topConnector bottomGradientColor];
          v66[1] = [v23 CGColor];
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];

          CFArrayRef v25 = (const __CFArray *)[v24 copy];
          v26 = CGGradientCreateWithColors(DeviceRGB, v25, locations);

          CGContextSaveGState(CurrentContext);
          double v61 = v11;
          double v62 = v9;
          double v59 = v15;
          double v60 = v13;
          if (self->_targetView)
          {
            v73.origin.CGFloat x = x;
            v73.origin.CGFloat y = y;
            v73.size.CGFloat width = width;
            v73.size.CGFloat height = height;
            CGRectGetHeight(v73);
          }
          else
          {
            v74.origin.CGFloat x = v9;
            v74.origin.CGFloat y = v11;
            v74.size.CGFloat width = v13;
            v74.size.CGFloat height = v15;
            CGRectGetMinY(v74);
            v75.origin.CGFloat x = x;
            v75.origin.CGFloat y = y;
            v75.size.CGFloat width = width;
            v75.size.CGFloat height = height;
            CGRectGetMinY(v75);
          }
          PKContentAlignmentMake();
          CGFloat v27 = height;
          PKSizeAlignedInRect();
          CGFloat v28 = v76.origin.x;
          CGFloat v29 = v76.origin.y;
          CGFloat v30 = v76.size.width;
          CGFloat v31 = v76.size.height;
          CGFloat MidX = CGRectGetMidX(v76);
          v77.origin.CGFloat x = v28;
          v77.origin.CGFloat y = v29;
          v77.size.CGFloat width = v30;
          v77.size.CGFloat height = v31;
          double v64 = v27;
          CGFloat MinY = CGRectGetMinY(v77);
          v78.origin.CGFloat x = v28;
          v78.origin.CGFloat y = v29;
          v78.size.CGFloat width = v30;
          v78.size.CGFloat height = v31;
          double v63 = width;
          CGFloat v32 = CGRectGetMidX(v78);
          v79.origin.CGFloat x = v28;
          v79.origin.CGFloat y = v29;
          v79.size.CGFloat width = v30;
          v79.size.CGFloat height = v31;
          double v33 = x;
          double v34 = y;
          CGFloat MaxY = CGRectGetMaxY(v79);
          v80.origin.CGFloat x = v28;
          v80.origin.CGFloat y = v29;
          v80.size.CGFloat width = v30;
          v80.size.CGFloat height = v31;
          CGContextAddRect(CurrentContext, v80);
          CGContextClip(CurrentContext);
          v69.CGFloat y = MinY;
          v69.CGFloat x = MidX;
          v71.CGFloat x = v32;
          CGFloat width = v63;
          CGFloat height = v64;
          v71.CGFloat y = MaxY;
          CGFloat y = v34;
          CGFloat x = v33;
          CGContextDrawLinearGradient(CurrentContext, v26, v69, v71, 0);
          CGContextRestoreGState(CurrentContext);
          CGGradientRelease(v26);

          CGFloat v11 = v61;
          CGFloat v9 = v62;
          CGFloat v15 = v59;
          CGFloat v13 = v60;
        }
      }
    }
    bottomConnector = self->_bottomConnector;
    if (bottomConnector)
    {
      uint64_t v37 = [(PKGradientVerticalConnector *)bottomConnector topGradientColor];
      if (v37)
      {
        v38 = (void *)v37;
        v39 = [(PKGradientVerticalConnector *)self->_bottomConnector bottomGradientColor];

        if (v39)
        {
          id v40 = [(PKGradientVerticalConnector *)self->_bottomConnector topGradientColor];
          v65[0] = [v40 CGColor];
          id v41 = [(PKGradientVerticalConnector *)self->_bottomConnector bottomGradientColor];
          v65[1] = [v41 CGColor];
          v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];

          CFArrayRef v43 = (const __CFArray *)[v42 copy];
          v44 = CGGradientCreateWithColors(DeviceRGB, v43, locations);

          CGContextSaveGState(CurrentContext);
          CGFloat v45 = x;
          CGFloat v46 = y;
          CGFloat v47 = width;
          CGFloat v48 = height;
          if (self->_targetView)
          {
            CGRectGetHeight(*(CGRect *)&v45);
          }
          else
          {
            CGRectGetMaxY(*(CGRect *)&v45);
            v81.size.CGFloat height = v15;
            v81.origin.CGFloat x = v9;
            v81.origin.CGFloat y = v11;
            v81.size.CGFloat width = v13;
            CGRectGetMaxY(v81);
          }
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          CGFloat v49 = v82.origin.x;
          CGFloat v50 = v82.origin.y;
          CGFloat v51 = v82.size.width;
          CGFloat v52 = v82.size.height;
          CGFloat v53 = CGRectGetMidX(v82);
          v83.origin.CGFloat x = v49;
          v83.origin.CGFloat y = v50;
          v83.size.CGFloat width = v51;
          v83.size.CGFloat height = v52;
          CGFloat v54 = CGRectGetMinY(v83);
          v84.origin.CGFloat x = v49;
          v84.origin.CGFloat y = v50;
          v84.size.CGFloat width = v51;
          v84.size.CGFloat height = v52;
          CGFloat v55 = CGRectGetMidX(v84);
          v85.origin.CGFloat x = v49;
          v85.origin.CGFloat y = v50;
          v85.size.CGFloat width = v51;
          v85.size.CGFloat height = v52;
          CGFloat v56 = CGRectGetMaxY(v85);
          v86.origin.CGFloat x = v49;
          v86.origin.CGFloat y = v50;
          v86.size.CGFloat width = v51;
          v86.size.CGFloat height = v52;
          CGContextAddRect(CurrentContext, v86);
          CGContextClip(CurrentContext);
          v70.CGFloat x = v53;
          v70.CGFloat y = v54;
          v72.CGFloat x = v55;
          v72.CGFloat y = v56;
          CGContextDrawLinearGradient(CurrentContext, v44, v70, v72, 0);
          CGContextRestoreGState(CurrentContext);
          CGGradientRelease(v44);
        }
      }
    }
    CGColorSpaceRelease(DeviceRGB);
  }
}

- (PKGradientVerticalConnector)topConnector
{
  return self->_topConnector;
}

- (PKGradientVerticalConnector)bottomConnector
{
  return self->_bottomConnector;
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_bottomConnector, 0);

  objc_storeStrong((id *)&self->_topConnector, 0);
}

@end