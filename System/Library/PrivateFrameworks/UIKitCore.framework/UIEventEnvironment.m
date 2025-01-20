@interface UIEventEnvironment
- (NSMutableArray)eventQueue;
- (UIApplication)application;
- (UIDragEvent)_dragEventForHIDEvent:(uint64_t)a1;
- (UIEventEnvironment)initWithApplication:(id)a3;
- (const)_touchMapForWindow:(uint64_t)a1;
- (id)UIKitEventForHIDEvent:(id *)a1;
- (id)_currentTouchForWindow:(uint64_t)a1;
- (id)_dragEvents;
- (id)_dynamicButtonEventForWindow:(id)a1;
- (id)_estimatedTouchRecordForContextID:(uint64_t)a3 estimationIndex:;
- (id)_findTouchesEventWindowSceneForKeyboardWindowIfNeeded:(uint64_t)a1;
- (id)_gameControllerEventForWindow:(id)a1;
- (id)_hoverEventForWindow:(id)a1;
- (id)_moveEventForWindow:(id)a1;
- (id)_pencilEventForWindow:(id)a1;
- (id)_physicalKeyboardEventForHIDEvent:(id *)a1;
- (id)_physicalKeyboardEventForWindow:(id)a1;
- (id)_pressForType:(void *)a3 window:;
- (id)_pressesEventForHIDEvent:(uint64_t)a1;
- (id)_pressesEventForWindow:(id)a1;
- (id)_scrollEventForWindow:(id)a1;
- (id)_touchesEventForWindow:(uint64_t)a1;
- (id)_transformEventForWindow:(id)a1;
- (id)_wheelEventForWindow:(id)a1;
- (uint64_t)_currentNudgePressTypeForWindow:(uint64_t)a1;
- (uint64_t)_resetTouchMapForWindow:(uint64_t)result;
- (void)_clearTouchesOfView:(uint64_t)a3 onWindow:;
- (void)_dispatchAndRemoveStaleEstimationUpdateRecordsWithEventTime:(double)a3 upToRecord:;
- (void)_enqueueClearEventsOfRetainedWindow:(void *)a1;
- (void)_enqueueHIDEvent:(__IOHIDEvent *)a3;
- (void)_registerEstimatedTouches:(void *)a3 event:(uint64_t)a4 forTouchable:;
- (void)_removeDragEvent:(uint64_t)a1;
- (void)_removeEstimatedTouchRecord:(uint64_t)a1;
- (void)_sendMotionBegan:(uint64_t)a1;
- (void)_sendMotionCancelled:(uint64_t)a1;
- (void)_sendMotionEnded:(uint64_t)a1;
- (void)_sendRemoteControlEvent:(uint64_t)a1;
- (void)_setCurrentNudgePressType:(void *)a3 forWindow:;
- (void)_setCurrentTouch:(void *)a3 forWindow:;
- (void)_setPress:(uint64_t)a3 forType:(void *)a4 window:;
- (void)_setTouchMap:(const void *)a3 forWindow:;
- (void)dealloc;
- (void)pointerLockStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)setApplication:(id)a3;
- (void)setEventQueue:(id)a3;
@end

@implementation UIEventEnvironment

- (void)_clearTouchesOfView:(uint64_t)a3 onWindow:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v6 = [_UIEventEnvironmentClearTouchesContext alloc];
    if (v6)
    {
      v19.receiver = v6;
      v19.super_class = (Class)_UIEventEnvironmentClearTouchesContext;
      id v7 = objc_msgSendSuper2(&v19, sel_init);
      v8 = v7;
      if (v7)
      {
        *((void *)v7 + 1) = a2;
        *((void *)v7 + 2) = a3;
      }
    }
    else
    {
      v8 = 0;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = *(id *)(a1 + 88);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          CFDictionaryRef v14 = (const __CFDictionary *)-[UIEventEnvironment _touchMapForWindow:](a1, *(void **)(*((void *)&v15 + 1) + 8 * v13));
          if (v14) {
            CFDictionaryApplyFunction(v14, (CFDictionaryApplierFunction)_ClearReferencesToView, v8);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (id)_pressesEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 3, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_currentTouchForWindow:(uint64_t)a1
{
  id v2 = 0;
  if (a1 && a2)
  {
    v5 = [a2 _eventRoutingScene];
    v6 = v5;
    if (v5)
    {
      if (([v5 _hasInvalidated] & 1) == 0)
      {

LABEL_10:
        v8 = *(void **)(a1 + 168);
        v6 = [a2 windowScene];
        id v2 = [v8 objectForKey:v6];
        goto LABEL_11;
      }
      if ([v6 _hasInvalidated])
      {
        char v7 = [*(id *)(a1 + 136) containsObject:v6];

        if (v7)
        {
          id v2 = 0;
          goto LABEL_12;
        }
        goto LABEL_10;
      }
    }
    id v2 = 0;
LABEL_11:
  }
LABEL_12:
  return v2;
}

- (id)UIKitEventForHIDEvent:(id *)a1
{
  if (!a1) {
    goto LABEL_59;
  }
  int Type = IOHIDEventGetType();
  if (Type > 29)
  {
    if (Type > 38)
    {
      if (Type == 39)
      {
        if (!_UIEventHIDIsPencilBarrelEvent()) {
          goto LABEL_59;
        }
        v5 = _UIEventHIDUIWindowForHIDEvent();
        v6 = [v5 _eventRoutingScene];
        uint64_t v7 = (uint64_t)a1;
        uint64_t v8 = 13;
      }
      else
      {
        if (Type != 42)
        {
LABEL_28:
          int v15 = IOHIDEventGetType();
          switch(v15)
          {
            case 3:
              if (_UIEventHIDPressTypeForKeyboardHIDEvent() != -1) {
                goto LABEL_55;
              }
              break;
            case 29:
              uint64_t IntegerValue = IOHIDEventGetIntegerValue();
              if (IntegerValue && IntegerValue != 3)
              {
LABEL_55:
                if ([(id)UIApp isFrontBoard])
                {
                  v26 = BKSHIDEventGetBaseAttributes();
                  int v27 = [v26 contextID];

                  if (!v27)
                  {
                    id v14 = a1[13];
                    goto LABEL_63;
                  }
                }
LABEL_62:
                -[UIEventEnvironment _pressesEventForHIDEvent:]((uint64_t)a1);
                id v14 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_63;
              }
              break;
            case 17:
              long long v16 = _UIEventHIDUIScreenForHIDEvent(a2);
              uint64_t v17 = [v16 _userInterfaceIdiom];

              if (v17 == 3) {
                goto LABEL_55;
              }
              break;
          }
          if (IOHIDEventGetType() == 3)
          {
            uint64_t v24 = IOHIDEventGetIntegerValue();
            switch(v24)
            {
              case 7:
                goto LABEL_54;
              case 255:
                goto LABEL_54;
              case 12:
                uint64_t v25 = IOHIDEventGetIntegerValue();
                if (v25 == 184 || v25 == 669 || v25 == 430) {
                  goto LABEL_54;
                }
                break;
            }
          }
LABEL_59:
          objc_super v19 = 0;
          goto LABEL_64;
        }
        if (!_UIDynamicButtonFeatureIsEnabled() || !_UIEventHIDIsDynamicButtonEvent(a2)) {
          goto LABEL_59;
        }
        v5 = _UIEventHIDUIWindowForHIDEvent();
        v6 = [v5 _eventRoutingScene];
        uint64_t v7 = (uint64_t)a1;
        uint64_t v8 = 16;
      }
    }
    else
    {
      if (Type == 30)
      {
LABEL_54:
        -[UIEventEnvironment _physicalKeyboardEventForHIDEvent:](a1, a2);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      if (Type != 35) {
        goto LABEL_28;
      }
      v5 = _UIEventHIDUIWindowForHIDEvent();
      v6 = [v5 _eventRoutingScene];
      uint64_t v7 = (uint64_t)a1;
      uint64_t v8 = 8;
    }
LABEL_37:
    objc_super v19 = _UIEventEnvironmentEventOfTypeForEventRoutingUIScene(v7, v8, v6);

    goto LABEL_64;
  }
  if (Type <= 10)
  {
    if (Type == 1) {
      goto LABEL_59;
    }
    if (Type == 6)
    {
      if (_UIEventHIDIsScrollEvent(a2))
      {
        v5 = _UIEventHIDUIWindowForHIDEvent();
        v6 = [v5 _eventRoutingScene];
        uint64_t v7 = (uint64_t)a1;
        uint64_t v8 = 10;
      }
      else
      {
        long long v18 = BKSHIDEventGetBaseAttributes();
        [v18 contextID];

        v5 = _UIEventHIDUIWindowForHIDEvent();
        v6 = [v5 _eventRoutingScene];
        uint64_t v7 = (uint64_t)a1;
        uint64_t v8 = 7;
      }
      goto LABEL_37;
    }
    goto LABEL_28;
  }
  if (Type == 11)
  {
    if ((_UIEventHIDIgnoresDragEvents() & 1) == 0)
    {
      CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
      if (Children)
      {
        CFArrayRef v10 = Children;
        if (CFArrayGetCount(Children) >= 1)
        {
          CFArrayGetValueAtIndex(v10, 0);
          uint64_t v11 = BKSHIDEventGetDigitizerAttributes();
          uint64_t v12 = _UIEventHIDPathAttributesForChild(v11);
          int v13 = [v12 locus];

          if (v13)
          {
            -[UIEventEnvironment _dragEventForHIDEvent:]((uint64_t)a1);
            id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:
            objc_super v19 = v14;
            goto LABEL_64;
          }
        }
      }
    }
    if (_UIEventHIDShouldIgnoreEventsExpectedToBecomeDragEvent()
      && _UIEventHIDExpectedToBecomeDragEvent())
    {
      goto LABEL_59;
    }
    v5 = _UIEventHIDUIWindowForHIDEvent();
    v6 = -[UIEventEnvironment _findTouchesEventWindowSceneForKeyboardWindowIfNeeded:]((uint64_t)a1, v5);
    uint64_t v7 = (uint64_t)a1;
    uint64_t v8 = 0;
    goto LABEL_37;
  }
  if (Type != 17) {
    goto LABEL_28;
  }
  if (_UIEventHIDIsTransformEvent(a2))
  {
    v5 = _UIEventHIDUIWindowForHIDEvent();
    v6 = [v5 _eventRoutingScene];
    uint64_t v7 = (uint64_t)a1;
    uint64_t v8 = 14;
    goto LABEL_37;
  }
  int v20 = IOHIDEventGetType();
  if (v20 == 3)
  {
    if (_UIEventHIDPressTypeForKeyboardHIDEvent() != -1) {
      goto LABEL_62;
    }
    goto LABEL_59;
  }
  if (v20 != 29)
  {
    if (v20 == 17)
    {
      uint64_t v21 = _UIEventHIDUIScreenForHIDEvent(a2);
      uint64_t v22 = [v21 _userInterfaceIdiom];

      if (v22 == 3) {
        goto LABEL_62;
      }
    }
    goto LABEL_59;
  }
  uint64_t v28 = IOHIDEventGetIntegerValue();
  objc_super v19 = 0;
  if (v28 && v28 != 3) {
    goto LABEL_62;
  }
LABEL_64:
  return v19;
}

- (id)_touchesEventForWindow:(uint64_t)a1
{
  id v2 = (id)a1;
  if (a1)
  {
    v3 = -[UIEventEnvironment _findTouchesEventWindowSceneForKeyboardWindowIfNeeded:](a1, a2);
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 0, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_findTouchesEventWindowSceneForKeyboardWindowIfNeeded:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 _eventRoutingScene];
    v4 = v3;
    if (!+[UIKeyboard inputUIOOP])
    {
      v4 = v3;
      if (+[_UIRemoteKeyboards enabled])
      {
        v4 = v3;
        if ([a2 _isRemoteKeyboardWindow])
        {
          uint64_t v5 = [v3 _sceneForKeyboardDisplay];
          v6 = (void *)v5;
          if (v5) {
            BOOL v7 = v3 == (id)v5;
          }
          else {
            BOOL v7 = 0;
          }
          int v8 = v7;
          BOOL v9 = +[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow];
          int v10 = [(id)UIApp isFrontBoard];
          uint64_t v11 = [v3 _screen];
          uint64_t v12 = [v11 _userInterfaceIdiom];

          if (v12 == 3) {
            int v13 = 0;
          }
          else {
            int v13 = v10;
          }
          if (v9) {
            int v14 = v13;
          }
          else {
            int v14 = 1;
          }
          v4 = v3;
          if ((v8 & v14) == 1)
          {
            v4 = +[UIWindowScene _keyWindowScene]();

            id v15 = [v4 _settingsScene];
            long long v16 = v15;
            if (v15 && v15 != v3 && [v15 _allowsEventUIWindowRouting])
            {
              id v17 = v16;

              v4 = v17;
            }
          }
        }
      }
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_setCurrentTouch:(void *)a3 forWindow:
{
  if (!a1) {
    return;
  }
  if (!a2)
  {
    if (!a3) {
      return;
    }
    v6 = [a3 _eventRoutingScene];
    if (!v6) {
      goto LABEL_20;
    }
    id v11 = v6;
    if ([v6 _hasInvalidated])
    {
      if (![v11 _hasInvalidated]) {
        goto LABEL_19;
      }
      char v8 = [*(id *)(a1 + 136) containsObject:v11];

      if (v8) {
        return;
      }
    }
    else
    {
    }
    int v10 = *(void **)(a1 + 168);
    id v11 = [a3 windowScene];
    [v10 removeObjectForKey:v11];
    goto LABEL_19;
  }
  if (!a3) {
    return;
  }
  v6 = [a3 _eventRoutingScene];
  if (!v6) {
    goto LABEL_20;
  }
  id v11 = v6;
  if (([v6 _hasInvalidated] & 1) == 0)
  {

LABEL_16:
    BOOL v9 = *(void **)(a1 + 168);
    id v11 = [a3 windowScene];
    [v9 setObject:a2 forKey:v11];
    goto LABEL_19;
  }
  if ([v11 _hasInvalidated])
  {
    char v7 = [*(id *)(a1 + 136) containsObject:v11];

    if (v7) {
      return;
    }
    goto LABEL_16;
  }
LABEL_19:
  v6 = v11;
LABEL_20:
}

void __39__UIEventEnvironment_sceneDidActivate___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    _UIPencilEventRequestBarrelFocusIfAbleForWindow(v2, 0);
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIPencilEventDidEvaluateBarrelFocusForSceneTransition" object:*(void *)(a1 + 40) userInfo:0];
}

- (const)_touchMapForWindow:(uint64_t)a1
{
  Value = 0;
  if (a1 && key)
  {
    CFDictionaryRef Mutable = *(const __CFDictionary **)(a1 + 176);
    if (!Mutable)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
      *(void *)(a1 + 176) = Mutable;
    }
    Value = CFDictionaryGetValue(Mutable, key);
    if (!Value)
    {
      Value = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 176), key, Value);
      CFRelease(Value);
    }
  }
  return Value;
}

- (void)_setTouchMap:(const void *)a3 forWindow:
{
  if (a1)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
    char v7 = *(void **)(a1 + 88);
    if (Count) {
      [v7 addObject:a3];
    }
    else {
      [v7 removeObject:a3];
    }
    CFDictionaryRef Mutable = *(__CFDictionary **)(a1 + 176);
    if (!Mutable)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
      *(void *)(a1 + 176) = Mutable;
    }
    CFDictionarySetValue(Mutable, a3, theDict);
  }
}

- (id)_pencilEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 13, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_registerEstimatedTouches:(void *)a3 event:(uint64_t)a4 forTouchable:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned char *)(a1 + 96))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v6 = a2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v40 + 1) + 8 * i) type] == 2)
          {

            id v11 = NSNumber;
            [a3 _hidEvent];
            uint64_t v12 = BKSHIDEventGetBaseAttributes();
            uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v12, "contextID"));

            id v14 = [*(id *)(a1 + 192) objectForKey:v13];
            if (!v14)
            {
              id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              [*(id *)(a1 + 192) setObject:v14 forKey:v13];
            }
            uint64_t v30 = a1;
            v31 = (void *)v13;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            obuint64_t j = v6;
            uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
            if (v28)
            {
              uint64_t v26 = *(void *)v37;
              do
              {
                uint64_t v15 = 0;
                do
                {
                  if (*(void *)v37 != v26) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v29 = v15;
                  uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * v15);
                  id v17 = [a3 coalescedTouchesForTouch:v16];
                  long long v32 = 0u;
                  long long v33 = 0u;
                  long long v34 = 0u;
                  long long v35 = 0u;
                  uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v44 count:16];
                  if (v18)
                  {
                    uint64_t v19 = v18;
                    uint64_t v20 = *(void *)v33;
                    do
                    {
                      for (uint64_t j = 0; j != v19; ++j)
                      {
                        if (*(void *)v33 != v20) {
                          objc_enumerationMutation(v17);
                        }
                        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
                        if (v22 && (*(unsigned char *)(v22 + 265) || *(unsigned char *)(v22 + 268)))
                        {
                          v23 = [*(id *)(*((void *)&v32 + 1) + 8 * j) estimationUpdateIndex];
                          if (v23)
                          {
                            uint64_t v24 = [v14 objectForKey:v23];
                            if (!v24)
                            {
                              uint64_t v24 = [[_UIEstimatedTouchRecord alloc] initWithLiveTouch:v16 freezeTouch:v22 contextID:v31];
                              [v14 setObject:v24 forKey:v23];
                              [*(id *)(v30 + 200) addObject:v24];
                            }
                            [(_UIEstimatedTouchRecord *)v24 addTouchable:a4];
                          }
                        }
                      }
                      uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v44 count:16];
                    }
                    while (v19);
                  }

                  uint64_t v15 = v29 + 1;
                }
                while (v29 + 1 != v28);
                uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
              }
              while (v28);
            }

            id v6 = v31;
            goto LABEL_37;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_37:
  }
}

- (void)sceneDidActivate:(id)a3
{
  id v3 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(id)objc_opt_class() _supportsEventUIWindowRouting])
  {
    id v4 = v3;
    if ([v4 _allowsEventUIWindowRouting])
    {
      uint64_t v5 = [v4 _allWindows];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 keyWindow];
        }
        else {
        uint64_t v7 = [v4 _topVisibleWindowPassingTest:&__block_literal_global_470];
        }
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __39__UIEventEnvironment_sceneDidActivate___block_invoke_2;
        v9[3] = &unk_1E52D9F98;
        id v10 = v7;
        id v11 = v4;
        id v8 = v7;
        [v11 _enqueuePostSettingsUpdateResponseBlock:v9 inPhase:0x1ED0EB320];
      }
    }
  }
}

- (UIEventEnvironment)initWithApplication:(id)a3
{
  v40.receiver = self;
  v40.super_class = (Class)UIEventEnvironment;
  id v4 = [(UIEventEnvironment *)&v40 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_application = (UIApplication *)a3;
    uint64_t v6 = objc_opt_new();
    eventQueue = v5->_eventQueue;
    v5->_eventQueue = (NSMutableArray *)v6;

    id v8 = [(UIEvent *)[UIPressesEvent alloc] _initWithEnvironment:v5];
    fallbackPressesEvent = v5->_fallbackPressesEvent;
    v5->_fallbackPressesEvent = v8;

    id v10 = [(UIEvent *)[UIPhysicalKeyboardEvent alloc] _initWithEnvironment:v5];
    fallbackPhysicalKeyboardEvent = v5->_fallbackPhysicalKeyboardEvent;
    v5->_fallbackPhysicalKeyboardEvent = v10;

    uint64_t v12 = [(UIEvent *)[UIWheelEvent alloc] _initWithEnvironment:v5];
    fallbackWheelEvent = v5->_fallbackWheelEvent;
    v5->_fallbackWheelEvent = v12;

    id v14 = [[UIEvent alloc] _initWithEnvironment:v5];
    event = v5->_event;
    v5->_event = v14;

    uint64_t v16 = [(UIEvent *)[UIRemoteControlEvent alloc] _initWithEnvironment:v5];
    remoteControlEvent = v5->_remoteControlEvent;
    v5->_remoteControlEvent = v16;

    uint64_t v18 = [(UIEvent *)[UIMotionEvent alloc] _initWithEnvironment:v5];
    motionEvent = v5->_motionEvent;
    v5->_motionEvent = v18;

    uint64_t v20 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    eventRegistryByScene = v5->_eventRegistryByScene;
    v5->_eventRegistryByScene = (NSMapTable *)v20;

    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v5 selector:sel_sceneDidDisconnect_ name:@"UISceneDidDisconnectNotification" object:0];
    [v22 addObserver:v5 selector:sel_sceneDidActivate_ name:@"UISceneDidActivateNotification" object:0];
    [v22 addObserver:v5 selector:sel_pointerLockStateDidChange_ name:@"UIPointerLockStateDidChangeNotification" object:0];
    uint64_t v23 = objc_opt_new();
    dragEventsByContextAndSessionIDPair = v5->_dragEventsByContextAndSessionIDPair;
    v5->_dragEventsByContextAndSessionIDPair = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    currentNudgePressTypeByScene = v5->_currentNudgePressTypeByScene;
    v5->_currentNudgePressTypeByScene = (NSMapTable *)v25;

    int v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fallbackPressMap = v5->_fallbackPressMap;
    v5->_fallbackPressMap = v27;

    uint64_t v29 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    pressesMapByScene = v5->_pressesMapByScene;
    v5->_pressesMapByScene = (NSMapTable *)v29;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    estimatedTouchRecordsByContextIDAndEstimationIndex = v5->_estimatedTouchRecordsByContextIDAndEstimationIndex;
    v5->_estimatedTouchRecordsByContextIDAndEstimationIndex = v31;

    long long v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    estimatedTouchRecordsInIncomingOrder = v5->_estimatedTouchRecordsInIncomingOrder;
    v5->_estimatedTouchRecordsInIncomingOrder = v33;

    uint64_t v35 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    currentTouchByScene = v5->_currentTouchByScene;
    v5->_currentTouchByScene = (NSMapTable *)v35;

    uint64_t v37 = objc_opt_new();
    windowsWithActiveTouchMaps = v5->_windowsWithActiveTouchMaps;
    v5->_windowsWithActiveTouchMaps = (NSMutableSet *)v37;

    v5->_touchMapsByWindow = 0;
  }
  return v5;
}

- (id)_hoverEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 11, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)dealloc
{
  v7[3] = *MEMORY[0x1E4F143B8];
  touchMapsByWindow = self->_touchMapsByWindow;
  if (touchMapsByWindow) {
    CFRelease(touchMapsByWindow);
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7[0] = @"UISceneDidDisconnectNotification";
  v7[1] = @"UISceneDidActivateNotification";
  v7[2] = @"UIPointerLockStateDidChangeNotification";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  v6.receiver = self;
  v6.super_class = (Class)UIEventEnvironment;
  [(UIEventEnvironment *)&v6 dealloc];
}

- (UIDragEvent)_dragEventForHIDEvent:(uint64_t)a1
{
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  CFArrayRef v3 = Children;
  if (Children)
  {
    if (CFArrayGetCount(Children) < 1)
    {
      CFArrayRef v3 = 0;
    }
    else
    {
      CFArrayGetValueAtIndex(v3, 0);
      id v4 = BKSHIDEventGetDigitizerAttributes();
      uint64_t v5 = _UIEventHIDPathAttributesForChild(v4);

      if ([v5 locus]) {
        CFArrayRef v3 = (const __CFArray *)[v5 userIdentifier];
      }
      else {
        CFArrayRef v3 = 0;
      }
    }
  }
  objc_super v6 = BKSHIDEventGetBaseAttributes();
  uint64_t v7 = [v6 contextID];

  id v8 = 0;
  if (v3 && v7)
  {
    CFArrayRef v9 = (const __CFArray *)IOHIDEventGetChildren();
    if (v9 && (CFArrayRef v10 = v9, CFArrayGetCount(v9) >= 1))
    {
      CFArrayGetValueAtIndex(v10, 0);
      id v11 = BKSHIDEventGetDigitizerAttributes();
      uint64_t v12 = _UIEventHIDPathAttributesForChild(v11);
      int v13 = [v12 locus];

      uint64_t v14 = v7 << 32;
      if (v13 != 4) {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v14 | v3];
    id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:v15];
    if (!v8)
    {
      id v8 = [[UIDragEvent alloc] initWithDragSessionID:v3 environment:a1];
      if (v8) {
        [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v15];
      }
    }
  }
  return v8;
}

- (id)_physicalKeyboardEventForHIDEvent:(id *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v4 = BKSHIDEventGetBaseAttributes();
    int v5 = [v4 contextID];
    objc_super v6 = _UIEventHIDUIWindowForHIDEvent();
    if (!v5)
    {
      if ([(id)UIApp isFrontBoard])
      {
        uint64_t v7 = [v4 environment];
        id v8 = [MEMORY[0x1E4F4F280] systemEnvironment];
        int v9 = [v7 isEqual:v8];

        if (v9)
        {
          CFArrayRef v10 = _UIEventHIDUIScreenForHIDEvent(a2);
          uint64_t v11 = [(id)UIApp _windowForSystemAppButtonEventsForScreen:v10];

          if (!v11)
          {
            uint64_t v11 = [(id)UIApp _keyWindowForScreen:v10];
          }

          objc_super v6 = (void *)v11;
        }
      }
    }
    if (v6 || ![(id)UIApp isFrontBoard])
    {
      uint64_t v12 = [v6 _eventRoutingScene];
      _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 4, v12);
      id v2 = (id *)objc_claimAutoreleasedReturnValue();

      if (!v2) {
        [(id)UIApp _resetGSKeyboardModifierStateIfNecessary:a2];
      }
    }
    else
    {
      id v2 = (id *)v2[14];
    }
    [v2 setSource:4];
  }
  return v2;
}

- (id)_pressesEventForHIDEvent:(uint64_t)a1
{
  id v2 = _UIEventHIDUIWindowForHIDEvent();
  uint64_t v3 = _UIEventHIDPressTypeForKeyboardHIDEvent();
  char v4 = [(id)UIApp isFrontBoard];
  if (v3 == 601) {
    goto LABEL_8;
  }
  char v5 = v4 ^ 1;
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 0x66) {
    char v5 = 0;
  }
  if (v5)
  {
LABEL_8:
    if (!v2)
    {
LABEL_7:
      id v7 = *(id *)(a1 + 104);
      goto LABEL_10;
    }
  }
  else
  {
    char v6 = [(id)UIApp isFrontBoard];
    if (!v2 && (v6 & 1) != 0) {
      goto LABEL_7;
    }
  }
  id v8 = [v2 _eventRoutingScene];
  _UIEventEnvironmentEventOfTypeForEventRoutingUIScene(a1, 3, v8);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v7;
}

- (void)_enqueueClearEventsOfRetainedWindow:(void *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1 && (!a2 || (a2[12] & 0x1000) == 0))
  {
    char v4 = [a2 _eventRoutingScene];
    int v5 = [v4 _hasInvalidated];

    char v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventEnvironment", &_enqueueClearEventsOfRetainedWindow____s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = v8;
      *(_DWORD *)buf = 136446722;
      uint64_t v19 = Name;
      __int16 v20 = 2050;
      uint64_t v21 = a2;
      __int16 v22 = 1026;
      int v23 = [a2 _contextId];
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Enqueuing clear events of window: <%{public}s: %{public}p>; contextId: 0x%{public}X",
        buf,
        0x1Cu);
    }
    int v10 = [a2 _contextId];
    uint64_t v11 = -[UIEventEnvironment _touchesEventForWindow:]((uint64_t)a1, a2);
    uint64_t v12 = -[UIEventEnvironment _hoverEventForWindow:](a1, a2);
    int v13 = -[UIEventEnvironment _dynamicButtonEventForWindow:](a1, a2);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UIEventEnvironment__enqueueClearEventsOfRetainedWindow___block_invoke;
    aBlock[3] = &unk_1E5304990;
    aBlock[4] = a2;
    aBlock[5] = v11;
    aBlock[6] = a1;
    aBlock[7] = v12;
    int v17 = v10;
    aBlock[8] = v13;
    aBlock[9] = Name;
    uint64_t v14 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v15 = v14;
    if (v5) {
      v14[2](v14);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
  }
}

- (id)_dynamicButtonEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 16, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __58__UIEventEnvironment__enqueueClearEventsOfRetainedWindow___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventEnvironment", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_10)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 72);
    char v4 = *(void **)(a1 + 32);
    int v5 = v2;
    *(_DWORD *)buf = 136446722;
    uint64_t v27 = v3;
    __int16 v28 = 2050;
    uint64_t v29 = v4;
    __int16 v30 = 1026;
    int v31 = [v4 _contextId];
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Performing clear events of window: <%{public}s: %{public}p>; contextId: 0x%{public}X",
      buf,
      0x1Cu);
  }
  -[UITouchesEvent _cancelResponderDeliveryAndClearTouchesOfWindow:](*(void **)(a1 + 40), *(void **)(a1 + 32));
  char v6 = -[UIEventEnvironment _touchMapForWindow:](*(void *)(a1 + 48), *(void **)(a1 + 32));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = objc_msgSend(v6, "objectEnumerator", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        if (v12) {
          int v13 = *(void **)(v12 + 360);
        }
        else {
          int v13 = 0;
        }
        id v14 = v13;
        id v15 = *(id *)(a1 + 32);

        if (v14 == v15) {
          -[UITouch _clearForWindowIfNeeded:](v12, *(void **)(a1 + 32));
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v16 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v9 = v16;
    }
    while (v16);
  }

  -[UIEventEnvironment _resetTouchMapForWindow:](*(void *)(a1 + 48), *(void **)(a1 + 32));
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17)
  {
    CFDictionaryRef Mutable = *(__CFDictionary **)(v17 + 176);
    if (!Mutable)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
      *(void *)(v17 + 176) = Mutable;
    }
  }
  else
  {
    CFDictionaryRef Mutable = 0;
  }
  CFDictionaryRemoveValue(Mutable, *(const void **)(a1 + 32));
  [*(id *)(a1 + 56) _removeAllHoverTouchesForContextId:*(unsigned int *)(a1 + 80)];
  uint64_t v19 = *(void **)(a1 + 64);
  __int16 v20 = [v19 _componentsForWindow:*(void *)(a1 + 32)];
  [v19 _removeComponents:v20];
}

- (uint64_t)_resetTouchMapForWindow:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFDictionaryRef Mutable = *(const __CFDictionary **)(result + 176);
    if (!Mutable)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
      *(void *)(v3 + 176) = Mutable;
    }
    Value = (__CFDictionary *)CFDictionaryGetValue(Mutable, key);
    if (Value) {
      CFDictionaryRemoveAllValues(Value);
    }
    char v6 = *(void **)(v3 + 88);
    return [v6 removeObject:key];
  }
  return result;
}

- (void)_removeEstimatedTouchRecord:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 200) removeObject:a2];
    id v7 = [a2 contextID];
    char v4 = objc_msgSend(*(id *)(a1 + 192), "objectForKey:");
    int v5 = [a2 frozenTouch];
    char v6 = [v5 estimationUpdateIndex];
    [v4 removeObjectForKey:v6];

    if (![v4 count]) {
      [*(id *)(a1 + 192) removeObjectForKey:v7];
    }
  }
}

- (id)_estimatedTouchRecordForContextID:(uint64_t)a3 estimationIndex:
{
  if (a1)
  {
    char v4 = [*(id *)(a1 + 192) objectForKey:a2];
    int v5 = [v4 objectForKey:a3];
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (void)_dispatchAndRemoveStaleEstimationUpdateRecordsWithEventTime:(double)a3 upToRecord:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = *(id *)(a1 + 200);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v25;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        if (v12 == a2) {
          break;
        }
        int v13 = [*(id *)(*((void *)&v24 + 1) + 8 * v11) frozenTouch];
        [v13 timestamp];
        if (a3 - v14 > 0.4)
        {
          if (!v9) {
            uint64_t v9 = objc_opt_new();
          }
          [v9 addObject:v12];
          [v13 _pressure];
          objc_msgSend(v12, "dispatchUpdateWithPressure:stillEstimated:", 1);
          [v13 _rollAngle];
          objc_msgSend(v12, "dispatchUpdateWithRollAngle:stillEstimated:", 1);
        }

        if (v8 == ++v11)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[UIEventEnvironment _removeEstimatedTouchRecord:](a1, *(void **)(*((void *)&v20 + 1) + 8 * i));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)_removeDragEvent:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 48), "allKeysForObject:", a2, 0);
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
          [*(id *)(a1 + 48) removeObjectForKey:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)_dragEvents
{
  if (a1)
  {
    a1 = [a1[6] allValues];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_enqueueHIDEvent:(__IOHIDEvent *)a3
{
}

- (id)_pressForType:(void *)a3 window:
{
  if (!a1) {
    goto LABEL_7;
  }
  if (a3)
  {
    uint64_t v6 = [a3 _eventRoutingScene];
    uint64_t v7 = v6;
    if (v6)
    {
      if (([v6 _hasInvalidated] & 1) == 0)
      {

LABEL_11:
        long long v11 = *(void **)(a1 + 144);
        uint64_t v12 = [a3 windowScene];
        uint64_t v7 = [v11 objectForKey:v12];

        uint64_t v13 = [NSNumber numberWithInteger:a2];
        long long v9 = [v7 objectForKey:v13];

        goto LABEL_12;
      }
      if ([v7 _hasInvalidated])
      {
        char v8 = [*(id *)(a1 + 136) containsObject:v7];

        if (v8)
        {
LABEL_7:
          long long v9 = 0;
          goto LABEL_13;
        }
        goto LABEL_11;
      }
    }
    long long v9 = 0;
  }
  else
  {
    long long v10 = *(void **)(a1 + 160);
    uint64_t v7 = [NSNumber numberWithInteger:a2];
    long long v9 = [v10 objectForKey:v7];
  }
LABEL_12:

LABEL_13:
  return v9;
}

- (void)_setPress:(uint64_t)a3 forType:(void *)a4 window:
{
  if (!a1) {
    return;
  }
  if (!a4)
  {
    long long v10 = *(void **)(a1 + 160);
    id v17 = [NSNumber numberWithInteger:a3];
    [v10 setObject:a2 forKey:v17];
    goto LABEL_13;
  }
  char v8 = [a4 _eventRoutingScene];
  if (v8)
  {
    id v17 = v8;
    if (([v8 _hasInvalidated] & 1) == 0)
    {

LABEL_10:
      long long v11 = *(void **)(a1 + 144);
      uint64_t v12 = [a4 windowScene];
      id v18 = [v11 objectForKey:v12];

      id v13 = v18;
      if (!v18) {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      id v17 = v13;
      double v14 = [NSNumber numberWithInteger:a3];
      [v17 setObject:a2 forKey:v14];

      id v15 = *(void **)(a1 + 144);
      uint64_t v16 = [a4 windowScene];
      [v15 setObject:v17 forKey:v16];

      goto LABEL_13;
    }
    if ([v17 _hasInvalidated])
    {
      char v9 = [*(id *)(a1 + 136) containsObject:v17];

      if (v9) {
        return;
      }
      goto LABEL_10;
    }
LABEL_13:
    char v8 = v17;
  }
}

- (uint64_t)_currentNudgePressTypeForWindow:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return -1;
  }
  uint64_t v4 = [a2 _eventRoutingScene];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  if (([v4 _hasInvalidated] & 1) == 0)
  {

    goto LABEL_9;
  }
  if (![v5 _hasInvalidated]) {
    goto LABEL_11;
  }
  char v6 = [*(id *)(a1 + 136) containsObject:v5];

  if ((v6 & 1) == 0)
  {
LABEL_9:
    char v8 = *(void **)(a1 + 152);
    char v9 = [a2 windowScene];
    uint64_t v5 = [v8 objectForKey:v9];

    if (v5)
    {
      uint64_t v7 = [v5 integerValue];
LABEL_12:

      return v7;
    }
LABEL_11:
    uint64_t v7 = -1;
    goto LABEL_12;
  }
  return -1;
}

- (void)_setCurrentNudgePressType:(void *)a3 forWindow:
{
  if (!a1 || !a3) {
    return;
  }
  char v6 = [a3 _eventRoutingScene];
  if (v6)
  {
    id v10 = v6;
    if ([v6 _hasInvalidated])
    {
      if (![v10 _hasInvalidated])
      {
LABEL_10:
        char v6 = v10;
        goto LABEL_11;
      }
      char v7 = [*(id *)(a1 + 136) containsObject:v10];

      if (v7) {
        return;
      }
    }
    else
    {
    }
    char v8 = *(void **)(a1 + 152);
    id v10 = [NSNumber numberWithInteger:a2];
    char v9 = [a3 windowScene];
    [v8 setObject:v10 forKey:v9];

    goto LABEL_10;
  }
LABEL_11:
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 object];
    int v6 = [(id)objc_opt_class() _supportsEventUIWindowRouting];

    if (v6)
    {
      char v7 = [a3 object];
      if (v7)
      {
        invalidatedAndDisconnectedScenes = self->_invalidatedAndDisconnectedScenes;
        if (!invalidatedAndDisconnectedScenes)
        {
          char v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
          id v10 = self->_invalidatedAndDisconnectedScenes;
          self->_invalidatedAndDisconnectedScenes = v9;

          invalidatedAndDisconnectedScenes = self->_invalidatedAndDisconnectedScenes;
        }
        [(NSHashTable *)invalidatedAndDisconnectedScenes addObject:v7];
        uint64_t v11 = [(NSMapTable *)self->_eventRegistryByScene objectForKey:v7];
        uint64_t v12 = (void *)v11;
        if (v11)
        {
          [*(id *)(v11 + 8) removeAllObjects];
          id v13 = (void *)v12[1];
          v12[1] = 0;
        }
        [(NSMapTable *)self->_currentNudgePressTypeByScene removeObjectForKey:v7];
        [(NSMapTable *)self->_pressesMapByScene removeObjectForKey:v7];
        [(NSMapTable *)self->_currentTouchByScene removeObjectForKey:v7];
        [(NSMapTable *)self->_eventRegistryByScene removeObjectForKey:v7];
        double v14 = (void *)[(NSMutableSet *)self->_windowsWithActiveTouchMaps copy];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              long long v21 = [v20 _eventRoutingScene];

              if (v21 == v7) {
                -[UIEventEnvironment _resetTouchMapForWindow:]((uint64_t)self, v20);
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v17);
        }
      }
    }
  }
  else
  {
  }
}

uint64_t __39__UIEventEnvironment_sceneDidActivate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 canBecomeKeyWindow];
  if (result)
  {
    if ([a2 _isTextEffectsWindow]) {
      return 0;
    }
    else {
      return [a2 isInternalWindow] ^ 1;
    }
  }
  return result;
}

- (void)pointerLockStateDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 object];
  int v6 = [a3 userInfo];
  char v7 = [v6 objectForKeyedSubscript:@"scene"];

  if ([(id)objc_opt_class() _supportsEventUIWindowRouting]) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  id v9 = v8;
  id v10 = v9;
  if (v5 && v9 && _UIPointerLockStateIsAvailableForScene(v9))
  {
    uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("PointerLockState", &pointerLockStateDidChange____s_category) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      id v13 = [v10 succinctDescription];
      int v14 = [v5 isLocked];
      id v15 = @"NO";
      if (v14) {
        id v15 = @"YES";
      }
      int v17 = 138412546;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      long long v20 = v15;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "pointerLockState notification received: windowScene %@; isLocked: %@",
        (uint8_t *)&v17,
        0x16u);
    }
    uint64_t v16 = _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)self, 11, v10);
    if (v16) {
      objc_msgSend(v16, "_setPointerLocked:", objc_msgSend(v5, "isLocked"));
    }
  }
}

- (id)_moveEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 5, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_wheelEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 7, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_gameControllerEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 8, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_physicalKeyboardEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 4, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_scrollEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 10, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_transformEventForWindow:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [a2 _eventRoutingScene];
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 14, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_sendMotionBegan:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 32);
    if ([v4 _isDetectingMotionEvents])
    {
      [v4 _setSubtype:a2];
      [v4 setShakeState:0];
      [*(id *)(a1 + 8) sendEvent:v4];
    }
  }
}

- (void)_sendMotionEnded:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 32);
    if ([v4 _isDetectingMotionEvents])
    {
      [v4 _setSubtype:a2];
      [v4 setShakeState:1];
      [*(id *)(a1 + 8) sendEvent:v4];
    }
  }
}

- (void)_sendMotionCancelled:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 32);
    if ([v4 _isDetectingMotionEvents])
    {
      [v4 _setSubtype:a2];
      [v4 setShakeState:2];
      [*(id *)(a1 + 8) sendEvent:v4];
    }
  }
}

- (void)_sendRemoteControlEvent:(uint64_t)a1
{
  if (a1 && [*(id *)(a1 + 8) _hasRemoteControlEventObservers])
  {
    id v4 = *(id *)(a1 + 40);
    [v4 _setSubtype:a2];
    [*(id *)(a1 + 8) sendEvent:v4];
  }
}

- (UIApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  self->_application = (UIApplication *)a3;
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedTouchRecordsInIncomingOrder, 0);
  objc_storeStrong((id *)&self->_estimatedTouchRecordsByContextIDAndEstimationIndex, 0);
  objc_storeStrong((id *)&self->_currentTouchByScene, 0);
  objc_storeStrong((id *)&self->_fallbackPressMap, 0);
  objc_storeStrong((id *)&self->_currentNudgePressTypeByScene, 0);
  objc_storeStrong((id *)&self->_pressesMapByScene, 0);
  objc_storeStrong((id *)&self->_invalidatedAndDisconnectedScenes, 0);
  objc_storeStrong((id *)&self->_eventRegistryByScene, 0);
  objc_storeStrong((id *)&self->_fallbackWheelEvent, 0);
  objc_storeStrong((id *)&self->_fallbackPhysicalKeyboardEvent, 0);
  objc_storeStrong((id *)&self->_fallbackPressesEvent, 0);
  objc_storeStrong((id *)&self->_windowsWithActiveTouchMaps, 0);
  objc_storeStrong((id *)&self->_dragEventsByContextAndSessionIDPair, 0);
  objc_storeStrong((id *)&self->_remoteControlEvent, 0);
  objc_storeStrong((id *)&self->_motionEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end