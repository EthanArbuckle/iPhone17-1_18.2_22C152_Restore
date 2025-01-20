@interface _UIViewServiceSessionActivityRecord
+ (_UIViewServiceSessionActivityRecord)activityRecordForProvider:(uint64_t)a3 userInterfaceIdiom:;
- (NSString)debugDescription;
- (_UIViewServiceSessionActivityRecord)init;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)associateHostedWindow:(uint64_t)a1;
- (void)disassociateHostedWindow:(uint64_t)a1;
- (void)invalidate;
@end

@implementation _UIViewServiceSessionActivityRecord

+ (_UIViewServiceSessionActivityRecord)activityRecordForProvider:(uint64_t)a3 userInterfaceIdiom:
{
  uint64_t v5 = self;
  if (_NSIsNSObject())
  {
    int v6 = objc_msgSend(a2, "__isKindOfUIViewController");
    BOOL v7 = 1;
    if (a2 && v6) {
      BOOL v7 = (a2[192] & 0x80) == 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  if (a2 && v7)
  {
    uint64_t v8 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(a3);
    int IsPrimary = _UIActiveViewServiceSessionProviderIsPrimary(a2);
    v10 = [a2 _sessionIdentifier];
    v11 = _UIViewServiceSessionActivityRecordsByUUID();
    v12 = _UIViewServiceSessionActivityRecordsByUUID();
    v13 = [v12 objectForKey:v10];

    if (!v13 && IsPrimary)
    {
      v14 = a2;
      v13 = [_UIViewServiceSessionActivityRecord alloc];
      if (v13)
      {
        v15 = [v14 _primaryHostedWindow];
        if (!v15)
        {
          v28 = [MEMORY[0x1E4F28B00] currentHandler];
          [v28 handleFailureInMethod:sel__initWithPrimaryActivityProvider_userInterfaceIdiom_, v13, @"_UIActiveViewServiceSessionTracker.m", 238, @"Invalid parameter not satisfying: %@", @"primaryHostedWindow" object file lineNumber description];
        }
        v29.receiver = v13;
        v29.super_class = (Class)_UIViewServiceSessionActivityRecord;
        v16 = objc_msgSendSuper2(&v29, sel_init);
        id v17 = v16;
        if (v16)
        {
          v16[16] = 0;
          uint64_t v18 = [v14 _sessionIdentifier];
          v19 = (void *)*((void *)v17 + 7);
          *((void *)v17 + 7) = v18;

          *((void *)v17 + 8) = v8;
          objc_storeWeak((id *)v17 + 9, v15);
          uint64_t v20 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
          v21 = (void *)*((void *)v17 + 1);
          *((void *)v17 + 1) = v20;

          v22 = (void *)*((void *)v17 + 1);
          id WeakRetained = objc_loadWeakRetained((id *)v17 + 9);
          [v22 addObject:WeakRetained];

          objc_storeWeak((id *)v17 + 4, v14);
        }
        v13 = (_UIViewServiceSessionActivityRecord *)v17;
      }
      [v11 setObject:v13 forKey:v10];
      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 postNotificationName:@"_UIViewServiceSessionWasCreatedNotification" object:v13];
    }
    v25 = v13;

    v26 = v25;
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [(_UIViewServiceSessionActivityRecord *)v25 handleFailureInMethod:sel_activityRecordForProvider_userInterfaceIdiom_, v5, @"_UIActiveViewServiceSessionTracker.m", 206, @"Attempting to obtain a view service session activity record with an invalid provider: %@", a2 object file lineNumber description];
    v26 = 0;
  }

  return v26;
}

- (_UIViewServiceSessionActivityRecord)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIActiveViewServiceSessionTracker.m", 229, @"%s: init is not allowed on %@", "-[_UIViewServiceSessionActivityRecord init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(unsigned char *)(a1 + 16) = 1;
    v2 = (id *)(a1 + 24);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &_removeViewServiceSessionActivityRecord____s_category)+ 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = v4;
        int v6 = [(id)a1 succinctDescription];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Removing session: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = (void *)WeakRetained[1];
      v9 = [NSNumber numberWithInteger:v7];
      v10 = [v8 objectForKey:v9];

      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v16 = __78___UIActiveViewServiceSessionTracker__removeViewServiceSessionActivityRecord___block_invoke;
      id v17 = &unk_1E52D9F98;
      id v18 = v10;
      uint64_t v19 = a1;
      v11 = v10;
      -[_UIActiveViewServiceSessionTracker _notifyChangeOfTopEvaluatedObjectIfNeededForIdiom:withSortedActivityRecords:mutatedByBlock:]((uint64_t)WeakRetained, v7, v11, (uint64_t)&buf);
    }
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"_UIViewServiceSessionDidInvalidateNotification" object:a1];

    _UIViewServiceSessionActivityRecordsByUUID();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v14 removeObjectForKey:*(void *)(a1 + 56)];
    objc_storeWeak(v2, 0);
    objc_storeWeak((id *)(a1 + 72), 0);
    v13 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    objc_storeWeak((id *)(a1 + 32), 0);
  }
}

- (void)associateHostedWindow:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      int v4 = [a2 _isHostedInAnotherProcess];
      BOOL v5 = (a2[12] & 0x1000) == 0;
    }
    else
    {
      int v4 = 0;
      BOOL v5 = 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    int v6 = _UIViewServiceSessionActivityRecordsByUUID();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * v10);
          v12 = _UIViewServiceSessionActivityRecordsByUUID();
          v13 = [v12 objectForKey:v11];

          if (v13) {
            id WeakRetained = objc_loadWeakRetained(v13 + 9);
          }
          else {
            id WeakRetained = 0;
          }

          if (WeakRetained == a2)
          {

            int v19 = 1;
            goto LABEL_23;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [v6 countByEnumeratingWithState:&v32 objects:v46 count:16];
        uint64_t v8 = v15;
      }
      while (v15);
    }

    if (v4 & v5)
    {
      if ([*(id *)(a1 + 8) containsObject:a2]) {
        return;
      }
      [*(id *)(a1 + 8) addObject:a2];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &qword_1EB25EF80);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v25 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          if (a2)
          {
            v26 = NSString;
            v27 = a2;
            v28 = (objc_class *)objc_opt_class();
            objc_super v29 = NSStringFromClass(v28);
            v30 = [v26 stringWithFormat:@"<%@: %p>", v29, v27, (void)v32];
          }
          else
          {
            v30 = @"(nil)";
          }
          uint64_t v31 = *(void *)(a1 + 56);
          *(_DWORD *)long long buf = 138412546;
          v39 = v30;
          __int16 v40 = 2112;
          *(void *)v41 = v31;
          _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Associating hosted window: %@; with sessionIdentifier: %@",
            buf,
            0x16u);
        }
      }
      v36 = @"_UIViewServiceSessionAssociatedNonPrimaryWindowKey";
      v37 = a2;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [(__CFString *)v18 postNotificationName:@"_UIViewServiceSessionDidAssociateNonPrimaryHostedWindowNotification" object:a1 userInfo:v17];
    }
    else
    {
      int v19 = 0;
LABEL_23:
      id v17 = *(id *)(__UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &_MergedGlobals_941)+ 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      if (a2)
      {
        uint64_t v20 = NSString;
        v21 = a2;
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        id v18 = [v20 stringWithFormat:@"<%@: %p>", v23, v21, (void)v32];
      }
      else
      {
        id v18 = @"(nil)";
      }
      uint64_t v24 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138413314;
      v39 = v18;
      __int16 v40 = 1024;
      *(_DWORD *)v41 = v4;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v5;
      __int16 v42 = 1024;
      int v43 = v19;
      __int16 v44 = 2112;
      uint64_t v45 = v24;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Attempting to associate invalid window: %@; isHosted: %d; isNotDeallocating: %d; isPrimaryHostedWindowElsewhere:"
        " %d; sessionIdentifier: %@",
        buf,
        0x28u);
    }

LABEL_29:
  }
}

- (void)disassociateHostedWindow:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v4 = _UIViewServiceSessionActivityRecordsByUUID();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v30;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v8);
          uint64_t v10 = _UIViewServiceSessionActivityRecordsByUUID();
          uint64_t v11 = [v10 objectForKey:v9];

          if (v11) {
            id WeakRetained = objc_loadWeakRetained(v11 + 9);
          }
          else {
            id WeakRetained = 0;
          }

          if (WeakRetained == a2)
          {

            uint64_t v15 = *(id *)(__UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &qword_1EB25EF88)+ 8);
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              goto LABEL_23;
            }
            if (a2)
            {
              id v17 = NSString;
              id v18 = a2;
              int v19 = (objc_class *)objc_opt_class();
              uint64_t v20 = NSStringFromClass(v19);
              v16 = [v17 stringWithFormat:@"<%@: %p>", v20, v18, (void)v29];
            }
            else
            {
              v16 = @"(nil)";
            }
            uint64_t v21 = *(void *)(a1 + 56);
            *(_DWORD *)long long buf = 138412802;
            v36 = v16;
            __int16 v37 = 1024;
            LODWORD(v38[0]) = 1;
            WORD2(v38[0]) = 2112;
            *(void *)((char *)v38 + 6) = v21;
            _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Attempting to disassociate invalid window: %@; isPrimaryHostedWindow: %d; sessionIdentifier: %@",
              buf,
              0x1Cu);
            goto LABEL_22;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v13 = [v4 countByEnumeratingWithState:&v29 objects:v39 count:16];
        uint64_t v6 = v13;
        if (v13) {
          continue;
        }
        break;
      }
    }

    if ([*(id *)(a1 + 8) containsObject:a2])
    {
      [*(id *)(a1 + 8) removeObject:a2];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &qword_1EB25EF90);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v22 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          if (a2)
          {
            v23 = NSString;
            id v24 = a2;
            v25 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v25);
            v27 = [v23 stringWithFormat:@"<%@: %p>", v26, v24, (void)v29];
          }
          else
          {
            v27 = @"(nil)";
          }
          uint64_t v28 = *(void *)(a1 + 56);
          *(_DWORD *)long long buf = 138412546;
          v36 = v27;
          __int16 v37 = 2112;
          v38[0] = v28;
          _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Disassociating hosted window: %@; from sessionIdentifier: %@",
            buf,
            0x16u);
        }
      }
      long long v33 = @"_UIViewServiceSessionAssociatedNonPrimaryWindowKey";
      id v34 = a2;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [(__CFString *)v16 postNotificationName:@"_UIViewServiceSessionDidDisassociateNonPrimaryHostedWindowNotification" object:a1 userInfo:v15];
LABEL_22:

LABEL_23:
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIViewServiceSessionActivityRecord *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIViewServiceSessionActivityRecord *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  int v4 = [(NSUUID *)self->_sessionIdentifier UUIDString];
  id v5 = (id)[v3 appendObject:v4 withName:@"sessionIdentifier"];

  id v6 = objc_loadWeakRetained((id *)&self->_tracker);
  if (v6)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 stringWithFormat:@"<%@: %p>", v9, v6];
  }
  else
  {
    uint64_t v10 = @"(nil)";
  }

  id v11 = (id)[v3 appendObject:v10 withName:@"tracker"];
  id v12 = objc_loadWeakRetained((id *)&self->_primaryHostedWindow);
  if (v12)
  {
    uint64_t v13 = NSString;
    id v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
  }
  else
  {
    v16 = @"(nil)";
  }

  id v17 = (id)[v3 appendObject:v16 withName:@"primaryHostedWindow"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIViewServiceSessionActivityRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  int v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIViewServiceSessionActivityRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  int v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v6 = [(NSUUID *)self->_sessionIdentifier UUIDString];
  id v7 = (id)[v5 appendObject:v6 withName:@"sessionIdentifier"];

  [v5 setActiveMultilinePrefix:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E52D9F98;
  id v8 = v5;
  id v13 = v8;
  id v14 = self;
  id v9 = (id)[v8 modifyBody:v12];
  id v10 = v8;

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryHostedWindow);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_lastActivityProvider);
  objc_destroyWeak((id *)&self->_tracker);
  objc_storeStrong((id *)&self->_associatedHostedWindows, 0);
}

@end