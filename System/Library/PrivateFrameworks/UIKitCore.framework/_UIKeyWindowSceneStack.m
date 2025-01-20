@interface _UIKeyWindowSceneStack
- (NSString)debugDescription;
- (_UIKeyWindowSceneStack)init;
- (id)_initWithName:(char)a3 affectsApplicationKeyWindow:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyWindowSceneInStack;
- (id)keyWindowSceneInStackPassingTest:(uint64_t)a1;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:(void *)a3 forReason:;
- (void)_sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:(void *)a3 forReason:;
- (void)migrateFromEvaluationStrategy:(uint64_t)a3 toEvaluationStrategy:(uint64_t)a4 windowScenesPassingTest:;
- (void)pushWindowScene:(uint64_t)a3 withEvaluationStrategy:(void *)a4 forReason:;
- (void)removeWindowScene:(void *)a3 forReason:;
@end

@implementation _UIKeyWindowSceneStack

- (id)keyWindowSceneInStack
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)pushWindowScene:(uint64_t)a3 withEvaluationStrategy:(void *)a4 forReason:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1 && ([a2 _hasInvalidated] & 1) == 0)
  {
    if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE40))
    {
      uint64_t v16 = [*(id *)(a1 + 40) UTF8String];
      v17 = (objc_class *)objc_opt_class();
      Name = class_getName(v17);
      v19 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(a2);
      _NSStringFromUIKeyWindowEvaluationStrategy(a3);
      id v20 = objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 UTF8String];

      uint64_t v22 = [a4 UTF8String];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE48);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v24 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v25 = *(unsigned char *)(a1 + 32) & 1;
          *(_DWORD *)v26 = 136448002;
          *(void *)&v26[4] = v16;
          *(_WORD *)&v26[12] = 2050;
          *(void *)&v26[14] = a1;
          __int16 v27 = 1026;
          int v28 = v25;
          __int16 v29 = 2082;
          v30 = Name;
          __int16 v31 = 2050;
          v32 = a2;
          __int16 v33 = 2082;
          v34 = v19;
          __int16 v35 = 2082;
          uint64_t v36 = v21;
          __int16 v37 = 2082;
          uint64_t v38 = v22;
          _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Push window scene on stack affectingApplicationKeyWindow: %{public}d; %{public"
            "}s: %{public}p; scene identity: %{public}s; for evaluation strategy: %{public}s; reason: %{public}s",
            v26,
            0x4Eu);
        }
      }
    }
    if (!*(void *)(a1 + 8))
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:1];
      v9 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v8;
    }
    if (!*(void *)(a1 + 16))
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:1];
      v11 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v10;
    }
    uint64_t v12 = [*(id *)(a1 + 8) objectForKey:a2];
    if (v12)
    {
      v13 = (void *)v12;
      *(void *)(v12 + 24) = mach_absolute_time();
      [*(id *)(a1 + 16) removeObject:v13];
    }
    else
    {
      v14 = [_UIWindowSceneStackRecord alloc];
      if (v14)
      {
        *(void *)v26 = v14;
        *(void *)&v26[8] = _UIWindowSceneStackRecord;
        id v15 = objc_msgSendSuper2((objc_super *)v26, sel_init);
        v13 = v15;
        if (v15)
        {
          objc_storeStrong((id *)v15 + 1, a2);
          v13[2] = a3;
          v13[3] = mach_absolute_time();
        }
      }
      else
      {
        v13 = 0;
      }
      [*(id *)(a1 + 8) setObject:v13 forKey:a2];
    }
    [*(id *)(a1 + 16) addObject:v13];
    -[_UIKeyWindowSceneStack _sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](a1, 0, a4);
  }
}

- (void)_sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:(void *)a3 forReason:
{
  if ((unint64_t)[*(id *)(a1 + 8) count] >= 2)
  {
    v6 = *(void **)(a1 + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __99___UIKeyWindowSceneStack__sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke;
    v7[3] = &unk_1E52DA3C0;
    v7[4] = a1;
    [v6 sortWithOptions:16 usingComparator:v7];
  }
  -[_UIKeyWindowSceneStack _evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](a1, a2, a3);
}

- (void)_evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:(void *)a3 forReason:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([*(id *)(a1 + 8) count])
    {
      if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE70))
      {
        uint64_t v10 = [*(id *)(a1 + 40) UTF8String];
        v11 = *(void **)(a1 + 24);
        if (v11)
        {
          uint64_t v12 = (objc_class *)objc_opt_class();
          Name = class_getName(v12);
          v11 = *(void **)(a1 + 24);
        }
        else
        {
          Name = "(nil)";
        }
        v18 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v11);
        uint64_t v19 = [a3 UTF8String];
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE78);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v21 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int v22 = *(unsigned char *)(a1 + 32) & 1;
            uint64_t v23 = *(void *)(a1 + 24);
            *(_DWORD *)buf = 136447746;
            uint64_t v38 = v10;
            __int16 v39 = 2050;
            uint64_t v40 = a1;
            __int16 v41 = 1026;
            int v42 = v22;
            __int16 v43 = 2082;
            v44 = Name;
            __int16 v45 = 2050;
            uint64_t v46 = v23;
            __int16 v47 = 2082;
            v48 = v18;
            __int16 v49 = 2082;
            uint64_t v50 = v19;
            _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Evaluating key window scene in stack affectingApplicationKeyWindow: %{public}d; current: %{public}s: %{public}p; current scene identity: %{public}s; reason: %{public}s",
              buf,
              0x44u);
          }
        }
      }
      if (a2) {
        v6 = 0;
      }
      else {
        v6 = *(void **)(a1 + 24);
      }
      id v7 = v6;
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__4;
      __int16 v35 = __Block_byref_object_dispose__4;
      id v36 = 0;
      uint64_t v8 = *(void **)(a1 + 16);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __92___UIKeyWindowSceneStack__evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke;
      v30[3] = &unk_1E52DA3E8;
      v30[4] = &v31;
      [v8 enumerateObjectsWithOptions:2 usingBlock:v30];
      uint64_t v9 = v32[5];
      if (!v9) {
        uint64_t v9 = (uint64_t)v7;
      }
      *(void *)(a1 + 24) = v9;
      if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE80))
      {
        uint64_t v14 = [*(id *)(a1 + 40) UTF8String];
        id v15 = *(void **)(a1 + 24);
        if (v15)
        {
          uint64_t v16 = (objc_class *)objc_opt_class();
          v17 = class_getName(v16);
          id v15 = *(void **)(a1 + 24);
        }
        else
        {
          v17 = "(nil)";
        }
        v24 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v15);
        uint64_t v25 = [a3 UTF8String];
        unint64_t v26 = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE88);
        if (*(unsigned char *)v26)
        {
          __int16 v27 = *(NSObject **)(v26 + 8);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            int v28 = *(unsigned char *)(a1 + 32) & 1;
            uint64_t v29 = *(void *)(a1 + 24);
            *(_DWORD *)buf = 136447746;
            uint64_t v38 = v14;
            __int16 v39 = 2050;
            uint64_t v40 = a1;
            __int16 v41 = 1026;
            int v42 = v28;
            __int16 v43 = 2082;
            v44 = v17;
            __int16 v45 = 2050;
            uint64_t v46 = v29;
            __int16 v47 = 2082;
            v48 = v24;
            __int16 v49 = 2082;
            uint64_t v50 = v25;
            _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Evaluated key window scene in stack affectingApplicationKeyWindow: %{public}d; new: %{public}s: %{public}p; new scene identity: %{public}s; reason: %{public}s",
              buf,
              0x44u);
          }
        }
      }
      _Block_object_dispose(&v31, 8);
    }
    else
    {
      *(void *)(a1 + 24) = 0;
    }
  }
}

- (id)_initWithName:(char)a3 affectsApplicationKeyWindow:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)_UIKeyWindowSceneStack;
  v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 5, a2);
    *((unsigned char *)v6 + 32) = (_BYTE)v6[4] & 0xFE | a3;
    if (_UIApplicationMayVendViews()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)v6 + 32) = (_BYTE)v6[4] & 0xFD | v7;
  }
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIKeyWindowSceneStack *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (void)migrateFromEvaluationStrategy:(uint64_t)a3 toEvaluationStrategy:(uint64_t)a4 windowScenesPassingTest:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v8 = [*(id *)(a1 + 40) UTF8String];
    _NSStringFromUIKeyWindowEvaluationStrategy(a2);
    id v9 = objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 UTF8String];

    _NSStringFromUIKeyWindowEvaluationStrategy(a3);
    id v11 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 UTF8String];

    if ([*(id *)(a1 + 8) count])
    {
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE68) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v30 = v8;
        __int16 v31 = 2050;
        uint64_t v32 = a1;
        __int16 v33 = 2082;
        uint64_t v34 = v10;
        __int16 v35 = 2082;
        uint64_t v36 = v12;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Stack[%{public}s] %{public}p: Migrate scenes from %{public}s -> %{public}s", buf, 0x2Au);
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v14 = NSAllMapTableValues(*(NSMapTable **)(a1 + 8));
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v18);
            if (!a4)
            {
              if (!v19) {
                goto LABEL_20;
              }
LABEL_19:
              *(void *)(v19 + 16) = a3;
              goto LABEL_20;
            }
            if (v19) {
              uint64_t v20 = *(void *)(v19 + 8);
            }
            else {
              uint64_t v20 = 0;
            }
            if ((*(unsigned int (**)(uint64_t, uint64_t))(a4 + 16))(a4, v20)) {
              BOOL v21 = v19 == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (!v21) {
              goto LABEL_19;
            }
LABEL_20:
            ++v18;
          }
          while (v16 != v18);
          uint64_t v22 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          uint64_t v16 = v22;
        }
        while (v22);
      }
    }
    else
    {
      uint64_t v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE60) + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v30 = v8;
        __int16 v31 = 2050;
        uint64_t v32 = a1;
        __int16 v33 = 2082;
        uint64_t v34 = v10;
        __int16 v35 = 2082;
        uint64_t v36 = v12;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "Stack[%{public}s] %{public}p: Taking no further action for migration from %{public}s -> %{public}s as there are no scenes", buf, 0x2Au);
      }
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  id v6 = (id)[v5 appendObject:self->_name withName:@"name"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E52D9F98;
  id v7 = v5;
  id v12 = v7;
  v13 = self;
  id v8 = (id)[v7 modifyBody:v11];
  id v9 = v7;

  return v9;
}

- (_UIKeyWindowSceneStack)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIKeyWindowSceneStack.m" lineNumber:173 description:@"init is not allowed on _UIKeyWindowSceneStack"];

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIKeyWindowSceneStack *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIKeyWindowSceneStack *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name"];
  id v5 = (id)[v3 appendBool:*(unsigned char *)&self->_sceneStackFlags & 1 withName:@"affectsApplicationKeyWindow"];
  id v6 = (id)[v3 appendBool:(*(unsigned char *)&self->_sceneStackFlags >> 1) & 1 withName:@"hasViewServiceEntitlement"];
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMapTable count](self->_recordsByWindowScene, "count"), @"windowSceneRecords.count");
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIKeyWindowSceneStack *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)removeWindowScene:(void *)a3 forReason:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v6 = [*(id *)(a1 + 8) objectForKey:a2];
    if (v6)
    {
      if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE50))
      {
        uint64_t v7 = [*(id *)(a1 + 40) UTF8String];
        id v8 = (objc_class *)objc_opt_class();
        Name = class_getName(v8);
        uint64_t v10 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(a2);
        uint64_t v11 = [a3 UTF8String];
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25EE58);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          v13 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            int v14 = *(unsigned char *)(a1 + 32) & 1;
            int v15 = 136447746;
            uint64_t v16 = v7;
            __int16 v17 = 2050;
            uint64_t v18 = a1;
            __int16 v19 = 1026;
            int v20 = v14;
            __int16 v21 = 2082;
            uint64_t v22 = Name;
            __int16 v23 = 2050;
            long long v24 = a2;
            __int16 v25 = 2082;
            long long v26 = v10;
            __int16 v27 = 2082;
            uint64_t v28 = v11;
            _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Remove window scene from stack affectingApplicationKeyWindow: %{public}d;  %"
              "{public}s: %{public}p: scene identity: %{public}s; reason: %{public}s",
              (uint8_t *)&v15,
              0x44u);
          }
        }
      }
      [*(id *)(a1 + 8) removeObjectForKey:a2];
      [*(id *)(a1 + 16) removeObject:v6];
      -[_UIKeyWindowSceneStack _sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](a1, 1, a3);
    }
  }
}

- (id)keyWindowSceneInStackPassingTest:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_keyWindowSceneInStackPassingTest_, a1, @"_UIKeyWindowSceneStack.m", 536, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];
    }
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__4;
    v13 = __Block_byref_object_dispose__4;
    id v14 = 0;
    id v4 = *(void **)(a1 + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59___UIKeyWindowSceneStack_keyWindowSceneInStackPassingTest___block_invoke;
    v8[3] = &unk_1E52DA410;
    v8[4] = a2;
    v8[5] = &v9;
    [v4 enumerateObjectsWithOptions:2 usingBlock:v8];
    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_orderedRecords, 0);
  objc_storeStrong((id *)&self->_recordsByWindowScene, 0);
}

@end