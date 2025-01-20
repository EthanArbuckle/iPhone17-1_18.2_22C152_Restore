@interface _UIHoverTouchDeliveryTable
- (NSSet)gestureRecognizers;
- (UITouch)touch;
- (_UIHoverTouchDeliveryTable)initWithTouch:(id)a3;
- (int64_t)updateGestureRecognizerForDelivery:(id)a3;
- (void)_cancelAllGestureRecognizers;
- (void)removeGestureRecognizer:(id)a3;
- (void)updateForEvent:(id)a3 forcingHitTest:(BOOL)a4;
@end

@implementation _UIHoverTouchDeliveryTable

- (_UIHoverTouchDeliveryTable)initWithTouch:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIHoverEvent.m", 57, @"Invalid parameter not satisfying: %@", @"touch" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)_UIHoverTouchDeliveryTable;
  v7 = [(_UIHoverTouchDeliveryTable *)&v17 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_touch, a3);
    uint64_t v9 = objc_opt_new();
    beginningGestureRecognizers = v8->_beginningGestureRecognizers;
    v8->_beginningGestureRecognizers = (NSMutableSet *)v9;

    uint64_t v11 = objc_opt_new();
    updatingGestureRecognizers = v8->_updatingGestureRecognizers;
    v8->_updatingGestureRecognizers = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    exitingGestureRecognizers = v8->_exitingGestureRecognizers;
    v8->_exitingGestureRecognizers = (NSMutableSet *)v13;
  }
  return v8;
}

- (int64_t)updateGestureRecognizerForDelivery:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_exitingGestureRecognizers containsObject:v4])
  {
    [(NSMutableSet *)self->_exitingGestureRecognizers removeObject:v4];
    int64_t v5 = 7;
  }
  else if ([(NSMutableSet *)self->_updatingGestureRecognizers containsObject:v4])
  {
    int64_t v5 = 6;
  }
  else if ([(NSMutableSet *)self->_beginningGestureRecognizers containsObject:v4])
  {
    [(NSMutableSet *)self->_beginningGestureRecognizers removeObject:v4];
    [(NSMutableSet *)self->_updatingGestureRecognizers addObject:v4];
    int64_t v5 = 5;
  }
  else
  {
    int64_t v5 = 2;
  }

  return v5;
}

- (void)removeGestureRecognizer:(id)a3
{
  beginningGestureRecognizers = self->_beginningGestureRecognizers;
  id v5 = a3;
  [(NSMutableSet *)beginningGestureRecognizers removeObject:v5];
  [(NSMutableSet *)self->_updatingGestureRecognizers removeObject:v5];
  [(NSMutableSet *)self->_exitingGestureRecognizers removeObject:v5];
}

- (void)_cancelAllGestureRecognizers
{
  id v5 = [(_UIHoverTouchDeliveryTable *)self gestureRecognizers];
  [(NSMutableSet *)self->_beginningGestureRecognizers removeAllObjects];
  [(NSMutableSet *)self->_updatingGestureRecognizers removeAllObjects];
  [(NSMutableSet *)self->_exitingGestureRecognizers removeAllObjects];
  v3 = (void *)UIApp;
  id v4 = [v5 allObjects];
  [v3 _cancelGestureRecognizers:v4];
}

- (void)updateForEvent:(id)a3 forcingHitTest:(BOOL)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(id)UIApp _isSpringBoard];
  v66 = v6;
  if (_UIEventHIDGetDescendantPointerEvent([v6 _hidEvent]))
  {
    v8 = BKSHIDEventGetPointerAttributes();
    BOOL v9 = [v8 pointerState] == 4;
  }
  else
  {
    BOOL v9 = 0;
  }
  if (_UIApplicationIsExtension())
  {
    char MayVendViews = 1;
    if (!v7)
    {
LABEL_6:
      char v11 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    char MayVendViews = _UIApplicationMayVendViews();
    if (!v7) {
      goto LABEL_6;
    }
  }
  v12 = [(UITouch *)self->_touch window];
  if (v12)
  {
    uint64_t v13 = [(UITouch *)self->_touch window];
    char v11 = [v13 _constrainsHoverEventHitTesting];
  }
  else
  {
    char v11 = 0;
  }

LABEL_12:
  v14 = [(UITouch *)self->_touch _responder];
  UITouchPhase v15 = [(UITouch *)self->_touch phase];
  unint64_t v16 = v15 - 5;
  if ((unint64_t)(v15 - 5) > 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = -[UITouch _rehitTestWithEvent:constrainingToCurrentWindow:]((uint64_t)self->_touch, v66, v9 | MayVendViews | v11);
  }
  v65 = (void *)v17;
  BOOL v18 = v14 == (void *)v17 || v16 >= 2;
  BOOL v19 = 1;
  v72 = self;
  if (v18 && !a4)
  {
    if ([(NSMutableSet *)self->_beginningGestureRecognizers count])
    {
      BOOL v19 = 0;
    }
    else
    {
      BOOL v19 = [(NSMutableSet *)self->_updatingGestureRecognizers count] == 0;
      if (v19) {
        goto LABEL_41;
      }
    }
    if (v9 && ((v7 ^ 1) & 1) == 0)
    {
      v20 = [(UITouch *)self->_touch window];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v22 = objc_opt_new();
        [v22 unionSet:self->_beginningGestureRecognizers];
        [v22 unionSet:self->_updatingGestureRecognizers];
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v111 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v103;
          while (2)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v103 != v26) {
                objc_enumerationMutation(v23);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                BOOL v19 = 0;
                goto LABEL_38;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v102 objects:v111 count:16];
            if (v25) {
              continue;
            }
            break;
          }
          BOOL v19 = 1;
LABEL_38:
          self = v72;
        }
        else
        {
          BOOL v19 = 1;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
  }
LABEL_41:
  if (v15 == UITouchPhaseRegionExited)
  {
    [(NSMutableSet *)self->_exitingGestureRecognizers unionSet:self->_updatingGestureRecognizers];
    [(NSMutableSet *)self->_updatingGestureRecognizers removeAllObjects];
    goto LABEL_102;
  }
  char v28 = !v19;
  if (v16 > 1) {
    char v28 = 1;
  }
  if ((v28 & 1) == 0)
  {
    v64 = v14;
    [(UITouch *)self->_touch _setResponder:v65];
    [(NSMutableSet *)self->_exitingGestureRecognizers removeAllObjects];
    v29 = objc_opt_new();
    char v30 = [v66 _isPointerLocked];
    v75 = v29;
    if (v65)
    {
      char v31 = v30;
      id v32 = (id)MEMORY[0x1E4F143A8];
      id v33 = v65;
      char v69 = v30;
      id v67 = (id)MEMORY[0x1E4F143A8];
      do
      {
        aBlock[0] = v32;
        aBlock[1] = 3221225472;
        aBlock[2] = __60___UIHoverTouchDeliveryTable_updateForEvent_forcingHitTest___block_invoke;
        aBlock[3] = &unk_1E53040C8;
        char v101 = v31;
        id v98 = v29;
        v99 = self;
        id v34 = v66;
        id v100 = v34;
        v35 = (void (**)(void *, void))_Block_copy(aBlock);
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        v73 = v33;
        v36 = [v33 gestureRecognizers];
        uint64_t v37 = [v36 countByEnumeratingWithState:&v93 objects:v110 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v94;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v94 != v39) {
                objc_enumerationMutation(v36);
              }
              v35[2](v35, *(void *)(*((void *)&v93 + 1) + 8 * j));
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v93 objects:v110 count:16];
          }
          while (v38);
        }

        if (_os_feature_enabled_impl())
        {
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          -[UITabBarControllerSidebar _actualFooterContentConfiguration]((id *)v34);
          obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v41 = [obj countByEnumeratingWithState:&v89 objects:v109 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v90;
            do
            {
              for (uint64_t k = 0; k != v42; ++k)
              {
                if (*(void *)v90 != v43) {
                  objc_enumerationMutation(obj);
                }
                v45 = *(void **)(*((void *)&v89 + 1) + 8 * k);
                long long v85 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                long long v88 = 0u;
                v46 = [v45 _gestureRecognizersForEvent:v34];
                uint64_t v47 = [v46 countByEnumeratingWithState:&v85 objects:v108 count:16];
                if (v47)
                {
                  uint64_t v48 = v47;
                  uint64_t v49 = *(void *)v86;
                  do
                  {
                    for (uint64_t m = 0; m != v48; ++m)
                    {
                      if (*(void *)v86 != v49) {
                        objc_enumerationMutation(v46);
                      }
                      v35[2](v35, *(void *)(*((void *)&v85 + 1) + 8 * m));
                    }
                    uint64_t v48 = [v46 countByEnumeratingWithState:&v85 objects:v108 count:16];
                  }
                  while (v48);
                }
              }
              uint64_t v42 = [obj countByEnumeratingWithState:&v89 objects:v109 count:16];
            }
            while (v42);
          }

          self = v72;
          char v31 = v69;
          id v32 = v67;
        }

        id v33 = (id)[v73 _parentGestureRecognizerContainer];
        v29 = v75;
      }
      while (v33);
    }
    if ([(NSMutableSet *)self->_beginningGestureRecognizers count])
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      v68 = self->_beginningGestureRecognizers;
      uint64_t v71 = [(NSMutableSet *)v68 countByEnumeratingWithState:&v81 objects:v107 count:16];
      v51 = 0;
      if (!v71) {
        goto LABEL_99;
      }
      uint64_t v70 = *(void *)v82;
      while (1)
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v82 != v70) {
            objc_enumerationMutation(v68);
          }
          uint64_t v74 = v52;
          uint64_t v53 = *(void *)(*((void *)&v81 + 1) + 8 * v52);
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          v54 = self->_updatingGestureRecognizers;
          uint64_t v55 = [(NSMutableSet *)v54 countByEnumeratingWithState:&v77 objects:v106 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v78;
            do
            {
              uint64_t v58 = 0;
              do
              {
                if (*(void *)v78 != v57) {
                  objc_enumerationMutation(v54);
                }
                v59 = *(id **)(*((void *)&v77 + 1) + 8 * v58);
                if ([v29 containsObject:v59])
                {
                  if (![v59 canBePreventedByGestureRecognizer:v53]) {
                    goto LABEL_92;
                  }
                  if (v53)
                  {
                    id WeakRetained = objc_loadWeakRetained((id *)(v53 + 48));
                    if (v59) {
                      goto LABEL_87;
                    }
LABEL_95:
                    id v61 = 0;
                  }
                  else
                  {
                    id WeakRetained = 0;
                    if (!v59) {
                      goto LABEL_95;
                    }
LABEL_87:
                    id v61 = objc_loadWeakRetained(v59 + 6);
                  }
                  int v62 = isDescendantOfContainer(WeakRetained, v61, 0);

                  v29 = v75;
                  if (!v62) {
                    goto LABEL_92;
                  }
                }
                if (!v51) {
                  v51 = objc_opt_new();
                }
                [v51 addObject:v59];
LABEL_92:
                ++v58;
              }
              while (v56 != v58);
              uint64_t v63 = [(NSMutableSet *)v54 countByEnumeratingWithState:&v77 objects:v106 count:16];
              uint64_t v56 = v63;
            }
            while (v63);
          }

          self = v72;
          uint64_t v52 = v74 + 1;
        }
        while (v74 + 1 != v71);
        uint64_t v71 = [(NSMutableSet *)v68 countByEnumeratingWithState:&v81 objects:v107 count:16];
        if (!v71)
        {
LABEL_99:

          [(NSMutableSet *)self->_updatingGestureRecognizers minusSet:v51];
          [(NSMutableSet *)self->_exitingGestureRecognizers unionSet:v51];

          goto LABEL_101;
        }
      }
    }
    [(NSMutableSet *)self->_exitingGestureRecognizers unionSet:self->_updatingGestureRecognizers];
    [(NSMutableSet *)self->_exitingGestureRecognizers minusSet:v29];
    [(NSMutableSet *)self->_updatingGestureRecognizers minusSet:self->_exitingGestureRecognizers];
LABEL_101:

    v14 = v64;
  }
LABEL_102:
}

- (NSSet)gestureRecognizers
{
  v3 = objc_opt_new();
  [v3 unionSet:self->_beginningGestureRecognizers];
  [v3 unionSet:self->_updatingGestureRecognizers];
  [v3 unionSet:self->_exitingGestureRecognizers];
  return (NSSet *)v3;
}

- (UITouch)touch
{
  return self->_touch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_exitingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_updatingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_beginningGestureRecognizers, 0);
}

@end