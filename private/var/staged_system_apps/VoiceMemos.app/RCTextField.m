@interface RCTextField
- (BOOL)canBecomeFocused;
- (BOOL)focusDisabled;
- (RCTextField)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_scribbleInteraction:(id)a3 hitToleranceInsetsForElement:(id)a4 defaultInsets:(UIEdgeInsets)result;
- (void)setFocusDisabled:(BOOL)a3;
@end

@implementation RCTextField

- (RCTextField)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCTextField;
  v3 = -[RCTextField initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (PKScribbleInteraction *)objc_alloc_init((Class)PKScribbleInteraction);
    scribbleInteraction = v3->_scribbleInteraction;
    v3->_scribbleInteraction = v4;

    [(PKScribbleInteraction *)v3->_scribbleInteraction setDelegate:v3];
    [(RCTextField *)v3 addInteraction:v3->_scribbleInteraction];
  }
  return v3;
}

- (void)setFocusDisabled:(BOOL)a3
{
  self->_focusDisabled = a3;
}

- (BOOL)canBecomeFocused
{
  if (self->_focusDisabled) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)RCTextField;
  return [(RCTextField *)&v3 canBecomeFocused];
}

- (UIEdgeInsets)_scribbleInteraction:(id)a3 hitToleranceInsetsForElement:(id)a4 defaultInsets:(UIEdgeInsets)result
{
  double v5 = -200.0;
  double v6 = -200.0;
  result.right = v6;
  result.left = v5;
  return result;
}

- (BOOL)focusDisabled
{
  return self->_focusDisabled;
}

- (void).cxx_destruct
{
}

@end