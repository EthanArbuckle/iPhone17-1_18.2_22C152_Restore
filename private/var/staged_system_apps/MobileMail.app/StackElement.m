@interface StackElement
- (BOOL)isAnimating;
- (BOOL)isVisible;
- (CGAffineTransform)fullsizeTransform;
- (CGAffineTransform)stackTransformWithDepth:(SEL)a3;
- (CGAffineTransform)stackTransformWithDepth:(SEL)a3 translation:(int64_t)a4;
- (CGPoint)offStackTranslation;
- (CGSize)_scaleFactorWithDepth:(int64_t)a3 translation:(CGPoint *)a4;
- (CGSize)_stackContainerSize;
- (StackElement)initWithItem:(id)a3 state:(int64_t)a4;
- (StackElementDelegate)delegate;
- (UIView)itemView;
- (double)borderWidthWithStackDepth:(int64_t)a3;
- (id)borderColorWithStackDepth:(int64_t)a3;
- (id)description;
- (id)dimmingColor;
- (id)item;
- (id)itemViewCreateIfNeeded:(BOOL)a3;
- (int64_t)currentState;
- (int64_t)nextDepth;
- (int64_t)nextState;
- (int64_t)previousState;
- (int64_t)targetDepth;
- (int64_t)targetState;
- (void)beginAnimationToState:(int64_t)a3 withDuration:(double)a4 beginsFromCurrentState:(BOOL)a5 animated:(BOOL)a6 animations:(id)a7;
- (void)beginAnimationToState:(int64_t)a3 withDuration:(double)a4 beginsFromCurrentState:(BOOL)a5 animated:(BOOL)a6 animations:(id)a7 completion:(id)a8;
- (void)fadeInUnderneathStack:(BOOL)a3 previousDepth:(int64_t)a4;
- (void)fadeOutUnderneathStack:(BOOL)a3 previousDepth:(int64_t)a4;
- (void)hide:(BOOL)a3;
- (void)moveIntoStack:(BOOL)a3;
- (void)moveOutFromStack:(BOOL)a3;
- (void)removeDimmingFilter;
- (void)removeItemView;
- (void)removeView;
- (void)setCurrentState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4;
- (void)setNextState:(int64_t)a3 nextDepth:(int64_t)a4 animated:(BOOL)a5;
- (void)setTargetDepth:(int64_t)a3;
- (void)setTargetState:(int64_t)a3;
- (void)showDimmed:(BOOL)a3;
- (void)showFullsize:(BOOL)a3;
- (void)updateItemView:(id)a3;
- (void)updateItemView:(id)a3 onStack:(BOOL)a4;
- (void)updateItemView:(id)a3 onStack:(BOOL)a4 adjustSubviewIndex:(BOOL)a5;
- (void)updateItemView:(id)a3 onStack:(BOOL)a4 adjustSubviewIndex:(BOOL)a5 stackDepth:(int64_t)a6;
- (void)updateItemView:(id)a3 onStack:(BOOL)a4 stackDepth:(int64_t)a5;
- (void)updateViewFrame:(CGRect)a3;
@end

@implementation StackElement

- (StackElement)initWithItem:(id)a3 state:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)StackElement;
  v8 = [(StackElement *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_item, a3);
    v9->_nextState = a4;
    v9->_targetState = a4;
    v9->_previousState = a4;
    v9->_currentState = a4;
    v9->_nextDepth = 0;
    v9->_targetDepth = 0;
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = (void *)v4;
  unint64_t previousState = self->_previousState;
  if (previousState > 6) {
    id v7 = 0;
  }
  else {
    id v7 = off_10060E038[previousState];
  }
  unint64_t currentState = self->_currentState;
  if (currentState > 6) {
    v9 = 0;
  }
  else {
    v9 = off_10060E038[currentState];
  }
  unint64_t nextState = self->_nextState;
  if (nextState > 6) {
    objc_super v11 = 0;
  }
  else {
    objc_super v11 = off_10060E038[nextState];
  }
  unint64_t targetState = self->_targetState;
  if (targetState > 6) {
    v13 = 0;
  }
  else {
    v13 = off_10060E038[targetState];
  }
  v14 = +[NSString stringWithFormat:@"<%@: %p, states: prev (%@) cur (%@) next (%@) target (%@), item: %@>", v4, self, v7, v9, v11, v13, self->_item];

  return v14;
}

- (void)setNextState:(int64_t)a3 nextDepth:(int64_t)a4 animated:(BOOL)a5
{
  int64_t nextState = self->_nextState;
  int64_t nextDepth = self->_nextDepth;
  if (nextState == a3 && nextDepth == a4) {
    return;
  }
  self->_int64_t nextState = a3;
  self->_int64_t nextDepth = a4;
  if (self->_previousState == a3) {
    self->_unint64_t previousState = nextState;
  }
  switch(a3)
  {
    case 1:
      [(StackElement *)self hide:a5];
      goto LABEL_18;
    case 2:
      [(StackElement *)self showFullsize:a5];
      goto LABEL_18;
    case 3:
      [(StackElement *)self showDimmed:a5];
      goto LABEL_18;
    case 4:
      if (nextState == 4)
      {
        if (nextDepth == a4) {
          goto LABEL_18;
        }
      }
      else if (nextState == 6)
      {
        -[StackElement fadeInUnderneathStack:previousDepth:](self, "fadeInUnderneathStack:previousDepth:", a5);
        goto LABEL_18;
      }
      [(StackElement *)self moveIntoStack:a5];
LABEL_18:
      if (!a5)
      {
        [(StackElement *)self setCurrentState:a3];
      }
      return;
    case 5:
      [(StackElement *)self moveOutFromStack:a5];
      goto LABEL_18;
    case 6:
      -[StackElement fadeOutUnderneathStack:previousDepth:](self, "fadeOutUnderneathStack:previousDepth:", a5);
      goto LABEL_18;
    default:
      goto LABEL_18;
  }
}

- (BOOL)isVisible
{
  unint64_t v2 = [(StackElement *)self currentState];
  return (v2 > 6) | (0x1Du >> v2) & 1;
}

- (void)setCurrentState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    int64_t previousState = self->_previousState;
    self->_unint64_t currentState = a3;
    self->_int64_t nextState = a3;
    self->_int64_t previousState = a3;
    id v6 = [(StackElement *)self delegate];
    [v6 stackElement:self currentStateDidChangeFrom:previousState to:a3];
  }
}

- (void)setTargetState:(int64_t)a3
{
  int64_t targetState = self->_targetState;
  if (targetState != a3)
  {
    self->_int64_t targetState = a3;
    id v6 = [(StackElement *)self delegate];
    [v6 stackElement:self targetStateDidChangeFrom:targetState to:a3];
  }
}

- (BOOL)isAnimating
{
  if (self->_currentState) {
    return 0;
  }
  int64_t previousState = self->_previousState;
  if (previousState != 3) {
    return previousState != 2 || self->_nextState != 3;
  }
  return self->_nextState != 2;
}

- (void)removeView
{
  if ((id)[(StackElement *)self currentState] == (id)2) {
    [(StackElement *)self removeDimmingFilter];
  }

  [(StackElement *)self removeItemView];
}

- (UIView)itemView
{
  return (UIView *)[(StackElement *)self itemViewCreateIfNeeded:1];
}

- (id)itemViewCreateIfNeeded:(BOOL)a3
{
  itemView = self->_itemView;
  if (itemView) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = [(StackElement *)self delegate];
    id v7 = [v6 viewForStackElement:self];

    v8 = [(UIView *)v7 layer];
    [v8 setAllowsEdgeAntialiasing:1];

    v9 = self->_itemView;
    self->_itemView = v7;

    itemView = self->_itemView;
  }

  return itemView;
}

- (void)removeItemView
{
  if (self->_itemView)
  {
    v3 = [(StackElement *)self delegate];
    [v3 stackElement:self willRemoveView:self->_itemView];

    [(UIView *)self->_itemView removeFromSuperview];
    itemView = self->_itemView;
    self->_itemView = 0;
  }
}

- (void)updateViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(StackElement *)self itemViewCreateIfNeeded:0];
  v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v12[1] = v10;
    v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v8 setTransform:v12];
    [v9 setFrame:CGRectMake(x, y, width, height)];
    [(StackElement *)self stackTransformWithDepth:[(StackElement *)self targetDepth]];
    v11[0] = v11[3];
    v11[1] = v11[4];
    v11[2] = v11[5];
    [v9 setTransform:v11];
  }
}

- (id)dimmingColor
{
  unint64_t v2 = (void *)qword_100699F20;
  if (!qword_100699F20)
  {
    id v3 = [objc_alloc((Class)UIColor) initWithWhite:0.831372549 alpha:1.0];
    uint64_t v4 = (void *)qword_100699F20;
    qword_100699F20 = (uint64_t)v3;

    unint64_t v2 = (void *)qword_100699F20;
  }

  return v2;
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(StackElement *)self item];

  if (!v7) {
    return;
  }
  v8 = [(StackElement *)self itemViewCreateIfNeeded:v5];
  id v31 = v8;
  if (v4)
  {
    v9 = [v8 layer];
    long long v10 = +[NSString stringWithFormat:@"filters.%@", @"dimFilter"];
    id v11 = [v9 valueForKeyPath:v10];

    v8 = v31;
    if (v11) {
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = 0;
  }
  if (!v5)
  {
    v12 = [v8 layer];
    [v12 removeAnimationForKey:@"dim"];

    v13 = [v31 layer];
    [v13 setFilters:0];
    v14 = v13;
    id v11 = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_9:
  if (!v11)
  {
    id v15 = objc_alloc((Class)CAFilter);
    id v11 = [v15 initWithType:kCAFilterMultiplyColor];
    [v11 setName:@"dimFilter"];
    if (!v5 || v4) {
      +[UIColor whiteColor];
    }
    else {
    v16 = [(StackElement *)self dimmingColor];
    }
    [v11 setValue:[v16 CGColor] forKey:@"inputColor"];

    v17 = +[NSArray arrayWithObject:v11];
    v18 = [v31 layer];
    [v18 setFilters:v17];

    [v31 setUserInteractionEnabled:0];
  }
  if (v4)
  {
    v14 = +[NSString stringWithFormat:@"filters.%@.inputColor", @"dimFilter"];
    v19 = +[CABasicAnimation animationWithKeyPath:v14];
    v20 = [v31 layer];
    v21 = [v20 presentationLayer];
    v22 = [v21 valueForKeyPath:v14];
    [v19 setFromValue:v22];

    if (v5) {
      [(StackElement *)self dimmingColor];
    }
    else {
    v24 = +[UIColor systemBackgroundColor];
    }
    [v19 setToValue:[v24 CGColor]];

    UIAnimationDragCoefficient();
    [v19 setDuration:v25 * 0.35];
    [v19 setRemovedOnCompletion:0];
    [v19 setFillMode:kCAFillModeForwards];
    v26 = [v31 layer];
    [v26 addAnimation:v19 forKey:@"dim"];

    dimmingAnimationView = self->_dimmingAnimationView;
    if (!dimmingAnimationView)
    {
      v28 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      v29 = self->_dimmingAnimationView;
      self->_dimmingAnimationView = v28;

      [(UIView *)self->_dimmingAnimationView setAlpha:0.0];
      [v31 addSubview:self->_dimmingAnimationView];
      dimmingAnimationView = self->_dimmingAnimationView;
    }
    double v30 = 0.0;
    if (v5) {
      double v30 = 1.0;
    }
    [(UIView *)dimmingAnimationView setAlpha:v30];

    goto LABEL_25;
  }
  v23 = [v31 layer];
  [v23 removeAnimationForKey:@"dim"];

  if (!v5)
  {
    v14 = [v31 layer];
    [v14 setFilters:0];
    goto LABEL_25;
  }
LABEL_26:
}

- (void)removeDimmingFilter
{
  id v6 = [(StackElement *)self itemViewCreateIfNeeded:0];
  id v3 = [v6 layer];
  [v3 removeAnimationForKey:@"dim"];

  BOOL v4 = [v6 layer];
  [v4 setFilters:0];

  [v6 setUserInteractionEnabled:1];
  [(UIView *)self->_dimmingAnimationView removeFromSuperview];
  dimmingAnimationView = self->_dimmingAnimationView;
  self->_dimmingAnimationView = 0;
}

- (void)beginAnimationToState:(int64_t)a3 withDuration:(double)a4 beginsFromCurrentState:(BOOL)a5 animated:(BOOL)a6 animations:(id)a7
{
}

- (void)beginAnimationToState:(int64_t)a3 withDuration:(double)a4 beginsFromCurrentState:(BOOL)a5 animated:(BOOL)a6 animations:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10021A6A0;
  v16[3] = &unk_10060E018;
  v16[4] = self;
  int64_t v18 = a3;
  id v12 = a8;
  id v17 = v12;
  id v13 = a7;
  v14 = objc_retainBlock(v16);
  self->_unint64_t currentState = 0;
  double v15 = 0.0;
  if (v9) {
    double v15 = a4;
  }
  +[UIView animateWithDuration:4 delay:v13 options:v14 animations:v15 completion:0.0];
}

- (void)hide:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(StackElement *)self isVisible];
  BOOL v6 = v5;
  [(StackElement *)self itemViewCreateIfNeeded:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10021A808;
  v8[3] = &unk_1006058A8;
  BOOL v10 = v6;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [(StackElement *)self beginAnimationToState:1 withDuration:1 beginsFromCurrentState:v3 animated:v8 animations:0.35];
}

- (void)showFullsize:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(StackElement *)self itemViewCreateIfNeeded:0];
  BOOL v6 = [(StackElement *)self delegate];
  unsigned int v7 = [v6 stackIsTerminating];

  BOOL v8 = [(StackElement *)self isVisible];
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    BOOL v10 = [v5 superview];
    if (v7)
    {
      [v10 bringSubviewToFront:v5];

      id v11 = [v5 layer];
      [v11 setShouldRasterize:1];

      id v12 = +[UIScreen mainScreen];
      [v12 scale];
      double v14 = v13;
      double v15 = [v5 layer];
      [v15 setRasterizationScale:v14];

      id v9 = v5;
    }
    else
    {
      [v10 sendSubviewToBack:v5];

      id v9 = 0;
    }
    [(StackElement *)self fullsizeTransform];
    v25[0] = v25[3];
    v25[1] = v25[4];
    v25[2] = v25[5];
    [v5 setTransform:v25];
    [v5 setAlpha:0.0];
    [(StackElement *)self setDimmed:0 animated:0];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10021AAEC;
  v20[3] = &unk_100608778;
  id v16 = v5;
  id v21 = v16;
  v22 = self;
  BOOL v23 = v8;
  BOOL v24 = v3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10021AB74;
  v18[3] = &unk_100604550;
  id v19 = v9;
  id v17 = v9;
  [(StackElement *)self beginAnimationToState:2 withDuration:v8 beginsFromCurrentState:v3 animated:v20 animations:v18 completion:0.35];
}

- (void)showDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(StackElement *)self itemViewCreateIfNeeded:1];
  BOOL v6 = [(StackElement *)self isVisible];
  if (!v6)
  {
    unsigned int v7 = [v5 superview];
    [v7 sendSubviewToBack:v5];

    [(StackElement *)self fullsizeTransform];
    v15[0] = v15[3];
    v15[1] = v15[4];
    v15[2] = v15[5];
    [v5 setTransform:v15];
    BOOL v8 = [v5 layer];
    [v8 setBorderWidth:0.0];

    [v5 setAlpha:0.0];
    [(StackElement *)self setDimmed:1 animated:0];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10021AD64;
  v10[3] = &unk_100608778;
  id v9 = v5;
  id v11 = v9;
  id v12 = self;
  BOOL v13 = v6;
  BOOL v14 = v3;
  [(StackElement *)self beginAnimationToState:3 withDuration:v6 beginsFromCurrentState:v3 animated:v10 animations:0.35];
}

- (void)moveIntoStack:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(StackElement *)self itemViewCreateIfNeeded:1];
  BOOL v6 = [(StackElement *)self isVisible];
  if (!v6)
  {
    [(StackElement *)self updateItemView:v5 onStack:0 adjustSubviewIndex:1];
    [v5 setAlpha:1.0];
    [(StackElement *)self setDimmed:0 animated:0];
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10021AF4C;
  v8[3] = &unk_100608778;
  void v8[4] = self;
  id v7 = v5;
  id v9 = v7;
  BOOL v10 = v6;
  BOOL v11 = v3;
  [(StackElement *)self beginAnimationToState:4 withDuration:v6 beginsFromCurrentState:v3 animated:v8 animations:0.35];
}

- (void)moveOutFromStack:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(StackElement *)self itemViewCreateIfNeeded:1];
  BOOL v6 = [(StackElement *)self isVisible];
  if (!v6)
  {
    [(StackElement *)self updateItemView:v5 onStack:1 adjustSubviewIndex:1];
    [v5 setAlpha:1.0];
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10021B0C8;
  v8[3] = &unk_10060B730;
  void v8[4] = self;
  id v7 = v5;
  id v9 = v7;
  BOOL v10 = v3;
  [(StackElement *)self beginAnimationToState:5 withDuration:v6 beginsFromCurrentState:v3 animated:v8 animations:0.35];
}

- (void)fadeOutUnderneathStack:(BOOL)a3 previousDepth:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(StackElement *)self itemViewCreateIfNeeded:0];
  unsigned int v8 = [(StackElement *)self isVisible];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10021B328;
  v21[3] = &unk_10060B730;
  char v23 = v8;
  v21[4] = self;
  id v9 = v7;
  id v22 = v9;
  double v10 = 0.35;
  [(StackElement *)self beginAnimationToState:6 withDuration:1 beginsFromCurrentState:v5 animated:v21 animations:0.35];
  if (v8)
  {
    int64_t nextDepth = self->_nextDepth;
    double v12 = 0.0;
    uint64_t v13 = nextDepth - a4;
    if (nextDepth > a4)
    {
      BOOL v14 = [(StackElement *)self delegate];
      double v15 = (double)v13;
      double v16 = (double)((unint64_t)[v14 maximumStackElementDepth] - a4);

      double v17 = 1.0 / (double)v13;
      if (v17 < 0.0) {
        double v17 = -(1.0 / v15);
      }
      double v10 = v17 * 0.35;
      double v18 = v16 / v15;
      if (v16 / v15 < 0.0) {
        double v18 = -(v16 / v15);
      }
      double v12 = v18 * 0.35;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10021B340;
    v19[3] = &unk_1006047A0;
    id v20 = v9;
    +[UIView animateWithDuration:4 delay:v19 options:0 animations:v10 completion:v12];
  }
}

- (void)fadeInUnderneathStack:(BOOL)a3 previousDepth:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(StackElement *)self itemViewCreateIfNeeded:1];
  if ([(StackElement *)self isVisible] && (id)[(StackElement *)self previousState] != (id)6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    [(StackElement *)self updateItemView:v7 onStack:1 adjustSubviewIndex:1 stackDepth:a4];
    [v7 setAlpha:0.0];
    [(StackElement *)self setDimmed:0 animated:0];
    uint64_t v8 = 0;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10021B5C8;
  v26[3] = &unk_100608778;
  v26[4] = self;
  id v9 = v7;
  id v27 = v9;
  char v28 = v8;
  BOOL v29 = v5;
  [(StackElement *)self beginAnimationToState:4 withDuration:v8 beginsFromCurrentState:v5 animated:v26 animations:0.35];
  int64_t nextDepth = self->_nextDepth;
  uint64_t v11 = a4 - nextDepth;
  if (a4 <= nextDepth)
  {
    v19.f64[1] = 0.35;
  }
  else
  {
    double v12 = [(StackElement *)self delegate];
    double v22 = (double)(uint64_t)(~(unint64_t)[v12 maximumStackElementDepth] + a4);

    __asm { FMOV            V0.2D, #1.0 }
    _Q0.f64[0] = v22;
    float64x2_t v18 = vdivq_f64(_Q0, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v11), 0));
    float64x2_t v19 = vmulq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v18), (int8x16_t)vnegq_f64(v18), (int8x16_t)v18), (float64x2_t)vdupq_n_s64(0x3FD6666666666666uLL));
  }
  double v23 = v19.f64[1];
  if (v8) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = 0;
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10021B624;
  v24[3] = &unk_1006047A0;
  id v21 = v9;
  id v25 = v21;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v20, v24, 0, v23);
}

- (void)updateItemView:(id)a3
{
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4
{
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4 stackDepth:(int64_t)a5
{
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4 adjustSubviewIndex:(BOOL)a5
{
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4 adjustSubviewIndex:(BOOL)a5 stackDepth:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  if (v8)
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  else
  {
    [(StackElement *)self offStackTranslation];
  }
  -[StackElement stackTransformWithDepth:translation:](self, "stackTransformWithDepth:translation:", a6, x, y);
  v22[0] = v22[3];
  v22[1] = v22[4];
  v22[2] = v22[5];
  [v10 setTransform:v22];
  [(StackElement *)self borderWidthWithStackDepth:a6];
  double v14 = v13;
  double v15 = [v10 layer];
  [v15 setBorderWidth:v14];

  id v16 = [(StackElement *)self borderColorWithStackDepth:a6];
  id v17 = [v16 CGColor];
  float64x2_t v18 = [v10 layer];
  [v18 setBorderColor:v17];

  if (v7)
  {
    float64x2_t v19 = [(StackElement *)self delegate];
    uint64_t v20 = [v19 viewBelowStackElement:self];

    id v21 = [v10 superview];
    if (v20) {
      [v21 insertSubview:v10 aboveSubview:v20];
    }
    else {
      [v21 sendSubviewToBack:v10];
    }
  }
}

- (double)borderWidthWithStackDepth:(int64_t)a3
{
  BOOL v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = 1.0 / v6;

  [(StackElement *)self _scaleFactorWithDepth:a3 translation:0];
  return v7 * (1.0 / v8);
}

- (id)borderColorWithStackDepth:(int64_t)a3
{
  BOOL v4 = [(StackElement *)self delegate];
  id v5 = [v4 maximumStackElementDepth];

  if ((uint64_t)v5 >= a3) {
    int64_t v6 = a3;
  }
  else {
    int64_t v6 = (int64_t)v5;
  }

  return +[UIColor colorWithWhite:0.0 alpha:(double)v6 * -0.05 + 0.4];
}

- (CGAffineTransform)fullsizeTransform
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (CGAffineTransform)stackTransformWithDepth:(SEL)a3
{
  return -[StackElement stackTransformWithDepth:translation:](self, "stackTransformWithDepth:translation:", a4, CGPointZero.x, CGPointZero.y);
}

- (CGAffineTransform)stackTransformWithDepth:(SEL)a3 translation:(int64_t)a4
{
  double y = a5.y;
  double x = a5.x;
  CGPoint v16 = CGPointZero;
  [(StackElement *)self _scaleFactorWithDepth:a4 translation:&v16];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  *(void *)&long long v12 = -1;
  *((void *)&v12 + 1) = -1;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tdouble x = v12;
  *(_OWORD *)&v15.a = v12;
  CGAffineTransformMakeTranslation(&v15, x + v16.x, y + v16.y);
  CGAffineTransform v14 = v15;
  return CGAffineTransformScale(retstr, &v14, v9, v11);
}

- (CGSize)_scaleFactorWithDepth:(int64_t)a3 translation:(CGPoint *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v8 = [WeakRetained stackContainerView];

  [(StackElement *)self _stackContainerSize];
  double v11 = v9;
  double v12 = v10;
  double v13 = 1.0;
  BOOL v14 = CGSizeZero.width == v9 && CGSizeZero.height == v10;
  double v15 = 1.0;
  if (!v14)
  {
    double v16 = v9 + -64.0;
    UIRoundToViewScale();
    double v18 = v17;
    if (a3)
    {
      double v16 = v16 + (double)a3 * -2.0 * 4.0;
      UIRoundToViewScale();
      if (!a4)
      {
LABEL_8:
        double v13 = v16 / v11;
        double v15 = v17 / v12;
        goto LABEL_9;
      }
    }
    else if (!a4)
    {
      goto LABEL_8;
    }
    a4->double x = 0.0;
    a4->double y = (v18 - v17) * -0.5 + (double)a3 * -4.0;
    goto LABEL_8;
  }
LABEL_9:

  double v19 = v13;
  double v20 = v15;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (CGPoint)offStackTranslation
{
  [(StackElement *)self _stackContainerSize];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v6 = [WeakRetained stackContainerView];
  unsigned int v7 = [v6 _shouldReverseLayoutDirection];

  double v8 = -v4;
  if (v7) {
    double v8 = v4;
  }
  double v9 = 0.0;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGSize)_stackContainerSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained stackContainerView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  [WeakRetained stackContainerViewEdgeInsets];
  double v10 = v5 - (v8 + v9);
  double v13 = v7 - (v11 + v12);

  double v14 = v10;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (StackElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StackElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)item
{
  return self->_item;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int64_t)nextState
{
  return self->_nextState;
}

- (int64_t)targetState
{
  return self->_targetState;
}

- (int64_t)nextDepth
{
  return self->_nextDepth;
}

- (int64_t)targetDepth
{
  return self->_targetDepth;
}

- (void)setTargetDepth:(int64_t)a3
{
  self->_targetDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemView, 0);

  objc_storeStrong((id *)&self->_dimmingAnimationView, 0);
}

@end