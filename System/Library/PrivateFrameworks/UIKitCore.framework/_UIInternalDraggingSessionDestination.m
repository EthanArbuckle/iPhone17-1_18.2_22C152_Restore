@interface _UIInternalDraggingSessionDestination
- (BOOL)canBeDrivenByDragEvent:(id)a3;
- (BOOL)didRequestDropToBePerformed;
- (BOOL)drivenByPointer;
- (BOOL)isAccessibilitySession;
- (BOOL)shouldDragEventBeSentToGestureRecognizers;
- (CAPoint3D)centroid;
- (CGPoint)draggingLocationInCoordinateSpace:(id)a3;
- (CGPoint)previewCenterForVisibleItem:(id)a3 inCoordinateSpace:(id)a4;
- (NSArray)dragEvents;
- (NSArray)dropItemProviders;
- (NSArray)internalItems;
- (NSArray)preDropItemProviders;
- (NSProgress)progress;
- (UIDragEvent)activeDragEvent;
- (UIWindow)centroidWindow;
- (UIWindow)weakCentroidWindow;
- (_UIDropSessionImpl)dropSession;
- (_UIDruidDestinationConnection)druidConnection;
- (_UIInternalDraggingSessionDestination)initWithDragManager:(id)a3 dragEvent:(id)a4;
- (_UIInternalDraggingSessionSource)inAppSessionSource;
- (int64_t)sourceDataOwner;
- (unint64_t)actualDragOperationForProposedDragOperation:(unint64_t)a3 destinationDataOwner:(int64_t)a4 forbidden:(BOOL *)a5;
- (unint64_t)outsideAppSourceOperationMask;
- (unint64_t)progressIndicatorStyle;
- (unint64_t)sourceOperationMask;
- (unsigned)sessionIdentifier;
- (void)_removeFromDragManager;
- (void)_sessionDidEndNormally:(BOOL)a3;
- (void)addDragEvent:(id)a3;
- (void)connect;
- (void)dataTransferMonitorBeganTransfers:(id)a3;
- (void)dataTransferMonitorFinishedTransfers:(id)a3;
- (void)dragDidExitApp;
- (void)dragInteractionEnding;
- (void)enteredDestination:(id)a3;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)handOffDroppedItems:(id)a3;
- (void)itemsBecameDirty:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestDropOnOwner:(id)a3 withOperation:(unint64_t)a4 perform:(id)a5 completion:(id)a6;
- (void)requestVisibleItems:(id)a3;
- (void)sawDragEndEvent;
- (void)setDruidConnection:(id)a3;
- (void)setInternalItems:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgressIndicatorStyle:(unint64_t)a3;
- (void)setUpDropAnimation:(id)a3 layerContext:(id *)a4;
- (void)takePotentialDrop:(id)a3;
- (void)takeVisibleDroppedItems:(id)a3;
- (void)updateCentroidFromDragEvent;
@end

@implementation _UIInternalDraggingSessionDestination

- (_UIInternalDraggingSessionDestination)initWithDragManager:(id)a3 dragEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"dragEvent must be non-nil"];
  }
  v25.receiver = self;
  v25.super_class = (Class)_UIInternalDraggingSessionDestination;
  v8 = [(_UIDraggingImageSlotOwner *)&v25 initWithDragManager:v6];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    dragEvents = v8->_dragEvents;
    v8->_dragEvents = (NSPointerArray *)v9;

    v8->_sessionIdentifier = [v7 dragSessionID];
    v8->_touchRoutingPolicyContextID = [v7 _touchRoutingPolicyContextID];
    v11 = [(_UIDraggingImageSlotOwner *)v8 dragManager];
    uint64_t v12 = [v11 sessionSourceWithIdentifier:v8->_sessionIdentifier];
    sessionSource = v8->_sessionSource;
    v8->_sessionSource = (_UIInternalDraggingSessionSource *)v12;

    v8->_isPolicyDriven = [v7 isPolicyDriven];
    [v7 locationInView:0];
    v8->_centroid.x = v14;
    v8->_centroid.y = v15;
    v8->_centroid.z = 0.0;
    uint64_t v16 = [v7 eventWindow];
    centroidWindow = v8->_centroidWindow;
    v8->_centroidWindow = (UIWindow *)v16;

    v18 = objc_alloc_init(_UIDataTransferMonitor);
    dataTransferMonitor = v8->_dataTransferMonitor;
    v8->_dataTransferMonitor = v18;

    [(_UIDataTransferMonitor *)v8->_dataTransferMonitor setDelegate:v8];
    [(_UIDataTransferMonitor *)v8->_dataTransferMonitor setSuppressEventsUntilRequested:1];
    uint64_t v20 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v20;

    v8->_progressIndicatorStyle = 1;
    v22 = [[_UIDropSessionImpl alloc] initWithSessionDestination:v8];
    dropSession = v8->_dropSession;
    v8->_dropSession = v22;

    [(_UIInternalDraggingSessionDestination *)v8 addDragEvent:v7];
  }

  return v8;
}

- (_UIInternalDraggingSessionSource)inAppSessionSource
{
  return self->_sessionSource;
}

- (BOOL)canBeDrivenByDragEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 dragSessionID];
  BOOL v6 = v5 == [(_UIInternalDraggingSessionDestination *)self sessionIdentifier]
    && [v4 _touchRoutingPolicyContextID] == self->_touchRoutingPolicyContextID
    && self->_isPolicyDriven == [v4 isPolicyDriven];

  return v6;
}

- (void)addDragEvent:(id)a3
{
}

- (NSArray)dragEvents
{
  return [(NSPointerArray *)self->_dragEvents allObjects];
}

- (UIDragEvent)activeDragEvent
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(_UIInternalDraggingSessionDestination *)self dragEvents];
  v3 = [v2 firstObject];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasActiveGestureRecognizers", (void)v12))
        {
          id v10 = v9;

          v3 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (UIDragEvent *)v3;
}

- (void)connect
{
  v3 = [(_UIInternalDraggingSessionDestination *)self druidConnection];

  if (!v3)
  {
    id v4 = [[_UIDruidDestinationConnection alloc] initWithSessionIdentifier:self->_sessionIdentifier systemPolicy:self->_isPolicyDriven];
    [(_UIInternalDraggingSessionDestination *)self setDruidConnection:v4];

    objc_initWeak(&location, self);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__73;
    v24[4] = __Block_byref_object_dispose__73;
    id v25 = [(_UIInternalDraggingSessionDestination *)self dragEvents];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke;
    v22[3] = &unk_1E52EC2C8;
    objc_copyWeak(&v23, &location);
    v22[4] = self;
    v22[5] = v24;
    uint64_t v5 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v5 setConnectionBlock:v22];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_2;
    v20[3] = &unk_1E52EC200;
    objc_copyWeak(&v21, &location);
    uint64_t v6 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v6 setDragPreviewProviderBlock:v20];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_4;
    v18[3] = &unk_1E52EC2F0;
    objc_copyWeak(&v19, &location);
    uint64_t v7 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v7 setItemsAddedBlock:v18];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_5;
    v16[3] = &unk_1E52EC318;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    v8 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v8 setDropPerformBlock:v16];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_6;
    v14[3] = &unk_1E52EC278;
    objc_copyWeak(&v15, &location);
    uint64_t v9 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v9 setHandOffDroppedItemsBlock:v14];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v13, &location);
    id v10 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v10 setDragEndBlock:&v12];

    v11 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v11 connect];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    _Block_object_dispose(v24, 8);

    objc_destroyWeak(&location);
  }
}

- (void)_sessionDidEndNormally:(BOOL)a3
{
  if (!a3)
  {
    id dropPerformBlock = self->_dropPerformBlock;
    if (dropPerformBlock)
    {
      self->_id dropPerformBlock = 0;

      id dropCompletionBlock = self->_dropCompletionBlock;
      self->_id dropCompletionBlock = 0;
    }
    setDownAnimation = self->_setDownAnimation;
    if (setDownAnimation) {
      [(_UIDragSetDownAnimation *)setDownAnimation begin];
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64___UIInternalDraggingSessionDestination__sessionDidEndNormally___block_invoke;
  v11[3] = &unk_1E52D9FC0;
  v11[4] = self;
  BOOL v12 = a3;
  v8 = (void (**)(void))_Block_copy(v11);
  if (self->_setDownAnimation && ([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    uint64_t v9 = _Block_copy(v8);
    id postDropAnimationCompletionBlock = self->_postDropAnimationCompletionBlock;
    self->_id postDropAnimationCompletionBlock = v9;
  }
  else
  {
    v8[2](v8);
  }
}

- (void)_removeFromDragManager
{
  v3 = [(_UIDraggingImageSlotOwner *)self dragManager];
  [v3 sessionDestinationDidEnd:self];

  dropSession = self->_dropSession;
  self->_dropSession = 0;
}

- (void)dataTransferMonitorBeganTransfers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIApplication _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if ([a3 isEqualToString:@"outstandingItemsCount"])
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    uint64_t v10 = [v9 unsignedIntegerValue];

    v11 = +[UIApplication _systemAnimationFenceExemptQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88___UIInternalDraggingSessionDestination_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v12[3] = &unk_1E52D9CD0;
    v12[4] = self;
    v12[5] = v10;
    [v11 performAsync:v12];
  }
}

- (void)dataTransferMonitorFinishedTransfers:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &dataTransferMonitorFinishedTransfers____s_category) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Data transfer finished for dragging session destination %p", buf, 0xCu);
  }
  uint64_t v5 = +[UIApplication _systemAnimationFenceExemptQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78___UIInternalDraggingSessionDestination_dataTransferMonitorFinishedTransfers___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  [v5 performAsync:v6];
}

- (BOOL)shouldDragEventBeSentToGestureRecognizers
{
  if (!self->_connectedToDruid) {
    return 0;
  }
  sessionSource = self->_sessionSource;
  return !sessionSource || [(_UIInternalDraggingSessionSource *)sessionSource didHandOffDragImage];
}

- (BOOL)didRequestDropToBePerformed
{
  return self->_dropPerformBlock != 0;
}

- (void)dragInteractionEnding
{
  self->_dragInteractionDidEnd = 1;
}

- (void)sawDragEndEvent
{
  id v2 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
  [v2 sawDragEndEvent];
}

- (void)updateCentroidFromDragEvent
{
  if (self->_centroidWindow)
  {
    v3 = [(_UIInternalDraggingSessionDestination *)self activeDragEvent];
    if (v3)
    {
      id v8 = v3;
      [v3 locationInView:0];
      self->_centroid.x = v4;
      self->_centroid.y = v5;
      self->_centroid.z = 0.0;
      id v6 = [v8 eventWindow];
      centroidWindow = self->_centroidWindow;
      self->_centroidWindow = v6;

      v3 = v8;
    }
  }
}

- (void)dragDidExitApp
{
  lastPotentialDrop = self->_lastPotentialDrop;
  self->_lastPotentialDrop = 0;
}

- (void)enteredDestination:(id)a3
{
  id v4 = a3;
  enteredDestinations = self->_enteredDestinations;
  id v8 = v4;
  if (!enteredDestinations)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v7 = self->_enteredDestinations;
    self->_enteredDestinations = v6;

    id v4 = v8;
    enteredDestinations = self->_enteredDestinations;
  }
  [(NSMutableSet *)enteredDestinations addObject:v4];
}

- (void)itemsBecameDirty:(id)a3
{
  id v5 = a3;
  if ([v5 count] && self->_connectedToDruid && !self->_dragInteractionDidEnd)
  {
    id v4 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v4 dirtyItems:v5];
  }
}

- (void)takePotentialDrop:(id)a3
{
  p_lastPotentialDrop = &self->_lastPotentialDrop;
  id v7 = a3;
  if (!-[_DUIPotentialDrop isEqual:](*p_lastPotentialDrop, "isEqual:"))
  {
    id v6 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v6 takePotentialDrop:v7];

    objc_storeStrong((id *)p_lastPotentialDrop, a3);
  }
}

- (void)requestDropOnOwner:(id)a3 withOperation:(unint64_t)a4 perform:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4)
  {
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_dropDestinationOwner, a3);
    if (_IsKindOfUIView((uint64_t)self->_dropDestinationOwner))
    {
      long long v14 = [v11 _window];
      objc_storeWeak((id *)&self->_dropDestinationWindow, v14);

      id v15 = objc_alloc_init(_DUITargetLayerDescriptor);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dropDestinationWindow);
      -[_DUITargetLayerDescriptor setContextID:](v15, "setContextID:", [WeakRetained _contextId]);

      id v17 = objc_loadWeakRetained((id *)&self->_dropDestinationWindow);
      v18 = [v17 layer];
      [(_DUITargetLayerDescriptor *)v15 setRenderID:CALayerGetRenderId()];

      id v19 = objc_loadWeakRetained((id *)&self->_dropDestinationWindow);
      uint64_t v20 = [v19 windowScene];

      id v21 = [v20 systemShellHostingEnvironment];
      v22 = [v21 systemShellHostingSpaceIdentifier];
      [(_DUITargetLayerDescriptor *)v15 setSystemShellHostingSpaceIdentifier:v22];
    }
    else
    {
      id v15 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __93___UIInternalDraggingSessionDestination_requestDropOnOwner_withOperation_perform_completion___block_invoke;
    aBlock[3] = &unk_1E52E95A0;
    objc_copyWeak(&v30, &location);
    id v29 = v12;
    id v23 = _Block_copy(aBlock);
    id dropPerformBlock = self->_dropPerformBlock;
    self->_id dropPerformBlock = v23;

    id v25 = _Block_copy(v13);
    id dropCompletionBlock = self->_dropCompletionBlock;
    self->_id dropCompletionBlock = v25;

    v27 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
    [v27 requestDropWithOperation:a4 layerContext:v15];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)sourceOperationMask
{
  v3 = [(_UIInternalDraggingSessionDestination *)self inAppSessionSource];

  if (v3)
  {
    id v4 = [(_UIInternalDraggingSessionDestination *)self inAppSessionSource];
    unint64_t v5 = [v4 withinAppSourceOperationMask];

    return v5;
  }
  else
  {
    return [(_UIInternalDraggingSessionDestination *)self outsideAppSourceOperationMask];
  }
}

- (NSArray)preDropItemProviders
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(_UIInternalDraggingSessionDestination *)self internalItems];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) itemProvider];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)takeVisibleDroppedItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v10 = [v9 itemIndex];
        long long v11 = [(_UIInternalDraggingSessionDestination *)self internalItems];
        unint64_t v12 = [v11 count];

        if (v10 < v12)
        {
          long long v13 = [(_UIInternalDraggingSessionDestination *)self internalItems];
          long long v14 = [v13 objectAtIndexedSubscript:v10];

          [v14 _setVisibleDropItemSize:visibleDroppedItemSize(v9)];
          [v9 center];
          objc_msgSend(v14, "_setVisibleDropItemCenter:");
          if (v9)
          {
            [v9 appliedTransform];
          }
          else
          {
            long long v17 = 0u;
            long long v18 = 0u;
            long long v16 = 0u;
          }
          v15[0] = v16;
          v15[1] = v17;
          v15[2] = v18;
          objc_msgSend(v14, "set_suggestedTransform:", v15);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

- (void)setUpDropAnimation:(id)a3 layerContext:(id *)a4
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73___UIInternalDraggingSessionDestination_setUpDropAnimation_layerContext___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  void aBlock[4] = self;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if ([v6 count])
  {
    id v8 = [_UIDragSetDownAnimation alloc];
    uint64_t v9 = [(_UIInternalDraggingSessionDestination *)self internalItems];
    unint64_t v10 = [(_UIDragSetDownAnimation *)v8 initWithVisibleDroppedItems:v6 items:v9 forSource:0 policyDriven:self->_isPolicyDriven completion:v7];
    setDownAnimation = self->_setDownAnimation;
    self->_setDownAnimation = v10;

    unint64_t v12 = [(_UIDragSetDownAnimation *)self->_setDownAnimation coordinateContainerWindow];
    long long v13 = [v12 layer];

    long long v14 = [(_UIDragSetDownAnimation *)self->_setDownAnimation coordinateContainerWindow];
    id v15 = [v14 windowScene];

    if (a4)
    {
      long long v16 = objc_opt_new();
      long long v17 = [v13 context];
      objc_msgSend(v16, "setContextID:", objc_msgSend(v17, "contextId"));

      [v16 setRenderID:CALayerGetRenderId()];
      long long v18 = [v15 systemShellHostingEnvironment];
      long long v19 = [v18 systemShellHostingSpaceIdentifier];

      [v16 setSystemShellHostingSpaceIdentifier:v19];
      id v20 = v16;
      *a4 = v20;
    }
  }
  else
  {
    v7[2](v7);
  }
}

- (void)handOffDroppedItems:(id)a3
{
  [(_UIDragSetDownAnimation *)self->_setDownAnimation updateVisibleDroppedItems:a3];
  setDownAnimation = self->_setDownAnimation;
  [(_UIDragSetDownAnimation *)setDownAnimation begin];
}

- (NSProgress)progress
{
  return [(_UIDataTransferMonitor *)self->_dataTransferMonitor progress];
}

- (unint64_t)actualDragOperationForProposedDragOperation:(unint64_t)a3 destinationDataOwner:(int64_t)a4 forbidden:(BOOL *)a5
{
  uint64_t v8 = [(_UIInternalDraggingSessionDestination *)self sourceDataOwner];
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp())
  {
    if ((_UIDropAllowedWithinAccountBasedApp(v8, a4) & 1) == 0)
    {
      a3 = 0;
      if (a5) {
        *a5 = 1;
      }
    }
  }
  return a3;
}

- (void)requestVisibleItems:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIInternalDraggingSessionDestination *)self druidConnection];
  [v5 requestVisibleItems:v4];
}

- (CGPoint)previewCenterForVisibleItem:(id)a3 inCoordinateSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 _visibleDropItemSize];
  if (v9 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v13 = *MEMORY[0x1E4F1DB20];
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  }
  else
  {
    long long v11 = [(_UIDropInteractionOwning *)self->_dropDestinationOwner _window];
    [v6 _visibleDropItemCenter];
    objc_msgSend(v7, "convertPoint:fromCoordinateSpace:", v11);
    double v13 = v12;
    double v15 = v14;
  }
  double v16 = v13;
  double v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIInternalDraggingSessionDestination *)self internalItems];
  enumerateDraggingItems(v5, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIInternalDraggingSessionDestination *)self itemsBecameDirty:v6];
}

- (CGPoint)draggingLocationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"coordinateSpace must be non-nil"];
  }
  [(_UIInternalDraggingSessionDestination *)self updateCentroidFromDragEvent];
  [(_UIInternalDraggingSessionDestination *)self centroid];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(_UIInternalDraggingSessionDestination *)self centroidWindow];
  if (v9
    || ([(_UIInternalDraggingSessionDestination *)self weakCentroidWindow],
        (double v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (_IsKindOfUIView((uint64_t)v4)) {
      objc_msgSend(v9, "convertPoint:toView:", v4, v6, v8);
    }
    else {
      objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v4, v6, v8);
    }
    double v12 = v10;
    double v13 = v11;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v14 = v12;
  double v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (_UIDropSessionImpl)dropSession
{
  return self->_dropSession;
}

- (CAPoint3D)centroid
{
  double x = self->_centroid.x;
  double y = self->_centroid.y;
  double z = self->_centroid.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIWindow)centroidWindow
{
  return self->_centroidWindow;
}

- (UIWindow)weakCentroidWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakCentroidWindow);
  return (UIWindow *)WeakRetained;
}

- (NSArray)dropItemProviders
{
  return self->_dropItemProviders;
}

- (int64_t)sourceDataOwner
{
  return self->_sourceDataOwner;
}

- (NSArray)internalItems
{
  return self->_internalItems;
}

- (void)setInternalItems:(id)a3
{
}

- (unint64_t)outsideAppSourceOperationMask
{
  return self->_outsideAppSourceOperationMask;
}

- (BOOL)isAccessibilitySession
{
  return self->_isAccessibilitySession;
}

- (BOOL)drivenByPointer
{
  return self->_drivenByPointer;
}

- (unint64_t)progressIndicatorStyle
{
  return self->_progressIndicatorStyle;
}

- (void)setProgressIndicatorStyle:(unint64_t)a3
{
  self->_progressIndicatorStyle = a3;
}

- (_UIDruidDestinationConnection)druidConnection
{
  return self->_druidConnection;
}

- (void)setDruidConnection:(id)a3
{
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_druidConnection, 0);
  objc_storeStrong((id *)&self->_internalItems, 0);
  objc_storeStrong((id *)&self->_dropItemProviders, 0);
  objc_destroyWeak((id *)&self->_weakCentroidWindow);
  objc_storeStrong((id *)&self->_centroidWindow, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_dragEvents, 0);
  objc_storeStrong((id *)&self->_lastPotentialDrop, 0);
  objc_storeStrong((id *)&self->_modalProgressAlertController, 0);
  objc_storeStrong((id *)&self->_dataTransferMonitor, 0);
  objc_storeStrong((id *)&self->_droppedItemCollection, 0);
  objc_storeStrong((id *)&self->_setDownAnimation, 0);
  objc_storeStrong(&self->_postDropAnimationCompletionBlock, 0);
  objc_storeStrong(&self->_dropCompletionBlock, 0);
  objc_storeStrong(&self->_dropPerformBlock, 0);
  objc_destroyWeak((id *)&self->_dropDestinationWindow);
  objc_storeStrong((id *)&self->_dropDestinationOwner, 0);
  objc_storeStrong((id *)&self->_enteredDestinations, 0);
  objc_storeStrong((id *)&self->_sessionSource, 0);
}

@end