@interface UIHoverEvent
- (BOOL)_isPointerLocked;
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (BOOL)hasOutstandingUpdates;
- (id)_allWindows;
- (id)_deliveryTableByTouchCreateIfNeeded:(id)a3;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_init;
- (id)_touchesByContextId:(unsigned int)a3 createIfNeeded:(BOOL)a4;
- (id)allTouches;
- (id)hoverTouchForContextId:(unsigned int)a3 pathIndex:(int64_t)a4;
- (id)touchesForGestureRecognizer:(id)a3;
- (id)touchesForView:(id)a3;
- (id)touchesForWindow:(id)a3;
- (int64_t)subtype;
- (int64_t)type;
- (unint64_t)_inputPrecision;
- (void)_addHasOutstandingUpdateTouch:(id)a3;
- (void)_cancelAllGestureRecognizers;
- (void)_cancelAllGestureRecognizersAndRemoveAllHoverTouches;
- (void)_completelyRemoveHoverTouchesForWindow:(id)a3 contextIdNumber:(id)a4 withCancellation:(BOOL)a5;
- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3;
- (void)_pointerStateDidChange:(id)a3;
- (void)_removeAllHoverTouchesForContextId:(unsigned int)a3;
- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4;
- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3;
- (void)_resetHasOutstandingUpdateTouches;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
- (void)_setNeedsUpdateForWindow:(id)a3 forcingHitTest:(BOOL)a4;
- (void)_setPointerLocked:(BOOL)a3;
- (void)_windowDidBecomeHidden:(id)a3;
- (void)_windowDidDetachContext:(id)a3;
- (void)dealloc;
- (void)removeHoverTouchForContextId:(unsigned int)a3 pathIndex:(int64_t)a4;
- (void)removeTouch:(id)a3 fromGestureRecognizer:(id)a4;
- (void)setHoverTouch:(id)a3 forContextId:(unsigned int)a4 pathIndex:(int64_t)a5;
- (void)setNeedsHitTestResetForWindow:(id)a3;
- (void)setNeedsUpdateForWindow:(id)a3;
@end

@implementation UIHoverEvent

- (void)setNeedsHitTestResetForWindow:(id)a3
{
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)UIHoverEvent;
  v2 = [(UIEvent *)&v13 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v4 = (void *)v2[15];
    v2[15] = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v6 = (void *)v2[16];
    v2[16] = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    v8 = (void *)v2[17];
    v2[17] = v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__windowDidDetachContext_ name:_UIWindowDidDetachContextNotification object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__windowDidBecomeHidden_ name:@"UIWindowDidBecomeHiddenNotification" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel__pointerStateDidChange_ name:0x1ED14D680 object:0];
  }
  return v2;
}

- (void)_setNeedsUpdateForWindow:(id)a3 forcingHitTest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = [(UIHoverEvent *)self touchesForWindow:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(UIHoverEvent *)self _deliveryTableByTouchCreateIfNeeded:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        [v11 updateForEvent:self forcingHitTest:v4];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)touchesForWindow:(id)a3
{
  touchesByContextId = self->_touchesByContextId;
  BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "_contextId"));
  uint64_t v5 = [(NSMapTable *)touchesByContextId objectForKey:v4];

  return v5;
}

- (void)dealloc
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = _UIWindowDidDetachContextNotification;
  v6[1] = @"UIWindowDidBecomeHiddenNotification";
  v6[2] = 0x1ED14D680;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIHoverEvent;
  [(UIEvent *)&v5 dealloc];
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIHoverEvent;
  -[UIEvent _setHIDEvent:](&v14, sel__setHIDEvent_);
  if (a3)
  {
    double v5 = 0.0;
    if (_os_feature_enabled_impl())
    {
      _UIEventHIDPencilMaximumPositionZForEvent((uint64_t)a3);
      double v7 = v6;
      if (_UIEventHIDGetChildStylusEvent((uint64_t)a3))
      {
        IOHIDEventGetFloatValue();
        double v5 = v8;
        IOHIDEventGetFloatValue();
        double v10 = v9;
        IOHIDEventGetFloatValue();
        double v12 = v11;
        IOHIDEventGetFloatValue();
LABEL_7:
        self->_maximumPositionZ = v7;
        self->_positionZ = v12;
        self->_hoverAzimuthAngle = v10;
        self->_hoverAltitudeAngle = v5;
        self->_hoverRollAngle = v13;
        return;
      }
    }
    else
    {
      double v7 = 0.0;
    }
    double v10 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    goto LABEL_7;
  }
}

- (int64_t)type
{
  return 11;
}

- (int64_t)subtype
{
  return 0;
}

- (id)allTouches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = NSAllMapTableValues(self->_touchesByContextId);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "unionSet:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)touchesForView:(id)a3
{
  return 0;
}

- (id)touchesForGestureRecognizer:(id)a3
{
  return (id)[a3 _allActiveTouches];
}

- (id)_allWindows
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = self->_touchesByContextId;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 136315394;
    long long v16 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        long long v11 = +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", objc_msgSend(v10, "unsignedIntValue", v16, (void)v17));
        if (v11)
        {
          [v3 addObject:v11];
        }
        else if (os_variant_has_internal_diagnostics())
        {
          long long v13 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = "-[UIHoverEvent _allWindows]";
            __int16 v23 = 2112;
            v24 = v10;
            _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "%s: No window for tracked contextId: %@", buf, 0x16u);
          }
        }
        else
        {
          long long v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_allWindows___s_category) + 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = "-[UIHoverEvent _allWindows]";
            __int16 v23 = 2112;
            v24 = v10;
            _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%s: No window for tracked contextId: %@", buf, 0x16u);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v14 = [(NSMapTable *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v7 = v14;
    }
    while (v14);
  }

  return v3;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  touchesByContextId = self->_touchesByContextId;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "_contextId"));
  uint64_t v8 = [(NSMapTable *)touchesByContextId objectForKey:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[UIHoverEvent _deliveryTableByTouchCreateIfNeeded:](self, "_deliveryTableByTouchCreateIfNeeded:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        uint64_t v15 = [v14 gestureRecognizers];
        [v5 unionSet:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = NSAllMapTableValues(self->_deliveryTableByTouch);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6)
  {
    uint64_t v10 = 0;
    id v9 = 0;
    goto LABEL_31;
  }
  uint64_t v7 = v6;
  long long v20 = self;
  uint64_t v8 = 0;
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v5);
      }
      long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v14 = [v13 updateGestureRecognizerForDelivery:v4];
      switch(v14)
      {
        case 7:
          if (!v8) {
            uint64_t v8 = objc_opt_new();
          }
          uint64_t v15 = [v13 touch];
          long long v16 = (void *)v8;
          break;
        case 6:
          if (!v9) {
            id v9 = objc_opt_new();
          }
          uint64_t v15 = [v13 touch];
          long long v16 = v9;
          break;
        case 5:
          if (!v10) {
            uint64_t v10 = objc_opt_new();
          }
          uint64_t v15 = [v13 touch];
          long long v16 = v10;
          break;
        default:
          continue;
      }
      [v16 addObject:v15];
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v7);

  if (v10) {
    [v4 _componentsBegan:v10 withEvent:v20];
  }
  if (v9)
  {
    long long v17 = v20->_touchesWithOutstandingUpdates;
    long long v18 = [v4 _allActiveTouches];
    if (([(NSMutableSet *)v17 intersectsSet:v18] & 1) != 0
      || ![v18 count] && -[NSMutableSet count](v17, "count"))
    {
      [v4 _componentsChanged:v9 withEvent:v20];
    }
  }
  if (v8)
  {
    [v4 _componentsEnded:v8 withEvent:v20];
    uint64_t v5 = (void *)v8;
LABEL_31:
  }
  return 1;
}

- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIHoverEvent *)self touchesForGestureRecognizer:v4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        [(UIHoverEvent *)self removeTouch:*(void *)(*((void *)&v10 + 1) + 8 * v9++) fromGestureRecognizer:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
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
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 _eventComponentType])
        {
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIHoverEvent.m", 499, @"Wrong component type for event: %@; component: %@",
            self,
            v13);
        }
        [(UIHoverEvent *)self removeTouch:v13 fromGestureRecognizer:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = [(UIHoverEvent *)self _componentsForGestureRecognizer:v9];
        [v9 _componentsCancelled:v10 withEvent:self];
        [(UIHoverEvent *)self _removeGestureRecognizer:v9 fromComponents:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (unint64_t)_inputPrecision
{
  return 2;
}

- (void)setNeedsUpdateForWindow:(id)a3
{
}

- (void)removeTouch:(id)a3 fromGestureRecognizer:(id)a4
{
  deliveryTableByTouch = self->_deliveryTableByTouch;
  id v6 = a4;
  id v7 = [(NSMapTable *)deliveryTableByTouch objectForKey:a3];
  [v7 removeGestureRecognizer:v6];
}

- (id)hoverTouchForContextId:(unsigned int)a3 pathIndex:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  touchesByContextId = self->_touchesByContextId;
  id v6 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v7 = [(NSMapTable *)touchesByContextId objectForKey:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "_pathIndex", (void)v16) == a4)
        {
          id v14 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void)setHoverTouch:(id)a3 forContextId:(unsigned int)a4 pathIndex:(int64_t)a5
{
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    id v7 = a3;
    id v8 = [(UIHoverEvent *)self _touchesByContextId:v5 createIfNeeded:1];
    [v8 addObject:v7];
  }
}

- (void)removeHoverTouchForContextId:(unsigned int)a3 pathIndex:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  touchesByContextId = self->_touchesByContextId;
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  id v13 = [(NSMapTable *)touchesByContextId objectForKey:v8];

  if (v13)
  {
    uint64_t v9 = [(UIHoverEvent *)self hoverTouchForContextId:v5 pathIndex:a4];
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 setWindow:0];
      [v13 removeObject:v10];
      if (![v13 count])
      {
        uint64_t v11 = self->_touchesByContextId;
        long long v12 = [NSNumber numberWithUnsignedInt:v5];
        [(NSMapTable *)v11 removeObjectForKey:v12];
      }
      [(NSMapTable *)self->_deliveryTableByTouch removeObjectForKey:v10];
    }
  }
}

- (void)_windowDidDetachContext:(id)a3
{
  id v9 = a3;
  id v4 = [v9 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v9 object];
    id v7 = [v9 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"contextId"];

    [(UIHoverEvent *)self _completelyRemoveHoverTouchesForWindow:v6 contextIdNumber:v8 withCancellation:1];
  }
}

- (void)_windowDidBecomeHidden:(id)a3
{
  id v8 = a3;
  id v4 = [v8 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v8 object];
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "_contextId"));
    [(UIHoverEvent *)self _completelyRemoveHoverTouchesForWindow:v6 contextIdNumber:v7 withCancellation:1];
  }
}

- (void)_removeAllHoverTouchesForContextId:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(UIHoverEvent *)self _completelyRemoveHoverTouchesForWindow:0 contextIdNumber:v4 withCancellation:0];
}

- (void)_completelyRemoveHoverTouchesForWindow:(id)a3 contextIdNumber:(id)a4 withCancellation:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v20 = v9;
    uint64_t v11 = [(NSMapTable *)self->_touchesByContextId objectForKey:v9];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v12) {
      goto LABEL_17;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v5)
        {
          long long v17 = [(NSMapTable *)self->_deliveryTableByTouch objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          [v17 _cancelAllGestureRecognizers];
        }
        if (v16 && (unint64_t)(*(void *)(v16 + 16) - 5) <= 2)
        {
          id v18 = v8;
          if (v8)
          {
            long long v19 = v18;
          }
          else
          {
            long long v19 = +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", [v20 unsignedIntValue]);
            if (!v19) {
              goto LABEL_15;
            }
          }
          -[UITouch _clearForWindowIfNeeded:](v16, v19);
        }
LABEL_15:
        [(NSMapTable *)self->_deliveryTableByTouch removeObjectForKey:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v13)
      {
LABEL_17:
        uint64_t v10 = v20;
        [(NSMapTable *)self->_touchesByContextId removeObjectForKey:v20];

        break;
      }
    }
  }
}

- (void)_cancelAllGestureRecognizersAndRemoveAllHoverTouches
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = NSAllMapTableKeys(self->_touchesByContextId);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[UIHoverEvent _completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:](self, "_completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:", 0, *(void *)(*((void *)&v8 + 1) + 8 * v7++), 1, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_cancelAllGestureRecognizers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = NSAllMapTableValues(self->_deliveryTableByTouch);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_cancelAllGestureRecognizers", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_touchesByContextId:(unsigned int)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  touchesByContextId = self->_touchesByContextId;
  long long v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  long long v9 = [(NSMapTable *)touchesByContextId objectForKey:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    long long v9 = objc_opt_new();
    long long v11 = self->_touchesByContextId;
    uint64_t v12 = [NSNumber numberWithUnsignedInt:v5];
    [(NSMapTable *)v11 setObject:v9 forKey:v12];
  }
  return v9;
}

- (id)_deliveryTableByTouchCreateIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_deliveryTableByTouch objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [[_UIHoverTouchDeliveryTable alloc] initWithTouch:v4];
    [(NSMapTable *)self->_deliveryTableByTouch setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_pointerStateDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v7 = [v4 object];
    if (![v7 pointerState])
    {
      if ([(id)UIApp _isSpringBoard])
      {
        if (_UIInternalPreferencesRevisionOnce != -1) {
          dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
        }
        int v8 = _UIInternalPreferencesRevisionVar;
        if (_UIInternalPreferencesRevisionVar < 1) {
          goto LABEL_7;
        }
        int v14 = _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823;
        if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823) {
          goto LABEL_7;
        }
        while (v8 >= v14)
        {
          _UIInternalPreferenceSync(v8, &_UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823, @"DisableSystemGestureWindowWorkaround_89259823", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v14 = _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823;
          if (v8 == _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823) {
            goto LABEL_7;
          }
        }
        if (!byte_1E8FD53F4)
        {
LABEL_7:
          long long v17 = 0u;
          long long v18 = 0u;
          long long v16 = 0u;
          long long v9 = [(UIHoverEvent *)self _allWindows];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v16;
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v16 != v12) {
                  objc_enumerationMutation(v9);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {

                  [(UIHoverEvent *)self _cancelAllGestureRecognizers];
                  goto LABEL_18;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
      }
      [(UIHoverEvent *)self _cancelAllGestureRecognizersAndRemoveAllHoverTouches];
    }
LABEL_18:
  }
}

- (void)_setPointerLocked:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_pointerLocked != a3)
  {
    BOOL v3 = a3;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PointerLockState", &_setPointerLocked____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v7 = @"NO";
        if (v3) {
          long long v7 = @"YES";
        }
        int v8 = 138412546;
        long long v9 = self;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Updating UIHoverEvent pointerLocked: hoverEvent: %@; pointerLocked: %@",
          (uint8_t *)&v8,
          0x16u);
      }
    }
    self->_pointerLocked = v3;
    [(UIHoverEvent *)self _cancelAllGestureRecognizers];
  }
}

- (void)_addHasOutstandingUpdateTouch:(id)a3
{
}

- (BOOL)hasOutstandingUpdates
{
  return [(NSMutableSet *)self->_touchesWithOutstandingUpdates count] != 0;
}

- (void)_resetHasOutstandingUpdateTouches
{
}

- (BOOL)_isPointerLocked
{
  return self->_pointerLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchesWithOutstandingUpdates, 0);
  objc_storeStrong((id *)&self->_deliveryTableByTouch, 0);
  objc_storeStrong((id *)&self->_touchesByContextId, 0);
}

@end