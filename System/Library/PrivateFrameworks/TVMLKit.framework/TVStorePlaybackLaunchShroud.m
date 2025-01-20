@interface TVStorePlaybackLaunchShroud
+ (id)sharedShroud;
- (BOOL)isHidden;
- (TVStorePlaybackLaunchShroud)init;
- (UIWindow)window;
- (void)_hideWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_showWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)fadeOut;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation TVStorePlaybackLaunchShroud

+ (id)sharedShroud
{
  if (sharedShroud_onceToken != -1) {
    dispatch_once(&sharedShroud_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)sharedShroud_sharedShroud;
  return v2;
}

uint64_t __43__TVStorePlaybackLaunchShroud_sharedShroud__block_invoke()
{
  v0 = objc_alloc_init(TVStorePlaybackLaunchShroud);
  uint64_t v1 = sharedShroud_sharedShroud;
  sharedShroud_sharedShroud = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (TVStorePlaybackLaunchShroud)init
{
  v12.receiver = self;
  v12.super_class = (Class)TVStorePlaybackLaunchShroud;
  v2 = [(TVStorePlaybackLaunchShroud *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_hidden = 1;
    v4 = [TVStorePlaybackLaunchShroudWindow alloc];
    v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 bounds];
    v6 = -[TVStorePlaybackLaunchShroudWindow initWithFrame:](v4, "initWithFrame:");

    v7 = [MEMORY[0x263F1C550] blackColor];
    [(TVStorePlaybackLaunchShroudWindow *)v6 setBackgroundColor:v7];

    [(TVStorePlaybackLaunchShroudWindow *)v6 setWindowLevel:*MEMORY[0x263F1D810]];
    id v8 = objc_alloc_init(MEMORY[0x263F1CB68]);
    v9 = [v8 view];
    v10 = [MEMORY[0x263F1C550] blackColor];
    [v9 setBackgroundColor:v10];

    [(TVStorePlaybackLaunchShroudWindow *)v6 setRootViewController:v8];
    [(TVStorePlaybackLaunchShroud *)v3 setWindow:v6];
  }
  return v3;
}

- (void)_showWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  +[TVStorePlaybackLaunchShroud cancelPreviousPerformRequestsWithTarget:self selector:sel_fadeOut object:0];
  v7 = [(TVStorePlaybackLaunchShroud *)self window];
  id v8 = v7;
  if (v4)
  {
    [v7 setAlpha:0.0];
    [v8 setHidden:0];
    v9 = (void *)MEMORY[0x263F1CB60];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke;
    v15[3] = &unk_264BA69A0;
    id v16 = v8;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    objc_super v12 = __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke_2;
    v13 = &unk_264BA70C0;
    v14 = v6;
    [v9 animateWithDuration:0x10000 delay:v15 options:&v10 animations:0.3 completion:0.0];
  }
  else
  {
    [v7 setHidden:0];
    if (v6) {
      v6[2](v6);
    }
  }
  -[TVStorePlaybackLaunchShroud performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_fadeOut, 0, 10.0, v10, v11, v12, v13);
}

uint64_t __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_hideWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  +[TVStorePlaybackLaunchShroud cancelPreviousPerformRequestsWithTarget:self selector:sel_fadeOut object:0];
  v7 = [(TVStorePlaybackLaunchShroud *)self window];
  id v8 = v7;
  if (v4)
  {
    v9 = (void *)MEMORY[0x263F1CB60];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke;
    v13[3] = &unk_264BA69A0;
    id v14 = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_264BA7200;
    id v11 = v14;
    objc_super v12 = v6;
    [v9 animateWithDuration:0x20000 delay:v13 options:v10 animations:0.3 completion:0.0];
  }
  else
  {
    [v7 setHidden:1];
    if (v6) {
      v6[2](v6);
    }
  }
}

uint64_t __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)fadeOut
{
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = v8;
  if (self->_hidden != v6)
  {
    self->_hidden = v6;
    id v10 = v8;
    if (v6) {
      id v8 = (id)[(TVStorePlaybackLaunchShroud *)self _hideWithFadeAnimation:v5 withCompletionHandler:v8];
    }
    else {
      id v8 = (id)[(TVStorePlaybackLaunchShroud *)self _showWithFadeAnimation:v5 withCompletionHandler:v8];
    }
    id v9 = v10;
  }
  MEMORY[0x270F9A758](v8, v9);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end