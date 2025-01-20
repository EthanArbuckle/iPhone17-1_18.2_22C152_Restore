@interface CarMultiButtonView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (CarMultiButtonStackView)stackView;
- (CarMultiButtonView)initWithFrame:(CGRect)a3;
- (NSArray)buttons;
- (UIView)shadowView;
- (double)_buttonSpacing;
- (void)_recalculateShadowAttributes;
- (void)didMoveToWindow;
- (void)setButtons:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setStackView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarMultiButtonView

- (CarMultiButtonView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CarMultiButtonView;
  v3 = -[CarMultiButtonView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    shadowView = v3->_shadowView;
    v3->_shadowView = v4;

    [(UIView *)v3->_shadowView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarMultiButtonView *)v3 addSubview:v3->_shadowView];
    v6 = objc_alloc_init(CarMultiButtonStackView);
    stackView = v3->_stackView;
    v3->_stackView = v6;

    [(CarMultiButtonStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarMultiButtonStackView *)v3->_stackView setClipsToBounds:0];
    [(CarMultiButtonStackView *)v3->_stackView setAxis:1];
    [(CarMultiButtonStackView *)v3->_stackView setAlignment:3];
    [(CarMultiButtonView *)v3 _buttonSpacing];
    -[CarMultiButtonStackView setSpacing:](v3->_stackView, "setSpacing:");
    [(CarMultiButtonStackView *)v3->_stackView setDistribution:1];
    [(UIView *)v3->_shadowView addSubview:v3->_stackView];
    v8 = [(UIView *)v3->_shadowView _maps_constraintsForCenteringInView:v3];
    v9 = [(CarMultiButtonStackView *)v3->_stackView _maps_constraintsForCenteringInView:v3->_shadowView];
    [(CarMultiButtonView *)v3 addConstraints:v8];
    [(CarMultiButtonView *)v3 addConstraints:v9];
  }
  return v3;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarMultiButtonView;
  [(CarMultiButtonView *)&v4 didMoveToWindow];
  v3 = [(CarMultiButtonView *)self window];

  if (v3)
  {
    [(UIView *)self->_shadowView _mapsCar_updateShadow];
    [(CarMultiButtonView *)self _recalculateShadowAttributes];
    [(CarMultiButtonView *)self _buttonSpacing];
    -[CarMultiButtonStackView setSpacing:](self->_stackView, "setSpacing:");
  }
}

- (double)_buttonSpacing
{
  v3 = [(CarMultiButtonView *)self window];
  objc_super v4 = [v3 screen];
  [v4 scale];
  if (v5 == 0.0)
  {
    v6 = +[UIScreen _carScreen];
    [v6 scale];
    double v9 = v10;
  }
  else
  {
    v6 = [(CarMultiButtonView *)self window];
    v7 = [v6 screen];
    [v7 scale];
    double v9 = v8;
  }
  double result = 1.0 / v9;
  if (v9 == 0.0) {
    return 0.5;
  }
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarMultiButtonView;
  id v4 = a3;
  [(CarMultiButtonView *)&v8 traitCollectionDidChange:v4];
  double v5 = [(CarMultiButtonView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(UIView *)self->_shadowView _mapsCar_updateShadow];
  }
}

- (void)setButtons:(id)a3
{
  double v5 = (NSArray *)a3;
  p_buttons = &self->_buttons;
  if (self->_buttons != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->_buttons, a3);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = *p_buttons;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v12 setRoundedCorners:0];
          v13 = [(NSArray *)*p_buttons firstObject];

          double v14 = 0.0;
          double v15 = 0.0;
          if (v12 == v13)
          {
            [v12 setRoundedCorners:[v12 roundedCorners] | 3];
            double v15 = -8.5;
          }
          v16 = [(NSArray *)*p_buttons lastObject];

          if (v12 == v16)
          {
            [v12 setRoundedCorners:[v12 roundedCorners] | 0xC];
            double v14 = -8.5;
          }
          [v12 setTouchInsets:v15, -8.5, v14, -8.5];
          if (objc_opt_respondsToSelector()) {
            [v12 setNeedsLayout];
          }
        }
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [(CarMultiButtonStackView *)self->_stackView _maps_setArrangedSubviews:*p_buttons];
    [(UIView *)self->_shadowView _mapsCar_updateShadow];
    [(CarMultiButtonView *)self _recalculateShadowAttributes];
    [(CarMultiButtonView *)self invalidateIntrinsicContentSize];
    double v5 = v17;
  }
}

- (void)_recalculateShadowAttributes
{
  v3 = [(NSArray *)self->_buttons firstObject];
  unsigned __int8 v4 = [v3 roundedCorners];

  double v5 = [(NSArray *)self->_buttons lastObject];
  char v6 = [v5 roundedCorners] | v4;

  id v7 = [(NSArray *)self->_buttons firstObject];
  [v7 roundedCornerRadius];
  double v9 = v8;
  uint64_t v10 = [(NSArray *)self->_buttons lastObject];
  [v10 roundedCornerRadius];
  buttons = self->_buttons;
  if (v9 > v12) {
    [(NSArray *)buttons firstObject];
  }
  else {
  v13 = [(NSArray *)buttons lastObject];
  }
  [v13 roundedCornerRadius];
  double v15 = v14;
  v16 = [(UIView *)self->_shadowView layer];
  [v16 setCornerRadius:v15];

  uint64_t v17 = v6 & 0xF;
  long long v18 = [(UIView *)self->_shadowView layer];
  [v18 setMaskedCorners:v17];

  id v24 = [(NSArray *)self->_buttons firstObject];
  unsigned int v19 = [v24 needsContinuousRoundedCorners];
  if ((v19 & 1) != 0
    || ([(NSArray *)self->_buttons firstObject],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        [(id)v17 needsContinuousRoundedCorners]))
  {
    int v20 = v19 ^ 1;
    long long v21 = &kCACornerCurveContinuous;
  }
  else
  {
    long long v21 = &kCACornerCurveCircular;
    int v20 = 1;
  }
  CALayerCornerCurve v22 = *v21;
  v23 = [(UIView *)self->_shadowView layer];
  [v23 setCornerCurve:v22];

  if (v20) {
}
  }

- (CGSize)intrinsicContentSize
{
  v3 = [(CarMultiButtonView *)self buttons];
  if ([v3 count] == (id)1)
  {

LABEL_4:
    char v6 = [(CarMultiButtonView *)self buttons];
    [v6 count];
    [(CarMultiButtonView *)self _buttonSpacing];

    goto LABEL_5;
  }
  unsigned __int8 v4 = [(CarMultiButtonView *)self buttons];
  double v5 = (double)(unint64_t)[v4 count] * 33.0;

  if (v5 > 0.0) {
    goto LABEL_4;
  }
LABEL_5:
  UIRoundToViewScale();
  double v8 = v7;
  double v9 = 28.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return -[CarMultiButtonStackView pointInside:withEvent:](self->_stackView, "pointInside:withEvent:", a4, a3.x, a3.y);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (CarMultiButtonStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end