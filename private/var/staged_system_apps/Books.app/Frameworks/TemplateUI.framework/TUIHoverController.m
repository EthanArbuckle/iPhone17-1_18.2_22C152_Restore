@interface TUIHoverController
- (BOOL)hoverStateForIdentifier:(id)a3;
- (NSHashTable)observers;
- (TUIHoverInteraction)hoverInteraction;
- (void)_axChanged:(id)a3;
- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4;
- (void)notifyHoverChangesAffectingView:(id)a3 changed:(id)a4;
- (void)registerHoverObserver:(id)a3;
- (void)reset;
- (void)unregisterHoverObserver:(id)a3;
- (void)updateHoverInteractionWithView:(id)a3;
@end

@implementation TUIHoverController

- (void)updateHoverInteractionWithView:(id)a3
{
  id v11 = a3;
  hoverInteraction = self->_hoverInteraction;
  if (hoverInteraction
    || (+[NSNotificationCenter defaultCenter],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 addObserver:self selector:"_axChanged:" name:kAXSApplicationAccessibilityEnabledNotification object:0], v5, (hoverInteraction = self->_hoverInteraction) != 0))
  {
    id v6 = [(TUIHoverInteraction *)hoverInteraction view];

    v7 = v11;
    if (v6 == v11) {
      goto LABEL_6;
    }
    hoverInteraction = self->_hoverInteraction;
  }
  v8 = [(TUIHoverInteraction *)hoverInteraction view];
  [v8 removeInteraction:self->_hoverInteraction];

  v9 = [[TUIHoverInteraction alloc] initWithDelegate:self view:v11];
  v10 = self->_hoverInteraction;
  self->_hoverInteraction = v9;

  [v11 addInteraction:self->_hoverInteraction];
  v7 = v11;
LABEL_6:
}

- (void)reset
{
  if (self->_hoverInteraction)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:kAXSApplicationAccessibilityEnabledNotification object:0];

    v4 = [(TUIHoverInteraction *)self->_hoverInteraction view];
    [v4 removeInteraction:self->_hoverInteraction];

    hoverInteraction = self->_hoverInteraction;
    self->_hoverInteraction = 0;
  }
}

- (void)_axChanged:(id)a3
{
  v4 = [(TUIHoverInteraction *)self->_hoverInteraction view];

  if (v4)
  {
    id v5 = [(TUIHoverInteraction *)self->_hoverInteraction view];
    [(TUIHoverController *)self notifyHoverChangesAffectingView:v5 changed:0];
  }
}

- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4
{
  hoverInteraction = self->_hoverInteraction;
  id v6 = a4;
  id v7 = [(TUIHoverInteraction *)hoverInteraction view];
  [(TUIHoverController *)self notifyHoverChangesAffectingView:v7 changed:v6];
}

- (BOOL)hoverStateForIdentifier:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(TUIHoverInteraction *)self->_hoverInteraction stateForRegionWithKey:v4];
  }

  return v5;
}

- (void)registerHoverObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = +[NSHashTable hashTableWithOptions:512];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)unregisterHoverObserver:(id)a3
{
}

- (void)notifyHoverChangesAffectingView:(id)a3 changed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_observers;
  id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "isDescendantOfView:", v6, (void)v14)) {
          [v13 hoverStateChanged:v7];
        }
      }
      id v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (TUIHoverInteraction)hoverInteraction
{
  return self->_hoverInteraction;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_hoverInteraction, 0);
}

@end