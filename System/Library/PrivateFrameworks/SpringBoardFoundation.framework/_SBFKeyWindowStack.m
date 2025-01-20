@interface _SBFKeyWindowStack
+ (_SBFKeyWindowStack)sharedInstance;
- (BOOL)_isWindowEligibleForKeyness:(id)a3;
- (BOOL)pushKeyWindow:(id)a3;
- (NSString)description;
- (_SBFKeyWindowStack)init;
- (id)_evaluateForNewKeyWindowWithReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)expectedKeyWindow;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_keyWindowDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)noteWindowDeallocated:(id)a3;
- (void)noteWindowHidden:(id)a3;
- (void)noteWindowUnhidden:(id)a3;
- (void)popKeyWindow:(id)a3;
- (void)popKeyWindow:(id)a3 reason:(id)a4;
@end

@implementation _SBFKeyWindowStack

- (BOOL)_isWindowEligibleForKeyness:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 canBecomeKeyWindow]) {
    int v5 = [v4 _isEffectivelyHiddenForKeyWindowStack] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_evaluateForNewKeyWindowWithReason:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v5 = [(NSMutableOrderedSet *)self->_windowStack reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = [*(id *)(*((void *)&v19 + 1) + 8 * v9) object];
      if ([(_SBFKeyWindowStack *)self _isWindowEligibleForKeyness:v10]) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  if (self->_expectedKeyWindow != v10)
  {
    v11 = SBLogKeyWindow();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [MEMORY[0x1E4F4F718] descriptionForObject:v10];
      *(_DWORD *)buf = 138543618;
      id v24 = v12;
      __int16 v25 = 2114;
      id v26 = v4;
      _os_log_impl(&dword_18B52E000, v11, OS_LOG_TYPE_DEFAULT, "Evaluate: making new window key: %{public}@, for reason: %{public}@ ", buf, 0x16u);
    }
    [(SBFWindow *)self->_expectedKeyWindow _resignKeyFromKeyWindowStack];
    self->_expectedKeyWindow = v10;
LABEL_18:
    [(SBFWindow *)v10 _makeKeyFromKeyWindowStack];
    goto LABEL_19;
  }
  v13 = [MEMORY[0x1E4F42738] sharedApplication];
  v14 = [v13 keyWindow];

  v15 = SBLogKeyWindow();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 != v10)
  {
    if (v16)
    {
      v17 = [MEMORY[0x1E4F4F718] descriptionForObject:v10];
      *(_DWORD *)buf = 138543618;
      id v24 = v17;
      __int16 v25 = 2114;
      id v26 = v4;
      _os_log_impl(&dword_18B52E000, v15, OS_LOG_TYPE_DEFAULT, "Evaluate: making new window key: %{public}@ from nonSBF window, for reason: %{public}@ ", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v4;
    _os_log_impl(&dword_18B52E000, v15, OS_LOG_TYPE_DEFAULT, "Evaluate: no change - reason: %{public}@ ", buf, 0xCu);
  }

LABEL_19:
  return v10;
}

- (BOOL)pushKeyWindow:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = (SBFWindow *)a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_SBFKeyWindowStack.m", 103, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  uint64_t v6 = +[_SBWindowReference referenceForObject:v5];
  uint64_t v7 = SBLogKeyWindow();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [MEMORY[0x1E4F4F718] descriptionForObject:v5];
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "Push: %{public}@", buf, 0xCu);
  }
  [(NSMutableOrderedSet *)self->_windowStack removeObject:v6];
  [(NSMutableOrderedSet *)self->_windowStack addObject:v6];
  id v9 = [(_SBFKeyWindowStack *)self _evaluateForNewKeyWindowWithReason:@"push"];
  BOOL v10 = self->_expectedKeyWindow == v5;

  return v10;
}

- (void)noteWindowUnhidden:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_SBFKeyWindowStack.m", 162, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  windowStack = self->_windowStack;
  uint64_t v6 = +[_SBWindowReference referenceForObject:v12];
  LODWORD(windowStack) = [(NSMutableOrderedSet *)windowStack containsObject:v6];

  if (windowStack)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [MEMORY[0x1E4F4F718] descriptionForObject:v12];
    id v9 = [v7 stringWithFormat:@"Window unhidden: %@", v8];
    id v10 = [(_SBFKeyWindowStack *)self _evaluateForNewKeyWindowWithReason:v9];
  }
}

- (void)_keyWindowDidChangeNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = SBLogKeyWindow();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x1E4F4F718] descriptionForObject:v3];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_18B52E000, v4, OS_LOG_TYPE_DEFAULT, "A window that wasn't a SB owned window became key: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (_SBFKeyWindowStack)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_36);
  }
  v2 = (void *)sharedInstance___instance_0;
  return (_SBFKeyWindowStack *)v2;
}

- (_SBFKeyWindowStack)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SBFKeyWindowStack;
  v2 = [(_SBFKeyWindowStack *)&v7 init];
  if (v2)
  {
    id v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    windowStack = v2->_windowStack;
    v2->_windowStack = v3;

    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__keyWindowDidChangeNotification_ name:*MEMORY[0x1E4F43EF0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_SBFKeyWindowStack;
  [(_SBFKeyWindowStack *)&v4 dealloc];
}

- (id)expectedKeyWindow
{
  BSDispatchQueueAssertMain();
  expectedKeyWindow = self->_expectedKeyWindow;
  return expectedKeyWindow;
}

- (void)popKeyWindow:(id)a3
{
}

- (void)popKeyWindow:(id)a3 reason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v7 = (SBFWindow *)a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_SBFKeyWindowStack.m", 125, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"_SBFKeyWindowStack.m", 126, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  BSDispatchQueueAssertMain();
  id v10 = +[_SBWindowReference referenceForObject:v7];
  if ([(NSMutableOrderedSet *)self->_windowStack containsObject:v10])
  {
    expectedKeyWindow = self->_expectedKeyWindow;
    id v12 = SBLogKeyWindow();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (expectedKeyWindow == v7) {
        v13 = @"YES";
      }
      else {
        v13 = @"NO";
      }
      v14 = [MEMORY[0x1E4F4F718] descriptionForObject:v7];
      *(_DWORD *)buf = 138543874;
      long long v19 = v13;
      __int16 v20 = 2114;
      long long v21 = v9;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_18B52E000, v12, OS_LOG_TYPE_DEFAULT, "Pop (wasKey=%{public}@, reason=%{public}@): %@", buf, 0x20u);
    }
    [(NSMutableOrderedSet *)self->_windowStack removeObject:v10];
    if (expectedKeyWindow == v7)
    {
      [(SBFWindow *)self->_expectedKeyWindow _resignKeyFromKeyWindowStack];
      self->_expectedKeyWindow = 0;
      id v15 = [(_SBFKeyWindowStack *)self _evaluateForNewKeyWindowWithReason:@"popped window was key"];
    }
  }
}

- (void)noteWindowDeallocated:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_SBFKeyWindowStack.m", 146, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  [(_SBFKeyWindowStack *)self popKeyWindow:v6 reason:@"window deallocated"];
}

- (void)noteWindowHidden:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_SBFKeyWindowStack.m", 153, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  if ([v10 isKeyWindow])
  {
    int v5 = NSString;
    id v6 = [MEMORY[0x1E4F4F718] descriptionForObject:v10];
    objc_super v7 = [v5 stringWithFormat:@"Window hidden: %@", v6];
    id v8 = [(_SBFKeyWindowStack *)self _evaluateForNewKeyWindowWithReason:v7];
  }
}

- (NSString)description
{
  return (NSString *)[(_SBFKeyWindowStack *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBFKeyWindowStack *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_SBFKeyWindowStack *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  int v5 = [(_SBFKeyWindowStack *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60___SBFKeyWindowStack_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E548CBA0;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (void).cxx_destruct
{
}

@end