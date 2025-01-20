@interface _UIKeyboardArbiterClientSpringBoard
- (BOOL)allowedToShowKeyboard;
- (BOOL)isSpotlight:(id)a3;
- (_UIKeyboardArbiterClientSpringBoard)init;
- (void)forceKeyboardAway;
- (void)preserveKeyboardWithId:(id)a3;
- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4;
- (void)restoreKeyboardWithId:(id)a3;
- (void)userSelectedApp:(id)a3 onCompletion:(id)a4;
- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5;
@end

@implementation _UIKeyboardArbiterClientSpringBoard

- (_UIKeyboardArbiterClientSpringBoard)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterClientSpringBoard;
  v2 = [(_UIKeyboardArbiterClientInputDestination *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_willLock_ name:@"_UISystemApplicationWillLockNotification" object:0];
  }
  return v2;
}

- (BOOL)allowedToShowKeyboard
{
  return 1;
}

- (void)forceKeyboardAway
{
  v3 = +[_UIKeyboardChangedInformation informationForKeyboardDown];
  v4 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  objc_super v5 = (void *)[v3 copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v4 signalKeyboardClientChanged:v5 onCompletion:v7];
}

- (BOOL)isSpotlight:(id)a3
{
  return 0;
}

- (void)preserveKeyboardWithId:(id)a3
{
  v4 = +[_UIKeyboardChangedInformation informationForKeyboardPreserve:a3];
  objc_super v5 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  id v6 = (void *)[v4 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 signalKeyboardClientChanged:v6 onCompletion:v8];
}

- (void)restoreKeyboardWithId:(id)a3
{
  v4 = +[_UIKeyboardChangedInformation informationForKeyboardRestore:a3];
  objc_super v5 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  id v6 = (void *)[v4 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 signalKeyboardClientChanged:v6 onCompletion:v8];
}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 isEqualToString:&stru_1ED0E84C0])
  {
    v11 = 0;
  }
  else
  {
    id v8 = [(_UIKeyboardArbiterClient *)self requiredScene];
    id v9 = [v8 identityToken];
    v10 = [v9 stringRepresentation];
    [(_UIKeyboardArbiterClientInputDestination *)self setFocusedSceneIdentityStringOrIdentifier:v10];

    v11 = [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];
  }
  v12 = KeyboardArbiterClientLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientSpringBoard userSelectedApp:onCompletion:]  Focus bundle: %@, focusedSceneIdentity: %@", (uint8_t *)&v14, 0x16u);
  }
  if (!v7) {
    id v7 = &__block_literal_global_80;
  }

  v13 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  [v13 applicationShouldFocusWithBundle:v6 onCompletion:v7];
}

- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 stringRepresentation];
  if (!v9)
  {
    v11 = [(_UIKeyboardArbiterClient *)self requiredScene];
    v12 = [v11 identityToken];
    v13 = [v12 stringRepresentation];
    [(_UIKeyboardArbiterClientInputDestination *)self setFocusedSceneIdentityStringOrIdentifier:v13];

    uint64_t v14 = [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];

    v10 = (void *)v14;
  }
  id v15 = KeyboardArbiterClientLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18[0] = 67109378;
    v18[1] = v6;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientSpringBoard userSelectedProcessIdentifier:withSceneIdentity:onCompletion:]  Focus PID: %d, focusedSceneIdentity: %@", (uint8_t *)v18, 0x12u);
  }
  if (!v8) {
    id v8 = &__block_literal_global_7_0;
  }

  __int16 v16 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  v17 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:v9 window:0];

  [v16 focusApplicationWithProcessIdentifier:v6 context:v17 onCompletion:v8];
}

- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4
{
  id v6 = a4;
  id v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75___UIKeyboardArbiterClientSpringBoard_queue_keyboardIAVChanged_onComplete___block_invoke;
  v9[3] = &unk_1E52DC8B0;
  double v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performAsync:v9];
}

@end