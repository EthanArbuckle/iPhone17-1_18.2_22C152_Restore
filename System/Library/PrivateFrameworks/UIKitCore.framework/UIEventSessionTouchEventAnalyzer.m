@interface UIEventSessionTouchEventAnalyzer
+ (double)squaredDistanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4;
- (UIEventSessionTouchEventAnalyzer)init;
- (id)checkifGestureComplete:(id)a3;
- (id)completeGesture:(id)a3;
- (id)didPointerClickWithTrackpadFingerDownCount:(int64_t)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5;
- (id)didPointerHoverWithTrackpadFingerDownCount:(int64_t)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5;
- (id)didTouchWithID:(id)a3 withPhase:(int64_t)a4 withType:(int64_t)a5 withLocationInWindow:(CGPoint)a6 withWindowBounds:(CGRect)a7 withTrackpadFingerDownCount:(int64_t)a8;
- (int64_t)determineWindowSectionWithLocationInWindow:(CGPoint)a3 withWindowBounds:(CGRect)a4;
@end

@implementation UIEventSessionTouchEventAnalyzer

- (UIEventSessionTouchEventAnalyzer)init
{
  v9.receiver = self;
  v9.super_class = (Class)UIEventSessionTouchEventAnalyzer;
  v2 = [(UIEventSessionTouchEventAnalyzer *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)_MergedGlobals_1126;
    _MergedGlobals_1126 = (uint64_t)v3;

    v5 = (void *)qword_1EB261998;
    qword_1EB261998 = 0;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = (void *)qword_1EB2619A0;
    qword_1EB2619A0 = (uint64_t)v6;
  }
  return v2;
}

- (id)completeGesture:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(_UIEventSessionTouchAction);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = objc_msgSend(v3, "touchStatus", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v3 touchStatus];
        v12 = [v11 objectForKeyedSubscript:v10];
        uint64_t v13 = [v12 windowSection];

        v14 = [v3 touchStatus];
        v15 = [v14 objectForKeyedSubscript:v10];

        uint64_t v16 = [v15 tapDragState];
        if (v16 == 2)
        {
          uint64_t v17 = 2;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v17 = 1;
LABEL_13:

  [(_UIEventSessionTouchAction *)v4 setTapDragState:v17];
  if ([v3 touchType] && objc_msgSend(v3, "trackpadFingerDownCount") >= 1)
  {
    -[_UIEventSessionTouchAction setNumFingers:](v4, "setNumFingers:", [v3 trackpadFingerDownCount]);
  }
  else
  {
    v18 = [v3 touchStatus];
    -[_UIEventSessionTouchAction setNumFingers:](v4, "setNumFingers:", [v18 count]);
  }
  [(_UIEventSessionTouchAction *)v4 setWindowSection:v13];
  -[_UIEventSessionAction setSource:](v4, "setSource:", +[_UIEventSessionAction getUIEventSourceForUITouchType:](_UIEventSessionAction, "getUIEventSourceForUITouchType:", [v3 touchType]));

  return v4;
}

- (id)checkifGestureComplete:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(v4, "touchStatus", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v4 touchStatus];
        v12 = [v11 objectForKeyedSubscript:v10];
        uint64_t v13 = [v12 upDownState];

        if (v13 != 2)
        {

          v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v14 = [(UIEventSessionTouchEventAnalyzer *)self completeGesture:v4];
LABEL_11:

  return v14;
}

+ (double)squaredDistanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return (a3.x - a4.x) * (a3.x - a4.x) + (a3.y - a4.y) * (a3.y - a4.y);
}

- (int64_t)determineWindowSectionWithLocationInWindow:(CGPoint)a3 withWindowBounds:(CGRect)a4
{
  double height = a4.size.height;
  double y = a3.y;
  uint64_t v6 = +[UIScreen mainScreen];
  [v6 bounds];
  double v8 = v7;

  if (height != v8) {
    return 0;
  }
  double v9 = height / 3.0;
  int64_t v10 = 3;
  if (y < v9 + v9) {
    int64_t v10 = 2;
  }
  if (y < v9) {
    return 1;
  }
  else {
    return v10;
  }
}

- (id)didTouchWithID:(id)a3 withPhase:(int64_t)a4 withType:(int64_t)a5 withLocationInWindow:(CGPoint)a6 withWindowBounds:(CGRect)a7 withTrackpadFingerDownCount:(int64_t)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v13 = a6.y;
  double v14 = a6.x;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a4 != 1)
  {
    if (!a4)
    {
      long long v20 = [(id)_MergedGlobals_1126 objectForKeyedSubscript:v18];

      if (!v20)
      {
        if (qword_1EB261998
          && [(id)qword_1EB261998 touchType] != a5
          && [(id)qword_1EB261998 trackpadFingerDownCount] != a8)
        {
          uint64_t v21 = [(UIEventSessionTouchEventAnalyzer *)self checkifGestureComplete:qword_1EB261998];
          if (v21)
          {
            v67 = v21;
            [v19 addObject:v21];
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v22 = [(id)qword_1EB261998 touchStatus];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v78 objects:v84 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v79;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v79 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  [(id)_MergedGlobals_1126 removeObjectForKey:*(void *)(*((void *)&v78 + 1) + 8 * i)];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v78 objects:v84 count:16];
              }
              while (v24);
            }

            uint64_t v21 = v67;
          }
          else
          {
            [(id)qword_1EB2619A0 addObject:qword_1EB261998];
          }
        }
        v59 = objc_alloc_init(UIEventSessionTouchEventDetail);
        [(UIEventSessionTouchEventDetail *)v59 setUpDownState:1];
        -[UIEventSessionTouchEventDetail setLastLocation:](v59, "setLastLocation:", v14, v13);
        v60 = (void *)qword_1EB261998;
        if (!qword_1EB261998)
        {
          v61 = [[UIEventSessionTouchEvent alloc] initWithTouchType:a5 withTrackpadFingerDownCount:a8];
          v62 = (void *)qword_1EB261998;
          qword_1EB261998 = (uint64_t)v61;

          v60 = (void *)qword_1EB261998;
        }
        v63 = [v60 touchStatus];
        [v63 setObject:v59 forKeyedSubscript:v18];

        [(id)_MergedGlobals_1126 setObject:qword_1EB261998 forKeyedSubscript:v18];
      }
      goto LABEL_60;
    }
    if ((unint64_t)(a4 - 3) > 1) {
      goto LABEL_60;
    }
    v35 = [(id)_MergedGlobals_1126 objectForKeyedSubscript:v18];
    if (!v35) {
      goto LABEL_60;
    }
    v36 = v35;
    v37 = [v35 touchStatus];
    v38 = [v37 objectForKeyedSubscript:v18];

    [v38 setUpDownState:2];
    objc_msgSend(v38, "setWindowSection:", -[UIEventSessionTouchEventAnalyzer determineWindowSectionWithLocationInWindow:withWindowBounds:](self, "determineWindowSectionWithLocationInWindow:withWindowBounds:", v14, v13, x, y, width, height));
    [v38 dragDistanceSquared];
    if (v39 <= 10.0)
    {
      [v38 lastLocation];
      +[UIEventSessionTouchEventAnalyzer squaredDistanceBetweenPoint:andPoint:](UIEventSessionTouchEventAnalyzer, "squaredDistanceBetweenPoint:andPoint:");
      double v41 = v40;
      [v38 dragDistanceSquared];
      [v38 setDragDistanceSquared:v41 + v42];
    }
    [v38 dragDistanceSquared];
    if (v43 <= 10.0) {
      uint64_t v44 = 1;
    }
    else {
      uint64_t v44 = 2;
    }
    [v38 setTapDragState:v44];
    if ([(id)qword_1EB261998 containsTouchID:v18])
    {
      v45 = [(UIEventSessionTouchEventAnalyzer *)self checkifGestureComplete:qword_1EB261998];
      if (v45)
      {
        v68 = v38;
        [v19 addObject:v45];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v46 = [(id)qword_1EB261998 touchStatus];
        uint64_t v47 = [v46 countByEnumeratingWithState:&v74 objects:v83 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v75;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v75 != v49) {
                objc_enumerationMutation(v46);
              }
              [(id)_MergedGlobals_1126 removeObjectForKey:*(void *)(*((void *)&v74 + 1) + 8 * j)];
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v74 objects:v83 count:16];
          }
          while (v48);
        }

        v38 = v68;
      }
      else
      {
        [(id)qword_1EB2619A0 addObject:qword_1EB261998];
      }
      v53 = (void *)qword_1EB261998;
      qword_1EB261998 = 0;
    }
    else
    {
      if (![(id)qword_1EB2619A0 count])
      {
LABEL_46:

        goto LABEL_60;
      }
      uint64_t v51 = 0;
      while (1)
      {
        v45 = [(id)qword_1EB2619A0 objectAtIndexedSubscript:v51];
        if ([v45 containsTouchID:v18])
        {
          uint64_t v52 = [(UIEventSessionTouchEventAnalyzer *)self checkifGestureComplete:v45];
          if (v52) {
            break;
          }
        }

        if (++v51 >= (unint64_t)[(id)qword_1EB2619A0 count]) {
          goto LABEL_46;
        }
      }
      v53 = (void *)v52;
      id v66 = v19;
      v69 = v38;
      v65 = v36;
      [v19 addObject:v52];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v54 = [v45 touchStatus];
      uint64_t v55 = [v54 countByEnumeratingWithState:&v70 objects:v82 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v71;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v71 != v57) {
              objc_enumerationMutation(v54);
            }
            [(id)_MergedGlobals_1126 removeObjectForKey:*(void *)(*((void *)&v70 + 1) + 8 * k)];
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v70 objects:v82 count:16];
        }
        while (v56);
      }

      [(id)qword_1EB2619A0 removeObjectAtIndex:v51];
      v36 = v65;
      id v19 = v66;
      v38 = v69;
    }

    goto LABEL_46;
  }
  v27 = [(id)_MergedGlobals_1126 objectForKeyedSubscript:v18];
  if (v27)
  {
    v28 = v27;
    v29 = [v27 touchStatus];
    v30 = [v29 objectForKeyedSubscript:v18];

    [v30 dragDistanceSquared];
    if (v31 <= 10.0)
    {
      [v30 lastLocation];
      +[UIEventSessionTouchEventAnalyzer squaredDistanceBetweenPoint:andPoint:](UIEventSessionTouchEventAnalyzer, "squaredDistanceBetweenPoint:andPoint:");
      double v33 = v32;
      [v30 dragDistanceSquared];
      [v30 setDragDistanceSquared:v33 + v34];
      objc_msgSend(v30, "setLastLocation:", v14, v13);
    }
  }
LABEL_60:

  return v19;
}

- (id)didPointerHoverWithTrackpadFingerDownCount:(int64_t)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  if (qword_1EB2619A8 == 2)
  {
    if (!a3)
    {
      qword_1EB2619A8 = 0;
      qword_1EB2619B0 = 0;
    }
  }
  else if (qword_1EB2619A8 == 1)
  {
    if (a3)
    {
      int64_t v8 = qword_1EB2619B0;
      if (qword_1EB2619B0 <= a3) {
        int64_t v8 = a3;
      }
      qword_1EB2619B0 = v8;
    }
    else
    {
      double v9 = objc_alloc_init(_UIEventSessionHoverAction);
      [(_UIEventSessionAction *)v9 setSource:4];
      [(_UIEventSessionHoverAction *)v9 setNumFingers:qword_1EB2619B0];
      [v6 addObject:v9];
      qword_1EB2619A8 = 0;
      qword_1EB2619B0 = 0;
    }
  }
  else
  {
    if (qword_1EB2619A8) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = a3 < 1;
    }
    if (!v7)
    {
      qword_1EB2619A8 = 1;
      qword_1EB2619B0 = a3;
    }
  }
  return v6;
}

- (id)didPointerClickWithTrackpadFingerDownCount:(int64_t)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  double v14 = objc_alloc_init(_UIEventSessionTouchAction);
  [(_UIEventSessionAction *)v14 setSource:4];
  [(_UIEventSessionTouchAction *)v14 setNumFingers:a3];
  -[_UIEventSessionTouchAction setWindowSection:](v14, "setWindowSection:", -[UIEventSessionTouchEventAnalyzer determineWindowSectionWithLocationInWindow:withWindowBounds:](self, "determineWindowSectionWithLocationInWindow:withWindowBounds:", v10, v9, x, y, width, height));
  [v13 addObject:v14];
  if (qword_1EB2619A8 == 1) {
    qword_1EB2619A8 = 2;
  }

  return v13;
}

@end