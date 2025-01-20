@interface SBAssistantWindow
+ (BOOL)sb_autorotates;
+ (id)defaultLayoutStrategy;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)allowsTouchPassThrough;
- (BOOL)isOpaque;
- (SBAssistantWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hostedSceneIdentityTokens;
- (void)_usesWindowServerHitTesting;
- (void)dealloc;
- (void)setAllowsTouchPassThrough:(BOOL)a3;
- (void)setRootViewController:(id)a3;
@end

@implementation SBAssistantWindow

+ (id)defaultLayoutStrategy
{
  return +[SBWindowDefaultLayoutStrategy noClipStrategy];
}

+ (BOOL)sb_autorotates
{
  return 0;
}

- (SBAssistantWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBAssistantWindow;
  v9 = [(SBWindow *)&v15 initWithWindowScene:v8 rootViewController:0 layoutStrategy:0 role:a4 debugName:a5];
  if (v9)
  {
    v10 = [SBAssistantRootViewController alloc];
    v11 = [v8 screen];
    v12 = [(SBAssistantRootViewController *)v10 initWithScreen:v11];
    v14.receiver = v9;
    v14.super_class = (Class)SBAssistantWindow;
    [(SBAssistantWindow *)&v14 setRootViewController:v12];

    [(SBAssistantWindow *)v9 setWindowLevel:*MEMORY[0x1E4F43CF8] + 25.0];
    [(SBAssistantWindow *)v9 setAccessibilityIdentifier:@"siri-interface-window"];
    [(SBAssistantWindow *)v9 setAllowsTouchPassThrough:0];
  }

  return v9;
}

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)SBAssistantWindow;
  [(SBAssistantWindow *)&v4 setRootViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)SBAssistantWindow;
  [(SBWindow *)&v3 dealloc];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBAssistantWindow;
  -[SBAssistantWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBAssistantWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  v10 = (SBAssistantWindow *)a5;
  if ([(SBAssistantWindow *)self allowsTouchPassThrough])
  {

    if (self == v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)SBAssistantWindow;
      v11 = -[SBAssistantWindow _hitTest:withEvent:windowServerHitTestWindow:](&v14, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, self, x, y);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBAssistantWindow;
    v11 = -[SBAssistantWindow _hitTest:withEvent:windowServerHitTestWindow:](&v13, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
  }
  return v11;
}

- (void)_usesWindowServerHitTesting
{
  if (a1) {
    return (void *)[a1 allowsTouchPassThrough];
  }
  return a1;
}

- (id)hostedSceneIdentityTokens
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__126;
  objc_super v13 = __Block_byref_object_dispose__126;
  id v14 = 0;
  v2 = [(UIWindow *)self _sbWindowScene];
  objc_super v3 = [v2 assistantController];
  int v4 = [v3 isVisible];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F62490] sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__SBAssistantWindow_hostedSceneIdentityTokens__block_invoke;
    v8[3] = &unk_1E6AF8A10;
    v8[4] = &v9;
    [v5 enumerateScenesWithBlock:v8];
  }
  if (v10[5])
  {
    v15[0] = v10[5];
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __46__SBAssistantWindow_hostedSceneIdentityTokens__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  int v5 = [v14 isActive];
  v6 = v14;
  if (v5)
  {
    v7 = [v14 settings];
    if ([v7 isForeground])
    {
      id v8 = [v14 clientProcess];
      uint64_t v9 = [v8 bundleIdentifier];
      int v10 = [v9 isEqualToString:@"com.apple.siri"];

      v6 = v14;
      if (v10)
      {
        uint64_t v11 = [v14 identityToken];
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
        objc_super v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        v6 = v14;
        *a3 = 1;
      }
    }
    else
    {

      v6 = v14;
    }
  }
}

- (BOOL)allowsTouchPassThrough
{
  v2 = [(SBAssistantWindow *)self layer];
  char v3 = [v2 hitTestsAsOpaque] ^ 1;

  return v3;
}

- (void)setAllowsTouchPassThrough:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBAssistantWindow *)self layer];
  [v4 setHitTestsAsOpaque:!v3];
}

- (void)setRootViewController:(id)a3
{
}

@end