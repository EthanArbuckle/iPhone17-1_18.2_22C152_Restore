@interface _UISceneHostingEventDeferringClientComponent
- (BOOL)maintainHostFirstResponderWhenClientWantsKeyboard;
- (void)beginObservingNotifications;
- (void)firstResponderDidChange:(id)a3;
- (void)invalidate;
- (void)requestKeyboardFocus;
- (void)setScene:(id)a3;
- (void)stopObservingNotifications;
- (void)wantsKeyboardEvents:(id)a3;
@end

@implementation _UISceneHostingEventDeferringClientComponent

- (void)setScene:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISceneHostingEventDeferringClientComponent;
  [(FBSSceneComponent *)&v4 setScene:a3];
  [(_UISceneHostingEventDeferringClientComponent *)self beginObservingNotifications];
}

- (BOOL)maintainHostFirstResponderWhenClientWantsKeyboard
{
  v2 = [(FBSSceneComponent *)self clientScene];
  v3 = [v2 settings];
  char v4 = [v3 maintainHostFirstResponderWhenClientWantsKeyboard];

  return v4;
}

- (void)requestKeyboardFocus
{
  v5 = [[_UISceneHostingEventDeferringFocusRequestActionToHost alloc] initWithInfo:0 responder:0];
  v3 = [(FBSSceneComponent *)self scene];
  char v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  [v3 sendPrivateActions:v4];
}

- (void)beginObservingNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_wantsKeyboardEvents_ name:@"_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification" object:0];
  [v3 addObserver:self selector:sel_firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
}

- (void)stopObservingNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification" object:0];
  [v3 removeObserver:self name:@"UIWindowFirstResponderDidChangeNotification" object:0];
}

- (void)wantsKeyboardEvents:(id)a3
{
  char v4 = [a3 userInfo];
  id v13 = [v4 objectForKeyedSubscript:@"_UIRemoteKeyboardsHostedWindowUserInfoKey"];

  v5 = [v13 _windowHostingScene];
  v6 = [v5 _FBSScene];
  v7 = [v6 identityToken];
  v8 = [(FBSSceneComponent *)self clientScene];
  v9 = [v8 identityToken];
  int v10 = [v7 isEqual:v9];

  v11 = v13;
  if (v10)
  {
    v12 = [v13 firstResponder];
    if (([v12 _wantsTargetOfKeyboardEventDeferringEnvironment] & 1) != 0
      || [v12 _isHostingRemoteContent])
    {
      [(_UISceneHostingEventDeferringClientComponent *)self requestKeyboardFocus];
    }

    v11 = v13;
  }
}

- (void)firstResponderDidChange:(id)a3
{
  id v12 = [a3 object];
  char v4 = [v12 firstResponder];
  int v5 = [v4 _wantsTargetOfKeyboardEventDeferringEnvironment];

  if (v5)
  {
    v6 = [v12 _windowHostingScene];
    v7 = [v6 _FBSScene];
    v8 = [v7 identityToken];
    v9 = [(FBSSceneComponent *)self clientScene];
    int v10 = [v9 identityToken];
    int v11 = [v8 isEqual:v10];

    if (v11) {
      [(_UISceneHostingEventDeferringClientComponent *)self requestKeyboardFocus];
    }
  }
}

- (void)invalidate
{
  [(_UISceneHostingEventDeferringClientComponent *)self stopObservingNotifications];
  v3.receiver = self;
  v3.super_class = (Class)_UISceneHostingEventDeferringClientComponent;
  [(FBSSceneComponent *)&v3 invalidate];
}

@end