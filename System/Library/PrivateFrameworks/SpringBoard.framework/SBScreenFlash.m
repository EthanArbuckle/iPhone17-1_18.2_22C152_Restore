@interface SBScreenFlash
+ (id)mainScreenFlasher;
- (SBScreenFlash)initWithScreen:(id)a3;
- (void)_createUIWithColor:(id)a3;
- (void)_orderWindowFrontAndThenOut:(id)a3 withColor:(id)a4;
- (void)_orderWindowOut:(id)a3;
- (void)_tearDown;
- (void)flashColor:(id)a3 withCompletion:(id)a4;
- (void)flashWhiteWithCompletion:(id)a3;
@end

@implementation SBScreenFlash

- (SBScreenFlash)initWithScreen:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBScreenFlash;
  v6 = [(SBScreenFlash *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screen, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    flashCompletionBlocks = v7->_flashCompletionBlocks;
    v7->_flashCompletionBlocks = v8;
  }
  return v7;
}

+ (id)mainScreenFlasher
{
  if (mainScreenFlasher___once != -1) {
    dispatch_once(&mainScreenFlasher___once, &__block_literal_global_61);
  }
  v2 = (void *)mainScreenFlasher___sharedInstance;
  return v2;
}

void __34__SBScreenFlash_mainScreenFlasher__block_invoke()
{
  v0 = [SBScreenFlash alloc];
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v1 = [(SBScreenFlash *)v0 initWithScreen:v3];
  v2 = (void *)mainScreenFlasher___sharedInstance;
  mainScreenFlasher___sharedInstance = v1;
}

- (void)flashWhiteWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F428B8];
  id v5 = a3;
  id v6 = [v4 whiteColor];
  [(SBScreenFlash *)self flashColor:v6 withCompletion:v5];
}

- (void)flashColor:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  if (a4)
  {
    flashCompletionBlocks = self->_flashCompletionBlocks;
    v7 = (void *)[a4 copy];
    [(NSMutableArray *)flashCompletionBlocks addObject:v7];
  }
  [(SBScreenFlash *)self _orderWindowFrontAndThenOut:self withColor:v8];
}

- (void)_createUIWithColor:(id)a3
{
  if (!self->_flashWindow)
  {
    v4 = (void *)SBApp;
    id v5 = a3;
    id v6 = [v4 windowSceneManager];
    v7 = [(UIScreen *)self->_screen displayIdentity];
    id v13 = [v6 windowSceneForDisplayIdentity:v7];

    id v8 = [(SBWindow *)[SBSecureWindow alloc] initWithWindowScene:v13 role:@"SBTraitsParticipantRoleScreenFlash" debugName:@"ScreenFlash"];
    flashWindow = self->_flashWindow;
    self->_flashWindow = &v8->super.super.super;

    [(UIWindow *)self->_flashWindow setWindowLevel:*MEMORY[0x1E4F43958]];
    [(UIWindow *)self->_flashWindow setUserInteractionEnabled:0];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
    [(UIWindow *)self->_flashWindow setRootViewController:v10];
    objc_super v11 = [v10 view];
    flashView = self->_flashView;
    self->_flashView = v11;

    [(UIView *)self->_flashView setBackgroundColor:v5];
  }
}

- (void)_tearDown
{
  [(UIWindow *)self->_flashWindow setHidden:1];
  self->_windowVisible = 0;
  flashWindow = self->_flashWindow;
  self->_flashWindow = 0;

  flashView = self->_flashView;
  self->_flashView = 0;
}

- (void)_orderWindowOut:(id)a3
{
  id v4 = a3;
  flashView = self->_flashView;
  if (flashView)
  {
    [(UIView *)flashView alpha];
    if (v6 != 0.0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __33__SBScreenFlash__orderWindowOut___block_invoke;
      v8[3] = &unk_1E6AF4AC0;
      v8[4] = self;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __33__SBScreenFlash__orderWindowOut___block_invoke_2;
      v7[3] = &unk_1E6AF5350;
      v7[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:v7 completion:1.0];
    }
  }
}

uint64_t __33__SBScreenFlash__orderWindowOut___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
}

void __33__SBScreenFlash__orderWindowOut___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 24)) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    [(id)v3 _tearDown];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  id v5 = (void *)[*(id *)(v3 + 8) copy];
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  if ([v5 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_orderWindowFrontAndThenOut:(id)a3 withColor:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__orderWindowOut_ object:0];
  if (!self->_windowVisible)
  {
    if (self->_flashWindow)
    {
      [(UIView *)self->_flashView setAlpha:1.0];
      [(UIView *)self->_flashView setBackgroundColor:v5];
    }
    else
    {
      [(SBScreenFlash *)self _createUIWithColor:v5];
    }
    [(UIWindow *)self->_flashWindow _orderFrontWithoutMakingKey];
    self->_windowVisible = 1;
  }
  v7[0] = *MEMORY[0x1E4F1C4B0];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(SBScreenFlash *)self performSelector:sel__orderWindowOut_ withObject:0 afterDelay:v6 inModes:0.1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashView, 0);
  objc_storeStrong((id *)&self->_flashWindow, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_flashCompletionBlocks, 0);
}

@end