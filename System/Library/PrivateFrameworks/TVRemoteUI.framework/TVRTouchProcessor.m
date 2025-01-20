@interface TVRTouchProcessor
+ (id)touchProcessorForDevice:(id)a3;
- (BOOL)_deviceSupportsMovableBoundingBox;
- (CGPoint)_virtualTouchLocationForTouch:(id)a3;
- (CGRect)_boundingBoxForTouch:(id)a3 relativeStartLocation:(int64_t)a4;
- (TVRTouchProcessorDelegate)delegate;
- (TVRTouchpadView)touchpadView;
- (id)_init;
- (int64_t)_defaultRelativeStartingLocation;
- (int64_t)_relativeTouchLocationForDistanceTraveled:(CGPoint)a3;
- (void)_beginTrackingAnyTouchIfNeeded;
- (void)_beginTrackingTouch:(id)a3 withRelativeLocation:(int64_t)a4;
- (void)_deliverTouchToDelegate:(id)a3 info:(id)a4;
- (void)_dispatchGameControllerEventForTouch:(id)a3 event:(id)a4;
- (void)_touchTimerExpired:(id)a3;
- (void)markCurrentTouchToBeCancelled;
- (void)reset;
- (void)sendPressBegan:(int64_t)a3;
- (void)sendPressEnded:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setTouchpadView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TVRTouchProcessor

+ (id)touchProcessorForDevice:(id)a3
{
  int v3 = [a3 supportsTouchEvents];
  v4 = off_2647FF928;
  if (!v3) {
    v4 = off_2647FF900;
  }
  v5 = (void *)[objc_alloc(*v4) _init];
  id v6 = [[TVRTouchpadView alloc] _init];
  [v6 setTouchProcessor:v5];
  [v5 setTouchpadView:v6];

  return v5;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)TVRTouchProcessor;
  v2 = [(TVRTouchProcessor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    touches = v2->_touches;
    v2->_touches = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeButtonTypes = v2->_activeButtonTypes;
    v2->_activeButtonTypes = v5;
  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v28 = *MEMORY[0x263EFF588];
    p_cache = ReduceLoudSoundsIntentResponse.cache;
    v27 = self;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v14 = [(TVRTouchProcessor *)self touchpadView];
        [v13 preciseLocationInView:v14];
        double v16 = v15;
        double v18 = v17;
        id v19 = objc_alloc_init((Class)(p_cache + 333));
        objc_msgSend(v19, "setInitialLocation:", v16, v18);
        [v19 setVirtualPhase:0];
        [v7 timestamp];
        objc_msgSend(v19, "setTimestamp:");
        [v7 timestamp];
        objc_msgSend(v19, "setPreviousTimestamp:");
        [(NSMapTable *)self->_touches setObject:v19 forKey:v13];
        if ([(TVRTouchProcessor *)self _deviceSupportsMovableBoundingBox])
        {
          v20 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__touchTimerExpired_ selector:v13 userInfo:0 repeats:0.2];
          [MEMORY[0x263EFF9F0] mainRunLoop];
          v21 = v14;
          id v22 = v7;
          uint64_t v23 = v9;
          uint64_t v24 = v10;
          v26 = v25 = p_cache;
          [v26 addTimer:v20 forMode:v28];

          p_cache = v25;
          uint64_t v10 = v24;
          uint64_t v9 = v23;
          id v7 = v22;
          v14 = v21;
          self = v27;
        }
        else
        {
          [(TVRTouchProcessor *)self _beginTrackingTouch:v13 withRelativeLocation:[(TVRTouchProcessor *)self _defaultRelativeStartingLocation]];
        }
        [(TVRTouchProcessor *)self _dispatchGameControllerEventForTouch:v13 event:v7];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v101 = [v6 countByEnumeratingWithState:&v102 objects:v106 count:16];
  if (v101)
  {
    uint64_t v8 = &OBJC_IVAR____TtC10TVRemoteUI17FMR1HapticPattern_name;
    uint64_t v9 = &OBJC_IVAR____TtC10TVRemoteUI17FMR1HapticPattern_name;
    uint64_t v100 = *(void *)v103;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v103 != v100) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v102 + 1) + 8 * v10);
        v12 = [(NSMapTable *)self->_touches objectForKey:v11];
        [v7 timestamp];
        objc_msgSend(v12, "setTimestamp:");
        [v7 timestamp];
        double v14 = v13;
        [v12 previousTimestamp];
        double v16 = v14 - v15;
        [v11 preciseLocationInView:self->_touchpadView];
        double v18 = v17;
        double v20 = v19;
        [v11 precisePreviousLocationInView:self->_touchpadView];
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        double v25 = hypot(v21 - v18, v23 - v20);
        [v12 initialLocation];
        double v28 = hypot(v26 - v18, v27 - v20);
        double v29 = v25 / v16;
        [v12 boundingBox];
        v108.x = v18;
        v108.y = v20;
        BOOL v30 = CGRectContainsPoint(v110, v108);
        [v12 boundingBox];
        v109.x = v22;
        v109.y = v24;
        BOOL v31 = CGRectContainsPoint(v111, v109);
        if ([v12 virtualPhase])
        {
          if ([v12 virtualPhase] == 1 || objc_msgSend(v12, "virtualPhase") == 2)
          {
            if (v30 || !v31)
            {
              if (v30) {
                goto LABEL_80;
              }
LABEL_42:
              if (![(TVRTouchProcessor *)self _deviceSupportsMovableBoundingBox]) {
                goto LABEL_80;
              }
              [v12 boundingBox];
              CGFloat v98 = v45;
              double v47 = v46;
              double v49 = v48;
              [(TVRTouchpadView *)self->_touchpadView bounds];
              CGFloat v95 = v51;
              CGFloat v96 = v50;
              CGFloat v94 = v52;
              CGFloat v97 = v53;
              double v92 = v49;
              double v93 = v47;
              double v91 = v18;
              if (![v12 isLikelyLongListScrollingEdgeGesture]) {
                goto LABEL_59;
              }
              [v12 boundingBox];
              if (v18 <= CGRectGetMaxX(v112)) {
                goto LABEL_59;
              }
              [v12 boundingBox];
              double MaxX = CGRectGetMaxX(v113);
              if (_TVRCGetBoundingBoxExtraRightDistance_onceToken != -1) {
                dispatch_once(&_TVRCGetBoundingBoxExtraRightDistance_onceToken, &__block_literal_global_299);
              }
              if ((__hasCachedBoundingBoxExtraRightDistance & 1) == 0)
              {
                v55 = [MEMORY[0x263EFFA40] standardUserDefaults];
                v56 = [v55 objectForKey:@"BoundingBoxExtraRightDistance"];

                if (v56) {
                  [v56 doubleValue];
                }
                else {
                  double v57 = 0.25;
                }
                __cachedBoundingBoxExtraRightDistance = *(void *)&v57;
                __hasCachedBoundingBoxExtraRightDistance = 1;
              }
              double v63 = *(double *)&__cachedBoundingBoxExtraRightDistance;
              objc_msgSend(v12, "boundingBox", *(void *)&v18);
              if (v18 > MaxX + v63 * CGRectGetWidth(v114))
              {
LABEL_59:
                objc_msgSend(v12, "boundingBox", *(void *)&v91);
                double MinX = CGRectGetMinX(v115);
                [v12 boundingBox];
                double v65 = CGRectGetMaxX(v116);
                v117.origin.x = v96;
                v117.origin.y = v95;
                v117.size.width = v94;
                v117.size.height = v97;
                double v99 = CGRectGetMinX(v117);
                v118.origin.x = v96;
                v118.origin.y = v95;
                v118.size.width = v94;
                v118.size.height = v97;
                double v66 = CGRectGetMaxX(v118);
                double v67 = v65 - MinX;
                double v68 = MinX;
                if (v18 > v65)
                {
                  if (v65 + v67 <= v66) {
                    double v68 = MinX + v67;
                  }
                  else {
                    double v68 = v66 - v67;
                  }
                }
                double v69 = MinX - v67;
                double v70 = v68 - v67;
                if (v69 >= v99) {
                  double v71 = v70;
                }
                else {
                  double v71 = v99;
                }
                if (v18 >= MinX) {
                  double v71 = v68;
                }
                CGFloat v98 = v71;
              }
              [v12 boundingBox];
              double MinY = CGRectGetMinY(v119);
              [v12 boundingBox];
              double MaxY = CGRectGetMaxY(v120);
              v121.origin.x = v96;
              v121.origin.y = v95;
              v121.size.width = v94;
              v121.size.height = v97;
              double v74 = CGRectGetMinY(v121);
              v122.origin.x = v96;
              v122.origin.y = v95;
              v122.size.width = v94;
              v122.size.height = v97;
              double v75 = CGRectGetMaxY(v122);
              double v76 = MaxY - MinY;
              double v77 = MinY;
              if (v20 > MaxY)
              {
                if (MaxY + v76 <= v75) {
                  double v77 = MinY + v76;
                }
                else {
                  double v77 = v75 - v76;
                }
              }
              double v78 = MinY - v76;
              double v79 = v77 - v76;
              double v80 = v78 >= v74 ? v79 : v74;
              double v81 = v20 < MinY ? v80 : v77;
              objc_msgSend(v12, "boundingBox", v80);
              v126.origin.x = v82;
              v126.origin.y = v83;
              v126.size.width = v84;
              v126.size.height = v85;
              double v86 = v98;
              v123.origin.x = v98;
              v123.origin.y = v81;
              v123.size.width = v93;
              v123.size.height = v92;
              if (CGRectEqualToRect(v123, v126))
              {
LABEL_80:
                uint64_t v40 = 2;
                goto LABEL_81;
              }
              if ([v12 isLikelyLongListScrollingEdgeGesture])
              {
                [v12 initialProportionalLocation];
                double v89 = v88;
                v124.origin.x = v98;
                v124.origin.y = v81;
                v124.size.width = v93;
                v124.size.height = v92;
                double v86 = v91 - CGRectGetWidth(v124) * v89;
                [v12 boundingBox];
                if (v91 < CGRectGetMinX(v125)) {
                  [v12 setIsLikelyLongListScrollingEdgeGesture:0];
                }
              }
              [v12 setVirtualPhase:4];
              [(TVRTouchProcessor *)self _deliverTouchToDelegate:v11 info:v12];
              objc_msgSend(v12, "setBoundingBox:", v86, v81, v93, v92);
              v87 = v12;
              uint64_t v40 = 1;
LABEL_82:
              [v87 setVirtualPhase:v40];
LABEL_83:
              [(TVRTouchProcessor *)self _deliverTouchToDelegate:v11 info:v12];
              goto LABEL_84;
            }
            if (_TVRCGetBoundingBoxExitSpeed_onceToken != -1) {
              dispatch_once(&_TVRCGetBoundingBoxExitSpeed_onceToken, &__block_literal_global_291);
            }
            if ((__hasCachedBoundingBoxExitSpeed & 1) == 0)
            {
              uint64_t v35 = v8;
              id v36 = v6;
              v37 = [MEMORY[0x263EFFA40] standardUserDefaults];
              v38 = [v37 objectForKey:@"BoundingBoxExitSpeed"];

              if (v38) {
                [v38 doubleValue];
              }
              else {
                uint64_t v39 = 0x408F400000000000;
              }
              __cachedBoundingBoxExitSpeed = v39;
              __hasCachedBoundingBoxExitSpeed = 1;

              id v6 = v36;
              uint64_t v8 = v35;
              uint64_t v9 = &OBJC_IVAR____TtC10TVRemoteUI17FMR1HapticPattern_name;
            }
            char v44 = v29 > *(double *)&__cachedBoundingBoxExitSpeed || v30;
            if (v29 <= *(double *)&__cachedBoundingBoxExitSpeed) {
              uint64_t v40 = 2;
            }
            else {
              uint64_t v40 = 4;
            }
            if ((v44 & 1) == 0) {
              goto LABEL_42;
            }
          }
          else
          {
            if ([v12 virtualPhase] != 4) {
              goto LABEL_83;
            }
            if (!v30 || v31) {
              goto LABEL_84;
            }
            uint64_t v40 = 1;
          }
LABEL_81:
          v87 = v12;
          goto LABEL_82;
        }
        if (v8[484] != -1) {
          dispatch_once(&_TVRCGetBoundingBoxThresholdDistance_onceToken, &__block_literal_global_4);
        }
        if ((v9[485] & 1) == 0)
        {
          long long v32 = [MEMORY[0x263EFFA40] standardUserDefaults];
          long long v33 = [v32 objectForKey:@"BoundingBoxThresholdDistance"];

          if (v33) {
            [v33 doubleValue];
          }
          else {
            double v34 = 20.0;
          }
          __cachedBoundingBoxThresholdDistance = *(void *)&v34;
          *((unsigned char *)v9 + 3880) = 1;
        }
        if (v28 > *(double *)&__cachedBoundingBoxThresholdDistance)
        {
          if (_TVRCGetBoundingBoxThresholdSpeed_onceToken != -1) {
            dispatch_once(&_TVRCGetBoundingBoxThresholdSpeed_onceToken, &__block_literal_global_283);
          }
          if ((__hasCachedBoundingBoxThresholdSpeed & 1) == 0)
          {
            v41 = [MEMORY[0x263EFFA40] standardUserDefaults];
            v42 = [v41 objectForKey:@"BoundingBoxThresholdSpeed"];

            if (v42) {
              [v42 doubleValue];
            }
            else {
              uint64_t v43 = 0x4069000000000000;
            }
            __cachedBoundingBoxThresholdSpeed = v43;
            __hasCachedBoundingBoxThresholdSpeed = 1;
          }
          if (v29 <= *(double *)&__cachedBoundingBoxThresholdSpeed)
          {
            v61 = self;
            v62 = v11;
            int64_t v60 = 0;
          }
          else
          {
            [v12 initialLocation];
            int64_t v60 = -[TVRTouchProcessor _relativeTouchLocationForDistanceTraveled:](self, "_relativeTouchLocationForDistanceTraveled:", v18 - v58, v20 - v59);
            v61 = self;
            v62 = v11;
          }
          [(TVRTouchProcessor *)v61 _beginTrackingTouch:v62 withRelativeLocation:v60];
        }
LABEL_84:
        [(TVRTouchProcessor *)self _dispatchGameControllerEventForTouch:v11 event:v7];
        [v7 timestamp];
        objc_msgSend(v12, "setPreviousTimestamp:");

        ++v10;
      }
      while (v101 != v10);
      uint64_t v90 = [v6 countByEnumeratingWithState:&v102 objects:v106 count:16];
      uint64_t v101 = v90;
    }
    while (v90);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v13 = [(NSMapTable *)self->_touches objectForKey:v12];
        if ([v13 pendingCancellation]) {
          uint64_t v14 = 5;
        }
        else {
          uint64_t v14 = 4;
        }
        if ([v13 virtualPhase]
          && [v13 virtualPhase] != 4
          && [v13 virtualPhase] != 5)
        {
          [v13 setVirtualPhase:v14];
          [(TVRTouchProcessor *)self _deliverTouchToDelegate:v12 info:v13];
        }
        [(NSMapTable *)self->_touches removeObjectForKey:v12];
        [(TVRTouchProcessor *)self _dispatchGameControllerEventForTouch:v12 event:v7];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  if (![(NSMapTable *)self->_touches count]) {
    [(TVRTouchProcessor *)self reset];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        double v13 = [(NSMapTable *)self->_touches objectForKey:v12];
        if ([v13 virtualPhase]
          && [v13 virtualPhase] != 4
          && [v13 virtualPhase] != 5)
        {
          [v13 setVirtualPhase:5];
          [(TVRTouchProcessor *)self _deliverTouchToDelegate:v12 info:v13];
        }
        [(NSMapTable *)self->_touches removeObjectForKey:v12];
        [(TVRTouchProcessor *)self _dispatchGameControllerEventForTouch:v12 event:v7];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  if (![(NSMapTable *)self->_touches count]) {
    [(TVRTouchProcessor *)self reset];
  }
}

- (void)markCurrentTouchToBeCancelled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(NSMapTable *)self->_touches keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [(NSMapTable *)self->_touches objectForKey:v8];
        if ([v9 virtualPhase] == 1
          || [v9 virtualPhase] == 3
          || [v9 virtualPhase] == 2)
        {
          [v9 setVirtualPhase:5];
          [(TVRTouchProcessor *)self _deliverTouchToDelegate:v8 info:v9];
        }
        else
        {
          [v9 setPendingCancellation:1];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = v10;
    }
    while (v10);
  }
}

- (void)sendPressBegan:(int64_t)a3
{
  activeButtonTypes = self->_activeButtonTypes;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  LOBYTE(activeButtonTypes) = [(NSMutableSet *)activeButtonTypes containsObject:v6];

  if ((activeButtonTypes & 1) == 0)
  {
    uint64_t v7 = self->_activeButtonTypes;
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v7 addObject:v8];

    if (a3 == 1) {
      [(TVRTouchProcessor *)self _beginTrackingAnyTouchIfNeeded];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v13 = (id)[objc_alloc(MEMORY[0x263F7C988]) _initWithButtonType:a3];
      long long v11 = [MEMORY[0x263F7C990] buttonEventForButton:v13 eventType:1];
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 touchProcessor:self generatedButtonEvent:v11];
    }
  }
}

- (void)sendPressEnded:(int64_t)a3
{
  activeButtonTypes = self->_activeButtonTypes;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  LODWORD(activeButtonTypes) = [(NSMutableSet *)activeButtonTypes containsObject:v6];

  if (activeButtonTypes)
  {
    uint64_t v7 = self->_activeButtonTypes;
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v7 removeObject:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v13 = (id)[objc_alloc(MEMORY[0x263F7C988]) _initWithButtonType:a3];
      long long v11 = [MEMORY[0x263F7C990] buttonEventForButton:v13 eventType:2];
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 touchProcessor:self generatedButtonEvent:v11];
    }
  }
}

- (void)reset
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = self->_activeButtonTypes;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          id v11 = objc_alloc(MEMORY[0x263F7C988]);
          id v12 = objc_msgSend(v11, "_initWithButtonType:", objc_msgSend(v8, "integerValue", (void)v15));
          id v13 = [MEMORY[0x263F7C990] buttonEventForButton:v12 eventType:2];
          id v14 = objc_loadWeakRetained((id *)&self->_delegate);
          [v14 touchProcessor:self generatedButtonEvent:v13];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_activeButtonTypes removeAllObjects];
}

- (void)_touchTimerExpired:(id)a3
{
  id v6 = [a3 userInfo];
  uint64_t v4 = -[NSMapTable objectForKey:](self->_touches, "objectForKey:");
  uint64_t v5 = v4;
  if (v4 && ![v4 virtualPhase]) {
    [(TVRTouchProcessor *)self _beginTrackingTouch:v6 withRelativeLocation:[(TVRTouchProcessor *)self _defaultRelativeStartingLocation]];
  }
}

- (void)_beginTrackingAnyTouchIfNeeded
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(NSMapTable *)self->_touches objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4)
  {

LABEL_11:
    if ([(NSMapTable *)self->_touches count])
    {
      uint64_t v9 = [(NSMapTable *)self->_touches keyEnumerator];
      char v10 = [v9 nextObject];

      [(TVRTouchProcessor *)self _beginTrackingTouch:v10 withRelativeLocation:[(TVRTouchProcessor *)self _defaultRelativeStartingLocation]];
    }
    return;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      v6 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) virtualPhase] != 0;
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v5);

  if ((v6 & 1) == 0) {
    goto LABEL_11;
  }
}

- (int64_t)_defaultRelativeStartingLocation
{
  if ([(TVRTouchProcessor *)self _deviceSupportsMovableBoundingBox]) {
    return 5;
  }
  else {
    return 0;
  }
}

- (int64_t)_relativeTouchLocationForDistanceTraveled:(CGPoint)a3
{
  double v3 = fabs(a3.x);
  double v4 = fabs(a3.y);
  int64_t v5 = 4;
  if (a3.x > 0.0) {
    int64_t v5 = 3;
  }
  int64_t v6 = 2;
  if (a3.y > 0.0) {
    int64_t v6 = 1;
  }
  if (v3 <= v4) {
    return v6;
  }
  else {
    return v5;
  }
}

- (BOOL)_deviceSupportsMovableBoundingBox
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (void)_beginTrackingTouch:(id)a3 withRelativeLocation:(int64_t)a4
{
  touches = self->_touches;
  id v7 = a3;
  id v12 = [(NSMapTable *)touches objectForKey:v7];
  [(TVRTouchProcessor *)self _boundingBoxForTouch:v7 relativeStartLocation:a4];
  objc_msgSend(v12, "setBoundingBox:");
  [v12 setVirtualPhase:1];
  [(TVRTouchProcessor *)self _virtualTouchLocationForTouch:v7];
  double v9 = v8;
  objc_msgSend(v12, "setInitialProportionalLocation:");
  BOOL v11 = v9 >= 0.9 && (unint64_t)(a4 - 5) < 0xFFFFFFFFFFFFFFFELL;
  [v12 setIsLikelyLongListScrollingEdgeGesture:v11];
  [(TVRTouchProcessor *)self _deliverTouchToDelegate:v7 info:v12];
}

- (void)_deliverTouchToDelegate:(id)a3 info:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    [(TVRTouchProcessor *)self _virtualTouchLocationForTouch:v17];
    double v10 = v9;
    double v12 = v11;
    id v13 = objc_alloc(MEMORY[0x263F7C9F8]);
    [v6 timestamp];
    long long v15 = objc_msgSend(v13, "_initWithTimestamp:finger:phase:digitizerLocation:", 1, objc_msgSend(v6, "virtualPhase"), v14, v10, v12);
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 touchProcessor:self generatedTouchEvent:v15];
  }
}

- (CGRect)_boundingBoxForTouch:(id)a3 relativeStartLocation:(int64_t)a4
{
  touchpadView = self->_touchpadView;
  id v7 = a3;
  [(TVRTouchpadView *)touchpadView bounds];
  CGFloat x = v56.origin.x;
  CGFloat y = v56.origin.y;
  CGFloat width = v56.size.width;
  CGFloat height = v56.size.height;
  double MidX = CGRectGetMidX(v56);
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v57);
  [v7 preciseLocationInView:self->_touchpadView];
  double v13 = v12;
  double v15 = v14;

  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.CGFloat width = width;
  v58.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v58);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = height;
  double v52 = v13;
  double v17 = (v13 - MinX) / (CGRectGetMaxX(v59) - MinX);
  if (v17 >= 0.0) {
    double v18 = v17;
  }
  else {
    double v18 = 0.0;
  }
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  double rect = v15;
  double v20 = (v15 - MinY) / (CGRectGetMaxY(v61) - MinY);
  if (v20 >= 0.0) {
    double v21 = v20;
  }
  else {
    double v21 = 0.0;
  }
  if (_TVRCGetTouchCenteringWeight_onceToken != -1) {
    dispatch_once(&_TVRCGetTouchCenteringWeight_onceToken, &__block_literal_global_307);
  }
  CGFloat v53 = x;
  double v22 = fmin(v18, 1.0);
  double v49 = fmin(v21, 1.0);
  if ((__hasCachedTouchCenteringWeight & 1) == 0)
  {
    double v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
    CGFloat v24 = [v23 objectForKey:@"TouchCenteringWeight"];

    if (v24) {
      [v24 doubleValue];
    }
    else {
      double v25 = -1.0;
    }
    __cachedTouchCenteringWeight = *(void *)&v25;
    __hasCachedTouchCenteringWeight = 1;
  }
  double v26 = *(double *)&__cachedTouchCenteringWeight;
  double v27 = hypot(v52 - MidX, v15 - MidY);
  v62.origin.CGFloat x = v53;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  double v28 = CGRectGetWidth(v62);
  v63.origin.CGFloat x = v53;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double v29 = CGRectGetHeight(v63);
  if (v28 < v29) {
    double v29 = v28;
  }
  double v30 = v27 / (v29 * 0.5);
  if (v30 < 0.0) {
    double v30 = 0.0;
  }
  double v31 = v26 + (0.0 - v26) * fmin(v30, 1.0);
  double v32 = v22 + (0.5 - v22) * v31;
  double v33 = v49 + (0.5 - v49) * v31;
  switch(a4)
  {
    case 1:
      double v33 = 0.0;
      break;
    case 2:
      double v33 = 1.0;
      break;
    case 3:
      double v32 = 0.0;
      break;
    case 4:
      double v32 = 1.0;
      break;
    case 5:
      double v32 = 0.5;
      double v33 = 0.5;
      break;
    default:
      break;
  }
  if (_TVRCPointSizeOfSiriRemoteOnMainScreen_onceToken != -1) {
    dispatch_once(&_TVRCPointSizeOfSiriRemoteOnMainScreen_onceToken, &__block_literal_global_315);
  }
  double v34 = v52 - *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_0 * v32;
  double v35 = rect - *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_1 * v33;
  v64.size.CGFloat width = v52 + *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_0 * (1.0 - v32) - v34;
  double v36 = rect + *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_1 * (1.0 - v33) - v35;
  v64.origin.CGFloat x = v34;
  v64.origin.CGFloat y = v35;
  double recta = v64.size.width;
  v64.size.CGFloat height = v36;
  double MaxX = CGRectGetMaxX(v64);
  v65.origin.CGFloat x = v53;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  if (MaxX <= CGRectGetMaxX(v65))
  {
    v68.origin.CGFloat x = v53;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    double v39 = CGRectGetMinX(v68);
    v69.origin.CGFloat x = v34;
    v69.origin.CGFloat y = v35;
    v69.size.CGFloat width = recta;
    v69.size.CGFloat height = v36;
    if (v39 > CGRectGetMinX(v69))
    {
      v70.origin.CGFloat x = v53;
      v70.origin.CGFloat y = y;
      v70.size.CGFloat width = width;
      v70.size.CGFloat height = height;
      double v40 = CGRectGetMinX(v70);
      v71.origin.CGFloat x = v34;
      v71.origin.CGFloat y = v35;
      v71.size.CGFloat width = recta;
      v71.size.CGFloat height = v36;
      double v34 = v34 + v40 - CGRectGetMinX(v71);
    }
  }
  else
  {
    v66.origin.CGFloat x = v34;
    v66.origin.CGFloat y = v35;
    v66.size.CGFloat width = recta;
    v66.size.CGFloat height = v36;
    double v38 = CGRectGetMaxX(v66);
    v67.origin.CGFloat x = v53;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    double v34 = v34 - (v38 - CGRectGetMaxX(v67));
  }
  v72.origin.CGFloat x = v34;
  v72.origin.CGFloat y = v35;
  v72.size.CGFloat width = recta;
  v72.size.CGFloat height = v36;
  double MaxY = CGRectGetMaxY(v72);
  v73.origin.CGFloat x = v53;
  v73.origin.CGFloat y = y;
  v73.size.CGFloat width = width;
  v73.size.CGFloat height = height;
  if (MaxY <= CGRectGetMaxY(v73))
  {
    v76.origin.CGFloat x = v53;
    v76.origin.CGFloat y = y;
    v76.size.CGFloat width = width;
    v76.size.CGFloat height = height;
    double v43 = CGRectGetMinY(v76);
    v77.origin.CGFloat x = v34;
    v77.origin.CGFloat y = v35;
    v77.size.CGFloat width = recta;
    v77.size.CGFloat height = v36;
    if (v43 > CGRectGetMinY(v77))
    {
      v78.origin.CGFloat x = v53;
      v78.origin.CGFloat y = y;
      v78.size.CGFloat width = width;
      v78.size.CGFloat height = height;
      double v44 = CGRectGetMinY(v78);
      v79.origin.CGFloat x = v34;
      v79.origin.CGFloat y = v35;
      v79.size.CGFloat width = recta;
      v79.size.CGFloat height = v36;
      double v35 = v35 + v44 - CGRectGetMinY(v79);
    }
  }
  else
  {
    v74.origin.CGFloat x = v34;
    v74.origin.CGFloat y = v35;
    v74.size.CGFloat width = recta;
    v74.size.CGFloat height = v36;
    double v42 = CGRectGetMaxY(v74);
    v75.origin.CGFloat x = v53;
    v75.origin.CGFloat y = y;
    v75.size.CGFloat width = width;
    v75.size.CGFloat height = height;
    double v35 = v35 - (v42 - CGRectGetMaxY(v75));
  }
  double v45 = v34;
  double v46 = v35;
  double v47 = recta;
  double v48 = v36;
  result.size.CGFloat height = v48;
  result.size.CGFloat width = v47;
  result.origin.CGFloat y = v46;
  result.origin.CGFloat x = v45;
  return result;
}

- (CGPoint)_virtualTouchLocationForTouch:(id)a3
{
  touches = self->_touches;
  id v5 = a3;
  id v6 = [(NSMapTable *)touches objectForKey:v5];
  id v7 = [(TVRTouchProcessor *)self touchpadView];
  [v5 preciseLocationInView:v7];
  double v9 = v8;
  double v23 = v10;

  [v6 boundingBox];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v16 = (v9 - MinX) / (CGRectGetMaxX(v26) - MinX);
  if (v16 < 0.0) {
    double v16 = 0.0;
  }
  double v17 = 1.0;
  if (v16 >= 1.0) {
    double v18 = 1.0;
  }
  else {
    double v18 = v16 + 0.0;
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v20 = (v23 - MinY) / (CGRectGetMaxY(v28) - MinY);
  if (v20 < 0.0) {
    double v20 = 0.0;
  }
  if (v20 < 1.0) {
    double v17 = v20 + 0.0;
  }

  double v21 = v18;
  double v22 = v17;
  result.CGFloat y = v22;
  result.CGFloat x = v21;
  return result;
}

- (void)_dispatchGameControllerEventForTouch:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v8 = objc_loadWeakRetained(&to);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    [v6 preciseLocationInView:self->_touchpadView];
    double v11 = v10;
    double v13 = v12;
    [(TVRTouchpadView *)self->_touchpadView bounds];
    float MidX = CGRectGetMidX(v24);
    double v15 = _TVRCGameControllerNormalizedDigitizerValue(MidX, v11);
    [(TVRTouchpadView *)self->_touchpadView bounds];
    *(float *)&double v15 = v15;
    float MidY = CGRectGetMidY(v25);
    double v17 = _TVRCGameControllerNormalizedDigitizerValue(MidY, v13);
    if (__fpclassifyf(*(float *)&v15) != 3 || (float v18 = v17, __fpclassifyf(-v18) != 3))
    {
      BOOL v19 = [v6 phase] != 3 && objc_msgSend(v6, "phase") != 4;
      id v20 = objc_alloc(MEMORY[0x263F7C9B8]);
      [v7 timestamp];
      double v21 = objc_msgSend(v20, "_initWithTimestamp:isDown:joystickLocation:", v19);
      id v22 = objc_loadWeakRetained(&to);
      [v22 touchProcessor:self generatedGameControllerEvent:v21];
    }
  }
  objc_destroyWeak(&to);
}

- (TVRTouchProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRTouchProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRTouchpadView)touchpadView
{
  return self->_touchpadView;
}

- (void)setTouchpadView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchpadView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_activeButtonTypes, 0);
}

@end