@interface SBPlatterHomeGestureManager
- (SBPlatterHomeGestureManager)initWithDelegate:(id)a3;
- (SBPlatterHomeGestureManagerDelegate)delegate;
- (id)_allParticipants;
- (id)_homeGestureContextForParticipant:(id)a3 creatingIfNecessary:(BOOL)a4 withWindowScene:(id)a5;
- (id)_participantForHomeGestureContext:(id)a3;
- (id)gestureRecognizerPriorityAssertionForBannerManagerHomeGestureContext:(id)a3;
- (id)keyboardHomeAffordanceAssertionForBannerManagerHomeGestureContext:(id)a3;
- (id)registerParticipant:(id)a3 windowScene:(id)a4;
- (void)_removeHomeGestureContextForParticipant:(id)a3;
- (void)bannerManagerHomeGestureContext:(id)a3 homeGestureOwnershipDidChange:(BOOL)a4;
- (void)unregisterParticipant:(id)a3;
- (void)wantsHomeGestureDidChangeForBannerManagerHomeGestureContext:(id)a3;
@end

@implementation SBPlatterHomeGestureManager

- (SBPlatterHomeGestureManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBPlatterHomeGestureManager;
  v5 = [(SBPlatterHomeGestureManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)registerParticipant:(id)a3 windowScene:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBPlatterHomeGestureManager.m", 35, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
  }
  v9 = SBLogBanners();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Platter home gesture manager asked to register participant: %{public}@", buf, 0xCu);
  }

  v10 = [(SBPlatterHomeGestureManager *)self _homeGestureContextForParticipant:v7 creatingIfNecessary:1 withWindowScene:v8];

  return v10;
}

- (void)unregisterParticipant:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = SBLogBanners();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Platter home gesture manager asked to unregister participant: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    v6 = [(SBPlatterHomeGestureManager *)self _homeGestureContextForParticipant:v4 creatingIfNecessary:0 withWindowScene:0];
    [v6 becomeActiveAffordanceIfPossible:0];
    [(SBPlatterHomeGestureManager *)self _removeHomeGestureContextForParticipant:v4];
  }
}

- (void)bannerManagerHomeGestureContext:(id)a3 homeGestureOwnershipDidChange:(BOOL)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v6 = [(SBPlatterHomeGestureManager *)self _participantForHomeGestureContext:v7];
    [WeakRetained platterHomeGestureManager:self participantOwningHomeGestureDidChange:v6];
  }
}

- (void)wantsHomeGestureDidChangeForBannerManagerHomeGestureContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();
  id v7 = [(SBPlatterHomeGestureManager *)self _allParticipants];
  id v8 = v7;
  if (v6) {
    [WeakRetained platterHomeGestureManager:self orderedParticipants:v7];
  }
  else {
  uint64_t v9 = [v7 allObjects];
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = -[SBPlatterHomeGestureManager _homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:](self, "_homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:", *(void *)(*((void *)&v18 + 1) + 8 * i), 0, 0, (void)v18);
        v17 = v16;
        if (v13 || ![v16 wantsToBeActiveAffordance]) {
          [v17 becomeActiveAffordanceIfPossible:0];
        }
        else {
          id v13 = v17;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }

  [v13 becomeActiveAffordanceIfPossible:1];
}

- (id)keyboardHomeAffordanceAssertionForBannerManagerHomeGestureContext:(id)a3
{
  id v4 = [(SBPlatterHomeGestureManager *)self _participantForHomeGestureContext:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([WeakRetained platterHomeGestureManager:self windowForParticipant:v4],
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = (void *)v6;
      id v8 = +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:v6];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)gestureRecognizerPriorityAssertionForBannerManagerHomeGestureContext:(id)a3
{
  id v4 = [(SBPlatterHomeGestureManager *)self _participantForHomeGestureContext:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [WeakRetained platterHomeGestureManager:self gestureRecognizerPriorityAssertionForParticipant:v4 reason:@"home gesture context"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_homeGestureContextForParticipant:(id)a3 creatingIfNecessary:(BOOL)a4 withWindowScene:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  id v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(NSMapTable *)v10->_participantsToHomeGestureContexts objectForKey:v8];
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v6;
  }
  if (!v12)
  {
    if (!v10->_participantsToHomeGestureContexts)
    {
      uint64_t v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      participantsToHomeGestureContexts = v10->_participantsToHomeGestureContexts;
      v10->_participantsToHomeGestureContexts = (NSMapTable *)v13;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [WeakRetained platterHomeGestureManager:v10 zStackParticipantIdentifierForParticipant:v8];
      if (v16 < 0)
      {
        v17 = SBLogBanners();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SBPlatterHomeGestureManager _homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:]((uint64_t)WeakRetained, (uint64_t)v8, v17);
        }

        uint64_t v11 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v11 = [[SBPlatterHomeGestureContext alloc] initWithParticipant:v8 participantIdentifier:v16 windowScene:v9];
    [(SBPlatterHomeGestureContext *)v11 setDelegate:v10];
    [(NSMapTable *)v10->_participantsToHomeGestureContexts setObject:v11 forKey:v8];
LABEL_16:
  }
  objc_sync_exit(v10);

LABEL_18:
  return v11;
}

- (id)_participantForHomeGestureContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v6 = v5->_participantsToHomeGestureContexts;
    id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          -[NSMapTable objectForKey:](v5->_participantsToHomeGestureContexts, "objectForKey:", v10, (void)v14);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v12 = v11 == v4;

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_removeHomeGestureContextForParticipant:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [(NSMapTable *)v5->_participantsToHomeGestureContexts removeObjectForKey:v7];
    if (![(NSMapTable *)v5->_participantsToHomeGestureContexts count])
    {
      participantsToHomeGestureContexts = v5->_participantsToHomeGestureContexts;
      v5->_participantsToHomeGestureContexts = 0;
    }
    objc_sync_exit(v5);

    id v4 = v7;
  }
}

- (id)_allParticipants
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v2->_participantsToHomeGestureContexts;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v3;
}

- (SBPlatterHomeGestureManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPlatterHomeGestureManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_participantsToHomeGestureContexts, 0);
}

- (void)_homeGestureContextForParticipant:(uint64_t)a1 creatingIfNecessary:(uint64_t)a2 withWindowScene:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Delegate (%{public}@) failed to return a home gesture participant ID for platter home gesture participant '%{public}@'", (uint8_t *)&v3, 0x16u);
}

@end