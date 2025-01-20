@interface UIScreenshotService
- (UIScene)_scene;
- (UIScreenshotService)initWithScene:(id)a3;
- (UIScreenshotServiceDelegate)privateDelegate;
- (UIWindowScene)windowScene;
- (id)delegate;
- (void)_setScene:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setPrivateDelegate:(id)a3;
@end

@implementation UIScreenshotService

- (void)_setScene:(id)a3
{
}

- (UIScreenshotService)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIScreenshotService;
  v5 = [(UIScreenshotService *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (void)setDelegate:(id)delegate
{
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIWindowScene *)WeakRetained;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (UIScreenshotServiceDelegate)privateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);
  return (UIScreenshotServiceDelegate *)WeakRetained;
}

- (void)setPrivateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scene);
}

@end