@interface _UIDragRelaySession
- (BOOL)draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3;
- (NSArray)dragItems;
- (_UIDragRelaySession)initWithDragItems:(id)a3;
- (_UIDragRelaySessionDelegate)delegate;
- (_UIInternalDraggingSessionSource)draggingSessionSource;
- (unint64_t)draggingSession:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4;
- (unsigned)sessionIdentifier;
- (void)_draggingSession:(id)a3 updatedPresentation:(id)a4;
- (void)beginDragFromView:(id)a3 point:(CGPoint)a4;
- (void)cancelDrag;
- (void)dragSessionCompletedInitialCheckIn;
- (void)draggingSessionDidEnd:(id)a3 withOperation:(unint64_t)a4;
- (void)draggingSessionDidTransferItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragItems:(id)a3;
- (void)setDraggingSessionSource:(id)a3;
- (void)setSessionIdentifier:(unsigned int)a3;
- (void)updateDragPreviewForItemsAtIndexes:(id)a3;
@end

@implementation _UIDragRelaySession

- (_UIDragRelaySession)initWithDragItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIDragRelaySession;
  v6 = [(_UIDragRelaySession *)&v17 init];
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "_updatePreferredPreview", (void)v13);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&v6->_dragItems, a3);
  }

  return v6;
}

- (void)beginDragFromView:(id)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v8 = [v7 window];
  objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  long long v13 = [(_UIDragRelaySession *)self dragItems];
  long long v14 = +[UIDraggingBeginningSessionConfiguration configurationWithItems:initialCentroidInSourceWindow:sourceView:](UIDraggingBeginningSessionConfiguration, "configurationWithItems:initialCentroidInSourceWindow:sourceView:", v13, v7, v10, v12, 0.0);

  long long v15 = [v7 window];
  long long v16 = [v15 screen];
  objc_super v17 = [v16 _dragManager];

  v18 = [v17 beginDragWithSessionConfiguration:v14];
  [(_UIDragRelaySession *)self setDraggingSessionSource:v18];
  [v18 setDelegate:self];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47___UIDragRelaySession_beginDragFromView_point___block_invoke;
  v19[3] = &unk_1E52DC308;
  objc_copyWeak(&v20, &location);
  [v17 performAfterCompletingPendingSessionRequests:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)dragSessionCompletedInitialCheckIn
{
  v3 = [(_UIDragRelaySession *)self draggingSessionSource];
  uint64_t v4 = [v3 state];

  if (v4 == 2)
  {
    id v5 = [(_UIDragRelaySession *)self draggingSessionSource];
    [v5 dragDidExitApp];

    v6 = [(_UIDragRelaySession *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    uint64_t v8 = [(_UIDragRelaySession *)self delegate];
    id v14 = v8;
    if (v7)
    {
      [v8 dragRelaySessionDidBegin:self];
    }
    else
    {
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        return;
      }
      id v14 = [(_UIDragRelaySession *)self delegate];
      [v14 dragDidBeginForRelaySession:self];
    }
  }
  else
  {
    double v9 = [(_UIDragRelaySession *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    double v11 = [(_UIDragRelaySession *)self delegate];
    id v14 = v11;
    if (v10)
    {
      [v11 dragRelaySessionDidFail:self];
    }
    else
    {
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0) {
        return;
      }
      id v14 = [(_UIDragRelaySession *)self delegate];
      [v14 dragFailedForRelaySession:self];
    }
  }
}

- (void)draggingSessionDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  v6 = [(_UIDragRelaySession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  uint64_t v8 = [(_UIDragRelaySession *)self delegate];
  id v10 = v8;
  if (v7)
  {
    [v8 dragRelaySession:self didEndDragWithDrop:a4 != 0];
  }
  else
  {
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    id v10 = [(_UIDragRelaySession *)self delegate];
    [v10 dragDidEndForRelaySession:self];
  }
}

- (void)draggingSessionDidTransferItems:(id)a3
{
  uint64_t v4 = [(_UIDragRelaySession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_UIDragRelaySession *)self delegate];
    [v6 dragRelaySessionDidEndDataTransfer:self];
  }
}

- (unint64_t)draggingSession:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4
{
  return 1;
}

- (void)_draggingSession:(id)a3 updatedPresentation:(id)a4
{
  id v5 = a4;
  char v7 = [[_UIDragMonitorSessionPresentationUpdate alloc] initWithDragPresentationUpdate:v5];

  id v6 = [(_UIDragRelaySession *)self delegate];
  [v6 dragRelaySession:self didUpdateDragPresentation:v7];
}

- (BOOL)draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  return 1;
}

- (void)updateDragPreviewForItemsAtIndexes:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __58___UIDragRelaySession_updateDragPreviewForItemsAtIndexes___block_invoke;
  char v12 = &unk_1E52DADC0;
  id v13 = v6;
  id v14 = self;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v9];

  uint64_t v8 = [(_UIDragRelaySession *)self draggingSessionSource];
  [v8 itemsBecameDirty:v7];
}

- (void)cancelDrag
{
  id v2 = [(_UIDragRelaySession *)self draggingSessionSource];
  [v2 cancelDrag];
}

- (_UIDragRelaySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDragRelaySessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_sessionIdentifier = a3;
}

- (_UIInternalDraggingSessionSource)draggingSessionSource
{
  return self->_draggingSessionSource;
}

- (void)setDraggingSessionSource:(id)a3
{
}

- (NSArray)dragItems
{
  return self->_dragItems;
}

- (void)setDragItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItems, 0);
  objc_storeStrong((id *)&self->_draggingSessionSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end