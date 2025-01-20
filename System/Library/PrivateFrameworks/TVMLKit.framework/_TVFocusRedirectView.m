@interface _TVFocusRedirectView
- (BOOL)_containsInertiaSelectionChanges;
- (BOOL)containsInertia;
- (UIFocusContainerGuide)containerGuide;
- (_TVFocusRedirectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setContainsInertia:(BOOL)a3;
@end

@implementation _TVFocusRedirectView

- (_TVFocusRedirectView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_TVFocusRedirectView;
  v3 = -[_TVFocusRedirectView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x263F1C638]);
    containerGuide = v3->_containerGuide;
    v3->_containerGuide = v4;

    [(_TVFocusRedirectView *)v3 addLayoutGuide:v3->_containerGuide];
    v6 = v3->_containerGuide;
    [(_TVFocusRedirectView *)v3 bounds];
    [(UIFocusContainerGuide *)v6 _setManualLayoutFrame:"_setManualLayoutFrame:"];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_TVFocusRedirectView;
  [(_TVFocusRedirectView *)&v4 layoutSubviews];
  containerGuide = self->_containerGuide;
  [(_TVFocusRedirectView *)self bounds];
  [(UIFocusContainerGuide *)containerGuide _setManualLayoutFrame:"_setManualLayoutFrame:"];
}

- (BOOL)_containsInertiaSelectionChanges
{
  return self->_containsInertia;
}

- (BOOL)containsInertia
{
  return self->_containsInertia;
}

- (void)setContainsInertia:(BOOL)a3
{
  self->_containsInertia = a3;
}

- (UIFocusContainerGuide)containerGuide
{
  return self->_containerGuide;
}

- (void).cxx_destruct
{
}

@end