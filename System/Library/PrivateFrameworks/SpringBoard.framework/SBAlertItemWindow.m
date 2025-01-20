@interface SBAlertItemWindow
- (BOOL)_canBecomeKeyWindow;
- (SBAlertItemWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5 alertLayoutPresentationVerifier:(id)a6;
- (SBAlertLayoutPresentationVerifier)alertLayoutPresentationVerifier;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)setAlertLayoutPresentationVerifier:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation SBAlertItemWindow

- (SBAlertItemWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5 alertLayoutPresentationVerifier:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SBAlertItemWindow;
  v11 = [(SBWindow *)&v15 initWithWindowScene:a3 role:a4 debugName:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_alertLayoutPresentationVerifier, v10);
    v13 = [[SBAlertItemRootViewController alloc] initWithNibName:0 bundle:0];
    [(SBAlertItemWindow *)v12 setRootViewController:v13];
  }
  return v12;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBAlertItemWindow;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&transform.c = v5;
  *(_OWORD *)&transform.tx = *(_OWORD *)&a3->tx;
  [(SBAlertItemWindow *)&v11 setTransform:&transform];
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&transform.c = v6;
  *(_OWORD *)&transform.tx = *(_OWORD *)&a3->tx;
  v7 = NSStringFromCGAffineTransform(&transform);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  v9 = [NSString stringWithFormat:@"Alert window setTransform: %@.", v7];
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:v9];
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)SBAlertItemWindow;
  -[SBAlertItemWindow setCenter:](&v9, sel_setCenter_);
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  long long v6 = NSStringFromCGPoint(v10);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  v8 = [NSString stringWithFormat:@"Alert window setCenter: %@.", v6];
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:v8];
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBAlertItemWindow;
  -[SBAlertItemWindow setFrame:](&v11, sel_setFrame_);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  v8 = NSStringFromCGRect(v12);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  CGPoint v10 = [NSString stringWithFormat:@"Alert window setFrame: %@.", v8];
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:v10];
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBAlertItemWindow;
  -[SBAlertItemWindow setBounds:](&v11, sel_setBounds_);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  v8 = NSStringFromCGRect(v12);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  CGPoint v10 = [NSString stringWithFormat:@"Alert window setBounds: %@", v8];
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:v10];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBAlertItemWindow;
  id v7 = a4;
  v8 = [(SBAlertItemWindow *)&v15 actionForLayer:v6 forKey:v7];
  int v9 = [v7 isEqualToString:@"position"];

  if (v9)
  {
    [v6 position];
    CGPoint v10 = NSStringFromCGPoint(v17);
    objc_super v11 = SBLogAlertItems();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SBOldAlertItemWindow actionForLayer:forKey:]((uint64_t)v10, v11);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
    v13 = [NSString stringWithFormat:@"Alert window set actionForLayer position changed to %@", v10];
    [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:v13];
  }
  return v8;
}

- (SBAlertLayoutPresentationVerifier)alertLayoutPresentationVerifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  return (SBAlertLayoutPresentationVerifier *)WeakRetained;
}

- (void)setAlertLayoutPresentationVerifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end