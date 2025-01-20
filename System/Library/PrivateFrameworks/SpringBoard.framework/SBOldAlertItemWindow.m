@interface SBOldAlertItemWindow
+ (id)_traitsArbiterOrientationActuationRole;
- (BOOL)_canBecomeKeyWindow;
- (SBAlertLayoutPresentationVerifier)alertLayoutPresentationVerifier;
- (SBOldAlertItemWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5 alertLayoutPresentationVerifier:(id)a6;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)setAlertLayoutPresentationVerifier:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation SBOldAlertItemWindow

- (SBOldAlertItemWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5 alertLayoutPresentationVerifier:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)SBOldAlertItemWindow;
  v11 = [(SBMainScreenActiveInterfaceOrientationWindow *)&v14 initWithWindowScene:a3 role:a4 debugName:a5];
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_alertLayoutPresentationVerifier, v10);
  }

  return v12;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBOldAlertItemWindow;
  long long v4 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->tx;
  [(SBOldAlertItemWindow *)&v7 setTransform:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:@"Alert window setTransform:"];
}

- (void)setCenter:(CGPoint)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBOldAlertItemWindow;
  -[SBOldAlertItemWindow setCenter:](&v5, sel_setCenter_, a3.x, a3.y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:@"Alert window setCenter:"];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBOldAlertItemWindow;
  -[SBOldAlertItemWindow setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:@"Alert window setFrame:"];
}

- (void)setBounds:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBOldAlertItemWindow;
  -[SBOldAlertItemWindow setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:@"Alert window setBounds:"];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBOldAlertItemWindow;
  id v7 = a4;
  v8 = [(SBOldAlertItemWindow *)&v15 actionForLayer:v6 forKey:v7];
  int v9 = [v7 isEqualToString:@"position"];

  if (v9)
  {
    [v6 position];
    id v10 = NSStringFromCGPoint(v17);
    v11 = SBLogAlertItems();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SBOldAlertItemWindow actionForLayer:forKey:]((uint64_t)v10, v11);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
    v13 = [NSString stringWithFormat:@"Alert window actionForLayer position changed to %@", v10];
    [WeakRetained scheduleDelayedAlertLayoutVerificationForReason:v13];
  }
  return v8;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return @"SBTraitsParticipantRoleAlert";
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

- (void)actionForLayer:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "Alert window actionForLayer position changed to %@", (uint8_t *)&v2, 0xCu);
}

@end