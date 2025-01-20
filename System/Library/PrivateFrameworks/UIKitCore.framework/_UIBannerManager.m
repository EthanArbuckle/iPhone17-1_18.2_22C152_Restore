@interface _UIBannerManager
- (UIScene)_scene;
- (UIWindowScene)windowScene;
- (_UIBannerContainerView)containerView;
- (_UIBannerManager)initWithScene:(id)a3;
- (_UIBannerWindow)window;
- (id)bannerWithContent:(id)a3;
- (void)_createWindowIfNeeded;
- (void)_setScene:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setWindow:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation _UIBannerManager

- (_UIBannerManager)initWithScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBannerManager;
  id v3 = a3;
  v4 = [(_UIBannerManager *)&v6 init];
  -[_UIBannerManager _setScene:](v4, "_setScene:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)_setScene:(id)a3
{
  v5 = (UIWindowScene *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"_UIBannerManager.m", 131, @"Invalid parameter not satisfying: %@", @"scene == nil || [scene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
    }
  }
  windowScene = self->_windowScene;
  self->_windowScene = v5;
}

- (UIScene)_scene
{
  return (UIScene *)self->_windowScene;
}

- (void)_createWindowIfNeeded
{
  if (!self->_window)
  {
    id v3 = objc_alloc_init(_UIBannerWindow);
    window = self->_window;
    self->_window = v3;

    [(UIWindow *)self->_window setWindowScene:self->_windowScene];
    v5 = [_UIBannerContainerView alloc];
    objc_super v6 = -[_UIBannerContainerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    containerView = self->_containerView;
    self->_containerView = v6;

    [(UIView *)self->_containerView setPreservesSuperviewLayoutMargins:1];
    v8 = self->_containerView;
    v9 = [(UIWindow *)self->_window rootViewController];
    [v9 setView:v8];

    [(UIWindow *)self->_window setHidden:0];
    [(UIView *)self->_window bounds];
    v10 = self->_containerView;
    -[UIView setFrame:](v10, "setFrame:");
  }
}

- (id)bannerWithContent:(id)a3
{
  id v4 = a3;
  [(_UIBannerManager *)self _createWindowIfNeeded];
  v5 = objc_alloc_init(_UIBanner);
  [(_UIBanner *)v5 setContent:v4];

  [(_UIBanner *)v5 setManager:self];
  return v5;
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
}

- (_UIBannerWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (_UIBannerContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

@end