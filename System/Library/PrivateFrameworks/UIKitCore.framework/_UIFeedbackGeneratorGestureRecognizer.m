@interface _UIFeedbackGeneratorGestureRecognizer
+ (id)gestureRecognizerForView:(void *)a3 feedbackGenerator:;
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_wantsPartialTouchSequences;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (_UIFeedbackGeneratorGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (uint64_t)hasDeviceInputForLocation:(uint64_t *)a3 type:(double)a4 senderID:(double)a5;
- (void)__completeIfNecessary;
- (void)__moveEventToCompleted:(id)a3;
- (void)__removeCompletedInteractionsAfterDelay:(id)a3;
- (void)_draggingEndedWithEvent:(id)a3;
- (void)_draggingEnteredWithEvent:(id)a3;
- (void)_draggingExitedWithEvent:(id)a3;
- (void)_draggingUpdatedWithEvent:(id)a3;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)_stopTrackingDragEvent:(uint64_t)a1;
- (void)_trackDragEvent:(uint64_t)a1;
- (void)_transformChangedWithEvent:(id)a3;
- (void)cleanupGestureRecognizerForFeedbackGenerator:(id *)a1;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIFeedbackGeneratorGestureRecognizer

- (_UIFeedbackGeneratorGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFeedbackGeneratorGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v12 initWithTarget:a3 action:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    trackedTouches = v4->_trackedTouches;
    v4->_trackedTouches = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    completedInteractions = v4->_completedInteractions;
    v4->_completedInteractions = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] hashTableWithOptions:514];
    feedbackGenerators = v4->_feedbackGenerators;
    v4->_feedbackGenerators = (NSHashTable *)v9;

    [(UIGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v4 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v4 setAllowedTouchTypes:&unk_1ED3F1A20];
    [(UIGestureRecognizer *)v4 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v4 setRequiresExclusiveTouchType:0];
    *(void *)&v4->super._gestureFlags |= 0x100000000000uLL;
  }
  return v4;
}

+ (id)gestureRecognizerForView:(void *)a3 feedbackGenerator:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(v4, "gestureRecognizers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v12 = v11;
          [v12[37] addObject:v5];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  objc_super v12 = (id *)objc_opt_new();
  [v4 addGestureRecognizer:v12];
  [v12[37] addObject:v5];
LABEL_11:

  return v12;
}

- (void)cleanupGestureRecognizerForFeedbackGenerator:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    [a1[37] removeObject:v3];
    uint64_t v4 = [a1[37] count];
    id v3 = v6;
    if (!v4)
    {
      id v5 = [a1 view];
      [v5 removeGestureRecognizer:a1];

      id v3 = v6;
    }
  }
}

- (uint64_t)hasDeviceInputForLocation:(uint64_t *)a3 type:(double)a4 senderID:(double)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v9 = result;
    v10 = (void *)[*(id *)(result + 272) mutableCopy];
    [v10 unionSet:*(void *)(v9 + 304)];
    if (*(unsigned char *)(v9 + 320)) {
      [v10 unionSet:*(void *)(v9 + 312)];
    }
    if (*(void *)(v9 + 280)) {
      objc_msgSend(v10, "addObject:");
    }
    if (*(void *)(v9 + 288)) {
      objc_msgSend(v10, "addObject:");
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      long long v14 = 0;
      uint64_t v15 = *(void *)v49;
      double v16 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(v11);
          }
          v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v19 = [(id)v9 view];
          [v18 locationInView:v19];
          double v21 = v20;
          double v23 = v22;

          double v24 = sqrt((a4 - v21) * (a4 - v21) + (a5 - v23) * (a5 - v23));
          if (v24 < v16)
          {
            v25 = v18;

            long long v14 = v25;
            double v16 = v24;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v55 count:16];
      }
      while (v13);
    }
    else
    {
      long long v14 = 0;
    }

    if (!_UIFeedbackLoggingDisabled)
    {
      v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackGesture", &_MergedGlobals_13_6) + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        v28 = [(id)v9 view];
        v29 = NSString;
        ClassName = object_getClassName(v28);
        objc_msgSend(v29, "stringWithFormat:", @"<%s: %p>", ClassName, v28, (void)v48);
        v31 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v31;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "finding interaction on view (%@)", buf, 0xCu);
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v14)
      {
        if (a2) {
          *a2 = 1;
        }
        if (a3)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          uint64_t v44 = 8;
          if (isKindOfClass) {
            uint64_t v44 = 80;
          }
          *a3 = *(void *)&v14[v44];
        }
        if (!_UIFeedbackLoggingDisabled)
        {
          v45 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackGesture", &qword_1EB25B4B8) + 8);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_DEFAULT, "closest interaction is trackpad event", buf, 2u);
          }
        }
        unsigned __int8 v52 = 1;
      }
      else
      {
        if (!_UIFeedbackLoggingDisabled)
        {
          v47 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackGesture", &qword_1EB25B4C0) + 8);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v47, OS_LOG_TYPE_DEFAULT, "no closest event found", buf, 2u);
          }
        }
        unsigned __int8 v52 = 0;
      }
      goto LABEL_59;
    }
    v32 = v14;
    uint64_t v33 = [v32 type];
    int v34 = [v32 _isPointerTouch];
    if (v33 == 2) {
      int v35 = 1;
    }
    else {
      int v35 = v34;
    }
    if (v35 == 1)
    {
      int v36 = v34;
      if (a2) {
        *a2 = v33 != 2;
      }
      if (a3)
      {
        if (!v34 || (uint64_t v37 = [v32 _pointerSenderID]) == 0) {
          uint64_t v37 = [v32 _senderID];
        }
        *a3 = v37;
      }
      if (_UIFeedbackLoggingDisabled) {
        goto LABEL_54;
      }
      v38 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackGesture", &qword_1EB25B4A8) + 8);
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      v39 = "pencil";
      if (v36) {
        v39 = "pointer";
      }
      *(_DWORD *)buf = 136315138;
      v54 = v39;
      v40 = "closest interaction is %s touch";
      v41 = v38;
      uint32_t v42 = 12;
    }
    else
    {
      if (_UIFeedbackLoggingDisabled) {
        goto LABEL_54;
      }
      v46 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackGesture", &qword_1EB25B4B0) + 8);
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_WORD *)buf = 0;
      v40 = "closest interaction is other touch";
      v41 = v46;
      uint32_t v42 = 2;
    }
    _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
LABEL_54:
    unsigned __int8 v52 = v35;

LABEL_59:
    return v52;
  }
  return result;
}

- (void)__completeIfNecessary
{
  if (![(NSMutableSet *)self->_trackedTouches count]
    && !self->_trackedScrollEvent
    && !self->_trackedTransformEvent)
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)__removeCompletedInteractionsAfterDelay:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___UIFeedbackGeneratorGestureRecognizer___removeCompletedInteractionsAfterDelay___block_invoke;
  block[3] = &unk_1E52D9960;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__moveEventToCompleted:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(UIGestureRecognizer *)self view];
  id v7 = +[_UIFeedbackGeneratorGestureRecognizerCompletedEvent completedEventFromEvent:v4 inView:v5];

  [(NSMutableSet *)self->_completedInteractions addObject:v7];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  [(_UIFeedbackGeneratorGestureRecognizer *)self __removeCompletedInteractionsAfterDelay:v6];
}

- (void)_transformChangedWithEvent:(id)a3
{
  id v7 = a3;
  uint64_t v5 = [v7 phase];
  switch(v5)
  {
    case 4:
      goto LABEL_6;
    case 3:
      [(_UIFeedbackGeneratorGestureRecognizer *)self __moveEventToCompleted:v7];
LABEL_6:
      trackedTransformEvent = self->_trackedTransformEvent;
      self->_trackedTransformEvent = 0;

      [(_UIFeedbackGeneratorGestureRecognizer *)self __completeIfNecessary];
      break;
    case 1:
      objc_storeStrong((id *)&self->_trackedTransformEvent, a3);
      break;
  }
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v7 = a3;
  uint64_t v5 = [v7 phase];
  switch(v5)
  {
    case 5:
      goto LABEL_6;
    case 4:
      [(_UIFeedbackGeneratorGestureRecognizer *)self __moveEventToCompleted:v7];
LABEL_6:
      trackedScrollEvent = self->_trackedScrollEvent;
      self->_trackedScrollEvent = 0;

      [(_UIFeedbackGeneratorGestureRecognizer *)self __completeIfNecessary];
      break;
    case 2:
      objc_storeStrong((id *)&self->_trackedScrollEvent, a3);
      break;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  trackedTouches = self->_trackedTouches;
  id v6 = a3;
  [(NSMutableSet *)trackedTouches minusSet:v6];
  [(_UIFeedbackGeneratorGestureRecognizer *)self __completeIfNecessary];
  objc_msgSend(v6, "bs_map:", &__block_literal_global_687);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(NSMutableSet *)self->_completedInteractions unionSet:v7];
  [(_UIFeedbackGeneratorGestureRecognizer *)self __removeCompletedInteractionsAfterDelay:v7];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  -[NSMutableSet minusSet:](self->_trackedTouches, "minusSet:");
  if (![(NSMutableSet *)self->_trackedTouches count])
  {
    objc_msgSend(v7, "bs_map:", &__block_literal_global_119_2);
    uint64_t v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    potentialDragTouches = self->_potentialDragTouches;
    self->_potentialDragTouches = v5;

    [(UIGestureRecognizer *)self setState:5];
  }
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_wantsPartialTouchSequences
{
  return 1;
}

- (void)_stopTrackingDragEvent:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a1 + 320) = 0;
    id v3 = *(void **)(a1 + 312);
    *(void *)(a1 + 312) = 0;
    id v4 = a2;

    [*(id *)(a1 + 176) removeObject:v4];
  }
}

- (void)_trackDragEvent:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 320) = 1;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = *(id *)(a1 + 312);
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
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "window", (void)v11);
          [v3 locationInView:v10];
          objc_msgSend(v9, "setLocationInWindow:");
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)_draggingEnteredWithEvent:(id)a3
{
}

- (void)_draggingUpdatedWithEvent:(id)a3
{
}

- (void)_draggingExitedWithEvent:(id)a3
{
}

- (void)_draggingEndedWithEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedTransformEvent, 0);
  objc_storeStrong((id *)&self->_completedScrollEvent, 0);
  objc_storeStrong((id *)&self->_potentialDragTouches, 0);
  objc_storeStrong((id *)&self->_completedInteractions, 0);
  objc_storeStrong((id *)&self->_feedbackGenerators, 0);
  objc_storeStrong((id *)&self->_trackedTransformEvent, 0);
  objc_storeStrong((id *)&self->_trackedScrollEvent, 0);
  objc_storeStrong((id *)&self->_trackedTouches, 0);
}

@end