@interface _SBKeyboardFocusSceneControllerFactory
- (id)_dependenciesForKeyboardFocusScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5;
- (id)newKeyboardFocusSceneControllerForScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5;
@end

@implementation _SBKeyboardFocusSceneControllerFactory

- (id)_dependenciesForKeyboardFocusScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isEmbeddedScene]) {
    goto LABEL_5;
  }
  if ([v7 isContinuityScene])
  {
    v10 = off_1E6AF2250;
LABEL_6:
    v11 = (void *)[objc_alloc(*v10) initWithScene:v7 deliveryManager:v8 sceneProvider:v9];
    goto LABEL_7;
  }
  if ([v7 isExternalDisplayScene])
  {
LABEL_5:
    v10 = off_1E6AF2258;
    goto LABEL_6;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)newKeyboardFocusSceneControllerForScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [SBKeyboardFocusSceneController alloc];
  v12 = [(_SBKeyboardFocusSceneControllerFactory *)self _dependenciesForKeyboardFocusScene:v10 deliveryManager:v9 sceneProvider:v8];

  v13 = [(SBKeyboardFocusSceneController *)v11 initWithWindowScene:v10 dependencies:v12];
  return v13;
}

@end