@interface MapsRippleView
- (BOOL)isAnimating;
- (BOOL)isDarkMode;
- (BOOL)isLooping;
- (CGSize)intrinsicContentSize;
- (MapsRippleView)initWithCoder:(id)a3;
- (MapsRippleView)initWithFrame:(CGRect)a3;
- (double)timeUntilAnimationStop;
- (id)description;
- (void)_commonInit;
- (void)_drawRingInContext:(CGContext *)a3 withProgress:(double)a4 isSecondRing:(BOOL)a5;
- (void)_updateDisplayLink;
- (void)_userInterfaceStyleDidChange;
- (void)didMoveToSuperview;
- (void)drawRect:(CGRect)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setLooping:(BOOL)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation MapsRippleView

- (MapsRippleView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MapsRippleView;
  v3 = [(MapsRippleView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    -[MapsRippleView setFrame:](v3, "setFrame:", 0.0, 0.0, 70.0, 70.0);
    [(MapsRippleView *)v4 _commonInit];
  }
  return v4;
}

- (MapsRippleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MapsRippleView;
  v3 = -[MapsRippleView initWithFrame:](&v6, "initWithFrame:", 0.0, 0.0, 70.0, 70.0);
  v4 = v3;
  if (v3) {
    [(MapsRippleView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(MapsRippleView *)self setOpaque:0];
  [(MapsRippleView *)self setClearsContextBeforeDrawing:1];
  [(MapsRippleView *)self _userInterfaceStyleDidChange];
  uint64_t v5 = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:&v5 count:1];
  id v4 = [(MapsRippleView *)self registerForTraitChanges:v3 withTarget:self action:"_userInterfaceStyleDidChange"];
}

- (void)startAnimating
{
  self->_startTime = CACurrentMediaTime();
  if (!self->_animating)
  {
    v3 = sub_10057683C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsRippleView startAnimating", v4, 2u);
    }

    self->_animating = 1;
    [(MapsRippleView *)self _updateDisplayLink];
  }
}

- (void)stopAnimating
{
  if (self->_animating)
  {
    v3 = sub_10057683C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsRippleView stopAnimating", v4, 2u);
    }

    self->_animating = 0;
    [(MapsRippleView *)self _updateDisplayLink];
  }
}

- (double)timeUntilAnimationStop
{
  CFTimeInterval v3 = CACurrentMediaTime() - self->_startTime;
  if (!self->_looping)
  {
    if (v3 <= 1.0) {
      double v7 = 1.0 - v3;
    }
    else {
      double v7 = 0.0;
    }
    objc_super v6 = sub_10057683C();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    int v12 = 134217984;
    double v13 = v7;
    v8 = "MapsRippleView timeUntilAnimationStop: %f (short-circuit)";
    goto LABEL_16;
  }
  double v4 = fmod(v3, 1.0);
  double v5 = 0.0;
  if (v3 <= 0.2 || (double v5 = fmod(v3 + -0.2, 1.0), v4 <= 0.8) || v5 <= 0.8)
  {
    if (v4 < v5) {
      double v5 = v4;
    }
    double v7 = 0.8 - v5;
    objc_super v6 = sub_10057683C();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    int v12 = 134217984;
    double v13 = v7;
    v8 = "MapsRippleView timeUntilAnimationStop: %f";
LABEL_16:
    v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_17;
  }
  objc_super v6 = sub_10057683C();
  double v7 = 0.0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    v8 = "MapsRippleView timeUntilAnimationStop: 0.0 (non-visible)";
    v9 = v6;
    uint32_t v10 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v12, v10);
  }
LABEL_18:

  return v7;
}

- (void)_updateDisplayLink
{
  CFTimeInterval v3 = [(MapsRippleView *)self superview];
  if (v3 && (BOOL animating = self->_animating, v3, animating))
  {
    if (self->_displayLink) {
      return;
    }
    double v5 = sub_10057683C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MapsRippleView Creating ripple view display link", buf, 2u);
    }

    objc_super v6 = +[CADisplayLink displayLinkWithTarget:self selector:"_onFrameDraw:"];
    displayLink = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    v9 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:NSRunLoopCommonModes];
  }
  else
  {
    if (!self->_displayLink) {
      return;
    }
    uint32_t v10 = sub_10057683C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "MapsRippleView Destroying ripple view display link", v13, 2u);
    }

    v11 = self->_displayLink;
    int v12 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)v11 removeFromRunLoop:v12 forMode:NSRunLoopCommonModes];

    v9 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_userInterfaceStyleDidChange
{
  id v3 = [(MapsRippleView *)self traitCollection];
  -[MapsRippleView setDarkMode:](self, "setDarkMode:", [v3 userInterfaceStyle] == (id)2);
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MapsRippleView;
  [(MapsRippleView *)&v3 didMoveToSuperview];
  [(MapsRippleView *)self _updateDisplayLink];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 70.0;
  double v3 = 70.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MapsRippleView;
  -[MapsRippleView drawRect:](&v14, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext && self->_animating)
  {
    CGContextRef v5 = CurrentContext;
    CFTimeInterval v6 = CACurrentMediaTime() - self->_startTime;
    if (self->_looping || v6 <= 1.0)
    {
      double v8 = fmod(v6, 1.0);
      if (v6 <= 0.2)
      {
        uint32_t v10 = self;
        CGContextRef v11 = v5;
        double v12 = v8;
        uint64_t v13 = 0;
      }
      else
      {
        double v9 = fmod(v6 + -0.2, 1.0);
        [(MapsRippleView *)self _drawRingInContext:v5 withProgress:0 isSecondRing:v8];
        if (v9 <= 0.0) {
          return;
        }
        uint32_t v10 = self;
        CGContextRef v11 = v5;
        double v12 = v9;
        uint64_t v13 = 1;
      }
      [(MapsRippleView *)v10 _drawRingInContext:v11 withProgress:v13 isSecondRing:v12];
    }
  }
}

- (void)_drawRingInContext:(CGContext *)a3 withProgress:(double)a4 isSecondRing:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = 0.0;
  if (a4 <= 0.0) {
    goto LABEL_8;
  }
  if (a4 <= 0.4)
  {
    double v9 = a4 / 0.4;
  }
  else
  {
    double v8 = 2.0;
    if (a4 <= 0.6) {
      goto LABEL_8;
    }
    double v8 = 0.0;
    if (a4 > 0.8) {
      goto LABEL_8;
    }
    double v9 = (a4 + -0.6) / -0.2 + 1.0;
  }
  double v8 = v9 + v9;
LABEL_8:
  if ([(MapsRippleView *)self isDarkMode]) {
    +[UIColor whiteColor];
  }
  else {
  uint32_t v10 = +[UIColor blackColor];
  }
  CGContextRef v11 = v10;
  if (a4 <= 0.0) {
    goto LABEL_15;
  }
  if (a4 <= 0.4)
  {
    double v13 = a4 / 0.4;
LABEL_19:
    double v14 = v13 * 0.400000006;
    goto LABEL_20;
  }
  if (a4 > 0.6)
  {
    if (a4 > 0.8)
    {
LABEL_15:
      uint64_t v12 = +[UIColor clearColor];
      goto LABEL_21;
    }
    double v13 = (a4 + -0.6) / -0.2 + 1.0;
    goto LABEL_19;
  }
  double v14 = 0.400000006;
LABEL_20:
  uint64_t v12 = [v10 colorWithAlphaComponent:v14];
LABEL_21:
  id v17 = (id)v12;
  double v15 = 70.0;
  if (v5) {
    double v15 = 48.0;
  }
  CGFloat v16 = v15 * a4;

  [v17 setStroke];
  CGContextSetLineWidth(a3, v8);
  v19.origin.x = v16 * -0.5 + 35.0;
  v19.origin.y = v19.origin.x;
  v19.size.width = v16;
  v19.size.height = v16;
  CGContextStrokeEllipseInRect(a3, v19);
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p isLooping: %d, isAnimating: %d, hasDisplayLink: %d, startTime: %f>", objc_opt_class(), self, self->_looping, self->_animating, self->_displayLink != 0, *(void *)&self->_startTime];
}

- (BOOL)isLooping
{
  return self->_looping;
}

- (void)setLooping:(BOOL)a3
{
  self->_looping = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isDarkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (void).cxx_destruct
{
}

@end