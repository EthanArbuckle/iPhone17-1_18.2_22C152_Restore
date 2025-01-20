@interface _UIInternalDraggingSessionSource
- (BOOL)_canHandOffCancelledItems:(id)a3;
- (BOOL)_routingPolicyHasSpecificTouchContextIDs;
- (BOOL)canAddItems;
- (BOOL)didHandOffDragImage;
- (BOOL)dynamicallyUpdatesPrefersFullSizePreviews;
- (BOOL)isActive;
- (BOOL)prefersFullSizePreview;
- (BOOL)preventsSimultaneousDragFromView:(id)a3;
- (BOOL)restrictedToSourceApp;
- (BOOL)shouldCancelOnAppDeactivation;
- (BOOL)touchRoutingPolicyContainsContextIDToAlwaysSend:(unsigned int)a3;
- (CAPoint3D)centroid;
- (CGPoint)draggingLocationInCoordinateSpace:(id)a3;
- (NSArray)internalItems;
- (UIDragEvent)dragEvent;
- (UIView)sourceView;
- (UIWindow)centroidWindow;
- (UIWindow)weakCentroidWindow;
- (_UIDraggingSessionDelegate)delegate;
- (_UIDruidSourceConnection)druidConnection;
- (_UIInternalDraggingSessionSource)initWithDragManager:(id)a3 configuration:(id)a4;
- (id)touchRoutingPolicy;
- (int64_t)dataOwner;
- (int64_t)state;
- (unint64_t)draggingSourceOperationMask;
- (unint64_t)outsideAppSourceOperationMask;
- (unint64_t)resultOperation;
- (unint64_t)withinAppSourceOperationMask;
- (unsigned)sessionIdentifier;
- (void)_didBeginDrag;
- (void)_endWithOperation:(unint64_t)a3;
- (void)_getOperationMaskFromDelegate;
- (void)_handOffCancelledItems:(id)a3;
- (void)_hostDidDeactivate;
- (void)_hostWillBecomeActive;
- (void)_sendDataTransferFinished;
- (void)_sendDidEndWithOperation:(unint64_t)a3;
- (void)_sendDidMove;
- (void)_sendDragPreviewReplyWithIndexSet:(id)a3 dragPreviews:(id)a4 completion:(id)a5;
- (void)_sendHandedOffDragImage;
- (void)_sendHandedOffDragImageForItem:(id)a3;
- (void)_sendWillAddItems:(id)a3;
- (void)_sendWillBegin;
- (void)_sendWillEndWithOperation:(unint64_t)a3;
- (void)_setupAnimationForCancelledItems:(id)a3 returningLayerContext:(id *)a4;
- (void)_updatedPresentation:(id)a3;
- (void)addPublicItems:(id)a3;
- (void)beginDrag:(id)a3;
- (void)cancelDrag;
- (void)dragDidExitApp;
- (void)dragIsInsideApp;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)itemsBecameDirty:(id)a3;
- (void)setDataOwner:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDragEvent:(id)a3;
- (void)setDruidConnection:(id)a3;
- (void)setInternalItems:(id)a3;
- (void)setResultOperation:(unint64_t)a3;
- (void)setSourceView:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateCentroidFromDragEvent;
@end

@implementation _UIInternalDraggingSessionSource

- (id)touchRoutingPolicy
{
  return [(UIDraggingSessionConfiguration *)self->_configuration routingPolicy];
}

- (BOOL)touchRoutingPolicyContainsContextIDToAlwaysSend:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(_UIDraggingImageSlotOwner *)self dragManager];
  v6 = [v5 screen];
  v7 = [v6 displayConfiguration];
  uint64_t v8 = [v7 hardwareIdentifier];
  v9 = (void *)v8;
  v10 = _UIDraggingSystemEmbeddedDisplayIdentifier;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  v12 = [(UIDraggingSessionConfiguration *)self->_configuration routingPolicy];
  v13 = [v12 contextIDsToAlwaysSendTouchesByDisplayIdentifier];
  v14 = [v13 objectForKey:v11];

  v15 = [NSNumber numberWithUnsignedInt:v3];
  LOBYTE(v12) = [v14 containsObject:v15];

  return (char)v12;
}

- (_UIInternalDraggingSessionSource)initWithDragManager:(id)a3 configuration:(id)a4
{
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIInternalDraggingSessionSource;
  uint64_t v8 = [(_UIDraggingImageSlotOwner *)&v24 initWithDragManager:a3];
  v9 = v8;
  if (v8)
  {
    v8->_state = 0;
    objc_storeStrong((id *)&v8->_configuration, a4);
    v10 = [v7 items];
    uint64_t v11 = [v10 copy];
    internalItems = v9->_internalItems;
    v9->_internalItems = (NSArray *)v11;

    v9->_dataOwner = [v7 dataOwner];
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dragStarted"];
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueForKnownInternalAppsForKey:@"dragStartedFrom" bundleID:0];
    if (_UIApplicationIsExtension()) {
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dragStartedFromExtension"];
    }
    +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:@"itemsPickedUp" forKey:(double)[(NSArray *)v9->_internalItems count]];
    _UIDragStatisticLogItemsInDragByType(v9->_internalItems, @"itemsPickedUpByType");
    v13 = [v7 sourceView];
    v14 = [v13 window];
    v9->_originatedInHostedWindow = [v14 _isHostedInAnotherProcess];

    if (v9->_originatedInHostedWindow)
    {
      v9->_hostIsActive = 1;
      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 addObserver:v9 selector:sel__hostWillBecomeActive name:0x1ED180360 object:0];
      [v15 addObserver:v9 selector:sel__hostDidDeactivate name:0x1ED180380 object:0];
    }
    v16 = [v7 sourceView];
    uint64_t v17 = [v16 window];
    centroidWindow = v9->_centroidWindow;
    v9->_centroidWindow = (UIWindow *)v17;

    [v7 initialCentroidInSourceWindow];
    v9->_centroid.x = v19;
    v9->_centroid.y = v20;
    v9->_centroid.double z = v21;
    v9->_restrictedToSourceApp = [v7 sessionIsRestrictedToSourceApplication];
    double z = v9->_centroid.z;
    *(_OWORD *)&v9->_lastNotifiedCentroid.x = *(_OWORD *)&v9->_centroid.x;
    v9->_lastNotifiedCentroid.double z = z;
  }

  return v9;
}

- (void)setState:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_unint64_t state = a3;
    v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &setState____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = stringFromDraggingSessionSourceState(state);
      v9 = stringFromDraggingSessionSourceState(a3);
      int v14 = 138412546;
      v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "_UIInternalDraggingSessionSource: Drag session state changing from %@ to %@", (uint8_t *)&v14, 0x16u);
    }
    switch(a3)
    {
      case 2:
        [(_UIInternalDraggingSessionSource *)self _sendWillBegin];
        [(_UIInternalDraggingSessionSource *)self _getOperationMaskFromDelegate];
        break;
      case 3:
      case 6:
        [(_UIInternalDraggingSessionSource *)self _endWithOperation:0];
        v10 = [(_UIDraggingImageSlotOwner *)self dragManager];
        [v10 sessionSourceDidEnd:self];

        break;
      case 4:
        [(_UIInternalDraggingSessionSource *)self _endWithOperation:[(_UIInternalDraggingSessionSource *)self resultOperation]];
        +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:@"itemsDroppedSuccessfully" forKey:(double)[(NSArray *)self->_internalItems count]];
        _UIDragStatisticLogItemsInDragByType(self->_internalItems, @"itemsDroppedSuccessfullyByType");
        uint64_t v11 = @"dropSuccessful";
        v12 = @"dropSuccessfullFrom";
        goto LABEL_9;
      case 5:
        [(_UIInternalDraggingSessionSource *)self _endWithOperation:0];
        v13 = [(_UIDraggingImageSlotOwner *)self dragManager];
        [v13 sessionSourceDidEnd:self];

        uint64_t v11 = @"dropCancelled";
        v12 = @"dropCancelledFrom";
LABEL_9:
        +[_UIKitDragAndDropStatistics incrementUIKitScalarValueForKnownInternalAppsForKey:v12 bundleID:0];
        +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:v11];
        +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:@"itemsTotalInDragSession" forKey:(double)[(NSArray *)self->_internalItems count]];
        _UIDragStatisticLogItemsInDragByType(self->_internalItems, @"itemsTotalInDragSessionByType");
        break;
      default:
        return;
    }
  }
}

- (BOOL)preventsSimultaneousDragFromView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIInternalDraggingSessionSource *)self sourceView];

  BOOL v6 = v5 == v4 && [(_UIInternalDraggingSessionSource *)self state] < 3;
  return v6;
}

- (BOOL)prefersFullSizePreview
{
  uint64_t v3 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v6 = [v5 draggingSessionPrefersFullSizePreviews:self];

  return v6;
}

- (BOOL)dynamicallyUpdatesPrefersFullSizePreviews
{
  uint64_t v3 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v6 = [v5 draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:self];

  return v6;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIInternalDraggingSessionSource *)self internalItems];
  enumerateDraggingItems(v5, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIInternalDraggingSessionSource *)self itemsBecameDirty:v6];
}

- (CGPoint)draggingLocationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"coordinateSpace must be non-nil"];
  }
  [(_UIInternalDraggingSessionSource *)self centroid];
  double v6 = v5;
  double v8 = v7;
  v9 = [(_UIInternalDraggingSessionSource *)self centroidWindow];
  if (v9
    || ([(_UIInternalDraggingSessionSource *)self weakCentroidWindow],
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
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

- (unint64_t)draggingSourceOperationMask
{
  return self->_withinAppSourceOperationMask;
}

- (BOOL)_routingPolicyHasSpecificTouchContextIDs
{
  uint64_t v3 = [(_UIDraggingImageSlotOwner *)self dragManager];
  id v4 = [v3 screen];
  double v5 = [v4 displayConfiguration];
  uint64_t v6 = [v5 hardwareIdentifier];
  double v7 = (void *)v6;
  double v8 = _UIDraggingSystemEmbeddedDisplayIdentifier;
  if (v6) {
    double v8 = (__CFString *)v6;
  }
  v9 = v8;

  double v10 = [(UIDraggingSessionConfiguration *)self->_configuration routingPolicy];
  double v11 = [v10 contextIDsToAlwaysSendTouchesByDisplayIdentifier];
  double v12 = [v11 objectForKey:v9];

  LOBYTE(v10) = [v12 count] != 0;
  return (char)v10;
}

- (void)beginDrag:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = dyld_program_sdk_at_least();
  int64_t v7 = [(_UIInternalDraggingSessionSource *)self state];
  if (v6)
  {
    if (!v7) {
      goto LABEL_5;
    }
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIDragging.m", 821, @"can't begin a drag session from state %d", [(_UIInternalDraggingSessionSource *)self state] object file lineNumber description];
    goto LABEL_12;
  }
  if (v7)
  {
    double v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1E8FDE300) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v8 = v15;
      *(_DWORD *)buf = 67109120;
      int v20 = [(_UIInternalDraggingSessionSource *)self state];
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "can't begin a drag session from state %d", buf, 8u);
LABEL_12:
    }
  }
LABEL_5:
  int v9 = dyld_program_sdk_at_least();
  double v10 = [(_UIInternalDraggingSessionSource *)self druidConnection];

  if (v9)
  {
    if (v10)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"UIDragging.m" lineNumber:822 description:@"shouldn't have a druid connection yet"];
    }
  }
  else if (v10)
  {
    __int16 v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1E8FDE308) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "shouldn't have a druid connection yet", buf, 2u);
    }
  }
  [(_UIInternalDraggingSessionSource *)self setState:1];
  double v12 = objc_alloc_init(_UIDruidSourceConnection);
  [(_UIInternalDraggingSessionSource *)self setDruidConnection:v12];
  configuration = self->_configuration;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46___UIInternalDraggingSessionSource_beginDrag___block_invoke;
  v17[3] = &unk_1E52EC1D8;
  v17[4] = self;
  id v18 = v5;
  id v14 = v5;
  [(_UIDruidSourceConnection *)v12 beginDragWithConfiguration:configuration completion:v17];
}

- (void)_sendDragPreviewReplyWithIndexSet:(id)a3 dragPreviews:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (void *)UIApp;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke;
  v15[3] = &unk_1E52E65E0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [v11 _performBlockAfterCATransactionCommits:v15];
}

- (void)_didBeginDrag
{
  [(_UIInternalDraggingSessionSource *)self setState:2];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke;
  v19[3] = &unk_1E52EC200;
  objc_copyWeak(&v20, &location);
  uint64_t v3 = [(_UIInternalDraggingSessionSource *)self druidConnection];
  [v3 setDragPreviewProviderBlock:v19];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_2;
  v17[3] = &unk_1E52EC228;
  objc_copyWeak(&v18, &location);
  id v4 = [(_UIInternalDraggingSessionSource *)self druidConnection];
  [v4 setUpdatedPresentationBlock:v17];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_3;
  v15[3] = &unk_1E52EC250;
  objc_copyWeak(&v16, &location);
  id v5 = [(_UIInternalDraggingSessionSource *)self druidConnection];
  [v5 setCanHandOffCancelledItemsBlock:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_4;
  v13[3] = &unk_1E52EC278;
  objc_copyWeak(&v14, &location);
  int v6 = [(_UIInternalDraggingSessionSource *)self druidConnection];
  [v6 setHandOffCancelledItemsBlock:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_5;
  v11[3] = &unk_1E52EC2A0;
  objc_copyWeak(&v12, &location);
  int64_t v7 = [(_UIInternalDraggingSessionSource *)self druidConnection];
  [v7 setDragCompletionBlock:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_6;
  v9[3] = &unk_1E52DC308;
  objc_copyWeak(&v10, &location);
  id v8 = [(_UIInternalDraggingSessionSource *)self druidConnection];
  [v8 setDataTransferFinishedBlock:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_getOperationMaskFromDelegate
{
  uint64_t v3 = [(_UIInternalDraggingSessionSource *)self delegate];
  self->_withinAppSourceOperationMask = [v3 draggingSession:self sourceOperationMaskForDraggingWithinApp:1];

  id v4 = [(_UIInternalDraggingSessionSource *)self delegate];
  self->_outsideAppSourceOperationMask = [v4 draggingSession:self sourceOperationMaskForDraggingWithinApp:0];

  BOOL v5 = [(_UIInternalDraggingSessionSource *)self prefersFullSizePreview];
  id v6 = [(_UIInternalDraggingSessionSource *)self druidConnection];
  [v6 takeInsideAppSourceOperationMask:self->_withinAppSourceOperationMask outsideAppSourceOperationMask:self->_outsideAppSourceOperationMask prefersFullSizePreview:v5];
}

- (void)itemsBecameDirty:(id)a3
{
  id v5 = a3;
  if ([v5 count] && -[_UIInternalDraggingSessionSource state](self, "state") == 2)
  {
    id v4 = [(_UIInternalDraggingSessionSource *)self druidConnection];
    [v4 dirtyItems:v5];
  }
}

- (void)updateCentroidFromDragEvent
{
  if ([(_UIInternalDraggingSessionSource *)self state] == 2)
  {
    uint64_t v3 = [(_UIInternalDraggingSessionSource *)self dragEvent];

    if (v3)
    {
      id v4 = [(_UIInternalDraggingSessionSource *)self dragEvent];
      [v4 locationInView:0];
      double v6 = v5;
      double v8 = v7;

      self->_centroid.x = v6;
      self->_centroid.y = v8;
      self->_centroid.double z = 0.0;
      id v9 = [(_UIInternalDraggingSessionSource *)self dragEvent];
      id v10 = [v9 eventWindow];
      centroidWindow = self->_centroidWindow;
      self->_centroidWindow = v10;
    }
    if ((CAPoint3DEqualToPoint() & 1) == 0)
    {
      [(_UIInternalDraggingSessionSource *)self _sendDidMove];
      long long v12 = *(_OWORD *)&self->_centroid.x;
      self->_lastNotifiedCentroid.double z = self->_centroid.z;
      *(_OWORD *)&self->_lastNotifiedCentroid.x = v12;
    }
  }
}

- (void)dragDidExitApp
{
  if ([(_UIInternalDraggingSessionSource *)self state] == 2)
  {
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DraggingExitTimerDuration, @"DraggingExitTimerDuration", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v3 = 0.2; {
    else
    }
      double v3 = *(double *)&qword_1E8FD5100;
    objc_initWeak(&location, self);
    id v4 = (void *)MEMORY[0x1E4F1CB00];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50___UIInternalDraggingSessionSource_dragDidExitApp__block_invoke;
    v7[3] = &unk_1E52DAB28;
    objc_copyWeak(&v8, &location);
    double v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:v3];
    waitingToSendDidExitAppTimer = self->_waitingToSendDidExitAppTimer;
    self->_waitingToSendDidExitAppTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)dragIsInsideApp
{
  [(NSTimer *)self->_waitingToSendDidExitAppTimer invalidate];
  waitingToSendDidExitAppTimer = self->_waitingToSendDidExitAppTimer;
  self->_waitingToSendDidExitAppTimer = 0;
}

- (void)addPublicItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIInternalDraggingSessionSource *)self canAddItems])
  {
    double v5 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v6 = objc_msgSend(v4, "reverseObjectEnumerator", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObject:*(void *)(*((void *)&v19 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      double v11 = [(_UIInternalDraggingSessionSource *)self internalItems];
      uint64_t v12 = [v11 count];
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"itemsAddedToDrag"];
      if (v12)
      {
        if (v12 == 1) {
          id v13 = @"itemsAddedToSingleDrag";
        }
        else {
          id v13 = @"itemsAddedToMultipleDrag";
        }
        +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:v13];
      }

      id v14 = [(_UIInternalDraggingSessionSource *)self internalItems];
      double v15 = [v14 arrayByAddingObjectsFromArray:v5];
      [(_UIInternalDraggingSessionSource *)self setInternalItems:v15];

      id v16 = [(_UIInternalDraggingSessionSource *)self druidConnection];
      id v17 = [v16 addItems:v5 withOldItemCollection:self->_pbItemCollection];
      pbItemCollection = self->_pbItemCollection;
      self->_pbItemCollection = v17;

      [(_UIInternalDraggingSessionSource *)self _sendWillAddItems:v4];
    }
  }
}

- (BOOL)_canHandOffCancelledItems:(id)a3
{
  double v3 = self;
  id v4 = [(_UIInternalDraggingSessionSource *)self internalItems];
  LOBYTE(v3) = +[_UIDragSetDownAnimation canAnimateItems:v4 forSource:1 policyDriven:[(_UIInternalDraggingSessionSource *)v3 _routingPolicyHasSpecificTouchContextIDs]];

  return (char)v3;
}

- (void)_setupAnimationForCancelledItems:(id)a3 returningLayerContext:(id *)a4
{
  id v6 = a3;
  [(_UIInternalDraggingSessionSource *)self _sendWillEndWithOperation:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91___UIInternalDraggingSessionSource__setupAnimationForCancelledItems_returningLayerContext___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if ([v6 count])
  {
    uint64_t v8 = [_UIDragSetDownAnimation alloc];
    uint64_t v9 = [(_UIInternalDraggingSessionSource *)self internalItems];
    uint64_t v10 = [(_UIDragSetDownAnimation *)v8 initWithVisibleDroppedItems:v6 items:v9 forSource:1 policyDriven:[(_UIInternalDraggingSessionSource *)self _routingPolicyHasSpecificTouchContextIDs] completion:v7];
    setDownAnimation = self->_setDownAnimation;
    self->_setDownAnimation = v10;

    if (a4)
    {
      uint64_t v12 = [(_UIDragSetDownAnimation *)self->_setDownAnimation coordinateContainerWindow];
      id v13 = [v12 layer];

      id v14 = objc_alloc_init(_DUITargetLayerDescriptor);
      double v15 = [v13 context];
      -[_DUITargetLayerDescriptor setContextID:](v14, "setContextID:", [v15 contextId]);

      [(_DUITargetLayerDescriptor *)v14 setRenderID:CALayerGetRenderId()];
      id v16 = [(_UIDragSetDownAnimation *)self->_setDownAnimation coordinateContainerWindow];
      id v17 = [v16 windowScene];

      id v18 = [v17 systemShellHostingEnvironment];
      long long v19 = [v18 systemShellHostingSpaceIdentifier];
      [(_DUITargetLayerDescriptor *)v14 setSystemShellHostingSpaceIdentifier:v19];

      long long v20 = v14;
      *a4 = v20;
    }
  }
  else
  {
    v7[2](v7);
  }
}

- (void)_handOffCancelledItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v10 = [v9 itemIndex];
        double v11 = [(_UIInternalDraggingSessionSource *)self internalItems];
        unint64_t v12 = [v11 count];

        if (v10 < v12)
        {
          id v13 = [(_UIInternalDraggingSessionSource *)self internalItems];
          id v14 = [v13 objectAtIndexedSubscript:v10];

          [v14 _setVisibleDropItemSize:visibleDroppedItemSize(v9)];
          [v9 center];
          objc_msgSend(v14, "_setVisibleDropItemCenter:");
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  [(_UIDragSetDownAnimation *)self->_setDownAnimation updateVisibleDroppedItems:v4];
  [(_UIDragSetDownAnimation *)self->_setDownAnimation begin];
}

- (void)_endWithOperation:(unint64_t)a3
{
  -[_UIInternalDraggingSessionSource _sendWillEndWithOperation:](self, "_sendWillEndWithOperation:");
  [(_UIInternalDraggingSessionSource *)self _sendDidEndWithOperation:a3];
  objc_storeWeak((id *)&self->_weakCentroidWindow, self->_centroidWindow);
  centroidWindow = self->_centroidWindow;
  self->_centroidWindow = 0;
}

- (void)_sendWillEndWithOperation:(unint64_t)a3
{
  if (!self->_sentWillEnd)
  {
    self->_sentWillEnd = 1;
    uint64_t v5 = [(_UIInternalDraggingSessionSource *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(_UIInternalDraggingSessionSource *)self delegate];
      [v7 draggingSessionWillEnd:self withOperation:a3];
    }
  }
}

- (BOOL)shouldCancelOnAppDeactivation
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v4 = (int *)&_MergedGlobals_15;
    uint64_t v5 = @"CancelOnDeactivationPad";
  }
  else
  {
    id v4 = (int *)&unk_1EB257198;
    uint64_t v5 = @"CancelOnDeactivationPhone";
  }
  return (*((unsigned char *)v4 + 4) != 0) & ~_UIInternalPreferenceUsesDefault(v4, (uint64_t)v5, (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
}

- (void)cancelDrag
{
  if ((unint64_t)[(_UIInternalDraggingSessionSource *)self state] <= 2)
  {
    id v3 = [(_UIInternalDraggingSessionSource *)self druidConnection];
    [v3 cancelDrag];
  }
}

- (BOOL)canAddItems
{
  if ([(_UIInternalDraggingSessionSource *)self state] == 2)
  {
    id v3 = [(_UIInternalDraggingSessionSource *)self druidConnection];
    int v4 = [v3 isCancelled] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isActive
{
  return [(_UIInternalDraggingSessionSource *)self state] < 3;
}

- (BOOL)didHandOffDragImage
{
  return self->_didHandOffDragImage;
}

- (void)_hostWillBecomeActive
{
  self->_hostIsActive = 1;
}

- (void)_hostDidDeactivate
{
  self->_hostIsActive = 0;
  if ([(_UIInternalDraggingSessionSource *)self shouldCancelOnAppDeactivation])
  {
    [(_UIInternalDraggingSessionSource *)self cancelDrag];
  }
}

- (void)_sendWillBegin
{
  id v3 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v5 draggingSessionWillBegin:self];
  }
}

- (void)_sendHandedOffDragImage
{
  id v3 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v5 _draggingSessionHandedOffDragImage:self];
  }
}

- (void)_sendHandedOffDragImageForItem:(id)a3
{
  id v7 = a3;
  char v4 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v6 _draggingSession:self handedOffDragImageForItem:v7];
  }
}

- (void)_sendWillAddItems:(id)a3
{
  id v7 = a3;
  char v4 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v6 draggingSession:self willAddItems:v7];
  }
}

- (void)_sendDidEndWithOperation:(unint64_t)a3
{
  char v5 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v7 draggingSessionDidEnd:self withOperation:a3];
  }
}

- (void)_sendDidMove
{
  id v3 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v5 draggingSessionDidMove:self];
  }
}

- (void)_sendDataTransferFinished
{
  id v3 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v5 draggingSessionDidTransferItems:self];
  }
}

- (void)_updatedPresentation:(id)a3
{
  id v7 = a3;
  char v4 = [(_UIInternalDraggingSessionSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_UIInternalDraggingSessionSource *)self delegate];
    [v6 _draggingSession:self updatedPresentation:v7];
  }
}

- (_UIDraggingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDraggingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDragEvent)dragEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
  return (UIDragEvent *)WeakRetained;
}

- (void)setDragEvent:(id)a3
{
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)resultOperation
{
  return self->_resultOperation;
}

- (void)setResultOperation:(unint64_t)a3
{
  self->_resultOperation = a3;
}

- (NSArray)internalItems
{
  return self->_internalItems;
}

- (void)setInternalItems:(id)a3
{
}

- (int64_t)dataOwner
{
  return self->_dataOwner;
}

- (void)setDataOwner:(int64_t)a3
{
  self->_dataOwner = a3;
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

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)restrictedToSourceApp
{
  return self->_restrictedToSourceApp;
}

- (unint64_t)withinAppSourceOperationMask
{
  return self->_withinAppSourceOperationMask;
}

- (unint64_t)outsideAppSourceOperationMask
{
  return self->_outsideAppSourceOperationMask;
}

- (_UIDruidSourceConnection)druidConnection
{
  return self->_druidConnection;
}

- (void)setDruidConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_druidConnection, 0);
  objc_destroyWeak((id *)&self->_weakCentroidWindow);
  objc_storeStrong((id *)&self->_centroidWindow, 0);
  objc_storeStrong((id *)&self->_internalItems, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_dragEvent);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_waitingToSendDidExitAppTimer, 0);
  objc_storeStrong((id *)&self->_setDownAnimation, 0);
  objc_storeStrong((id *)&self->_touchRoutingPolicy, 0);
  objc_storeStrong((id *)&self->_pbItemCollection, 0);
}

@end