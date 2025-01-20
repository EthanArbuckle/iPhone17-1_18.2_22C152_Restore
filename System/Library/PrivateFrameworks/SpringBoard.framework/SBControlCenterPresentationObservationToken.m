@interface SBControlCenterPresentationObservationToken
- (SBControlCenterController)controlCenterController;
- (SBControlCenterPresentationObservationToken)initWithControlCenterController:(id)a3 scene:(id)a4;
- (int64_t)state;
- (void)dealloc;
@end

@implementation SBControlCenterPresentationObservationToken

- (SBControlCenterPresentationObservationToken)initWithControlCenterController:(id)a3 scene:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBControlCenterPresentationObservationToken;
  v8 = [(SBPresentationObservationToken *)&v13 initWithScene:a4];
  v9 = v8;
  if (v8)
  {
    p_controlCenterController = &v8->_controlCenterController;
    objc_storeStrong((id *)&v8->_controlCenterController, a3);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v9 selector:sel_willPresent name:@"SBControlCenterControllerWillPresentNotification" object:*p_controlCenterController];
    [v11 addObserver:v9 selector:sel_didPresent name:@"SBControlCenterControllerDidPresentNotification" object:*p_controlCenterController];
    [v11 addObserver:v9 selector:sel_willDismiss name:@"SBControlCenterControllerWillDismissNotification" object:*p_controlCenterController];
    [v11 addObserver:v9 selector:sel_didDismiss name:@"SBControlCenterControllerDidDismissNotification" object:*p_controlCenterController];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBControlCenterControllerWillPresentNotification" object:self->_controlCenterController];
  [v3 removeObserver:self name:@"SBControlCenterControllerDidPresentNotification" object:self->_controlCenterController];
  [v3 removeObserver:self name:@"SBControlCenterControllerWillDismissNotification" object:self->_controlCenterController];
  [v3 removeObserver:self name:@"SBControlCenterControllerDidDismissNotification" object:self->_controlCenterController];

  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterPresentationObservationToken;
  [(SBControlCenterPresentationObservationToken *)&v4 dealloc];
}

- (int64_t)state
{
  v2 = [(SBControlCenterController *)self->_controlCenterController viewController];
  unint64_t v3 = [v2 presentationState];

  if (v3 > 3) {
    return 2;
  }
  else {
    return qword_1D8FD2C70[v3];
  }
}

- (SBControlCenterController)controlCenterController
{
  return self->_controlCenterController;
}

- (void).cxx_destruct
{
}

@end