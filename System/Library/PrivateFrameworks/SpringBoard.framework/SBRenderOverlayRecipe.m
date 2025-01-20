@interface SBRenderOverlayRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)windowSceneDidUpdate:(id)a3;
@end

@implementation SBRenderOverlayRecipe

- (id)title
{
  return @"Render Overlay Persistence";
}

- (void)windowSceneDidUpdate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_windowScene, obj);
    [(SBWindow *)self->_window setWindowScene:obj];
  }
}

- (void)handleVolumeIncrease
{
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
  v3 = [v10 view];
  v4 = [MEMORY[0x1E4F428B8] redColor];
  [v3 setBackgroundColor:v4];

  v5 = [SBWindow alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v7 = [(SBWindow *)v5 initWithWindowScene:WeakRetained role:@"SBTraitsParticipantRoleRenderOverlayRecipe" debugName:@"SBRenderOverlayRecipe"];
  window = self->_window;
  self->_window = v7;

  [(SBWindow *)self->_window setRootViewController:v10];
  [(SBWindow *)self->_window setHidden:0];
  [(SBWindow *)self->_window setLevel:100000.0];
  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] synchronize];
  dispatch_time_t v9 = dispatch_time(0, 2000000000);
  dispatch_after(v9, MEMORY[0x1E4F14428], &__block_literal_global_36);
}

void __45__SBRenderOverlayRecipe_handleVolumeIncrease__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F4F260];
  v1 = [MEMORY[0x1E4F39B60] mainDisplay];
  id v7 = [v0 descriptorWithName:@"login" display:v1];

  objc_msgSend(v7, "setInterfaceOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
  [v7 setLockBacklight:1];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4F258]) initWithDescriptor:v7];
  [v2 present];
  [v2 freeze];
  v3 = [MEMORY[0x1E4F624C8] sharedInstance];
  [v3 prepareForExitAndRelaunch:1];

  v4 = [MEMORY[0x1E4F4F398] actionWithOptions:1];
  v5 = [MEMORY[0x1E4F624D0] sharedInstance];
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [v5 sendActionsToBackBoard:v6];
}

- (void)handleVolumeDecrease
{
  v2 = (void *)MEMORY[0x1E4F4F260];
  v3 = [MEMORY[0x1E4F39B60] mainDisplay];
  id v9 = [v2 descriptorWithName:@"logout" display:v3];

  objc_msgSend(v9, "setInterfaceOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
  [v9 setLockBacklight:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4F258]) initWithDescriptor:v9];
  [v4 present];
  [v4 freeze];
  v5 = [MEMORY[0x1E4F624C8] sharedInstance];
  [v5 prepareForExitAndRelaunch:1];

  v6 = [MEMORY[0x1E4F4F398] actionWithOptions:1];
  id v7 = [MEMORY[0x1E4F624D0] sharedInstance];
  v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  [v7 sendActionsToBackBoard:v8];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_window, 0);
}

@end