@interface SBAppClipOverlayCoordinator
- (SBAppClipOverlayCoordinator)init;
- (id)_existingOverlayViewControllerForWebClipIdentifier:(id)a3;
- (id)overlayViewControllerForBundleIdentifier:(id)a3 webClipIdentifier:(id)a4 participant:(id)a5;
- (void)participant:(id)a3 didSurrenderViewController:(id)a4;
@end

@implementation SBAppClipOverlayCoordinator

- (SBAppClipOverlayCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppClipOverlayCoordinator;
  v2 = [(SBAppClipOverlayCoordinator *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    overlayViewControllers = v2->_overlayViewControllers;
    v2->_overlayViewControllers = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    participantForViewController = v2->_participantForViewController;
    v2->_participantForViewController = (NSMapTable *)v5;
  }
  return v2;
}

- (id)overlayViewControllerForBundleIdentifier:(id)a3 webClipIdentifier:(id)a4 participant:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 participantName];
  uint64_t v13 = [(SBAppClipOverlayCoordinator *)self _existingOverlayViewControllerForWebClipIdentifier:v10];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(NSMapTable *)self->_participantForViewController objectForKey:v13];
    if (!v15)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"SBAppClipOverlayCoordinator.m", 35, @"We expect to have a particpant for this overlay. Bundle identifier: %@ web clip identifier: %@", v9, v10 object file lineNumber description];
    }
    v16 = SBLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v27 = v9;
      v19 = v18 = a2;
      v20 = [v15 participantName];
      *(_DWORD *)buf = 138544130;
      v29 = v19;
      __int16 v30 = 2114;
      v31 = v20;
      __int16 v32 = 2050;
      v33 = v14;
      __int16 v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "%{public}@ asking participant %{public}@ to relinquish ownership of %{public}p to give to participant: %{public}@", buf, 0x2Au);

      a2 = v18;
      id v9 = v27;
    }

    [v15 appClipOverlayCoordinator:self requestsSurrenderOfViewController:v14];
    if ([(NSMutableSet *)self->_overlayViewControllers containsObject:v14])
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"SBAppClipOverlayCoordinator.m" lineNumber:41 description:@"Participants must relinquish synchronously"];
    }
  }
  else
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F59140]) initWithAppClipBundleID:v9 webClipID:v10];
  }
  [(NSMutableSet *)self->_overlayViewControllers addObject:v14];
  [(NSMapTable *)self->_participantForViewController setObject:v11 forKey:v14];

  v21 = SBLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543874;
    v29 = v23;
    __int16 v30 = 2050;
    v31 = v14;
    __int16 v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "%{public}@ handing ownership of %{public}p to participant: %{public}@", buf, 0x20u);
  }
  return v14;
}

- (void)participant:(id)a3 didSurrenderViewController:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 participantName];
  if (([(NSMutableSet *)self->_overlayViewControllers containsObject:v7] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBAppClipOverlayCoordinator.m", 58, @"%@ is asking to relinquish a view controller we don't know about %@", v9, v7 object file lineNumber description];
  }
  id v10 = [(NSMapTable *)self->_participantForViewController objectForKey:v7];
  char v11 = [v10 isEqual:v8];

  if ((v11 & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBAppClipOverlayCoordinator.m", 59, @"%@ is asking to relinquish a view controller it doesn't own %@", v9, v7 object file lineNumber description];
  }
  [(NSMutableSet *)self->_overlayViewControllers removeObject:v7];
  [(NSMapTable *)self->_participantForViewController removeObjectForKey:v7];
  v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543874;
    v18 = v14;
    __int16 v19 = 2114;
    v20 = v9;
    __int16 v21 = 2050;
    id v22 = v7;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "%{public}@ participant: %{public}@ relinquished view controller: %{public}p", buf, 0x20u);
  }
}

- (id)_existingOverlayViewControllerForWebClipIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_overlayViewControllers;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "webClipID", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantForViewController, 0);
  objc_storeStrong((id *)&self->_overlayViewControllers, 0);
}

@end