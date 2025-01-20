@interface SBRecentDisplayItemsController
- (BOOL)_displayItem:(id)a3 matchesBundleID:(id)a4;
- (BOOL)_displayItemIsExecutableOnCurrentPlatform:(id)a3;
- (BOOL)_displayItemRepresentsAppClip:(id)a3;
- (BOOL)_isDisallowedDisplayItem:(id)a3;
- (NSOrderedSet)recentDisplayItems;
- (SBRecentDisplayItemsController)init;
- (SBRecentDisplayItemsController)initWithRemovalPersonality:(int64_t)a3 movePersonality:(int64_t)a4 transitionFromSources:(id)a5 maxDisplayItems:(unint64_t)a6 eventSource:(id)a7 applicationController:(id)a8;
- (SBRecentDisplayItemsControllerDelegate)delegate;
- (id)_addStateCaptureHandler;
- (id)_allDisplayItemsForBundleID:(id)a3;
- (id)_allDisplayItemsForUniqueID:(id)a3;
- (id)_allDisplayItemsForWebClipID:(id)a3;
- (id)_allDisplayItemsPassingTest:(id)a3;
- (id)_associatedWebClipIdentifierForAppClipIdentifier:(id)a3 sceneIdentifier:(id)a4;
- (id)_displayItemForLayoutElement:(id)a3;
- (id)_firstDisplayItemForBundleID:(id)a3;
- (id)_firstDisplayItemForUniqueID:(id)a3;
- (id)_webClipForIdentifier:(id)a3;
- (void)_addDisplayItemToFront:(id)a3;
- (void)_addOrMoveDisplayItemToFront:(id)a3;
- (void)_applicationsBecameHidden:(id)a3;
- (void)_clearDelayAfterTransitionTimer;
- (void)_disallowAppFromAppearingWhileHidden:(id)a3;
- (void)_moveDisplayItemToFront:(id)a3;
- (void)_removeDisplayItem:(id)a3;
- (void)_setupDelayAfterTransitionTimerForActivatingElement:(id)a3;
- (void)dealloc;
- (void)eventSource:(id)a3 applicationsBecameHidden:(id)a4;
- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7;
- (void)eventSource:(id)a3 keyboardFocusChangedToApplication:(id)a4;
- (void)eventSource:(id)a3 userDeletedApplications:(id)a4;
- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4;
- (void)eventSource:(id)a3 userQuitApplicationInSwitcher:(id)a4;
- (void)eventSource:(id)a3 userRemovedSuggestions:(id)a4;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setRecentDisplayItems:(id)a3;
@end

@implementation SBRecentDisplayItemsController

- (SBRecentDisplayItemsController)initWithRemovalPersonality:(int64_t)a3 movePersonality:(int64_t)a4 transitionFromSources:(id)a5 maxDisplayItems:(unint64_t)a6 eventSource:(id)a7 applicationController:(id)a8
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBRecentDisplayItemsController;
  v18 = [(SBRecentDisplayItemsController *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_removalPersonality = a3;
    v18->_movePersonality = a4;
    objc_storeStrong((id *)&v18->_relevantTransitionFromSources, a5);
    v19->_maxDisplayItems = a6;
    objc_storeStrong((id *)&v19->_appController, a8);
    [v16 addObserver:v19];
    uint64_t v20 = [(SBRecentDisplayItemsController *)v19 _addStateCaptureHandler];
    stateCaptureInvalidatable = v19->_stateCaptureInvalidatable;
    v19->_stateCaptureInvalidatable = (BSInvalidatable *)v20;

    uint64_t v22 = +[SBHomeGestureDomain rootSettings];
    homeGestureSettings = v19->_homeGestureSettings;
    v19->_homeGestureSettings = (SBHomeGestureSettings *)v22;
  }
  return v19;
}

- (SBRecentDisplayItemsController)init
{
  return [(SBRecentDisplayItemsController *)self initWithRemovalPersonality:0 movePersonality:0 transitionFromSources:0 maxDisplayItems:0 eventSource:0 applicationController:0];
}

- (void)setRecentDisplayItems:(id)a3
{
  v4 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:a3];
  recentDisplayItems = self->_recentDisplayItems;
  self->_recentDisplayItems = v4;
}

- (NSOrderedSet)recentDisplayItems
{
  return (NSOrderedSet *)self->_recentDisplayItems;
}

- (void)reset
{
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBRecentDisplayItemsController;
  [(SBRecentDisplayItemsController *)&v3 dealloc];
}

- (void)eventSource:(id)a3 userRemovedSuggestions:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id obj = a4;
  if ((self->_removalPersonality & 8) != 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __69__SBRecentDisplayItemsController_eventSource_userRemovedSuggestions___block_invoke;
          v20[3] = &unk_1E6AF4B38;
          v20[4] = v9;
          v10 = [(SBRecentDisplayItemsController *)self _allDisplayItemsPassingTest:v20];
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v17;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v17 != v13) {
                  objc_enumerationMutation(v10);
                }
                [(SBRecentDisplayItemsController *)self _removeDisplayItem:*(void *)(*((void *)&v16 + 1) + 8 * v14++)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }
  }
}

uint64_t __69__SBRecentDisplayItemsController_eventSource_userRemovedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 uniqueIdentifier];
    uint64_t v5 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  return v5;
}

- (void)eventSource:(id)a3 userDeletedApplications:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = v5;
  if ((self->_removalPersonality & 4) != 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v12 = -[SBRecentDisplayItemsController _allDisplayItemsForBundleID:](self, "_allDisplayItemsForBundleID:", v11, 0);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v18;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v18 != v15) {
                  objc_enumerationMutation(v12);
                }
                [(SBRecentDisplayItemsController *)self _removeDisplayItem:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
              }
              while (v14 != v16);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v14);
          }

          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }
  }
}

- (void)eventSource:(id)a3 applicationsBecameHidden:(id)a4
{
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  if ((self->_movePersonality & 2) != 0)
  {
    id v5 = a4;
    [(SBRecentDisplayItemsController *)self _clearDelayAfterTransitionTimer];
    id v6 = [(SBRecentDisplayItemsController *)self _firstDisplayItemForBundleID:v5];

    [(SBRecentDisplayItemsController *)self _moveDisplayItemToFront:v6];
  }
}

- (void)eventSource:(id)a3 keyboardFocusChangedToApplication:(id)a4
{
  if ((self->_movePersonality & 4) != 0)
  {
    id v5 = [(SBRecentDisplayItemsController *)self _firstDisplayItemForBundleID:a4];
    [(SBRecentDisplayItemsController *)self _moveDisplayItemToFront:v5];
  }
}

- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  id v28 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 == 1)
  {
    if ((self->_movePersonality & 1) == 0) {
      goto LABEL_18;
    }
    objc_super v25 = +[SBDisplayItem homeScreenDisplayItem];
    [(SBRecentDisplayItemsController *)self _moveDisplayItemToFront:v25];
    goto LABEL_17;
  }
  if (a4 == 3)
  {
    [(SBRecentDisplayItemsController *)self _clearDelayAfterTransitionTimer];
    int64_t movePersonality = self->_movePersonality;
    if ((movePersonality & 0x10) != 0)
    {
      uint64_t v15 = [v12 elementWithRole:3];
      uint64_t v16 = [(SBRecentDisplayItemsController *)self _displayItemForLayoutElement:v15];
      [(SBRecentDisplayItemsController *)self _addOrMoveDisplayItemToFront:v16];

      long long v17 = [v12 elementWithRole:2];
      long long v18 = [(SBRecentDisplayItemsController *)self _displayItemForLayoutElement:v17];
      [(SBRecentDisplayItemsController *)self _addOrMoveDisplayItemToFront:v18];

      long long v19 = [v12 elementWithRole:1];
      long long v20 = [(SBRecentDisplayItemsController *)self _displayItemForLayoutElement:v19];
      [(SBRecentDisplayItemsController *)self _addOrMoveDisplayItemToFront:v20];

      int64_t movePersonality = self->_movePersonality;
    }
    if ((movePersonality & 8) != 0)
    {
      relevantTransitionFromSources = self->_relevantTransitionFromSources;
      if (!relevantTransitionFromSources
        || ([NSNumber numberWithInteger:a7],
            long long v22 = objc_claimAutoreleasedReturnValue(),
            BOOL v23 = [(NSSet *)relevantTransitionFromSources containsObject:v22],
            v22,
            v23))
      {
        if (v13)
        {
          id v24 = v13;
        }
        else
        {
          id v24 = [v12 elementWithRole:1];
        }
        objc_super v25 = v24;
        if (a7 == 11
          && ([(SBHomeGestureSettings *)self->_homeGestureSettings secondsToResetSwitcherListAfterTransition], v26 > 0.0))
        {
          [(SBRecentDisplayItemsController *)self _setupDelayAfterTransitionTimerForActivatingElement:v25];
        }
        else
        {
          uint64_t v27 = [(SBRecentDisplayItemsController *)self _displayItemForLayoutElement:v25];
          [(SBRecentDisplayItemsController *)self _addOrMoveDisplayItemToFront:v27];
        }
LABEL_17:
      }
    }
  }
LABEL_18:
}

- (void)eventSource:(id)a3 userQuitApplicationInSwitcher:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_removalPersonality)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = -[SBRecentDisplayItemsController _allDisplayItemsForBundleID:](self, "_allDisplayItemsForBundleID:", a4, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(SBRecentDisplayItemsController *)self _removeDisplayItem:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((self->_removalPersonality & 4) != 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(a4, "webClip", a3, 0);
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [(SBRecentDisplayItemsController *)self _allDisplayItemsForWebClipID:v6];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(SBRecentDisplayItemsController *)self _removeDisplayItem:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_clearDelayAfterTransitionTimer
{
  [(NSTimer *)self->_delayAfterTransitionTimer invalidate];
  delayAfterTransitionTimer = self->_delayAfterTransitionTimer;
  self->_delayAfterTransitionTimer = 0;
}

- (void)_setupDelayAfterTransitionTimerForActivatingElement:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F1CB00];
  [(SBHomeGestureSettings *)self->_homeGestureSettings secondsToResetSwitcherListAfterTransition];
  double v7 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__SBRecentDisplayItemsController__setupDelayAfterTransitionTimerForActivatingElement___block_invoke;
  v12[3] = &unk_1E6AF8EE0;
  objc_copyWeak(&v14, &location);
  id v8 = v4;
  id v13 = v8;
  uint64_t v9 = [v5 timerWithTimeInterval:0 repeats:v12 block:v7];
  delayAfterTransitionTimer = self->_delayAfterTransitionTimer;
  self->_delayAfterTransitionTimer = v9;

  uint64_t v11 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v11 addTimer:self->_delayAfterTransitionTimer forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __86__SBRecentDisplayItemsController__setupDelayAfterTransitionTimerForActivatingElement___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained _displayItemForLayoutElement:*(void *)(a1 + 32)];
  [WeakRetained _addOrMoveDisplayItemToFront:v2];

  [WeakRetained _clearDelayAfterTransitionTimer];
}

- (BOOL)_displayItemIsExecutableOnCurrentPlatform:(id)a3
{
  id v4 = a3;
  if ([v4 type])
  {
    char v5 = 1;
  }
  else
  {
    appController = self->_appController;
    double v7 = [v4 bundleIdentifier];
    id v8 = [(SBApplicationController *)appController applicationWithBundleIdentifier:v7];

    uint64_t v9 = [v8 info];
    if ([v9 supports64Bit])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v10 = +[SBApplicationPlaceholderController sharedInstance];
      uint64_t v11 = [v4 bundleIdentifier];
      long long v12 = [v10 placeholderForDisplayID:v11];
      char v5 = [v12 isAppClip];
    }
  }

  return v5;
}

- (BOOL)_isDisallowedDisplayItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.purplebuddy", 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = [v3 bundleIdentifier];
        LOBYTE(v8) = [v9 isEqualToString:v8];

        if (v8)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_firstDisplayItemForUniqueID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_recentDisplayItems;
  id v6 = (id)[(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "uniqueIdentifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_displayItem:(id)a3 matchesBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 5
    && [(SBRecentDisplayItemsController *)self _displayItemRepresentsAppClip:v6])
  {
    uint64_t v8 = [v6 uniqueIdentifier];
    uint64_t v9 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v8];

    uint64_t v10 = [(SBRecentDisplayItemsController *)self _webClipForIdentifier:v9];
    char v11 = [v10 applicationBundleIdentifier];
    char v12 = [v11 isEqualToString:v7];
  }
  else
  {
    uint64_t v9 = [v6 bundleIdentifier];
    char v12 = [v9 isEqualToString:v7];
  }

  return v12;
}

- (id)_firstDisplayItemForBundleID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_recentDisplayItems;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (-[SBRecentDisplayItemsController _displayItem:matchesBundleID:](self, "_displayItem:matchesBundleID:", v10, v4, (void)v13))
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)_allDisplayItemsForBundleID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SBRecentDisplayItemsController__allDisplayItemsForBundleID___block_invoke;
  v8[3] = &unk_1E6AFAE20;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(SBRecentDisplayItemsController *)self _allDisplayItemsPassingTest:v8];

  return v6;
}

uint64_t __62__SBRecentDisplayItemsController__allDisplayItemsForBundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _displayItem:a2 matchesBundleID:*(void *)(a1 + 40)];
}

- (id)_allDisplayItemsForUniqueID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SBRecentDisplayItemsController__allDisplayItemsForUniqueID___block_invoke;
  v8[3] = &unk_1E6AF4B38;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(SBRecentDisplayItemsController *)self _allDisplayItemsPassingTest:v8];

  return v6;
}

uint64_t __62__SBRecentDisplayItemsController__allDisplayItemsForUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_allDisplayItemsForWebClipID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SBRecentDisplayItemsController__allDisplayItemsForWebClipID___block_invoke;
  v8[3] = &unk_1E6AF4B38;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(SBRecentDisplayItemsController *)self _allDisplayItemsPassingTest:v8];

  return v6;
}

uint64_t __63__SBRecentDisplayItemsController__allDisplayItemsForWebClipID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 5)
  {
    id v4 = [v3 uniqueIdentifier];
    id v5 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v4];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_allDisplayItemsPassingTest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_recentDisplayItems;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          if (!v8)
          {
            uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", (void)v13);
          }
          objc_msgSend(v8, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_displayItemForLayoutElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 workspaceEntity];
  if ([v4 isApplicationSceneEntity])
  {
    id v5 = [v4 application];
    if ([v5 isWebApplication])
    {
      uint64_t v6 = [v3 uniqueIdentifier];
      uint64_t v7 = +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:v6];
LABEL_8:

      goto LABEL_9;
    }
    uint64_t v6 = [v5 bundleIdentifier];
    uint64_t v8 = [v3 uniqueIdentifier];
LABEL_7:
    uint64_t v9 = (void *)v8;
    uint64_t v7 = +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:v6 sceneIdentifier:v8];

    goto LABEL_8;
  }
  if ([v4 isAppClipPlaceholderEntity])
  {
    id v5 = [v4 appClipPlaceholderEntity];
    uint64_t v6 = [v5 bundleIdentifier];
    uint64_t v8 = [v5 futureSceneIdentifier];
    goto LABEL_7;
  }
  if ([v4 isHomeScreenEntity])
  {
    uint64_t v7 = +[SBDisplayItem homeScreenDisplayItem];
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)_addOrMoveDisplayItemToFront:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 type])
  {
    id v5 = [(SBRecentDisplayItemsController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v5 recentDisplayItemsControllerShouldRepresentAppClipsAsWebClips:self]
      && [(SBRecentDisplayItemsController *)self _displayItemRepresentsAppClip:v4])
    {
      uint64_t v6 = [v4 bundleIdentifier];
      uint64_t v7 = [v4 uniqueIdentifier];
      uint64_t v8 = [(SBRecentDisplayItemsController *)self _associatedWebClipIdentifierForAppClipIdentifier:v6 sceneIdentifier:v7];

      if (!v8)
      {

        goto LABEL_21;
      }
      uint64_t v9 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v8];
      uint64_t v10 = +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:v9];

      id v4 = (id)v10;
    }
  }
  if ([(NSMutableOrderedSet *)self->_recentDisplayItems containsObject:v4])
  {
    [(SBRecentDisplayItemsController *)self _moveDisplayItemToFront:v4];
  }
  else
  {
    if (-[NSMutableOrderedSet count](self->_recentDisplayItems, "count") && ![v4 type])
    {
      recentDisplayItems = self->_recentDisplayItems;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __63__SBRecentDisplayItemsController__addOrMoveDisplayItemToFront___block_invoke;
      v22[3] = &unk_1E6AFAE48;
      id v23 = v4;
      char v12 = [(NSMutableOrderedSet *)recentDisplayItems indexesOfObjectsPassingTest:v22];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v13 = -[NSMutableOrderedSet objectsAtIndexes:](self->_recentDisplayItems, "objectsAtIndexes:", v12, 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            [(SBRecentDisplayItemsController *)self _removeDisplayItem:*(void *)(*((void *)&v18 + 1) + 8 * v17++)];
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v15);
      }
    }
    [(SBRecentDisplayItemsController *)self _addDisplayItemToFront:v4];
  }
LABEL_21:
}

uint64_t __63__SBRecentDisplayItemsController__addOrMoveDisplayItemToFront___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  id v4 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_addDisplayItemToFront:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = (NSMutableOrderedSet *)a3;
  if (v4
    && [(SBRecentDisplayItemsController *)self _displayItemIsExecutableOnCurrentPlatform:v4]&& ![(SBRecentDisplayItemsController *)self _isDisallowedDisplayItem:v4])
  {
    id WeakRetained = (NSMutableOrderedSet *)objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      int v6 = [(NSMutableOrderedSet *)WeakRetained recentDisplayItemsController:self shouldAddItem:v4];
    }
    else {
      int v6 = 1;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F4B7E0];
    uint64_t v8 = [(NSMutableOrderedSet *)v4 bundleIdentifier];
    uint64_t v9 = [v7 applicationWithBundleIdentifier:v8];

    int v10 = [v9 isHidden];
    uint64_t v11 = SBLogDockRecents();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10 || !v6)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412546;
        v30 = WeakRetained;
        __int16 v31 = 2112;
        v32 = v4;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "delegate %@ returned NO for recentDisplayItemsController:shouldAddItem: %@", buf, 0x16u);
      }
    }
    else
    {
      if (v12)
      {
        recentDisplayItems = self->_recentDisplayItems;
        *(_DWORD *)buf = 138412546;
        v30 = v4;
        __int16 v31 = 2112;
        v32 = recentDisplayItems;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "will insertObject: %@; atIndex: 0; into: %@;",
          buf,
          0x16u);
      }

      [(NSMutableOrderedSet *)self->_recentDisplayItems insertObject:v4 atIndex:0];
      unint64_t v14 = [(NSMutableOrderedSet *)self->_recentDisplayItems count];
      uint64_t v11 = 0;
      NSUInteger maxDisplayItems = self->_maxDisplayItems;
      if (v14 > maxDisplayItems)
      {
        NSUInteger v16 = [(NSMutableOrderedSet *)self->_recentDisplayItems count] - self->_maxDisplayItems;
        uint64_t v17 = SBLogDockRecents();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v34.id location = maxDisplayItems;
          v34.length = v16;
          NSStringFromRange(v34);
          long long v18 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
          long long v19 = self->_recentDisplayItems;
          *(_DWORD *)buf = 138412546;
          v30 = v18;
          __int16 v31 = 2112;
          v32 = v19;
          _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "will removeObjectsInRange: %@; from: %@;", buf, 0x16u);
        }
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithOrderedSet:range:copyItems:", self->_recentDisplayItems, maxDisplayItems, v16, 0);
        -[NSMutableOrderedSet removeObjectsInRange:](self->_recentDisplayItems, "removeObjectsInRange:", maxDisplayItems, v16);
      }
      if (objc_opt_respondsToSelector()) {
        [(NSMutableOrderedSet *)WeakRetained recentDisplayItemsControllerDidUpdateDisplayItems:self];
      }
      if (v11)
      {
        if (objc_opt_respondsToSelector())
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v11 = v11;
          uint64_t v20 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v25;
            do
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v25 != v22) {
                  objc_enumerationMutation(v11);
                }
                -[NSMutableOrderedSet recentDisplayItemsController:didAddItem:andDropItem:](WeakRetained, "recentDisplayItemsController:didAddItem:andDropItem:", self, v4, *(void *)(*((void *)&v24 + 1) + 8 * v23++), (void)v24);
              }
              while (v21 != v23);
              uint64_t v21 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
            }
            while (v21);
          }
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        [(NSMutableOrderedSet *)WeakRetained recentDisplayItemsController:self didAddItem:v4];
      }
    }
  }
}

- (void)_moveDisplayItemToFront:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && [(NSMutableOrderedSet *)self->_recentDisplayItems containsObject:v4]
    && [(SBRecentDisplayItemsController *)self _displayItemIsExecutableOnCurrentPlatform:v4])
  {
    uint64_t v5 = SBLogDockRecents();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      recentDisplayItems = self->_recentDisplayItems;
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      long long v13 = recentDisplayItems;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "will removeObject: %@; from: %@;", (uint8_t *)&v10, 0x16u);
    }

    [(NSMutableOrderedSet *)self->_recentDisplayItems removeObject:v4];
    uint64_t v7 = SBLogDockRecents();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = self->_recentDisplayItems;
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      long long v13 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "will insertObject: %@; atIndex 0; into: %@;",
        (uint8_t *)&v10,
        0x16u);
    }

    [(NSMutableOrderedSet *)self->_recentDisplayItems insertObject:v4 atIndex:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained recentDisplayItemsControllerDidUpdateDisplayItems:self];
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained recentDisplayItemsController:self didMoveItemToFront:v4];
    }
  }
}

- (void)_removeDisplayItem:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(NSMutableOrderedSet *)self->_recentDisplayItems containsObject:v4])
  {
    uint64_t v5 = SBLogDockRecents();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      recentDisplayItems = self->_recentDisplayItems;
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = recentDisplayItems;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "will removeObject: %@; from: %@;", (uint8_t *)&v8, 0x16u);
    }

    [(NSMutableOrderedSet *)self->_recentDisplayItems removeObject:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained recentDisplayItemsControllerDidUpdateDisplayItems:self];
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained recentDisplayItemsController:self didRemoveItem:v4];
    }
  }
}

- (void)_disallowAppFromAppearingWhileHidden:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  [(SBRecentDisplayItemsController *)self _applicationsBecameHidden:v4];
}

- (BOOL)_displayItemRepresentsAppClip:(id)a3
{
  id v4 = a3;
  if (![v4 type])
  {
    int v6 = [v4 bundleIdentifier];
    uint64_t v7 = [(SBApplicationController *)self->_appController applicationWithBundleIdentifier:v6];
    id v9 = [v7 info];
    if ([v9 isAppClip])
    {
      char v8 = 1;
    }
    else
    {
      __int16 v10 = +[SBApplicationPlaceholderController sharedInstance];
      id v11 = [v10 placeholderForDisplayID:v6];
      char v8 = [v11 isAppClip];
    }
    goto LABEL_9;
  }
  if ([v4 type] == 5)
  {
    uint64_t v5 = [v4 uniqueIdentifier];
    int v6 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v5];

    uint64_t v7 = [(SBRecentDisplayItemsController *)self _webClipForIdentifier:v6];
    char v8 = [v7 isAppClip];
LABEL_9:

    goto LABEL_10;
  }
  char v8 = 0;
LABEL_10:

  return v8;
}

- (id)_associatedWebClipIdentifierForAppClipIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F628D8];
  id v6 = a4;
  uint64_t v7 = [v5 storeForApplication:a3];
  char v8 = [v7 sceneStoreForIdentifier:v6 creatingIfNecessary:0];

  id v9 = [v8 objectForKey:@"appClipIdentifier"];

  return v9;
}

- (id)_webClipForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[SBIconController sharedInstance];
  id v6 = [v5 model];
  uint64_t v7 = [v6 leafIconForIdentifier:v3];
  char v8 = SBSafeCast(v4, v7);

  if (v8) {
    [v8 webClip];
  }
  else {
  id v9 = [MEMORY[0x1E4F43048] webClipWithIdentifier:v3];
  }

  return v9;
}

- (id)_addStateCaptureHandler
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"SpringBoard - SBRecentDisplayItemsController - %p", self);
  objc_initWeak(&location, self);
  id v4 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v7, &location);
  uint64_t v5 = BSLogAddStateCaptureBlockWithTitle();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v5;
}

__CFString *__57__SBRecentDisplayItemsController__addStateCaptureHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained[1] description];
  }
  else
  {
    id v3 = &stru_1F3084718;
  }

  return v3;
}

- (void)_applicationsBecameHidden:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if ((self->_removalPersonality & 2) != 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v11 = -[SBRecentDisplayItemsController _allDisplayItemsForBundleID:](self, "_allDisplayItemsForBundleID:", v10, 0);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v17;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v17 != v14) {
                  objc_enumerationMutation(v11);
                }
                [(SBRecentDisplayItemsController *)self _removeDisplayItem:*(void *)(*((void *)&v16 + 1) + 8 * v15++)];
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v13);
          }

          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }
  }
}

- (SBRecentDisplayItemsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRecentDisplayItemsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_delayAfterTransitionTimer, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_relevantTransitionFromSources, 0);
  objc_storeStrong((id *)&self->_recentDisplayItems, 0);
}

@end