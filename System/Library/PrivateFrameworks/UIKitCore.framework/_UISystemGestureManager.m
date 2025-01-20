@interface _UISystemGestureManager
+ (id)_sharedInstanceIfExists;
+ (id)sharedInstance;
+ (void)_cancelTouchesWithIdentifiers:(id)a3 forDisplayWithIdentity:(id)a4;
- (BOOL)_displayRequiresClientManagement:(id)a3;
- (BOOL)gestureRecognizersAllowedOnDisplayWithIdentity:(id)a3;
- (NSString)description;
- (_UISystemGestureManager)init;
- (id)_displayIdentityForTrackingGestureManagers:(id)a3;
- (id)_systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:(id)a3;
- (id)allowGestureRecognizersOnDisplayWithIdentity:(id)a3;
- (id)windowForSystemGesturesForDisplayWithIdentity:(id)a3;
- (void)addGestureRecognizer:(id)a3 recognitionEvent:(int64_t)a4 toDisplayWithIdentity:(id)a5;
- (void)addGestureRecognizer:(id)a3 toDisplayWithIdentity:(id)a4;
- (void)clearTransformFromDisplayWithIdentity:(id)a3;
- (void)dealloc;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)removeGestureRecognizer:(id)a3 fromDisplayWithIdentity:(id)a4;
- (void)setTransform:(CGAffineTransform *)a3 onDisplayWithIdentity:(id)a4;
@end

@implementation _UISystemGestureManager

- (id)windowForSystemGesturesForDisplayWithIdentity:(id)a3
{
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UISystemGestureManager.m" lineNumber:106 description:@"You can't get a window for system gestures without a display."];
  }
  v6 = [(_UISystemGestureManager *)self _displayIdentityForTrackingGestureManagers:a3];
  if ([(_UISystemGestureManager *)self _displayRequiresClientManagement:v6])
  {
    v7 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:v6];

    if (!v7)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 108, @"Attempting to manage gesture recognizers on an unmanaged display: %@", v6 object file lineNumber description];
    }
  }
  v8 = [(NSMutableDictionary *)self->_displayIdentityToManagerMap objectForKey:v6];
  v9 = [v8 windowForSystemGestures];

  return v9;
}

- (void)addGestureRecognizer:(id)a3 recognitionEvent:(int64_t)a4 toDisplayWithIdentity:(id)a5
{
  if (!a3)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 84, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
  }
  id v14 = [(_UISystemGestureManager *)self _displayIdentityForTrackingGestureManagers:a5];
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    v10 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:v14];

    if (!v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 86, @"Attempting to manage gesture recognizers on an unmanaged display: %@", v14 object file lineNumber description];
    }
  }
  v11 = [(_UISystemGestureManager *)self _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:v14];
  [v11 addGestureRecognizer:a3 recognitionEvent:a4];
}

- (id)_displayIdentityForTrackingGestureManagers:(id)a3
{
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    id v4 = a3;
  }
  else
  {
    id v4 = [a3 rootIdentity];
  }
  return v4;
}

- (BOOL)_displayRequiresClientManagement:(id)a3
{
  int v4 = [a3 isExternal];
  if (v4)
  {
    if ([a3 isMainDisplay] & 1) != 0 || (objc_msgSend(a3, "isCarDisplay")) {
      LOBYTE(v4) = 0;
    }
    else {
      LOBYTE(v4) = [a3 isCarInstrumentsDisplay] ^ 1;
    }
  }
  return v4;
}

- (id)_systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:(id)a3
{
  if (!a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 239, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  if (![(_UISystemGestureManager *)self _displayRequiresClientManagement:a3]
    && ([a3 isRootIdentity] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UISystemGestureManager.m" lineNumber:241 description:@"displayIdentity is not a rootIdentity"];
  }
  v6 = [(NSMutableDictionary *)self->_displayIdentityToManagerMap objectForKey:a3];
  if (!v6)
  {
    v6 = [[__UISystemGestureManager alloc] initWithDisplayIdentity:a3];
    [(NSMutableDictionary *)self->_displayIdentityToManagerMap setObject:v6 forKey:a3];
  }
  return v6;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_1077 != -1) {
    dispatch_once(&_MergedGlobals_1077, &__block_literal_global_263);
  }
  v2 = (void *)qword_1EB260C28;
  return v2;
}

- (_UISystemGestureManager)init
{
  if (([(id)UIApp isFrontBoard] & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UISystemGestureManager.m" lineNumber:56 description:@"Only FrontBoard apps may use UISystemGestureManager."];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UISystemGestureManager;
  int v4 = [(_UISystemGestureManager *)&v11 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    displayIdentityToManagerMap = v4->_displayIdentityToManagerMap;
    v4->_displayIdentityToManagerMap = (NSMutableDictionary *)v5;

    v7 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x1E4F62970]);
    displayMonitor = v4->_displayMonitor;
    v4->_displayMonitor = v7;

    [(FBSDisplayMonitor *)v4->_displayMonitor addObserver:v4];
  }
  return v4;
}

- (void)dealloc
{
  [(FBSDisplayMonitor *)self->_displayMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UISystemGestureManager;
  [(_UISystemGestureManager *)&v3 dealloc];
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UISystemGestureManager;
  objc_super v3 = [(_UISystemGestureManager *)&v6 description];
  int v4 = [v3 stringByAppendingFormat:@" - _displayIdentityToManagerMap : %@", self->_displayIdentityToManagerMap];

  return (NSString *)v4;
}

- (void)addGestureRecognizer:(id)a3 toDisplayWithIdentity:(id)a4
{
  if (!a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 76, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
  }
  id v12 = [(_UISystemGestureManager *)self _displayIdentityForTrackingGestureManagers:a4];
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    v8 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:v12];

    if (!v8)
    {
      objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 78, @"Attempting to manage gesture recognizers on an unmanaged display: %@", v12 object file lineNumber description];
    }
  }
  v9 = [(_UISystemGestureManager *)self _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:v12];
  [v9 addGestureRecognizer:a3];
}

- (void)removeGestureRecognizer:(id)a3 fromDisplayWithIdentity:(id)a4
{
  if (!a3)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 92, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_12:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 93, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_12;
  }
LABEL_3:
  id v15 = [(_UISystemGestureManager *)self _displayIdentityForTrackingGestureManagers:a4];
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    v8 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:v15];

    if (!v8)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 95, @"Attempting to manage gesture recognizers on an unmanaged display: %@", v15 object file lineNumber description];
    }
  }
  v9 = [(NSMutableDictionary *)self->_displayIdentityToManagerMap objectForKey:v15];
  [v9 removeGestureRecognizer:a3];
  v10 = [v9 gestureRecognizers];
  uint64_t v11 = [v10 count];

  if (!v11) {
    [(NSMutableDictionary *)self->_displayIdentityToManagerMap removeObjectForKey:v15];
  }
}

- (id)allowGestureRecognizersOnDisplayWithIdentity:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"_UISystemGestureManager.m" lineNumber:115 description:@"You cannot manage gesture recognizers without a display."];
  }
  objc_super v6 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:a3];
  if (v6)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 118, @"We're already tracking system gestures for this display: %@", v6 object file lineNumber description];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v7 = self->_systemShellManagedDisplayIdentityToInvalidatableMap;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v31 + 1) + 8 * i) rootIdentity];
        int v12 = [v11 isEqual:a3];

        if (v12)
        {
          v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2 object:self file:@"_UISystemGestureManager.m" lineNumber:122 description:@"We're already tracking system gestures for a display with the same rootIdentity. These assertions must be mutually exclusive."];
        }
      }
      uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  id v14 = [(_UISystemGestureManager *)self _displayIdentityForTrackingGestureManagers:a3];
  objc_initWeak(&location, self);
  id v15 = objc_alloc(MEMORY[0x1E4F4F838]);
  v16 = [NSString stringWithFormat:@"com.apple.UIKit._UISystemGestureManager.%@", v14];
  id v17 = MEMORY[0x1E4F14428];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __72___UISystemGestureManager_allowGestureRecognizersOnDisplayWithIdentity___block_invoke;
  v27[3] = &unk_1E52F0B18;
  objc_copyWeak(&v29, &location);
  id v18 = v14;
  id v28 = v18;
  v19 = (void *)[v15 initWithIdentifier:v16 forReason:@"__UISystemGestureManager.lifecycle" queue:MEMORY[0x1E4F14428] invalidationBlock:v27];

  systemShellManagedDisplayIdentityToInvalidatableMap = self->_systemShellManagedDisplayIdentityToInvalidatableMap;
  if (!systemShellManagedDisplayIdentityToInvalidatableMap)
  {
    uint64_t v21 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v23 = self->_systemShellManagedDisplayIdentityToInvalidatableMap;
    p_systemShellManagedDisplayIdentityToInvalidatableMap = &self->_systemShellManagedDisplayIdentityToInvalidatableMap;
    *p_systemShellManagedDisplayIdentityToInvalidatableMap = (NSMapTable *)v21;

    systemShellManagedDisplayIdentityToInvalidatableMap = *p_systemShellManagedDisplayIdentityToInvalidatableMap;
  }
  [(NSMapTable *)systemShellManagedDisplayIdentityToInvalidatableMap setObject:v19 forKey:v18];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v19;
}

- (BOOL)gestureRecognizersAllowedOnDisplayWithIdentity:(id)a3
{
  if (!a3)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 155, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  if (![(_UISystemGestureManager *)self _displayRequiresClientManagement:a3]) {
    return 1;
  }
  uint64_t v5 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:a3];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)setTransform:(CGAffineTransform *)a3 onDisplayWithIdentity:(id)a4
{
  if (!a4)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 162, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  uint64_t v8 = [(_UISystemGestureManager *)self _displayIdentityForTrackingGestureManagers:a4];
  if ([(_UISystemGestureManager *)self _displayRequiresClientManagement:v8])
  {
    uint64_t v9 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:v8];

    if (!v9)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 164, @"Attempting to manage gesture recognizers on an unmanaged display: %@", v8 object file lineNumber description];
    }
  }
  v10 = [(_UISystemGestureManager *)self _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:v8];
  long long v11 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v11;
  v14[2] = *(_OWORD *)&a3->tx;
  [v10 setTransform:v14];
}

- (void)clearTransformFromDisplayWithIdentity:(id)a3
{
  id v8 = [(_UISystemGestureManager *)self _displayIdentityForTrackingGestureManagers:a3];
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    uint64_t v5 = [(NSMapTable *)self->_systemShellManagedDisplayIdentityToInvalidatableMap objectForKey:v8];

    if (!v5)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"_UISystemGestureManager.m", 171, @"Attempting to manage gesture recognizers on an unmanaged display: %@", v8 object file lineNumber description];
    }
  }
  BOOL v6 = [(_UISystemGestureManager *)self _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:v8];
  [v6 clearTransform];
}

+ (void)_cancelTouchesWithIdentifiers:(id)a3 forDisplayWithIdentity:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [a1 _sharedInstanceIfExists];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 windowForSystemGesturesForDisplayWithIdentity:a4];
    if (v8)
    {
      uint64_t v9 = [(id)UIApp _touchesEventForWindow:v8];
      v10 = v9;
      if (v9)
      {
        long long v11 = [v9 _touchesForWindow:v8];
        if ([v11 count])
        {
          v22 = v10;
          v23 = v7;
          int v12 = objc_opt_new();
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v21 = v11;
          id v13 = v11;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v18, "_touchIdentifier", v21));
                int v20 = [a3 containsObject:v19];

                if (v20) {
                  [v12 addObject:v18];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
            }
            while (v15);
          }

          v10 = v22;
          [(id)UIApp _cancelTouchesOrPresses:v12 withEvent:v22];

          v7 = v23;
          long long v11 = v21;
        }
      }
    }
  }
}

+ (id)_sharedInstanceIfExists
{
  return (id)qword_1EB260C28;
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_systemShellManagedDisplayIdentityToInvalidatableMap, 0);
  objc_storeStrong((id *)&self->_displayIdentityToManagerMap, 0);
}

@end