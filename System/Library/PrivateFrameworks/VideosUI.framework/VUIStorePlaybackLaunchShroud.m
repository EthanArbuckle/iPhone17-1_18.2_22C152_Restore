@interface VUIStorePlaybackLaunchShroud
+ (id)sharedShroud;
- (BOOL)isHidden;
- (UIWindow)window;
- (VUIStorePlaybackLaunchShroud)init;
- (void)_hideWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_showWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)fadeOut;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation VUIStorePlaybackLaunchShroud

+ (id)sharedShroud
{
  if (sharedShroud_onceToken != -1) {
    dispatch_once(&sharedShroud_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedShroud_sharedShroud;
  return v2;
}

void __44__VUIStorePlaybackLaunchShroud_sharedShroud__block_invoke()
{
  v0 = objc_alloc_init(VUIStorePlaybackLaunchShroud);
  v1 = (void *)sharedShroud_sharedShroud;
  sharedShroud_sharedShroud = (uint64_t)v0;
}

- (VUIStorePlaybackLaunchShroud)init
{
  v12.receiver = self;
  v12.super_class = (Class)VUIStorePlaybackLaunchShroud;
  v2 = [(VUIStorePlaybackLaunchShroud *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_hidden = 1;
    v4 = [VUIStorePlaybackLaunchShroudWindow alloc];
    v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 bounds];
    v6 = -[VUIStorePlaybackLaunchShroudWindow initWithFrame:](v4, "initWithFrame:");

    v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUIStorePlaybackLaunchShroudWindow *)v6 setBackgroundColor:v7];

    [(VUIStorePlaybackLaunchShroudWindow *)v6 setWindowLevel:*MEMORY[0x1E4FB3108]];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    v9 = [v8 view];
    v10 = [MEMORY[0x1E4FB1618] blackColor];
    [v9 setBackgroundColor:v10];

    [(VUIStorePlaybackLaunchShroudWindow *)v6 setRootViewController:v8];
    [(VUIStorePlaybackLaunchShroud *)v3 setWindow:v6];
  }
  return v3;
}

- (void)_showWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  +[VUIStorePlaybackLaunchShroud cancelPreviousPerformRequestsWithTarget:self selector:sel_fadeOut object:0];
  v7 = [(VUIStorePlaybackLaunchShroud *)self window];
  id v8 = v7;
  if (v4)
  {
    [v7 setAlpha:0.0];
    [v8 setHidden:0];
    v9 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__VUIStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E6DF3D58;
    id v16 = v8;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    objc_super v12 = __77__VUIStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke_2;
    v13 = &unk_1E6DF3D80;
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
  -[VUIStorePlaybackLaunchShroud performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_fadeOut, 0, 10.0, v10, v11, v12, v13);
}

uint64_t __77__VUIStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __77__VUIStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke_2(uint64_t a1)
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
  +[VUIStorePlaybackLaunchShroud cancelPreviousPerformRequestsWithTarget:self selector:sel_fadeOut object:0];
  v7 = [(VUIStorePlaybackLaunchShroud *)self window];
  id v8 = v7;
  if (v4)
  {
    v9 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__VUIStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E6DF3D58;
    id v14 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__VUIStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E6DF3DA8;
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

uint64_t __77__VUIStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __77__VUIStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke_2(uint64_t a1)
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
  v9 = v8;
  if (self->_hidden != v6)
  {
    self->_hidden = v6;
    id v10 = v8;
    if (v6) {
      [(VUIStorePlaybackLaunchShroud *)self _hideWithFadeAnimation:v5 withCompletionHandler:v8];
    }
    else {
      [(VUIStorePlaybackLaunchShroud *)self _showWithFadeAnimation:v5 withCompletionHandler:v8];
    }
    v9 = v10;
  }
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