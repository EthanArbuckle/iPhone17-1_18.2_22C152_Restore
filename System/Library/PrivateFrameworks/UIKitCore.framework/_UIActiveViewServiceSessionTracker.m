@interface _UIActiveViewServiceSessionTracker
+ (id)sharedTracker;
- (NSString)debugDescription;
- (_UIActiveViewServiceSessionTracker)init;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)viewServiceSessionForHostedWindow:(uint64_t)a3 inUserInterfaceIdiom:;
- (uint64_t)hasTrackedSessions;
- (void)_notifyChangeOfTopEvaluatedObjectIfNeededForIdiom:(id *)a3 withSortedActivityRecords:(uint64_t)a4 mutatedByBlock:;
- (void)dealloc;
- (void)handleViewServiceActivity:(void *)a3 inHostedWindow:(__CFString *)a4 fromProvider:(uint64_t)a5 forSessionActivityRecord:;
- (void)mostActiveViewServiceSessionForUserInterfaceIdiom:(void *)a1;
@end

@implementation _UIActiveViewServiceSessionTracker

- (uint64_t)hasTrackedSessions
{
  uint64_t v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([*(id *)(a1 + 8) count])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v2 = *(id *)(v1 + 8);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v13;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v13 != v5) {
              objc_enumerationMutation(v2);
            }
            uint64_t v7 = objc_msgSend(*(id *)(v1 + 8), "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v6), (void)v12);
            if (v7)
            {
              v8 = (void *)v7;
              uint64_t v9 = [*(id *)(v7 + 24) count];

              if (v9)
              {
                uint64_t v1 = 1;
                goto LABEL_16;
              }
            }
            ++v6;
          }
          while (v4 != v6);
          uint64_t v10 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
          uint64_t v4 = v10;
        }
        while (v10);
      }
      uint64_t v1 = 0;
LABEL_16:
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

+ (id)sharedTracker
{
  if (qword_1EB25EF98 != -1) {
    dispatch_once(&qword_1EB25EF98, &__block_literal_global_156);
  }
  id v2 = (void *)qword_1EB25EFA0;
  return v2;
}

- (id)viewServiceSessionForHostedWindow:(uint64_t)a3 inUserInterfaceIdiom:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(a3);
    uint64_t v6 = *(void **)(a1 + 8);
    uint64_t v7 = [NSNumber numberWithInteger:v5];
    v8 = [v6 objectForKey:v7];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = -[_UIEvaluatedObjectCache sortedObjects](v8);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      long long v12 = 0;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v9);
          }
          long long v15 = *(id **)(*((void *)&v20 + 1) + 8 * i);
          if (v15)
          {
            if (objc_msgSend(v15[1], "count", (void)v20))
            {
              v16 = (void *)[v15[1] copy];
              int v17 = [v16 containsObject:a2];

              if (v17)
              {
                v18 = v15;

                long long v12 = v18;
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
    else
    {
      long long v12 = 0;
    }
  }
  else
  {
    long long v12 = 0;
  }
  return v12;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if ([(NSMutableDictionary *)self->_sortedActivityRecordsByIdiom count])
  {
    [v5 setActiveMultilinePrefix:a3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E52D9F98;
    id v9 = v5;
    uint64_t v10 = self;
    id v6 = (id)[v9 modifyBody:v8];
  }
  return v5;
}

- (_UIActiveViewServiceSessionTracker)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIActiveViewServiceSessionTracker.m", 417, @"%s: init is not allowed on %@", "-[_UIActiveViewServiceSessionTracker init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIActiveViewServiceSessionTracker;
  [(_UIActiveViewServiceSessionTracker *)&v3 dealloc];
}

- (void)_notifyChangeOfTopEvaluatedObjectIfNeededForIdiom:(id *)a3 withSortedActivityRecords:(uint64_t)a4 mutatedByBlock:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v8 = -[_UIEvaluatedObjectCache topEvaluatedObject](a3);
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &qword_1EB25EFA8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    long long v15 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      int v17 = _NSStringFromUIUserInterfaceIdiom(a2);
      v18 = [v8 succinctDescription];
      *(_DWORD *)buf = 138412546;
      v26 = v17;
      __int16 v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "mostActiveViewServiceSession for %@: current: %@", buf, 0x16u);
    }
  }
  (*(void (**)(uint64_t))(a4 + 16))(a4);
  uint64_t v10 = -[_UIEvaluatedObjectCache topEvaluatedObject](a3);
  unint64_t v11 = __UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &qword_1EB25EFB0);
  if (*(unsigned char *)v11)
  {
    v19 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = v19;
      long long v21 = _NSStringFromUIUserInterfaceIdiom(a2);
      long long v22 = [v10 succinctDescription];
      *(_DWORD *)buf = 138412546;
      v26 = v21;
      __int16 v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "mostActiveViewServiceSession for %@: new: %@", buf, 0x16u);
    }
  }
  if (v10 != v8)
  {
    long long v12 = objc_msgSend(NSNumber, "numberWithInteger:", a2, @"_UIActiveViewServiceSessionChangingIdiomKey");
    v24 = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"_UIActiveViewServiceSessionDidChangeNotification" object:a1 userInfo:v13];
  }
}

- (void)handleViewServiceActivity:(void *)a3 inHostedWindow:(__CFString *)a4 fromProvider:(uint64_t)a5 forSessionActivityRecord:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (a5 && !*(unsigned char *)(a5 + 16))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a5 + 24));
    int IsPrimary = _UIActiveViewServiceSessionProviderIsPrimary(a4);
    int v14 = IsPrimary;
    if (a2 == 2) {
      int v15 = IsPrimary;
    }
    else {
      int v15 = 1;
    }
    if (a2) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    if (a3 && [a3 _isHostedInAnotherProcess])
    {
      BOOL v17 = (a3[12] & 0x1000) == 0;
      if (!WeakRetained)
      {
LABEL_23:
        v65 = WeakRetained;
        id v22 = *(id *)(a5 + 56);
        uint64_t v23 = [(__CFString *)a4 _sessionIdentifier];
        int v63 = v16;
        id v24 = v22;
        id v25 = v23;
        v26 = v25;
        if (v24 == v25)
        {
          char v27 = 1;
        }
        else
        {
          char v27 = 0;
          if (v24 && v25) {
            char v27 = [v24 isEqual:v25];
          }
        }

        WeakRetained = v65;
        if (v63 & v17) == 1 && (v27)
        {
          uint64_t v62 = *(void *)(a5 + 40);
          *(void *)(a5 + 40) = a2;
          objc_storeWeak((id *)(a5 + 32), a4);
          *(void *)(a5 + 48) = mach_absolute_time();
          v28 = objc_loadWeakRetained((id *)(a5 + 72));

          if (v28 != a3) {
            -[_UIViewServiceSessionActivityRecord associateHostedWindow:](a5, a3);
          }
          if (a2 == 2) {
            int v29 = v14;
          }
          else {
            int v29 = 0;
          }
          if (v29 == 1)
          {
            v30 = a4;
            unsigned int v31 = [(__CFString *)v30 _effectiveViewControllerAppearState];
            unsigned int v32 = v31;
            BOOL v34 = v31 != 3 && v31 != 0;
            BOOL v61 = v34;
            v35 = NSString;
            v36 = _NSStringFromUIViewControllerAppearState(v31);
            v64 = [v35 stringWithFormat:@"appearState: %@; ", v36];

            *(_DWORD *)(a5 + 20) = v32;
          }
          else
          {
            BOOL v61 = 0;
            v64 = &stru_1ED0E84C0;
          }
          v37 = *(id *)(__UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &qword_1EB25EFC0)+ 8);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            if (a2 > 4) {
              v38 = &stru_1ED0E84C0;
            }
            else {
              v38 = off_1E52DCCC0[a2 - 1];
            }
            v60 = v38;
            if (a3)
            {
              v39 = NSString;
              v40 = a3;
              v41 = (objc_class *)objc_opt_class();
              v42 = NSStringFromClass(v41);
              v43 = [v39 stringWithFormat:@"<%@: %p>", v42, v40];
            }
            else
            {
              v43 = @"(nil)";
            }
            v44 = v43;
            if (a4)
            {
              v45 = NSString;
              v46 = a4;
              v47 = (objc_class *)objc_opt_class();
              v48 = NSStringFromClass(v47);
              v49 = [v45 stringWithFormat:@"<%@: %p>", v48, v46];
            }
            else
            {
              v49 = @"(nil)";
            }
            uint64_t v50 = *(void *)(a5 + 56);
            *(_DWORD *)buf = 138544386;
            *(void *)&uint8_t buf[4] = v60;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v64;
            *(_WORD *)&buf[22] = 2114;
            v74 = v44;
            __int16 v75 = 2114;
            uint64_t v76 = (uint64_t)v49;
            __int16 v77 = 2114;
            uint64_t v78 = v50;
            v51 = v49;
            _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_DEFAULT, "Activity: %{public}@; %@window: %{public}@; provider: %{public}@; session: %{public}@",
              buf,
              0x34u);
          }
          uint64_t v52 = *(void *)(a5 + 64);
          v53 = [NSNumber numberWithInteger:v52];
          id v54 = a1[1];
          if (!v54)
          {
            uint64_t v55 = objc_opt_new();
            id v56 = a1[1];
            a1[1] = (id)v55;

            id v54 = a1[1];
          }
          v57 = [v54 objectForKey:v53];
          if (!v57)
          {
            objc_initWeak(&location, a1);
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __65___UIActiveViewServiceSessionTracker__createEvaluatedObjectCache__block_invoke;
            v74 = (__CFString *)&unk_1E52DCC50;
            objc_copyWeak((id *)&v75, &location);
            v58 = _Block_copy(buf);
            v57 = -[_UIEvaluatedObjectCache initWithSortComparator:evaluationBlock:]([_UIEvaluatedObjectCache alloc], &__block_literal_global_25, v58);

            objc_destroyWeak((id *)&v75);
            objc_destroyWeak(&location);
            [a1[1] setObject:v57 forKey:v53];
          }
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __117___UIActiveViewServiceSessionTracker_handleViewServiceActivity_inHostedWindow_fromProvider_forSessionActivityRecord___block_invoke;
          v66[3] = &unk_1E52DCC78;
          v66[4] = v65;
          v66[5] = a5;
          v66[6] = a1;
          id v67 = v57;
          uint64_t v68 = v62;
          unint64_t v69 = a2;
          BOOL v70 = a2 == 2;
          BOOL v71 = v61;
          v59 = v57;
          -[_UIActiveViewServiceSessionTracker _notifyChangeOfTopEvaluatedObjectIfNeededForIdiom:withSortedActivityRecords:mutatedByBlock:]((uint64_t)a1, v52, v59, (uint64_t)v66);

          WeakRetained = v65;
          goto LABEL_62;
        }
LABEL_21:
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        long long v20 = v19;
        if (a2 > 4) {
          long long v21 = &stru_1ED0E84C0;
        }
        else {
          long long v21 = off_1E52DCC98[a2];
        }
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel_handleViewServiceActivity_inHostedWindow_fromProvider_forSessionActivityRecord_, a1, @"_UIActiveViewServiceSessionTracker.m", 526, @"Invalid state: activity: %@; window: %@; provider: %@; session: %@",
          v21,
          a3,
          a4,
          a5);

LABEL_62:
        return;
      }
    }
    else
    {
      BOOL v17 = 0;
      if (!WeakRetained) {
        goto LABEL_23;
      }
    }
    if (WeakRetained != a1) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &qword_1EB25EFB8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    if (a2 > 4) {
      uint64_t v10 = &stru_1ED0E84C0;
    }
    else {
      uint64_t v10 = off_1E52DCC98[a2];
    }
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2114;
    v74 = a4;
    __int16 v75 = 2114;
    uint64_t v76 = a5;
    v18 = v9;
    _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Invalid session activity record was provided to handleViewServiceActivity: activity: %{public}@; window: %{public}"
      "@; provider: %{public}@; session: %{public}@",
      buf,
      0x2Au);
  }
}

- (void)mostActiveViewServiceSessionForUserInterfaceIdiom:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(a2);
    uint64_t v4 = (void *)v2[1];
    uint64_t v5 = [NSNumber numberWithInteger:v3];
    id v6 = [v4 objectForKey:v5];

    id v2 = -[_UIEvaluatedObjectCache topEvaluatedObject](v6);
  }
  return v2;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIActiveViewServiceSessionTracker *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(_UIActiveViewServiceSessionTracker *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIActiveViewServiceSessionTracker *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIActiveViewServiceSessionTracker *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_sortedActivityRecordsByIdiom, 0);
}

@end