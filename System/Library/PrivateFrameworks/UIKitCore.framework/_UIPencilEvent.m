@interface _UIPencilEvent
- (NSString)debugDescription;
- (id)_cloneEvent;
- (id)_init;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)registerInteraction:(uint64_t)a1;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)subtype;
- (int64_t)type;
- (uint64_t)_cancelAndRemoveAllDescriptorsAndInteractions;
- (uint64_t)_shouldCollectInteraction:(int)a3 consultingInteraction:(void *)a4 constrainedToWindow:;
- (uint64_t)windowHasRegisteredInteractionsWantingFocus:(uint64_t)a1;
- (void)_cancelAndRemoveInteractionsInAllDeliveryRecordsFromFilter:(uint64_t)a1;
- (void)_cleanupAfterDispatch;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
- (void)dealloc;
- (void)sendToInteractions;
- (void)unregisterAllInteractionsForWindow:(uint64_t)a1;
@end

@implementation _UIPencilEvent

- (uint64_t)windowHasRegisteredInteractionsWantingFocus:(uint64_t)a1
{
  if (!a1 || !*(void *)(a1 + 176)) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F29238] valueWithPointer:a2];
  uint64_t v4 = [*(id *)(a1 + 176) containsObject:v3];

  return v4;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)_UIPencilEvent;
  v2 = [(UIEvent *)&v11 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:512];
    uint64_t v4 = (void *)v2[23];
    v2[23] = v3;

    v2[20] = 0x7FF8000000000000;
    v5 = [UINotificationFeedbackGenerator alloc];
    v6 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1ED3F6438];
    v7 = +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:v6];
    uint64_t v8 = [(UIFeedbackGenerator *)v5 initWithConfiguration:v7];
    v9 = (void *)v2[18];
    v2[18] = v8;
  }
  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIPencilEvent;
  [(UIEvent *)&v3 dealloc];
}

- (id)registerInteraction:(uint64_t)a1
{
  v71[2] = *(id *)MEMORY[0x1E4F143B8];
  if (!a1) {
    goto LABEL_4;
  }
  if ([*(id *)(a1 + 168) containsObject:a2])
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerInteraction_, a1, @"_UIPencilEvent.m", 448, @"%s: Interaction is already registered with event: interaction: %@; event: %@",
      "-[_UIPencilEvent registerInteraction:]",
      a2,
      a1);

LABEL_4:
    id v5 = 0;
    goto LABEL_26;
  }
  v6 = [(id)a2 view];
  v7 = [v6 _window];
  if (!a2
    || (*(char *)(a2 + 8) < 0
      ? (uint64_t v8 = *(void *)(a2 + 32))
      : (uint64_t v8 = [(id)a2 _dispatchBehavior], *(void *)(a2 + 32) = v8),
        v8 != 2))
  {
    v9 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
    v10 = *(void **)(a1 + 176);
    if (!v10)
    {
      uint64_t v11 = objc_opt_new();
      v12 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v11;

      v10 = *(void **)(a1 + 176);
    }
    [v10 addObject:v9];
  }
  objc_initWeak(&location, (id)a1);
  objc_initWeak(&from, (id)a2);
  uint64_t v13 = ++qword_1E8FF62F0;
  v14 = (objc_class *)objc_opt_class();
  v62 = objc_msgSend(NSString, "stringWithFormat:", @"%s-%p-%lu", class_getName(v14), a2, v13);
  v15 = NSString;
  v16 = (id *)(id)a1;
  v17 = NSString;
  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  v20 = [v17 stringWithFormat:@"<%@: %p>", v19, v16];

  v21 = [v15 stringWithFormat:@"Registering interaction with: %@", v20];

  id v22 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v23 = MEMORY[0x1E4F14428];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __38___UIPencilEvent_registerInteraction___block_invoke;
  v63[3] = &unk_1E53040F0;
  objc_copyWeak(&v64, &location);
  objc_copyWeak(&v65, &from);
  v63[4] = a2;
  v61 = (void *)[v22 initWithIdentifier:v62 forReason:v21 queue:MEMORY[0x1E4F14428] invalidationBlock:v63];

  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PencilInteraction", &qword_1E8FF62E8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v42 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v43 = (id)a2;
      v59 = v42;
      if (a2)
      {
        v44 = NSString;
        v45 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v45);
        v47 = [v44 stringWithFormat:@"<%@: %p>", v46, v43];
      }
      else
      {
        v47 = @"(nil)";
      }

      v60 = v47;
      id v48 = [v43 view];
      if (v48)
      {
        v49 = NSString;
        v50 = (objc_class *)objc_opt_class();
        v51 = NSStringFromClass(v50);
        v52 = [v49 stringWithFormat:@"<%@: %p>", v51, v48];
      }
      else
      {
        v52 = @"(nil)";
      }

      v58 = v52;
      v53 = v16;
      v54 = NSString;
      v55 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v55);
      v57 = [v54 stringWithFormat:@"<%@: %p>", v56, v53];

      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      v70 = v57;
      _os_log_impl(&dword_1853B0000, v59, OS_LOG_TYPE_ERROR, "Registering interaction: %@; from view: %@; with event: %@",
        buf,
        0x20u);

      v42 = v59;
    }
  }
  id v25 = v16[21];
  if (!v25)
  {
    uint64_t v26 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v27 = v16[21];
    v16[21] = (id)v26;

    id v25 = v16[21];
  }
  [v25 addObject:a2];
  if (!v16[17] && [v16[21] count])
  {
    v28 = [v16[21] anyObject];
    v29 = [v28 view];
    v30 = [v29 _window];
    v31 = [v30 _windowHostingScene];

    objc_initWeak(&v68, v16);
    v32 = NSString;
    v33 = [v31 _sceneIdentifier];
    v34 = [v32 stringWithFormat:@"UIKit - PencilEvent - %@", v33];

    id v35 = MEMORY[0x1E4F14428];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __50___UIPencilEvent__registerForStateCaptureIfNeeded__block_invoke;
    v70 = &unk_1E52DD088;
    objc_copyWeak(v71, &v68);
    uint64_t v36 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
    id v37 = v16[17];
    v16[17] = (id)v36;

    objc_destroyWeak(v71);
    objc_destroyWeak(&v68);
  }
  if (!a2
    || (*(char *)(a2 + 8) < 0
      ? (uint64_t v38 = *(void *)(a2 + 32))
      : (uint64_t v38 = [(id)a2 _dispatchBehavior], *(void *)(a2 + 32) = v38),
        v38 != 2))
  {
    v39 = [(id)a2 view];
    v40 = [v39 _window];
    _UIPencilEventRequestBarrelFocusIfAbleForWindow(v40, 0);
  }
  id v5 = v61;
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v64);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_26:
  return v5;
}

- (void)unregisterAllInteractionsForWindow:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v3 = objc_msgSend(*(id *)(a1 + 168), "copy", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          v9 = [v8 view];
          v10 = [v9 _window];

          if (v10 == a2) {
            -[UIPencilInteraction _unregisterFromEvent]((uint64_t)v8);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

- (void)_cancelAndRemoveInteractionsInAllDeliveryRecordsFromFilter:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = *(void *)(a1 + 152);
  uint64_t v21 = *(void *)(a1 + 128);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 184);
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v23 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        v7 = *(_DWORD **)(*((void *)&v24 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(a1 + 184) objectForKey:v7];
        v9 = (id *)v8;
        if (v8)
        {
          id v10 = *(id *)(v8 + 16);
          long long v11 = (void *)[v9[2] copy];
        }
        else
        {
          id v10 = 0;
          long long v11 = 0;
        }
        long long v12 = (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v11);

        if (v12 && [v12 count])
        {
          if (!v7) {
            goto LABEL_14;
          }
          int v13 = v7[6];
          uint64_t v14 = 251;
          if (v13 != 5) {
            uint64_t v14 = 0;
          }
          if (!v13) {
LABEL_14:
          }
            uint64_t v14 = 250;
          *(void *)(a1 + 128) = v14;
          *(void *)(a1 + 152) = 4;
          objc_storeStrong((id *)(a1 + 192), v7);
          uint64_t v15 = [v12 allObjects];
          uint64_t v16 = *(void **)(a1 + 200);
          *(void *)(a1 + 200) = v15;

          -[_UIPencilEvent sendToInteractions](a1);
          v17 = *(void **)(a1 + 192);
          *(void *)(a1 + 192) = 0;

          v18 = *(void **)(a1 + 200);
          *(void *)(a1 + 200) = 0;

          [v10 minusSet:v12];
        }

        ++v6;
      }
      while (v5 != v6);
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v5 = v19;
    }
    while (v19);
  }

  *(void *)(a1 + 128) = v21;
  *(void *)(a1 + 152) = v20;
}

- (void)sendToInteractions
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v2 = *(id *)(a1 + 200);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      char v5 = 0;
      uint64_t v6 = *(void *)v27;
      unint64_t v7 = 0x1E4F29000uLL;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * v8);
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PencilInteraction", &sendToInteractions___s_category);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            log = *(id *)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              uint64_t v21 = *(void **)(v7 + 24);
              id v12 = (id)a1;
              int v13 = (objc_class *)objc_opt_class();
              uint64_t v19 = NSStringFromClass(v13);
              id v22 = [v21 stringWithFormat:@"<%@: %p>", v19, v12];

              id v14 = v22;
              if (v9)
              {
                uint64_t v23 = NSString;
                id v20 = v14;
                id v15 = (id)v9;
                uint64_t v16 = (objc_class *)objc_opt_class();
                v18 = NSStringFromClass(v16);
                long long v24 = [v23 stringWithFormat:@"<%@: %p>", v18, v15];

                id v14 = v20;
              }
              else
              {
                long long v24 = @"(nil)";
              }
              *(_DWORD *)buf = 138412546;
              id v31 = v14;
              __int16 v32 = 2112;
              v33 = v24;
              _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Sending %@ to %@", buf, 0x16u);

              unint64_t v7 = 0x1E4F29000;
            }
          }
          -[UIPencilInteraction _performCallbacksWithEvent:]((unsigned char *)v9, (void *)a1);
          if (v9)
          {
            if (*(char *)(v9 + 8) < 0)
            {
              uint64_t v11 = *(void *)(v9 + 32);
            }
            else
            {
              uint64_t v11 = [(id)v9 _dispatchBehavior];
              *(void *)(v9 + 32) = v11;
            }
          }
          else
          {
            uint64_t v11 = 0;
          }
          v5 |= v11 != 2;
          ++v8;
        }
        while (v4 != v8);
        uint64_t v17 = [v2 countByEnumeratingWithState:&v26 objects:v34 count:16];
        uint64_t v4 = v17;
      }
      while (v17);

      if ((v5 & 1) != 0 && *(void *)(a1 + 128) == 250)
      {
        if (*(void *)(a1 + 120)) {
          [*(id *)(a1 + 144) _privateNotificationOccurred:1023 atLocation:1.79769313e308 senderID:1.79769313e308];
        }
      }
    }
    else
    {
    }
  }
}

- (uint64_t)_cancelAndRemoveAllDescriptorsAndInteractions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (id *)result;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PencilInteraction", &_cancelAndRemoveAllDescriptorsAndInteractions___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v3 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = NSString;
        char v5 = v1;
        uint64_t v6 = v3;
        unint64_t v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = NSStringFromClass(v7);
        uint64_t v9 = [v4 stringWithFormat:@"<%@: %p>", v8, v5];

        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Cancelling and removing all interactions from event: %@", buf, 0xCu);
      }
    }
    -[_UIPencilEvent _cancelAndRemoveInteractionsInAllDeliveryRecordsFromFilter:]((uint64_t)v1, (uint64_t)&__block_literal_global_55_3);
    return [v1[23] removeAllObjects];
  }
  return result;
}

- (uint64_t)_shouldCollectInteraction:(int)a3 consultingInteraction:(void *)a4 constrainedToWindow:
{
  if (!a1 || ![a2 isEnabled]) {
    return 0;
  }
  if (a4)
  {
    uint64_t v4 = [a2 view];
    uint64_t v9 = [v4 _window];
    if ((void *)v9 != a4)
    {
      uint64_t v10 = 0;
      a4 = (void *)v9;
LABEL_11:

      return v10;
    }
  }
  uint64_t v11 = [a2 view];
  uint64_t v10 = -[UIView _isInVisibleHierarchy]((uint64_t)v11);
  if (v10 && a3) {
    uint64_t v10 = -[UIPencilInteraction _internalShouldReceiveEvent:](a2, a1);
  }

  if (a4) {
    goto LABEL_11;
  }
  return v10;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v69.receiver = self;
    v69.super_class = (Class)_UIPencilEvent;
    -[UIEvent _setHIDEvent:](&v69, sel__setHIDEvent_);
    return;
  }
  if (!_UIEventHIDIsPencilBarrelEvent())
  {
    id v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"_UIPencilEvent.m", 752, @"Invalid hidEvent type for %@: %@", objc_opt_class(), a3 object file lineNumber description];

    return;
  }
  v69.receiver = self;
  v69.super_class = (Class)_UIPencilEvent;
  [(UIEvent *)&v69 _setHIDEvent:a3];
  int IntegerValue = IOHIDEventGetIntegerValue();
  unint64_t SenderID = IOHIDEventGetSenderID();
  int64_t v8 = 251;
  if (IntegerValue != 5) {
    int64_t v8 = 0;
  }
  if (!IntegerValue) {
    int64_t v8 = 250;
  }
  self->_senderID = SenderID;
  self->_int64_t subtype = v8;
  if (IntegerValue != 5)
  {
LABEL_16:
    unint64_t v10 = 3;
    goto LABEL_19;
  }
  unsigned int Phase = IOHIDEventGetPhase();
  if (Phase)
  {
    unint64_t v10 = 1;
  }
  else
  {
    if ((Phase & 2) == 0)
    {
      if ((Phase & 4) == 0)
      {
        unint64_t v10 = (Phase >> 1) & 4;
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    unint64_t v10 = 2;
  }
LABEL_19:
  self->_phase = v10;
  if (!_os_feature_enabled_impl())
  {
    if (_UIEventHIDGetChildVendorDefinedForceStageEvent((uint64_t)a3))
    {
      double v11 = *(double *)(IOHIDEventGetDataValue() + 40);
      goto LABEL_25;
    }
LABEL_24:
    double v11 = NAN;
    goto LABEL_25;
  }
  if (!_UIEventHIDGetChildForceStageEvent((uint64_t)a3)) {
    goto LABEL_24;
  }
  IOHIDEventGetDoubleValue();
LABEL_25:
  self->_normalizedForceVelocity = v11;
  uint64_t v12 = _UIEventHIDUIWindowForHIDEvent();
  if ([v12 _isSystemGestureWindow]) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;
  id v15 = 0;
  if (self->_registeredInteractions && self->_subtype == 251)
  {
    id v64 = v12;
    int Type = IOHIDEventGetType();
    uint64_t v17 = IOHIDEventGetSenderID();
    v63 = a3;
    int v18 = IOHIDEventGetIntegerValue();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v19 = self->_deliveryRecordsByDescriptor;
    uint64_t v20 = [(NSMapTable *)v19 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v79;
      if (Type) {
        BOOL v23 = 0;
      }
      else {
        BOOL v23 = v17 == 0;
      }
      char v24 = v23;
      char v65 = v24;
LABEL_38:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v79 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v26 = *(void *)(*((void *)&v78 + 1) + 8 * v25);
        if (v26)
        {
          if (*(_DWORD *)(v26 + 8) == Type && *(void *)(v26 + 16) == v17)
          {
            int v27 = *(_DWORD *)(v26 + 24);
            goto LABEL_45;
          }
        }
        else if (v65)
        {
          int v27 = 0;
LABEL_45:
          if (v27 == v18)
          {
            v30 = &OBJC_IVAR___UIAction_stateObservers;
            v66 = (_UIGenericGestureHIDEventDescriptor *)(id)v26;
            long long v29 = -[NSMapTable objectForKey:](self->_deliveryRecordsByDescriptor, "objectForKey:");

            if (v26) {
              goto LABEL_54;
            }
            goto LABEL_53;
          }
        }
        if (v21 == ++v25)
        {
          uint64_t v28 = [(NSMapTable *)v19 countByEnumeratingWithState:&v78 objects:v84 count:16];
          uint64_t v21 = v28;
          if (v28) {
            goto LABEL_38;
          }
          break;
        }
      }
    }

    long long v29 = 0;
    v30 = &OBJC_IVAR___UIAction_stateObservers;
LABEL_53:
    uint64_t v31 = +[_UIGenericGestureHIDEventDescriptor descriptorWithEvent:v63];
    uint64_t v32 = objc_opt_new();

    v66 = (_UIGenericGestureHIDEventDescriptor *)v31;
    [*(id *)((char *)&self->super.super.isa + v30[597]) setObject:v32 forKey:v31];
    long long v29 = (void *)v32;
LABEL_54:
    if (self->_phase == 1)
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v33 = self->_registeredInteractions;
      uint64_t v34 = [(NSHashTable *)v33 countByEnumeratingWithState:&v74 objects:v83 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        char v36 = 0;
        id v68 = 0;
        uint64_t v37 = *(void *)v75;
        do
        {
          uint64_t v38 = 0;
          do
          {
            if (*(void *)v75 != v37) {
              objc_enumerationMutation(v33);
            }
            uint64_t v39 = *(void *)(*((void *)&v74 + 1) + 8 * v38);
            if (v39)
            {
              if (*(char *)(v39 + 8) < 0)
              {
                uint64_t v40 = *(void *)(v39 + 32);
              }
              else
              {
                uint64_t v40 = [*(id *)(*((void *)&v74 + 1) + 8 * v38) _dispatchBehavior];
                *(void *)(v39 + 32) = v40;
              }
            }
            else
            {
              uint64_t v40 = 0;
            }
            if (-[_UIPencilEvent _shouldCollectInteraction:consultingInteraction:constrainedToWindow:](self, (unsigned char *)v39, 1, v14))
            {
              if (v29) {
                v41 = (void *)v29[2];
              }
              else {
                v41 = 0;
              }
              [v41 addObject:v39];
              if ((v40 != 0) | v36 & 1)
              {
                if (v40 == 1)
                {
                  v42 = v68;
                  if (!v68) {
                    v42 = objc_opt_new();
                  }
                  id v68 = v42;
                  [v42 addObject:v39];
                }
              }
              else
              {
                char v36 = 1;
              }
            }
            ++v38;
          }
          while (v35 != v38);
          uint64_t v43 = [(NSHashTable *)v33 countByEnumeratingWithState:&v74 objects:v83 count:16];
          uint64_t v35 = v43;
        }
        while (v43);
      }
      else
      {
        char v36 = 0;
        id v68 = 0;
      }

      if (+[UIPencilInteraction preferredSqueezeAction] == 5
        && (v36 & 1) != 0
        && [v68 count])
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v44 = v68;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v71;
          do
          {
            uint64_t v48 = 0;
            do
            {
              if (*(void *)v71 != v47) {
                objc_enumerationMutation(v44);
              }
              if (v29) {
                v49 = (void *)v29[2];
              }
              else {
                v49 = 0;
              }
              [v49 removeObject:*(void *)(*((void *)&v70 + 1) + 8 * v48++)];
            }
            while (v46 != v48);
            uint64_t v50 = [v44 countByEnumeratingWithState:&v70 objects:v82 count:16];
            uint64_t v46 = v50;
          }
          while (v50);
        }
      }
    }

    uint64_t v12 = v64;
    id v15 = v66;
  }
  continuousEventDescriptorForDispatch = self->_continuousEventDescriptorForDispatch;
  self->_continuousEventDescriptorForDispatch = v15;

  uint64_t v52 = [(NSMapTable *)self->_deliveryRecordsByDescriptor objectForKey:self->_continuousEventDescriptorForDispatch];
  v53 = (void *)v52;
  if (v52)
  {
    *(void *)(v52 + 8) = self->_phase;
    v54 = *(void **)(v52 + 16);
  }
  else
  {
    v54 = 0;
  }
  id v55 = v54;
  v56 = [v55 allObjects];
  interactionsForDispatch = self->_interactionsForDispatch;
  self->_interactionsForDispatch = v56;

  if (!v53)
  {
    int64_t subtype = self->_subtype;
    if ([(NSHashTable *)self->_registeredInteractions count])
    {
      if (subtype != 251)
      {
        v59 = [(NSHashTable *)self->_registeredInteractions allObjects];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __89___UIPencilEvent__collectAllActiveInteractionsConstrainedToWindow_consultingInteraction___block_invoke;
        v84[3] = &unk_1E5304160;
        char v85 = 1;
        v84[4] = self;
        v84[5] = v14;
        v60 = [MEMORY[0x1E4F28F60] predicateWithBlock:v84];
        v61 = [v59 filteredArrayUsingPredicate:v60];

        v62 = self->_interactionsForDispatch;
        self->_interactionsForDispatch = v61;
      }
    }
  }
}

- (void)_cleanupAfterDispatch
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPencilEvent;
  [(UIEvent *)&v7 _cleanupAfterDispatch];
  if (self->_continuousEventDescriptorForDispatch)
  {
    uint64_t v3 = -[NSMapTable objectForKey:](self->_deliveryRecordsByDescriptor, "objectForKey:");
    uint64_t v4 = (void *)v3;
    if (v3 && (unint64_t)(*(void *)(v3 + 8) - 3) <= 1) {
      [(NSMapTable *)self->_deliveryRecordsByDescriptor removeObjectForKey:self->_continuousEventDescriptorForDispatch];
    }
  }
  self->_senderID = 0;
  self->_int64_t subtype = 0;
  self->_phase = 0;
  self->_normalizedForceVelocity = NAN;
  continuousEventDescriptorForDispatch = self->_continuousEventDescriptorForDispatch;
  self->_continuousEventDescriptorForDispatch = 0;

  interactionsForDispatch = self->_interactionsForDispatch;
  self->_interactionsForDispatch = 0;
}

- (int64_t)type
{
  return 13;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (id)_cloneEvent
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIPencilEvent *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  id v2 = [(_UIPencilEvent *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = v3;
  int64_t subtype = self->_subtype;
  uint64_t v6 = @"squeeze";
  objc_super v7 = @"(unknown)";
  if (subtype == 250) {
    objc_super v7 = @"tap";
  }
  if (subtype != 251) {
    uint64_t v6 = v7;
  }
  if (subtype) {
    int64_t v8 = v6;
  }
  else {
    int64_t v8 = @"none";
  }
  [v3 appendString:v8 withName:@"subtype"];
  unint64_t phase = self->_phase;
  if (phase > 4) {
    unint64_t v10 = @"(unknown)";
  }
  else {
    unint64_t v10 = off_1E5304188[phase];
  }
  [v4 appendString:v10 withName:@"phase"];
  if (os_variant_has_internal_diagnostics()) {
    id v13 = (id)[v4 appendFloat:@"normalizedForceVelocity" withName:1 decimalPrecision:self->_normalizedForceVelocity];
  }
  id v11 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSHashTable count](self->_registeredInteractions, "count"), @"registeredInteractions.count");
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPencilEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPencilEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  int64_t subtype = self->_subtype;
  objc_super v7 = @"squeeze";
  int64_t v8 = @"(unknown)";
  if (subtype == 250) {
    int64_t v8 = @"tap";
  }
  if (subtype != 251) {
    objc_super v7 = v8;
  }
  if (subtype) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = @"none";
  }
  [v5 appendString:v9 withName:@"subtype"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E52D9F98;
  id v10 = v5;
  id v15 = v10;
  uint64_t v16 = self;
  id v11 = (id)[v10 modifyBody:v14];
  id v12 = v10;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsForDispatch, 0);
  objc_storeStrong((id *)&self->_continuousEventDescriptorForDispatch, 0);
  objc_storeStrong((id *)&self->_deliveryRecordsByDescriptor, 0);
  objc_storeStrong((id *)&self->_countedWindowPointerWithInteractionsWantingFocus, 0);
  objc_storeStrong((id *)&self->_registeredInteractions, 0);
  objc_storeStrong((id *)&self->_doubleTapNotificationGenerator, 0);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
}

@end