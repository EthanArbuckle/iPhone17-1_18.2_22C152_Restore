@interface SBHScrollableIconViewInteraction
- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3;
- (SBHScrollableIconViewContaining)container;
- (SBHScrollableIconViewInteraction)initWithContainer:(id)a3;
- (double)_clippingFudgeInset;
- (id)_findInteractingIconView;
- (void)clippingScrollViewDidScroll:(id)a3;
- (void)updateScrolling:(BOOL)a3;
@end

@implementation SBHScrollableIconViewInteraction

- (SBHScrollableIconViewInteraction)initWithContainer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHScrollableIconViewInteraction;
  v5 = [(SBHScrollableIconViewInteraction *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_container, v4);
  }

  return v6;
}

- (void)updateScrolling:(BOOL)a3
{
  if (a3)
  {
    id v5 = [(SBHScrollableIconViewInteraction *)self _findInteractingIconView];
    objc_storeWeak((id *)&self->_cachedInteractingIconView, v5);
  }
  else
  {
    p_cachedInteractingIconView = &self->_cachedInteractingIconView;
    objc_storeWeak((id *)p_cachedInteractingIconView, 0);
  }
}

- (void)clippingScrollViewDidScroll:(id)a3
{
  id v38 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedInteractingIconView);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained superview];
    [v5 frame];
    objc_msgSend(v6, "convertRect:toView:", v38);
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    [(SBHScrollableIconViewInteraction *)self _clippingFudgeInset];
    CGFloat v16 = v15;
    v40.origin.CGFloat x = v8;
    v40.origin.CGFloat y = v10;
    v40.size.CGFloat width = v12;
    v40.size.CGFloat height = v14;
    CGRect v41 = CGRectInset(v40, v16, v16);
    CGFloat y = v41.origin.y;
    CGFloat x = v41.origin.x;
    CGFloat height = v41.size.height;
    CGFloat width = v41.size.width;
    [v38 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    id v25 = objc_loadWeakRetained((id *)&self->_container);
    [v25 visibleContainerInsets];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    v42.origin.CGFloat x = v18 + v29;
    v42.origin.CGFloat y = v20 + v27;
    v42.size.CGFloat width = v22 - (v29 + v33);
    v42.size.CGFloat height = v24 - (v27 + v31);
    v43.origin.CGFloat y = y;
    v43.origin.CGFloat x = x;
    v43.size.CGFloat height = height;
    v43.size.CGFloat width = width;
    if (!CGRectContainsRect(v42, v43))
    {
      [(SBHScrollableIconViewInteraction *)self handleTargetIconViewClipped:v5];
      objc_storeWeak((id *)&self->_cachedInteractingIconView, 0);
    }
  }
}

- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3
{
  return 0;
}

- (double)_clippingFudgeInset
{
  return 0.0;
}

- (id)_findInteractingIconView
{
  uint64_t v7 = 0;
  CGFloat v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CGFloat v10 = __Block_byref_object_copy__2;
  double v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SBHScrollableIconViewInteraction__findInteractingIconView__block_invoke;
  v6[3] = &unk_1E6AAD6B8;
  v6[4] = self;
  v6[5] = &v7;
  [WeakRetained enumerateScrollableIconViewsUsingBlock:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __60__SBHScrollableIconViewInteraction__findInteractingIconView__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconViewTheInteractingTargetIconView:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SBHScrollableIconViewContaining)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (SBHScrollableIconViewContaining *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_destroyWeak((id *)&self->_cachedInteractingIconView);
}

@end