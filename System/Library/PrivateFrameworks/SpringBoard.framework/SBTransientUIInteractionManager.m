@interface SBTransientUIInteractionManager
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (NSHashTable)indirectPanToParticipants;
- (NSHashTable)tapToDismissParticipants;
- (NSHashTable)tapToUnhideParticipants;
- (SBFailingSystemGestureRecognizer)dismissGestureRecognizer;
- (SBSystemGestureManager)systemGestureManager;
- (SBTransientUIInteractionManager)initWithSystemGestureManager:(id)a3;
- (UIPanGestureRecognizer)indirectPanRecognizer;
- (UITapGestureRecognizer)unhideDoubleTapRecognizer;
- (UITapGestureRecognizer)unhideTapRecognizer;
- (UIWindow)window;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (void)_screenWasIndirectPannedToDismiss:(id)a3;
- (void)_screenWasTappedToUnhide:(id)a3;
- (void)registerParticipantForIndirectPanToDismiss:(id)a3;
- (void)registerParticipantForTapToDismiss:(id)a3;
- (void)registerParticipantForTapToUnhide:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
- (void)setIndirectPanRecognizer:(id)a3;
- (void)setIndirectPanToParticipants:(id)a3;
- (void)setSystemGestureManager:(id)a3;
- (void)setTapToDismissParticipants:(id)a3;
- (void)setTapToUnhideParticipants:(id)a3;
- (void)setUnhideDoubleTapRecognizer:(id)a3;
- (void)setUnhideTapRecognizer:(id)a3;
- (void)unregisterParticipantForIndirectPanToDismiss:(id)a3;
- (void)unregisterParticipantForTapToDismiss:(id)a3;
- (void)unregisterParticipantForTapToUnhide:(id)a3;
@end

@implementation SBTransientUIInteractionManager

- (SBTransientUIInteractionManager)initWithSystemGestureManager:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBTransientUIInteractionManager;
  v5 = [(SBTransientUIInteractionManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_systemGestureManager, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    tapToDismissParticipants = v6->_tapToDismissParticipants;
    v6->_tapToDismissParticipants = (NSHashTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    tapToUnhideParticipants = v6->_tapToUnhideParticipants;
    v6->_tapToUnhideParticipants = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    indirectPanToParticipants = v6->_indirectPanToParticipants;
    v6->_indirectPanToParticipants = (NSHashTable *)v11;

    dismissGestureRecognizer = v6->_dismissGestureRecognizer;
    v6->_dismissGestureRecognizer = 0;

    unhideTapRecognizer = v6->_unhideTapRecognizer;
    v6->_unhideTapRecognizer = 0;

    unhideDoubleTapRecognizer = v6->_unhideDoubleTapRecognizer;
    v6->_unhideDoubleTapRecognizer = 0;

    indirectPanRecognizer = v6->_indirectPanRecognizer;
    v6->_indirectPanRecognizer = 0;
  }
  return v6;
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  v3 = [WeakRetained windowForSystemGestures];

  return (UIWindow *)v3;
}

- (void)_screenWasTappedToUnhide:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (UITapGestureRecognizer *)a3;
  if (self->_unhideTapRecognizer == v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = (void *)[(NSHashTable *)self->_tapToUnhideParticipants copy];
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
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) transientUI:self wasTappedToUnhideFromGestureRecognizer:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_screenWasIndirectPannedToDismiss:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_indirectPanRecognizer == v4 && [(UIPanGestureRecognizer *)v4 state] == 1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = (void *)[(NSHashTable *)self->_indirectPanToParticipants copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) transientUI:self wasIndirectPannedToDismissFromGestureRecognizer:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if ((UITapGestureRecognizer *)self->_dismissGestureRecognizer == v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = (void *)[(NSHashTable *)self->_tapToDismissParticipants copy];
    uint64_t v8 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      char v10 = 0;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * i) transientUIHandledTouch:v7 withSystemGestureRecognizer:v6])char v10 = 1; {
        }
          }
        uint64_t v8 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
      LOBYTE(v8) = v10 & 1;
    }
  }
  else
  {
    LOBYTE(v8) = self->_unhideTapRecognizer == v6 || self->_unhideDoubleTapRecognizer == v6;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  id v4 = [WeakRetained windowForSystemGestures];

  return v4;
}

- (void)registerParticipantForTapToDismiss:(id)a3
{
  id v7 = a3;
  if (!-[NSHashTable containsObject:](self->_tapToDismissParticipants, "containsObject:")) {
    [(NSHashTable *)self->_tapToDismissParticipants addObject:v7];
  }
  if ([(NSHashTable *)self->_tapToDismissParticipants count] && !self->_dismissGestureRecognizer)
  {
    id v4 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = v4;

    [(SBFailingSystemGestureRecognizer *)self->_dismissGestureRecognizer setName:@"transientUI.dismiss"];
    [(SBFailingSystemGestureRecognizer *)self->_dismissGestureRecognizer setAllowedTouchTypes:&unk_1F3347BF8];
    [(SBFailingSystemGestureRecognizer *)self->_dismissGestureRecognizer setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    [WeakRetained addGestureRecognizer:self->_dismissGestureRecognizer withType:33];
  }
}

- (void)unregisterParticipantForTapToDismiss:(id)a3
{
  id v6 = a3;
  if (-[NSHashTable containsObject:](self->_tapToDismissParticipants, "containsObject:")) {
    [(NSHashTable *)self->_tapToDismissParticipants removeObject:v6];
  }
  if (![(NSHashTable *)self->_tapToDismissParticipants count] && self->_dismissGestureRecognizer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    [WeakRetained removeGestureRecognizer:self->_dismissGestureRecognizer];

    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = 0;
  }
}

- (void)registerParticipantForTapToUnhide:(id)a3
{
  id v9 = a3;
  if (!-[NSHashTable containsObject:](self->_tapToUnhideParticipants, "containsObject:")) {
    [(NSHashTable *)self->_tapToUnhideParticipants addObject:v9];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  if ([(NSHashTable *)self->_tapToUnhideParticipants count])
  {
    if (!self->_unhideTapRecognizer)
    {
      v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__screenWasTappedToUnhide_];
      unhideTapRecognizer = self->_unhideTapRecognizer;
      self->_unhideTapRecognizer = v5;

      [(UITapGestureRecognizer *)self->_unhideTapRecognizer setName:@"transientUI.unhide.tap"];
      [(UITapGestureRecognizer *)self->_unhideTapRecognizer setCancelsTouchesInView:0];
      [(UITapGestureRecognizer *)self->_unhideTapRecognizer setDelaysTouchesBegan:0];
      [(UITapGestureRecognizer *)self->_unhideTapRecognizer setDelaysTouchesEnded:0];
      [(UITapGestureRecognizer *)self->_unhideTapRecognizer setAllowedTouchTypes:&unk_1F3347C10];
      [(UITapGestureRecognizer *)self->_unhideTapRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
      [(UITapGestureRecognizer *)self->_unhideTapRecognizer setDelegate:self];
      [WeakRetained addGestureRecognizer:self->_unhideTapRecognizer withType:35];
    }
    if (!self->_unhideDoubleTapRecognizer)
    {
      id v7 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
      unhideDoubleTapRecognizer = self->_unhideDoubleTapRecognizer;
      self->_unhideDoubleTapRecognizer = v7;

      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer setName:@"transientUI.unhide.doubleTap"];
      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer setNumberOfTapsRequired:2];
      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer setCancelsTouchesInView:0];
      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer setDelaysTouchesBegan:0];
      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer setDelaysTouchesEnded:0];
      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer setAllowedTouchTypes:&unk_1F3347C28];
      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
      [(UITapGestureRecognizer *)self->_unhideDoubleTapRecognizer setDelegate:self];
      [(UITapGestureRecognizer *)self->_unhideTapRecognizer requireGestureRecognizerToFail:self->_unhideDoubleTapRecognizer];
      [WeakRetained addGestureRecognizer:self->_unhideDoubleTapRecognizer withType:36];
    }
  }
}

- (void)unregisterParticipantForTapToUnhide:(id)a3
{
  id v7 = a3;
  if (-[NSHashTable containsObject:](self->_tapToUnhideParticipants, "containsObject:")) {
    [(NSHashTable *)self->_tapToUnhideParticipants removeObject:v7];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  if (![(NSHashTable *)self->_tapToUnhideParticipants count])
  {
    [WeakRetained removeGestureRecognizer:self->_unhideTapRecognizer];
    unhideTapRecognizer = self->_unhideTapRecognizer;
    self->_unhideTapRecognizer = 0;

    [WeakRetained removeGestureRecognizer:self->_unhideDoubleTapRecognizer];
    unhideDoubleTapRecognizer = self->_unhideDoubleTapRecognizer;
    self->_unhideDoubleTapRecognizer = 0;
  }
}

- (void)registerParticipantForIndirectPanToDismiss:(id)a3
{
  id v7 = a3;
  if (!-[NSHashTable containsObject:](self->_indirectPanToParticipants, "containsObject:")) {
    [(NSHashTable *)self->_indirectPanToParticipants addObject:v7];
  }
  if ([(NSHashTable *)self->_indirectPanToParticipants count] && !self->_indirectPanRecognizer)
  {
    id v4 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__screenWasIndirectPannedToDismiss_];
    indirectPanRecognizer = self->_indirectPanRecognizer;
    self->_indirectPanRecognizer = v4;

    [(UIPanGestureRecognizer *)self->_indirectPanRecognizer setName:@"transientUI.dismiss.indirectPan"];
    [(UIPanGestureRecognizer *)self->_indirectPanRecognizer setDelegate:self];
    [(UIPanGestureRecognizer *)self->_indirectPanRecognizer setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIPanGestureRecognizer *)self->_indirectPanRecognizer setAllowedScrollTypesMask:3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    [WeakRetained addGestureRecognizer:self->_indirectPanRecognizer withType:34];
  }
}

- (void)unregisterParticipantForIndirectPanToDismiss:(id)a3
{
  id v6 = a3;
  if (-[NSHashTable containsObject:](self->_indirectPanToParticipants, "containsObject:")) {
    [(NSHashTable *)self->_indirectPanToParticipants removeObject:v6];
  }
  if (![(NSHashTable *)self->_indirectPanToParticipants count] && self->_indirectPanRecognizer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    [WeakRetained removeGestureRecognizer:self->_indirectPanRecognizer];

    indirectPanRecognizer = self->_indirectPanRecognizer;
    self->_indirectPanRecognizer = 0;
  }
}

- (SBFailingSystemGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)unhideTapRecognizer
{
  return self->_unhideTapRecognizer;
}

- (void)setUnhideTapRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)unhideDoubleTapRecognizer
{
  return self->_unhideDoubleTapRecognizer;
}

- (void)setUnhideDoubleTapRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)indirectPanRecognizer
{
  return self->_indirectPanRecognizer;
}

- (void)setIndirectPanRecognizer:(id)a3
{
}

- (NSHashTable)tapToDismissParticipants
{
  return self->_tapToDismissParticipants;
}

- (void)setTapToDismissParticipants:(id)a3
{
}

- (NSHashTable)tapToUnhideParticipants
{
  return self->_tapToUnhideParticipants;
}

- (void)setTapToUnhideParticipants:(id)a3
{
}

- (NSHashTable)indirectPanToParticipants
{
  return self->_indirectPanToParticipants;
}

- (void)setIndirectPanToParticipants:(id)a3
{
}

- (SBSystemGestureManager)systemGestureManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  return (SBSystemGestureManager *)WeakRetained;
}

- (void)setSystemGestureManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemGestureManager);
  objc_storeStrong((id *)&self->_indirectPanToParticipants, 0);
  objc_storeStrong((id *)&self->_tapToUnhideParticipants, 0);
  objc_storeStrong((id *)&self->_tapToDismissParticipants, 0);
  objc_storeStrong((id *)&self->_indirectPanRecognizer, 0);
  objc_storeStrong((id *)&self->_unhideDoubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_unhideTapRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
}

@end