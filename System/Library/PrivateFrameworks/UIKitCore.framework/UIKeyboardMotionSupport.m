@interface UIKeyboardMotionSupport
+ (id)supportForScreen:(id)a3;
+ (id)supportForUIScene:(id)a3;
- (BOOL)_matchingOptions:(id)a3;
- (BOOL)generateSplitNotificationForNewPlacement:(id)a3;
- (NSDictionary)_options;
- (UIScreen)_intendedScreen;
- (UISplitKeyboardSource)masterController;
- (id)_initWithCanvas:(id)a3 options:(id)a4;
- (id)_initWithScreen:(id)a3 options:(id)a4;
- (id)_intendedCanvas;
- (void)_connectController:(id)a3;
- (void)_disconnectingController:(id)a3;
- (void)setMasterController:(id)a3;
- (void)translateToPlacement:(id)a3 animated:(BOOL)a4;
- (void)translateToPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5;
@end

@implementation UIKeyboardMotionSupport

+ (id)supportForScreen:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Only subclasses of UIKeyboardMotionSupport should be instantiated"];
  }
  v6 = +[_UIObjectPerScreen objectOfClass:a1 forScreen:v4 withOptions:0 createIfNecessary:1];

  return v6;
}

+ (id)supportForUIScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Only subclasses of UIKeyboardMotionSupport should be instantiated"];
  }
  v6 = +[_UIObjectPerCanvas objectOfClass:a1 forCanvas:v4 withOptions:0 createIfNecessary:1];

  return v6;
}

- (id)_initWithScreen:(id)a3 options:(id)a4
{
  id v7 = a3;
  if (a4)
  {
    v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardMotionSupport;
    v9 = [(UIKeyboardMotionSupport *)&v12 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_screen, a3);
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (id)_initWithCanvas:(id)a3 options:(id)a4
{
  id v7 = a3;
  if (a4)
  {
    v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardMotionSupport;
    v9 = [(UIKeyboardMotionSupport *)&v12 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_canvas, a3);
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (BOOL)_matchingOptions:(id)a3
{
  return a3 == 0;
}

- (NSDictionary)_options
{
  return 0;
}

- (UIScreen)_intendedScreen
{
  return self->_screen;
}

- (id)_intendedCanvas
{
  return self->_canvas;
}

- (UISplitKeyboardSource)masterController
{
  return self->_controller;
}

- (void)_disconnectingController:(id)a3
{
  controller = self->_controller;
  self->_controller = 0;
}

- (void)_connectController:(id)a3
{
}

- (void)setMasterController:(id)a3
{
  id v4 = (UISplitKeyboardSource *)a3;
  controller = self->_controller;
  id v7 = v4;
  if (controller == v4)
  {
    [(UIKeyboardMotionSupport *)self _updatedController];
    goto LABEL_7;
  }
  v6 = v4;
  if (controller)
  {
    -[UIKeyboardMotionSupport _disconnectingController:](self, "_disconnectingController:");
    v6 = v7;
  }
  if (v6)
  {
    [(UIKeyboardMotionSupport *)self _connectController:v6];
LABEL_7:
    v6 = v7;
  }
}

- (void)translateToPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [(UIKeyboardMotionSupport *)self generateSplitNotificationForNewPlacement:v8];
  if (v8)
  {
    v10 = [(UISplitKeyboardSource *)self->_controller placement];
    v11 = [v10 assistantView];

    if (v11)
    {
      v34[0] = v8;
      objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      +[UIKeyboardImpl normalizedPersistentOffset];
      double v14 = v13;
      double v16 = v15;
      +[UIPeripheralHost floatingChromeBuffer];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      +[UIKeyboardImpl floatingWidth];
      v26 = +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v14, v16, v18, v20, v22, v24, v25);

      [v26 setSubPlacements:v12];
      id v8 = v26;
    }
  }
  v27 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__UIKeyboardMotionSupport_translateToPlacement_quietly_animated___block_invoke;
  v29[3] = &unk_1E52FD3D8;
  id v30 = v8;
  BOOL v31 = a4;
  BOOL v32 = a5;
  BOOL v33 = v9;
  id v28 = v8;
  [v27 performOnLocalDistributedControllers:v29];
}

uint64_t __65__UIKeyboardMotionSupport_translateToPlacement_quietly_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPlacement:*(void *)(a1 + 32) quietly:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41) generateSplitNotification:*(unsigned __int8 *)(a1 + 42)];
}

- (void)translateToPlacement:(id)a3 animated:(BOOL)a4
{
}

- (BOOL)generateSplitNotificationForNewPlacement:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_canvas, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end