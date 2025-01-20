@interface SBIdleTimerBase
- (BOOL)isActivated;
- (BOOL)isDisabled;
- (BOOL)isEqualToTimer:(id)a3;
- (NSHashTable)observers;
- (NSString)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_logExpirationTimeout:(double)a3;
- (void)_makeObserversPerformSelector:(SEL)a3;
- (void)addIdleTimerObserver:(id)a3;
- (void)removeAllIdleTimerObservers;
- (void)removeIdleTimerObserver:(id)a3;
- (void)setActivated:(BOOL)a3;
@end

@implementation SBIdleTimerBase

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)SBIdleTimerBase;
  return [(SBIdleTimerBase *)&v3 hash];
}

- (void)removeIdleTimerObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)addIdleTimerObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (NSString)description
{
  return (NSString *)[(SBIdleTimerBase *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIdleTimerBase *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBIdleTimerBase *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)removeAllIdleTimerObservers
{
  observers = self->_observers;
  if (observers)
  {
    self->_observers = 0;
  }
}

- (BOOL)isEqualToTimer:(id)a3
{
  return self == a3;
}

- (void)_logExpirationTimeout:(double)a3
{
}

id __41__SBIdleTimerBase__logExpirationTimeout___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"lockTimeout";
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)_makeObserversPerformSelector:(SEL)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v6 = [(NSHashTable *)self->_observers allObjects];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  SEL v27 = a2;
  char v9 = 0;
  uint64_t v10 = *(void *)v31;
  v28 = v6;
  uint64_t v29 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        Class = object_getClass(v12);
        IMP MethodImplementation = class_getMethodImplementation(Class, a3);
        if (!MethodImplementation)
        {
          v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:v27 object:self file:@"SBIdleTimerBase.m" lineNumber:134 description:@"really wanted an IMP here"];
        }
        v15 = SBLogIdleTimer();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_opt_class();
          id v17 = v16;
          NSStringFromSelector(a3);
          v19 = uint64_t v18 = v8;
          v20 = objc_opt_class();
          *(_DWORD *)buf = 138544386;
          v35 = v16;
          __int16 v36 = 2048;
          v37 = self;
          __int16 v38 = 2114;
          v39 = v19;
          __int16 v40 = 2114;
          v41 = v20;
          __int16 v42 = 2048;
          v43 = v12;
          id v21 = v20;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> sending %{public}@ to <%{public}@: %p>", buf, 0x34u);

          uint64_t v8 = v18;
          v6 = v28;
          uint64_t v10 = v29;
        }

        ((void (*)(void *, SEL, SBIdleTimerBase *))MethodImplementation)(v12, a3, self);
        char v9 = 1;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v44 count:16];
  }
  while (v8);
  if ((v9 & 1) == 0)
  {
LABEL_15:
    v23 = SBLogIdleTimer();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      id v25 = v24;
      v26 = NSStringFromSelector(a3);
      *(_DWORD *)buf = 138543874;
      v35 = v24;
      __int16 v36 = 2048;
      v37 = self;
      __int16 v38 = 2114;
      v39 = v26;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> no observers for %{public}@", buf, 0x20u);
    }
  }
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void))a4;
  observers = self->_observers;
  if (observers)
  {
    uint64_t v7 = [(NSHashTable *)observers allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v12);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

- (BOOL)isDisabled
{
  return 1;
}

- (BOOL)isActivated
{
  return 0;
}

- (void)setActivated:(BOOL)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end