@interface UIGestureEnvironment
- (UIGestureEnvironment)init;
- (id)_gesturesWithDelayedTouchForTouch:(uint64_t)a1 event:(void *)a2;
- (id)_nodeForGestureRecognizer:(id *)a1;
- (uint64_t)_activeRelationshipsForGestureRecognizer:(uint64_t)a1;
- (uint64_t)_clearGestureNeedsUpdate:(uint64_t)result;
- (uint64_t)_markGestureAsDirty:(uint64_t)result;
- (uint64_t)_runPreUpdateActions;
- (uint64_t)gestureRecognizer:(uint64_t)a3 requiresGestureRecognizerToFail:;
- (uint64_t)setGestureNeedsUpdate:(uint64_t)result;
- (uint64_t)unmetRequirementsForGestureRecognizer:(uint64_t)a1;
- (void)_addPreUpdateAction:(uint64_t)a1;
- (void)_cancelGestureRecognizers:(uint64_t)a1;
- (void)_deliverEvent:(void *)a3 toGestureRecognizers:(uint64_t)a4 usingBlock:;
- (void)_gestureNeedsReset:(uint64_t)a1;
- (void)_notifyDependentsGestureRecognizerHasCompleted:(uint64_t)a1;
- (void)_performTouchContinuationWithOverrideHitTestedView:(uint64_t)a1;
- (void)_queueGestureRecognizersForResetIfFinished:(uint64_t)a1;
- (void)_removeNodeFromGestureGraph:(id *)a1;
- (void)_updateForEvent:(uint64_t)a3 window:;
- (void)addGestureRecognizer:(id)a3;
- (void)addRequirementForGestureRecognizer:(uint64_t)a1 requiringGestureRecognizerToFail:(uint64_t)a2;
- (void)dealloc;
- (void)removeGestureRecognizer:(id)a3;
- (void)removeRequirementForGestureRecognizer:(uint64_t)a3 requiringGestureRecognizerToFail:;
@end

@implementation UIGestureEnvironment

- (uint64_t)gestureRecognizer:(uint64_t)a3 requiresGestureRecognizerToFail:
{
  if (result)
  {
    uint64_t v4 = result;
    v5 = [*(id *)(result + 96) objectForKey:a2];
    v6 = [*(id *)(v4 + 96) objectForKey:a3];
    uint64_t v7 = [v5 hasEdgeFromNode:v6];

    return v7;
  }
  return result;
}

- (uint64_t)_runPreUpdateActions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(result + 72);
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
          (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    return objc_msgSend(*(id *)(v1 + 72), "removeAllObjects", (void)v7);
  }
  return result;
}

- (uint64_t)_clearGestureNeedsUpdate:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel__clearGestureNeedsUpdate_, v3, @"UIGestureEnvironment.m", 1021, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
    }
    uint64_t v4 = *(void **)(v3 + 16);
    return [v4 removeObject:a2];
  }
  return result;
}

- (void)_queueGestureRecognizersForResetIfFinished:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = a2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v8, "state", (void)v9) >= 3
            && (-[UIGestureEnvironment _activeRelationshipsForGestureRecognizer:](a1, (uint64_t)v8) & 1) == 0)
          {
            -[UIGestureEnvironment _gestureNeedsReset:](a1, (uint64_t)v8);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)_gestureNeedsReset:(uint64_t)a1
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__gestureNeedsReset_, a1, @"UIGestureEnvironment.m", 1054, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("GestureEnvironment", &_gestureNeedsReset____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      long long v10 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v11 = v10;
        [(id)a2 _briefDescription];
        *(void *)((char *)&buf + 4) = LODWORD(buf) = 138412290;
        long long v12 = *(void **)((char *)&buf + 4);
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Queueing gesture for reset: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    [*(id *)(a1 + 24) addObject:a2];
    [*(id *)(a1 + 48) addObject:a2];
    if (!*(void *)(a1 + 64))
    {
      objc_initWeak(&location, (id)a1);
      id v5 = MEMORY[0x1E4F14428];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v15 = __69__UIGestureEnvironment__configureBlockResetStateCaptureTokenIfNeeded__block_invoke;
      v16 = &unk_1E52DD088;
      objc_copyWeak(v17, &location);
      uint64_t v6 = BSLogAddStateCaptureBlockWithTitle();
      long long v7 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v6;

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
    if (a2)
    {
      char v8 = *(unsigned char *)(a2 + 16);
      if ((v8 & 0x10) == 0)
      {
        *(void *)(a2 + 8) = *(void *)(a2 + 8);
        *(unsigned char *)(a2 + 16) = v8 | 0x10;
        *(void *)(a2 + 216) = mach_absolute_time();
      }
    }
  }
}

- (void)_notifyDependentsGestureRecognizerHasCompleted:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 96) objectForKey:a2];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v18 = long long v22 = 0u;
    id v3 = [v18 outEdges];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = [*(id *)(*((void *)&v19 + 1) + 8 * v7) targetNode];
          long long v9 = [v8 propertyForKey:@"gestureRecognizerNode"];

          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("GestureEnvironment", &_notifyDependentsGestureRecognizerHasCompleted____s_category);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            long long v11 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              log = v11;
              long long v12 = [v9 _briefDescription];
              if (a2)
              {
                v13 = @"will be unblocked";
                if ((unint64_t)(a2[9] - 1) < 3) {
                  v13 = @"will be failed";
                }
              }
              else
              {
                v13 = @"will be unblocked";
              }
              v15 = v13;
              v16 = [a2 _briefDescription];
              *(_DWORD *)long long buf = 138412802;
              v24 = v12;
              __int16 v25 = 2112;
              v26 = v15;
              __int16 v27 = 2112;
              v28 = v16;
              _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "%@ %@ by %@", buf, 0x20u);
            }
          }
          -[UIGestureRecognizer _requiredGestureRecognizerCompletedOrWasUnrelated:]((uint64_t)v9, a2);

          ++v7;
        }
        while (v5 != v7);
        uint64_t v14 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
        uint64_t v5 = v14;
      }
      while (v14);
    }
  }
}

- (void)addRequirementForGestureRecognizer:(uint64_t)a1 requiringGestureRecognizerToFail:(uint64_t)a2
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 96), "objectForKey:");
    uint64_t v5 = [*(id *)(a1 + 96) objectForKey:a2];
    uint64_t v6 = (void *)v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("GestureEnvironment", &addRequirementForGestureRecognizer_requiringGestureRecognizerToFail____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        long long v9 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315138;
          long long v12 = "-[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]";
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%s - unable to add requirement at this time because connections nodes have not yet added", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    else
    {
      id v10 = (id)[*(id *)(a1 + 88) addUniqueEdgeWithLabel:@"failureRequirement" sourceNode:v4 targetNode:v5 directed:1 properties:0];
    }
  }
}

- (void)removeGestureRecognizer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = -[UIGestureEnvironment _nodeForGestureRecognizer:]((id *)&self->super.isa, (uint64_t)a3);
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)a3 + 6);

      if (WeakRetained) {
        -[UIGestureRecognizer setContainer:]((uint64_t)a3, 0);
      }
      if ((*((void *)a3 + 1) & 0x200000000) != 0)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("GestureEnvironment", &qword_1EB25AC48);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          long long v12 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = v12;
            uint64_t v14 = [a3 _briefDescription];
            int v15 = 138412290;
            v16 = v14;
            _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "queueing gesture for removal from environment %@", (uint8_t *)&v15, 0xCu);
          }
        }
        [(NSMutableSet *)self->_gestureRecognizersNeedingRemoval addObject:a3];
        if ([a3 state] >= 3
          && (-[UIGestureEnvironment _activeRelationshipsForGestureRecognizer:]((uint64_t)self, (uint64_t)a3) & 1) == 0)
        {
          -[UIGestureEnvironment _gestureNeedsReset:]((uint64_t)self, (uint64_t)a3);
        }
      }
      else
      {
        -[UIGestureEnvironment _removeNodeFromGestureGraph:]((id *)&self->super.isa, v5);
      }
    }
    else
    {
      unint64_t v7 = __UILogGetCategoryCachedImpl("GestureEnvironment", &qword_1EB25AC50);
      if (*(unsigned char *)v7)
      {
        char v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          long long v9 = v8;
          id v10 = [a3 _briefDescription];
          int v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "ERROR - Unable to find node for gesture %@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
}

- (void)_removeNodeFromGestureGraph:(id *)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = [a2 propertyForKey:@"gestureRecognizerNode"];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("GestureEnvironment", &_removeNodeFromGestureGraph____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v7 = v6;
        char v8 = [v4 _briefDescription];
        int v9 = 138412290;
        id v10 = v8;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "removing gesture from environment %@", (uint8_t *)&v9, 0xCu);
      }
    }
    [a1[12] removeObjectForKey:v4];
    [a1[11] removeNode:a2];
    [a1[4] removeObject:v4];
    -[UIGestureRecognizer setGestureEnvironment:]((uint64_t)v4, 0);
  }
}

- (void)addGestureRecognizer:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    -[NSMutableSet removeObject:](self->_gestureRecognizersNeedingRemoval, "removeObject:");
    objc_storeStrong((id *)a3 + 32, self);
    uint64_t v5 = -[UIGestureEnvironment _nodeForGestureRecognizer:]((id *)&self->super.isa, (uint64_t)a3);
    if (!v5)
    {
      dependencyGraph = self->_dependencyGraph;
      v28 = @"gestureRecognizerNode";
      v29[0] = a3;
      unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v5 = [(UIGestureGraph *)dependencyGraph addNodeWithLabel:@"gestureRecognizerNode" properties:v7];

      [(NSMapTable *)self->_nodesByGestureRecognizer setObject:v5 forKey:a3];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = *((id *)a3 + 20);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          -[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self, (uint64_t)a3);
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = *((id *)a3 + 21);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self, *(void *)(*((void *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
}

- (id)_nodeForGestureRecognizer:(id *)a1
{
  if (a1)
  {
    a1 = [a1[12] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)unmetRequirementsForGestureRecognizer:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 96) objectForKey:a2];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(v2, "inEdges", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) sourceNode];
        uint64_t v9 = [(id)v8 propertyForKey:@"gestureRecognizerNode"];

        LOBYTE(v8) = -[UIGestureRecognizer _isActive](v9);
        if (v8)
        {
          uint64_t v10 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (uint64_t)_activeRelationshipsForGestureRecognizer:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 96) objectForKey:a2];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(v2, "allEdges", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) oppositeNode:v2];
        uint64_t v9 = [(id)v8 propertyForKey:@"gestureRecognizerNode"];

        LOBYTE(v8) = -[UIGestureRecognizer _isActive](v9);
        if (v8)
        {
          uint64_t v10 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (void)_cancelGestureRecognizers:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v3 = a2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (!v4) {
      goto LABEL_30;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    id v20 = v3;
    uint64_t v21 = v2;
    uint64_t v19 = *(void *)v27;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * v7);
        if (!v8)
        {
          -[UIGestureEnvironment _clearGestureNeedsUpdate:](v2, 0);
          goto LABEL_26;
        }
        id WeakRetained = objc_loadWeakRetained((id *)(v8 + 48));

        if (!WeakRetained) {
          -[UIGestureEnvironment _clearGestureNeedsUpdate:](v2, v8);
        }
        if ((*(void *)(v8 + 8) & 0x200000000) != 0 && [(id)v8 state] <= 2)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v10 = [(id)v8 _activeEvents];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v23;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
                uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
                [v15 _removeGestureRecognizersSendingCancelledEvent:v16];

                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v12);
          }

          if ([(id)v8 state])
          {
            id v3 = v20;
            uint64_t v2 = v21;
            uint64_t v6 = v19;
            if ([(id)v8 state] <= 2)
            {
              uint64_t v17 = 4;
              goto LABEL_23;
            }
          }
          else
          {
            uint64_t v17 = 5;
            id v3 = v20;
            uint64_t v2 = v21;
            uint64_t v6 = v19;
LABEL_23:
            [(id)v8 setState:v17];
          }
          -[UIGestureEnvironment _clearGestureNeedsUpdate:](v2, v8);
          -[UIGestureRecognizer _updateGestureForActiveEvents]((void *)v8);
          if ([(id)v8 state] >= 3) {
            -[UIGestureEnvironment _notifyDependentsGestureRecognizerHasCompleted:](v2, (void *)v8);
          }
        }
LABEL_26:
        ++v7;
      }
      while (v7 != v5);
      uint64_t v18 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
      uint64_t v5 = v18;
      if (!v18)
      {
LABEL_30:

        -[UIGestureEnvironment _queueGestureRecognizersForResetIfFinished:](v2, v3);
        return;
      }
    }
  }
}

- (void)_deliverEvent:(void *)a3 toGestureRecognizers:(uint64_t)a4 usingBlock:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = a3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ((*(unsigned int (**)(uint64_t, uint64_t))(a4 + 16))(a4, v11))
          {
            -[UIGestureEnvironment _markGestureAsDirty:](a1, v11);
            if (v11)
            {
              if ((*(unsigned char *)(v11 + 16) & 0x20) != 0) {
                -[UIGestureEnvironment setGestureNeedsUpdate:](a1, v11);
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    -[UIGestureEnvironment _queueGestureRecognizersForResetIfFinished:](a1, v6);
    if (objc_msgSend(*(id *)(a1 + 16), "count", (void)v15)
      || ([(id)UIApp _gestureDelayedEventComponentDispatcher],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v13 = (void *)v12, uint64_t v14 = [*(id *)(v12 + 16) count], v13, v14))
    {
      _UIGestureEnvironmentUpdate(a1);
    }
  }
}

- (uint64_t)setGestureNeedsUpdate:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 48));

    if (WeakRetained)
    {
      uint64_t v5 = *(void **)(v3 + 16);
      return [v5 addObject:a2];
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:sel_setGestureNeedsUpdate_, v3, @"UIGestureEnvironment.m", 1045, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
  }
  return -[UIGestureEnvironment _clearGestureNeedsUpdate:](v3, a2);
}

uint64_t __47__UIGestureEnvironment__updateForEvent_window___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 state];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4 > 2)
  {
    [v5 _gestureRecognizerNoLongerNeedsSendEvent:a2];
    return 0;
  }
  else
  {
    return [v5 _sendEventToGestureRecognizer:a2];
  }
}

- (uint64_t)_markGestureAsDirty:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel__markGestureAsDirty_, v3, @"UIGestureEnvironment.m", 1063, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
    }
    result = [*(id *)(v3 + 40) containsObject:a2];
    if ((result & 1) == 0)
    {
      result = [*(id *)(v3 + 40) addObject:a2];
      if (a2) {
        *(void *)(a2 + 8) |= 0x200000000uLL;
      }
      *(_WORD *)(v3 + 80) = 257;
    }
  }
  return result;
}

- (void)_updateForEvent:(uint64_t)a3 window:
{
  if (a1)
  {
    -[UIGestureEnvironment _runPreUpdateActions](a1);
    id v6 = [a2 _gestureRecognizersForWindow:a3];
    uint64_t v7 = (void *)[v6 copy];

    if (([a2 _consumeBeforeDeliveryToGestureRecognizers:v7 inWindow:a3] & 1) == 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__UIGestureEnvironment__updateForEvent_window___block_invoke;
      v9[3] = &unk_1E52DDFF0;
      v9[4] = a2;
      -[UIGestureEnvironment _deliverEvent:toGestureRecognizers:usingBlock:](a1, v8, v7, (uint64_t)v9);
      [a2 _wasDeliveredToGestureRecognizers];
    }
  }
}

- (UIGestureEnvironment)init
{
  v24.receiver = self;
  v24.super_class = (Class)UIGestureEnvironment;
  uint64_t v2 = [(UIGestureEnvironment *)&v24 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v23.version = 0;
    memset(&v23.retain, 0, 24);
    v23.info = v2;
    CFRunLoopObserverRef v4 = CFRunLoopObserverCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x20uLL, 1u, 0, (CFRunLoopObserverCallBack)_UIGestureRecognizerUpdateObserver, &v23);
    v3->_gestureEnvironmentUpdateObserver = v4;
    if (v4)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopAddObserver(Main, v3->_gestureEnvironmentUpdateObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    }
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    gestureRecognizersNeedingUpdate = v3->_gestureRecognizersNeedingUpdate;
    v3->_gestureRecognizersNeedingUpdate = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    gestureRecognizersNeedingReset = v3->_gestureRecognizersNeedingReset;
    v3->_gestureRecognizersNeedingReset = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    gestureRecognizersNeedingRemoval = v3->_gestureRecognizersNeedingRemoval;
    v3->_gestureRecognizersNeedingRemoval = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    dirtyGestureRecognizers = v3->_dirtyGestureRecognizers;
    v3->_dirtyGestureRecognizers = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    preUpdateActions = v3->_preUpdateActions;
    v3->_preUpdateActions = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    gestureRecognizersBlockedFromReset = v3->_gestureRecognizersBlockedFromReset;
    v3->_gestureRecognizersBlockedFromReset = (NSMutableSet *)v16;

    v3->_lastBlockedResetEvaluationMachTime = 0;
    uint64_t v18 = objc_opt_new();
    dependencyGraph = v3->_dependencyGraph;
    v3->_dependencyGraph = (UIGestureGraph *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    nodesByGestureRecognizer = v3->_nodesByGestureRecognizer;
    v3->_nodesByGestureRecognizer = (NSMapTable *)v20;
  }
  return v3;
}

id __69__UIGestureEnvironment__configureBlockResetStateCaptureTokenIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = _UIGestureEnvironmentSubgraphsBlockedFromResetDescription((uint64_t)WeakRetained, 1);
  uint64_t v3 = [v2 description];

  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_blockedResetStateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIGestureEnvironment;
  [(UIGestureEnvironment *)&v3 dealloc];
}

- (void)removeRequirementForGestureRecognizer:(uint64_t)a3 requiringGestureRecognizerToFail:
{
  if (a1)
  {
    uint64_t v5 = [*(id *)(a1 + 96) objectForKey:a2];
    uint64_t v6 = [*(id *)(a1 + 96) objectForKey:a3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __95__UIGestureEnvironment_removeRequirementForGestureRecognizer_requiringGestureRecognizerToFail___block_invoke;
    v7[3] = &unk_1E52F0EA8;
    v7[4] = a1;
    [v5 enumerateEdgesFromNode:v6 usingBlock:v7];
  }
}

void __95__UIGestureEnvironment_removeRequirementForGestureRecognizer_requiringGestureRecognizerToFail___block_invoke(uint64_t a1, void *a2)
{
  CFRunLoopObserverRef v4 = [a2 label];
  int v5 = [v4 isEqualToString:@"failureRequirement"];

  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 88);
    [v6 removeEdge:a2];
  }
}

- (id)_gesturesWithDelayedTouchForTouch:(uint64_t)a1 event:(void *)a2
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1 && [a2 isDelayed])
  {
    CFRunLoopObserverRef v4 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 40)];
    int v5 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v6 = [a2 gestureRecognizers];
    uint64_t v7 = [v5 setWithArray:v6];

    [v4 minusSet:v7];
    if ([v4 count])
    {
      uint64_t v20 = v7;
      uint64_t v21 = v4;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = v4;
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      uint64_t v8 = 0;
      if (v24)
      {
        uint64_t v23 = *(void *)v30;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * v9);
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            if (v10) {
              uint64_t v11 = (void *)[*(id *)(v10 + 32) copy];
            }
            else {
              uint64_t v11 = 0;
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v26;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v26 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                  if (v16) {
                    uint64_t v16 = (void *)v16[3];
                  }
                  long long v17 = v16;

                  if (v17 == a2)
                  {
                    if (!v8) {
                      uint64_t v8 = objc_opt_new();
                    }
                    [v8 addObject:v10];
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
              }
              while (v13);
            }

            ++v9;
          }
          while (v9 != v24);
          uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
          uint64_t v24 = v18;
        }
        while (v18);
      }

      uint64_t v7 = v20;
      CFRunLoopObserverRef v4 = v21;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (void)_performTouchContinuationWithOverrideHitTestedView:(uint64_t)a1
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (void *)UIApp;
    objc_super v3 = [a2 _window];
    id v4 = (id)[v2 _touchesEventForWindow:v3];

    v78 = v4;
    int v5 = [v4 allTouches];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v111 objects:v123 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v112 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          uint64_t v11 = [v10 gestureRecognizers];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v107 objects:v122 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v108;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v108 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                if (([v16 _keepTouchesOnContinuation] & 1) == 0) {
                  -[UIGestureRecognizer _removeTouch:forEvent:byCancellingTouches:]((uint64_t)v16, (uint64_t)v10, (uint64_t)v78, 1);
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v107 objects:v122 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v111 objects:v123 count:16];
      }
      while (v7);
    }
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id obj = v5;
    uint64_t v17 = [obj countByEnumeratingWithState:&v103 objects:v121 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v104;
      uint64_t v20 = (void *)MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v104 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v22 = *(void **)(*((void *)&v103 + 1) + 8 * k);
          uint64_t v23 = [v22 _responder];

          if (v23)
          {
            if ([v22 phase] <= 3)
            {
              uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "phase"));
              objc_setAssociatedObject(v22, &_MergedGlobals_56, v24, (void *)1);

              [v22 setPhase:4];
              if ([v22 isDelayed]) {
                objc_setAssociatedObject(v22, &unk_1EB25AC41, v20, (void *)1);
              }
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v103 objects:v121 count:16];
      }
      while (v18);
    }

    _UIGestureEnvironmentUpdate(a1);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v66 = [v78 _allWindows];
    uint64_t v70 = [v66 countByEnumeratingWithState:&v99 objects:v120 count:16];
    if (v70)
    {
      uint64_t v69 = *(void *)v100;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v100 != v69) {
            objc_enumerationMutation(v66);
          }
          uint64_t v71 = v25;
          uint64_t v26 = *(void *)(*((void *)&v99 + 1) + 8 * v25);
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v72 = [v78 _respondersForWindow:v26];
          id v76 = (id)[v72 countByEnumeratingWithState:&v95 objects:v119 count:16];
          if (v76)
          {
            uint64_t v73 = *(void *)v96;
            do
            {
              for (m = 0; m != v76; m = (char *)m + 1)
              {
                if (*(void *)v96 != v73) {
                  objc_enumerationMutation(v72);
                }
                long long v28 = *(void **)(*((void *)&v95 + 1) + 8 * (void)m);
                long long v29 = [v78 _touchesForResponder:v28 withPhase:4];
                long long v30 = v29;
                if (v29)
                {
                  v74 = v28;
                  long long v31 = (void *)[v29 mutableCopy];
                  long long v91 = 0u;
                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v94 = 0u;
                  id v32 = v30;
                  uint64_t v33 = [v32 countByEnumeratingWithState:&v91 objects:v118 count:16];
                  if (v33)
                  {
                    uint64_t v34 = v33;
                    uint64_t v35 = *(void *)v92;
                    do
                    {
                      for (uint64_t n = 0; n != v34; ++n)
                      {
                        if (*(void *)v92 != v35) {
                          objc_enumerationMutation(v32);
                        }
                        v37 = *(void **)(*((void *)&v91 + 1) + 8 * n);
                        v38 = objc_getAssociatedObject(v37, &unk_1EB25AC41);

                        if (v38) {
                          [v31 removeObject:v37];
                        }
                      }
                      uint64_t v34 = [v32 countByEnumeratingWithState:&v91 objects:v118 count:16];
                    }
                    while (v34);
                  }

                  if (v31) {
                    [v74 touchesCancelled:v32 withEvent:v78];
                  }
                }
              }
              id v76 = (id)[v72 countByEnumeratingWithState:&v95 objects:v119 count:16];
            }
            while (v76);
          }

          uint64_t v25 = v71 + 1;
        }
        while (v71 + 1 != v70);
        uint64_t v70 = [v66 countByEnumeratingWithState:&v99 objects:v120 count:16];
      }
      while (v70);
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v39 = obj;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v87 objects:v117 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v88;
      do
      {
        for (iuint64_t i = 0; ii != v41; ++ii)
        {
          if (*(void *)v88 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(_WORD **)(*((void *)&v87 + 1) + 8 * ii);
          v45 = objc_getAssociatedObject(v44, &_MergedGlobals_56);
          v46 = v45;
          if (v45) {
            objc_msgSend(v44, "setPhase:", objc_msgSend(v45, "integerValue"));
          }
          objc_setAssociatedObject(v44, &_MergedGlobals_56, 0, (void *)1);
          objc_setAssociatedObject(v44, &unk_1EB25AC41, 0, (void *)1);
          uint64_t v47 = [v44 phase];
          if (v44) {
            BOOL v48 = v47 <= 2;
          }
          else {
            BOOL v48 = 0;
          }
          if (v48) {
            v44[118] &= ~8u;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v87 objects:v117 count:16];
      }
      while (v41);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v77 = v39;
    uint64_t v49 = [v77 countByEnumeratingWithState:&v83 objects:v116 count:16];
    v50 = a2;
    if (v49)
    {
      uint64_t v51 = v49;
      uint64_t v52 = *(void *)v84;
      do
      {
        for (juint64_t j = 0; jj != v51; ++jj)
        {
          if (*(void *)v84 != v52) {
            objc_enumerationMutation(v77);
          }
          v54 = *(void **)(*((void *)&v83 + 1) + 8 * jj);
          if (v50)
          {
            id v55 = v50;
          }
          else
          {
            -[UITouch _rehitTest](*(void **)(*((void *)&v83 + 1) + 8 * jj));
            id v55 = (id)objc_claimAutoreleasedReturnValue();
            if (!v55) {
              continue;
            }
          }
          v56 = [v55 _eventReceivingWindow];
          v57 = [v78 _exclusiveTouchWindows];
          [v57 removeObject:v56];

          [v56 _setExclusiveTouchView:0];
          [v54 _setResponder:v55];
          v58 = [v55 _eventReceivingWindow];
          v59 = [v54 window];

          if (v58 != v59)
          {
            v60 = [v55 _eventReceivingWindow];
            [v54 setWindow:v60];
          }
          [v78 _addGestureRecognizersForTouchContinuationFromContainer:v55 toTouch:v54];
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          v61 = [v54 gestureRecognizers];
          uint64_t v62 = [v61 countByEnumeratingWithState:&v79 objects:v115 count:16];
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v80;
            do
            {
              for (kuint64_t k = 0; kk != v63; ++kk)
              {
                if (*(void *)v80 != v64) {
                  objc_enumerationMutation(v61);
                }
                [*(id *)(*((void *)&v79 + 1) + 8 * kk) _addTouch:v54 forEvent:v78];
              }
              uint64_t v63 = [v61 countByEnumeratingWithState:&v79 objects:v115 count:16];
            }
            while (v63);
          }

          v50 = a2;
        }
        uint64_t v51 = [v77 countByEnumeratingWithState:&v83 objects:v116 count:16];
      }
      while (v51);
    }
  }
}

- (void)_addPreUpdateAction:(uint64_t)a1
{
  if (a1 && aBlock)
  {
    uint64_t v2 = *(void **)(a1 + 72);
    id v3 = _Block_copy(aBlock);
    [v2 addObject:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_preUpdateActions, 0);
  objc_storeStrong((id *)&self->_blockedResetStateCaptureToken, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersBlockedFromReset, 0);
  objc_storeStrong((id *)&self->_dirtyGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersNeedingRemoval, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersNeedingReset, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersNeedingUpdate, 0);
}

@end