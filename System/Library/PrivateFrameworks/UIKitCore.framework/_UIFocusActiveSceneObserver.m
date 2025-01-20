@interface _UIFocusActiveSceneObserver
- (_UIFocusActiveSceneObserver)init;
- (_UIFocusActiveSceneObserver)initWithScene:(id)a3;
- (id)_initWithScene:(id)a3;
@end

@implementation _UIFocusActiveSceneObserver

- (_UIFocusActiveSceneObserver)init
{
  return [(_UIFocusActiveSceneObserver *)self initWithScene:0];
}

- (_UIFocusActiveSceneObserver)initWithScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIFocusActiveSceneObserver.m", 94, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusModernSceneObserver, @"FocusModernSceneObserver", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB256E8C)&& (_UISceneSystemShellManagesKeyboardFocusForScene(v5))
  {
    v6 = off_1E52D5710;
  }
  else
  {
    v6 = off_1E52D5708;
  }
  v7 = (_UIFocusActiveSceneObserver *)[objc_alloc(*v6) _initWithScene:v5];

  return v7;
}

- (id)_initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusActiveSceneObserver;
  id v5 = [(_UIFocusStateObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end