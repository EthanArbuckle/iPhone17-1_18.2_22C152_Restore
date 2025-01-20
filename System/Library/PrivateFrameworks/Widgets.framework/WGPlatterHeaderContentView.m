@interface WGPlatterHeaderContentView
- (CGAffineTransform)utilityButtonTransform;
- (WGPlatterHeaderContentView)init;
- (void)_layoutUtilityButtonWithScale:(double)a3;
- (void)setUtilityButtonTransform:(CGAffineTransform *)a3;
@end

@implementation WGPlatterHeaderContentView

- (WGPlatterHeaderContentView)init
{
  v5.receiver = self;
  v5.super_class = (Class)WGPlatterHeaderContentView;
  result = [(PLPlatterHeaderContentView *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x263F000D0];
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&result->_utilityButtonTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&result->_utilityButtonTransform.c = v4;
    *(_OWORD *)&result->_utilityButtonTransform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (void)setUtilityButtonTransform:(CGAffineTransform *)a3
{
  p_utilityButtonTransform = &self->_utilityButtonTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_utilityButtonTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_utilityButtonTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_utilityButtonTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_utilityButtonTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_utilityButtonTransform->tx = v9;
    *(_OWORD *)&p_utilityButtonTransform->a = v8;
    [(WGPlatterHeaderContentView *)self setNeedsLayout];
    [(WGPlatterHeaderContentView *)self layoutIfNeeded];
  }
}

- (void)_layoutUtilityButtonWithScale:(double)a3
{
  v24.receiver = self;
  v24.super_class = (Class)WGPlatterHeaderContentView;
  [(PLPlatterHeaderContentView *)&v24 _layoutUtilityButtonWithScale:a3];
  long long v4 = [(PLPlatterHeaderContentView *)self utilityView];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PLPlatterHeaderContentView *)self utilityButton];
  }
  long long v7 = v6;

  [v7 frame];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  double MidX = CGRectGetMidX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  objc_msgSend(v7, "setCenter:", MidX, CGRectGetMidY(v26));
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, width, height);
  p_utilityButtonTransform = &self->_utilityButtonTransform;
  long long v14 = *(_OWORD *)&p_utilityButtonTransform->c;
  *(_OWORD *)&v23.a = *(_OWORD *)&p_utilityButtonTransform->a;
  *(_OWORD *)&v23.c = v14;
  *(_OWORD *)&v23.tCGFloat x = *(_OWORD *)&p_utilityButtonTransform->tx;
  [v7 setTransform:&v23];
  [v7 frame];
  double v16 = v15;
  double v18 = v17;
  UIRectIntegralWithScale();
  long long v21 = *(_OWORD *)&p_utilityButtonTransform->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&p_utilityButtonTransform->a;
  *(_OWORD *)&v22.c = v21;
  *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)&p_utilityButtonTransform->tx;
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformTranslate(&v23, &v22, v19 - v16, v20 - v18);
  CGAffineTransform v22 = v23;
  [v7 setTransform:&v22];
}

- (CGAffineTransform)utilityButtonTransform
{
  long long v3 = *(_OWORD *)&self[11].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[11].tx;
  return self;
}

@end