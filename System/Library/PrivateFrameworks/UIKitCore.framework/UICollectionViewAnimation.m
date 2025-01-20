@interface UICollectionViewAnimation
- (BOOL)animateFromCurrentPosition;
- (BOOL)deleteAfterAnimation;
- (BOOL)parentInCollectionViewDuringAnimation;
- (BOOL)rasterizeAfterAnimation;
- (BOOL)resetRasterizationAfterAnimation;
- (BOOL)updateZIndexAfterAnimation;
- (UICollectionReusableView)view;
- (UICollectionViewAnimation)initWithView:(id)a3 viewType:(int64_t)a4 finalLayoutAttributes:(id)a5 startFraction:(double)a6 endFraction:(double)a7 animateFromCurrentPostion:(BOOL)a8 deleteAfterAnimation:(BOOL)a9 customAnimations:(id)a10;
- (UICollectionViewLayoutAttributes)finalLayoutAttributes;
- (double)endFraction;
- (double)startFraction;
- (id)description;
- (int64_t)viewType;
- (void)addCompletionHandler:(id)a3;
- (void)addStartupHandler:(id)a3;
- (void)setParentInCollectionViewDuringAnimation:(BOOL)a3;
- (void)setRasterizeAfterAnimation:(BOOL)a3;
- (void)setResetRasterizationAfterAnimation:(BOOL)a3;
- (void)start;
- (void)startWithAnimator:(id)a3;
@end

@implementation UICollectionViewAnimation

void __47__UICollectionViewAnimation_startWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(*(void *)(a1 + 40) + 8);
    [*(id *)(*(void *)(a1 + 40) + 16) center];
    objc_msgSend(v2, "setPosition:");
    [v2 bounds];
    double v4 = v3;
    double v6 = v5;
    [*(id *)(*(void *)(a1 + 40) + 16) size];
    objc_msgSend(v2, "setBounds:", v4, v6, v7, v8);
    [*(id *)(*(void *)(a1 + 40) + 16) alpha];
    *(float *)&double v9 = v9;
    [v2 setOpacity:v9];
    v10 = *(void **)(*(void *)(a1 + 40) + 16);
    if (v10)
    {
      [v10 transform3D];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
    }
    v25[4] = v30;
    v25[5] = v31;
    v25[6] = v32;
    v25[7] = v33;
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    v25[3] = v29;
    [v2 setTransform:v25];

    return;
  }
  [*(id *)(a1 + 32) alpha];
  double v12 = v11;
  [*(id *)(*(void *)(a1 + 40) + 16) alpha];
  if (v12 != v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = *(id *)(a1 + 32);
      char v15 = [v14 _disableRasterizeInAnimations];
      int v16 = [v14 _disableGroupOpacityInAnimations];

      if (v15)
      {
        if (!v16) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else
    {
      LOBYTE(v16) = 1;
    }
    v17 = [*(id *)(a1 + 32) layer];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v17 shouldRasterize] ^ 1;

    [*(id *)(a1 + 32) _currentScreenScale];
    double v19 = v18;
    v20 = [*(id *)(a1 + 32) layer];
    [v20 setRasterizationScale:v19];

    v21 = [*(id *)(a1 + 32) layer];
    [v21 setShouldRasterize:1];

    if (v16)
    {
LABEL_13:
      v22 = [*(id *)(a1 + 32) layer];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v22 allowsGroupOpacity];

      v23 = [*(id *)(a1 + 32) layer];
      [v23 setAllowsGroupOpacity:0];
    }
  }
LABEL_14:
  [*(id *)(a1 + 48) _applyLayoutAttributes:*(void *)(*(void *)(a1 + 40) + 16) toView:*(void *)(a1 + 32)];
  if (dyld_program_sdk_at_least() && *(unsigned char *)(a1 + 72))
  {
    v24 = *(void **)(a1 + 32);
    [v24 layoutIfNeeded];
  }
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) layoutBelowIfNeeded];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    double v3 = *(void **)(a1 + 40);
    return [v3 _reparentViewIntoSelf:v4];
  }
  return result;
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = [*(id *)(a1 + 32) layer];
    [v2 setShouldRasterize:0];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    double v3 = [*(id *)(a1 + 32) layer];
    [v3 setAllowsGroupOpacity:1];
  }
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 40) _reparentViewIntoCorrectContainer:*(void *)(a1 + 32)];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 48) + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * i));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 48) + 48), "removeAllObjects", (void)v10);
}

- (UICollectionReusableView)view
{
  return self->_view;
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributes
{
  return self->_finalLayoutAttributes;
}

- (BOOL)deleteAfterAnimation
{
  return (*(unsigned char *)&self->_collectionViewAnimationFlags >> 1) & 1;
}

- (void)addCompletionHandler:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = (id)[a3 copy];
    [(NSMutableArray *)completionHandlers addObject:v4];
  }
}

- (void)startWithAnimator:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  if ([(UICollectionViewAnimation *)self parentInCollectionViewDuringAnimation])
  {
    uint64_t v5 = [(UIView *)self->_view superview];
    uint64_t v6 = [(UICollectionReusableView *)self->_view _collectionView];
    BOOL v7 = v5 != v6;
  }
  else
  {
    BOOL v7 = 0;
  }
  double v8 = [(UICollectionReusableView *)self->_view _collectionView];
  double v9 = self->_view;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke;
  v67[3] = &unk_1E52DC3D0;
  long long v10 = v9;
  v68 = v10;
  BOOL v70 = v7;
  id v11 = v8;
  id v69 = v11;
  +[UIView performWithoutAnimation:v67];
  char collectionViewAnimationFlags = (char)self->_collectionViewAnimationFlags;
  if (self->_startFraction <= 0.0 && self->_endFraction >= 1.0)
  {
    double v17 = 0.0;
    double v16 = 0.3;
  }
  else
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    double startFraction = self->_startFraction;
    double endFraction = self->_endFraction;
    if (has_internal_diagnostics)
    {
      if (endFraction < startFraction)
      {
        long long v30 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "Cell animation stop fraction must be greater than start fraction", buf, 2u);
        }
      }
    }
    else if (endFraction < startFraction)
    {
      long long v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &startWithAnimator____s_category) + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "Cell animation stop fraction must be greater than start fraction", buf, 2u);
      }
    }
    double v15 = self->_startFraction;
    double v16 = (self->_endFraction - v15) * 0.3;
    double v17 = v15 * 0.3;
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  double v18 = self->_startupHandlers;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v18);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v63 + 1) + 8 * i) + 16))();
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v19);
  }

  [(NSMutableArray *)self->_startupHandlers removeAllObjects];
  *(void *)buf = 0;
  v60 = buf;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  char v58 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"UICollectionView_InternalHelperClasses.m" lineNumber:352 description:@"Collection View no longer support raw layer or view animations."];
  }
  if (self->_animationBlock)
  {
    [(UICollectionReusableView *)v10 _setBaseLayoutAttributes:self->_finalLayoutAttributes];
    animationBlock = (void (**)(void))self->_animationBlock;
    uint64_t v52 = MEMORY[0x1E4F143A8];
    uint64_t v53 = 3221225472;
    v54 = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_102;
    v55 = &unk_1E52DC3A0;
    v56 = self;
    animationBlock[2]();
    [(UICollectionReusableView *)v10 applyLayoutAttributes:self->_finalLayoutAttributes];
  }
  else
  {
    if (v33) {
      char v23 = [v33 shouldLayoutSubviews];
    }
    else {
      char v23 = 1;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_2;
    aBlock[3] = &unk_1E52E6478;
    v24 = v10;
    v46 = v24;
    v47 = self;
    v49 = buf;
    v50 = v57;
    id v25 = v11;
    id v48 = v25;
    char v51 = v23;
    long long v26 = _Block_copy(aBlock);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_3;
    v38[3] = &unk_1E52E64A0;
    v42 = buf;
    v39 = v24;
    v43 = v57;
    BOOL v44 = v7;
    id v40 = v25;
    v41 = self;
    long long v27 = _Block_copy(v38);
    if (v33)
    {
      [v33 addAnimations:v26];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_4;
      v36[3] = &unk_1E52E5E20;
      id v37 = v27;
      [v33 addCompletion:v36];
      if (([v33 isRunning] & 1) == 0)
      {
        if (v17 <= 0.0)
        {
          [v33 startAnimation];
        }
        else
        {
          dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_5;
          block[3] = &unk_1E52D9F70;
          id v35 = v33;
          dispatch_after(v28, MEMORY[0x1E4F14428], block);
        }
      }
    }
    else
    {
      +[UIView animateWithDuration:4 * (collectionViewAnimationFlags & 1) delay:v26 options:v27 animations:v16 completion:v17];
    }
  }
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(buf, 8);
}

- (BOOL)parentInCollectionViewDuringAnimation
{
  return self->_parentInCollectionViewDuringAnimation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationBlock, 0);
  objc_storeStrong((id *)&self->_startupHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_finalLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (BOOL)resetRasterizationAfterAnimation
{
  return (*(unsigned char *)&self->_collectionViewAnimationFlags >> 3) & 1;
}

- (BOOL)updateZIndexAfterAnimation
{
  return (*(unsigned char *)&self->_collectionViewAnimationFlags >> 4) & 1;
}

- (int64_t)viewType
{
  return self->_viewType;
}

- (UICollectionViewAnimation)initWithView:(id)a3 viewType:(int64_t)a4 finalLayoutAttributes:(id)a5 startFraction:(double)a6 endFraction:(double)a7 animateFromCurrentPostion:(BOOL)a8 deleteAfterAnimation:(BOOL)a9 customAnimations:(id)a10
{
  BOOL v11 = a9;
  id v19 = a3;
  id v20 = a5;
  id v21 = a10;
  if (!v19)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"UICollectionView_InternalHelperClasses.m" lineNumber:255 description:@"attempt to create view animation for nil view"];
  }
  v36.receiver = self;
  v36.super_class = (Class)UICollectionViewAnimation;
  v22 = [(UICollectionViewAnimation *)&v36 init];
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      char v23 = [v19 layer];
    }
    else
    {
      char v23 = (UICollectionReusableView *)v19;
    }
    view = v22->_view;
    v22->_view = v23;

    v22->_viewType = a4;
    objc_storeStrong((id *)&v22->_finalLayoutAttributes, a5);
    v22->_double startFraction = a6;
    v22->_double endFraction = a7;
    if (v11) {
      char v25 = 2;
    }
    else {
      char v25 = 0;
    }
    *(unsigned char *)&v22->_char collectionViewAnimationFlags = v25 | a8 | *(unsigned char *)&v22->_collectionViewAnimationFlags & 0xFC;
    long long v26 = [v19 _layoutAttributes];
    uint64_t v27 = [v26 zIndex];
    *(unsigned char *)&v22->_char collectionViewAnimationFlags = *(unsigned char *)&v22->_collectionViewAnimationFlags & 0xEF | (16 * (v27 != [v20 zIndex]));

    dispatch_time_t v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v22->_completionHandlers;
    v22->_completionHandlers = v28;

    long long v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    startupHandlers = v22->_startupHandlers;
    v22->_startupHandlers = v30;

    uint64_t v32 = [v21 copy];
    id animationBlock = v22->_animationBlock;
    v22->_id animationBlock = (id)v32;
  }
  return v22;
}

- (void)addStartupHandler:(id)a3
{
  if (a3)
  {
    startupHandlers = self->_startupHandlers;
    id v4 = (id)[a3 copy];
    [(NSMutableArray *)startupHandlers addObject:v4];
  }
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAnimation;
  double v3 = [(UICollectionViewAnimation *)&v6 description];
  objc_msgSend(v3, "stringByAppendingFormat:", @" view: %@; finalLayoutAttributes = %@",
    self->_view,
  id v4 = self->_finalLayoutAttributes);

  return v4;
}

- (BOOL)animateFromCurrentPosition
{
  return *(unsigned char *)&self->_collectionViewAnimationFlags & 1;
}

- (void)setRasterizeAfterAnimation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char collectionViewAnimationFlags = *(unsigned char *)&self->_collectionViewAnimationFlags & 0xFB | v3;
}

- (BOOL)rasterizeAfterAnimation
{
  return (*(unsigned char *)&self->_collectionViewAnimationFlags >> 2) & 1;
}

- (void)setResetRasterizationAfterAnimation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char collectionViewAnimationFlags = *(unsigned char *)&self->_collectionViewAnimationFlags & 0xF7 | v3;
}

- (void)start
{
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_102(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeAllObjects", (void)v8);
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAnimation];
}

- (double)startFraction
{
  return self->_startFraction;
}

- (double)endFraction
{
  return self->_endFraction;
}

- (void)setParentInCollectionViewDuringAnimation:(BOOL)a3
{
  self->_parentInCollectionViewDuringAnimation = a3;
}

@end