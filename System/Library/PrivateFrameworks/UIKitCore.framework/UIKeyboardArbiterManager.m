@interface UIKeyboardArbiterManager
+ (id)arbiterClient;
+ (id)sharedArbiterManager;
- (BOOL)remoteKeyboardUndocked;
- (id)keyboardWindow;
- (void)forceKeyboardAway;
- (void)preserveKeyboardWithId:(id)a3;
- (void)restoreKeyboardWithId:(id)a3;
- (void)userSelectedApp:(id)a3 onCompletion:(id)a4;
- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5;
@end

@implementation UIKeyboardArbiterManager

+ (id)sharedArbiterManager
{
  if (qword_1EB260BD8 != -1) {
    dispatch_once(&qword_1EB260BD8, &__block_literal_global_254);
  }
  v2 = (void *)_MergedGlobals_1074;
  return v2;
}

void __48__UIKeyboardArbiterManager_sharedArbiterManager__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardArbiterManager);
  v1 = (void *)_MergedGlobals_1074;
  _MergedGlobals_1074 = (uint64_t)v0;
}

+ (id)arbiterClient
{
  if (+[UIKeyboard inputUIOOP])
  {
    v4 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:a1 file:@"UIKeyboardArbiterManager.m" lineNumber:42 description:@"arbiterClient should be _UIKeyboardArbiterClientSpringBoard"];
    }
  }
  else
  {
    v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  }
  return v4;
}

- (id)keyboardWindow
{
  if (+[UIKeyboard inputUIOOP])
  {
    v2 = 0;
  }
  else
  {
    v3 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    v2 = [v3 keyboardWindow];
  }
  return v2;
}

- (void)forceKeyboardAway
{
  id v2 = +[UIKeyboardArbiterManager arbiterClient];
  [v2 forceKeyboardAway];
}

- (void)preserveKeyboardWithId:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardArbiterManager arbiterClient];
  [v4 preserveKeyboardWithId:v3];
}

- (void)restoreKeyboardWithId:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardArbiterManager arbiterClient];
  [v4 restoreKeyboardWithId:v3];
}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIKeyboardArbiterManager arbiterClient];
  [v7 userSelectedApp:v6 onCompletion:v5];
}

- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = +[UIKeyboardArbiterManager arbiterClient];
  [v9 userSelectedProcessIdentifier:v6 withSceneIdentity:v8 onCompletion:v7];
}

- (BOOL)remoteKeyboardUndocked
{
  id v2 = +[UIKeyboardArbiterManager arbiterClient];
  char v3 = [v2 remoteKeyboardUndocked];

  return v3;
}

@end