@interface _UISceneKeyboardProxyLayerForwardingManager
+ (BOOL)isRootSystemShellProcess;
+ (id)new;
+ (id)sharedInstance;
- (NSString)debugDescription;
- (_UISceneKeyboardProxyLayerForwardingManager)init;
- (id)_init;
- (id)_newStateMachineWithPresentationEnvironment:(id)a3;
- (id)_stateMachineForPresentationEnvironment:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_updateKeyboardLayersForPresentationEnvironment:(id)a3;
- (void)presentationEnvironmentDidInvalidate:(id)a3;
- (void)trackPresentationEnvironment:(id)a3;
@end

@implementation _UISceneKeyboardProxyLayerForwardingManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___UISceneKeyboardProxyLayerForwardingManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25F388 != -1) {
    dispatch_once(&qword_1EB25F388, block);
  }
  v2 = (void *)qword_1EB25F380;
  return v2;
}

- (void)trackPresentationEnvironment:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8 = v4;
    if (![(id)objc_opt_class() isRootSystemShellProcess]
      || (v5 = [(id)objc_opt_class() forwardsLayersToRootSystemShell], id v4 = v8, v5))
    {
      v6 = [(NSMapTable *)self->_mapEnvironmentToKeyboardForwardingStateMachine objectForKey:v8];

      id v4 = v8;
      if (!v6)
      {
        [v8 addObserver:self];
        id v7 = [(_UISceneKeyboardProxyLayerForwardingManager *)self _newStateMachineWithPresentationEnvironment:v8];
        [(NSMapTable *)self->_mapEnvironmentToKeyboardForwardingStateMachine setObject:v7 forKey:v8];
        [(_UISceneKeyboardProxyLayerForwardingManager *)self _updateKeyboardLayersForPresentationEnvironment:v8];

        id v4 = v8;
      }
    }
  }
}

+ (BOOL)isRootSystemShellProcess
{
  if (qword_1EB25F390 != -1) {
    dispatch_once(&qword_1EB25F390, &__block_literal_global_75);
  }
  return _MergedGlobals_973;
}

- (_UISceneKeyboardProxyLayerForwardingManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingManager.m" lineNumber:28 description:@"-[_UISceneKeyboardProxyLayerForwardingManager init] is unavailable."];

  return (_UISceneKeyboardProxyLayerForwardingManager *)[(_UISceneKeyboardProxyLayerForwardingManager *)self _init];
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"_UISceneKeyboardProxyLayerForwardingManager.m" lineNumber:33 description:@"+[_UISceneKeyboardProxyLayerForwardingManager new] is unavailable."];

  id v5 = objc_alloc((Class)a1);
  return (id)[v5 _init];
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)_UISceneKeyboardProxyLayerForwardingManager;
  v2 = [(_UISceneKeyboardProxyLayerForwardingManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:10];
    mapEnvironmentToKeyboardForwardingStateMachine = v2->_mapEnvironmentToKeyboardForwardingStateMachine;
    v2->_mapEnvironmentToKeyboardForwardingStateMachine = (NSMapTable *)v3;
  }
  return v2;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UISceneKeyboardProxyLayerForwardingManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UISceneKeyboardProxyLayerForwardingManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UISceneKeyboardProxyLayerForwardingManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(_UISceneKeyboardProxyLayerForwardingManager *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_mapEnvironmentToKeyboardForwardingStateMachine withName:@"presentationEnvironmentToStateMachineMap"];
  return v4;
}

- (void)presentationEnvironmentDidInvalidate:(id)a3
{
  id v5 = a3;
  id v4 = [(_UISceneKeyboardProxyLayerForwardingManager *)self _stateMachineForPresentationEnvironment:v5];
  [v4 noteKeyboardLayersBeingTracked:0];

  [(NSMapTable *)self->_mapEnvironmentToKeyboardForwardingStateMachine removeObjectForKey:v5];
  [v5 removeObserver:self];
}

- (id)_newStateMachineWithPresentationEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = [[_UISceneKeyboardProxyLayerForwardingStateMachine alloc] initWithPresentationEnvironment:v3];

  return v4;
}

- (id)_stateMachineForPresentationEnvironment:(id)a3
{
  return [(NSMapTable *)self->_mapEnvironmentToKeyboardForwardingStateMachine objectForKey:a3];
}

- (void)_updateKeyboardLayersForPresentationEnvironment:(id)a3
{
  mapEnvironmentToKeyboardForwardingStateMachine = self->_mapEnvironmentToKeyboardForwardingStateMachine;
  id v4 = a3;
  id v6 = [(NSMapTable *)mapEnvironmentToKeyboardForwardingStateMachine objectForKey:v4];
  id v5 = [v4 keyboardLayers];

  [v6 noteKeyboardLayersBeingTracked:v5];
}

- (void).cxx_destruct
{
}

@end