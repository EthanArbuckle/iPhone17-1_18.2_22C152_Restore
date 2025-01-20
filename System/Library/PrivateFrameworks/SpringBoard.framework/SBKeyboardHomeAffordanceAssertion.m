@interface SBKeyboardHomeAffordanceAssertion
+ (id)assertionForGestureWindow:(id)a3;
- (SBKeyboardHomeAffordanceAssertion)init;
- (SBKeyboardHomeAffordanceAssertion)initWithGestureWindow:(id)a3;
- (UIWindow)sourceWindow;
- (double)additionalEdgeMargin;
- (void)dealloc;
- (void)invalidate;
- (void)setAdditionalEdgeMargin:(double)a3;
- (void)setSourceWindow:(id)a3;
@end

@implementation SBKeyboardHomeAffordanceAssertion

+ (id)assertionForGestureWindow:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithGestureWindow:v4];

  return v5;
}

- (SBKeyboardHomeAffordanceAssertion)init
{
  return [(SBKeyboardHomeAffordanceAssertion *)self initWithGestureWindow:0];
}

- (SBKeyboardHomeAffordanceAssertion)initWithGestureWindow:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardHomeAffordanceAssertion;
  v5 = [(SBKeyboardHomeAffordanceAssertion *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceWindow, v4);
    v7 = +[SBKeyboardHomeAffordanceController sharedInstance];
    [v7 registerAssertion:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[SBKeyboardHomeAffordanceController sharedInstance];
  [v3 unregisterAssertion:self];

  v4.receiver = self;
  v4.super_class = (Class)SBKeyboardHomeAffordanceAssertion;
  [(SBKeyboardHomeAffordanceAssertion *)&v4 dealloc];
}

- (void)invalidate
{
  id v3 = +[SBKeyboardHomeAffordanceController sharedInstance];
  [v3 unregisterAssertion:self];
}

- (void)setAdditionalEdgeMargin:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_additionalEdgeMargin = a3;
    id v5 = +[SBKeyboardHomeAffordanceController sharedInstance];
    [v5 _didChangeAdditionalEdgeMarginForAssertion:self];
  }
}

- (double)additionalEdgeMargin
{
  return self->_additionalEdgeMargin;
}

- (UIWindow)sourceWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setSourceWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end