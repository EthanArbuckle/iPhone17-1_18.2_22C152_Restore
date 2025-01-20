@interface _UIFocusActiveSceneObserver_Classic
- (BOOL)isActive;
- (id)_initWithScene:(id)a3;
- (id)_resolvedDisplayForWindow:(id)a3;
- (id)descriptionBuilder;
- (void)_addDeliveryObserverForWindow:(id)a3;
- (void)_fireInactiveFocusObserver:(id)a3;
- (void)_keyWindowDidChangeNotification:(id)a3;
- (void)_removeDeliverObserverForWindow:(id)a3;
- (void)_screenUUIDDidChangeNotification:(id)a3;
- (void)_windowDidAttachContext:(id)a3;
- (void)_windowDidDetachContext:(id)a3;
- (void)beginMonitoringContextChangesForWindow:(id)a3;
- (void)dealloc;
- (void)observerDeliveryPolicyDidChange:(id)a3;
- (void)stopMonitoringContextChangesForWindow:(id)a3;
@end

@implementation _UIFocusActiveSceneObserver_Classic

- (id)_initWithScene:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusActiveSceneObserver_Classic;
  v3 = [(_UIFocusActiveSceneObserver *)&v15 _initWithScene:a3];
  v4 = v3;
  if (v3)
  {
    v3[40] |= 1u;
    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v6 = (void *)v4[4];
    v4[4] = v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel__screenUUIDDidChangeNotification_ name:@"_UIScreenUniqueIdDidChangeNotification" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v4 selector:sel__keyWindowDidChangeNotification_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];

    if (qword_1EB25D308 != -1) {
      dispatch_once(&qword_1EB25D308, &__block_literal_global_58);
    }
    if (_MergedGlobals_11_5)
    {
      v9 = (void *)MEMORY[0x1E4F1CB00];
      int v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusActiveSceneObserverLoggingInterval, @"FocusActiveSceneObserverLoggingInterval", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      double v11 = *(double *)&qword_1E8FD4F78;
      if (v10) {
        double v11 = 10.0;
      }
      uint64_t v12 = [v9 scheduledTimerWithTimeInterval:v4 target:sel__fireInactiveFocusObserver_ selector:0 userInfo:1 repeats:v11];
      v13 = (void *)v4[6];
      v4[6] = v12;
    }
  }
  return v4;
}

- (void)_fireInactiveFocusObserver:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_inactiveSceneObserverTimer == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
    uint64_t v5 = [WeakRetained _focusSystemSceneComponent];
    v6 = [v5 focusSystem];

    BOOL v7 = [(_UIFocusActiveSceneObserver_Classic *)self isActive];
    if ([v6 _isEnabled])
    {
      v8 = [v6 _overrideFocusDeferralBehavior];
      if (v8)
      {
        v9 = [v6 _overrideFocusDeferralBehavior];
        uint64_t v10 = [v9 isEqual:&unk_1ED3F33D8];
      }
      else
      {
        uint64_t v10 = 1;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    double v11 = [v6 focusedItem];

    if (v7 & v10 && v11)
    {
      uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("FocusActiveSceneObserver", &qword_1EB25D310) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = [(_UIFocusStateObserver *)self description];
        int v23 = 138412290;
        v24 = v14;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Focus Active Scene Observer successfully detected focus.\n%@", (uint8_t *)&v23, 0xCu);
      }
    }
    else
    {
      objc_super v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("FocusActiveSceneObserver", &qword_1EB25D318) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = v11 != 0;
        v17 = NSNumber;
        v18 = v15;
        v19 = [v17 numberWithBool:v7];
        v20 = [NSNumber numberWithBool:v10];
        v21 = [NSNumber numberWithBool:v16];
        v22 = [(_UIFocusStateObserver *)self description];
        int v23 = 138413058;
        v24 = v19;
        __int16 v25 = 2112;
        v26 = v20;
        __int16 v27 = 2112;
        v28 = v21;
        __int16 v29 = 2112;
        v30 = v22;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "Focus Active Scene Observer failed to detect focus.\nEvent deferral active: %@, FocusSystem enabled: %@, has focused item: %@.\n%@", (uint8_t *)&v23, 0x2Au);
      }
    }
  }
  else
  {
    [a3 invalidate];
  }
}

- (void)beginMonitoringContextChangesForWindow:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_flags)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__windowDidAttachContext_ name:_UIWindowDidAttachContextNotification object:v6];

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__windowDidDetachContext_ name:_UIWindowDidDetachContextNotification object:v6];

    [(_UIFocusActiveSceneObserver_Classic *)self _addDeliveryObserverForWindow:v6];
  }
  else
  {
    [(_UIFocusStateObserver *)self notifyObserversIfNecessary];
  }
}

- (void)stopMonitoringContextChangesForWindow:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_flags)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:_UIWindowDidAttachContextNotification object:v6];

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:_UIWindowDidDetachContextNotification object:v6];

    [(_UIFocusActiveSceneObserver_Classic *)self _removeDeliverObserverForWindow:v6];
  }
  else
  {
    [(_UIFocusStateObserver *)self notifyObserversIfNecessary];
  }
}

- (void)dealloc
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v18[0] = @"_UIWindowDidBecomeApplicationKeyNotification";
  v18[1] = _UIWindowDidAttachContextNotification;
  v18[2] = _UIWindowDidDetachContextNotification;
  v18[3] = @"_UIScreenUniqueIdDidChangeNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSMapTable *)self->_hidObserverMapTable objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v9++) removeObserver:self];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  inactiveSceneObserverTimer = self->_inactiveSceneObserverTimer;
  if (inactiveSceneObserverTimer)
  {
    [(NSTimer *)inactiveSceneObserverTimer invalidate];
    double v11 = self->_inactiveSceneObserverTimer;
    self->_inactiveSceneObserverTimer = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusActiveSceneObserver_Classic;
  [(_UIFocusActiveSceneObserver_Classic *)&v12 dealloc];
}

- (BOOL)isActive
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_flags)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v4 = [(NSMapTable *)self->_hidObserverMapTable keyEnumerator];
    id v3 = (id)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v4);
          }
          uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v8 = [(NSMapTable *)self->_hidObserverMapTable objectForKey:v7];
          if ([v8 canReceiveEvents])
          {
            id v3 = v7;

            goto LABEL_13;
          }
        }
        id v3 = (id)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v3 = +[UIWindow _applicationKeyWindow];
  }
  unsigned int v9 = objc_msgSend(v3, sel_allowsWeakReference);
  if (v3) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    BOOL v13 = 0;
  }
  else
  {
    id v11 = [v3 windowScene];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
    BOOL v13 = v11 == WeakRetained;
  }
  return v13;
}

- (void)_addDeliveryObserverForWindow:(id)a3
{
  id v13 = a3;
  int v4 = [v13 _contextId];
  if (v13)
  {
    if ((*(unsigned char *)&self->_flags & 1) != 0 && v4 != 0)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F4F2A8]);
      uint64_t v7 = [v13 screen];
      uint64_t v8 = [v7 displayConfiguration];
      unsigned int v9 = [v8 hardwareIdentifier];

      BOOL v10 = [(_UIFocusActiveSceneObserver_Classic *)self _resolvedDisplayForWindow:v13];
      [v6 setDisplay:v10];

      id v11 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
      [v6 setDeferringEnvironment:v11];

      objc_super v12 = objc_msgSend(MEMORY[0x1E4F4F290], "tokenForIdentifierOfCAContext:", objc_msgSend(v13, "_contextId"));
      [v6 setDeferringToken:v12];

      [v6 addObserver:self];
      [(NSMapTable *)self->_hidObserverMapTable setObject:v6 forKey:v13];
      [(_UIFocusStateObserver *)self notifyObserversIfNecessary];
    }
  }
}

- (id)_resolvedDisplayForWindow:(id)a3
{
  id v3 = [a3 screen];
  int v4 = [v3 displayConfiguration];
  uint64_t v5 = [v4 hardwareIdentifier];

  if (v5) {
    [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v5];
  }
  else {
  id v6 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
  }

  return v6;
}

- (void)_removeDeliverObserverForWindow:(id)a3
{
  hidObserverMapTable = self->_hidObserverMapTable;
  id v5 = a3;
  id v6 = [(NSMapTable *)hidObserverMapTable objectForKey:v5];
  [v6 removeObserver:self];
  [(NSMapTable *)self->_hidObserverMapTable removeObjectForKey:v5];

  [(_UIFocusStateObserver *)self notifyObserversIfNecessary];
}

- (void)_windowDidAttachContext:(id)a3
{
  int v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v9 = v7;

  uint64_t v8 = v9;
  if (v9)
  {
    [(_UIFocusActiveSceneObserver_Classic *)self _addDeliveryObserverForWindow:v9];
    uint64_t v8 = v9;
  }
}

- (void)_windowDidDetachContext:(id)a3
{
  int v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v9 = v7;

  uint64_t v8 = v9;
  if (v9)
  {
    [(_UIFocusActiveSceneObserver_Classic *)self _removeDeliverObserverForWindow:v9];
    uint64_t v8 = v9;
  }
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___UIFocusActiveSceneObserver_Classic_observerDeliveryPolicyDidChange___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_screenUUIDDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    BOOL v10 = NSAllMapTableKeys(self->_hidObserverMapTable);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72___UIFocusActiveSceneObserver_Classic__screenUUIDDidChangeNotification___block_invoke;
    v12[3] = &unk_1E52DD450;
    id v13 = v10;
    id v14 = v9;
    long long v15 = self;
    id v16 = v4;
    id v11 = v10;
    [(_UIFocusStateObserver *)self performUpdatesAndNotifyObservers:v12];
  }
}

- (void)_keyWindowDidChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___UIFocusActiveSceneObserver_Classic__keyWindowDidChangeNotification___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (id)descriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusActiveSceneObserver_Classic;
  id v3 = [(_UIFocusStateObserver *)&v8 descriptionBuilder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
  id v5 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", @"scene", WeakRetained, (*(unsigned char *)__UILogGetCategoryCachedImpl("FocusActiveSceneObserver", &descriptionBuilder___s_category) & 1) == 0);

  id v6 = (id)[v3 appendName:@"hidObserverMapTable" object:self->_hidObserverMapTable];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveSceneObserverTimer, 0);
  objc_storeStrong((id *)&self->_hidObserverMapTable, 0);
}

@end