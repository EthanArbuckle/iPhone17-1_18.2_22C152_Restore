@interface _UIWeakOverlayService
- (_UIOverlayService)service;
- (_UIWeakOverlayService)initWithService:(id)a3;
- (void)performOverlayClientAction:(id)a3;
@end

@implementation _UIWeakOverlayService

- (_UIWeakOverlayService)initWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWeakOverlayService;
  v5 = [(_UIWeakOverlayService *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_service, v4);
  }

  return v6;
}

- (void)performOverlayClientAction:(id)a3
{
  p_service = &self->_service;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_service);
  [WeakRetained performOverlayClientAction:v4];
}

- (_UIOverlayService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (_UIOverlayService *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end