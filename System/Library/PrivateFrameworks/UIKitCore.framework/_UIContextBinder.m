@interface _UIContextBinder
+ (id)createContextForBindable:(id)a3 withSubstrate:(id)a4;
- (BOOL)bindableEnrolled:(id)a3;
- (BOOL)bindableIsTopmostAttached:(id)a3;
- (BOOL)permitContextCreationForBindable:(id)a3;
- (NSArray)attachedBindables;
- (NSArray)enrolledBindables;
- (NSArray)enrolledUnsafeUnretainedBindables;
- (_UIContextBinder)initWithSubstrate:(id)a3;
- (_UIContextBinderContextCreationPolicyHolding)contextCreationPolicyHolder;
- (_UIContextBinding)substrate;
- (id)_attachedBindablePointersAsCopy:(BOOL)a3;
- (id)_contextForBindable:(id)a3;
- (id)_enrolledBindablePointersAsCopy:(BOOL)a3;
- (int64_t)contextManagementPolicy;
- (void)attachBindable:(id)a3;
- (void)createContextsWithTest:(id)a3 creationAction:(id)a4;
- (void)detachBindable:(id)a3;
- (void)enrollBindable:(id)a3;
- (void)expellBindable:(id)a3;
- (void)purgeContextsWithPurgeAction:(id)a3;
- (void)purgeContextsWithPurgeAction:(id)a3 afterPurgeAction:(id)a4;
- (void)recreateContextForBindable:(id)a3;
- (void)setContextCreationPolicyHolder:(id)a3;
- (void)setContextManagementPolicy:(int64_t)a3;
- (void)updateBindable:(id)a3;
- (void)updateBindableOrderWithTest:(id)a3;
- (void)updateBindableOrderWithTest:(id)a3 force:(BOOL)a4;
@end

@implementation _UIContextBinder

- (id)_attachedBindablePointersAsCopy:(BOOL)a3
{
  attachedBindables = self->_attachedBindables;
  if (a3) {
    v4 = (NSPointerArray *)[(NSPointerArray *)attachedBindables copy];
  }
  else {
    v4 = attachedBindables;
  }
  return v4;
}

- (id)_enrolledBindablePointersAsCopy:(BOOL)a3
{
  enrolledBindables = self->_enrolledBindables;
  if (a3) {
    v4 = (NSPointerArray *)[(NSPointerArray *)enrolledBindables copy];
  }
  else {
    v4 = enrolledBindables;
  }
  return v4;
}

- (NSArray)attachedBindables
{
  return [(NSPointerArray *)self->_attachedBindables allObjects];
}

- (NSArray)enrolledBindables
{
  return [(NSPointerArray *)self->_enrolledBindables allObjects];
}

- (void)detachBindable:(id)a3
{
  id v5 = a3;
  v6 = [v5 _contextBinder];

  if (v6 != self)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIContextBinder.m" lineNumber:151 description:@"Cannot detach bindable in a binder which doesn't own it"];
  }
  id v10 = v5;
  attachedBindables = self->_attachedBindables;
  if ([(NSPointerArray *)attachedBindables count])
  {
    uint64_t v8 = 0;
    while ([(NSPointerArray *)attachedBindables pointerAtIndex:v8] != v10)
    {
      if (++v8 >= [(NSPointerArray *)attachedBindables count]) {
        goto LABEL_10;
      }
    }
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSPointerArray *)attachedBindables removePointerAtIndex:v8];
      [(NSPointerArray *)attachedBindables compact];
    }
  }
LABEL_10:

  __UIContextBinderDetachContext(self, v10);
}

- (void)createContextsWithTest:(id)a3 creationAction:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, id))a4;
  [(_UIContextBinder *)self updateBindableOrderWithTest:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(_UIContextBinder *)self enrolledBindables];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        v13 = self;
        id v14 = v12;
        if ([(_UIContextBinder *)v13 permitContextCreationForBindable:v14])
        {
          v15 = [(_UIContextBinder *)v13 _contextForBindable:v14];
          [(NSMutableOrderedSet *)self->_contexts removeObject:v15];
          [(NSMutableOrderedSet *)self->_contexts addObject:v15];
        }
        if (v6) {
          v6[2](v6, v14);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)updateBindableOrderWithTest:(id)a3
{
}

- (void)setContextManagementPolicy:(int64_t)a3
{
  self->_contextManagementPolicy = a3;
  if (a3 == 1)
  {
    [(_UIContextBinder *)self updateBindableOrderWithTest:0 force:1];
  }
  else if (!a3)
  {
    -[_UIContextBinder purgeContextsWithPurgeAction:](self, "purgeContextsWithPurgeAction:");
    [(_UIContextBinder *)self createContextsWithTest:0 creationAction:0];
  }
}

- (void)setContextCreationPolicyHolder:(id)a3
{
}

- (void)purgeContextsWithPurgeAction:(id)a3 afterPurgeAction:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, id))a3;
  v7 = (void (**)(void))a4;
  if (![(_UIContextBinder *)self contextManagementPolicy])
  {
    long long v16 = v7;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(_UIContextBinder *)self enrolledBindables];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v17 + 1) + 8 * i);
          attachedBindables = self->_attachedBindables;
          if ([(NSPointerArray *)attachedBindables count])
          {
            uint64_t v15 = 0;
            while ([(NSPointerArray *)attachedBindables pointerAtIndex:v15] != v13)
            {
              if (++v15 >= [(NSPointerArray *)attachedBindables count]) {
                goto LABEL_11;
              }
            }

            __UIContextBinderDetachContext(self, v13);
          }
          else
          {
LABEL_11:
          }
          __UIContextBinderDisposeContextForBindable(self, v13, 0);
          if (v6) {
            v6[2](v6, v13);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    v7 = v16;
    if (v16) {
      v16[2](v16);
    }
  }
}

- (void)purgeContextsWithPurgeAction:(id)a3
{
}

- (_UIContextBinder)initWithSubstrate:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIContextBinder;
  v6 = [(_UIContextBinder *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_substrate, a3);
    uint64_t v8 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    enrolledBindables = v7->_enrolledBindables;
    v7->_enrolledBindables = (NSPointerArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28F50] pointerArrayWithOptions:2];
    enrolledUnsafeUnretainedBindables = v7->_enrolledUnsafeUnretainedBindables;
    v7->_enrolledUnsafeUnretainedBindables = (NSPointerArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    attachedBindables = v7->_attachedBindables;
    v7->_attachedBindables = (NSPointerArray *)v12;

    uint64_t v14 = objc_opt_new();
    contexts = v7->_contexts;
    v7->_contexts = (NSMutableOrderedSet *)v14;
  }
  return v7;
}

- (void)enrollBindable:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _contextBinder];
  v6 = v5;
  if (v5 != self)
  {
    [(_UIContextBinder *)v5 expellBindable:v4];
    [(NSPointerArray *)self->_enrolledBindables addPointer:v4];
    [(NSPointerArray *)self->_enrolledUnsafeUnretainedBindables addPointer:v4];
    [v4 _setContextBinder:self];
    if (v4)
    {
      [v4 _bindingDescription];
      if (v10)
      {
        v7 = self;
        id v8 = v4;
        if ([(_UIContextBinder *)v7 permitContextCreationForBindable:v8])
        {
          uint64_t v9 = [(_UIContextBinder *)v7 _contextForBindable:v8];
          [(NSMutableOrderedSet *)v7->_contexts removeObject:v9];
          [(NSMutableOrderedSet *)v7->_contexts addObject:v9];
        }
      }
    }
  }
}

- (void)updateBindableOrderWithTest:(id)a3 force:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v6 = (unsigned int (**)(id, void))a3;
  if (a4 || [(_UIContextBinder *)self contextManagementPolicy] != 1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = [(_UIContextBinder *)self attachedBindables];
    id v8 = [v7 reverseObjectEnumerator];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v9) {
      goto LABEL_26;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        if (!v6 || v6[2](v6, *(void *)(*((void *)&v21 + 1) + 8 * v12)))
        {
          [MEMORY[0x1E4F39CF8] begin];
          uint64_t v14 = self;
          id v15 = v13;
          BOOL v16 = [(_UIContextBinder *)v14 permitContextCreationForBindable:v15];
          if (v16)
          {
            objc_super v17 = [(_UIContextBinder *)v14 _contextForBindable:v15];
            [(NSMutableOrderedSet *)self->_contexts removeObject:v17];
            [(NSMutableOrderedSet *)self->_contexts addObject:v17];

            if (v17)
            {
              __UIContextBinderAttachContext(v14, v15);
              uint64_t v14 = [v15 _boundContext];
              if (v15)
              {
                [v15 _bindingDescription];
                if (v20)
                {
                  [(_UIContextBinder *)v14 orderAbove:0];
                  LODWORD(v15) = 1;
                  goto LABEL_17;
                }
LABEL_16:
                LODWORD(v15) = 0;
              }
              else
              {
                char v20 = 0;
              }
LABEL_17:
              char v18 = !v16;
            }
            else
            {
              LODWORD(v15) = 0;
              char v18 = 1;
            }
            [MEMORY[0x1E4F39CF8] commit];
            if ((v18 & 1) == 0 && v15) {
              [MEMORY[0x1E4F39CF8] synchronize];
            }
            goto LABEL_21;
          }

          goto LABEL_16;
        }
LABEL_21:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v19 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v10 = v19;
      if (!v19)
      {
LABEL_26:

        break;
      }
    }
  }
}

- (BOOL)permitContextCreationForBindable:(id)a3
{
  id v4 = a3;
  [(NSPointerArray *)self->_enrolledBindables compact];
  if ([(NSPointerArray *)self->_enrolledBindables count])
  {
    if ([(_UIContextBinder *)self contextManagementPolicy] == 1)
    {
      char v5 = 1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_contextCreationPolicyHolder);
      if (v4) {
        [v4 _bindingDescription];
      }
      else {
        memset(v8, 0, sizeof(v8));
      }
      char v5 = [WeakRetained _permitContextCreationForBindingDescription:v8];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)contextManagementPolicy
{
  return self->_contextManagementPolicy;
}

- (void)attachBindable:(id)a3
{
  id v5 = a3;
  v6 = [v5 _contextBinder];

  if (v6 != self)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIContextBinder.m" lineNumber:142 description:@"Cannot attach bindable in a binder which doesn't own it"];
  }
  v7 = self;
  id v8 = v5;
  attachedBindables = v7->_attachedBindables;
  if ([(NSPointerArray *)attachedBindables count])
  {
    uint64_t v10 = 0;
    while ([(NSPointerArray *)attachedBindables pointerAtIndex:v10] != v8)
    {
      if (++v10 >= [(NSPointerArray *)attachedBindables count]) {
        goto LABEL_10;
      }
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSPointerArray *)attachedBindables removePointerAtIndex:v10];
      [(NSPointerArray *)attachedBindables compact];
    }
  }
LABEL_10:
  [(NSPointerArray *)v7->_attachedBindables insertPointer:v8 atIndex:0];

  __UIContextBinderDetachContext(v7, v8);
  uint64_t v11 = v7;
  id v14 = v8;
  if (objc_msgSend(v11, "permitContextCreationForBindable:"))
  {
    uint64_t v12 = [v11 _contextForBindable:v14];
    [v11[4] removeObject:v12];
    [v11[4] addObject:v12];

    if (v12) {
      __UIContextBinderAttachContext(v11, v14);
    }
  }
  else
  {
  }
}

- (_UIContextBinding)substrate
{
  return self->_substrate;
}

- (id)_contextForBindable:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 _boundContext];
  if (!v5)
  {
    v6 = objc_opt_class();
    v7 = [(_UIContextBinder *)self substrate];
    id v5 = [v6 createContextForBindable:v4 withSubstrate:v7];

    [v4 _setBoundContext:v5];
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("ContextCreation", &_contextForBindable____s_category) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        int v11 = 138412802;
        uint64_t v12 = v5;
        __int16 v13 = 1024;
        int v14 = [v5 contextId];
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Created CAContext: %@; contextId: 0x%X; bindable: %@",
          (uint8_t *)&v11,
          0x1Cu);
      }
    }
  }

  return v5;
}

+ (id)createContextForBindable:(id)a3 withSubstrate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    [v5 _bindingDescription];
  }
  v7 = objc_opt_new();
  id v8 = +[UIScreen _screenWithFBSDisplayIdentity:0];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = NSNumber;
    int v11 = [v8 displayIdentity];
    uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "displayID"));
    [v7 setObject:v12 forKey:*MEMORY[0x1E4F39E58]];
  }
  __int16 v13 = [NSNumber numberWithBool:0];
  [v7 setObject:v13 forKey:*MEMORY[0x1E4F39E68]];

  int v14 = [v5 _contextOptionsWithInitialOptions:v7];
  __int16 v15 = (void *)[v14 mutableCopy];

  id v16 = __UIKIT_IS_REQUESTING_A_CACONTEXT_FROM_COREANIMATION(0, v15);
  [v16 setCommitPriority:100];
  if (v5)
  {
    [v5 _bindableLevel];
    *(float *)&double v17 = v17;
    [v16 setLevel:v17];
    char v18 = [v5 _bindingLayer];
    [v16 setLayer:v18];
  }
  return v16;
}

- (BOOL)bindableIsTopmostAttached:(id)a3
{
  id v4 = a3;
  attachedBindables = self->_attachedBindables;
  if ([(NSPointerArray *)attachedBindables count])
  {
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(NSPointerArray *)attachedBindables pointerAtIndex:v6];
      if (v8)
      {
        if ((id)v8 == v4)
        {
          BOOL v9 = v7 == 0;
          goto LABEL_9;
        }
        ++v7;
      }
      ++v6;
    }
    while (v6 < [(NSPointerArray *)attachedBindables count]);
  }
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (void)updateBindable:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 _contextBinder];

  if (v6 != self)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIContextBinder.m" lineNumber:157 description:@"Cannot update bindable in a binder which doesn't own it"];
  }
  id v10 = v5;
  attachedBindables = self->_attachedBindables;
  if ([(NSPointerArray *)attachedBindables count])
  {
    uint64_t v8 = 0;
    while ([(NSPointerArray *)attachedBindables pointerAtIndex:v8] != v10)
    {
      if (++v8 >= [(NSPointerArray *)attachedBindables count]) {
        goto LABEL_7;
      }
    }

    __UIContextBinderAttachContext(self, v10);
  }
  else
  {
LABEL_7:
  }
}

- (void)expellBindable:(id)a3
{
  id v11 = a3;
  id v5 = [v11 _contextBinder];

  if (v5 != self)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UIContextBinder.m" lineNumber:133 description:@"Cannot expell bindable from a binder which doesn't own it"];
  }
  [(_UIContextBinder *)self detachBindable:v11];
  __UIContextBinderDisposeContextForBindable(self, v11, 1);
  enrolledBindables = self->_enrolledBindables;
  if ([(NSPointerArray *)enrolledBindables count])
  {
    uint64_t v7 = 0;
    while ([(NSPointerArray *)enrolledBindables pointerAtIndex:v7] != v11)
    {
      if (++v7 >= [(NSPointerArray *)enrolledBindables count]) {
        goto LABEL_10;
      }
    }
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSPointerArray *)enrolledBindables removePointerAtIndex:v7];
      [(NSPointerArray *)enrolledBindables compact];
    }
  }
LABEL_10:
  enrolledUnsafeUnretainedBindables = self->_enrolledUnsafeUnretainedBindables;
  if ([(NSPointerArray *)enrolledUnsafeUnretainedBindables count])
  {
    uint64_t v9 = 0;
    while ([(NSPointerArray *)enrolledUnsafeUnretainedBindables pointerAtIndex:v9] != v11)
    {
      if (++v9 >= [(NSPointerArray *)enrolledUnsafeUnretainedBindables count]) {
        goto LABEL_17;
      }
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSPointerArray *)enrolledUnsafeUnretainedBindables removePointerAtIndex:v9];
      [(NSPointerArray *)enrolledUnsafeUnretainedBindables compact];
    }
  }
LABEL_17:
  [v11 _setContextBinder:0];
}

- (NSArray)enrolledUnsafeUnretainedBindables
{
  return [(NSPointerArray *)self->_enrolledUnsafeUnretainedBindables allObjects];
}

- (BOOL)bindableEnrolled:(id)a3
{
  id v4 = a3;
  enrolledBindables = self->_enrolledBindables;
  if ([(NSPointerArray *)enrolledBindables count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(NSPointerArray *)enrolledBindables pointerAtIndex:v6];
      BOOL v8 = v7 == (void)v4;
      if ((id)v7 == v4) {
        break;
      }
      ++v6;
    }
    while (v6 < [(NSPointerArray *)enrolledBindables count]);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)recreateContextForBindable:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(_UIContextBinder *)self bindableEnrolled:v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = v9;
    attachedBindables = self->_attachedBindables;
    if ([(NSPointerArray *)attachedBindables count])
    {
      uint64_t v8 = 0;
      while ([(NSPointerArray *)attachedBindables pointerAtIndex:v8] != v6)
      {
        if (++v8 >= [(NSPointerArray *)attachedBindables count]) {
          goto LABEL_6;
        }
      }

      __UIContextBinderDetachContext(self, v6);
      __UIContextBinderDisposeContextForBindable(self, v6, 1);
      [(_UIContextBinder *)self updateBindableOrderWithTest:0 force:1];
    }
    else
    {
LABEL_6:
    }
    id v5 = v9;
  }
}

- (_UIContextBinderContextCreationPolicyHolding)contextCreationPolicyHolder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextCreationPolicyHolder);
  return (_UIContextBinderContextCreationPolicyHolding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextCreationPolicyHolder);
  objc_storeStrong((id *)&self->_substrate, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_attachedBindables, 0);
  objc_storeStrong((id *)&self->_enrolledUnsafeUnretainedBindables, 0);
  objc_storeStrong((id *)&self->_enrolledBindables, 0);
}

@end