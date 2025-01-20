@interface _UIDynamicButtonEvent
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (NSSet)_allDynamicButtons;
- (NSString)debugDescription;
- (NSString)description;
- (_UIDynamicButtonEvent)init;
- (id)_allWindows;
- (id)_appendDescriptionToBuilder:(id)result;
- (id)_cloneEvent;
- (id)_componentsForGestureRecognizer:(id)a3;
- (id)_componentsForWindow:(id)a3;
- (id)_dispatchWindows;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_init;
- (id)_removeComponentsForWindow:(id *)result withCancellation:(uint64_t)a2;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)subtype;
- (int64_t)type;
- (uint64_t)_appendDescriptionToStream:(uint64_t)result;
- (void)_cancelComponents:(id)a3;
- (void)_cleanupAfterDispatch;
- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3;
- (void)_removeComponents:(id)a3;
- (void)_removeComponents:(int)a3 withCancellation:;
- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
- (void)_windowDidBecomeHidden:(id)a3;
- (void)_windowDidDetachContext:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
@end

@implementation _UIDynamicButtonEvent

- (_UIDynamicButtonEvent)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIDynamicButtonEvent.m", 245, @"%s: init is not allowed on %@", "-[_UIDynamicButtonEvent init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicButtonEvent;
  v2 = [(UIEvent *)&v10 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v4 = (void *)v2[15];
    v2[15] = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v6 = (void *)v2[16];
    v2[16] = v5;

    v7 = (void *)v2[17];
    v2[17] = 0;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__windowDidDetachContext_ name:_UIWindowDidDetachContextNotification object:0];
    [v8 addObserver:v2 selector:sel__windowDidBecomeHidden_ name:@"UIWindowDidBecomeHiddenNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = _UIWindowDidDetachContextNotification;
  v6[1] = @"UIWindowDidBecomeHiddenNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIDynamicButtonEvent;
  [(UIEvent *)&v5 dealloc];
}

- (int64_t)type
{
  return 16;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_cloneEvent
{
  return 0;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v70.receiver = self;
  v70.super_class = (Class)_UIDynamicButtonEvent;
  -[UIEvent _setHIDEvent:](&v70, sel__setHIDEvent_);
  if (a3)
  {
    if (_UIEventHIDIsDynamicButtonEvent((uint64_t)a3))
    {
      if (self) {
        goto LABEL_4;
      }
    }
    else
    {
      v60 = [MEMORY[0x1E4F28B00] currentHandler];
      [v60 handleFailureInMethod:a2, self, @"_UIDynamicButtonEvent.m", 289, @"Invalid hidEvent type for %@: %@", objc_opt_class(), a3 object file lineNumber description];

      if (self)
      {
LABEL_4:
        v6 = _UIEventHIDUIWindowForHIDEvent();
        if (!v6)
        {
          if (os_variant_has_internal_diagnostics())
          {
            v64 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "-[_UIDynamicButtonEvent _processHIDEventFindingDynamicButtonForDispatch:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a3;
              _os_log_fault_impl(&dword_1853B0000, v64, OS_LOG_TYPE_FAULT, "%s: Received nil window for dispatched HID event: hidEvent: %@", buf, 0x16u);
            }
          }
          else
          {
            v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E770) + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "-[_UIDynamicButtonEvent _processHIDEventFindingDynamicButtonForDispatch:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a3;
              _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "%s: Received nil window for dispatched HID event: hidEvent: %@", buf, 0x16u);
            }
          }
          v19 = 0;
          goto LABEL_93;
        }
        if (_UIEventHIDIsDynamicButtonEvent((uint64_t)a3)) {
          uint64_t v7 = 5;
        }
        else {
          uint64_t v7 = 0;
        }
        _UIEventHIDGetChildForceStageEvent((uint64_t)a3);
        uint64_t IntegerValue = IOHIDEventGetIntegerValue();
        v9 = [(NSMapTable *)self->_dynamicButtonsByWindow objectForKey:v6];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v71 objects:v83 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = IntegerValue & ~(IntegerValue >> 63);
          uint64_t v14 = *(void *)v72;
LABEL_10:
          v15 = v10;
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v72 != v14) {
              objc_enumerationMutation(v15);
            }
            v17 = *(void **)(*((void *)&v71 + 1) + 8 * v16);
            if ([v17 _physicalButton] == v7 && objc_msgSend(v17, "_stage") == v13) {
              break;
            }
            if (v12 == ++v16)
            {
              id v10 = v15;
              uint64_t v12 = [v15 countByEnumeratingWithState:&v71 objects:v83 count:16];
              if (v12) {
                goto LABEL_10;
              }
              goto LABEL_17;
            }
          }
          v19 = v17;
          id v10 = v15;

          if (!v19) {
            goto LABEL_24;
          }
          -[_UIDynamicButton _updateWithHIDEvent:]((uint64_t)v19, (uint64_t)a3);
        }
        else
        {
LABEL_17:

LABEL_24:
          +[_UIDynamicButton _dynamicButtonFromHIDEvent:]((uint64_t)_UIDynamicButton, (uint64_t)a3);
          v19 = (_UIDynamicButton *)objc_claimAutoreleasedReturnValue();
          if (!v10) {
            id v10 = (id)objc_opt_new();
          }
          [v10 addObject:v19];
          [(NSMapTable *)self->_dynamicButtonsByWindow setObject:v10 forKey:v6];
          if (!v19)
          {
            unint64_t stageTransition = 0;
            int v20 = 1;
LABEL_28:
            if ((IOHIDEventGetPhase() & 8) != 0)
            {
              if (stageTransition != 2)
              {
                v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("DynamicButton", &qword_1EB25E778) + 8);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&buf[4] = a3;
                  _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Bug in provider of dynamic button HID event: event has the cancel phase bit set but is not an exit stage transition: %{public}@", buf, 0xCu);
                }
              }
              uint64_t v22 = 4;
            }
            else
            {
              uint64_t v22 = 3;
              if (stageTransition != 2) {
                uint64_t v22 = 1;
              }
              if (stageTransition == 1) {
                uint64_t v22 = 0;
              }
            }
            if ((v20 & 1) == 0) {
              v19->_phase = v22;
            }
            uint64_t v24 = [(NSMapTable *)self->_deliveryTableByDynamicButton objectForKey:v19];
            if (v24)
            {
              v25 = (_UIDynamicButtonDeliveryTable *)v24;
            }
            else
            {
              v25 = [_UIDynamicButtonDeliveryTable alloc];
              if (v25)
              {
                if (v20)
                {
                  v65 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v65 handleFailureInMethod:sel_initWithDynamicButton_, v25, @"_UIDynamicButtonEvent.m", 111, @"Invalid parameter not satisfying: %@", @"dynamicButton" object file lineNumber description];
                }
                *(void *)buf = v25;
                *(void *)&buf[8] = _UIDynamicButtonDeliveryTable;
                v26 = (_UIDynamicButtonDeliveryTable *)objc_msgSendSuper2((objc_super *)buf, sel_init);
                v25 = v26;
                if (v26)
                {
                  objc_storeStrong((id *)&v26->_dynamicButton, v19);
                  uint64_t v27 = objc_opt_new();
                  beginningGestureRecognizers = v25->_beginningGestureRecognizers;
                  v25->_beginningGestureRecognizers = (NSMutableSet *)v27;

                  uint64_t v29 = objc_opt_new();
                  updatingGestureRecognizers = v25->_updatingGestureRecognizers;
                  v25->_updatingGestureRecognizers = (NSMutableSet *)v29;

                  uint64_t v31 = objc_opt_new();
                  endingGestureRecognizers = v25->_endingGestureRecognizers;
                  v25->_endingGestureRecognizers = (NSMutableSet *)v31;

                  uint64_t v33 = objc_opt_new();
                  cancellingGestureRecognizers = v25->_cancellingGestureRecognizers;
                  v25->_cancellingGestureRecognizers = (NSMutableSet *)v33;
                }
              }
              [(NSMapTable *)self->_deliveryTableByDynamicButton setObject:v25 forKey:v19];
              if (!v25) {
                goto LABEL_91;
              }
            }
            uint64_t v35 = [(_UIDynamicButton *)v25->_dynamicButton _phase];
            switch(v35)
            {
              case 0:
                v67 = v19;
                id v68 = v10;
                id v37 = [(_UIDynamicButton *)v25->_dynamicButton _window];
                v38 = [v37 _windowHostingScene];
                v39 = [v38 _physicalButtonInteractionArbiter];

                if (!v39) {
                  goto LABEL_68;
                }
                v40 = -[_UIPhysicalButtonInteractionArbiter _gestureViewsForWindow:physicalButton:]((uint64_t)v39, (uint64_t)v37, [(_UIDynamicButton *)v25->_dynamicButton _physicalButton]);
                v41 = (void *)[v40 mutableCopy];

                v42 = v6;
                if (qword_1EB25E7B0 != -1) {
                  dispatch_once(&qword_1EB25E7B0, &__block_literal_global_172_1);
                }
                if (_MergedGlobals_23_4)
                {
                  v43 = [v37 _responderForKeyEvents];
                  if (objc_msgSend(v43, "__isKindOfUIRemoteViewController"))
                  {
                    uint64_t v44 = [v43 view];

                    v43 = (void *)v44;
                  }
                  if (v43)
                  {
                    do
                    {
                      if (_IsKindOfUIView((uint64_t)v43)
                        && ([v41 containsObject:v43] & 1) == 0
                        && -[UIView _isInVisibleHierarchy]((uint64_t)v43))
                      {
                        [v41 addObject:v43];
                      }
                      uint64_t v45 = [v43 nextResponder];

                      v43 = (void *)v45;
                    }
                    while (v45);
                  }
                }
                v6 = v42;
                if (v41)
                {
                  v46 = (void *)[v41 copy];
                }
                else
                {
LABEL_68:
                  v46 = objc_opt_new();
                }

                if ([v46 count])
                {
                  v66 = v6;
                  long long v81 = 0u;
                  long long v82 = 0u;
                  long long v79 = 0u;
                  long long v80 = 0u;
                  obuint64_t j = v46;
                  uint64_t v47 = [obj countByEnumeratingWithState:&v79 objects:buf count:16];
                  if (v47)
                  {
                    uint64_t v48 = v47;
                    uint64_t v49 = *(void *)v80;
                    do
                    {
                      for (uint64_t i = 0; i != v48; ++i)
                      {
                        if (*(void *)v80 != v49) {
                          objc_enumerationMutation(obj);
                        }
                        v51 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                        long long v75 = 0u;
                        long long v76 = 0u;
                        long long v77 = 0u;
                        long long v78 = 0u;
                        v52 = [v51 gestureRecognizers];
                        uint64_t v53 = [v52 countByEnumeratingWithState:&v75 objects:v84 count:16];
                        if (v53)
                        {
                          uint64_t v54 = v53;
                          uint64_t v55 = *(void *)v76;
                          do
                          {
                            for (uint64_t j = 0; j != v54; ++j)
                            {
                              if (*(void *)v76 != v55) {
                                objc_enumerationMutation(v52);
                              }
                              v57 = *(void **)(*((void *)&v75 + 1) + 8 * j);
                              if ([v57 isEnabled]
                                && [v57 state] <= 2
                                && -[UIGestureRecognizer _shouldReceiveDynamicButton:forEvent:]((uint64_t)v57, (uint64_t)v25->_dynamicButton, (uint64_t)self))
                              {
                                [(NSMutableSet *)v25->_beginningGestureRecognizers addObject:v57];
                              }
                            }
                            uint64_t v54 = [v52 countByEnumeratingWithState:&v75 objects:v84 count:16];
                          }
                          while (v54);
                        }
                      }
                      uint64_t v48 = [obj countByEnumeratingWithState:&v79 objects:buf count:16];
                    }
                    while (v48);
                  }

                  v6 = v66;
                }
                else
                {
                }
                v19 = v67;
                id v10 = v68;
                goto LABEL_91;
              case 3:
                v36 = v25->_endingGestureRecognizers;
                break;
              case 4:
                v36 = v25->_cancellingGestureRecognizers;
                break;
              default:
LABEL_91:
                unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("DynamicButton", &qword_1EB25E780);
                if (*(unsigned char *)CategoryCachedImpl)
                {
                  v61 = *(NSObject **)(CategoryCachedImpl + 8);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                  {
                    v62 = v61;
                    v63 = [(_UIDynamicButton *)v19 debugDescription];
                    *(_DWORD *)buf = 138412290;
                    *(void *)&buf[4] = v63;
                    _os_log_impl(&dword_1853B0000, v62, OS_LOG_TYPE_ERROR, "Dynamic button for dispatch: %@", buf, 0xCu);
                  }
                }

LABEL_93:
LABEL_94:
                dynamicButtonForDispatch = self->_dynamicButtonForDispatch;
                self->_dynamicButtonForDispatch = v19;

                return;
            }
            [(NSMutableSet *)v36 unionSet:v25->_updatingGestureRecognizers];
            [(NSMutableSet *)v25->_updatingGestureRecognizers removeAllObjects];
            goto LABEL_91;
          }
        }
        int v20 = 0;
        unint64_t stageTransition = v19->_stageTransition;
        goto LABEL_28;
      }
    }
    v19 = 0;
    goto LABEL_94;
  }
}

- (id)_allWindows
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMapTable *)self->_dynamicButtonsByWindow keyEnumerator];
  v4 = [v3 allObjects];
  objc_super v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)_dispatchWindows
{
  v2 = [(_UIDynamicButton *)self->_dynamicButtonForDispatch _window];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = -[NSMapTable objectForKey:](self->_dynamicButtonsByWindow, "objectForKey:", a3, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(NSMapTable *)self->_deliveryTableByDynamicButton objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        uint64_t v12 = -[_UIDynamicButtonDeliveryTable gestureRecognizers](v11);
        [v5 unionSet:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("DynamicButton", &qword_1EB25E788);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    long long v14 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = v14;
      long long v16 = [a3 _briefDescription];
      int v29 = 138412546;
      v30 = v16;
      __int16 v31 = 2112;
      v32 = self;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Sending dynamic button event to: %@; \n%@",
        (uint8_t *)&v29,
        0x16u);
    }
  }
  uint64_t v6 = [(NSMapTable *)self->_deliveryTableByDynamicButton objectForKey:self->_dynamicButtonForDispatch];
  uint64_t v7 = v6;
  if (v6)
  {
    if ([*(id *)(v6 + 32) containsObject:a3])
    {
      [*(id *)(v7 + 32) removeObject:a3];
      uint64_t v8 = (_UIDynamicButtonEvent *)objc_opt_new();
      [(_UIDynamicButtonEvent *)v8 addObject:*(void *)(v7 + 40)];
      if (v8)
      {
        unint64_t v9 = __UILogGetCategoryCachedImpl("DynamicButton", &qword_1EB25E7A8);
        if (*(unsigned char *)v9)
        {
          long long v17 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            uint64_t v19 = [a3 _briefDescription];
            int v29 = 138412546;
            v30 = v19;
            __int16 v31 = 2112;
            v32 = v8;
            _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Sending dynamicButtonsCancelled to: %@; \n%@",
              (uint8_t *)&v29,
              0x16u);
          }
        }
        [a3 _componentsCancelled:v8 withEvent:self];
LABEL_19:
      }
    }
    else if ([*(id *)(v7 + 24) containsObject:a3])
    {
      [*(id *)(v7 + 24) removeObject:a3];
      uint64_t v8 = (_UIDynamicButtonEvent *)objc_opt_new();
      [(_UIDynamicButtonEvent *)v8 addObject:*(void *)(v7 + 40)];
      if (v8)
      {
        unint64_t v10 = __UILogGetCategoryCachedImpl("DynamicButton", &qword_1EB25E7A0);
        if (*(unsigned char *)v10)
        {
          int v20 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = v20;
            uint64_t v22 = [a3 _briefDescription];
            int v29 = 138412546;
            v30 = v22;
            __int16 v31 = 2112;
            v32 = v8;
            _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Sending dynamicButtonsEnded to: %@; \n%@",
              (uint8_t *)&v29,
              0x16u);
          }
        }
        [a3 _componentsEnded:v8 withEvent:self];
        goto LABEL_19;
      }
    }
    else if ([*(id *)(v7 + 16) containsObject:a3])
    {
      uint64_t v8 = (_UIDynamicButtonEvent *)objc_opt_new();
      [(_UIDynamicButtonEvent *)v8 addObject:*(void *)(v7 + 40)];
      if (v8)
      {
        unint64_t v11 = __UILogGetCategoryCachedImpl("DynamicButton", &qword_1EB25E798);
        if (*(unsigned char *)v11)
        {
          v23 = *(NSObject **)(v11 + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = v23;
            v25 = [a3 _briefDescription];
            int v29 = 138412546;
            v30 = v25;
            __int16 v31 = 2112;
            v32 = v8;
            _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Sending dynamicButtonsChanged to: %@; \n%@",
              (uint8_t *)&v29,
              0x16u);
          }
        }
        [a3 _componentsChanged:v8 withEvent:self];
        goto LABEL_19;
      }
    }
    else if ([*(id *)(v7 + 8) containsObject:a3])
    {
      [*(id *)(v7 + 8) removeObject:a3];
      [*(id *)(v7 + 16) addObject:a3];
      uint64_t v8 = (_UIDynamicButtonEvent *)objc_opt_new();
      [(_UIDynamicButtonEvent *)v8 addObject:*(void *)(v7 + 40)];
      if (v8)
      {
        unint64_t v12 = __UILogGetCategoryCachedImpl("DynamicButton", &qword_1EB25E790);
        if (*(unsigned char *)v12)
        {
          v26 = *(NSObject **)(v12 + 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = v26;
            v28 = [a3 _briefDescription];
            int v29 = 138412546;
            v30 = v28;
            __int16 v31 = 2112;
            v32 = v8;
            _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Sending dynamicButtonsBegan to: %@; \n%@",
              (uint8_t *)&v29,
              0x16u);
          }
        }
        [a3 _componentsBegan:v8 withEvent:self];
        goto LABEL_19;
      }
    }
  }

  return 1;
}

- (void)_cleanupAfterDispatch
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDynamicButtonEvent;
  [(UIEvent *)&v7 _cleanupAfterDispatch];
  if ([(_UIDynamicButton *)self->_dynamicButtonForDispatch _phase] > 1)
  {
    [(NSMapTable *)self->_deliveryTableByDynamicButton removeObjectForKey:self->_dynamicButtonForDispatch];
    v4 = [(_UIDynamicButton *)self->_dynamicButtonForDispatch _window];
    objc_super v5 = [(NSMapTable *)self->_dynamicButtonsByWindow objectForKey:v4];
    [v5 removeObject:self->_dynamicButtonForDispatch];
    if (![v5 count]) {
      [(NSMapTable *)self->_dynamicButtonsByWindow removeObjectForKey:v4];
    }
    -[UIBackgroundConfiguration _setCustomView:]((uint64_t)self->_dynamicButtonForDispatch, 0);
  }
  else
  {
    dynamicButtonForDispatch = self->_dynamicButtonForDispatch;
    if (dynamicButtonForDispatch) {
      dynamicButtonForDispatch->_phase = 2;
    }
  }
  uint64_t v6 = self->_dynamicButtonForDispatch;
  self->_dynamicButtonForDispatch = 0;
}

- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = self->_deliveryTableByDynamicButton;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [(_UIDynamicButtonEvent *)self _removeGestureRecognizer:a3 fromComponents:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSSet)_allDynamicButtons
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_deliveryTableByDynamicButton;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = (void *)[v3 copy];
  return (NSSet *)v9;
}

- (id)_componentsForGestureRecognizer:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = self->_deliveryTableByDynamicButton;
    uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          long long v11 = [(NSMapTable *)self->_deliveryTableByDynamicButton objectForKey:v10];
          long long v12 = -[_UIDynamicButtonDeliveryTable gestureRecognizers](v11);
          int v13 = [v12 containsObject:a3];

          if (v13) {
            [v16 addObject:v10];
          }
        }
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    long long v14 = (void *)[v16 copy];
  }
  else
  {
    long long v14 = 0;
  }
  return v14;
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    unint64_t v10 = 0x1E4F28000uLL;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        uint64_t v13 = [v12 _eventComponentType];
        if (v13 != 2)
        {
          uint64_t v16 = v13;
          long long v17 = [*(id *)(v10 + 2816) currentHandler];
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIDynamicButtonEvent.m", 541, @"Wrong component type for event: %@; component: %lu",
            self,
            v16);

          unint64_t v10 = 0x1E4F28000;
        }
        uint64_t v14 = [(NSMapTable *)self->_deliveryTableByDynamicButton objectForKey:v12];
        long long v15 = (id *)v14;
        if (v14)
        {
          [*(id *)(v14 + 8) removeObject:a3];
          [v15[2] removeObject:a3];
          [v15[3] removeObject:a3];
          [v15[4] removeObject:a3];
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (id)_componentsForWindow:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_dynamicButtonsByWindow objectForKey:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)_removeComponents:(int)a3 withCancellation:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obuint64_t j = a2;
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v5) {
      goto LABEL_17;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        if ([v9 _eventComponentType] == 2)
        {
          if (!a3) {
            goto LABEL_10;
          }
LABEL_9:
          unint64_t v10 = [a1[16] objectForKey:v9];
          uint64_t v11 = -[_UIDynamicButtonDeliveryTable gestureRecognizers](v10);
          [a1 _removeGestureRecognizersSendingCancelledEvent:v11];

          goto LABEL_10;
        }
        uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeComponents_withCancellation_, a1, @"_UIDynamicButtonEvent.m", 555, @"Unexpected component type: %ld", objc_msgSend(v9, "_eventComponentType"));

        if (a3) {
          goto LABEL_9;
        }
LABEL_10:
        long long v12 = [v9 _window];
        uint64_t v13 = [a1[15] objectForKey:v12];
        [v13 removeObject:v9];
        if (![v13 count]) {
          [a1[15] removeObjectForKey:v12];
        }
        [a1[16] removeObjectForKey:v9];
        -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v9, 0);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v15 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v15;
      if (!v15)
      {
LABEL_17:

        return;
      }
    }
  }
}

- (id)_removeComponentsForWindow:(id *)result withCancellation:(uint64_t)a2
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = [result _componentsForWindow:a2];
    -[_UIDynamicButtonEvent _removeComponents:withCancellation:](v3, v4, 1);

    id v5 = v3[15];
    return (id *)[v5 removeObjectForKey:a2];
  }
  return result;
}

- (void)_removeComponents:(id)a3
{
}

- (void)_cancelComponents:(id)a3
{
}

- (void)_windowDidDetachContext:(id)a3
{
  id v7 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 object];

    if (!v5) {
      return;
    }
    -[_UIDynamicButtonEvent _removeComponentsForWindow:withCancellation:]((id *)&self->super.super.isa, v5);
    uint64_t v6 = (void *)v5;
  }
  else
  {
    uint64_t v6 = v7;
  }
}

- (void)_windowDidBecomeHidden:(id)a3
{
  id v7 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 object];

    if (!v5) {
      return;
    }
    -[_UIDynamicButtonEvent _removeComponentsForWindow:withCancellation:]((id *)&self->super.super.isa, v5);
    uint64_t v6 = (void *)v5;
  }
  else
  {
    uint64_t v6 = v7;
  }
}

- (uint64_t)_appendDescriptionToStream:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [a2 appendProem:result block:&__block_literal_global_678];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_2;
    v4[3] = &unk_1E52D9F98;
    v4[4] = a2;
    v4[5] = v3;
    return [a2 appendBodySectionWithName:0 block:v4];
  }
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = a3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v12 = v7;

  if (v12)
  {
    -[_UIDynamicButtonEvent _appendDescriptionToStream:]((uint64_t)self, v12);
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v6;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v10 = v9;
      }
      else {
        unint64_t v10 = 0;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      -[_UIDynamicButtonEvent _appendDescriptionToBuilder:](self, v11);
    }
    else if (self)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __61___UIDynamicButtonEvent__appendSimpleDescriptionToFormatter___block_invoke;
      v13[3] = &unk_1E52D9F98;
      v13[4] = v9;
      v13[5] = self;
      [v9 appendProem:self block:v13];
    }
  }
}

- (id)_appendDescriptionToBuilder:(id)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke;
    v2[3] = &unk_1E52D9F98;
    v2[4] = a2;
    v2[5] = result;
    return (id)[a2 modifyBody:v2];
  }
  return result;
}

- (id)succinctDescription
{
  v2 = [(_UIDynamicButtonEvent *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  -[_UIDynamicButtonEvent _appendDescriptionToBuilder:](self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIDynamicButtonEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIDynamicButtonEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_new();
  -[_UIDynamicButtonEvent _appendDescriptionToStream:]((uint64_t)self, v3);
  v4 = [v3 description];

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIDynamicButtonEvent *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicButtonForDispatch, 0);
  objc_storeStrong((id *)&self->_deliveryTableByDynamicButton, 0);
  objc_storeStrong((id *)&self->_dynamicButtonsByWindow, 0);
}

@end