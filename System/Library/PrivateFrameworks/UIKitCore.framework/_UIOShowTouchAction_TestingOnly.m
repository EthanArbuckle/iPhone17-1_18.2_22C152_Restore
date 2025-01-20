@interface _UIOShowTouchAction_TestingOnly
- (BOOL)isPermitted;
- (_UIOShowTouchAction_TestingOnly)initWithPoint:(CGPoint)a3 inView:(id)a4;
- (void)_removeIndicatorView;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIOShowTouchAction_TestingOnly

- (BOOL)isPermitted
{
  return os_variant_has_internal_diagnostics();
}

- (_UIOShowTouchAction_TestingOnly)initWithPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = +[_UIOServerActionOriginContext defaultOriginContext];
  v9 = (void *)[v8 mutableCopy];

  objc_msgSend(v9, "setLayerReferencePoint:", x, y);
  v10 = [v7 layer];

  [v9 setLayerId:CALayerGetRenderId()];
  v11 = [(_UIOServerAction *)self initWithOriginContext:v9 info:0 responder:0];

  return v11;
}

- (void)_removeIndicatorView
{
  v2[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke_2;
  v2[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:0 delay:v3 options:v2 animations:0.3 completion:1.0];
}

- (void)performActionFromConnection:(id)a3
{
  v4 = [a3 server];
  v5 = [v4 displayDelegateForAction:self];

  v6 = [v5 rootViewController];
  id v7 = [v6 view];

  v8 = [(_UIOServerAction *)self originContext];
  [v8 translatedReferencePointForDestinationView:v7];
  double v10 = v9;
  double v12 = v11;

  v13 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  indicatorView = self->_indicatorView;
  self->_indicatorView = v13;

  v15 = [(UIView *)self->_indicatorView layer];
  [v15 setCornerRadius:50.0];

  -[UIView setCenter:](self->_indicatorView, "setCenter:", v10, v12);
  v16 = +[UIColor redColor];
  [(UIView *)self->_indicatorView setBackgroundColor:v16];

  [v7 addSubview:self->_indicatorView];
  CGAffineTransformMakeScale(&v21, 4.0, 4.0);
  v17 = self->_indicatorView;
  CGAffineTransform v20 = v21;
  [(UIView *)v17 setTransform:&v20];
  [(UIView *)self->_indicatorView setAlpha:0.0];
  v18[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke;
  v19[3] = &unk_1E52D9F70;
  v19[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke_2;
  v18[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:0 delay:v19 usingSpringWithDamping:v18 initialSpringVelocity:0.6 options:0.0 animations:1.0 completion:100.0];
}

- (void).cxx_destruct
{
}

@end