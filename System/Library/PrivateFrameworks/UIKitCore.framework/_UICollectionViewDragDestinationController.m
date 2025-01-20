@interface _UICollectionViewDragDestinationController
+ (id)controllerForCollectionView:(void *)a3 delegate:;
- (BOOL)_hasGapLargeEnoughToRequireDropActionCallForCurrentItemAttributes:(id)a3 proposedNextItemAttributes:(id)a4;
- (BOOL)_isLocalInteractiveMove;
- (BOOL)_isMultiItemSource;
- (BOOL)_shouldQueryDropActionForIndexPath:(id)a3;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)hasPerformedReordering;
- (BOOL)shouldPerformMovementForCurrentProposal;
- (BOOL)supportsLocalSessionReordering;
- (NSString)description;
- (_UICollectionViewDragDestinationController)initWithCollectionView:(id)a3 delegate:(id)a4;
- (id)_computeNextItemAttributesStartingFromItemAttributes:(id)a3 withCurrentDragLocation:(CGPoint)a4;
- (id)_dragDestinationDelegateActual;
- (id)_dragDestinationDelegateProxy;
- (id)_dropDelegateActual;
- (id)_dropDelegateProxy;
- (id)_effectiveDropProposalForProposal:(id)a3;
- (id)_queryClientForPreviewParametersForItemAtIndexPath:(id)a3;
- (id)currentDropProposal;
- (id)currentDropSession;
- (id)currentIndexPath;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)reorderingState;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (uint64_t)isActive;
- (void)_beginOrResumeDropSession:(id)a3;
- (void)_cancelCurrentInteractiveReorder;
- (void)_cancelInteractiveReorderingIfNeeded;
- (void)_commitCurrentDragAndDropSession;
- (void)_commitCurrentInteractiveReordering;
- (void)_configureInteraction;
- (void)_configureReorderingDisplayLinkIfNeeded;
- (void)_endInteractiveReorderingIfNeeded;
- (void)_pauseReorderingDisplayLink;
- (void)_reorderingDisplayLinkDidTick;
- (void)_resumeReorderingDisplayLink;
- (void)_updateDropProposalByQueryingClientIfNeeded:(id)a3 indicatorLayoutAttributes:(id)a4;
- (void)deactivate;
- (void)dealloc;
- (void)dragSourceSelectedItemCountDidChangeWithCount:(id *)a1;
- (void)dropInsertionRolledBack;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)dropProposalState;
- (void)dropWasCancelled;
- (void)rebaseForUpdates:(void *)a1;
- (void)resumeDrops;
- (void)sessionState;
- (void)setReorderingState:(uint64_t)a1;
- (void)suspendDrops;
@end

@implementation _UICollectionViewDragDestinationController

- (uint64_t)isActive
{
  if (!a1) {
    return 0;
  }
  -[_UICollectionViewDragDestinationController sessionState](a1);
  v1 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    unsigned int v2 = v1[2];
    BOOL v3 = v2 > 9;
    unsigned int v4 = (0x2FEu >> v2) & 1;
    if (v3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v4;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)sessionState
{
  if (a1)
  {
    unsigned int v2 = a1;
    BOOL v3 = (void *)a1[5];
    if (!v3)
    {
      unsigned int v4 = objc_alloc_init(_UIDragDestinationControllerSessionState);
      uint64_t v5 = (void *)v2[5];
      v2[5] = v4;

      BOOL v3 = (void *)v2[5];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)controllerForCollectionView:(void *)a3 delegate:
{
  id v4 = a3;
  id v5 = a2;
  v6 = (void *)[objc_alloc((Class)self) initWithCollectionView:v5 delegate:v4];

  return v6;
}

- (_UICollectionViewDragDestinationController)initWithCollectionView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewDragDestinationController;
  v8 = [(_UICollectionViewDragDestinationController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    [(_UICollectionViewDragDestinationController *)v9 _configureInteraction];
  }

  return v9;
}

- (void)_configureInteraction
{
  obj = [[UIDropInteraction alloc] initWithDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  [WeakRetained addInteraction:obj];

  if (self) {
    objc_storeWeak((id *)&self->_dropInteraction, obj);
  }
}

- (void)deactivate
{
  if (a1)
  {
    [*(id *)(a1 + 32) invalidate];
    unsigned int v2 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
      id v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      id v5 = v4;
      if (v4)
      {
        int v6 = v4[2];
        if ((v6 - 1) < 7 || v6 == 9)
        {

          id v7 = objc_loadWeakRetained((id *)(a1 + 24));
          v8 = v7;
          if (v7) {
            [v7 _decrementSessionRefCount];
          }

          id v5 = objc_loadWeakRetained((id *)(a1 + 8));
          [v5 _resetDropTargetAppearance];
        }
      }

      id v9 = objc_loadWeakRetained((id *)(a1 + 8));
      id v10 = objc_loadWeakRetained((id *)(a1 + 16));
      [v9 removeInteraction:v10];

      objc_storeWeak((id *)(a1 + 16), 0);
    }
    *(void *)(a1 + 64) = 0;
  }
}

- (void)dealloc
{
  -[_UICollectionViewDragDestinationController deactivate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewDragDestinationController;
  [(_UICollectionViewDragDestinationController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropProposalState, 0);
  objc_storeStrong((id *)&self->_reorderingState, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_reorderDisplayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dropInteraction);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = -[_UICollectionViewDragDestinationController sessionState](self);
  id v7 = -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v8 = -[_UICollectionViewDragDestinationController dropProposalState](self);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; sessionState = %@; reorderingState = %@; dropProposalState = %@>",
    v5,
    self,
    v6,
    v7,
  id v9 = v8);

  return (NSString *)v9;
}

- (id)reorderingState
{
  if (a1)
  {
    unsigned int v2 = a1;
    id v3 = a1[6];
    if (!v3)
    {
      id v4 = [_UIDragDestinationControllerReorderingState alloc];
      id v5 = -[_UICollectionViewDragDestinationController sessionState](v2);
      id WeakRetained = objc_loadWeakRetained(v2 + 1);
      id v7 = v5;
      id v8 = WeakRetained;
      if (v4)
      {
        v14.receiver = v4;
        v14.super_class = (Class)_UIDragDestinationControllerReorderingState;
        id v9 = (_UIDragDestinationControllerReorderingState *)objc_msgSendSuper2(&v14, sel_init);
        id v4 = v9;
        if (v9)
        {
          objc_storeStrong((id *)&v9->_sessionState, v5);
          objc_storeWeak((id *)&v4->_collectionView, v8);
          id v10 = objc_alloc_init(_UIVelocityIntegrator);
          velocityIntegrator = v4->_velocityIntegrator;
          v4->_velocityIntegrator = v10;

          [(_UIVelocityIntegrator *)v4->_velocityIntegrator setMinimumRequiredMovement:0.0];
          v4->_dragMovementPhase = 0;
        }
      }

      id v12 = v2[6];
      v2[6] = v4;

      id v3 = v2[6];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)dropProposalState
{
  if (a1)
  {
    unsigned int v2 = a1;
    id v3 = (void *)a1[7];
    if (!v3)
    {
      id v4 = objc_alloc_init(_UIDragDestinationControllerDropProposalState);
      id v5 = (void *)v2[7];
      v2[7] = v4;

      id v3 = (void *)v2[7];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)supportsLocalSessionReordering
{
  if (!a1) {
    return 0;
  }
  -[_UICollectionViewDragDestinationController reorderingState](a1);
  uint64_t v1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v1) {
    BOOL v2 = v1[8] != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (id)currentIndexPath
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionViewDragDestinationController dropProposalState](a1);
    BOOL v2 = (void *)v1;
    if (v1) {
      id v3 = *(void **)(v1 + 24);
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)currentDropProposal
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionViewDragDestinationController dropProposalState](a1);
    BOOL v2 = (void *)v1;
    if (v1) {
      id v3 = *(void **)(v1 + 16);
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)currentDropSession
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionViewDragDestinationController sessionState](a1);
    BOOL v2 = (void *)v1;
    if (v1) {
      id v3 = *(void **)(v1 + 16);
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)dragSourceSelectedItemCountDidChangeWithCount:(id *)a1
{
  if (a1)
  {
    -[_UICollectionViewDragDestinationController reorderingState](a1);
    id v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      int v5 = v4[8];

      if (a2 >= 2)
      {
        if (v5)
        {
          [a1 _cancelCurrentInteractiveReorder];
          -[_UICollectionViewDragDestinationController sessionState](a1);
          int v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          if (v6 && v6[2] != 5) {
            v6[2] = 5;
          }
        }
      }
    }
  }
}

- (void)dropWasCancelled
{
  if (a1)
  {
    -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
    BOOL v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      int v3 = v2[2];
      if ((v3 - 1) < 7 || v3 == 9)
      {

        [(id)a1 _cancelInteractiveReorderingIfNeeded];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        [WeakRetained _resetDropTargetAppearance];

        -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
        BOOL v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v2)
        {
          if (v2[2] != 7) {
            v2[2] = 7;
          }
        }
      }
    }
  }
}

- (void)dropInsertionRolledBack
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    int v3 = -[_UICollectionViewDragDestinationController currentIndexPath]((void *)a1);
    id v5 = [WeakRetained indexPathBeforeShadowUpdates:v3];

    if (v5)
    {
      id v4 = -[_UICollectionViewDragDestinationController dropProposalState]((void *)a1);
      -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v4, v5);
    }
  }
}

- (BOOL)hasPerformedReordering
{
  uint64_t v2 = -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  BOOL v3 = v2 && *(uint64_t *)(v2 + 24) >= 1 && *(unsigned char *)(v2 + 8) != 0;

  return v3;
}

- (void)suspendDrops
{
  if (!a1) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v2 + 1;
  if (v2) {
    return;
  }
  -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
  BOOL v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    unsigned int v4 = v3[2];
    if (v4 < 6 || v4 == 9)
    {

      uint64_t v6 = -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
      id v7 = (void *)v6;
      id v8 = v6 ? *(void **)(v6 + 16) : 0;
      v20 = v8;

      BOOL v3 = v20;
      if (v20)
      {
        [(id)a1 _pauseReorderingDisplayLink];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
        id v10 = WeakRetained;
        if (WeakRetained) {
          [WeakRetained _updatePreferredDraggedCellAppearanceForSessionUpdate];
        }

        -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
        objc_super v11 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v11 && v11[2] != 8) {
          v11[2] = 8;
        }

        id v12 = (id *)(a1 + 8);
        id v13 = objc_loadWeakRetained((id *)(a1 + 8));
        [v13 _resetDropTargetAppearance];

        objc_super v14 = [(id)a1 _dropDelegateActual];
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          v16 = [(id)a1 _dropDelegateProxy];
          id v17 = objc_loadWeakRetained(v12);
          [v16 collectionView:v17 dropSessionDidExit:v20];
        }
        else
        {
          v18 = [(id)a1 _dragDestinationDelegateActual];
          char v19 = objc_opt_respondsToSelector();

          if ((v19 & 1) == 0)
          {
LABEL_23:
            BOOL v3 = v20;
            goto LABEL_24;
          }
          v16 = [(id)a1 _dragDestinationDelegateProxy];
          id v17 = objc_loadWeakRetained(v12);
          [v16 _collectionView:v17 dropSessionDidExit:v20];
        }

        goto LABEL_23;
      }
    }
  }
LABEL_24:
}

- (void)resumeDrops
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v8 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      int v10 = 136315650;
      objc_super v11 = "-[_UICollectionViewDragDestinationController resumeDrops]";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      uint64_t v15 = a1;
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unbalanced call to %s. Collection view: %@; destination controller: %@",
        (uint8_t *)&v10,
        0x20u);
    }
    else
    {
      id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &resumeDrops___s_category) + 8);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        return;
      }
      id v8 = v7;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      int v10 = 136315650;
      objc_super v11 = "-[_UICollectionViewDragDestinationController resumeDrops]";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      uint64_t v15 = a1;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unbalanced call to %s. Collection view: %@; destination controller: %@",
        (uint8_t *)&v10,
        0x20u);
    }

LABEL_16:
    return;
  }
  uint64_t v3 = v2 - 1;
  *(void *)(a1 + 64) = v3;
  if (!v3)
  {
    -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
    unsigned int v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      int v5 = v4[2];

      if (v5 == 8)
      {
        -[_UICollectionViewDragDestinationController sessionState]((void *)a1);
        uint64_t v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v6 && v6[2] != 9) {
          v6[2] = 9;
        }
      }
    }
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
    if (self) {
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    }
    char v9 = [v8 collectionView:self canHandleDropSession:v5];
  }
  else
  {
    int v10 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateActual];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      BOOL v12 = 1;
      goto LABEL_11;
    }
    id v8 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateProxy];
    if (self) {
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    }
    char v9 = [v8 _collectionView:self canHandleDropSesson:v5];
  }
  BOOL v12 = v9;

LABEL_11:
  return v12;
}

- (void)_beginOrResumeDropSession:(id)a3
{
  id v5 = a3;
  uint64_t v6 = -[_UICollectionViewDragDestinationController sessionState](self);
  char v7 = (void *)v6;
  if (v6) {
    BOOL v8 = *(_DWORD *)(v6 + 8) == 9;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = -[_UICollectionViewDragDestinationController sessionState](self);
  int v51 = v8;
  if (v9 && (uint64_t v10 = v9[2], v9, v10))
  {
    char v11 = -[_UICollectionViewDragDestinationController sessionState](self);
    BOOL v12 = v11;
    if (v11) {
      char v11 = (void *)v11[2];
    }
    char v13 = [v11 isEqual:v5];

    if ((v13 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v50 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v54 = 0;
          _os_log_fault_impl(&dword_1853B0000, v50, OS_LOG_TYPE_FAULT, "UIKit Internal Bug: UICollectionView entered a new UIDropSession whilst an existing session was active. This can lead to unexpected results at runtime.", v54, 2u);
        }
      }
      else
      {
        uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_beginOrResumeDropSession____s_category) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "UIKit Internal Bug: UICollectionView entered a new UIDropSession whilst an existing session was active. This can lead to unexpected results at runtime.", buf, 2u);
        }
      }
    }
    int v14 = 0;
  }
  else
  {
    int v14 = 1;
  }
  uint64_t v16 = -[_UICollectionViewDragDestinationController sessionState](self);
  id v17 = (void *)v16;
  if (v16) {
    objc_storeStrong((id *)(v16 + 16), a3);
  }

  -[_UICollectionViewDragDestinationController setReorderingState:]((uint64_t)self);
  if (self) {
    objc_storeStrong((id *)&self->_dropProposalState, 0);
  }
  BOOL v18 = [(_UICollectionViewDragDestinationController *)self _isLocalInteractiveMove];
  char v19 = -[_UICollectionViewDragDestinationController dropProposalState](self);
  v20 = [UICollectionViewDropProposal alloc];
  if (v18) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 2;
  }
  v22 = [(UICollectionViewDropProposal *)v20 initWithDropOperation:v21 intent:0];
  if (v19) {
    [v19 setProposal:v22];
  }

  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  v24 = -[_UICollectionViewDragDestinationController dropProposalState](self);
  v25 = v24;
  if (v24) {
    v24 = (void *)v24[2];
  }
  uint64_t v26 = [v24 intent];

  [v5 locationInView:WeakRetained];
  double v28 = v27;
  double v30 = v29;
  if (self)
  {
    id v31 = objc_loadWeakRetained((id *)&self->_delegate);
    v32 = v31;
    if (v31)
    {
      v33 = (void *)*((void *)v31 + 7);
      goto LABEL_30;
    }
  }
  else
  {
    v32 = 0;
  }
  v33 = 0;
LABEL_30:
  v34 = v33;
  v35 = -[_UICollectionViewDragSourceController dragFromIndexPath](v34);

  id v52 = 0;
  v36 = objc_msgSend(WeakRetained, "_indexPathForInsertionAtPoint:dropIntent:sourceIndexPath:indicatorLayoutAttributes:", v26, v35, &v52, v28, v30);
  id v37 = v52;
  [(_UICollectionViewDragDestinationController *)self _updateDropProposalByQueryingClientIfNeeded:v36 indicatorLayoutAttributes:v37];
  if (v18)
  {
    v38 = -[_UICollectionViewDragDestinationController dropProposalState](self);
    v39 = v38;
    if (v38) {
      v38 = (void *)v38[2];
    }
    BOOL v40 = [v38 operation] != 2;
  }
  else
  {
    BOOL v40 = 0;
  }
  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v41 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v41) {
    v41[8] = v40;
  }

  -[_UICollectionViewDragDestinationController sessionState](self);
  v42 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    if (!v42 || v42[2] == 1) {
      goto LABEL_45;
    }
    int v43 = 1;
  }
  else
  {
    if (!v42 || v42[2] == 2) {
      goto LABEL_45;
    }
    int v43 = 2;
  }
  v42[2] = v43;
LABEL_45:

  if (self) {
    v44 = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    v44 = 0;
  }
  -[_UICollectionViewDragAndDropController dragDestinationControllerSessionDidEnter:isNewSession:isResuming:](v44, self, v14, v51);

  v45 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
  char v46 = objc_opt_respondsToSelector();

  if (v46)
  {
    v47 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
    [v47 collectionView:WeakRetained dropSessionDidEnter:v5];
LABEL_51:

    goto LABEL_52;
  }
  v48 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateActual];
  char v49 = objc_opt_respondsToSelector();

  if (v49)
  {
    v47 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateProxy];
    [v47 _collectionView:WeakRetained dropSessionDidEnter:v5];
    goto LABEL_51;
  }
LABEL_52:
  [(_UICollectionViewDragDestinationController *)self _configureReorderingDisplayLinkIfNeeded];
  [(_UICollectionViewDragDestinationController *)self _resumeReorderingDisplayLink];
}

- (void)setReorderingState:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), 0);
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v7 = a4;
  -[_UICollectionViewDragDestinationController sessionState](self);
  id v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (int v6 = v5[2], v5, v6 != 8)) {
    [(_UICollectionViewDragDestinationController *)self _beginOrResumeDropSession:v7];
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a4;
  -[_UICollectionViewDragDestinationController sessionState](self);
  id v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v7 && (int v8 = v7[2], v7, v8 == 8))
  {
    uint64_t v9 = -[_UICollectionViewDragDestinationController dropProposalState](self);
    uint64_t v10 = (void *)v9;
    if (v9) {
      char v11 = *(void **)(v9 + 16);
    }
    else {
      char v11 = 0;
    }
    id v12 = v11;

    if (!v12)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = -[_UIHomeAffordanceObservationRecord observer]((id *)&self->super.isa);
      v24 = -[_UICollectionViewDragDestinationController sessionState](self);
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UICollectionViewDragDestinationController.m", 367, @"Couldn't find a drop proposal to return to the drop interaction. Collection view: %@; drop session: %@; destination controller session state: %@",
        v23,
        v6,
        v24);
    }
    uint64_t v13 = -[_UICollectionViewDragDestinationController dropProposalState](self);
    int v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = *(void **)(v13 + 16);
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;
  }
  else
  {
    -[_UICollectionViewDragDestinationController sessionState](self);
    id v17 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      int v18 = v17[2];

      if (v18 == 9) {
        [(_UICollectionViewDragDestinationController *)self _beginOrResumeDropSession:v6];
      }
    }
    uint64_t v19 = -[_UICollectionViewDragDestinationController dropProposalState](self);
    int v14 = (void *)v19;
    if (v19) {
      uint64_t v20 = *(void *)(v19 + 16);
    }
    else {
      uint64_t v20 = 0;
    }
    id v16 = [(_UICollectionViewDragDestinationController *)self _effectiveDropProposalForProposal:v20];
  }

  return v16;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v22 = a4;
  uint64_t v5 = -[_UICollectionViewDragDestinationController sessionState](self);
  id v6 = (void *)v5;
  if (v5 && *(_DWORD *)(v5 + 8) == 8) {
    goto LABEL_32;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  id v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    int v8 = v7[2];

    if (v8 == 9) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  [(_UICollectionViewDragDestinationController *)self _pauseReorderingDisplayLink];
  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  uint64_t v9 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    v9[8] = 0;
  }

  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _updatePreferredDraggedCellAppearanceForSessionUpdate];
    }
  }
  else
  {
    char v11 = 0;
  }

  -[_UICollectionViewDragDestinationController sessionState](self);
  id v12 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    int v13 = v12[2];

    if (v13 == 3)
    {
      -[_UICollectionViewDragDestinationController sessionState](self);
      int v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v14 && v14[2] != 1) {
        v14[2] = 1;
      }
LABEL_20:

      [(_UICollectionViewDragDestinationController *)self _cancelInteractiveReorderingIfNeeded];
      goto LABEL_21;
    }
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  uint64_t v15 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    int v16 = v15[2];

    if (v16 == 4)
    {
      -[_UICollectionViewDragDestinationController sessionState](self);
      int v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v14 && v14[2]) {
        v14[2] = 0;
      }
      goto LABEL_20;
    }
  }
LABEL_21:
  if (self) {
    id v17 = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id v17 = 0;
  }
  [v17 _resetDropTargetAppearance];

  int v18 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v6 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
    if (self) {
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    }
    [v6 collectionView:self dropSessionDidExit:v22];
  }
  else
  {
    uint64_t v20 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateActual];
    char v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) == 0) {
      goto LABEL_33;
    }
    id v6 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateProxy];
    if (self) {
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    }
    [v6 _collectionView:self dropSessionDidExit:v22];
  }

LABEL_32:
LABEL_33:
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  [(_UICollectionViewDragDestinationController *)self _pauseReorderingDisplayLink];
  -[_UICollectionViewDragDestinationController dropProposalState](self);
  uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v5);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewDragDestinationController dropProposalState](self);
  id v6 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6) {
    v6[8] = [v6 _hasDropActionTarget];
  }

  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _incrementSessionRefCount];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  uint64_t v10 = -[_UICollectionViewDragDestinationController sessionState](self);
  char v11 = (void *)v10;
  if (v10 && *(_DWORD *)(v10 + 8) == 3) {
    goto LABEL_11;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  id v12 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  int v13 = v12;
  if (v12 && v12[2] == 1)
  {

LABEL_11:
LABEL_12:
    [(_UICollectionViewDragDestinationController *)self _commitCurrentInteractiveReordering];
    goto LABEL_13;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  uint64_t v15 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    int v16 = v15[2];

    if (v16 == 5) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  id v17 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  int v18 = v17;
  if (v17 && v17[2] == 4)
  {

LABEL_25:
    [(_UICollectionViewDragDestinationController *)self _commitCurrentDragAndDropSession];
    goto LABEL_13;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  char v19 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    int v20 = v19[2];

    if (v20 != 2) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }

LABEL_13:
  if (self) {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id v14 = 0;
  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate)) != 0)
  {
    id v5 = WeakRetained;
    [WeakRetained _invokeAllCompletionHandlers];
    [v5 _resetAllAnimationHandlers];
    [v5 _decrementSessionRefCount];
  }
  else
  {
    id v5 = 0;
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v16 = a4;
  id v5 = -[_UICollectionViewDragDestinationController sessionState](self);
  if (v5) {
    id v6 = (id)v5[2];
  }
  else {
    id v6 = 0;
  }

  id v7 = v16;
  if (v6 == v16)
  {
    [(_UICollectionViewDragDestinationController *)self _cancelCurrentInteractiveReorder];
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v9 = WeakRetained;
      if (WeakRetained) {
        [WeakRetained _decrementSessionRefCount];
      }
    }
    else
    {
      uint64_t v9 = 0;
    }

    uint64_t v10 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
      if (self) {
        id v13 = objc_loadWeakRetained((id *)&self->_collectionView);
      }
      else {
        id v13 = 0;
      }
      [v12 collectionView:v13 dropSessionDidEnd:v16];
    }
    else
    {
      id v14 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateActual];
      char v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) == 0)
      {
LABEL_16:
        if (self)
        {
          objc_storeStrong((id *)&self->_sessionState, 0);
          -[_UICollectionViewDragDestinationController setReorderingState:]((uint64_t)self);
          self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
        }
        else
        {
          -[_UICollectionViewDragDestinationController setReorderingState:](0);
        }
        [(_UICollectionViewDragDestinationController *)self _resetDropTargetAppearance];

        id v7 = v16;
        goto LABEL_19;
      }
      id v12 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateProxy];
      if (self) {
        id v13 = objc_loadWeakRetained((id *)&self->_collectionView);
      }
      else {
        id v13 = 0;
      }
      [v12 _collectionView:v13 dropSessionDidEnd:v16];
    }

    goto LABEL_16;
  }
LABEL_19:
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  id v12 = [WeakRetained _dropCoordinatorItemForDragItem:v9];

  if (!v12)
  {
LABEL_24:
    int v20 = 0;
    goto LABEL_32;
  }
  int v13 = [v12 kind];
  if (v13 == 2)
  {
    if (self) {
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id v21 = 0;
    }
    id v22 = [v21 _cellForDropCoordinatorItem:v12];

    if (v22)
    {
      v23 = [v12 previewParametersProvider];

      if (v23
        && ([v12 previewParametersProvider],
            v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(),
            ((void (**)(void, void *))v24)[2](v24, v22),
            v25 = objc_claimAutoreleasedReturnValue(),
            v24,
            v25))
      {
        int v20 = [(UITargetedPreview *)[UITargetedDragPreview alloc] initWithView:v22 parameters:v25];
      }
      else
      {
        int v20 = [[UITargetedDragPreview alloc] initWithView:v22];
      }
    }
    else
    {
      int v20 = 0;
    }

    goto LABEL_32;
  }
  if (v13 == 1)
  {
    uint64_t v26 = [UIDragPreviewTarget alloc];
    double v27 = [v12 target];
    double v28 = [v27 container];
    double v29 = [v12 target];
    [v29 center];
    double v31 = v30;
    double v33 = v32;
    v34 = [v12 target];
    v35 = v34;
    if (v34) {
      [v34 transform];
    }
    else {
      memset(v41, 0, sizeof(v41));
    }
    id v37 = -[UIPreviewTarget initWithContainer:center:transform:](v26, "initWithContainer:center:transform:", v28, v41, v31, v33);

    int v20 = [v10 retargetedPreviewWithTarget:v37];

    goto LABEL_32;
  }
  if (v13)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v39 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)BOOL v40 = 0;
        _os_log_fault_impl(&dword_1853B0000, v39, OS_LOG_TYPE_FAULT, "Unknown drop coordinator item kind.", v40, 2u);
      }
    }
    else
    {
      v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dropInteraction_previewForDroppingItem_withDefault____s_category)+ 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v40 = 0;
        _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "Unknown drop coordinator item kind.", v40, 2u);
      }
    }
    goto LABEL_24;
  }
  if (self) {
    id v14 = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id v14 = 0;
  }
  char v15 = [v12 destinationIndexPath];
  id v16 = [v14 _cellForItemAtIndexPath:v15];

  id v17 = [v12 destinationIndexPath];
  int v18 = [(_UICollectionViewDragDestinationController *)self _queryClientForPreviewParametersForItemAtIndexPath:v17];

  if (v16)
  {
    if (!v18)
    {
      int v18 = objc_alloc_init(UIDragPreviewParameters);
      char v19 = [v16 _visiblePathForBackgroundConfiguration];
      [(UIPreviewParameters *)v18 setVisiblePath:v19];
    }
    [(UIPreviewParameters *)v18 setHidesSourceViewDuringDropAnimation:1];
    int v20 = [(UITargetedPreview *)[UITargetedDragPreview alloc] initWithView:v16 parameters:v18];
  }
  else
  {
    int v20 = 0;
  }

LABEL_32:
  return v20;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (self) {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  -[_UICollectionViewDragAndDropController dragDestinationController:willBeginDropAnimationForDragItem:animator:](WeakRetained, (uint64_t)self, v7, v8);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95___UICollectionViewDragDestinationController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v11[3] = &unk_1E52E6608;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v8 addCompletion:v11];
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    [v5 locationInView:WeakRetained];
    double v10 = v9;
    double v12 = v11;

    if (self) {
      id v13 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v13 = 0;
    }
    id v14 = objc_msgSend(v13, "indexPathForItemAtPoint:", v10, v12);

    char v15 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
    if (self) {
      id v16 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v16 = 0;
    }
    int64_t v17 = [v15 _collectionView:v16 dataOwnerForDropSession:v5 withDestinationIndexPath:v14];
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

- (id)_dragDestinationDelegateProxy
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v3 = [WeakRetained _dragDestinationDelegateProxy];

  return v3;
}

- (id)_dragDestinationDelegateActual
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v3 = [WeakRetained _dragDestinationDelegateActual];

  return v3;
}

- (id)_dropDelegateProxy
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v3 = [WeakRetained _dropDelegateProxy];

  return v3;
}

- (id)_dropDelegateActual
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v3 = [WeakRetained _dropDelegateActual];

  return v3;
}

- (void)_cancelInteractiveReorderingIfNeeded
{
  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  uint64_t v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    int v4 = v3[9];

    if (v4)
    {
      -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
      id v5 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v5) {
        v5[9] = 0;
      }

      if (self) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      }
      else {
        id WeakRetained = 0;
      }
      id v7 = WeakRetained;
      [WeakRetained cancelInteractiveMovement];
    }
  }
}

- (void)_endInteractiveReorderingIfNeeded
{
  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  uint64_t v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    int v4 = v3[9];

    if (v4)
    {
      -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
      id v5 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v5) {
        v5[9] = 0;
      }

      if (self) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      }
      else {
        id WeakRetained = 0;
      }
      id v7 = WeakRetained;
      [WeakRetained endInteractiveMovement];
    }
  }
}

- (id)_queryClientForPreviewParametersForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    double v9 = [v7 collectionView:WeakRetained dropPreviewParametersForItemAtIndexPath:v4];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)_configureReorderingDisplayLinkIfNeeded
{
  if (!self || !self->_reorderDisplayLink)
  {
    uint64_t v3 = +[UIScreen mainScreen];
    id v4 = [v3 displayLinkWithTarget:self selector:sel__reorderingDisplayLinkDidTick];
    id v5 = v4;
    if (self)
    {
      objc_storeStrong((id *)&self->_reorderDisplayLink, v4);

      char v6 = (void *)MEMORY[0x1E4F1CAC0];
      id v7 = self->_reorderDisplayLink;
      id v8 = [v6 mainRunLoop];
      [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

      reorderDisplayLink = self->_reorderDisplayLink;
    }
    else
    {

      id v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [0 addToRunLoop:v14 forMode:*MEMORY[0x1E4F1C4B0]];

      reorderDisplayLink = 0;
    }
    double v10 = (void *)MEMORY[0x1E4F1CAC0];
    double v11 = reorderDisplayLink;
    double v12 = [v10 mainRunLoop];
    [(CADisplayLink *)v11 addToRunLoop:v12 forMode:@"UITrackingRunLoopMode"];

    if (self) {
      id v13 = self->_reorderDisplayLink;
    }
    else {
      id v13 = 0;
    }
    [(CADisplayLink *)v13 setPaused:1];
  }
}

- (void)_pauseReorderingDisplayLink
{
  if (self) {
    self = (_UICollectionViewDragDestinationController *)self->_reorderDisplayLink;
  }
  [(_UICollectionViewDragDestinationController *)self setPaused:1];
}

- (void)_resumeReorderingDisplayLink
{
  if (self) {
    self = (_UICollectionViewDragDestinationController *)self->_reorderDisplayLink;
  }
  [(_UICollectionViewDragDestinationController *)self setPaused:0];
}

- (BOOL)_isLocalInteractiveMove
{
  uint64_t v3 = -[_UICollectionViewDragDestinationController sessionState](self);
  if (!v3)
  {
    id v8 = 0;
    char v12 = 0;
LABEL_16:

    return v12;
  }
  uint64_t v4 = v3[2];

  if (v4)
  {
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v6 = WeakRetained;
      if (WeakRetained)
      {
        id v7 = (void *)*((void *)WeakRetained + 7);
LABEL_6:
        id v8 = v7;

        double v9 = -[_UICollectionViewDragDestinationController sessionState](self);
        double v10 = v9;
        if (v9) {
          double v9 = (void *)v9[2];
        }
        double v11 = [v9 localDragSession];

        char v12 = 0;
        if (v8 && v11)
        {
          id v13 = -[_UICollectionViewDragSourceController dragSession](v8);
          if (v11 == v13) {
            char v12 = [v11 allowsMoveOperation];
          }
          else {
            char v12 = 0;
          }
        }
        goto LABEL_16;
      }
    }
    else
    {
      char v6 = 0;
    }
    id v7 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (void)_reorderingDisplayLinkDidTick
{
  uint64_t v3 = -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  uint64_t v4 = -[_UICollectionViewDragDestinationController sessionState](self);
  uint64_t v5 = v4;
  if (v4 && *(void *)(v4 + 16))
  {
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      if (WeakRetained && *(_DWORD *)(v5 + 8) != 6)
      {
        [*(id *)(v5 + 16) locationInView:WeakRetained];
        double v9 = v7;
        double v10 = v8;
        double v11 = v3 ? *(void **)(v3 + 16) : 0;
        objc_msgSend(v11, "addSample:", v7, v8);
        if (v3)
        {
          uint64_t v12 = *(void *)(v3 + 16);
          if (v12)
          {
            if (*(uint64_t *)(v12 + 48) >= 12)
            {
              if (fabs(*(double *)(v3 + 56)) < 2.22044605e-16) {
                *(CFTimeInterval *)(v3 + 56) = CACurrentMediaTime();
              }
              id v13 = *(void **)(v3 + 32);
              if (!v13)
              {
                uint64_t v14 = [(id)v3 _reorderCadenceSettings];
                char v15 = *(void **)(v3 + 32);
                *(void *)(v3 + 32) = v14;

                id v13 = *(void **)(v3 + 32);
              }
              id v16 = v13;
              [v16 dwellTimeThreshold];
              if (fabs(*(double *)(v3 + 56)) >= 2.22044605e-16 && CACurrentMediaTime() - *(double *)(v3 + 56) >= v17)
              {
                [*(id *)(v3 + 16) velocity];
                double v20 = hypot(v18, v19);
                [v16 velocityMagnitudeThreshold];
                if (fabs(v21) < 2.22044605e-16 || v20 <= v21)
                {
                  id v22 = -[_UICollectionViewDragDestinationController dropProposalState](self);
                  v23 = v22;
                  if (v22) {
                    id v22 = (void *)v22[2];
                  }
                  uint64_t v24 = [v22 intent];

                  id v25 = objc_loadWeakRetained((id *)&self->_delegate);
                  uint64_t v26 = v25;
                  if (v25) {
                    double v27 = (void *)*((void *)v25 + 7);
                  }
                  else {
                    double v27 = 0;
                  }
                  double v28 = v27;
                  double v29 = -[_UICollectionViewDragSourceController dragFromIndexPath](v28);

                  id v37 = 0;
                  double v30 = objc_msgSend(WeakRetained, "_indexPathForInsertionAtPoint:dropIntent:sourceIndexPath:indicatorLayoutAttributes:", v24, v29, &v37, v9, v10);
                  id v31 = v37;
                  [(_UICollectionViewDragDestinationController *)self _updateDropProposalByQueryingClientIfNeeded:v30 indicatorLayoutAttributes:v31];
                  int v32 = *(_DWORD *)(v5 + 8);
                  switch(v32)
                  {
                    case 3:
                      if (-[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        objc_msgSend(WeakRetained, "updateInteractiveMovementTargetPosition:", v9, v10);
                        -[_UIDragDestinationControllerReorderingState didReorder]((void *)v3);
                      }
                      break;
                    case 2:
                      if (v30
                        && -[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        if (*(_DWORD *)(v5 + 8) != 4) {
                          *(_DWORD *)(v5 + 8) = 4;
                        }
                        id v34 = objc_loadWeakRetained((id *)&self->_delegate);
                        uint64_t v35 = -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle]((uint64_t)v34);

                        if (v35 != 2) {
                          [WeakRetained _beginReorderingItemAtIndexPath:v30 isLegacyMovement:0];
                        }
                        -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
                        v36 = (unsigned char *)objc_claimAutoreleasedReturnValue();
                        if (v36) {
                          v36[9] = 1;
                        }
                      }
                      break;
                    case 1:
                      if (v29
                        && -[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        double v33 = [WeakRetained _cellForItemAtIndexPath:v29];

                        if (v33)
                        {
                          [WeakRetained _beginReorderingItemAtIndexPath:v29 isLegacyMovement:0];
                          objc_msgSend(WeakRetained, "updateInteractiveMovementTargetPosition:", v9, v10);
                          *(unsigned char *)(v3 + 9) = 1;
                          if (*(_DWORD *)(v5 + 8) != 3) {
                            *(_DWORD *)(v5 + 8) = 3;
                          }
                        }
                        else if (([WeakRetained isScrollAnimating] & 1) == 0 {
                               && [WeakRetained _globalIndexPathForItemAtIndexPath:v29] != 0x7FFFFFFFFFFFFFFFLL)
                        }
                        {
                          objc_msgSend(WeakRetained, "_scrollToItemAtPresentationIndexPath:atScrollPosition:additionalInsets:animated:", v29, 0, 1, 0.0, 0.0, 0.0, 0.0);
                        }
                      }
                      break;
                    default:
                      if (v32 == 4
                        && v30
                        && -[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        objc_msgSend(WeakRetained, "updateInteractiveMovementTargetPosition:", v9, v10);
                      }
                      break;
                  }
                }
                else
                {
                  *(void *)(v3 + 56) = 0;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      id WeakRetained = 0;
    }
  }
}

- (BOOL)shouldPerformMovementForCurrentProposal
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = -[_UICollectionViewDragDestinationController dropProposalState](a1);
  uint64_t v2 = (void *)v1;
  if (v1) {
    uint64_t v3 = *(void **)(v1 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 intent];
  BOOL v6 = [v4 operation] == 2 || objc_msgSend(v4, "operation") == 3;
  BOOL v7 = v5 == 1 && v6;

  return v7;
}

- (void)_commitCurrentDragAndDropSession
{
  p_isa = (id *)&self->super.isa;
  -[_UICollectionViewDragDestinationController sessionState](self);
  uint64_t v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3 && v3[2] != 6) {
    v3[2] = 6;
  }

  [p_isa _endInteractiveReorderingIfNeeded];
  id v4 = [p_isa _dropDelegateActual];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = [p_isa _dropDelegateProxy];
    if (p_isa)
    {
      id WeakRetained = objc_loadWeakRetained(p_isa + 1);
      p_isa = (id *)objc_loadWeakRetained(p_isa + 3);
    }
    else
    {
      id WeakRetained = 0;
    }
    [v9 collectionView:WeakRetained performDropWithCoordinator:p_isa];
  }
  else
  {
    BOOL v7 = [p_isa _dragDestinationDelegateActual];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = [p_isa _dragDestinationDelegateProxy];
    if (p_isa)
    {
      id WeakRetained = objc_loadWeakRetained(p_isa + 1);
      p_isa = (id *)objc_loadWeakRetained(p_isa + 3);
    }
    else
    {
      id WeakRetained = 0;
    }
    [v9 _collectionView:WeakRetained performDropWithCoordinator:p_isa];
  }
}

- (void)_cancelCurrentInteractiveReorder
{
  -[_UICollectionViewDragDestinationController sessionState](self);
  uint64_t v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    int v4 = v3[2];

    if (v4 == 3)
    {
      [(_UICollectionViewDragDestinationController *)self _cancelInteractiveReorderingIfNeeded];
    }
  }
}

- (void)_commitCurrentInteractiveReordering
{
  v59[1] = *MEMORY[0x1E4F143B8];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  char v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v5 && v5[2] != 6) {
    v5[2] = 6;
  }

  if (self) {
    BOOL v6 = (id *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    BOOL v6 = 0;
  }
  if (![WeakRetained _dataSourceImplementsReorderingHandlers])
  {
    int v9 = [WeakRetained _supportsAutomaticCatalystDragAndDropReordering];
    if (v6) {
      BOOL v10 = (unint64_t)[v6[21] count] < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v9 & v10)
    {
      BOOL v7 = 0;
      goto LABEL_17;
    }
LABEL_32:
    [(_UICollectionViewDragDestinationController *)self _cancelInteractiveReorderingIfNeeded];
    uint64_t v24 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      uint64_t v26 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
      [v26 collectionView:WeakRetained performDropWithCoordinator:v6];
    }
    else
    {
      double v27 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateActual];
      char v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) == 0) {
        goto LABEL_37;
      }
      uint64_t v26 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateProxy];
      [v26 _collectionView:WeakRetained performDropWithCoordinator:v6];
    }

    goto LABEL_37;
  }
  if (v6 && (unint64_t)[v6[21] count] > 1) {
    goto LABEL_32;
  }
  BOOL v7 = [WeakRetained _diffableDataSourceImpl];
  if (!v7)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UICollectionViewDragDestinationController.m", 791, @"Invalid parameter not satisfying: %@", @"dataSourceImpl" object file lineNumber description];
  }
LABEL_17:
  double v11 = v6;
  uint64_t v12 = [v11 proposal];
  if ([v12 operation] != 3 || objc_msgSend(v12, "intent") != 1) {
    goto LABEL_31;
  }
  if (v11) {
    id v13 = v11[7];
  }
  else {
    id v13 = 0;
  }
  uint64_t v14 = v13;
  char v15 = -[_UICollectionViewDragSourceController dragFromIndexPath](v14);

  id v16 = [v11 destinationIndexPath];
  double v17 = v16;
  if (!v15 || !v16)
  {

LABEL_31:
    goto LABEL_32;
  }
  [(_UICollectionViewDragDestinationController *)self _endInteractiveReorderingIfNeeded];
  uint64_t v18 = -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle]((uint64_t)v11);
  uint64_t v19 = v18;
  int v51 = v17;
  v48 = v7;
  char v49 = v6;
  v47 = v12;
  if (v7)
  {
    if (v11) {
      id v20 = v11[7];
    }
    else {
      id v20 = 0;
    }
    double v21 = v20;
    BOOL v22 = -[_UICollectionViewDragSourceController dragItemsCreatedForReordering](v21);
    BOOL v23 = v19 == 2 && v22;

    [v7 _commitReorderingForItemAtIndexPath:v15 toDestinationIndexPath:v17 shouldPerformViewAnimations:v23];
  }
  else if (v18 == 2)
  {
    double v29 = -[UICollectionViewUpdateItem initWithOldIndexPath:newIndexPath:]([UICollectionViewUpdateItem alloc], v15, v17);
    double v30 = [off_1E52D5400 snapshotterForDataSourceBackedView:WeakRetained];
    v59[0] = v29;
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
    int v32 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v30 orderedUpdateItems:v31];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __81___UICollectionViewDragDestinationController__commitCurrentInteractiveReordering__block_invoke;
    v56[3] = &unk_1E52E5E90;
    id v57 = v32;
    id v33 = v32;
    -[_UICollectionViewDragAndDropController rebaseCellAppearanceStatesForUpdates:]((uint64_t)v11, v56);
    [WeakRetained _notifyDataSourceForMoveOfItemFromIndexPath:v15 toIndexPath:v51];
    [WeakRetained moveItemAtIndexPath:v15 toIndexPath:v51];
  }
  id v50 = WeakRetained;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v34 = v11;
  uint64_t v35 = [v11 items];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(v35);
        }
        BOOL v40 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v41 = [v40 sourceIndexPath];
        if (v41)
        {
          v42 = (void *)v41;
          int v43 = [v40 sourceIndexPath];
          int v44 = [v43 isEqual:v15];

          if (v44)
          {
            v45 = [v40 dragItem];
            id v46 = (id)[v34 dropItem:v45 toItemAtIndexPath:v51];
          }
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v37);
  }

  BOOL v6 = v49;
  id WeakRetained = v50;
LABEL_37:
}

- (BOOL)_isMultiItemSource
{
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      int v4 = (void *)*((void *)WeakRetained + 7);
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  int v4 = 0;
LABEL_4:
  char v5 = v4;

  if (v5) {
    BOOL v6 = -[_UICollectionViewDragSourceController currentSessionItemCount](v5) > 1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_updateDropProposalByQueryingClientIfNeeded:(id)a3 indicatorLayoutAttributes:(id)a4
{
  id v36 = a3;
  id v6 = a4;
  if ([(_UICollectionViewDragDestinationController *)self _shouldQueryDropActionForIndexPath:v36])
  {
    if (v36)
    {
      BOOL v7 = -[_UICollectionViewDragDestinationController dropProposalState](self);
      -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v7, v36);
    }
    char v8 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateActual];
    if (objc_opt_respondsToSelector())
    {

LABEL_7:
      double v11 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = [(_UICollectionViewDragDestinationController *)self _dropDelegateProxy];
        if (self) {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
        }
        else {
          id WeakRetained = 0;
        }
        uint64_t v15 = -[_UICollectionViewDragDestinationController sessionState](self);
        id v16 = (void *)v15;
        if (v15) {
          uint64_t v17 = *(void *)(v15 + 16);
        }
        else {
          uint64_t v17 = 0;
        }
        uint64_t v18 = [v13 collectionView:WeakRetained dropSessionDidUpdate:v17 withDestinationIndexPath:v36];
      }
      else
      {
        id v13 = [(_UICollectionViewDragDestinationController *)self _dragDestinationDelegateProxy];
        if (self) {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
        }
        else {
          id WeakRetained = 0;
        }
        uint64_t v19 = -[_UICollectionViewDragDestinationController sessionState](self);
        id v16 = (void *)v19;
        if (v19) {
          uint64_t v20 = *(void *)(v19 + 16);
        }
        else {
          uint64_t v20 = 0;
        }
        uint64_t v18 = [v13 _collectionView:WeakRetained dropSessionDidUpdate:v20 withDestinationIndexPath:v36];
      }
      double v21 = (UICollectionViewDropProposal *)v18;

      if (!v21) {
        goto LABEL_34;
      }
      BOOL v22 = [(_UICollectionViewDragDestinationController *)self _effectiveDropProposalForProposal:v21];
      BOOL v23 = -[_UICollectionViewDragDestinationController dropProposalState](self);
      uint64_t v24 = v23;
      if (v23) {
        [v23 setProposal:v22];
      }

LABEL_33:
LABEL_34:

      if (self) {
        id v34 = objc_loadWeakRetained((id *)&self->_collectionView);
      }
      else {
        id v34 = 0;
      }
      uint64_t v35 = -[_UICollectionViewDragDestinationController currentDropProposal](self);
      objc_msgSend(v34, "_updateDropTargetAppearanceWithTargetIndexPath:intent:indicatorLayoutAttributes:", v36, objc_msgSend(v35, "intent"), v6);

      goto LABEL_37;
    }
    int v9 = [(_UICollectionViewDragDestinationController *)self _dropDelegateActual];
    char v10 = objc_opt_respondsToSelector();

    if (v10) {
      goto LABEL_7;
    }
    if (![(_UICollectionViewDragDestinationController *)self _isLocalInteractiveMove])
    {
      double v30 = [UICollectionViewDropProposal alloc];
      uint64_t v32 = 2;
      goto LABEL_30;
    }
    if (self)
    {
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v26 = v25;
      if (v25)
      {
        double v27 = (void *)*((void *)v25 + 7);
LABEL_26:
        char v28 = v27;
        BOOL v29 = -[_UICollectionViewDragSourceController dragItemsCreatedForReordering](v28);

        double v30 = [UICollectionViewDropProposal alloc];
        if (v29)
        {
          id v31 = [(UICollectionViewDropProposal *)v30 initWithDropOperation:3 intent:1];
          double v21 = [(_UICollectionViewDragDestinationController *)self _effectiveDropProposalForProposal:v31];

          goto LABEL_31;
        }
        uint64_t v32 = 0;
LABEL_30:
        double v21 = [(UICollectionViewDropProposal *)v30 initWithDropOperation:v32 intent:0];
LABEL_31:
        id v33 = -[_UICollectionViewDragDestinationController dropProposalState](self);
        BOOL v22 = v33;
        if (v33) {
          [v33 setProposal:v21];
        }
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    double v27 = 0;
    goto LABEL_26;
  }
LABEL_37:
}

- (id)_effectiveDropProposalForProposal:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 intent];
  uint64_t v6 = [v4 operation];

  if (v6 == 3)
  {
    BOOL v7 = -[_UICollectionViewDragDestinationController sessionState](self);
    char v8 = v7;
    if (v7) {
      BOOL v7 = (void *)v7[2];
    }
    int v9 = [v7 allowsMoveOperation];

    if (v9) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  if ([(_UICollectionViewDragDestinationController *)self _isLocalInteractiveMove])
  {
    if ([(_UICollectionViewDragDestinationController *)self _isMultiItemSource])
    {
      if (v5 == 1)
      {
        uint64_t v6 = 0;
        uint64_t v5 = 0;
      }
    }
    else if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      if (self) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      }
      else {
        id WeakRetained = 0;
      }
      double v11 = -[_UICollectionViewDragAndDropController sourceIndexPaths]((uint64_t)WeakRetained);
      char v12 = [v11 firstObject];

      -[_UICollectionViewDragDestinationController dropProposalState](self);
      id v13 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v13);

      if (v12 && [v12 isEqual:v14])
      {
        uint64_t v6 = 0;
        uint64_t v5 = 0;
      }
    }
  }
  uint64_t v15 = [[UICollectionViewDropProposal alloc] initWithDropOperation:v6 intent:v5];
  return v15;
}

- (BOOL)_shouldQueryDropActionForIndexPath:(id)a3
{
  -[_UICollectionViewDragDestinationController dropProposalState](self);
  uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v5);

  BOOL v7 = 1;
  if (!a3 && v6)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    int v9 = [WeakRetained collectionViewLayout];
    -[_UICollectionViewDragDestinationController dropProposalState](self);
    char v10 = (id *)objc_claimAutoreleasedReturnValue();
    double v11 = -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v10);
    char v12 = [v9 layoutAttributesForItemAtIndexPath:v11];

    if (v12)
    {
      id v13 = -[_UICollectionViewDragDestinationController sessionState](self);
      if (!v13)
      {
        id v25 = 0;
        BOOL v7 = 1;
        goto LABEL_14;
      }
      uint64_t v14 = v13[2];

      if (v14)
      {
        uint64_t v15 = -[_UICollectionViewDragDestinationController sessionState](self);
        id v16 = (void *)v15;
        uint64_t v17 = v15 ? *(void **)(v15 + 16) : 0;
        id v18 = v17;
        id v19 = self ? objc_loadWeakRetained((id *)&self->_collectionView) : 0;
        [v18 locationInView:v19];
        double v21 = v20;
        double v23 = v22;

        uint64_t v24 = -[_UICollectionViewDragDestinationController _computeNextItemAttributesStartingFromItemAttributes:withCurrentDragLocation:](self, "_computeNextItemAttributesStartingFromItemAttributes:withCurrentDragLocation:", v12, v21, v23);
        if (v24)
        {
          id v25 = (void *)v24;
          BOOL v7 = [(_UICollectionViewDragDestinationController *)self _hasGapLargeEnoughToRequireDropActionCallForCurrentItemAttributes:v12 proposedNextItemAttributes:v24];
LABEL_14:

LABEL_16:
          return v7;
        }
      }
    }
    BOOL v7 = 1;
    goto LABEL_16;
  }
  return v7;
}

- (id)_computeNextItemAttributesStartingFromItemAttributes:(id)a3 withCurrentDragLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  char v8 = v7;
  if (v7)
  {
    [v7 frame];
    double v9 = v38.origin.x;
    double v10 = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
    CGFloat v13 = CGRectGetWidth(v38) * 0.25;
    v39.origin.double x = v9;
    v39.origin.double y = v10;
    v39.size.double width = width;
    v39.size.double height = height;
    CGFloat v14 = CGRectGetHeight(v39) * 0.25;
    v40.origin.double x = v9;
    v40.origin.double y = v10;
    v40.size.double width = width;
    v40.size.double height = height;
    CGRect v41 = CGRectInset(v40, v13, v14);
    double v30 = v41.origin.y;
    double v31 = v41.origin.x;
    double v29 = v41.size.width;
    double v15 = v41.size.height;
    double v32 = v9 + width * 0.5;
    double v16 = x - v32;
    double v17 = y - (v10 + height * 0.5);
    v41.origin.double x = v9;
    v41.origin.double y = v10;
    v41.size.double width = width;
    v41.size.double height = height;
    double v18 = CGRectGetWidth(v41);
    v42.origin.double x = v9;
    v42.origin.double y = v10;
    v42.size.double width = width;
    v42.size.double height = height;
    double v19 = CGRectGetHeight(v42);
    if (v18 >= v19) {
      double v19 = v18;
    }
    double v20 = v19 * 4.0;
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    double v22 = [WeakRetained collectionViewLayout];

    double v23 = objc_msgSend(v22, "_layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:", v31, v30, v29, v15, v16, v17, v20);
    uint64_t v24 = (void *)[v23 mutableCopy];

    id v25 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke;
    v34[3] = &unk_1E52E66C8;
    id v35 = v25;
    id v36 = v8;
    id v26 = v25;
    [v24 enumerateObjectsUsingBlock:v34];
    [v24 removeObjectsAtIndexes:v26];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke_2;
    v33[3] = &__block_descriptor_48_e79_q24__0__UICollectionViewLayoutAttributes_8__UICollectionViewLayoutAttributes_16l;
    *(double *)&v33[4] = v32;
    *(double *)&v33[5] = v10 + height * 0.5;
    [v24 sortUsingComparator:v33];
    double v27 = [v24 firstObject];
  }
  else
  {
    double v27 = 0;
  }

  return v27;
}

- (BOOL)_hasGapLargeEnoughToRequireDropActionCallForCurrentItemAttributes:(id)a3 proposedNextItemAttributes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 center];
  double v35 = v16;
  double v36 = v15;

  [v5 frame];
  CGFloat v33 = v18;
  CGFloat v34 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [v5 center];
  double v24 = v23;
  double v26 = v25;

  CGFloat v37 = v10;
  double v27 = UIDistanceBetweenRects(v8, v10, v12, v14, v34, v20, v33, v22);
  long double v28 = v24 - v36;
  long double v29 = v26 - v35;
  long double v30 = hypot(v28, v29);
  if (fabs(v28 / v30) <= fabs(v29 / v30))
  {
    v39.origin.double x = v8;
    v39.origin.double y = v37;
    v39.size.double width = v12;
    v39.size.double height = v14;
    double Height = CGRectGetHeight(v39);
  }
  else
  {
    v38.origin.double x = v8;
    v38.origin.double y = v37;
    v38.size.double width = v12;
    v38.size.double height = v14;
    double Height = CGRectGetWidth(v38);
  }
  return v27 > Height * 0.5;
}

- (void)rebaseForUpdates:(void *)a1
{
  CGFloat v10 = a2;
  if (a1)
  {
    -[_UICollectionViewDragDestinationController dropProposalState](a1);
    uint64_t v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (int v4 = v3[8], v3, !v4))
    {
      uint64_t v5 = -[_UICollectionViewDragDestinationController dropProposalState](a1);
      id v6 = (void *)v5;
      if (v5) {
        uint64_t v7 = *(void *)(v5 + 24);
      }
      else {
        uint64_t v7 = 0;
      }
      CGFloat v8 = v10[2](v10, v7);

      double v9 = -[_UICollectionViewDragDestinationController dropProposalState](a1);
      -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v9, v8);
    }
  }
}

@end