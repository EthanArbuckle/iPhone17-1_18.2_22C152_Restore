@interface _UIKBRTRecognizer
- (BOOL)addedToActiveTouches:(id)a3;
- (BOOL)disableHomeRowReturn;
- (BOOL)makeTouchActive:(id)a3;
- (BOOL)notifyDelegateOfMovedTouch:(id)a3;
- (BOOL)queryDelegateOfIgnoringTouch:(id)a3 forOtherTouch:(BOOL)a4;
- (BOOL)queryDelegateOfRestingTouch:(id)a3;
- (BOOL)queryDelegateToBeginTouch:(id)a3 forBeginState:(unint64_t)a4 restartIfNecessary:(BOOL)a5;
- (BOOL)removedFromActiveTouches:(id)a3;
- (CGSize)clusterRestHaloSize;
- (NSMutableArray)ignoredTouches;
- (NSMutableArray)touchInfos;
- (NSMutableSet)activeTouches;
- (NSMutableSet)averagingRules;
- (NSMutableSet)definitiveRules;
- (OS_dispatch_queue)activeTouchesQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)ignoredTouchesQueue;
- (OS_dispatch_queue)touchQueue;
- (_UIKBRTRecognizer)init;
- (_UIKBRTRecognizerDelegate)delegate;
- (_UIKBRTRecognizerTouchLoggingProtocol)touchLogger;
- (_UIKBRTRecognizerTouchPointTrackingProtocol)touchTracker;
- (double)maximumNonRestMoveDistance;
- (double)touchIntervalAverage;
- (float)letRulesModifyNewTouchInfo:(id)a3;
- (unint64_t)numProlongedTouches;
- (void)_doBeginTouchWithTouchInfo:(id)a3;
- (void)_doCancelledTouchWithTouchInfo:(id)a3;
- (void)_doEndedTouchWithTouchInfo:(id)a3;
- (void)_doIgnoreTouchWithTouchInfo:(id)a3;
- (void)_doMarkTouchProcessedWithTouchInfo:(id)a3;
- (void)_doMovedTouchWithTouchInfo:(id)a3;
- (void)cancelTouchOnLayoutWithTouchInfo:(id)a3;
- (void)explicitlyIgnoreTouch:(id)a3 withIdentifier:(id)a4;
- (void)letRulesModifyPendingTouchInfo:(id)a3;
- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4;
- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4 because:(id)a5;
- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4 withMessage:(id)a5;
- (void)markTouchProcessed:(id)a3 withIdentifier:(id)a4;
- (void)notifyDelegateOfCancelledTouch:(id)a3;
- (void)notifyDelegateOfIgnoringTouch:(id)a3;
- (void)notifyDelegateOfMovedIgnoredTouch:(id)a3;
- (void)notifyDelegateOfRestingTouch:(id)a3;
- (void)notifyDelegateOfSuccessfulTouch:(id)a3;
- (void)processTouchInfo:(id)a3;
- (void)reset;
- (void)setActiveTouches:(id)a3;
- (void)setActiveTouchesQueue:(id)a3;
- (void)setClusterRestHaloSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDisableHomeRowReturn:(BOOL)a3;
- (void)setIgnoredTouches:(id)a3;
- (void)setIgnoredTouchesQueue:(id)a3;
- (void)setMaximumNonRestMoveDistance:(double)a3;
- (void)setNumProlongedTouches:(unint64_t)a3;
- (void)setStandardKeyPixelSize:(CGSize)a3;
- (void)setTouchInfos:(id)a3;
- (void)setTouchIntervalAverage:(double)a3;
- (void)setTouchLogger:(id)a3;
- (void)setTouchQueue:(id)a3;
- (void)setTouchTracker:(id)a3;
- (void)touchCancelled:(id)a3 withIdentifier:(id)a4;
- (void)touchDown:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5;
- (void)touchDragged:(id)a3 withIdentifier:(id)a4;
- (void)touchUp:(id)a3 withIdentifier:(id)a4;
- (void)updateIgnoredTouchesForTouchInfo:(id)a3 whenTouchInfo:(id)a4 changesStateTo:(char)a5;
@end

@implementation _UIKBRTRecognizer

- (_UIKBRTRecognizer)init
{
  v23.receiver = self;
  v23.super_class = (Class)_UIKBRTRecognizer;
  v2 = [(_UIKBRTRecognizer *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("_UIKBRTRecognizerQueue", v3);
    touchQueue = v2->_touchQueue;
    v2->_touchQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("_UIKBRTRecognizerDelegateQueue", v3);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    touchInfos = v2->_touchInfos;
    v2->_touchInfos = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    activeTouches = v2->_activeTouches;
    v2->_activeTouches = (NSMutableSet *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("_UIKBRTRecogizerActiveTouchesQueue", 0);
    activeTouchesQueue = v2->_activeTouchesQueue;
    v2->_activeTouchesQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = objc_opt_new();
    ignoredTouches = v2->_ignoredTouches;
    v2->_ignoredTouches = (NSMutableArray *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("_UIKBRTRecognizerIgnoredTouchesQueue", 0);
    ignoredTouchesQueue = v2->_ignoredTouchesQueue;
    v2->_ignoredTouchesQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = objc_opt_new();
    definitiveRules = v2->_definitiveRules;
    v2->_definitiveRules = (NSMutableSet *)v18;

    uint64_t v20 = objc_opt_new();
    averagingRules = v2->_averagingRules;
    v2->_averagingRules = (NSMutableSet *)v20;

    v2->_maximumNonRestMoveDistance = 0.0;
    v2->_clusterRestHaloSize.width = 0.0;
    v2->_clusterRestHaloSize.height = 0.0;
  }
  return v2;
}

- (void)reset
{
  self->_isWaiting = 0;
  touchQueue = self->_touchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26___UIKBRTRecognizer_reset__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(touchQueue, block);
}

- (void)setStandardKeyPixelSize:(CGSize)a3
{
  touchQueue = self->_touchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___UIKBRTRecognizer_setStandardKeyPixelSize___block_invoke;
  block[3] = &unk_1E52DD178;
  block[4] = self;
  CGSize v5 = a3;
  dispatch_async(touchQueue, block);
}

- (void)setDisableHomeRowReturn:(BOOL)a3
{
  touchQueue = self->_touchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45___UIKBRTRecognizer_setDisableHomeRowReturn___block_invoke;
  v4[3] = &unk_1E52D9FC0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(touchQueue, v4);
}

- (float)letRulesModifyNewTouchInfo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  BOOL v5 = (void *)[(NSMutableSet *)self->_definitiveRules copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) recognizer:self touchStateForNewTouchInfo:v4];
        if (v10 != [v4 currentTouchState])
        {
          [v4 setCurrentTouchState:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  float v11 = 1.0;
  if ([(NSMutableSet *)self->_averagingRules count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    dispatch_queue_t v12 = (void *)[(NSMutableSet *)self->_averagingRules copy];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      int v15 = 0;
      uint64_t v16 = *(void *)v32;
      float v17 = 0.0;
      float v18 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = [*(id *)(*((void *)&v31 + 1) + 8 * j) recognizer:self confidenceWhenPendingTouchInfo:v4];
          v21 = v20;
          if (v20)
          {
            [v20 touchConfidence];
            if (v22 <= 1.0) {
              float v23 = v22;
            }
            else {
              float v23 = 1.0;
            }
            if (v22 >= 0.0) {
              float v24 = v23;
            }
            else {
              float v24 = 0.0;
            }
            [v21 restConfidence];
            if (v25 <= 1.0) {
              float v26 = v25;
            }
            else {
              float v26 = 1.0;
            }
            if (v25 >= 0.0) {
              float v27 = v26;
            }
            else {
              float v27 = 0.0;
            }
            float v18 = v18 + v24;
            float v17 = v17 + v27;
            ++v15;
            if (v24 >= v27) {
              float v27 = v24;
            }
            if (v27 > 0.5)
            {
              [v21 confidenceCheckTimeout];
              float v11 = 1.0 - v28;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v14);

      if (v15)
      {
        if (v18 >= v17) {
          float v29 = v18;
        }
        else {
          float v29 = v17;
        }
        if ((float)(v29 / (float)v15) > 0.5) {
          [v4 setCurrentTouchState:v18 <= v17];
        }
      }
    }
    else
    {
    }
  }

  return v11;
}

- (void)letRulesModifyPendingTouchInfo:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 currentTouchState] == 3)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v5 = (void *)[(NSMutableSet *)self->_definitiveRules copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) recognizer:self touchStateForPendingTouchInfo:v4];
          if (v10 != [v4 currentTouchState])
          {
            [v4 setCurrentTouchState:v10];
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  if ([v4 currentTouchState] == 3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    float v11 = (void *)[(NSMutableSet *)self->_averagingRules copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      int v14 = 0;
      uint64_t v15 = *(void *)v31;
      float v16 = 0.0;
      float v17 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v11);
          }
          v19 = [*(id *)(*((void *)&v30 + 1) + 8 * j) recognizer:self confidenceWhenSettingTouchInfo:v4];
          uint64_t v20 = v19;
          if (v19)
          {
            [v19 touchConfidence];
            if (v21 <= 1.0) {
              float v22 = v21;
            }
            else {
              float v22 = 1.0;
            }
            if (v21 >= 0.0) {
              float v23 = v22;
            }
            else {
              float v23 = 0.0;
            }
            float v17 = v17 + v23;
            [v20 restConfidence];
            if (v24 <= 1.0) {
              float v25 = v24;
            }
            else {
              float v25 = 1.0;
            }
            if (v24 >= 0.0) {
              float v26 = v25;
            }
            else {
              float v26 = 0.0;
            }
            float v16 = v16 + v26;
            ++v14;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v13);

      if (v14)
      {
        float v27 = v17 >= v16 ? v17 : v16;
        if ((float)(v27 / (float)v14) > 0.5)
        {
          float v28 = v4;
          if (v17 <= v16)
          {
            if ([v4 preRuleTouchState] == 2)
            {
              float v28 = v4;
              uint64_t v29 = 2;
            }
            else
            {
              float v28 = v4;
              uint64_t v29 = 1;
            }
          }
          else
          {
            uint64_t v29 = 0;
          }
          [v28 setCurrentTouchState:v29];
        }
      }
    }
    else
    {
    }
  }
  if ([v4 currentTouchState] == 3)
  {
    objc_msgSend(v4, "setCurrentTouchState:", objc_msgSend(v4, "preRuleTouchState"));
    [v4 setPreRuleTouchState:0xFFFFFFFFLL];
  }
}

- (void)_doBeginTouchWithTouchInfo:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 touchIdentifier];

  if (v5)
  {
    [(_UIKBRTRecognizer *)self kbStatusMessage:@"Beginning touch on %@", v4];
    [v4 originalTimestamp];
    double v7 = v6;
    [(_UIKBRTRecognizerTouchPointTrackingProtocol *)self->_touchTracker addTouchInfo:v4];
    [v4 currentTimestamp];
    double v9 = v8;
    touchInfos = self->_touchInfos;
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke;
    v103[3] = &__block_descriptor_40_e26_B16__0___UIKBRTTouchInfo_8l;
    *(double *)&v103[4] = v7;
    [(NSMutableArray *)touchInfos _uikbrtInsert:v4 beforeItemPassingTest:v103];
    [v4 currentTouchPoint];
    double v12 = v11;
    v83 = objc_opt_new();
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v13 = [(NSMutableArray *)self->_touchInfos reverseObjectEnumerator];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v99 objects:v107 count:16];
    if (v14)
    {
      uint64_t v81 = 0;
      unint64_t v82 = 0;
      uint64_t v15 = *(void *)v100;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v100 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(id *)(*((void *)&v99 + 1) + 8 * v16);
          if (v17 != v4)
          {
            [*(id *)(*((void *)&v99 + 1) + 8 * v16) originalTimestamp];
            double v19 = v18;
            int v20 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, @"_UIKBRT_SetDownTapInterval");
            double v21 = *(double *)&qword_1E8FD4FC0;
            if (v20) {
              double v21 = 0.04;
            }
            BOOL v22 = v7 - v19 > v21 && [v83 count] == self->_numProlongedTouches;
            for (char i = [v17 currentTouchState]; ; char i = objc_msgSend(v17, "preRuleTouchState"))
            {
              char v24 = i;
              if (i != 3) {
                break;
              }
            }
            switch(i)
            {
              case 1:
                ++v82;
                goto LABEL_26;
              case 2:
              case 6:
              case 7:
                if (self->_disableHomeRowReturn) {
                  goto LABEL_26;
                }
                [v17 currentTouchPoint];
                double v26 = v25;
                [v4 currentTouchPoint];
                if (vabdd_f64(v26, v27) >= self->_clusterRestHaloSize.width
                  || ([v17 currentTouchPoint], vabdd_f64(v28, v12) >= self->_clusterRestHaloSize.height))
                {
                  if (v24 != 5)
                  {
                    [v17 originalTimestamp];
                    double v34 = v33;
                    int v35 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, @"_UIKBRT_SetDownTapInterval");
                    double v36 = *(double *)&qword_1E8FD4FC0;
                    if (v35) {
                      double v36 = 0.04;
                    }
                    if (v7 - v34 <= v36) {
                      ++v82;
                    }
                  }
                }
                else
                {
                  ++v81;
                  BOOL v22 = [v83 count] == self->_numProlongedTouches;
LABEL_26:
                  if (v22) {
                    goto LABEL_38;
                  }
                }
                break;
              case 5:
                [v17 currentTouchPoint];
                double v30 = v29;
                [v4 currentTouchPoint];
                if (vabdd_f64(v30, v31) < self->_clusterRestHaloSize.width)
                {
                  [v17 currentTouchPoint];
                  if (vabdd_f64(v32, v12) < self->_clusterRestHaloSize.height
                    && ![(_UIKBRTRecognizer *)self queryDelegateOfIgnoringTouch:v4 forOtherTouch:1])
                  {
                    [v83 addObject:v17];
                  }
                }
                goto LABEL_26;
              default:
                goto LABEL_26;
            }
          }
          ++v16;
        }
        while (v16 != v14);
        uint64_t v37 = [v13 countByEnumeratingWithState:&v99 objects:v107 count:16];
        uint64_t v14 = v37;
      }
      while (v37);
    }
    else
    {
      uint64_t v81 = 0;
      unint64_t v82 = 0;
    }
LABEL_38:

    if ([v83 count])
    {
      [v83 count];
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v38 = v83;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v106 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v96;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v96 != v40) {
              objc_enumerationMutation(v38);
            }
            v42 = *(void **)(*((void *)&v95 + 1) + 8 * j);
            [(_UIKBRTRecognizer *)self makeTouchIgnored:v42 force:1];
            [v42 setCurrentTouchState:7];
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v106 count:16];
        }
        while (v39);
      }

      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_374);
      [(_UIKBRTRecognizer *)self makeTouchIgnored:v4 force:1];
      goto LABEL_102;
    }
    if (v82 < 2)
    {
      if (v81 && ![v4 currentTouchState]) {
        [v4 setCurrentTouchState:2];
      }
      if (_UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, @"_UIKBRT_SetDownTapInterval"))double v57 = 0.04; {
      else
      }
        double v57 = *(double *)&qword_1E8FD4FC0;
      objc_msgSend(v4, "setPreRuleTouchState:", objc_msgSend(v4, "currentTouchState"));
      [(_UIKBRTRecognizer *)self letRulesModifyNewTouchInfo:v4];
      float v59 = v58;
      v60 = [MEMORY[0x1E4F1CAD0] set];
      int v61 = [v4 currentTouchState];
      v62 = [v4 previousTouch];

      if (v62)
      {
        v63 = [v4 previousTouch];
        v64 = objc_msgSend(v63, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", v4, objc_msgSend(v4, "currentTouchState"));
        uint64_t v65 = [v60 setByAddingObjectsFromSet:v64];

        v60 = (void *)v65;
      }
      v66 = [v4 nextTouch];

      if (v66)
      {
        v67 = [v4 nextTouch];
        v68 = objc_msgSend(v67, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", v4, objc_msgSend(v4, "currentTouchState"));
        uint64_t v69 = [v60 setByAddingObjectsFromSet:v68];

        v60 = (void *)v69;
      }
      if ([v4 currentTouchState] != v61)
      {
        v70 = [v4 previousTouch];

        if (v70)
        {
          v71 = [v4 previousTouch];
          v72 = objc_msgSend(v71, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", v4, objc_msgSend(v4, "currentTouchState"));
          uint64_t v73 = [v60 setByAddingObjectsFromSet:v72];

          v60 = (void *)v73;
        }
        [(_UIKBRTRecognizer *)self letRulesModifyNewTouchInfo:v4];
        if (v59 >= v74) {
          float v59 = v74;
        }
      }
      if ([v4 currentTouchState] == 6)
      {
        uint64_t v75 = [v60 setByAddingObject:v4];

        v60 = (void *)v75;
      }
      else if ([(NSMutableSet *)self->_definitiveRules count] {
             || [(NSMutableSet *)self->_averagingRules count])
      }
      {
        objc_msgSend(v4, "setPreRuleTouchState:", objc_msgSend(v4, "currentTouchState"));
        [v4 setCurrentTouchState:3];
      }
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v76 = v60;
      uint64_t v77 = [v76 countByEnumeratingWithState:&v87 objects:v104 count:16];
      if (v77)
      {
        uint64_t v78 = *(void *)v88;
        do
        {
          for (uint64_t k = 0; k != v77; ++k)
          {
            if (*(void *)v88 != v78) {
              objc_enumerationMutation(v76);
            }
            [(_UIKBRTRecognizer *)self makeTouchIgnored:*(void *)(*((void *)&v87 + 1) + 8 * k) force:1];
          }
          uint64_t v77 = [v76 countByEnumeratingWithState:&v87 objects:v104 count:16];
        }
        while (v77);
      }

      if ([v4 currentTouchState] <= 3)
      {
        if (v59 < 1.0) {
          double v57 = v57 * 0.25 + v57 * 0.25 * v59 * 3.0 * 0.25;
        }
        objc_initWeak(&location, self);
        touchQueue = self->_touchQueue;
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_4;
        v84[3] = &unk_1E52FDBD0;
        objc_copyWeak(&v85, &location);
        [v4 setTimerWithTimeInterval:touchQueue onQueue:v84 do:v7 + v57 - v9];
        objc_destroyWeak(&v85);
        objc_destroyWeak(&location);
      }

      goto LABEL_102;
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v43 = [(NSMutableArray *)self->_touchInfos reverseObjectEnumerator];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v91 objects:v105 count:16];
    if (!v44)
    {
LABEL_69:

      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_31_2);
LABEL_102:

      goto LABEL_103;
    }
    unsigned __int8 v45 = 0;
    uint64_t v46 = *(void *)v92;
LABEL_50:
    uint64_t v47 = 0;
    while (1)
    {
      if (*(void *)v92 != v46) {
        objc_enumerationMutation(v43);
      }
      id v48 = *(id *)(*((void *)&v91 + 1) + 8 * v47);
      [v48 originalTimestamp];
      double v50 = v49;
      int v51 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, @"_UIKBRT_SetDownTapInterval");
      double v52 = *(double *)&qword_1E8FD4FC0;
      if (v51) {
        double v52 = 0.04;
      }
      if (((v7 - v50 > v52) & v45) != 0) {
        goto LABEL_69;
      }
      BOOL v53 = v48 == v4;
      unsigned int v54 = [v48 currentTouchState];
      v45 |= v53;
      if (v54 < 4) {
        break;
      }
      if (v54 == 7)
      {
        unsigned __int8 v55 = v45;
      }
      else
      {
        if (v54 == 5) {
          break;
        }
        unsigned __int8 v55 = 0;
      }
LABEL_58:
      if ((v55 & 1) != 0 || !v53)
      {
        if (v55) {
          goto LABEL_69;
        }
      }
      else
      {
        [(_UIKBRTRecognizer *)self makeTouchIgnored:v48 force:1];
        [v48 setCurrentTouchState:7];
      }
      if (v44 == ++v47)
      {
        uint64_t v56 = [v43 countByEnumeratingWithState:&v91 objects:v105 count:16];
        uint64_t v44 = v56;
        if (v56) {
          goto LABEL_50;
        }
        goto LABEL_69;
      }
    }
    unsigned __int8 v55 = 0;
    BOOL v53 = 1;
    goto LABEL_58;
  }
  [(_UIKBRTRecognizer *)self makeTouchIgnored:v4 force:1];
LABEL_103:
}

- (void)touchDown:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5
{
  double v6 = +[_UIKBRTTouchInfo createTouchInfoForTouch:a3 withIdentifier:a4 canLogTouch:a5];
  [(_UIKBRTRecognizerTouchLoggingProtocol *)self->_touchLogger logTouchInfo:v6 withPhase:0];
  touchQueue = self->_touchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58___UIKBRTRecognizer_touchDown_withIdentifier_canLogTouch___block_invoke;
  v9[3] = &unk_1E52D9F98;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(touchQueue, v9);
}

- (void)_doMovedTouchWithTouchInfo:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_ignoredTouches, "containsObject:"))
  {
    [(_UIKBRTRecognizer *)self notifyDelegateOfMovedIgnoredTouch:v4];
    [(_UIKBRTRecognizerTouchPointTrackingProtocol *)self->_touchTracker moveTouchInfo:v4];
  }
  else
  {
    [(_UIKBRTRecognizer *)self kbStatusMessage:@"Moving touch on %@", v4];
    [(_UIKBRTRecognizerTouchPointTrackingProtocol *)self->_touchTracker moveTouchInfo:v4];
    if (![(_UIKBRTRecognizer *)self notifyDelegateOfMovedTouch:v4]) {
      [(_UIKBRTRecognizer *)self makeTouchIgnored:v4 force:1];
    }
  }
}

- (void)touchDragged:(id)a3 withIdentifier:(id)a4
{
  BOOL v5 = +[_UIKBRTTouchInfo touchInfoForTouch:a3 withIdentifier:a4];
  if (v5)
  {
    [(_UIKBRTRecognizerTouchLoggingProtocol *)self->_touchLogger logTouchInfo:v5 withPhase:1];
    touchQueue = self->_touchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49___UIKBRTRecognizer_touchDragged_withIdentifier___block_invoke;
    v7[3] = &unk_1E52D9F98;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(touchQueue, v7);
  }
}

- (void)_doEndedTouchWithTouchInfo:(id)a3
{
  id v4 = a3;
  [(_UIKBRTRecognizer *)self letRulesModifyPendingTouchInfo:v4];
  if (![(NSMutableArray *)self->_ignoredTouches containsObject:v4])
  {
    double v9 = &stru_1ED0E84C0;
    double v27 = [v4 touchIdentifier];

    if (!v27
      || [v4 currentTouchState]
      || [(_UIKBRTRecognizer *)self makeTouchActive:v4])
    {
      char v26 = 0;
    }
    else
    {
      char v26 = 1;
      [(_UIKBRTRecognizer *)self makeTouchIgnored:v4 force:1];
      double v9 = @"initially-active ";
    }
    goto LABEL_29;
  }
  ignoredTouchesQueue = self->_ignoredTouchesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___UIKBRTRecognizer__doEndedTouchWithTouchInfo___block_invoke;
  block[3] = &unk_1E52D9F98;
  block[4] = self;
  id v6 = v4;
  id v34 = v6;
  dispatch_sync(ignoredTouchesQueue, block);

  [v6 currentTimestamp];
  double v8 = v7;
  double v9 = @"ignored ";
  id v10 = [v6 touchIdentifier];

  if (!v10) {
    goto LABEL_28;
  }
  double v11 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MinimumRestHoldInterval, @"_UIKBRT_MinimumRestHoldInterval")? 0.0: *(double *)&qword_1E8FD4FE0;
  double v12 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MaximumRestHoldInterval, @"_UIKBRT_MaximumRestHoldInterval")? 0.25: *(double *)&qword_1E8FD4FF0;
  int v13 = [v6 currentTouchState];
  if (v13 != 1 && v13 != 6) {
    goto LABEL_28;
  }
  [v6 currentTouchPoint];
  double v15 = v14;
  [v6 originalTouchPoint];
  double v17 = v16;
  [v6 currentTouchPoint];
  double v19 = v18;
  [v6 originalTouchPoint];
  double v21 = v20;
  [v6 originalTimestamp];
  float v22 = (v15 - v17) * (v15 - v17) + (v19 - v21) * (v19 - v21);
  double v23 = sqrtf(v22);
  double v25 = v8 - v24;
  if (self->_maximumNonRestMoveDistance <= v23)
  {
    [v6 maximumRadius];
    if (v28 <= v23 || v11 > v25 || v25 > v12) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  char v26 = 1;
  if (v11 <= v25 && v25 <= v12)
  {
LABEL_26:
    if ([(_UIKBRTRecognizer *)self queryDelegateToBeginTouch:v6 forBeginState:1 restartIfNecessary:1])
    {
      [v6 setCurrentTouchState:1];
      char v26 = 0;
      double v9 = @"initially-ignored ";
      goto LABEL_29;
    }
LABEL_28:
    char v26 = 1;
  }
LABEL_29:
  [(_UIKBRTRecognizer *)self queryDelegateToBeginTouch:v4 forBeginState:2 restartIfNecessary:0];
  if ((v26 & 1) != 0
    || ([v4 touchIdentifier], double v31 = objc_claimAutoreleasedReturnValue(), v31, !v31))
  {
    double v32 = [v4 touchIdentifier];

    if (v32) {
      [(_UIKBRTRecognizer *)self notifyDelegateOfCancelledTouch:v4];
    }
  }
  else
  {
    [(_UIKBRTRecognizer *)self processTouchInfo:v4];
  }
  [v4 cleanup];
  [(_UIKBRTRecognizer *)self kbStatusMessage:@"Ended %@touch on %@", v9, v4];
}

- (void)touchUp:(id)a3 withIdentifier:(id)a4
{
  BOOL v5 = +[_UIKBRTTouchInfo touchInfoForTouch:a3 withIdentifier:a4];
  if (v5)
  {
    [(_UIKBRTRecognizerTouchLoggingProtocol *)self->_touchLogger logTouchInfo:v5 withPhase:3];
    [v5 invalidateTimer];
    touchQueue = self->_touchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44___UIKBRTRecognizer_touchUp_withIdentifier___block_invoke;
    v7[3] = &unk_1E52D9F98;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(touchQueue, v7);
  }
}

- (void)_doCancelledTouchWithTouchInfo:(id)a3
{
  id v4 = a3;
  [(_UIKBRTRecognizer *)self kbStatusMessage:@"Cancelling touch on %@", v4];
  ignoredTouchesQueue = self->_ignoredTouchesQueue;
  blocuint64_t k = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __52___UIKBRTRecognizer__doCancelledTouchWithTouchInfo___block_invoke;
  double v11 = &unk_1E52D9F98;
  double v12 = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(ignoredTouchesQueue, &block);
  double v7 = [v6 touchIdentifier];

  if (v7) {
    [(_UIKBRTRecognizer *)self cancelTouchOnLayoutWithTouchInfo:v6];
  }

  [v4 cleanup];
  [(_UIKBRTRecognizer *)self kbStatusMessage:@"Cancelled %@touch on %@", &stru_1ED0E84C0, v4, block, v9, v10, v11, v12];
}

- (void)touchCancelled:(id)a3 withIdentifier:(id)a4
{
  BOOL v5 = +[_UIKBRTTouchInfo touchInfoForTouch:a3 withIdentifier:a4];
  if (v5)
  {
    [(_UIKBRTRecognizerTouchLoggingProtocol *)self->_touchLogger logTouchInfo:v5 withPhase:4];
    [v5 invalidateTimer];
    touchQueue = self->_touchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51___UIKBRTRecognizer_touchCancelled_withIdentifier___block_invoke;
    v7[3] = &unk_1E52D9F98;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(touchQueue, v7);
  }
}

- (void)_doMarkTouchProcessedWithTouchInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    [v4 invalidateTimer];
    ignoredTouchesQueue = self->_ignoredTouchesQueue;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __56___UIKBRTRecognizer__doMarkTouchProcessedWithTouchInfo___block_invoke;
    double v11 = &unk_1E52D9F98;
    double v12 = self;
    id v7 = v5;
    id v13 = v7;
    dispatch_sync(ignoredTouchesQueue, &v8);
    if (-[_UIKBRTRecognizer removedFromActiveTouches:](self, "removedFromActiveTouches:", v7, v8, v9, v10, v11, v12)) {
      [(_UIKBRTRecognizerTouchLoggingProtocol *)self->_touchLogger closeTouchInfo:v7];
    }
    [v7 cleanup];
  }
}

- (void)markTouchProcessed:(id)a3 withIdentifier:(id)a4
{
  BOOL v5 = +[_UIKBRTTouchInfo touchInfoForTouch:a3 withIdentifier:a4];
  touchQueue = self->_touchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55___UIKBRTRecognizer_markTouchProcessed_withIdentifier___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(touchQueue, v8);
}

- (void)_doIgnoreTouchWithTouchInfo:(id)a3
{
  if (a3)
  {
    touchLogger = self->_touchLogger;
    id v5 = a3;
    [(_UIKBRTRecognizerTouchLoggingProtocol *)touchLogger logTouchInfo:v5 withPhase:4];
    [v5 invalidateTimer];
    [(_UIKBRTRecognizer *)self makeTouchIgnored:v5 force:1];
  }
}

- (void)explicitlyIgnoreTouch:(id)a3 withIdentifier:(id)a4
{
  id v5 = +[_UIKBRTTouchInfo touchInfoForTouch:a3 withIdentifier:a4];
  touchQueue = self->_touchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58___UIKBRTRecognizer_explicitlyIgnoreTouch_withIdentifier___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(touchQueue, v8);
}

- (void)updateIgnoredTouchesForTouchInfo:(id)a3 whenTouchInfo:(id)a4 changesStateTo:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  if ([v8 willChangeTouchInfo:a4 toState:v5])
  {
    ignoredTouchesQueue = self->_ignoredTouchesQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83___UIKBRTRecognizer_updateIgnoredTouchesForTouchInfo_whenTouchInfo_changesStateTo___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    id v11 = v8;
    dispatch_sync(ignoredTouchesQueue, v10);
  }
}

- (void)processTouchInfo:(id)a3
{
  id v12 = a3;
  [v12 invalidateTimer];
  int v4 = [v12 currentTouchState];
  if (v4 == 3 || v4 == 6)
  {
    int v6 = 0;
    uint64_t v5 = 6;
  }
  else
  {
    if (v4 == 5) {
      --self->_numProlongedTouches;
    }
    uint64_t v5 = 8;
    int v6 = 1;
  }
  int v7 = [v12 currentTouchState];
  id v8 = v12;
  if (v7 != v5)
  {
    id v9 = [v12 previousTouch];
    [(_UIKBRTRecognizer *)self updateIgnoredTouchesForTouchInfo:v9 whenTouchInfo:v12 changesStateTo:v5];

    id v10 = [v12 nextTouch];
    [(_UIKBRTRecognizer *)self updateIgnoredTouchesForTouchInfo:v10 whenTouchInfo:v12 changesStateTo:v5];

    [v12 setCurrentTouchState:v5];
    if (v6)
    {
      [(_UIKBRTRecognizer *)self notifyDelegateOfSuccessfulTouch:v12];
    }
    else
    {
      id v11 = [v12 touchIdentifier];

      id v8 = v12;
      if (!v11) {
        goto LABEL_13;
      }
      [(_UIKBRTRecognizer *)self notifyDelegateOfCancelledTouch:v12];
    }
    id v8 = v12;
  }
LABEL_13:
}

- (BOOL)addedToActiveTouches:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  activeTouchesQueue = self->_activeTouchesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___UIKBRTRecognizer_addedToActiveTouches___block_invoke;
  block[3] = &unk_1E52E1B98;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(activeTouchesQueue, block);
  LOBYTE(activeTouchesQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)activeTouchesQueue;
}

- (BOOL)removedFromActiveTouches:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  activeTouchesQueue = self->_activeTouchesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___UIKBRTRecognizer_removedFromActiveTouches___block_invoke;
  block[3] = &unk_1E52E1B98;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(activeTouchesQueue, block);
  LOBYTE(activeTouchesQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)activeTouchesQueue;
}

- (BOOL)queryDelegateToBeginTouch:(id)a3 forBeginState:(unint64_t)a4 restartIfNecessary:(BOOL)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  float v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (self->_delegate)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke;
    v15[3] = &unk_1E52FDC20;
    v15[4] = self;
    double v18 = &v21;
    unint64_t v19 = a4;
    id v16 = v8;
    uint64_t v11 = v9;
    double v17 = v11;
    BOOL v20 = a5;
    dispatch_async(delegateQueue, v15);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v11, v12));
    self->_isWaiting = 0;

    BOOL v13 = *((unsigned char *)v22 + 24) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (void)notifyDelegateOfSuccessfulTouch:(id)a3
{
  id v5 = a3;
  id v6 = [v5 touchIdentifier];

  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIKBRTRecognizer.m" lineNumber:983 description:@"Can't succeed on a touch that we're supposed to be ignoring!"];
  }
  if (([(NSMutableSet *)self->_activeTouches containsObject:v5] & 1) == 0)
  {
    dispatch_time_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIKBRTRecognizer.m" lineNumber:984 description:@"Can't succeed on a touch that isn't already active!"];
  }
  if ([(NSMutableArray *)self->_ignoredTouches containsObject:v5])
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIKBRTRecognizer.m" lineNumber:985 description:@"Can't succeed on a touch that we're supposed to be ignoring!"];
  }
  if (self->_delegate)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke;
    block[3] = &unk_1E52DCB30;
    block[4] = self;
    id v15 = v5;
    dispatch_semaphore_t v9 = v7;
    id v16 = v9;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v9, v10));
    self->_isWaiting = 0;
  }
}

- (void)notifyDelegateOfCancelledTouch:(id)a3
{
  id v5 = a3;
  id v6 = [v5 touchIdentifier];

  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIKBRTRecognizer.m" lineNumber:1006 description:@"Can't succeed on a touch that we're supposed to be ignoring!"];
  }
  if ([(NSMutableSet *)self->_activeTouches containsObject:v5] && self->_delegate)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke;
    block[3] = &unk_1E52DCB30;
    block[4] = self;
    id v13 = v5;
    dispatch_semaphore_t v9 = v7;
    char v14 = v9;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v9, v10));
    self->_isWaiting = 0;
  }
}

- (BOOL)notifyDelegateOfMovedTouch:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  [(_UIKBRTRecognizer *)self queryDelegateToBeginTouch:v4 forBeginState:1 restartIfNecessary:0];
  if (self->_delegate)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke;
    v11[3] = &unk_1E52E53D0;
    v11[4] = self;
    id v12 = v4;
    char v14 = &v15;
    dispatch_semaphore_t v7 = v5;
    id v13 = v7;
    dispatch_async(delegateQueue, v11);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;
  }
  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)notifyDelegateOfMovedIgnoredTouch:(id)a3
{
  id v4 = a3;
  [(_UIKBRTRecognizer *)self queryDelegateToBeginTouch:v4 forBeginState:0 restartIfNecessary:0];
  if (self->_delegate)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke;
    block[3] = &unk_1E52DCB30;
    block[4] = self;
    id v10 = v4;
    dispatch_semaphore_t v7 = v5;
    uint64_t v11 = v7;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;
  }
}

- (BOOL)queryDelegateOfIgnoringTouch:(id)a3 forOtherTouch:(BOOL)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  [(_UIKBRTRecognizer *)self queryDelegateToBeginTouch:v6 forBeginState:0 restartIfNecessary:0];
  if (self->_delegate)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke;
    block[3] = &unk_1E52FDC98;
    block[4] = self;
    BOOL v17 = a4;
    id v14 = v6;
    id v16 = &v18;
    char v9 = v7;
    uint64_t v15 = v9;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v9, v10));
    self->_isWaiting = 0;
  }
  char v11 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (BOOL)queryDelegateOfRestingTouch:(id)a3
{
  return [(_UIKBRTRecognizer *)self queryDelegateOfIgnoringTouch:a3 forOtherTouch:0];
}

- (void)notifyDelegateOfIgnoringTouch:(id)a3
{
  id v4 = a3;
  [(_UIKBRTRecognizer *)self queryDelegateToBeginTouch:v4 forBeginState:0 restartIfNecessary:0];
  if (self->_delegate)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke;
    block[3] = &unk_1E52DCB30;
    block[4] = self;
    id v10 = v4;
    dispatch_semaphore_t v7 = v5;
    char v11 = v7;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;
  }
}

- (void)notifyDelegateOfRestingTouch:(id)a3
{
  id v7 = a3;
  dispatch_semaphore_t v5 = [v7 touchIdentifier];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIKBRTRecognizer.m" lineNumber:1132 description:@"Can't rest on a touch that we're supposed to be ignoring!"];
  }
  [(_UIKBRTRecognizer *)self makeTouchIgnored:v7 force:1];
}

- (void)cancelTouchOnLayoutWithTouchInfo:(id)a3
{
  id v4 = a3;
  if (self->_delegate)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke;
    block[3] = &unk_1E52DCB30;
    block[4] = self;
    id v10 = v4;
    id v7 = v5;
    char v11 = v7;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting) {
        break;
      }
      dispatch_time_t v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;
  }
}

- (BOOL)makeTouchActive:(id)a3
{
  id v5 = a3;
  id v6 = [v5 touchIdentifier];

  if (!v6)
  {
    unint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UIKBRTRecognizer.m" lineNumber:1165 description:@"Can't rest on a touch that we're supposed to be ignoring!"];
  }
  if ([(NSMutableArray *)self->_ignoredTouches containsObject:v5])
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_UIKBRTRecognizer.m" lineNumber:1166 description:@"Can't rest on a touch that we're supposed to be ignoring!"];
  }
  [v5 invalidateTimer];
  int v7 = [(NSMutableSet *)self->_activeTouches containsObject:v5];
  if ([(_UIKBRTRecognizer *)self queryDelegateToBeginTouch:v5 forBeginState:1 restartIfNecessary:0])
  {
    [v5 setCurrentTouchState:4];
    [v5 originalTimestamp];
    double v9 = v8;
    objc_initWeak(&location, self);
    if (_UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_KeyHoldCancelInterval, @"_UIKBRT_KeyHoldCancelInterval"))double v10 = 0.5; {
    else
    }
      double v10 = *(double *)&qword_1E8FD4FD0;
    int v11 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, @"_UIKBRT_SetDownTapInterval");
    uint64_t v12 = qword_1E8FD4FC0;
    double v13 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
    double v14 = 0.04;
    if (!v11) {
      double v14 = *(double *)&v12;
    }
    double v15 = v10 + v14 + v13 - v9;
    touchQueue = self->_touchQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37___UIKBRTRecognizer_makeTouchActive___block_invoke;
    v21[3] = &unk_1E52FDCC0;
    objc_copyWeak(&v22, &location);
    v21[4] = self;
    [v5 setTimerWithTimeInterval:touchQueue onQueue:v21 do:v15];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!v7)
    {
      BOOL v17 = 0;
      goto LABEL_16;
    }
    [v5 setCurrentTouchState:4];
  }
  BOOL v17 = 1;
LABEL_16:

  return v17;
}

- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4 because:(id)a5
{
  BOOL v5 = a4;
  double v8 = (objc_class *)NSString;
  id v9 = a5;
  id v10 = a3;
  int v11 = (void *)[[v8 alloc] initWithFormat:v9 arguments:&v12];

  [(_UIKBRTRecognizer *)self makeTouchIgnored:v10 force:v5 withMessage:v11];
}

- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4 withMessage:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  char v8 = [(NSMutableArray *)self->_ignoredTouches containsObject:v7];
  [v7 invalidateTimer];
  unsigned int v9 = [v7 currentTouchState];
  if (v9 > 5) {
    goto LABEL_11;
  }
  if (((1 << v9) & 0x31) == 0)
  {
    int v11 = [v7 touchIdentifier];

    if (v11) {
      [(_UIKBRTRecognizer *)self notifyDelegateOfIgnoringTouch:v7];
    }
    goto LABEL_11;
  }
  id v10 = [v7 touchIdentifier];

  if (!v10) {
    goto LABEL_9;
  }
  if (v5)
  {
    [(_UIKBRTRecognizer *)self notifyDelegateOfIgnoringTouch:v7];
    goto LABEL_9;
  }
  if ([(_UIKBRTRecognizer *)self queryDelegateOfIgnoringTouch:v7 forOtherTouch:0])
  {
LABEL_9:
    if ([v7 currentTouchState] == 5)
    {
      char v12 = 0;
      --self->_numProlongedTouches;
LABEL_12:
      uint64_t v13 = 6;
      goto LABEL_13;
    }
LABEL_11:
    char v12 = 0;
    goto LABEL_12;
  }
  uint64_t v13 = [v7 currentTouchState];
  char v12 = 1;
LABEL_13:
  [v7 setCurrentTouchState:v13];
  if (v13 == 6) {
    char v14 = v8;
  }
  else {
    char v14 = 1;
  }
  if ((v12 & 1) == 0 && (v14 & 1) == 0)
  {
    ignoredTouchesQueue = self->_ignoredTouchesQueue;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    unint64_t v19 = __56___UIKBRTRecognizer_makeTouchIgnored_force_withMessage___block_invoke;
    uint64_t v20 = &unk_1E52D9F98;
    char v21 = self;
    id v16 = v7;
    id v22 = v16;
    dispatch_sync(ignoredTouchesQueue, &v17);
    -[_UIKBRTRecognizerTouchPointTrackingProtocol ignoreTouchInfo:](self->_touchTracker, "ignoreTouchInfo:", v16, v17, v18, v19, v20, v21);
  }
}

- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4
{
}

- (_UIKBRTRecognizerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIKBRTRecognizerDelegate *)a3;
}

- (_UIKBRTRecognizerTouchLoggingProtocol)touchLogger
{
  return self->_touchLogger;
}

- (void)setTouchLogger:(id)a3
{
}

- (_UIKBRTRecognizerTouchPointTrackingProtocol)touchTracker
{
  return self->_touchTracker;
}

- (void)setTouchTracker:(id)a3
{
}

- (NSMutableSet)definitiveRules
{
  return self->_definitiveRules;
}

- (NSMutableSet)averagingRules
{
  return self->_averagingRules;
}

- (BOOL)disableHomeRowReturn
{
  return self->_disableHomeRowReturn;
}

- (CGSize)clusterRestHaloSize
{
  double width = self->_clusterRestHaloSize.width;
  double height = self->_clusterRestHaloSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setClusterRestHaloSize:(CGSize)a3
{
  self->_clusterRestHaloSize = a3;
}

- (double)maximumNonRestMoveDistance
{
  return self->_maximumNonRestMoveDistance;
}

- (void)setMaximumNonRestMoveDistance:(double)a3
{
  self->_maximumNonRestMoveDistance = a3;
}

- (OS_dispatch_queue)touchQueue
{
  return self->_touchQueue;
}

- (void)setTouchQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSMutableArray)touchInfos
{
  return self->_touchInfos;
}

- (void)setTouchInfos:(id)a3
{
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (void)setActiveTouches:(id)a3
{
}

- (OS_dispatch_queue)activeTouchesQueue
{
  return self->_activeTouchesQueue;
}

- (void)setActiveTouchesQueue:(id)a3
{
}

- (NSMutableArray)ignoredTouches
{
  return self->_ignoredTouches;
}

- (void)setIgnoredTouches:(id)a3
{
}

- (OS_dispatch_queue)ignoredTouchesQueue
{
  return self->_ignoredTouchesQueue;
}

- (void)setIgnoredTouchesQueue:(id)a3
{
}

- (unint64_t)numProlongedTouches
{
  return self->_numProlongedTouches;
}

- (void)setNumProlongedTouches:(unint64_t)a3
{
  self->_numProlongedTouches = a3;
}

- (double)touchIntervalAverage
{
  return self->_touchIntervalAverage;
}

- (void)setTouchIntervalAverage:(double)a3
{
  self->_touchIntervalAverage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredTouchesQueue, 0);
  objc_storeStrong((id *)&self->_ignoredTouches, 0);
  objc_storeStrong((id *)&self->_activeTouchesQueue, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_touchInfos, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_touchQueue, 0);
  objc_storeStrong((id *)&self->_averagingRules, 0);
  objc_storeStrong((id *)&self->_definitiveRules, 0);
  objc_storeStrong((id *)&self->_touchTracker, 0);
  objc_storeStrong((id *)&self->_touchLogger, 0);
}

@end