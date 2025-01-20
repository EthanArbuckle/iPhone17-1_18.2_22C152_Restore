@interface UIDragEvent
+ (BOOL)_isSessionIDValid:(unsigned int)a3;
+ (void)_invalidateSessionID:(unsigned int)a3;
- (BOOL)_isReadyForReset;
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (BOOL)_shouldSendEvent;
- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3;
- (BOOL)hasActiveGestureRecognizers;
- (BOOL)isFromAccessibilitySession;
- (BOOL)isPolicyDriven;
- (CGPoint)locationInSceneReferenceSpace;
- (CGPoint)locationInView:(id)a3;
- (NSSet)_dynamicGestureRecognizers;
- (UIDragEvent)initWithDragSessionID:(unsigned int)a3 environment:(id)a4;
- (UIView)_hitTestedView;
- (UIWindow)eventWindow;
- (_UIDropSessionImpl)_dropSession;
- (_UIInternalDraggingSessionDestination)_sessionDestination;
- (_UIInternalDraggingSessionSource)_sessionSource;
- (id)_allWindows;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_updatingDropGestureRecognizers;
- (int64_t)type;
- (unsigned)_touchRoutingPolicyContextID;
- (unsigned)_windowServerHitTestContextID;
- (unsigned)dragSessionID;
- (void)_dragFailedWithCallback:(id)a3;
- (void)_ignoreDragEnd;
- (void)_ignoreGestureRecognizer:(id)a3;
- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4;
- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3;
- (void)_removeQueriedOwnerForDynamicGesturesIfNeeded:(id)a3;
- (void)_reset;
- (void)_sendIfNeeded;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
- (void)_setNeedsHitTestReset;
- (void)_updateFromCurrentSample;
- (void)_updateGesturesFromCurrentSample;
- (void)_wasDeliveredToGestureRecognizers;
- (void)dealloc;
@end

@implementation UIDragEvent

- (UIDragEvent)initWithDragSessionID:(unsigned int)a3 environment:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(id)objc_opt_class() _isSessionIDValid:v4])
  {
    v27.receiver = self;
    v27.super_class = (Class)UIDragEvent;
    v7 = [(UIEvent *)&v27 _initWithEnvironment:v6];
    v8 = v7;
    if (v7)
    {
      v7[56] = v4;
      uint64_t v9 = objc_opt_new();
      v10 = (void *)v8[18];
      v8[18] = v9;

      uint64_t v11 = objc_opt_new();
      v12 = (void *)v8[19];
      v8[19] = v11;

      uint64_t v13 = objc_opt_new();
      v14 = (void *)v8[20];
      v8[20] = v13;

      uint64_t v15 = objc_opt_new();
      v16 = (void *)v8[21];
      v8[21] = v15;

      uint64_t v17 = objc_opt_new();
      v18 = (void *)v8[22];
      v8[22] = v17;

      uint64_t v19 = objc_opt_new();
      v20 = (void *)v8[23];
      v8[23] = v19;

      uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v22 = (void *)v8[24];
      v8[24] = v21;

      uint64_t v23 = objc_opt_new();
      v24 = (void *)v8[25];
      v8[25] = v23;
    }
    self = v8;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (int64_t)type
{
  return 9;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  uint64_t v4 = objc_opt_new();
  [v4 unionSet:self->_beginningGestureRecognizers];
  [v4 unionSet:self->_updatingGestureRecognizers];
  [v4 unionSet:self->_exitingGestureRecognizers];
  [v4 unionSet:self->_endingGestureRecognizers];
  [v4 minusSet:self->_ignoredGestureRecognizers];
  return v4;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIDragEvent;
  -[UIEvent _setHIDEvent:](&v7, sel__setHIDEvent_);
  if (a3)
  {
    v5 = +[_UIDragEventSample sampleFromHIDEvent:a3];
    currentSample = self->_currentSample;
    self->_currentSample = v5;

    [(UIDragEvent *)self _updateFromCurrentSample];
  }
}

- (id)_allWindows
{
  v2 = [(_UIDragEventSample *)self->_currentSample window];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (CGPoint)locationInView:(id)a3
{
  currentSample = self->_currentSample;
  id v5 = a3;
  [(_UIDragEventSample *)currentSample locationInWindow];
  double v7 = v6;
  double v9 = v8;
  v10 = [(_UIDragEventSample *)self->_currentSample window];
  objc_msgSend(v10, "convertPoint:toView:", v5, v7, v9);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)locationInSceneReferenceSpace
{
  [(_UIDragEventSample *)self->_currentSample locationInWindow];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(_UIDragEventSample *)self->_currentSample window];
  objc_msgSend(v7, "_convertPointToSceneReferenceSpace:", v4, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)isFromAccessibilitySession
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination isAccessibilitySession];
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 160;
  if ([(NSMutableSet *)self->_exitingGestureRecognizers containsObject:v4])
  {
    [v4 _componentsCancelled:0 withEvent:self];
  }
  else
  {
    if ([(NSMutableSet *)self->_updatingGestureRecognizers containsObject:v4])
    {
      [v4 _componentsChanged:0 withEvent:self];
      goto LABEL_8;
    }
    if ([(NSMutableSet *)self->_beginningGestureRecognizers containsObject:v4])
    {
      [v4 _componentsBegan:0 withEvent:self];
      [(NSMutableSet *)self->_beginningGestureRecognizers removeObject:v4];
      [(NSMutableSet *)self->_updatingGestureRecognizers addObject:v4];
      goto LABEL_8;
    }
    uint64_t v5 = 168;
    if (![(NSMutableSet *)self->_endingGestureRecognizers containsObject:v4])
    {
      BOOL v6 = 0;
      goto LABEL_9;
    }
    [v4 _componentsEnded:0 withEvent:self];
  }
  [*(id *)((char *)&self->super.super.isa + v5) removeObject:v4];
LABEL_8:
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)_shouldSendEvent
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination shouldDragEventBeSentToGestureRecognizers]|| self->_dragFailed;
}

- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3
{
  return ![(UIDragEvent *)self _shouldSendEvent];
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  beginningGestureRecognizers = self->_beginningGestureRecognizers;
  id v6 = a3;
  [(NSMutableSet *)beginningGestureRecognizers removeObject:v6];
  [(NSMutableSet *)self->_updatingGestureRecognizers removeObject:v6];
}

- (void)_ignoreGestureRecognizer:(id)a3
{
  id v6 = a3;
  id v4 = [(UIDragEvent *)self _gestureRecognizersForWindow:0];
  int v5 = [v4 containsObject:v6];

  if (v5) {
    [(NSMutableSet *)self->_ignoredGestureRecognizers addObject:v6];
  }
}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UIDragEvent *)self _ignoreGestureRecognizer:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_removeQueriedOwnerForDynamicGesturesIfNeeded:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_ownersQueriedForDynamicGestures, "containsObject:")) {
    [(NSHashTable *)self->_ownersQueriedForDynamicGestures removeObject:v4];
  }
}

- (UIView)_hitTestedView
{
  return self->_eventView;
}

- (UIWindow)eventWindow
{
  return [(_UIDragEventSample *)self->_currentSample window];
}

- (BOOL)isPolicyDriven
{
  return [(_UIDragEventSample *)self->_currentSample isPolicyDriven];
}

- (BOOL)hasActiveGestureRecognizers
{
  return [(NSMutableSet *)self->_beginningGestureRecognizers count]
      || [(NSMutableSet *)self->_updatingGestureRecognizers count]
      || [(NSMutableSet *)self->_exitingGestureRecognizers count] != 0;
}

- (_UIDropSessionImpl)_dropSession
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination dropSession];
}

- (void)_updateFromCurrentSample
{
  [(_UIDragEventSample *)self->_currentSample isDragEnd];
  if (([(_UIDragEventSample *)self->_currentSample isApplicationEnter]
     || [(_UIDragEventSample *)self->_currentSample isApplicationWithin]
     || [(_UIDragEventSample *)self->_currentSample isPolicyDriven])
    && !self->_dragFailed)
  {
    [(_UIDragEventSample *)self->_currentSample isApplicationEnter];
    double v3 = [(_UIDragEventSample *)self->_currentSample window];
    id v4 = [v3 screen];
    uint64_t v5 = [v4 _dragManager];

    if ([v5 hasPendingSessionRequests])
    {
      objc_initWeak(&location, self);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __39__UIDragEvent__updateFromCurrentSample__block_invoke;
      double v15 = &unk_1E52DC308;
      objc_copyWeak(&v16, &location);
      [v5 performAfterCompletingPendingSessionRequests:&v12];
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      if (!self->_sessionSource)
      {
        objc_msgSend(v5, "sessionSourceWithIdentifier:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
        uint64_t v6 = (_UIInternalDraggingSessionSource *)objc_claimAutoreleasedReturnValue();
        sessionSource = self->_sessionSource;
        self->_sessionSource = v6;

        [(_UIInternalDraggingSessionSource *)self->_sessionSource setDragEvent:self];
      }
      if (!self->_sessionDestination)
      {
        uint64_t v8 = [v5 dragDestinationWithEvent:self];
        sessionDestination = self->_sessionDestination;
        self->_sessionDestination = v8;
      }
    }
  }
  -[_UIInternalDraggingSessionSource setDragEvent:](self->_sessionSource, "setDragEvent:", self, v12, v13, v14, v15);
  [(_UIInternalDraggingSessionSource *)self->_sessionSource updateCentroidFromDragEvent];
  BOOL v10 = [(_UIDragEventSample *)self->_currentSample isApplicationExit];
  long long v11 = self->_sessionSource;
  if (v10)
  {
    [(_UIInternalDraggingSessionSource *)v11 dragDidExitApp];
    [(_UIInternalDraggingSessionDestination *)self->_sessionDestination dragDidExitApp];
  }
  else
  {
    [(_UIInternalDraggingSessionSource *)v11 dragIsInsideApp];
  }
  if ([(UIDragEvent *)self _shouldSendEvent])
  {
    [(_UIInternalDraggingSessionDestination *)self->_sessionDestination updateCentroidFromDragEvent];
    [(UIDragEvent *)self _updateGesturesFromCurrentSample];
  }
}

void __39__UIDragEvent__updateFromCurrentSample__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFromCurrentSample];
}

- (void)_sendIfNeeded
{
  if (![(_UIDragEventSample *)self->_currentSample hasBeenDelivered])
  {
    if ([(_UIDragEventSample *)self->_currentSample isDragEnd])
    {
      double v3 = self->_currentSample;
      id v4 = v3;
      uint64_t v17 = 0;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
      if (v3) {
        [(_UIDragEventSample *)v3 sampleFlags];
      }
      BYTE4(v17) = 0;
      v12[0] = v14;
      v12[1] = v15;
      v12[2] = v16;
      uint64_t v13 = v17;
      uint64_t v5 = [(_UIDragEventSample *)v4 copyWithSampleFlags:v12];
      currentSample = self->_currentSample;
      self->_currentSample = v5;
      uint64_t v7 = v5;

      [(UIDragEvent *)self _updateFromCurrentSample];
      uint64_t v8 = [(id)UIApp _gestureEnvironment];
      -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v8, self, 0);

      long long v9 = self->_currentSample;
      self->_currentSample = v4;
      BOOL v10 = v4;
    }
    [(UIDragEvent *)self _updateFromCurrentSample];
    long long v11 = [(id)UIApp _gestureEnvironment];
    -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v11, self, 0);
  }
}

- (void)_updateGesturesFromCurrentSample
{
  v2 = self;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  [(_UIDragEventSample *)self->_currentSample setHasBeenDelivered:1];
  objc_storeStrong((id *)&v2->_previousEventView, v2->_eventView);
  if (v2->_needsHitTestReset)
  {
    uint64_t v3 = 0;
    v2->_needsHitTestReset = 0;
  }
  else
  {
    uint64_t v3 = [(_UIDragEventSample *)v2->_currentSample hitTestWithEvent:v2];
  }
  eventView = v2->_eventView;
  v2->_eventView = (UIView *)v3;

  if ([(_UIDragEventSample *)v2->_currentSample isApplicationExit] || v2->_dragFailed)
  {
    exitingGestureRecognizers = v2->_exitingGestureRecognizers;
LABEL_7:
    [(NSMutableSet *)exitingGestureRecognizers unionSet:v2->_updatingGestureRecognizers];
    updatingGestureRecognizers = v2->_updatingGestureRecognizers;
    [(NSMutableSet *)updatingGestureRecognizers removeAllObjects];
    return;
  }
  if ([(_UIDragEventSample *)v2->_currentSample isDragEnd])
  {
    exitingGestureRecognizers = v2->_endingGestureRecognizers;
    goto LABEL_7;
  }
  if (v2->_eventView == v2->_previousEventView)
  {
    id v51 = [(UIDragEvent *)v2 _updatingDropGestureRecognizers];
    if ([v51 count])
    {
      v41 = v51;
    }
    else
    {
      BOOL v43 = [(_UIDragEventSample *)v2->_currentSample isPolicyDriven];

      if (v43) {
        return;
      }
      id v52 = (id)objc_opt_new();
      [v52 setPrefersFullSizePreview:1];
      if ([(_UIInternalDraggingSessionSource *)v2->_sessionSource dynamicallyUpdatesPrefersFullSizePreviews])
      {
        objc_msgSend(v52, "setPrefersFullSizePreview:", -[_UIInternalDraggingSessionSource prefersFullSizePreview](v2->_sessionSource, "prefersFullSizePreview"));
      }
      [(_UIInternalDraggingSessionDestination *)v2->_sessionDestination takePotentialDrop:v52];
      v41 = v52;
    }
  }
  else
  {
    [(NSMutableSet *)v2->_exitingGestureRecognizers removeAllObjects];
    v49 = objc_opt_new();
    p_isa = (id *)&v2->super.super.isa;
    uint64_t v7 = v2->_eventView;
    if (v7)
    {
      while (1)
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        uint64_t v8 = [(UIView *)v7 gestureRecognizers];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v71 objects:v78 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v72 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              if (v13)
              {
                if ((v13[1] & 0x100000000000) != 0)
                {
                  if ([*(id *)(*((void *)&v71 + 1) + 8 * i) isEnabled])
                  {
                    if ([v13 state] <= 2)
                    {
                      [v49 addObject:v13];
                      if (([p_isa[19] containsObject:v13] & 1) == 0
                        && ([p_isa[22] containsObject:v13] & 1) == 0
                        && -[UIGestureRecognizer _internalShouldReceiveEvent:]((uint64_t)v13, p_isa))
                      {
                        [p_isa[18] addObject:v13];
                      }
                    }
                  }
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v71 objects:v78 count:16];
          }
          while (v10);
        }

        v2 = (UIDragEvent *)p_isa;
        if (!_IsKindOfUIView((uint64_t)v7)) {
          goto LABEL_50;
        }
        long long v14 = v7;
        if (([p_isa[24] containsObject:v14] & 1) == 0) {
          break;
        }
LABEL_49:

LABEL_50:
        uint64_t v7 = (UIView *)[(UIView *)v7 _parentGestureRecognizerContainer];
        if (!v7) {
          goto LABEL_51;
        }
      }
      [p_isa[24] addObject:v14];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v66 = __47__UIDragEvent__updateGesturesFromCurrentSample__block_invoke;
      v67 = &unk_1E5304598;
      v68 = p_isa;
      v70 = v14;
      id v69 = v49;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v15 = [v14 interactions];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v77 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        id location = v14;
        int v18 = 0;
        uint64_t v19 = *(void *)v62;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v62 != v19) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void **)(*((void *)&v61 + 1) + 8 * j);
            if (objc_opt_respondsToSelector())
            {
              objc_opt_class();
              v18 |= objc_opt_isKindOfClass();
              v22 = [v21 _dynamicGestureRecognizersForEvent:p_isa];
              v66((void **)v65, v22);
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v77 count:16];
        }
        while (v17);

        long long v14 = location;
        if (v18) {
          goto LABEL_48;
        }
      }
      else
      {
      }
      uint64_t v23 = v14;
      v24 = _UIDragEventPasteConfigurationForOwner(v23);
      if (v24)
      {
        id v25 = [v23 _dynamicDropInteraction];
        if (!v25)
        {
          id v25 = [[UIDropInteraction alloc] _initWithPasteConfiguration:v24];
          [v23 _setDynamicDropInteraction:v25];
          [v25 _setWantsDefaultVisualBehavior:0];
          [v25 setAllowsSimultaneousDropSessions:1];
          [v25 didMoveToOwner:v23];
        }
        [p_isa[25] addObject:v25];
        v26 = [v25 _dynamicGestureRecognizersForEvent:p_isa];
        v66((void **)v65, v26);
      }
LABEL_48:

      v2 = (UIDragEvent *)p_isa;
      goto LABEL_49;
    }
LABEL_51:
    if ([(NSMutableSet *)v2->_beginningGestureRecognizers count])
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      obuint64_t j = v2->_beginningGestureRecognizers;
      objc_super v27 = v49;
      uint64_t v46 = [(NSMutableSet *)obj countByEnumeratingWithState:&v57 objects:v76 count:16];
      v28 = 0;
      if (!v46) {
        goto LABEL_79;
      }
      uint64_t v45 = *(void *)v58;
      while (1)
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v58 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v47 = v29;
          uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8 * v29);
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v31 = v2->_updatingGestureRecognizers;
          uint64_t v32 = [(NSMutableSet *)v31 countByEnumeratingWithState:&v53 objects:v75 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v54;
            do
            {
              uint64_t v35 = 0;
              do
              {
                if (*(void *)v54 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(id **)(*((void *)&v53 + 1) + 8 * v35);
                if ([v27 containsObject:v36])
                {
                  if (([(NSMutableSet *)v2->_ignoredGestureRecognizers containsObject:v36] & 1) != 0
                    || ![v36 canBePreventedByGestureRecognizer:v30])
                  {
                    goto LABEL_72;
                  }
                  if (v30)
                  {
                    id WeakRetained = objc_loadWeakRetained((id *)(v30 + 48));
                    if (v36) {
                      goto LABEL_67;
                    }
LABEL_75:
                    id v38 = 0;
                  }
                  else
                  {
                    id WeakRetained = 0;
                    if (!v36) {
                      goto LABEL_75;
                    }
LABEL_67:
                    id v38 = objc_loadWeakRetained(v36 + 6);
                  }
                  int v39 = isDescendantOfContainer(WeakRetained, v38, 0);

                  objc_super v27 = v49;
                  v2 = (UIDragEvent *)p_isa;
                  if (!v39) {
                    goto LABEL_72;
                  }
                }
                if (!v28) {
                  v28 = objc_opt_new();
                }
                [v28 addObject:v36];
LABEL_72:
                ++v35;
              }
              while (v33 != v35);
              uint64_t v40 = [(NSMutableSet *)v31 countByEnumeratingWithState:&v53 objects:v75 count:16];
              uint64_t v33 = v40;
            }
            while (v40);
          }

          uint64_t v29 = v47 + 1;
        }
        while (v47 + 1 != v46);
        uint64_t v46 = [(NSMutableSet *)obj countByEnumeratingWithState:&v57 objects:v76 count:16];
        if (!v46)
        {
LABEL_79:

          [(NSMutableSet *)v2->_updatingGestureRecognizers minusSet:v28];
          [(NSMutableSet *)v2->_exitingGestureRecognizers unionSet:v28];

          goto LABEL_83;
        }
      }
    }
    [(NSMutableSet *)v2->_exitingGestureRecognizers unionSet:v2->_updatingGestureRecognizers];
    objc_super v27 = v49;
    [(NSMutableSet *)v2->_exitingGestureRecognizers minusSet:v49];
    [(NSMutableSet *)v2->_updatingGestureRecognizers minusSet:v2->_exitingGestureRecognizers];
LABEL_83:
    v42 = [MEMORY[0x1E4F1CA80] setWithSet:v2->_ignoredGestureRecognizers];
    [v42 minusSet:v27];
    [(NSMutableSet *)v2->_ignoredGestureRecognizers minusSet:v42];
  }
}

void __47__UIDragEvent__updateGesturesFromCurrentSample__block_invoke(void **a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
        if (v8) {
          *(void *)(v8 + 8) |= 0x400000000000uLL;
        }
        [*((id *)a1[4] + 23) addObject:v8];
        [a1[6] addGestureRecognizer:v8];
        [a1[5] addObject:v8];
        if (-[UIGestureRecognizer _internalShouldReceiveEvent:](v8, a1[4])) {
          [*((id *)a1[4] + 18) addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_updatingDropGestureRecognizers
{
  updatingGestureRecognizers = self->_updatingGestureRecognizers;
  id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_466];
  uint64_t v4 = [(NSMutableSet *)updatingGestureRecognizers filteredSetUsingPredicate:v3];

  return v4;
}

uint64_t __46__UIDragEvent__updatingDropGestureRecognizers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSSet)_dynamicGestureRecognizers
{
  return (NSSet *)self->_dynamicGestureRecognizers;
}

- (BOOL)_isReadyForReset
{
  if ([(_UIDragEventSample *)self->_currentSample isApplicationExit]
    || [(_UIDragEventSample *)self->_currentSample isDragEnd])
  {
    return 1;
  }
  if (self->_dragFailed) {
    return self->_dragFailedCallback == 0;
  }
  return 0;
}

- (void)_wasDeliveredToGestureRecognizers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(_UIDragEventSample *)self->_currentSample isDragEnd])
  {
    if ([(_UIInternalDraggingSessionDestination *)self->_sessionDestination didRequestDropToBePerformed])
    {
      [(_UIInternalDraggingSessionDestination *)self->_sessionDestination sawDragEndEvent];
      objc_msgSend((id)objc_opt_class(), "_invalidateSessionID:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->super._eventEnvironment);
      uint64_t v4 = -[UIEventEnvironment _dragEvents](WeakRetained);

      uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v25 != v7) {
              objc_enumerationMutation(v4);
            }
            long long v9 = *(UIDragEvent **)(*((void *)&v24 + 1) + 8 * i);
            if (v9 != self)
            {
              int v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dragSessionID];
              if (v10 == [(UIDragEvent *)self dragSessionID]) {
                [(UIDragEvent *)v9 _ignoreDragEnd];
              }
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v6);
      }
LABEL_13:

      goto LABEL_15;
    }
    if (!self->_ignoreDragEnd
      && (![(_UIDragEventSample *)self->_currentSample isPolicyDriven]
       || ![(_UIDragEventSample *)self->_currentSample isApplicationExit]))
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v13 = (id *)objc_loadWeakRetained((id *)&self->super._eventEnvironment);
      uint64_t v4 = -[UIEventEnvironment _dragEvents](v13);

      uint64_t v14 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
LABEL_23:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v4);
          }
          int v18 = *(UIDragEvent **)(*((void *)&v20 + 1) + 8 * v17);
          if (v18 != self)
          {
            int v19 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "dragSessionID", (void)v20);
            if (v19 == [(UIDragEvent *)self dragSessionID]
              && ![(_UIDragEventSample *)v18->_currentSample isDragEnd])
            {
              goto LABEL_13;
            }
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v15) {
              goto LABEL_23;
            }
            break;
          }
        }
      }

      [(_UIInternalDraggingSessionDestination *)self->_sessionDestination sawDragEndEvent];
      objc_msgSend((id)objc_opt_class(), "_invalidateSessionID:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
    }
  }
LABEL_15:
  if (self->_dragFailed)
  {
    dragFailedCallback = (void (**)(void))self->_dragFailedCallback;
    if (dragFailedCallback)
    {
      dragFailedCallback[2]();
      id v12 = self->_dragFailedCallback;
      self->_dragFailedCallback = 0;
    }
  }
}

- (void)_ignoreDragEnd
{
  self->_ignoreDragEnd = 1;
}

- (void)_dragFailedWithCallback:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIDragEvent.m", 859, @"Invalid parameter not satisfying: %@", @"callback != nil" object file lineNumber description];
  }
  self->_dragFailed = 1;
  uint64_t v6 = _Block_copy(v5);
  id dragFailedCallback = self->_dragFailedCallback;
  self->_id dragFailedCallback = v6;

  objc_msgSend((id)objc_opt_class(), "_invalidateSessionID:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
  [(_UIDragEventSample *)self->_currentSample setHasBeenDelivered:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__UIDragEvent__dragFailedWithCallback___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __39__UIDragEvent__dragFailedWithCallback___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendIfNeeded];
  if ([*(id *)(a1 + 32) _isReadyForReset])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 96));
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v4 = 0;
      id WeakRetained = 0;
    }
    id v5 = WeakRetained;
    -[UIEventEnvironment _removeDragEvent:]((uint64_t)WeakRetained, v4);
  }
}

- (unsigned)_touchRoutingPolicyContextID
{
  uint64_t v3 = [(_UIDragEventSample *)self->_currentSample windowServerHitTestContextID];
  if ([(_UIInternalDraggingSessionSource *)self->_sessionSource touchRoutingPolicyContainsContextIDToAlwaysSend:v3])
  {
    return v3;
  }
  else
  {
    return 0;
  }
}

- (unsigned)_windowServerHitTestContextID
{
  return [(_UIDragEventSample *)self->_currentSample windowServerHitTestContextID];
}

+ (void)_invalidateSessionID:(unsigned int)a3
{
  if (a3)
  {
    int v3 = _MergedGlobals_31_1[0];
    _MergedGlobals_31_1[_MergedGlobals_31_1[0] + 1] = a3;
    _MergedGlobals_31_1[0] = (v3 + 1) % 0xAu;
  }
}

+ (BOOL)_isSessionIDValid:(unsigned int)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = 1u;
  do
  {
    int v4 = _MergedGlobals_31_1[v3];
    if (!v4) {
      break;
    }
    if (v4 == a3) {
      return 0;
    }
    ++v3;
  }
  while (v3 != 11);
  return 1;
}

- (void)_setNeedsHitTestReset
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(UIDragEvent *)self _updatingDropGestureRecognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[UIGestureRecognizer _internalShouldReceiveEvent:](*(void *)(*((void *)&v8 + 1) + 8 * v7), self))
        {

          return;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  self->_needsHitTestReset = 1;
}

- (void)dealloc
{
  [(UIDragEvent *)self _reset];
  v3.receiver = self;
  v3.super_class = (Class)UIDragEvent;
  [(UIEvent *)&v3 dealloc];
}

- (void)_reset
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  previousEventView = self->_previousEventView;
  self->_previousEventView = 0;

  eventView = self->_eventView;
  self->_eventView = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_dynamicGestureRecognizers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10) {
          id WeakRetained = objc_loadWeakRetained((id *)(v10 + 48));
        }
        else {
          id WeakRetained = 0;
        }
        objc_msgSend(WeakRetained, "removeGestureRecognizer:", v10, (void)v13);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }

  [(NSMutableSet *)self->_dynamicGestureRecognizers removeAllObjects];
  [(NSHashTable *)self->_ownersQueriedForDynamicGestures removeAllObjects];
  [(NSMutableSet *)self->_dynamicInteractions removeAllObjects];
}

- (unsigned)dragSessionID
{
  return self->_dragSessionID;
}

- (_UIInternalDraggingSessionDestination)_sessionDestination
{
  return self->_sessionDestination;
}

- (_UIInternalDraggingSessionSource)_sessionSource
{
  return self->_sessionSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionSource, 0);
  objc_storeStrong((id *)&self->_sessionDestination, 0);
  objc_storeStrong(&self->_dragFailedCallback, 0);
  objc_storeStrong((id *)&self->_dynamicInteractions, 0);
  objc_storeStrong((id *)&self->_ownersQueriedForDynamicGestures, 0);
  objc_storeStrong((id *)&self->_dynamicGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_ignoredGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_endingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_exitingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_updatingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_beginningGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_eventView, 0);
  objc_storeStrong((id *)&self->_previousEventView, 0);
  objc_storeStrong((id *)&self->_currentSample, 0);
}

@end