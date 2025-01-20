@interface MRMarimbaLayerView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)marimbaInteractivityIsEnabled;
- (MRMarimbaLayer)marimbaLayer;
- (MRMarimbaLayerView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)pinch:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)tap:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MRMarimbaLayerView

- (MRMarimbaLayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)MRMarimbaLayerView;
  v7 = -[MRMarimbaLayerView initWithFrame:](&v11, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    [(MRMarimbaLayerView *)v7 setOpaque:1];
    v9 = objc_alloc_init(MRMarimbaLayer);
    v8->_marimbaLayer = v9;
    [(MRMarimbaLayer *)v9 setOpaque:1];
    objc_msgSend(-[MRMarimbaLayerView layer](v8, "layer"), "addSublayer:", v8->_marimbaLayer);
    -[MRMarimbaLayerView setFrame:](v8, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (void)dealloc
{
  self->_marimbaLayer = 0;
  self->_pinchRecognizer = 0;

  self->_tapRecognizer = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRMarimbaLayerView;
  [(MRMarimbaLayerView *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRMarimbaLayerView;
  -[MRMarimbaLayerView setFrame:](&v10, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  marimbaLayer = self->_marimbaLayer;
  if (marimbaLayer)
  {
    if (![(MRMarimbaLayer *)marimbaLayer renderer]
      || ![(MRRenderer *)[(MRMarimbaLayer *)self->_marimbaLayer renderer] orientation])
    {
      UIInterfaceOrientation v5 = [+[UIApplication sharedApplication] statusBarOrientation];
      v6 = self->_marimbaLayer;
      [(MRMarimbaLayerView *)self bounds];
      double v8 = v7;
      [(MRMarimbaLayerView *)self bounds];
      [(MRMarimbaLayer *)v6 beginMorphingToAspectRatio:v5 andOrientation:0 withDuration:v8 / v9 switchToDocument:0.0];
      [(MRMarimbaLayer *)self->_marimbaLayer endMorphing];
    }
    [(MRMarimbaLayerView *)self bounds];
    -[MRMarimbaLayer setFrame:](self->_marimbaLayer, "setFrame:");
  }
}

- (BOOL)marimbaInteractivityIsEnabled
{
  unsigned int v3 = objc_msgSend(-[MRMarimbaLayerView superview](self, "superview"), "canInteract");
  if (v3)
  {
    marimbaLayer = self->_marimbaLayer;
    LOBYTE(v3) = [(MRMarimbaLayer *)marimbaLayer interactivityIsEnabled];
  }
  return v3;
}

- (void)pinch:(id)a3
{
  if ([(MRMarimbaLayerView *)self marimbaInteractivityIsEnabled])
  {
    id v5 = [(MRMarimbaLayerView *)self superview];
    [v5 pinchIn:a3];
  }
}

- (void)tap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    id v5 = [(MRMarimbaLayerView *)self superview];
    [a3 locationInView:self];
    objc_msgSend(v5, "marimbaWasSingleTappedAtPoint:");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  unsigned int v5 = objc_msgSend(-[MRMarimbaLayerView superview](self, "superview"), "canInteract");
  if (self->_tapRecognizer != a3)
  {
    if (self->_pinchRecognizer == a3)
    {
      if (!v5) {
        return v5;
      }
      if (![(MRRenderer *)[(MRMarimbaLayer *)self->_marimbaLayer renderer] currentFocusedSlideAsset])
      {
        [(UIPinchGestureRecognizer *)self->_pinchRecognizer scale];
        LOBYTE(v5) = v8 < 1.0;
        return v5;
      }
    }
    else if (!v5 {
           || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    }
           || ([a3 velocityInView:self],
               ![(MRRenderer *)[(MRMarimbaLayer *)self->_marimbaLayer renderer] canGoToMoreSlides:v6 > 0.0]))
    {
      v10.receiver = self;
      v10.super_class = (Class)MRMarimbaLayerView;
      LOBYTE(v5) = [(MRMarimbaLayerView *)&v10 gestureRecognizerShouldBegin:a3];
      return v5;
    }
    LOBYTE(v5) = 0;
    return v5;
  }
  if (v5)
  {
    id v7 = [(MRMarimbaLayerView *)self superview];
    LOBYTE(v5) = [v7 wantsSingleTap];
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract"))
  {
    touchSet = self->_touchSet;
    if (touchSet)
    {
      id v7 = [(MRTouchSet *)touchSet updateWithUITouches:a3 inView:self];
    }
    else
    {
      double v8 = [[MRTouchSet alloc] initWithUITouches:a3 inView:self];
      self->_touchSet = v8;
      id v7 = [(MRTouchSet *)v8 touches];
    }
    double v9 = v7;
    marimbaLayer = self->_marimbaLayer;
    [(MRMarimbaLayer *)marimbaLayer touchesBegan:v9];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract"))
  {
    id v6 = [(MRTouchSet *)self->_touchSet updateWithUITouches:a3 inView:self];
    marimbaLayer = self->_marimbaLayer;
    [(MRMarimbaLayer *)marimbaLayer touchesMoved:v6];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract"))
  {
    [(MRMarimbaLayer *)self->_marimbaLayer touchesCancelled:[(MRTouchSet *)self->_touchSet updateWithUITouches:a3 inView:self]];
    if (![(MRTouchSet *)self->_touchSet isActive])
    {

      self->_touchSet = 0;
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract"))
  {
    [(MRMarimbaLayer *)self->_marimbaLayer touchesEnded:[(MRTouchSet *)self->_touchSet updateWithUITouches:a3 inView:self]];
    if (![(MRTouchSet *)self->_touchSet isActive])
    {

      self->_touchSet = 0;
    }
  }
}

- (MRMarimbaLayer)marimbaLayer
{
  return self->_marimbaLayer;
}

@end