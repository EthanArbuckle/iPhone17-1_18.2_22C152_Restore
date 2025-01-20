@interface UIKBContainerKeyView
- (BOOL)hasRendered;
- (BOOL)requiresSublayers;
- (CGRect)drawFrame;
- (UIKBContainerKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (id)contentsKeyView;
- (id)factory;
- (id)key;
- (id)keyplane;
- (id)layerForRenderFlags:(int64_t)a3;
- (id)renderConfig;
- (int64_t)imageOrientationForLayer:(id)a3;
- (void)changeBackgroundToActiveIfNecessary;
- (void)changeBackgroundToEnabled;
- (void)dimContentKeyView:(id)a3;
- (void)dimKeys:(id)a3;
- (void)prepareForDisplay;
- (void)setDrawFrame:(CGRect)a3;
- (void)setFactory:(id)a3;
- (void)setNeedsDisplay;
- (void)setRenderConfig:(id)a3;
- (void)setScreenTraits:(id)a3;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
@end

@implementation UIKBContainerKeyView

- (UIKBContainerKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIKBContainerKeyView;
  v13 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(UIView *)v13 setOpaque:0];
    [(UIView *)v14 setUserInteractionEnabled:0];
    v15 = [UIKBKeyView alloc];
    [(UIView *)v14 bounds];
    uint64_t v16 = -[UIKBKeyView initWithFrame:keyplane:key:](v15, "initWithFrame:keyplane:key:", v11, v12);
    keyView = v14->_keyView;
    v14->_keyView = (UIKBKeyView *)v16;

    [(UIKBKeyView *)v14->_keyView setContainedInDynamicKey:[(UIKBKeyView *)v14 isDynamicKey]];
    [(UIView *)v14 addSubview:v14->_keyView];
  }

  return v14;
}

- (void)setScreenTraits:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKBContainerKeyView;
  id v4 = a3;
  [(UIKBKeyView *)&v5 setScreenTraits:v4];
  -[UIKBKeyView setScreenTraits:](self->_keyView, "setScreenTraits:", v4, v5.receiver, v5.super_class);
}

- (BOOL)requiresSublayers
{
  return 0;
}

- (BOOL)hasRendered
{
  return [(UIKBKeyView *)self->_keyView hasRendered];
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBContainerKeyView;
  [(UIView *)&v3 setNeedsDisplay];
  [(UIView *)self->_keyView setNeedsDisplay];
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
}

- (void)dimKeys:(id)a3
{
}

- (void)changeBackgroundToEnabled
{
}

- (void)changeBackgroundToActiveIfNecessary
{
}

- (void)prepareForDisplay
{
}

- (id)layerForRenderFlags:(int64_t)a3
{
  return [(UIKBKeyView *)self->_keyView layerForRenderFlags:a3];
}

- (int64_t)imageOrientationForLayer:(id)a3
{
  return [(UIKBKeyView *)self->_keyView imageOrientationForLayer:a3];
}

- (id)keyplane
{
  return [(UIKBKeyView *)self->_keyView keyplane];
}

- (id)key
{
  return [(UIKBKeyView *)self->_keyView key];
}

- (id)contentsKeyView
{
  return self->_keyView;
}

- (CGRect)drawFrame
{
  [(UIKBKeyView *)self->_keyView drawFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setDrawFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UIKBKeyView *)self isDynamicKey])
  {
    [(UIKBKeyView *)self->_keyView drawFrame];
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = width;
    v11.size.double height = height;
    if (!CGRectEqualToRect(v10, v11)) {
      [(UIKBKeyView *)self->_keyView resetRenderedKeyState];
    }
  }
  keyView = self->_keyView;
  -[UIKBKeyView setDrawFrame:](keyView, "setDrawFrame:", x, y, width, height);
}

- (id)renderConfig
{
  return [(UIKBKeyView *)self->_keyView renderConfig];
}

- (void)setRenderConfig:(id)a3
{
}

- (id)factory
{
  return [(UIKBKeyView *)self->_keyView factory];
}

- (void)setFactory:(id)a3
{
  id v4 = a3;
  if ([(UIKBKeyView *)self isDynamicKey]) {
    [(UIKBKeyView *)self->_keyView resetRenderedKeyState];
  }
  [(UIKBKeyView *)self->_keyView setFactory:v4];
}

- (void)dimContentKeyView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end