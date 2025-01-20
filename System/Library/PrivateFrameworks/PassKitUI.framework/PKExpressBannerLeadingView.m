@interface PKExpressBannerLeadingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKExpressBannerLeadingView)init;
- (PKExpressBannerLeadingView)initWithCoder:(id)a3;
- (PKExpressBannerLeadingView)initWithFrame:(CGRect)a3;
- (uint64_t)_metricsForSizeClass:(unsigned int)a3;
- (void)_finishTransition;
- (void)_setState:(void *)a3 withCompletion:;
- (void)_updateLayerState;
- (void)_updateSizeWithAnimationFactory:(uint64_t)a1;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation PKExpressBannerLeadingView

- (PKExpressBannerLeadingView)init
{
  return 0;
}

- (PKExpressBannerLeadingView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKExpressBannerLeadingView)initWithCoder:(id)a3
{
  return 0;
}

- (void)_updateSizeWithAnimationFactory:(uint64_t)a1
{
  id v3 = a2;
  CGFloat v22 = 0.0;
  long long v20 = 0u;
  long long v21 = 0u;
  -[PKExpressBannerLeadingView _metricsForSizeClass:]((uint64_t)&v20, (double *)a1, *(_DWORD *)(a1 + 460), (__n128)0, v4, v5);
  long long v6 = v20;
  BOOL v7 = *(double *)(a1 + 512) == *(double *)&v20 && *(double *)(a1 + 520) == *((double *)&v20 + 1);
  if (!v7
    || (*(double *)(a1 + 528) == *(double *)&v21 ? (BOOL v8 = *(double *)(a1 + 536) == *((double *)&v21 + 1)) : (BOOL v8 = 0), !v8))
  {
    memset(&v19, 0, sizeof(v19));
    CATransform3DMakeScale(&v19, v22, v22, 1.0);
    memset(&v18, 0, sizeof(v18));
    v9 = *(void **)(a1 + 432);
    if (v9) {
      [v9 transform];
    }
    CATransform3D a = v19;
    CATransform3D v16 = v18;
    if (!CATransform3DEqualToTransform(&a, &v16))
    {
      if (v3)
      {
        v10 = [v3 springAnimationWithKeyPath:@"transform"];
        CATransform3D a = v18;
        CATransform3D v16 = v19;
        objc_msgSend(v10, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v16);
        id v11 = (id)objc_msgSend(*(id *)(a1 + 432), "pkui_addAdditiveAnimation:", v10);
      }
      v12 = *(void **)(a1 + 432);
      CATransform3D a = v19;
      [v12 setTransform:&a];
    }
    long long v13 = v21;
    *(_OWORD *)(a1 + 512) = v20;
    *(_OWORD *)(a1 + 528) = v13;
    PKFloatRoundToPixel();
    *(double *)(a1 + 552) = v14;
    *(double *)(a1 + 568) = *(double *)&v6 - (v14 + *(double *)&v21);
    PKFloatRoundToPixel();
    *(double *)(a1 + 544) = v15;
    *(double *)(a1 + 560) = *((double *)&v6 + 1) - (v15 + *((double *)&v21 + 1));
    [(id)a1 setNeedsLayout];
  }
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  transitionTimer = self->_transitionTimer;
  if (transitionTimer)
  {
    dispatch_source_cancel(transitionTimer);
    __n128 v4 = self->_transitionTimer;
    self->_transitionTimer = 0;
  }
  completions = self->_completions;
  if (completions)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v6 = completions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PKExpressBannerLeadingView;
  [(PKExpressBannerLeadingView *)&v11 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_targetAlignmentSize.width;
  double height = self->_targetAlignmentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKExpressBannerLeadingView;
  [(PKExpressBannerLeadingView *)&v11 layoutSubviews];
  [(PKExpressBannerLeadingView *)self bounds];
  PKSizeAlignedInRect();
  double v4 = v3 - self->_targetAlignmentInsets.left;
  double v6 = v5 - self->_targetAlignmentInsets.top;
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  [(CALayer *)self->_contentLayer anchorPoint];
  -[CALayer setPosition:](self->_contentLayer, "setPosition:", v4 + v9 * width, v6 + v10 * height);
}

- (uint64_t)_metricsForSizeClass:(unsigned int)a3
{
  uint64_t v7 = result;
  uint64_t v8 = (double *)MEMORY[0x1E4F1DB30];
  a4.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3 < 3)
  {
    a4.n128_f64[0] = 1.79769313e308;
    uint64_t v8 = (double *)((char *)&unk_1A0445BE8 + 8 * (int)a3);
  }
  if (*v8 <= 0.0 || a4.n128_f64[0] <= 0.0)
  {
    uint64_t v11 = *((void *)a2 + 60);
    uint64_t v13 = *((void *)a2 + 61);
    uint64_t v17 = *((void *)a2 + 62);
    uint64_t v18 = *((void *)a2 + 63);
    double v9 = 1.0;
  }
  else
  {
    a6.n128_f64[0] = a2[62];
    double v9 = fmin(*v8 / a6.n128_f64[0], a4.n128_f64[0] / a2[63]);
    a4.n128_f64[0] = v9 * a2[60];
    a5.n128_f64[0] = v9 * a2[61];
    PKSizeRoundToPixel(a4, a5, a6);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    v14.n128_f64[0] = v9 * a2[62];
    v15.n128_f64[0] = v9 * a2[63];
    CGSize result = PKSizeRoundToPixel(v14, v15, v16);
  }
  *(void *)uint64_t v7 = v11;
  *(void *)(v7 + 8) = v13;
  *(void *)(v7 + 16) = v17;
  *(void *)(v7 + 24) = v18;
  *(double *)(v7 + 32) = v9;
  return result;
}

- (void)_updateLayerState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = *(_DWORD *)(a1 + 456) - 1;
  if (v3 <= 3)
  {
    double v4 = off_1E59DF070[v3];
    uint64_t v5 = [*(id *)(a1 + 432) stateWithName:v4];
    if (v5)
    {
      LODWORD(v6) = 1.0;
      double v9 = (void *)v5;
      [*(id *)(a1 + 448) setState:v5 ofLayer:*(void *)(a1 + 432) transitionSpeed:v6];
      uint64_t v7 = v9;
      goto LABEL_8;
    }
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: could not find state with name %@.", buf, 0xCu);
    }
  }
  LODWORD(a2) = 1.0;
  [*(id *)(a1 + 448) setInitialStatesOfLayer:*(void *)(a1 + 432) transitionSpeed:a2];
  uint64_t v7 = 0;
LABEL_8:
}

- (void)_setState:(void *)a3 withCompletion:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 456) == a2)
    {
      if (v5)
      {
        uint64_t v7 = *(void **)(a1 + 472);
        if (v7)
        {
          uint64_t v8 = _Block_copy(v5);
          [v7 addObject:v8];
        }
        else
        {
          (*((void (**)(id, void))v5 + 2))(v5, 0);
        }
      }
    }
    else
    {
      *(_DWORD *)(a1 + 456) = a2;
      double v9 = *(NSObject **)(a1 + 464);
      if (v9)
      {
        dispatch_source_cancel(v9);
        uint64_t v10 = *(void **)(a1 + 464);
        *(void *)(a1 + 464) = 0;
      }
      id v11 = *(id *)(a1 + 472);
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      if (v6)
      {
        uint64_t v13 = _Block_copy(v6);
        [v12 addObject:v13];
      }
      objc_storeStrong((id *)(a1 + 472), v12);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * v18++) + 16))();
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v16);
      }

      CATransform3D v19 = *(void **)(a1 + 472);
      if (v12 == v19)
      {
        int v21 = *(_DWORD *)(a1 + 456) - 1;
        if (v21 > 3)
        {
          [(PKExpressBannerLeadingView *)a1 _updateLayerState];
          -[PKExpressBannerLeadingView _finishTransition](a1);
        }
        else
        {
          int64_t v22 = qword_1A0445C00[v21];
          [(PKExpressBannerLeadingView *)a1 _updateLayerState];
          dispatch_source_t v23 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
          v24 = *(void **)(a1 + 464);
          *(void *)(a1 + 464) = v23;

          v25 = *(NSObject **)(a1 + 464);
          dispatch_time_t v26 = dispatch_time(0, v22);
          dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
          objc_initWeak(&location, (id)a1);
          v27 = *(NSObject **)(a1 + 464);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __55__PKExpressBannerLeadingView__setState_withCompletion___block_invoke;
          v28[3] = &unk_1E59CA7F8;
          objc_copyWeak(&v29, &location);
          dispatch_source_set_event_handler(v27, v28);
          dispatch_activate(*(dispatch_object_t *)(a1 + 464));
          objc_destroyWeak(&v29);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __55__PKExpressBannerLeadingView__setState_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PKExpressBannerLeadingView _finishTransition]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)_finishTransition
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(a1 + 464);
  if (v2)
  {
    dispatch_source_cancel(v2);
    unsigned int v3 = *(void **)(a1 + 464);
    *(void *)(a1 + 464) = 0;
  }
  id v4 = *(id *)(a1 + 472);
  id v5 = *(void **)(a1 + 472);
  *(void *)(a1 + 472) = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_frontLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_passPortal, 0);
  objc_storeStrong((id *)&self->_passView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end