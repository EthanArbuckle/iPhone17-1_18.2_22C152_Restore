@interface SBSceneSnapshotRequestor
- (BOOL)handleSnapshotRequestAction:(id)a3 forSceneHandle:(id)a4;
- (NSString)description;
- (SBSceneSnapshotRequestor)initWithDelegate:(id)a3;
- (SBSceneSnapshotRequestorDelegate)delegate;
- (id)_debugName;
- (id)_fbsSceneSnapshotRequestsFromSBSceneSnapshotRequests:(id)a3 forSceneHandle:(id)a4 settings:(id)a5 snapshotRequestContext:(id)a6;
- (id)_sbSceneSnapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5;
- (id)_sceneSnapshotRequestContext;
- (id)_sceneSnapshotRequestStrategy;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)invalidate;
- (void)invalidatePendingSnapshotsForSceneID:(id)a3;
- (void)requestSnapshotsForSceneHandle:(id)a3 updatingToNewSettings:(id)a4 withUpdateContext:(id)a5;
@end

@implementation SBSceneSnapshotRequestor

- (void)requestSnapshotsForSceneHandle:(id)a3 updatingToNewSettings:(id)a4 withUpdateContext:(id)a5
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v99 = v8;
  if (!v8)
  {
    id v86 = v10;
    v87 = [MEMORY[0x1E4F28B00] currentHandler];
    [v87 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 130, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

    id v10 = v86;
  }
  v98 = v9;
  if (!v9)
  {
    id v88 = v10;
    v89 = [MEMORY[0x1E4F28B00] currentHandler];
    [v89 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 131, @"Invalid parameter not satisfying: %@", @"newSettings" object file lineNumber description];

    id v10 = v88;
  }
  v96 = v10;
  if (!v10)
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 132, @"Invalid parameter not satisfying: %@", @"updateContext" object file lineNumber description];
  }
  v102 = [v99 scene];
  v11 = [v99 application];
  v97 = [v11 info];

  v12 = v97;
  if (([v97 disablesSnapshots] & 1) == 0)
  {
    v95 = [v102 settings];
    if ([v95 isForeground]) {
      int v92 = [v98 isForeground] ^ 1;
    }
    else {
      int v92 = 0;
    }
    if ([v95 isForeground]) {
      int v13 = 0;
    }
    else {
      int v13 = [v98 isForeground];
    }
    v94 = [v96 transitionContext];
    v14 = [v94 watchdogTransitionContext];
    uint64_t v15 = [v14 watchdogBehavior];

    if (v92)
    {
      v16 = @"we are taking new snapshots";
    }
    else
    {
      if (v15 == 1) {
        int v17 = 1;
      }
      else {
        int v17 = v13;
      }
      if (v17 != 1)
      {
LABEL_88:

        v12 = v97;
        goto LABEL_89;
      }
      v16 = @"(unknown)";
      if (v15 == 1) {
        v16 = @"another scene update with a watchdog is happening";
      }
      if (v13) {
        v16 = @"the scene is moving to the foreground";
      }
    }
    v101 = v16;
    v18 = [v102 identifier];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    v19 = (void *)[(NSMutableSet *)self->_outgoingSnapshots copy];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v119 objects:v130 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v120 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v119 + 1) + 8 * i);
          v24 = [v23 sceneID];
          int v25 = [v18 isEqualToString:v24];

          if (v25)
          {
            v26 = SBLogSceneSnapshots();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v27 = [(SBSceneSnapshotRequestor *)self succinctDescription];
              v28 = [v102 identifier];
              v29 = (objc_class *)objc_opt_class();
              v30 = NSStringFromClass(v29);
              *(_DWORD *)buf = 138544386;
              *(void *)&buf[4] = v27;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v28;
              *(_WORD *)&buf[22] = 2114;
              *(void *)v129 = v30;
              *(_WORD *)&v129[8] = 2050;
              *(void *)&v129[10] = v23;
              *(_WORD *)&v129[18] = 2114;
              *(void *)&v129[20] = v101;
              _os_log_debug_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Cancelling outgoing snapshot action <%{public}@ %{public}p> because %{public}@", buf, 0x34u);
            }
            [v23 invalidate];
            [(NSMutableSet *)self->_outgoingSnapshots removeObject:v23];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v119 objects:v130 count:16];
      }
      while (v20);
    }

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    v31 = (void *)[(NSMutableSet *)self->_incomingSnapshots copy];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v115 objects:v127 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v116;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v116 != v33) {
            objc_enumerationMutation(v31);
          }
          v35 = *(void **)(*((void *)&v115 + 1) + 8 * j);
          v36 = [v35 context];
          v37 = [v36 sceneID];
          int v38 = [v18 isEqualToString:v37];

          if (v38)
          {
            v39 = SBLogSceneSnapshots();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              v41 = [(SBSceneSnapshotRequestor *)self succinctDescription];
              v42 = [v102 identifier];
              v43 = (objc_class *)objc_opt_class();
              v44 = NSStringFromClass(v43);
              *(_DWORD *)buf = 138544386;
              *(void *)&buf[4] = v41;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v42;
              *(_WORD *)&buf[22] = 2114;
              *(void *)v129 = v44;
              *(_WORD *)&v129[8] = 2050;
              *(void *)&v129[10] = v35;
              *(_WORD *)&v129[18] = 2114;
              *(void *)&v129[20] = v101;
              _os_log_debug_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Cancelling incoming snapshot action <%{public}@ %{public}p> because %{public}@", buf, 0x34u);
            }
            v40 = FBSSceneSnapshotActionResponseForErrorCode();
            [v35 sendResponse:v40];

            [(NSMutableSet *)self->_incomingSnapshots removeObject:v35];
          }
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v115 objects:v127 count:16];
      }
      while (v32);
    }

    if (v92)
    {
      v93 = [(SBSceneSnapshotRequestor *)self _sceneSnapshotRequestContext];
      v100 = [(SBSceneSnapshotRequestor *)self _sbSceneSnapshotRequestsForSceneHandle:v99 settings:v98 snapshotRequestContext:v93];
      v45 = SBLogSceneSnapshots();
      BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);

      if (v46)
      {
        v47 = SBLogSceneSnapshots();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          v83 = [(SBSceneSnapshotRequestor *)self succinctDescription];
          v84 = [v102 identifier];
          int v85 = [v100 count];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v84;
          *(_WORD *)&buf[22] = 1026;
          *(_DWORD *)v129 = v85;
          _os_log_debug_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Generated %{public}d SB requests", buf, 0x1Cu);
        }
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v48 = v100;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v111 objects:v126 count:16];
        if (v49)
        {
          uint64_t v50 = *(void *)v112;
          do
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              if (*(void *)v112 != v50) {
                objc_enumerationMutation(v48);
              }
              v52 = *(void **)(*((void *)&v111 + 1) + 8 * k);
              v53 = SBLogSceneSnapshots();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
                -[SBSceneSnapshotRequestor requestSnapshotsForSceneHandle:updatingToNewSettings:withUpdateContext:](v124, v52, &v125, v53);
              }
            }
            uint64_t v49 = [v48 countByEnumeratingWithState:&v111 objects:v126 count:16];
          }
          while (v49);
        }
      }
      if ([v100 count])
      {
        v91 = [(SBSceneSnapshotRequestor *)self _fbsSceneSnapshotRequestsFromSBSceneSnapshotRequests:v100 forSceneHandle:v99 settings:v98 snapshotRequestContext:v93];
        v54 = SBLogSceneSnapshots();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = [(SBSceneSnapshotRequestor *)self succinctDescription];
          v56 = [v102 identifier];
          int v57 = [v91 count];
          *(_DWORD *)buf = 138544130;
          *(void *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v129 = v57;
          *(_WORD *)&v129[4] = 2112;
          *(void *)&v129[6] = @"the scene actually moved to the background";
          _os_log_impl(&dword_1D85BA000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Requesting %d snapshot(s) because %@", buf, 0x26u);
        }
        v58 = SBLogSceneSnapshots();
        BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);

        if (v59)
        {
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v60 = v91;
          uint64_t v61 = [v60 countByEnumeratingWithState:&v107 objects:v123 count:16];
          if (v61)
          {
            uint64_t v62 = *(void *)v108;
            do
            {
              for (uint64_t m = 0; m != v61; ++m)
              {
                if (*(void *)v108 != v62) {
                  objc_enumerationMutation(v60);
                }
                v64 = [*(id *)(*((void *)&v107 + 1) + 8 * m) settings];
                uint64_t v65 = objc_opt_class();
                id v66 = v64;
                if (v65)
                {
                  if (objc_opt_isKindOfClass()) {
                    v67 = v66;
                  }
                  else {
                    v67 = 0;
                  }
                }
                else
                {
                  v67 = 0;
                }
                id v68 = v67;

                v69 = SBLogSceneSnapshots();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  [v68 frame];
                  v70 = NSStringFromCGRect(v132);
                  [v68 interfaceOrientation];
                  v71 = BSInterfaceOrientationDescription();
                  [v68 userInterfaceStyle];
                  v72 = SBFStringForUIUserInterfaceStyle();
                  *(_DWORD *)buf = 138543874;
                  *(void *)&buf[4] = v70;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v71;
                  *(_WORD *)&buf[22] = 2114;
                  *(void *)v129 = v72;
                  _os_log_debug_impl(&dword_1D85BA000, v69, OS_LOG_TYPE_DEBUG, " - frame: %{public}@, interfaceOrientation: %{public}@, user interface style: %{public}@", buf, 0x20u);
                }
              }
              uint64_t v61 = [v60 countByEnumeratingWithState:&v107 objects:v123 count:16];
            }
            while (v61);
          }
        }
        if (v94)
        {
          v73 = self->_outgoingSnapshots;
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          *(void *)v129 = __Block_byref_object_copy__40;
          *(void *)&v129[8] = __Block_byref_object_dispose__40;
          *(void *)&v129[16] = 0;
          id v74 = objc_alloc(MEMORY[0x1E4F624A0]);
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke;
          v104[3] = &unk_1E6AFFD88;
          v75 = v73;
          v105 = v75;
          v106 = buf;
          uint64_t v76 = [v74 initWithScene:v102 requests:v91 expirationInterval:v104 responseHandler:5.0];
          v77 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v76;

          [(NSMutableSet *)self->_outgoingSnapshots addObject:*(void *)(*(void *)&buf[8] + 40)];
          v78 = [v94 actions];
          v79 = v78;
          if (v78)
          {
            id v80 = v78;
          }
          else
          {
            id v80 = [MEMORY[0x1E4F1CAD0] set];
          }
          v81 = v80;

          v82 = [v81 setByAddingObject:*(void *)(*(void *)&buf[8] + 40)];
          [v94 setActions:v82];

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v75 = SBLogSceneSnapshots();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
            -[SBSceneSnapshotRequestor requestSnapshotsForSceneHandle:updatingToNewSettings:withUpdateContext:](self, v102, v75);
          }
        }
      }
    }
    goto LABEL_88;
  }
LABEL_89:
}

- (id)preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __95__SBSceneSnapshotRequestor_preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason___block_invoke;
  v16 = &unk_1E6AF4FB8;
  objc_copyWeak(&v17, &location);
  id v8 = (void *)[v5 initWithIdentifier:@"SBSceneSnapshotRequestor.PreventSupplementalSnapshots" forReason:v4 queue:v6 invalidationBlock:&v13];

  preventSupplementalSnapshotsAssertions = self->_preventSupplementalSnapshotsAssertions;
  if (!preventSupplementalSnapshotsAssertions)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v13, v14, v15, v16);
    id v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_preventSupplementalSnapshotsAssertions;
    self->_preventSupplementalSnapshotsAssertions = v10;

    preventSupplementalSnapshotsAssertions = self->_preventSupplementalSnapshotsAssertions;
  }
  -[NSHashTable addObject:](preventSupplementalSnapshotsAssertions, "addObject:", v8, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

- (SBSceneSnapshotRequestor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSceneSnapshotRequestor;
  id v5 = [(SBSceneSnapshotRequestor *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    outgoingSnapshots = v6->_outgoingSnapshots;
    v6->_outgoingSnapshots = v7;

    id v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    incomingSnapshots = v6->_incomingSnapshots;
    v6->_incomingSnapshots = v9;
  }
  return v6;
}

- (NSString)description
{
  return (NSString *)[(SBSceneSnapshotRequestor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSceneSnapshotRequestor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBSceneSnapshotRequestor *)self _debugName];
  id v5 = (id)[v3 appendObject:v4 withName:@"debugName"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSceneSnapshotRequestor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSceneSnapshotRequestor *)self succinctDescriptionBuilder];
  id v5 = [(SBSceneSnapshotRequestor *)self _sceneSnapshotRequestStrategy];
  id v6 = (id)[v4 appendObject:v5 withName:@"strategy"];

  id v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_incomingSnapshots, "count"), @"incomingSnapshots.count");
  id v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_outgoingSnapshots, "count"), @"outgoingSnapshots.count");
  return v4;
}

- (void)invalidate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = self->_outgoingSnapshots;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = self->_incomingSnapshots;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "invalidate", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

void __95__SBSceneSnapshotRequestor_preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *((id *)WeakRetained + 3);
    [v5 removeObject:v7];
    if (![v5 count])
    {
      uint64_t v6 = (void *)v4[3];
      v4[3] = 0;
    }
  }
}

void __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke_2;
  v4[3] = &unk_1E6AF52B8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (BOOL)handleSnapshotRequestAction:(id)a3 forSceneHandle:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 229, @"Invalid parameter not satisfying: %@", @"snapshotRequestAction" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 230, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v9 application];
  if (v10)
  {
    uint64_t v11 = [v7 context];
    uint64_t v12 = [v7 type];
    if (v12 == 2)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      int v25 = _os_activity_create(&dword_1D85BA000, "XBInvalidate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v25, &state);

      v26 = XBLogFileManifest();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [(SBSceneSnapshotRequestor *)self succinctDescription];
        v28 = [v9 sceneIdentifier];
        *(_DWORD *)buf = 138543874;
        id v41 = v27;
        __int16 v42 = 2114;
        v43 = v28;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Got snapshot-invalidate request with context: %@", buf, 0x20u);
      }
      [v10 deleteSnapshotForContext:v11];
      v29 = FBSSceneSnapshotActionResponseForErrorCode();
      [v7 sendResponse:v29];
    }
    else
    {
      if (v12 != 1)
      {
        v30 = FBSSceneSnapshotActionResponseForErrorCode();
        [v7 sendResponse:v30];

LABEL_21:
        goto LABEL_22;
      }
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v13 = _os_activity_create(&dword_1D85BA000, "XBCapture", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v13, &state);

      long long v14 = SBLogSceneSnapshots();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(SBSceneSnapshotRequestor *)self succinctDescription];
        long long v16 = [v9 sceneIdentifier];
        *(_DWORD *)buf = 138543874;
        id v41 = v15;
        __int16 v42 = 2114;
        v43 = v16;
        __int16 v44 = 2048;
        id v45 = v7;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Got FBSSceneSnapshotRequestTypePerform (%p)", buf, 0x20u);
      }
      long long v17 = [v9 sceneIfExists];
      long long v18 = [v17 settings];
      long long v19 = v18;
      if (v18 && ([v18 isForeground] & 1) == 0)
      {
        [(NSMutableSet *)self->_incomingSnapshots addObject:v7];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __71__SBSceneSnapshotRequestor_handleSnapshotRequestAction_forSceneHandle___block_invoke;
        v34[3] = &unk_1E6AFFDD8;
        v34[4] = self;
        id v35 = v9;
        id v36 = v7;
        id v37 = v10;
        id v38 = v11;
        [v37 saveSnapshotForSceneHandle:v35 context:v38 completion:v34];
      }
      else
      {
        long long v20 = SBLogSceneSnapshots();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          id v21 = [(SBSceneSnapshotRequestor *)self succinctDescription];
          v22 = [v9 sceneIdentifier];
          [(SBSceneSnapshotRequestor *)v21 handleSnapshotRequestAction:buf forSceneHandle:v20];
        }

        uint64_t v23 = FBSSceneSnapshotActionResponseForErrorCode();
        [v7 sendResponse:v23];
      }
    }
    os_activity_scope_leave(&state);
    goto LABEL_21;
  }
  v24 = FBSSceneSnapshotActionResponseForErrorCode();
  [v7 sendResponse:v24];

LABEL_22:
  return 1;
}

void __71__SBSceneSnapshotRequestor_handleSnapshotRequestAction_forSceneHandle___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogSceneSnapshots();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a1[4] succinctDescription];
    uint64_t v6 = [a1[5] sceneIdentifier];
    id v7 = a1[6];
    *(_DWORD *)buf = 138544130;
    long long v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2048;
    id v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Snapshot request (%p) complete with error: %ld", buf, 0x2Au);
  }
  id v8 = a1[6];
  id v9 = a1[5];
  id v10 = a1[7];
  id v11 = a1[8];
  BSDispatchMain();
}

uint64_t __71__SBSceneSnapshotRequestor_handleSnapshotRequestAction_forSceneHandle___block_invoke_56(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)];
  if (!result)
  {
    if (!*(void *)(a1 + 72)) {
      return result;
    }
    goto LABEL_10;
  }
  int v3 = [*(id *)(a1 + 40) isValid];
  char v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = FBSSceneSnapshotActionResponseForErrorCode();
    [v5 sendResponse:v6];
  }
  else
  {
    id v7 = SBLogSceneSnapshots();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) succinctDescription];
      id v9 = [*(id *)(a1 + 48) sceneIdentifier];
      uint64_t v10 = *(void *)(a1 + 40);
      int v15 = 138543874;
      __int16 v16 = v8;
      __int16 v17 = 2114;
      __int16 v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Snapshot request (%p) was invalidated before it completed!", (uint8_t *)&v15, 0x20u);
    }
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  if ((v4 & 1) == 0)
  {
LABEL_10:
    id v11 = SBLogSceneSnapshots();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [*(id *)(a1 + 32) succinctDescription];
      long long v13 = [*(id *)(a1 + 48) sceneIdentifier];
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 138543874;
      __int16 v16 = v12;
      __int16 v17 = 2114;
      __int16 v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Deleting any snapshot taken for now-invalidated action (%p)", (uint8_t *)&v15, 0x20u);
    }
    return [*(id *)(a1 + 56) deleteSnapshotForContext:*(void *)(a1 + 64)];
  }
  return result;
}

- (void)invalidatePendingSnapshotsForSceneID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = (void *)[(NSMutableSet *)self->_outgoingSnapshots copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [v10 sceneID];
        int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          [v10 invalidate];
          [(NSMutableSet *)self->_outgoingSnapshots removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v13 = (void *)[(NSMutableSet *)self->_incomingSnapshots copy];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        __int16 v19 = [v18 context];
        uint64_t v20 = [v19 sceneID];
        int v21 = [v4 isEqualToString:v20];

        if (v21)
        {
          [v18 invalidate];
          [(NSMutableSet *)self->_incomingSnapshots removeObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }
}

- (id)_sbSceneSnapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_16:
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 319, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 318, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

  if (!v10) {
    goto LABEL_16;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_17:
  long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 320, @"Invalid parameter not satisfying: %@", @"snapshotRequestContext" object file lineNumber description];

LABEL_4:
  if ([(NSHashTable *)self->_preventSupplementalSnapshotsAssertions count])
  {
    int v12 = SBLogSceneSnapshots();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = [(SBSceneSnapshotRequestor *)self succinctDescription];
      uint64_t v20 = [v9 sceneIdentifier];
      NSUInteger v21 = [(NSHashTable *)self->_preventSupplementalSnapshotsAssertions count];
      long long v22 = [(NSHashTable *)self->_preventSupplementalSnapshotsAssertions allObjects];
      long long v23 = objc_msgSend(v22, "bs_map:", &__block_literal_global_123);
      *(_DWORD *)buf = 138544130;
      long long v28 = v19;
      __int16 v29 = 2114;
      v30 = v20;
      __int16 v31 = 2050;
      NSUInteger v32 = v21;
      __int16 v33 = 2114;
      v34 = v23;
      _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Preventing supplemental snapshot requests because %{public}lu assertion(s): %{public}@", buf, 0x2Au);
    }
LABEL_7:

    long long v13 = objc_alloc_init(SBSingleSceneSnapshotRequestStrategy);
    goto LABEL_10;
  }
  uint64_t v14 = [v11 sceneDisplayLayoutStateTransitionContext];
  uint64_t v15 = [v14 fromLayoutState];

  if (!v15)
  {
    int v12 = SBLogSceneSnapshots();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SBSceneSnapshotRequestor _sbSceneSnapshotRequestsForSceneHandle:settings:snapshotRequestContext:](self, v9, v12);
    }
    goto LABEL_7;
  }
  long long v13 = [(SBSceneSnapshotRequestor *)self _sceneSnapshotRequestStrategy];
LABEL_10:
  uint64_t v16 = v13;
  __int16 v17 = [(SBSingleSceneSnapshotRequestStrategy *)v13 snapshotRequestsForSceneHandle:v9 settings:v10 snapshotRequestContext:v11];

  return v17;
}

uint64_t __99__SBSceneSnapshotRequestor__sbSceneSnapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reason];
}

- (id)_fbsSceneSnapshotRequestsFromSBSceneSnapshotRequests:(id)a3 forSceneHandle:(id)a4 settings:(id)a5 snapshotRequestContext:(id)a6
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v98 = a6;
  if (!v9)
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 342, @"Invalid parameter not satisfying: %@", @"sbRequests" object file lineNumber description];
  }
  long long v115 = v10;
  if (v10)
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v91 = [MEMORY[0x1E4F28B00] currentHandler];
    [v91 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 343, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  int v92 = [MEMORY[0x1E4F28B00] currentHandler];
  [v92 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 344, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

LABEL_5:
  if (!v98)
  {
    v93 = [MEMORY[0x1E4F28B00] currentHandler];
    [v93 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 345, @"Invalid parameter not satisfying: %@", @"snapshotRequestContext" object file lineNumber description];
  }
  id v119 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = [v10 application];
  v97 = [v13 info];

  uint64_t v14 = objc_opt_class();
  id v15 = v11;
  if (v14)
  {
    uint64_t v16 = v15;
    if (objc_opt_isKindOfClass()) {
      __int16 v17 = v16;
    }
    else {
      __int16 v17 = 0;
    }
  }
  else
  {
    uint64_t v16 = v15;
    __int16 v17 = 0;
  }
  id v18 = v17;

  v96 = v18;
  uint64_t v117 = objc_msgSend(v97, "xb_userInterfaceStyleForRequestedUserInterfaceStyle:", objc_msgSend(v18, "userInterfaceStyle"));
  long long v109 = [v98 sceneDisplayReferenceFrameProvider];
  __int16 v19 = [v98 sceneDisplayLayoutStateTransitionContext];
  uint64_t v20 = [v19 fromLayoutState];

  v105 = [v98 embeddedDisplayReferenceFrameProvider];
  NSUInteger v21 = [v20 appLayout];
  long long v22 = [v115 sceneIdentifier];
  v95 = v20;
  long long v23 = [v20 elementWithIdentifier:v22];
  uint64_t v106 = [v23 layoutRole];

  long long v120 = v16;
  uint64_t v116 = [v16 interfaceOrientation];
  uint64_t v24 = 4;
  if ((unint64_t)(v116 - 1) >= 2) {
    uint64_t v24 = 1;
  }
  uint64_t v100 = v24;
  v94 = [v21 itemsToLayoutAttributesMap];
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  obuint64_t j = v9;
  uint64_t v103 = [obj countByEnumeratingWithState:&v130 objects:v148 count:16];
  if (v103)
  {
    uint64_t v102 = *(void *)v131;
    double v25 = *MEMORY[0x1E4F1DB30];
    double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v110 = v117;
    id v121 = v12;
    long long v107 = v21;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v131 != v102)
        {
          uint64_t v28 = v27;
          objc_enumerationMutation(obj);
          uint64_t v27 = v28;
        }
        uint64_t v104 = v27;
        __int16 v29 = *(void **)(*((void *)&v130 + 1) + 8 * v27);
        if ([v29 size]) {
          BOOL v30 = v109 == 0;
        }
        else {
          BOOL v30 = 0;
        }
        if (v30)
        {
          v34 = SBLogSceneSnapshots();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = [(SBSceneSnapshotRequestor *)self succinctDescription];
            id v36 = [v115 sceneIdentifier];
            *(_DWORD *)buf = 138543874;
            v135 = v35;
            __int16 v136 = 2114;
            v137 = v36;
            __int16 v138 = 2114;
            v139 = v29;
            _os_log_error_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] skipping snapshot request because referenceFrameProvider == nil for sbRequest %{public}@", buf, 0x20u);

            NSUInteger v21 = v107;
          }
        }
        else
        {
          switch([v29 orientation])
          {
            case 0:
              __int16 v31 = [NSNumber numberWithInteger:v116];
              v147 = v31;
              NSUInteger v32 = (void *)MEMORY[0x1E4F1C978];
              __int16 v33 = &v147;
              goto LABEL_30;
            case 1:
              __int16 v31 = [NSNumber numberWithInteger:v100];
              v146 = v31;
              NSUInteger v32 = (void *)MEMORY[0x1E4F1C978];
              __int16 v33 = &v146;
LABEL_30:
              id v38 = [v32 arrayWithObjects:v33 count:1];
              goto LABEL_31;
            case 2:
              id v38 = &unk_1F3347CA0;
              break;
            case 3:
              id v38 = &unk_1F3347CB8;
              break;
            case 4:
              __int16 v31 = [NSNumber numberWithInteger:v116];
              v145[0] = v31;
              id v37 = [NSNumber numberWithInteger:v100];
              v145[1] = v37;
              id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:2];

LABEL_31:
              break;
            default:
              id v38 = 0;
              break;
          }
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v108 = v38;
          uint64_t v112 = [v108 countByEnumeratingWithState:&v126 objects:v144 count:16];
          if (v112)
          {
            uint64_t v111 = *(void *)v127;
            long long v118 = v29;
            do
            {
              uint64_t v39 = 0;
              do
              {
                if (*(void *)v127 != v111) {
                  objc_enumerationMutation(v108);
                }
                uint64_t v40 = [*(id *)(*((void *)&v126 + 1) + 8 * v39) integerValue];
                switch([v29 size])
                {
                  case 0:
                    [v120 frame];
                    goto LABEL_50;
                  case 1:
                    uint64_t v46 = v109;
                    goto LABEL_47;
                  case 2:
                    uint64_t v46 = v105;
LABEL_47:
                    [v46 referenceFrameForInterfaceOrientation:v40 layoutRole:v106 appLayout:v107];
                    goto LABEL_50;
                  case 3:
                    uint64_t v45 = [v107 leafAppLayoutForRole:v106];
                    goto LABEL_44;
                  case 4:
                    uint64_t v45 = SBAppLayoutGenericAppLayoutWithConfiguration(3);
LABEL_44:
                    v47 = (void *)v45;
                    [v109 referenceFrameForInterfaceOrientation:v40 layoutRole:1 appLayout:v45];
                    double v49 = v48;
                    double v51 = v50;
                    double v53 = v52;
                    double v55 = v54;

                    break;
                  case 5:
                    [v109 referenceFrameForInterfaceOrientation:v40 floatingConfiguration:2];
                    goto LABEL_50;
                  case 6:
                    [v109 referenceFrameForInterfaceOrientation:v40 centerConfiguration:1];
LABEL_50:
                    double v49 = v41;
                    double v51 = v42;
                    double v53 = v43;
                    double v55 = v44;
                    break;
                  default:
                    double v55 = 0.0;
                    double v53 = 0.0;
                    double v51 = 0.0;
                    double v49 = 0.0;
                    break;
                }
                if (v53 == v25 && v55 == v26)
                {
                  v83 = [MEMORY[0x1E4F28B00] currentHandler];
                  v151.origin.x = v49;
                  v151.origin.y = v51;
                  v151.size.width = v53;
                  v151.size.height = v55;
                  v84 = NSStringFromCGRect(v151);
                  int v85 = [v115 sceneIdentifier];
                  [v83 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestor.m", 433, @"frame %@ isn't valid for scene %@ from request %@", v84, v85, v29 object file lineNumber description];
                }
                uint64_t v57 = [v29 userInterfaceStyle];
                uint64_t v113 = v39;
                if (v57 == 1)
                {
                  if (v110 == 2) {
                    BOOL v59 = &unk_1F3347CD0;
                  }
                  else {
                    BOOL v59 = &unk_1F3347CE8;
                  }
                  uint64_t v60 = 1;
                  if (v110 != 2) {
                    uint64_t v60 = 2;
                  }
                  uint64_t v110 = v60;
                }
                else if (v57)
                {
                  BOOL v59 = 0;
                }
                else
                {
                  v58 = [NSNumber numberWithInteger:v117];
                  v143 = v58;
                  BOOL v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];

                  uint64_t v110 = v117;
                }
                long long v124 = 0u;
                long long v125 = 0u;
                long long v122 = 0u;
                long long v123 = 0u;
                id v61 = v59;
                uint64_t v62 = [v61 countByEnumeratingWithState:&v122 objects:v142 count:16];
                if (v62)
                {
                  uint64_t v63 = v62;
                  uint64_t v64 = *(void *)v123;
                  do
                  {
                    for (uint64_t i = 0; i != v63; ++i)
                    {
                      if (*(void *)v123 != v64) {
                        objc_enumerationMutation(v61);
                      }
                      uint64_t v66 = [*(id *)(*((void *)&v122 + 1) + 8 * i) integerValue];
                      v67 = NSString;
                      id v68 = SBFStringForUIUserInterfaceStyle();
                      v69 = [v67 stringWithFormat:@"w%0.0f:h%0.0f:%@", *(void *)&v53, *(void *)&v55, v68];

                      if ([v12 containsObject:v69])
                      {
                        v70 = SBLogSceneSnapshots();
                        if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
                          goto LABEL_95;
                        }
                        v71 = [(SBSceneSnapshotRequestor *)self succinctDescription];
                        v72 = [v115 sceneIdentifier];
                        v73 = [v118 succinctDescription];
                        *(_DWORD *)buf = 138544130;
                        v135 = v71;
                        __int16 v136 = 2114;
                        v137 = v72;
                        __int16 v138 = 2114;
                        v139 = v69;
                        __int16 v140 = 2114;
                        v141 = v73;
                        _os_log_debug_impl(&dword_1D85BA000, v70, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] skipping duplicate request (%{public}@) from sbRequest %{public}@", buf, 0x2Au);

                        id v12 = v121;
LABEL_81:

                        goto LABEL_95;
                      }
                      if (!v40)
                      {
                        v70 = SBLogSceneSnapshots();
                        if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_95;
                        }
                        v71 = [(SBSceneSnapshotRequestor *)self succinctDescription];
                        v77 = [v115 sceneIdentifier];
                        *(_DWORD *)buf = 138543874;
                        v135 = v71;
                        __int16 v136 = 2114;
                        v137 = v77;
                        __int16 v138 = 2114;
                        v139 = v118;
                        _os_log_error_impl(&dword_1D85BA000, v70, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] skipping snapshot request with unknown orientation from sbRequest %{public}@", buf, 0x20u);

                        id v12 = v121;
                        goto LABEL_81;
                      }
                      [v12 addObject:v69];
                      id v74 = (void *)[v120 mutableCopy];
                      objc_msgSend(v74, "setFrame:", v49, v51, v53, v55);
                      [v74 setInterfaceOrientation:v40];
                      uint64_t v75 = objc_opt_class();
                      v70 = v74;
                      if (v75)
                      {
                        if (objc_opt_isKindOfClass()) {
                          uint64_t v76 = v70;
                        }
                        else {
                          uint64_t v76 = 0;
                        }
                      }
                      else
                      {
                        uint64_t v76 = 0;
                      }
                      v78 = v76;

                      [v78 setUserInterfaceStyle:v66];
                      if ([(id)SBApp underMemoryPressure])
                      {
                        uint64_t v79 = 0;
                      }
                      else
                      {
                        if ([v118 size]) {
                          BOOL v80 = 0;
                        }
                        else {
                          BOOL v80 = v66 == v117;
                        }
                        uint64_t v79 = v80 && v40 == v116;
                      }
                      v82 = (void *)[objc_alloc(MEMORY[0x1E4F62AA0]) initWithSettings:v70 allowsProtectedContent:v79];
                      [v119 addObject:v82];

                      id v12 = v121;
LABEL_95:
                    }
                    uint64_t v63 = [v61 countByEnumeratingWithState:&v122 objects:v142 count:16];
                  }
                  while (v63);
                }

                uint64_t v39 = v113 + 1;
                __int16 v29 = v118;
              }
              while (v113 + 1 != v112);
              uint64_t v112 = [v108 countByEnumeratingWithState:&v126 objects:v144 count:16];
            }
            while (v112);
          }
          v34 = v108;

          NSUInteger v21 = v107;
        }

        uint64_t v27 = v104 + 1;
      }
      while (v104 + 1 != v103);
      uint64_t v103 = [obj countByEnumeratingWithState:&v130 objects:v148 count:16];
    }
    while (v103);
  }

  id v86 = [v21 itemsToLayoutAttributesMap];
  char v87 = [v94 isEqualToDictionary:v86];

  if ((v87 & 1) == 0)
  {
    uint64_t v88 = [v21 appLayoutByModifyingLayoutAttributesForItems:v94];

    NSUInteger v21 = (void *)v88;
  }

  return v119;
}

- (id)_debugName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained debugNameForSceneSnapshotRequestor:self];

  return v4;
}

- (id)_sceneSnapshotRequestContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained sceneSnapshotRequestContextForSceneSnapshotRequestor:self];

  return v4;
}

- (id)_sceneSnapshotRequestStrategy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained sceneSnapshotRequestStrategyForSceneSnapshotRequestor:self];

  return v4;
}

- (SBSceneSnapshotRequestorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSceneSnapshotRequestorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preventSupplementalSnapshotsAssertions, 0);
  objc_storeStrong((id *)&self->_incomingSnapshots, 0);
  objc_storeStrong((id *)&self->_outgoingSnapshots, 0);
}

- (void)requestSnapshotsForSceneHandle:(void *)a1 updatingToNewSettings:(void *)a2 withUpdateContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 succinctDescription];
  uint64_t v6 = [a2 identifier];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ ERROR: No transition context exists for update to scene %{public}@; unable to include snapshot actions.",
    (uint8_t *)&v7,
    0x16u);
}

- (void)requestSnapshotsForSceneHandle:(void *)a3 updatingToNewSettings:(NSObject *)a4 withUpdateContext:.cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 succinctDescription];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_1D85BA000, a4, OS_LOG_TYPE_DEBUG, " - %{public}@", a1, 0xCu);
}

- (void)handleSnapshotRequestAction:(uint8_t *)buf forSceneHandle:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Ignoring snapshot request, because scene is foreground", buf, 0x16u);
}

- (void)_sbSceneSnapshotRequestsForSceneHandle:(void *)a1 settings:(void *)a2 snapshotRequestContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 succinctDescription];
  uint64_t v6 = [a2 sceneIdentifier];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Preventing supplemental snapshot requests because locked", (uint8_t *)&v7, 0x16u);
}

@end