@interface SBBacklightSignificantUserInteractionMonitor
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSCoverSheetViewController)coverSheetViewController;
- (NSString)coverSheetIdentifier;
- (int64_t)participantState;
- (void)_notifyObserversOfSignificantUserInteraction;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCoverSheetViewController:(id)a3;
@end

@implementation SBBacklightSignificantUserInteractionMonitor

- (void)addObserver:(id)a3
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

- (void)removeObserver:(id)a3
{
}

- (void)setCoverSheetViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  if (WeakRetained != obj)
  {
    [WeakRetained unregisterExternalEventHandler:self];
    objc_storeWeak((id *)&self->_coverSheetViewController, obj);
    [obj registerExternalEventHandler:self];
  }
}

- (void)_notifyObserversOfSignificantUserInteraction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(NSHashTable *)self->_observers allObjects];
  id v4 = (void *)[v3 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "significantUserInteractionMonitorDetectedSignificantUserInteraction:", self, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)participantState
{
  return 2;
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4 = [a3 type];
  if (v4 == 21 || v4 == 12) {
    [(SBBacklightSignificantUserInteractionMonitor *)self _notifyObserversOfSignificantUserInteraction];
  }
  return 0;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  return (CSCoverSheetViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverSheetViewController);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end