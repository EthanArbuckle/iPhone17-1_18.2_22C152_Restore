@interface PUExtendedToolbar
- (BOOL)_isUpdating;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateAccessoryView;
- (BOOL)_needsUpdateAccessoryViewContainer;
- (BOOL)_needsUpdateAccessoryViewTopOutset;
- (BOOL)_needsUpdateContainedToolbar;
- (BOOL)_needsUpdateToolbarItems;
- (BOOL)_shouldStretchDuringCrossfadeTransition;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)_toolbarItems;
- (NSMutableSet)_accessoryViewContainers;
- (PUExtendedToolbar)initWithFrame:(CGRect)a3;
- (PUToolbarViewModel)toolbarViewModel;
- (UIToolbar)_containedToolbar;
- (UIView)_accessoryView;
- (UIView)_accessoryViewContainer;
- (double)_accessoryViewTopOutset;
- (double)_containedToolbarHeight;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_numberOfNestedChanges;
- (void)_assertInsideChangeBlock;
- (void)_assertInsideUpdate;
- (void)_getContainedToolbarFrame:(CGRect *)a3 accessoryViewContainerFrame:(CGRect *)a4 forBounds:(CGRect)a5;
- (void)_invalidateAccessoryView;
- (void)_invalidateAccessoryViewContainer;
- (void)_invalidateAccessoryViewTopOutset;
- (void)_invalidateContainedToolbar;
- (void)_invalidateSize;
- (void)_invalidateToolbarItems;
- (void)_performChanges:(id)a3;
- (void)_performChanges:(id)a3 withAnimatorBlock:(id)a4;
- (void)_setAccessoryView:(id)a3;
- (void)_setAccessoryViewContainer:(id)a3;
- (void)_setAccessoryViewTopOutset:(double)a3;
- (void)_setContainedToolbar:(id)a3;
- (void)_setContainedToolbarHeight:(double)a3;
- (void)_setNeedsUpdate;
- (void)_setNeedsUpdateAccessoryView:(BOOL)a3;
- (void)_setNeedsUpdateAccessoryViewContainer:(BOOL)a3;
- (void)_setNeedsUpdateAccessoryViewTopOutset:(BOOL)a3;
- (void)_setNeedsUpdateContainedToolbar:(BOOL)a3;
- (void)_setNeedsUpdateToolbarItems:(BOOL)a3;
- (void)_setNumberOfNestedChanges:(int64_t)a3;
- (void)_setToolbarItems:(id)a3;
- (void)_setUpdating:(BOOL)a3;
- (void)_updateAccessoryTopOutsetViewIfNeeded;
- (void)_updateAccessoryViewIfNeeded;
- (void)_updateIfNeededWithAnimatorBlock:(id)a3;
- (void)_updateToolbarItemsIfNeeded;
- (void)_updateViewsIfNeededWithAnimatorBlock:(id)a3;
- (void)layoutSubviews;
- (void)setBarStyle:(int64_t)a3;
- (void)setToolbarViewModel:(id)a3;
- (void)setToolbarViewModel:(id)a3 withAnimatorBlock:(id)a4;
- (void)tintColorDidChange;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUExtendedToolbar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryViewContainers, 0);
  objc_storeStrong((id *)&self->__accessoryViewContainer, 0);
  objc_storeStrong((id *)&self->__containedToolbar, 0);
  objc_storeStrong((id *)&self->__accessoryView, 0);
  objc_storeStrong((id *)&self->__toolbarItems, 0);
  objc_storeStrong((id *)&self->_toolbarViewModel, 0);
}

- (NSMutableSet)_accessoryViewContainers
{
  return self->__accessoryViewContainers;
}

- (UIView)_accessoryViewContainer
{
  return self->__accessoryViewContainer;
}

- (UIToolbar)_containedToolbar
{
  return self->__containedToolbar;
}

- (double)_accessoryViewTopOutset
{
  return self->__accessoryViewTopOutset;
}

- (void)_setContainedToolbarHeight:(double)a3
{
  self->__containedToolbarHeight = a3;
}

- (UIView)_accessoryView
{
  return self->__accessoryView;
}

- (NSArray)_toolbarItems
{
  return self->__toolbarItems;
}

- (void)_setNeedsUpdateAccessoryViewContainer:(BOOL)a3
{
  self->__needsUpdateAccessoryViewContainer = a3;
}

- (BOOL)_needsUpdateAccessoryViewContainer
{
  return self->__needsUpdateAccessoryViewContainer;
}

- (void)_setNeedsUpdateContainedToolbar:(BOOL)a3
{
  self->__needsUpdateContainedToolbar = a3;
}

- (BOOL)_needsUpdateContainedToolbar
{
  return self->__needsUpdateContainedToolbar;
}

- (void)_setNeedsUpdateAccessoryViewTopOutset:(BOOL)a3
{
  self->__needsUpdateAccessoryViewTopOutset = a3;
}

- (BOOL)_needsUpdateAccessoryViewTopOutset
{
  return self->__needsUpdateAccessoryViewTopOutset;
}

- (void)_setNeedsUpdateAccessoryView:(BOOL)a3
{
  self->__needsUpdateAccessoryView = a3;
}

- (BOOL)_needsUpdateAccessoryView
{
  return self->__needsUpdateAccessoryView;
}

- (void)_setNeedsUpdateToolbarItems:(BOOL)a3
{
  self->__needsUpdateToolbarItems = a3;
}

- (BOOL)_needsUpdateToolbarItems
{
  return self->__needsUpdateToolbarItems;
}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (void)_setNumberOfNestedChanges:(int64_t)a3
{
  self->__numberOfNestedChanges = a3;
}

- (int64_t)_numberOfNestedChanges
{
  return self->__numberOfNestedChanges;
}

- (PUToolbarViewModel)toolbarViewModel
{
  return self->_toolbarViewModel;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PUExtendedToolbar_viewModel_didChange___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  [(PUExtendedToolbar *)self _performChanges:v7];
}

uint64_t __41__PUExtendedToolbar_viewModel_didChange___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) toolbarItemsChanged]) {
    [*(id *)(a1 + 40) _invalidateToolbarItems];
  }
  if ([*(id *)(a1 + 32) accessoryViewChanged]) {
    [*(id *)(a1 + 40) _invalidateAccessoryView];
  }
  if ([*(id *)(a1 + 32) accessoryViewTopOutsetChanged]) {
    [*(id *)(a1 + 40) _invalidateAccessoryViewTopOutset];
  }
  if (([*(id *)(a1 + 32) maximumHeightChanged] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) accessoryViewMaximumHeightChanged], result))
  {
    v3 = *(void **)(a1 + 40);
    return [v3 setNeedsLayout];
  }
  return result;
}

- (void)_updateViewsIfNeededWithAnimatorBlock:(id)a3
{
  v4 = (void (**)(id, void (**)(void), void *))a3;
  BOOL v5 = [(PUExtendedToolbar *)self _needsUpdateContainedToolbar];
  BOOL v6 = [(PUExtendedToolbar *)self _needsUpdateAccessoryViewContainer];
  BOOL v7 = v6;
  if (!v5 && !v6) {
    goto LABEL_29;
  }
  [(PUExtendedToolbar *)self _setNeedsUpdateContainedToolbar:0];
  [(PUExtendedToolbar *)self _setNeedsUpdateAccessoryViewContainer:0];
  [(PUExtendedToolbar *)self bounds];
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(PUExtendedToolbar *)self _toolbarItems];
  v17 = [(PUExtendedToolbar *)self _accessoryView];
  uint64_t v18 = [(PUExtendedToolbar *)self _containedToolbar];
  v19 = (void *)v18;
  if (v5)
  {
    if (v18 && ![v16 count])
    {
      [(PUExtendedToolbar *)self _setContainedToolbar:0];
      v20 = v19;
      v19 = 0;
      if (v4)
      {
LABEL_7:
        v21 = [v19 snapshotViewAfterScreenUpdates:0];
        [v19 frame];
        objc_msgSend(v21, "setFrame:");
        [(PUExtendedToolbar *)self addSubview:v21];
        if (!v19)
        {
LABEL_13:
          if (![v16 count])
          {
            v19 = 0;
            if (v7) {
              goto LABEL_18;
            }
            goto LABEL_24;
          }
          id v22 = objc_alloc(MEMORY[0x1E4FB1DF0]);
          v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v23 bounds];
          v19 = objc_msgSend(v22, "initWithFrame:", 0.0, 0.0);

          objc_msgSend(v19, "setBarStyle:", -[PUExtendedToolbar barStyle](self, "barStyle"));
          v24 = [(PUExtendedToolbar *)self tintColor];
          [v19 setTintColor:v24];

          v25 = [MEMORY[0x1E4FB1618] clearColor];
          [v19 setBackgroundColor:v25];

          id v26 = objc_alloc_init(MEMORY[0x1E4FB1818]);
          [v19 setBackgroundImage:v26 forToolbarPosition:0 barMetrics:0];

          id v27 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
          v28 = [MEMORY[0x1E4FB1618] clearColor];
          [v27 setBackgroundColor:v28];

          [v19 _setBackgroundView:v27];
          id v29 = objc_alloc_init(MEMORY[0x1E4FB1818]);
          [v19 setShadowImage:v29 forToolbarPosition:0];

          LODWORD(v30) = 1148846080;
          [v19 setContentCompressionResistancePriority:1 forAxis:v30];
          [(PUExtendedToolbar *)self _setContainedToolbar:v19];

          if (!v19) {
            goto LABEL_17;
          }
        }
LABEL_15:
        [v19 setItems:v16];
        [v19 setAlpha:0.0];
        v31 = [v19 superview];

        if (!v31) {
          [(PUExtendedToolbar *)self addSubview:v19];
        }
LABEL_17:
        if (v7) {
          goto LABEL_18;
        }
        goto LABEL_24;
      }
    }
    else
    {
      v20 = 0;
      if (v4) {
        goto LABEL_7;
      }
    }
    v21 = 0;
    if (!v19) {
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  v21 = 0;
  v20 = 0;
  if (v7)
  {
LABEL_18:
    if (v17)
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v63.origin.x = v9;
      v63.origin.y = v11;
      v63.size.width = v13;
      v63.size.height = v15;
      objc_msgSend(v32, "setFrame:", v9, CGRectGetMinY(v63), v13, v15);
      [v32 setAlpha:0.0];
      double v33 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v34 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v35 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      [(PUExtendedToolbar *)self _accessoryViewTopOutset];
      double v37 = v36;
      [v32 bounds];
      objc_msgSend(v17, "setFrame:", v33 + v38, v39 - v37, v40 - (v33 + v35), v41 - (v34 - v37));
      [v17 setAutoresizingMask:18];
      [v32 addSubview:v17];
      [(PUExtendedToolbar *)self addSubview:v32];
      if (v32)
      {
        v42 = [(PUExtendedToolbar *)self _accessoryViewContainers];
        [v42 addObject:v32];
      }
    }
    else
    {
      id v32 = 0;
    }
    v43 = [(PUExtendedToolbar *)self _accessoryViewContainer];
    [(PUExtendedToolbar *)self _setAccessoryViewContainer:v32];
    goto LABEL_25;
  }
LABEL_24:
  v43 = 0;
  id v32 = 0;
LABEL_25:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke;
  aBlock[3] = &unk_1E5F2C960;
  id v44 = v21;
  id v58 = v44;
  id v45 = v20;
  id v59 = v45;
  id v46 = v19;
  id v60 = v46;
  id v61 = v43;
  id v62 = v32;
  id v47 = v32;
  id v48 = v43;
  v49 = (void (**)(void))_Block_copy(aBlock);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke_2;
  v53[3] = &unk_1E5F25270;
  id v54 = v44;
  id v55 = v45;
  v56 = self;
  id v50 = v45;
  id v51 = v44;
  v52 = (void (**)(void *, uint64_t))_Block_copy(v53);
  if (v4)
  {
    v4[2](v4, v49, v52);
  }
  else
  {
    v49[2](v49);
    v52[2](v52, 1);
  }

LABEL_29:
}

uint64_t __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  [*(id *)(a1 + 48) setAlpha:1.0];
  [*(id *)(a1 + 56) setAlpha:0.0];
  v2 = *(void **)(a1 + 64);
  return [v2 setAlpha:1.0];
}

void __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke_2(id *a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [a1[4] removeFromSuperview];
  [a1[5] removeFromSuperview];
  if (a2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = objc_msgSend(a1[6], "_accessoryViewContainers", 0);
    BOOL v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
          CGFloat v11 = [a1[6] _accessoryViewContainer];

          if (v10 != v11)
          {
            [v10 removeFromSuperview];
            double v12 = [a1[6] _accessoryViewContainers];
            [v12 removeObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)_invalidateAccessoryViewContainer
{
  [(PUExtendedToolbar *)self _setNeedsUpdateAccessoryViewContainer:1];
  [(PUExtendedToolbar *)self _setNeedsUpdate];
}

- (void)_invalidateContainedToolbar
{
  [(PUExtendedToolbar *)self _setNeedsUpdateContainedToolbar:1];
  [(PUExtendedToolbar *)self _setNeedsUpdate];
}

- (void)_setAccessoryViewTopOutset:(double)a3
{
  [(PUExtendedToolbar *)self _assertInsideUpdate];
  if (self->__accessoryViewTopOutset != a3)
  {
    self->__accessoryViewTopOutset = a3;
    [(PUExtendedToolbar *)self _invalidateAccessoryViewContainer];
  }
}

- (void)_updateAccessoryTopOutsetViewIfNeeded
{
  if ([(PUExtendedToolbar *)self _needsUpdateAccessoryViewTopOutset])
  {
    [(PUExtendedToolbar *)self _setNeedsUpdateAccessoryViewTopOutset:0];
    v3 = [(PUExtendedToolbar *)self toolbarViewModel];
    [v3 accessoryViewTopOutset];
    double v5 = v4;

    [(PUExtendedToolbar *)self _setAccessoryViewTopOutset:v5];
  }
}

- (void)_invalidateAccessoryViewTopOutset
{
  [(PUExtendedToolbar *)self _setNeedsUpdateAccessoryViewTopOutset:1];
  [(PUExtendedToolbar *)self _setNeedsUpdate];
}

- (void)_setAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  [(PUExtendedToolbar *)self _assertInsideUpdate];
  if (self->__accessoryView != v5)
  {
    objc_storeStrong((id *)&self->__accessoryView, a3);
    [(PUExtendedToolbar *)self _invalidateAccessoryViewContainer];
  }
}

- (void)_updateAccessoryViewIfNeeded
{
  if ([(PUExtendedToolbar *)self _needsUpdateAccessoryView])
  {
    [(PUExtendedToolbar *)self _setNeedsUpdateAccessoryView:0];
    v3 = [(PUExtendedToolbar *)self toolbarViewModel];
    id v4 = [v3 accessoryView];

    [(PUExtendedToolbar *)self _setAccessoryView:v4];
  }
}

- (void)_invalidateAccessoryView
{
  [(PUExtendedToolbar *)self _setNeedsUpdateAccessoryView:1];
  [(PUExtendedToolbar *)self _setNeedsUpdate];
}

- (void)_setToolbarItems:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  [(PUExtendedToolbar *)self _assertInsideUpdate];
  id v4 = v8;
  if (self->__toolbarItems != v8)
  {
    char v5 = -[NSArray isEqual:](v8, "isEqual:");
    id v4 = v8;
    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      toolbarItems = self->__toolbarItems;
      self->__toolbarItems = v6;

      [(PUExtendedToolbar *)self _invalidateContainedToolbar];
      id v4 = v8;
    }
  }
}

- (void)_updateToolbarItemsIfNeeded
{
  if ([(PUExtendedToolbar *)self _needsUpdateToolbarItems])
  {
    [(PUExtendedToolbar *)self _setNeedsUpdateToolbarItems:0];
    v3 = [(PUExtendedToolbar *)self toolbarViewModel];
    id v4 = [v3 toolbarItems];

    [(PUExtendedToolbar *)self _setToolbarItems:v4];
  }
}

- (void)_invalidateToolbarItems
{
  [(PUExtendedToolbar *)self _setNeedsUpdateToolbarItems:1];
  [(PUExtendedToolbar *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (![(PUExtendedToolbar *)self _isUpdating]
    && [(PUExtendedToolbar *)self _numberOfNestedChanges] <= 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUExtendedToolbar.m" lineNumber:267 description:@"not within an update or change block"];
  }
}

- (BOOL)_needsUpdate
{
  if ([(PUExtendedToolbar *)self _needsUpdateToolbarItems]
    || [(PUExtendedToolbar *)self _needsUpdateAccessoryView]
    || [(PUExtendedToolbar *)self _needsUpdateAccessoryViewTopOutset]
    || [(PUExtendedToolbar *)self _needsUpdateContainedToolbar])
  {
    return 1;
  }
  return [(PUExtendedToolbar *)self _needsUpdateAccessoryViewContainer];
}

- (void)_updateIfNeededWithAnimatorBlock:(id)a3
{
  id v7 = a3;
  if ([(PUExtendedToolbar *)self _needsUpdate])
  {
    BOOL v5 = [(PUExtendedToolbar *)self _isUpdating];
    [(PUExtendedToolbar *)self _setUpdating:1];
    [(PUExtendedToolbar *)self _updateToolbarItemsIfNeeded];
    [(PUExtendedToolbar *)self _updateAccessoryViewIfNeeded];
    [(PUExtendedToolbar *)self _updateAccessoryTopOutsetViewIfNeeded];
    [(PUExtendedToolbar *)self _updateViewsIfNeededWithAnimatorBlock:v7];
    [(PUExtendedToolbar *)self _setUpdating:v5];
    if ([(PUExtendedToolbar *)self _needsUpdate])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PUExtendedToolbar.m" lineNumber:251 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)_assertInsideUpdate
{
  if (![(PUExtendedToolbar *)self _isUpdating])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUExtendedToolbar.m" lineNumber:235 description:@"not withing update"];
  }
}

- (void)_assertInsideChangeBlock
{
  if ([(PUExtendedToolbar *)self _numberOfNestedChanges] <= 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUExtendedToolbar.m" lineNumber:230 description:@"not within a change block"];
  }
}

- (void)_performChanges:(id)a3 withAnimatorBlock:(id)a4
{
  id v7 = (void (**)(void))a3;
  id v8 = a4;
  if (!v7)
  {
    CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUExtendedToolbar.m", 211, @"Invalid parameter not satisfying: %@", @"changeBlock" object file lineNumber description];
  }
  uint64_t v9 = [(PUExtendedToolbar *)self _numberOfNestedChanges];
  [(PUExtendedToolbar *)self _setNumberOfNestedChanges:v9 + 1];
  if (v8 && v9 >= 1)
  {
    double v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "animatorBlock ignored for nested PUExtendedToolbar change", buf, 2u);
    }
  }
  v7[2](v7);
  [(PUExtendedToolbar *)self _setNumberOfNestedChanges:v9];
  if (!v9) {
    [(PUExtendedToolbar *)self _updateIfNeededWithAnimatorBlock:v8];
  }
}

- (void)_performChanges:(id)a3
{
}

- (void)_invalidateSize
{
  id v2 = [(PUExtendedToolbar *)self toolbarViewModel];
  [v2 setNeedsToUpdateToolbarSize:1];
}

- (void)_setAccessoryViewContainer:(id)a3
{
  BOOL v5 = (UIView *)a3;
  if (self->__accessoryViewContainer != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->__accessoryViewContainer, a3);
    [(PUExtendedToolbar *)self _invalidateSize];
    BOOL v5 = v6;
  }
}

- (void)_setContainedToolbar:(id)a3
{
  BOOL v5 = (UIToolbar *)a3;
  if (self->__containedToolbar != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->__containedToolbar, a3);
    [(PUExtendedToolbar *)self _invalidateSize];
    BOOL v5 = v6;
  }
}

- (void)_getContainedToolbarFrame:(CGRect *)a3 accessoryViewContainerFrame:(CGRect *)a4 forBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGRect slice = a5;
  CGRect v19 = a5;
  uint64_t v12 = [(PUExtendedToolbar *)self _containedToolbar];
  if (v12)
  {
    long long v13 = (void *)v12;
    long long v14 = [(PUExtendedToolbar *)self _accessoryViewContainer];

    if (v14)
    {
      [(PUExtendedToolbar *)self _containedToolbarHeight];
      CGFloat v16 = v15;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGRectDivide(v21, &slice, &v19, v16, CGRectMaxYEdge);
    }
  }
  if (a3)
  {
    CGSize size = slice.size;
    a3->origin = slice.origin;
    a3->CGSize size = size;
  }
  if (a4)
  {
    CGSize v18 = v19.size;
    a4->origin = v19.origin;
    a4->CGSize size = v18;
  }
}

- (double)_containedToolbarHeight
{
  double result = self->__containedToolbarHeight;
  if (result == 0.0)
  {
    -[PUExtendedToolbar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    return self->__containedToolbarHeight;
  }
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PUExtendedToolbar;
  [(PUExtendedToolbar *)&v10 layoutSubviews];
  v3 = [(PUExtendedToolbar *)self _containedToolbar];
  id v4 = [(PUExtendedToolbar *)self _accessoryViewContainer];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v8 = *MEMORY[0x1E4F1DB28];
  long long v9 = v5;
  long long v6 = v8;
  long long v7 = v5;
  [(PUExtendedToolbar *)self bounds];
  -[PUExtendedToolbar _getContainedToolbarFrame:accessoryViewContainerFrame:forBounds:](self, "_getContainedToolbarFrame:accessoryViewContainerFrame:forBounds:", &v8, &v6);
  objc_msgSend(v3, "pu_setCenterAndBoundsForFrameRect:", v8, v9);
  objc_msgSend(v4, "pu_setCenterAndBoundsForFrameRect:", v6, v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v8 = [(PUExtendedToolbar *)self _containedToolbar];
  -[PUExtendedToolbar convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  long long v13 = [(PUExtendedToolbar *)self _containedToolbar];
  long long v14 = objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);

  if (!v14)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v15 = [(PUExtendedToolbar *)self _accessoryViewContainers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v24 + 1) + 8 * i) subviews];
          CGRect v21 = [v20 firstObject];

          -[PUExtendedToolbar convertPoint:toView:](self, "convertPoint:toView:", v21, x, y);
          long long v14 = objc_msgSend(v21, "hitTest:withEvent:", v7);

          if (v14)
          {

            goto LABEL_12;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    v23.receiver = self;
    v23.super_class = (Class)PUExtendedToolbar;
    long long v14 = -[PUExtendedToolbar hitTest:withEvent:](&v23, sel_hitTest_withEvent_, v7, x, y);
  }
LABEL_12:

  return v14;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PUExtendedToolbar;
  -[PUExtendedToolbar sizeThatFits:](&v22, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(PUExtendedToolbar *)self _setContainedToolbarHeight:v6];
  uint64_t v8 = [(PUExtendedToolbar *)self _containedToolbar];
  uint64_t v9 = [(PUExtendedToolbar *)self _accessoryViewContainer];
  double v10 = (void *)v9;
  if (v8 | v9)
  {
    if (v8) {
      double v11 = v7 + 0.0;
    }
    else {
      double v11 = 0.0;
    }
    if (v9)
    {
      double v12 = [(PUExtendedToolbar *)self toolbarViewModel];
      [v12 accessoryViewMaximumHeight];
      double v14 = v13;

      if (v7 >= v14) {
        double v15 = v14;
      }
      else {
        double v15 = v7;
      }
      if (v14 <= 0.0) {
        double v15 = v7;
      }
      double v11 = v11 + v15;
    }
    uint64_t v16 = [(PUExtendedToolbar *)self toolbarViewModel];
    [v16 maximumHeight];
    double v18 = v17;

    if (v11 >= v18) {
      double v19 = v18;
    }
    else {
      double v19 = v11;
    }
    if (v18 <= 0.0) {
      double v7 = v11;
    }
    else {
      double v7 = v19;
    }
  }

  double v20 = v5;
  double v21 = v7;
  result.CGFloat height = v21;
  result.CGFloat width = v20;
  return result;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)PUExtendedToolbar;
  [(PUExtendedToolbar *)&v5 tintColorDidChange];
  v3 = [(PUExtendedToolbar *)self _containedToolbar];
  double v4 = [(PUExtendedToolbar *)self tintColor];
  [v3 setTintColor:v4];
}

- (void)setBarStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUExtendedToolbar;
  -[PUExtendedToolbar setBarStyle:](&v6, sel_setBarStyle_);
  objc_super v5 = [(PUExtendedToolbar *)self _containedToolbar];
  [v5 setBarStyle:a3];
}

- (void)setToolbarViewModel:(id)a3 withAnimatorBlock:(id)a4
{
  double v7 = (PUToolbarViewModel *)a3;
  toolbarViewModel = self->_toolbarViewModel;
  if (toolbarViewModel != v7)
  {
    id v9 = a4;
    [(PUViewModel *)toolbarViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_toolbarViewModel, a3);
    [(PUViewModel *)self->_toolbarViewModel registerChangeObserver:self];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__PUExtendedToolbar_setToolbarViewModel_withAnimatorBlock___block_invoke;
    v10[3] = &unk_1E5F2ED10;
    v10[4] = self;
    [(PUExtendedToolbar *)self _performChanges:v10 withAnimatorBlock:v9];
  }
}

uint64_t __59__PUExtendedToolbar_setToolbarViewModel_withAnimatorBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateToolbarItems];
  [*(id *)(a1 + 32) _invalidateAccessoryView];
  [*(id *)(a1 + 32) _invalidateAccessoryViewTopOutset];
  [*(id *)(a1 + 32) _invalidateContainedToolbar];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAccessoryViewContainer];
}

- (void)setToolbarViewModel:(id)a3
{
}

- (BOOL)_shouldStretchDuringCrossfadeTransition
{
  v3 = [(PUExtendedToolbar *)self toolbarViewModel];
  double v4 = [v3 toolbarItems];
  if ([v4 count])
  {
    BOOL v5 = 0;
  }
  else
  {
    objc_super v6 = [(PUExtendedToolbar *)self toolbarViewModel];
    double v7 = [v6 accessoryView];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (PUExtendedToolbar)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUExtendedToolbar;
  v3 = -[PUExtendedToolbar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:3];
    accessoryViewContainers = v3->__accessoryViewContainers;
    v3->__accessoryViewContainers = (NSMutableSet *)v4;

    objc_super v6 = [(PUExtendedToolbar *)v3 layer];
    [v6 setAllowsGroupOpacity:0];
  }
  return v3;
}

@end