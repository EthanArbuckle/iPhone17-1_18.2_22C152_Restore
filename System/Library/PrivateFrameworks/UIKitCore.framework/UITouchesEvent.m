@interface UITouchesEvent
- (BOOL)_anyInterestedGestureRecognizersForTouchInView:(id)a3;
- (BOOL)_containsHIDPointerEvent;
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (BOOL)_sendSynthesizedBeganForTransitioningGESTouchesToGestureIfNeeded:(id)a3 withDispatchedTouchesIntoSet:(id)a4;
- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3;
- (CGPoint)_digitizerLocation;
- (NSString)description;
- (__CFDictionary)_coalescedTouchesForHidEvent:(__IOHIDEvent *)a3;
- (double)_initialTouchTimestamp;
- (double)_initialTouchTimestampForWindow:(id)a3;
- (id)_allTouches;
- (id)_allWindows;
- (id)_cloneEvent;
- (id)_componentsForGestureRecognizer:(id)a3;
- (id)_exclusiveTouchWindows;
- (id)_firstTouchForView:(id)a3;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_init;
- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4;
- (id)_lastPendingCoalescedTouchForIndex:(int64_t)a3 hidEvent:(__IOHIDEvent *)a4;
- (id)_rawCoalescedTouchesForTouch:(id)a3;
- (id)_respondersForWindow:(id)a3;
- (id)_touchesForGesture:(id)a3 withPhase:(int64_t)a4;
- (id)_touchesForGestureRecognizer:(id)a3;
- (id)_touchesForKey:(id)a3;
- (id)_touchesForResponder:(id)a3 withPhase:(int64_t)a4;
- (id)_touchesForWindow:(id)a3;
- (id)_viewsForWindow:(id)a3;
- (id)_windowsAwaitingLatentSystemGestureNotificationDeliveredToEventWindow:(id)a3;
- (id)allTouches;
- (id)coalescedTouchesForTouch:(id)a3;
- (id)predictedTouchesForTouch:(id)a3;
- (id)touchesForGestureRecognizer:(id)a3;
- (id)touchesForResponder:(id)a3;
- (id)touchesForView:(id)a3;
- (id)touchesForWindow:(id)a3;
- (int64_t)singleAllowableExternalTouchPathIndex;
- (int64_t)type;
- (unint64_t)_currentPointerEventSource;
- (unint64_t)_inputPrecision;
- (void)_addCoalescedTouch:(id)a3 forIndex:(int64_t)a4 hidEvent:(__IOHIDEvent *)a5;
- (void)_addGestureRecognizersForTouchContinuationFromContainer:(id)a3 toTouch:(id)a4;
- (void)_addGestureRecognizersFromContainer:(id)a3 toTouch:(id)a4;
- (void)_addGestureRecognizersFromContainer:(id)a3 toTouch:(id)a4 forContinuation:(BOOL)a5;
- (void)_addTouch:(id)a3 forDelayedDelivery:(BOOL)a4;
- (void)_addWindowAwaitingLatentSystemGestureNotification:(id)a3 deliveredToEventWindow:(id)a4;
- (void)_cancelComponents:(id)a3;
- (void)_cancelResponderDeliveryAndClearTouchesOfWindow:(void *)a1;
- (void)_clearTouches;
- (void)_clearViewForTouch:(id)a3;
- (void)_collectGestureRecognizersFromContainer:(id)a3 withBlock:(id)a4;
- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3;
- (void)_invalidateGestureRecognizerForWindowCache;
- (void)_moveCoalescedTouchesFromHidEvent:(__IOHIDEvent *)a3 toHidEvent:(__IOHIDEvent *)a4;
- (void)_moveTouchesFromView:(id)a3 toView:(id)a4;
- (void)_removeComponents:(id)a3;
- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4;
- (void)_removeTouch:(id)a3;
- (void)_removeTouch:(id)a3 fromGestureRecognizer:(id)a4;
- (void)_removeTouchesForKey:(id)a3;
- (void)_removeTouchesForWindow:(id)a3;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
- (void)_touchesForGesture:(id)a3 withPhase:(int64_t)a4 intoSet:(id)a5;
- (void)_windowNoLongerAwaitingSystemGestureNotification:(id)a3;
- (void)dealloc;
- (void)setSingleAllowableExternalTouchPathIndex:(int64_t)a3;
@end

@implementation UITouchesEvent

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] > 2)
  {
    BOOL v10 = 0;
  }
  else
  {
    if (!qword_1EB2595E8)
    {
      uint64_t v5 = objc_opt_new();
      v6 = (void *)qword_1EB2595E8;
      qword_1EB2595E8 = v5;
    }
    if (_UIApplicationSupportsGlobalEdgeSwipeTouches())
    {
      v7 = (void *)qword_1EB2595F0;
      if (!qword_1EB2595F0)
      {
        uint64_t v8 = objc_opt_new();
        v9 = (void *)qword_1EB2595F0;
        qword_1EB2595F0 = v8;

        v7 = (void *)qword_1EB2595F0;
      }
      [v7 removeAllObjects];
      BOOL v10 = [(UITouchesEvent *)self _sendSynthesizedBeganForTransitioningGESTouchesToGestureIfNeeded:v4 withDispatchedTouchesIntoSet:qword_1EB2595F0];
    }
    else
    {
      BOOL v10 = 0;
    }
    [(id)qword_1EB2595E8 removeAllObjects];
    [(UITouchesEvent *)self _touchesForGesture:v4 withPhase:0 intoSet:qword_1EB2595E8];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", (unint64_t *)algn_1EB2595F8);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v21 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)qword_1EB2595E8;
        v23 = v21;
        int v56 = 67109120;
        LODWORD(v57) = [v22 count];
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "\t\tBegan touch count: %d", (uint8_t *)&v56, 8u);
      }
    }
    if ([(id)qword_1EB2595E8 count])
    {
      unint64_t v12 = __UILogGetCategoryCachedImpl("Touch", qword_1EB259600);
      if (*(unsigned char *)v12)
      {
        v40 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = v40;
          v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          int v56 = 134218498;
          id v57 = v4;
          __int16 v58 = 2112;
          v59 = v43;
          __int16 v60 = 2112;
          uint64_t v61 = qword_1EB2595E8;
          _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_ERROR, "\t\tCalling touchesBegan:withEvent: on gesture: %p (%@) with touches: %@", (uint8_t *)&v56, 0x20u);
        }
      }
      [v4 _componentsBegan:qword_1EB2595E8 withEvent:self];
      BOOL v10 = 1;
    }
    [(id)qword_1EB2595E8 removeAllObjects];
    [(UITouchesEvent *)self _touchesForGesture:v4 withPhase:1 intoSet:qword_1EB2595E8];
    unint64_t v13 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259600[1]);
    if (*(unsigned char *)v13)
    {
      v24 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)qword_1EB2595E8;
        v26 = v24;
        int v27 = [v25 count];
        int v56 = 67109120;
        LODWORD(v57) = v27;
        _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "\t\tMoved touch count: %d", (uint8_t *)&v56, 8u);
      }
    }
    [(id)qword_1EB2595E8 minusSet:qword_1EB2595F0];
    unint64_t v14 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259600[2]);
    if (*(unsigned char *)v14)
    {
      v28 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)qword_1EB2595E8;
        v30 = v28;
        int v31 = [v29 count];
        int v56 = 67109120;
        LODWORD(v57) = v31;
        _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "\t\tMoved touch count after removing synthesized begans: %d", (uint8_t *)&v56, 8u);
      }
    }
    if ([(id)qword_1EB2595E8 count])
    {
      unint64_t v15 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259618);
      if (*(unsigned char *)v15)
      {
        v44 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = v44;
          v46 = (objc_class *)objc_opt_class();
          v47 = NSStringFromClass(v46);
          int v56 = 134218498;
          id v57 = v4;
          __int16 v58 = 2112;
          v59 = v47;
          __int16 v60 = 2112;
          uint64_t v61 = qword_1EB2595E8;
          _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "\t\tCalling touchesMoved:withEvent: on gesture: %p (%@) with touches: %@", (uint8_t *)&v56, 0x20u);
        }
      }
      [v4 _componentsChanged:qword_1EB2595E8 withEvent:self];
      BOOL v10 = 1;
    }
    [(id)qword_1EB2595E8 removeAllObjects];
    [(UITouchesEvent *)self _touchesForGesture:v4 withPhase:3 intoSet:qword_1EB2595E8];
    unint64_t v16 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259620);
    if (*(unsigned char *)v16)
    {
      v32 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (void *)qword_1EB2595E8;
        v34 = v32;
        int v35 = [v33 count];
        int v56 = 67109120;
        LODWORD(v57) = v35;
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "\t\tEnded touch count: %d", (uint8_t *)&v56, 8u);
      }
    }
    if ([(id)qword_1EB2595E8 count])
    {
      unint64_t v17 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259628);
      if (*(unsigned char *)v17)
      {
        v48 = *(NSObject **)(v17 + 8);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = v48;
          v50 = (objc_class *)objc_opt_class();
          v51 = NSStringFromClass(v50);
          int v56 = 134218498;
          id v57 = v4;
          __int16 v58 = 2112;
          v59 = v51;
          __int16 v60 = 2112;
          uint64_t v61 = qword_1EB2595E8;
          _os_log_impl(&dword_1853B0000, v49, OS_LOG_TYPE_ERROR, "\t\tCalling touchesEnded:withEvent: on gesture: %p (%@) with touches: %@", (uint8_t *)&v56, 0x20u);
        }
      }
      [v4 _componentsEnded:qword_1EB2595E8 withEvent:self];
      BOOL v10 = 1;
    }
    [(id)qword_1EB2595E8 removeAllObjects];
    [(UITouchesEvent *)self _touchesForGesture:v4 withPhase:4 intoSet:qword_1EB2595E8];
    unint64_t v18 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259630);
    if (*(unsigned char *)v18)
    {
      v36 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)qword_1EB2595E8;
        v38 = v36;
        int v39 = [v37 count];
        int v56 = 67109120;
        LODWORD(v57) = v39;
        _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "\t\tCanceled touch count: %d", (uint8_t *)&v56, 8u);
      }
    }
    if ([(id)qword_1EB2595E8 count])
    {
      unint64_t v19 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259638);
      if (*(unsigned char *)v19)
      {
        v52 = *(NSObject **)(v19 + 8);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v53 = v52;
          v54 = (objc_class *)objc_opt_class();
          v55 = NSStringFromClass(v54);
          int v56 = 134218498;
          id v57 = v4;
          __int16 v58 = 2112;
          v59 = v55;
          __int16 v60 = 2112;
          uint64_t v61 = qword_1EB2595E8;
          _os_log_impl(&dword_1853B0000, v53, OS_LOG_TYPE_ERROR, "\t\tCalling touchesCancelled on gesture: %p (%@) with touches: %@", (uint8_t *)&v56, 0x20u);
        }
      }
      [v4 _componentsCancelled:qword_1EB2595E8 withEvent:self];
      BOOL v10 = 1;
    }
    [(id)qword_1EB2595E8 removeAllObjects];
  }

  return v10;
}

- (void)_touchesForGesture:(id)a3 withPhase:(int64_t)a4 intoSet:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = -[UITouchesEvent touchesForGestureRecognizer:](self, "touchesForGestureRecognizer:", a3, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v14 phase] == a4
          && (a4 != 1 || -[UITouch _shouldDeliverTouchForTouchesMoved]((uint64_t)v14)))
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)touchesForGestureRecognizer:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (void)_invalidateGestureRecognizerForWindowCache
{
  gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
  if (gestureRecognizersByWindow) {
    CFDictionaryRemoveAllValues(gestureRecognizersByWindow);
  }
}

uint64_t __68__UITouchesEvent__collectGestureRecognizersFromContainer_withBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    while (1)
    {
      if (v6)
      {
        if ([v6 containsObject:v7]) {
          goto LABEL_24;
        }
        [v6 addObject:v7];
      }
      id v8 = [v7 gestureRecognizers];
      if (v8)
      {
        v9 = (void *)a1[4];
        if (!v9 || isDescendantOfContainer(v9, v7, 0))
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v10);
                }
                (*(void (**)(void))(a1[5] + 16))();
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
            }
            while (v12);
          }
        }
      }
      if (_IsKindOfUIView((uint64_t)v7)
        && ![v7 deliversTouchesForGesturesToSuperview])
      {
        break;
      }
      id v15 = (id)[v7 _actingParentGestureRecognizerContainer];
      if (v15)
      {
        id v16 = v15;
        long long v17 = *(void **)(*(void *)(a1[6] + 8) + 40);
        if (!v17)
        {
          id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v19 = *(void *)(a1[6] + 8);
          uint64_t v20 = *(void **)(v19 + 40);
          *(void *)(v19 + 40) = v18;

          long long v17 = *(void **)(*(void *)(a1[6] + 8) + 40);
        }
        [v17 addObject:v16];
      }

      id v7 = (id)[v7 _parentGestureRecognizerContainer];
      if (!v7) {
        goto LABEL_24;
      }
    }
  }
LABEL_24:

  return 0;
}

- (void)_removeTouch:(id)a3 fromGestureRecognizer:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(UITouchesEvent *)self _touchesForKey:v8];
  [v7 removeObject:v6];

  if (![v7 count]) {
    [(UITouchesEvent *)self _removeTouchesForKey:v8];
  }
}

void __78__UITouchesEvent__addGestureRecognizersFromContainer_toTouch_forContinuation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  long long v17 = a2;
  id v5 = a3;
  int v6 = [v17 isEnabled];
  if (v6)
  {
    if ([v17 state] > 2)
    {
      int v6 = 0;
    }
    else if (*(unsigned char *)(a1 + 56))
    {
      int v6 = [(id)objc_opt_class() _supportsTouchContinuation];
    }
    else
    {
      int v6 = 1;
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    unsigned int v8 = *(unsigned __int16 *)(v7 + 236);
    LODWORD(v7) = (v8 >> 13) & 1;
    int v9 = (v8 >> 14) & 1;
    if (!v6) {
      goto LABEL_17;
    }
  }
  else
  {
    int v9 = 0;
    if (!v6) {
      goto LABEL_17;
    }
  }
  if ((v7 | v9) != 1) {
    goto LABEL_18;
  }
  if (!v7)
  {
    if (!v9) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  int v10 = [v17 _isAllowedToReceiveGESEvents];
  if ((v10 & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
LABEL_16:
    if (([v17 _isAllowedToReceiveGESEvents] & 1) == 0) {
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v11 = *(void **)(a1 + 48);
    CFDictionaryRef v12 = *(const __CFDictionary **)(*(void *)(a1 + 40) + 152);
    uint64_t v13 = [v11 _eventReceivingWindow];
    unint64_t v14 = CFDictionaryGetValue(v12, v13);
    CFDictionaryRemoveValue(v12, v13);
    goto LABEL_25;
  }
  if (!v10) {
    goto LABEL_17;
  }
LABEL_18:
  if (dyld_program_sdk_at_least())
  {
    id v15 = v17;
    if (!v17)
    {
      uint64_t v13 = 0;
      goto LABEL_23;
    }
    id WeakRetained = objc_loadWeakRetained(v17 + 6);
  }
  else
  {
    id WeakRetained = v5;
  }
  uint64_t v13 = WeakRetained;
  id v15 = v17;
LABEL_23:
  if (![v15 _shouldReceiveTouch:*(void *)(a1 + 32) forEvent:*(void *)(a1 + 40) recognizerView:v13])goto LABEL_26; {
  -[UITouch _addGestureRecognizer:](*(void *)(a1 + 32), v17);
  }
  unint64_t v14 = [*(id *)(a1 + 40) _touchesForKey:v17];
  [v14 addObject:*(void *)(a1 + 32)];
LABEL_25:

LABEL_26:
}

- (id)_touchesForKey:(id)a3
{
  return touchesFromDictionaryWithKey(self->_keyedTouches, a3);
}

- (void)_removeTouchesForKey:(id)a3
{
  id key = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [key state] >= 3)
  {
    id v4 = [key view];
    id v5 = [v4 window];

    if (v5)
    {
      gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
      id v7 = v5;
      unsigned int v8 = CFDictionaryGetValue(gestureRecognizersByWindow, v7);
      CFDictionaryRemoveValue(gestureRecognizersByWindow, v7);
    }
  }
  CFDictionaryRemoveValue(self->_keyedTouches, key);
}

- (int64_t)type
{
  return 0;
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 _eventComponentType])
        {
          unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITouchesEvent.m", 911, @"Wrong component type for event: %@; component: %@",
            self,
            v13);
        }
        -[UITouch _removeGestureRecognizer:]((uint64_t)v13, v7);
        [(UITouchesEvent *)self _removeTouch:v13 fromGestureRecognizer:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)_touchesForGesture:(id)a3 withPhase:(int64_t)a4
{
  int v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  id v8 = [v6 set];
  [(UITouchesEvent *)self _touchesForGesture:v7 withPhase:a4 intoSet:v8];

  return v8;
}

- (BOOL)_containsHIDPointerEvent
{
  return self->_containsHIDPointerEvent;
}

- (unint64_t)_currentPointerEventSource
{
  return self->_currentPointerEventSource;
}

- (void)_cancelComponents:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __36__UITouchesEvent__cancelComponents___block_invoke;
  v50[3] = &unk_1E5304300;
  v50[4] = self;
  v50[5] = a2;
  v32 = [v5 objectsPassingTest:v50];
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        CFDictionaryRef v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v13 = [v12 phase];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __36__UITouchesEvent__cancelComponents___block_invoke_2;
        aBlock[3] = &unk_1E52D9CD0;
        aBlock[4] = v12;
        aBlock[5] = v13;
        unint64_t v14 = _Block_copy(aBlock);
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v9);
  }

  [(id)UIApp _cancelViewProcessingOfTouchesOrPresses:v7 withEvent:self sendingCancelToViewsOfTouchesOrPresses:v32];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * j) + 16))();
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v17);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = v7;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v37 + 1) + 8 * k);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v26 = [v25 gestureRecognizers];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v51 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v34;
          do
          {
            for (uint64_t m = 0; m != v28; ++m)
            {
              if (*(void *)v34 != v29) {
                objc_enumerationMutation(v26);
              }
              -[UIGestureRecognizer _touchWasCancelled:](*(void *)(*((void *)&v33 + 1) + 8 * m), v25);
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v51 count:16];
          }
          while (v28);
        }

        int v31 = [(id)UIApp _gestureDelayedEventComponentDispatcher];
        -[UIGestureDelayedEventComponentDispatcher removeTouch:](v31, v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v52 count:16];
    }
    while (v22);
  }
}

uint64_t __36__UITouchesEvent__cancelComponents___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPhase:*(void *)(a1 + 40)];
}

- (void)_removeTouch:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UITouchesEvent *)self _clearViewForTouch:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v4, "gestureRecognizers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [(UITouchesEvent *)self _touchesForKey:v10];
        -[UITouch _removeGestureRecognizer:]((uint64_t)v4, v10);
        [v11 removeObject:v4];
        if (![v11 count]) {
          [(UITouchesEvent *)self _removeTouchesForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  CFDictionaryRef v12 = [v4 window];
  [v4 setWindow:0];
  if ([v4 _isPointerTouch]) {
    [v4 _clearForReenteringHoverInWindow:v12];
  }
  if (v12)
  {
    uint64_t v13 = [(UITouchesEvent *)self _touchesForWindow:v12];
    [v13 removeObject:v4];
    gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
    id v15 = v12;
    uint64_t v16 = CFDictionaryGetValue(gestureRecognizersByWindow, v15);
    CFDictionaryRemoveValue(gestureRecognizersByWindow, v15);

    if (![v13 count]) {
      [(UITouchesEvent *)self _removeTouchesForWindow:v15];
    }
  }
  [(NSMutableSet *)self->_allTouchesMutable removeObject:v4];
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;
}

- (void)_addTouch:(id)a3 forDelayedDelivery:(BOOL)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSMutableSet *)self->_allTouchesMutable addObject:v6];
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;

  uint64_t v8 = [v6 _responder];
  if (v8)
  {
    uint64_t v9 = [(UITouchesEvent *)self _touchesForKey:v8];
    [v9 addObject:v6];
  }
  uint64_t v10 = [v6 window];
  if (a4 || [v6 phase])
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v11 = [v6 _gestureRecognizers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v80 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [(UITouchesEvent *)self _touchesForKey:*(void *)(*((void *)&v79 + 1) + 8 * i)];
          [v16 addObject:v6];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v13);
    }

    if (a4)
    {
LABEL_59:
      gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
      id v56 = v10;
      id v57 = CFDictionaryGetValue(gestureRecognizersByWindow, v56);
      CFDictionaryRemoveValue(gestureRecognizersByWindow, v56);

      if (v56) {
        goto LABEL_60;
      }
      goto LABEL_61;
    }
    uint64_t v17 = (__CFString *)v6;
    id v18 = v8;
    if (!self
      || (uint64_t v19 = [(__CFString *)v17 phase], v20 = _UIApplicationSupportsGlobalEdgeSwipeTouches(), !v17)
      || !v20
      || (v17[7].info & 0x400000000000) == 0
      || v19 > 2)
    {
LABEL_58:

      goto LABEL_59;
    }
    if (!v8)
    {
      long long v41 = *(NSObject **)(__UILogGetCategoryCachedImpl("Touch", &qword_1EB2595C8) + 8);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v93 = v17;
        _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_ERROR, "ERROR: Early return from handling touch GES transition & gesture collection due to unexpected nil container: %{public}@", buf, 0xCu);
      }
      goto LABEL_58;
    }
    v76 = v8;
    v77 = v10;
    long long v21 = [(__CFString *)v17 window];
    if (!_IsKindOfUIView((uint64_t)v18) || !_UITouchCanParticipateInExclusiveTouchForWindow(v17, v21, 1))
    {
LABEL_50:
      id v49 = v18;
      v50 = v17;
      uint64_t v51 = [(__CFString *)v50 phase];
      if (_UIApplicationSupportsGlobalEdgeSwipeTouches()
        && (v17[7].info & 0x400000000000) != 0
        && v51 < 3)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &_MergedGlobals_40);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          v59 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v88 = 134217984;
            v89 = v50;
            _os_log_impl(&dword_1853B0000, v59, OS_LOG_TYPE_ERROR, "Setting phase of transitioning GES touch %p to Began for gesture collection", v88, 0xCu);
          }
        }
        [(__CFString *)v50 setPhase:0];
        [(UITouchesEvent *)self _addGestureRecognizersFromContainer:v49 toTouch:v50 forContinuation:0];
        unint64_t v53 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB2595C0);
        if (*(unsigned char *)v53)
        {
          __int16 v60 = *(NSObject **)(v53 + 8);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v88 = 134217984;
            v89 = v50;
            _os_log_impl(&dword_1853B0000, v60, OS_LOG_TYPE_ERROR, "Resetting phase of transitioning GES touch %p after gesture collection", v88, 0xCu);
          }
        }
        [(__CFString *)v50 setPhase:v51];
      }
      else
      {
        v54 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", sel__addGestureRecognizersFromContainer_forTouchTransitioningFromGES_, self, @"UITouchesEvent.m", 294, @"Invalid request to collect gestures for transitioning GES touch: app supports GES: %d; gesture container: %@; touch: %@",
          _UIApplicationSupportsGlobalEdgeSwipeTouches(),
          v49,
          v50);
      }
      uint64_t v8 = v76;
      uint64_t v10 = v77;
      goto LABEL_58;
    }
    id v22 = v18;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    uint64_t v23 = [(__CFString *)v17 window];
    long long v24 = [(UITouchesEvent *)self touchesForWindow:v23];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v83 objects:buf count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      id v74 = v18;
      v75 = v17;
      int v27 = 0;
      uint64_t v28 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v84 != v28) {
            objc_enumerationMutation(v24);
          }
          v30 = *(_WORD **)(*((void *)&v83 + 1) + 8 * j);
          v27 |= _UITouchViewIsMatchForExclusiveTouchParticipantView(v22, v30, v21, 1);
          _UITouchWindowIsMatchForExclusiveTouchParticipantWindow(v30, v21, 1);
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v83 objects:buf count:16];
      }
      while (v26);

      id v18 = v74;
      uint64_t v17 = v75;
      if (v27) {
        goto LABEL_49;
      }
    }
    else
    {
    }
    [(__CFString *)v17 _setIsFirstTouchForView:1];
    unint64_t v46 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB2595D0);
    if (*(unsigned char *)v46)
    {
      uint64_t v61 = *(NSObject **)(v46 + 8);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        uint64_t v62 = NSString;
        id v63 = v22;
        v64 = v61;
        v65 = (objc_class *)objc_opt_class();
        v66 = NSStringFromClass(v65);
        v67 = [v62 stringWithFormat:@"<%@: %p>", v66, v63];

        *(_DWORD *)v88 = 134218242;
        v89 = v17;
        __int16 v90 = 2112;
        v91 = v67;
        _os_log_impl(&dword_1853B0000, v64, OS_LOG_TYPE_ERROR, "Marking transitioning GES touch %p as first touch in view: %@", v88, 0x16u);
      }
    }
    if ([v22 _shouldApplyExclusiveTouch])
    {
      [v21 _setExclusiveTouchView:v22];
      long long v47 = [(UITouchesEvent *)self _exclusiveTouchWindows];
      [v47 addObject:v21];

      unint64_t v48 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB2595D8);
      if (*(unsigned char *)v48)
      {
        v68 = *(id *)(v48 + 8);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          id v69 = v21;
          if (v69)
          {
            v70 = NSString;
            v71 = (objc_class *)objc_opt_class();
            v72 = NSStringFromClass(v71);
            v73 = [v70 stringWithFormat:@"<%@: %p>", v72, v69];
          }
          else
          {
            v73 = @"(nil)";
          }

          *(_DWORD *)v88 = 134218242;
          v89 = v17;
          __int16 v90 = 2112;
          v91 = v73;
          _os_log_impl(&dword_1853B0000, v68, OS_LOG_TYPE_ERROR, "Adding transitioning GES touch %p as exclusive touch for window: %@", v88, 0x16u);
        }
      }
    }
LABEL_49:

    goto LABEL_50;
  }
  if (v8)
  {
    [(UITouchesEvent *)self _addGestureRecognizersFromContainer:v8 toTouch:v6];
    int v31 = v6;
    if (_UITouchShouldCancelDelayingGesturesFromPreviousSequence(v31))
    {
      v32 = [(id)UIApp _gestureEnvironment];
      long long v33 = -[UIGestureEnvironment _gesturesWithDelayedTouchForTouch:event:]((uint64_t)v32, v31);
      if ([v33 count])
      {
        long long v34 = *(id *)(__UILogGetCategoryCachedImpl("Gesture", &qword_1EB2595E0) + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v78 = v10;
          long long v35 = v31;
          if (v35)
          {
            long long v36 = NSString;
            long long v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            long long v39 = v38 = v8;
            long long v40 = [v36 stringWithFormat:@"<%@: %p>", v39, v35];

            uint64_t v8 = v38;
          }
          else
          {
            long long v40 = @"(nil)";
          }

          *(_DWORD *)buf = 138543618;
          v93 = v40;
          __int16 v94 = 2114;
          v95 = v33;
          _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "The following gestures delayed responder-based delivery of %{public}@ during a previous sequence. However, they are no longer associated with this touch and did not eventually transition to a terminal state, which is invalid. These gestures will be cancelled to unblock responder event delivery of the new sequence for this touch:\n %{public}@", buf, 0x16u);

          uint64_t v10 = v78;
        }

        long long v42 = [v33 allObjects];
        -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v32, v42);
      }
    }
  }
  if (v10)
  {
    long long v43 = self->_gestureRecognizersByWindow;
    id v44 = v10;
    v45 = CFDictionaryGetValue(v43, v44);
    CFDictionaryRemoveValue(v43, v44);

LABEL_60:
    __int16 v58 = [(UITouchesEvent *)self _touchesForWindow:v10];
    [v58 addObject:v6];
  }
LABEL_61:
}

- (id)_touchesForWindow:(id)a3
{
  return touchesFromDictionaryWithKey(self->_keyedTouchesByWindow, a3);
}

- (void)_removeTouchesForWindow:(id)a3
{
}

- (void)_addGestureRecognizersFromContainer:(id)a3 toTouch:(id)a4 forContinuation:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__UITouchesEvent__addGestureRecognizersFromContainer_toTouch_forContinuation___block_invoke;
  v12[3] = &unk_1E53042D8;
  BOOL v16 = a5;
  id v13 = v9;
  uint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  [(UITouchesEvent *)self _collectGestureRecognizersFromContainer:v10 withBlock:v12];
}

- (void)_collectGestureRecognizersFromContainer:(id)a3 withBlock:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v27 = v5;
  uint64_t v7 = [v5 _eventReceivingWindow];
  id v8 = [v7 _exclusiveTouchView];

  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  unint64_t v46 = __Block_byref_object_copy__171;
  long long v47 = __Block_byref_object_dispose__171;
  id v48 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  long long v38 = __68__UITouchesEvent__collectGestureRecognizersFromContainer_withBlock___block_invoke;
  long long v39 = &unk_1E5304288;
  id v26 = v8;
  id v40 = v26;
  id v9 = v6;
  id v41 = v9;
  long long v42 = &v43;
  if ((__68__UITouchesEvent__collectGestureRecognizersFromContainer_withBlock___block_invoke(v37, v5, 0) & 1) == 0)
  {
    if ([(id)v44[5] count])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if (v5)
      {
        id v11 = v5;
        do
        {
          [v10 addObject:v11];
          id v11 = (id)[v11 _parentGestureRecognizerContainer];
        }
        while (v11);
      }
      while ([(id)v44[5] count])
      {
        uint64_t v12 = [(id)v44[5] lastObject];
        [(id)v44[5] removeLastObject];
        char v13 = v38(v37, v12, v10);

        if (v13) {
          goto LABEL_31;
        }
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    -[UITabBarControllerSidebar _actualFooterContentConfiguration]((id *)&self->super.super.isa);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v10 countByEnumeratingWithState:&v33 objects:v50 count:16];
    if (v14)
    {
      uint64_t v22 = v14;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            BOOL v16 = [v15 _gestureRecognizersForEvent:self];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v49 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v30;
              while (2)
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v30 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  int v20 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                  if (v20) {
                    v20[1] |= 0x1000000000000uLL;
                  }
                  char v28 = 0;
                  long long v21 = [v20 view];
                  (*((void (**)(id, void *, void *, char *))v9 + 2))(v9, v20, v21, &v28);

                  if (v28)
                  {

                    goto LABEL_31;
                  }
                }
                uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v49 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
          }
        }
        uint64_t v22 = [v10 countByEnumeratingWithState:&v33 objects:v50 count:16];
      }
      while (v22);
    }
LABEL_31:
  }
  _Block_object_dispose(&v43, 8);
}

- (void)_addGestureRecognizersFromContainer:(id)a3 toTouch:(id)a4
{
}

- (void)_clearViewForTouch:(id)a3
{
  id v6 = a3;
  id v4 = [v6 _responder];
  [v6 _setResponder:0];
  if (v4)
  {
    id v5 = [(UITouchesEvent *)self _touchesForKey:v4];
    [v5 removeObject:v6];
    if (![v5 count]) {
      [(UITouchesEvent *)self _removeTouchesForKey:v4];
    }
  }
}

- (void)_windowNoLongerAwaitingSystemGestureNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_latentSystemGestureWindows;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [(NSMapTable *)self->_latentSystemGestureWindows objectForKey:v11];
        [v12 removeObject:v4];
        if (![v12 count])
        {
          if (!v8)
          {
            id v8 = [MEMORY[0x1E4F1CA80] set];
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[NSMapTable removeObjectForKey:](self->_latentSystemGestureWindows, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (id)_componentsForGestureRecognizer:(id)a3
{
  v3 = [(UITouchesEvent *)self _touchesForGestureRecognizer:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)_touchesForGestureRecognizer:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (id)allTouches
{
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  if (!allTouchesImmutableCached)
  {
    id v4 = (NSSet *)[(NSMutableSet *)self->_allTouchesMutable copy];
    id v5 = self->_allTouchesImmutableCached;
    self->_allTouchesImmutableCached = v4;

    allTouchesImmutableCached = self->_allTouchesImmutableCached;
  }
  return allTouchesImmutableCached;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  if ([(UIEvent *)self _hidEvent]) {
    CFDictionaryRemoveValue(self->_coalescedTouches, [(UIEvent *)self _hidEvent]);
  }
  v7.receiver = self;
  v7.super_class = (Class)UITouchesEvent;
  [(UIEvent *)&v7 _setHIDEvent:a3];
  CFDictionaryRemoveAllValues(self->_finalTouches);
  if (a3)
  {
    uint64_t v5 = _UIEventHIDGetDescendantPointerEvent((uint64_t)a3);
    self->_containsHIDPointerEvent = v5 != 0;
    unint64_t v6 = _UIEventHIDGetPointerEventSource(v5);
  }
  else
  {
    unint64_t v6 = 0;
    self->_containsHIDPointerEvent = 0;
  }
  self->_currentPointerEventSource = v6;
}

- (CGPoint)_digitizerLocation
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([(UIEvent *)self _hidEvent] && IOHIDEventConformsTo())
  {
    IOHIDEventGetFloatValue();
    double v2 = v4;
    IOHIDEventGetFloatValue();
    double v3 = v5;
  }
  double v6 = v2;
  double v7 = v3;
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  BOOL v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v5 = [(UITouchesEvent *)self _allWindows];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v21 + 1) + 8 * i) _canIgnoreInteractionEvents])
        {
          BOOL v3 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v3 = 1;
  }
LABEL_13:

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(UITouchesEvent *)self allTouches];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * j);
        if (v15 && (*(_WORD *)(v15 + 236) & 0x4000) != 0)
        {

          return 0;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  return v3;
}

- (void)_clearTouches
{
  [(NSMutableSet *)self->_allTouchesMutable removeAllObjects];
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;

  CFDictionaryRemoveAllValues(self->_keyedTouches);
  keyedTouchesByWindow = self->_keyedTouchesByWindow;
  CFDictionaryRemoveAllValues(keyedTouchesByWindow);
}

- (id)coalescedTouchesForTouch:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_allTouchesMutable containsObject:v4])
  {
    double v5 = [(UITouchesEvent *)self _rawCoalescedTouchesForTouch:v4];
    uint64_t v6 = (const void *)[v4 _pathIndex];
    if (!CFDictionaryGetValue(self->_finalTouches, v6))
    {
      uint64_t v7 = [v4 _clone];
      if ([v5 count])
      {
        uint64_t v8 = [v5 lastObject];
        [v7 _setPreviousTouch:v8];
      }
      [v5 addObject:v7];
      CFDictionarySetValue(self->_finalTouches, v6, @"DidAppend");
    }
    uint64_t v9 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_rawCoalescedTouchesForTouch:(id)a3
{
  id v4 = a3;
  double v5 = (const void *)[v4 _pathIndex];
  uint64_t v6 = [(UITouchesEvent *)self _coalescedTouchesForHidEvent:[(UIEvent *)self _hidEvent]];
  uint64_t v7 = CFDictionaryGetValue(v6, v5);
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    CFDictionarySetValue(v6, v5, v7);
  }

  return v7;
}

- (__CFDictionary)_coalescedTouchesForHidEvent:(__IOHIDEvent *)a3
{
  Value = CFDictionaryGetValue(self->_coalescedTouches, a3);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(self->_coalescedTouches, a3, Value);
    CFRelease(Value);
  }
  return (__CFDictionary *)Value;
}

- (id)_exclusiveTouchWindows
{
  return self->_exclusiveTouchWindows;
}

- (id)_allWindows
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(UITouchesEvent *)self allTouches];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) window];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_touchesForResponder:(id)a3 withPhase:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = -[UITouchesEvent touchesForResponder:](self, "touchesForResponder:", v6, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v7);
      }
      long long v13 = *(_WORD **)(*((void *)&v15 + 1) + 8 * i);
      if ([v13 phase] == a4 && (objc_msgSend(v13, "isDelayed") & 1) == 0)
      {
        if (a4 >= 3)
        {
          if (v13 && (v13[118] & 8) != 0) {
            continue;
          }
        }
        else if (a4 == 1 && !-[UITouch _shouldDeliverTouchForTouchesMoved]((uint64_t)v13))
        {
          continue;
        }
        if (!v10)
        {
          id v10 = [MEMORY[0x1E4F1CA80] set];
        }
        [v10 addObject:v13];
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v9);
LABEL_21:

  return v10;
}

- (id)touchesForResponder:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (id)_viewsForWindow:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = -[UITouchesEvent touchesForWindow:](self, "touchesForWindow:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) view];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_respondersForWindow:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = -[UITouchesEvent touchesForWindow:](self, "touchesForWindow:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) _responder];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CFDictionaryGetValue(self->_gestureRecognizersByWindow, v4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [(UITouchesEvent *)self touchesForWindow:v4];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v7 = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v15 + 1) + 8 * i) _gestureRecognizers];
          if (v14)
          {
            if (!v7)
            {
              id v7 = [MEMORY[0x1E4F1CA80] set];
            }
            [v7 addObjectsFromArray:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);

      if (v7) {
        CFDictionarySetValue(self->_gestureRecognizersByWindow, v4, v7);
      }
    }
    else
    {

      id v7 = 0;
    }
  }

  return v7;
}

- (id)touchesForWindow:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouchesByWindow, a3);
}

BOOL __36__UITouchesEvent__cancelComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _eventComponentType])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"UITouchesEvent.m", 1182, @"Unexpected event component type: %ld", objc_msgSend(v3, "_eventComponentType"));
  }
  id v4 = [(id)UIApp _gestureDelayedEventComponentDispatcher];
  BOOL v5 = !-[UIGestureDelayedEventComponentDispatcher touchesBeganWasDelayedForTouch:]((uint64_t)v4, v3)
    && [v3 phase] != 0;

  return v5;
}

- (id)_windowsAwaitingLatentSystemGestureNotificationDeliveredToEventWindow:(id)a3
{
  id v3 = [(NSMapTable *)self->_latentSystemGestureWindows objectForKey:a3];
  id v4 = [v3 setRepresentation];

  return v4;
}

- (void)dealloc
{
  keyedTouches = self->_keyedTouches;
  if (keyedTouches) {
    CFRelease(keyedTouches);
  }
  keyedTouchesByWindow = self->_keyedTouchesByWindow;
  if (keyedTouchesByWindow) {
    CFRelease(keyedTouchesByWindow);
  }
  gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
  if (gestureRecognizersByWindow) {
    CFRelease(gestureRecognizersByWindow);
  }
  coalescedTouches = self->_coalescedTouches;
  if (coalescedTouches) {
    CFRelease(coalescedTouches);
  }
  finalTouches = self->_finalTouches;
  if (finalTouches) {
    CFRelease(finalTouches);
  }
  v8.receiver = self;
  v8.super_class = (Class)UITouchesEvent;
  [(UIEvent *)&v8 dealloc];
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)UITouchesEvent;
  double v2 = [(UIEvent *)&v6 _init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v4 = (void *)v2[15];
    v2[15] = v3;

    _UITouchesEventCommonInit(v2);
  }
  return v2;
}

- (NSString)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)UITouchesEvent;
  id v4 = [(UITouchesEvent *)&v10 description];
  [(UIEvent *)self timestamp];
  uint64_t v6 = v5;
  id v7 = [(UITouchesEvent *)self allTouches];
  objc_super v8 = [v3 stringWithFormat:@"%@ timestamp: %g touches: %@", v4, v6, v7];

  return (NSString *)v8;
}

- (id)_cloneEvent
{
  v7.receiver = self;
  v7.super_class = (Class)UITouchesEvent;
  id v3 = [(UIEvent *)&v7 _cloneEvent];
  uint64_t v4 = [(NSMutableSet *)self->_allTouchesMutable mutableCopy];
  uint64_t v5 = (void *)*((void *)v3 + 15);
  *((void *)v3 + 15) = v4;

  _UITouchesEventCommonInit(v3);
  __29__UITouchesEvent__cloneEvent__block_invoke(self->_keyedTouches, *((__CFDictionary **)v3 + 17));
  __29__UITouchesEvent__cloneEvent__block_invoke(self->_keyedTouchesByWindow, *((__CFDictionary **)v3 + 18));
  return v3;
}

void __29__UITouchesEvent__cloneEvent__block_invoke(const __CFDictionary *a1, __CFDictionary *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFDictionaryGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    uint64_t v6 = (const void **)((char *)v10 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    if ((unint64_t)(8 * Count) >= 0x200) {
      size_t v7 = 512;
    }
    else {
      size_t v7 = 8 * Count;
    }
    bzero((char *)v10 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    CFDictionaryGetKeysAndValues(a1, v6, 0);
    do
    {
      objc_super v8 = *v6++;
      uint64_t v9 = objc_msgSend((id)CFDictionaryGetValue(a1, v8), "mutableCopy");
      CFDictionarySetValue(a2, v8, v9);

      --v5;
    }
    while (v5);
  }
}

- (void)_addWindowAwaitingLatentSystemGestureNotification:(id)a3 deliveredToEventWindow:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  size_t v7 = [(NSMapTable *)self->_latentSystemGestureWindows objectForKey:v6];
  if (!v7)
  {
    size_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMapTable *)self->_latentSystemGestureWindows setObject:v7 forKey:v6];
  }
  [v7 addObject:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusiveTouchWindows, 0);
  objc_storeStrong((id *)&self->_latentSystemGestureWindows, 0);
  objc_storeStrong((id *)&self->_allTouchesImmutableCached, 0);
  objc_storeStrong((id *)&self->_allTouchesMutable, 0);
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)UITouchesEvent;
  id v8 = [(UIEvent *)&v25 _init];
  uint64_t v9 = v8;
  if (v8)
  {
    _UITouchesEventCommonInit(v8);
    [v9 _setGSEvent:a3];
    objc_storeStrong(v9 + 15, a4);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v16 = objc_msgSend(v15, "view", (void)v21);
          if (v16)
          {
            long long v17 = [v9 _touchesForKey:v16];
            [v17 addObject:v15];
          }
          long long v18 = [v15 window];
          if (v18)
          {
            long long v19 = [v9 _touchesForWindow:v18];
            [v19 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

- (id)_allTouches
{
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;

  allTouchesMutable = self->_allTouchesMutable;
  return allTouchesMutable;
}

- (id)touchesForView:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (BOOL)_anyInterestedGestureRecognizersForTouchInView:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__UITouchesEvent__anyInterestedGestureRecognizersForTouchInView___block_invoke;
  v7[3] = &unk_1E53042B0;
  uint64_t v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(UITouchesEvent *)self _collectGestureRecognizersFromContainer:v5 withBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __65__UITouchesEvent__anyInterestedGestureRecognizersForTouchInView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 isEnabled] && objc_msgSend(v9, "state") <= 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    CFDictionaryRef v6 = *(const __CFDictionary **)(*(void *)(a1 + 32) + 152);
    id v7 = [*(id *)(a1 + 40) window];
    id v8 = CFDictionaryGetValue(v6, v7);
    CFDictionaryRemoveValue(v6, v7);
  }
}

- (void)_addGestureRecognizersForTouchContinuationFromContainer:(id)a3 toTouch:(id)a4
{
}

- (void)_cancelResponderDeliveryAndClearTouchesOfWindow:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = [a1 _touchesForWindow:a2];
    id v5 = (void *)[v4 copy];

    [a1 _cancelComponents:v5];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          -[UITouch _clearForWindowIfNeeded:](v11, a2);
          objc_msgSend(a1, "_removeTouch:", v11, (void)v12);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [a1 _removeTouchesForWindow:a2];
  }
}

- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UITouchesEvent *)self touchesForGestureRecognizer:v4];
  id v6 = (void *)[v5 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v12, "phase", (void)v13))
        {
          [(UITouchesEvent *)self _removeTouch:v12 fromGestureRecognizer:v4];
          -[UITouch _removeGestureRecognizer:]((uint64_t)v12, v4);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)_sendSynthesizedBeganForTransitioningGESTouchesToGestureIfNeeded:(id)a3 withDispatchedTouchesIntoSet:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!_UIApplicationSupportsGlobalEdgeSwipeTouches()
    || ([v6 _isAllowedToReceiveGESEvents] & 1) != 0
    || [v6 state] > 2)
  {
    goto LABEL_37;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v8 = [(UITouchesEvent *)self touchesForGestureRecognizer:v6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        if (v13
          && (*(_WORD *)(v13 + 236) & 0x4000) != 0
          && [*(id *)(*((void *)&v59 + 1) + 8 * i) phase] <= 2)
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    long long v47 = self;
    id v49 = v6;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259640);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      long long v39 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        id v40 = v39;
        int v41 = [v7 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v65) = v41;
        _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, "\t\tTransitioning GES touch needing synthesized began count: %d", buf, 8u);
      }
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v16 = (void *)qword_1EB259648;
    qword_1EB259648 = v15;

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v48 = v7;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v70 count:16];
    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v21 = *(void *)v56;
      *(void *)&long long v19 = 134217984;
      long long v46 = v19;
      do
      {
        long long v22 = v17;
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v56 != v21) {
            objc_enumerationMutation(v22);
          }
          long long v24 = *(void **)(*((void *)&v55 + 1) + 8 * v23);
          uint64_t v25 = objc_msgSend(v24, "phase", v46);
          id v26 = (void *)qword_1EB259648;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __112__UITouchesEvent__sendSynthesizedBeganForTransitioningGESTouchesToGestureIfNeeded_withDispatchedTouchesIntoSet___block_invoke;
          aBlock[3] = &unk_1E52D9CD0;
          aBlock[4] = v24;
          aBlock[5] = v25;
          uint64_t v27 = _Block_copy(aBlock);
          [v26 addObject:v27];

          unint64_t v28 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259650);
          if (*(unsigned char *)v28)
          {
            long long v29 = *(NSObject **)(v28 + 8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v46;
              v65 = v24;
              _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Setting phase of transitioning GES touch %p for synthesized began gesture dispatch", buf, 0xCu);
            }
          }
          [v24 setPhase:0];
          ++v23;
        }
        while (v20 != v23);
        id v17 = v22;
        uint64_t v30 = [v22 countByEnumeratingWithState:&v55 objects:v70 count:16];
        uint64_t v20 = v30;
      }
      while (v30);
    }

    unint64_t v31 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259658);
    if (*(unsigned char *)v31)
    {
      long long v42 = *(NSObject **)(v31 + 8);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = v42;
        id v44 = (objc_class *)objc_opt_class();
        uint64_t v45 = NSStringFromClass(v44);
        *(_DWORD *)buf = 134218498;
        v65 = v49;
        __int16 v66 = 2112;
        v67 = v45;
        __int16 v68 = 2112;
        id v69 = v17;
        _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_ERROR, "\t\tCalling synthesized touchesBegan:withEvent: on gesture: %p (%@) with transitioning GES touches: %@", buf, 0x20u);
      }
    }
    id v6 = v49;
    [v49 _componentsBegan:v17 withEvent:v47];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v32 = (id)qword_1EB259648;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v50 objects:v63 count:16];
    id v7 = v48;
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v51 != v35) {
            objc_enumerationMutation(v32);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v50 + 1) + 8 * j) + 16))();
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v34);
    }

    [(id)qword_1EB259648 removeAllObjects];
    BOOL v37 = 1;
  }
  else
  {
LABEL_37:
    BOOL v37 = 0;
  }

  return v37;
}

uint64_t __112__UITouchesEvent__sendSynthesizedBeganForTransitioningGESTouchesToGestureIfNeeded_withDispatchedTouchesIntoSet___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_9);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Resetting phase of transitioning GES touch %p after synthesized began gesture dispatch", (uint8_t *)&v6, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) setPhase:*(void *)(a1 + 40)];
}

- (id)_firstTouchForView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = -[UITouchesEvent touchesForView:](self, "touchesForView:", a3, 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 _isFirstTouchForView])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_moveTouchesFromView:(id)a3 toView:(id)a4
{
  id key = a3;
  id v6 = a4;
  uint64_t v7 = CFDictionaryGetValue(self->_keyedTouches, key);
  if (v7)
  {
    CFDictionarySetValue(self->_keyedTouches, v6, v7);
    CFDictionaryRemoveValue(self->_keyedTouches, key);
    [v7 makeObjectsPerformSelector:sel_setView_ withObject:v6];
  }
}

- (double)_initialTouchTimestamp
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = [(UITouchesEvent *)self allTouches];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
      [v7 initialTouchTimestamp];
      double v9 = v8;
      if ([v7 type] != 2) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)_initialTouchTimestampForWindow:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)UIApp _mainEventEnvironment];
  uint64_t v6 = -[UIEventEnvironment _touchMapForWindow:]((uint64_t)v5, v4);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(v6, "objectEnumerator", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v8)
  {

LABEL_12:
    [(UITouchesEvent *)self _initialTouchTimestamp];
    double v14 = v15;
    goto LABEL_13;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v18;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v18 != v10) {
      objc_enumerationMutation(v7);
    }
    long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
    [v12 initialTouchTimestamp];
    double v14 = v13;
    if ([v12 type] != 2) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        goto LABEL_3;
      }
      break;
    }
  }

  if (v14 == 0.0) {
    goto LABEL_12;
  }
LABEL_13:

  return v14;
}

- (void)_addCoalescedTouch:(id)a3 forIndex:(int64_t)a4 hidEvent:(__IOHIDEvent *)a5
{
  id v10 = a3;
  uint64_t v8 = [(UITouchesEvent *)self _coalescedTouchesForHidEvent:a5];
  uint64_t v9 = CFDictionaryGetValue(v8, (const void *)a4);
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    CFDictionarySetValue(v8, (const void *)a4, v9);
  }
  [v9 addObject:v10];
}

- (void)_moveCoalescedTouchesFromHidEvent:(__IOHIDEvent *)a3 toHidEvent:(__IOHIDEvent *)a4
{
  CFDictionarySetValue(self->_coalescedTouches, a4, -[UITouchesEvent _coalescedTouchesForHidEvent:](self, "_coalescedTouchesForHidEvent:"));
  coalescedTouches = self->_coalescedTouches;
  CFDictionaryRemoveValue(coalescedTouches, a3);
}

- (id)_lastPendingCoalescedTouchForIndex:(int64_t)a3 hidEvent:(__IOHIDEvent *)a4
{
  id v4 = CFDictionaryGetValue([(UITouchesEvent *)self _coalescedTouchesForHidEvent:a4], (const void *)a3);
  uint64_t v5 = [v4 lastObject];

  return v5;
}

- (id)predictedTouchesForTouch:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_allTouchesMutable containsObject:v4])
  {
    uint64_t v5 = -[UITouch _predictedTouchesWithEvent:](v4, self);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_inputPrecision
{
  uint64_t v3 = [(UITouchesEvent *)self allTouches];
  if ([v3 count])
  {

LABEL_3:
    id v4 = [(UITouchesEvent *)self allTouches];
    unint64_t v5 = +[UIEvent _inputPrecisionForTouches:v4];

    return v5;
  }
  uint64_t v7 = [(UIEvent *)self _hidEvent];

  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = [(UIEvent *)self _hidEvent];
  uint64_t v9 = _UIEventHIDGetDescendantPointerEvent((uint64_t)v8);
  if ((unint64_t)_UIEventHIDGetChildStylusEvent((uint64_t)v8) | v9) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_removeComponents:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 _eventComponentType])
        {
          uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITouchesEvent.m", 1174, @"Unexpected event component type: %ld", objc_msgSend(v10, "_eventComponentType"));
        }
        [(UITouchesEvent *)self _removeTouch:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (int64_t)singleAllowableExternalTouchPathIndex
{
  return self->_singleAllowableExternalTouchPathIndex;
}

- (void)setSingleAllowableExternalTouchPathIndex:(int64_t)a3
{
  self->_singleAllowableExternalTouchPathIndex = a3;
}

@end