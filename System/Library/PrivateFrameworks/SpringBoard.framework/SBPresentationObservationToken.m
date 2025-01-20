@interface SBPresentationObservationToken
- (SBPresentationObservationToken)initWithScene:(id)a3;
- (SBWindowScene)windowScene;
- (id)didDismissHandler;
- (id)didPresentHandler;
- (id)willDismissHandler;
- (id)willPresentHandler;
- (int64_t)state;
- (void)didDismiss;
- (void)didPresent;
- (void)invalidate;
- (void)setDidDismissHandler:(id)a3;
- (void)setDidPresentHandler:(id)a3;
- (void)setWillDismissHandler:(id)a3;
- (void)setWillPresentHandler:(id)a3;
- (void)willDismiss;
- (void)willPresent;
@end

@implementation SBPresentationObservationToken

- (SBPresentationObservationToken)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBPresentationObservationToken;
  v5 = [(SBPresentationObservationToken *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_windowScene, v4);
  }

  return v6;
}

- (void)willPresent
{
  v3 = (void (**)(void, void))MEMORY[0x1D948C7A0](self->_willPresentHandler, a2);
  if (v3)
  {
    id v4 = v3;
    ((void (**)(void, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(void, void))v4;
  }
}

- (void)didPresent
{
  v3 = (void (**)(void, void))MEMORY[0x1D948C7A0](self->_didPresentHandler, a2);
  if (v3)
  {
    id v4 = v3;
    ((void (**)(void, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(void, void))v4;
  }
}

- (void)willDismiss
{
  v3 = (void (**)(void, void))MEMORY[0x1D948C7A0](self->_willDismissHandler, a2);
  if (v3)
  {
    id v4 = v3;
    ((void (**)(void, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(void, void))v4;
  }
}

- (void)didDismiss
{
  v3 = (void (**)(void, void))MEMORY[0x1D948C7A0](self->_didDismissHandler, a2);
  if (v3)
  {
    id v4 = v3;
    ((void (**)(void, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(void, void))v4;
  }
}

- (void)invalidate
{
  id willPresentHandler = self->_willPresentHandler;
  self->_id willPresentHandler = 0;

  id didPresentHandler = self->_didPresentHandler;
  self->_id didPresentHandler = 0;

  id willDismissHandler = self->_willDismissHandler;
  self->_id willDismissHandler = 0;

  id didDismissHandler = self->_didDismissHandler;
  self->_id didDismissHandler = 0;
}

- (int64_t)state
{
  return self->_state;
}

- (id)willPresentHandler
{
  return self->_willPresentHandler;
}

- (void)setWillPresentHandler:(id)a3
{
}

- (id)didPresentHandler
{
  return self->_didPresentHandler;
}

- (void)setDidPresentHandler:(id)a3
{
}

- (id)willDismissHandler
{
  return self->_willDismissHandler;
}

- (void)setWillDismissHandler:(id)a3
{
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_didDismissHandler, 0);
  objc_storeStrong(&self->_willDismissHandler, 0);
  objc_storeStrong(&self->_didPresentHandler, 0);
  objc_storeStrong(&self->_willPresentHandler, 0);
}

@end