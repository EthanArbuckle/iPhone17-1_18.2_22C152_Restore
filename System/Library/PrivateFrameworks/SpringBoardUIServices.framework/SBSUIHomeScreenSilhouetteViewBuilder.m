@interface SBSUIHomeScreenSilhouetteViewBuilder
- (BOOL)includesDock;
- (CGRect)frameForNormalizedFrame:(CGRect)a3;
- (CGSize)viewSize;
- (SBSHomeScreenSilhouetteLayout)silhouetteLayout;
- (SBSUIHomeScreenSilhouetteViewBuilder)initWithSilhouetteLayout:(id)a3 viewSize:(CGSize)a4;
- (id)buildView;
- (id)dockViewBuilder;
- (id)iconViewBuilder;
- (id)makeDockView;
- (id)makeIconView;
- (id)makeRootView;
- (id)rootViewBuilder;
- (void)setDockViewBuilder:(id)a3;
- (void)setIconViewBuilder:(id)a3;
- (void)setIncludesDock:(BOOL)a3;
- (void)setRootViewBuilder:(id)a3;
@end

@implementation SBSUIHomeScreenSilhouetteViewBuilder

- (SBSUIHomeScreenSilhouetteViewBuilder)initWithSilhouetteLayout:(id)a3 viewSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSUIHomeScreenSilhouetteViewBuilder;
  v8 = [(SBSUIHomeScreenSilhouetteViewBuilder *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    silhouetteLayout = v8->_silhouetteLayout;
    v8->_silhouetteLayout = (SBSHomeScreenSilhouetteLayout *)v9;

    v8->_viewSize.CGFloat width = width;
    v8->_viewSize.CGFloat height = height;
    v8->_includesDock = 1;
  }

  return v8;
}

- (id)buildView
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  [(SBSUIHomeScreenSilhouetteViewBuilder *)self viewSize];
  double v36 = v3;
  v4 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self makeRootView];
  v5 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self silhouetteLayout];
  BOOL v6 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self includesDock];
  id v7 = [v5 dock];
  if (v7 && v6)
  {
    v8 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self makeDockView];
    if (v8)
    {
      [v7 frame];
      -[SBSUIHomeScreenSilhouetteViewBuilder frameForNormalizedFrame:](self, "frameForNormalizedFrame:");
      objc_msgSend(v8, "setFrame:");
      [v7 cornerRadius];
      [v8 _setContinuousCornerRadius:v36 * v9];
      [v4 addSubview:v8];
    }
  }
  [v7 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v35 = v5;
  v18 = [v5 icons];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v23 frame];
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        if (v6) {
          goto LABEL_13;
        }
        v44.origin.x = v11;
        v44.origin.y = v13;
        v44.size.CGFloat width = v15;
        v44.size.CGFloat height = v17;
        v45.origin.x = v25;
        v45.origin.y = v27;
        v45.size.CGFloat width = v29;
        v45.size.CGFloat height = v31;
        if (!CGRectContainsRect(v44, v45))
        {
LABEL_13:
          v32 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self makeIconView];
          if (v32)
          {
            -[SBSUIHomeScreenSilhouetteViewBuilder frameForNormalizedFrame:](self, "frameForNormalizedFrame:", v25, v27, v29, v31);
            objc_msgSend(v32, "setFrame:");
            [v23 cornerRadius];
            [v32 _setContinuousCornerRadius:v36 * v33];
            [v4 addSubview:v32];
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v20);
  }

  return v4;
}

- (id)makeRootView
{
  double v3 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self rootViewBuilder];
  [(SBSUIHomeScreenSilhouetteViewBuilder *)self viewSize];
  if (v3)
  {
    BOOL v6 = v3[2](v3, v4, v5);
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"A view must be returned from the rootViewBuilder" userInfo:0];
      objc_exception_throw(v7);
    }
  }
  else
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v4.n128_f64[0], v5.n128_f64[0]);
  }

  return v6;
}

- (id)makeDockView
{
  uint64_t v2 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self dockViewBuilder];
  double v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    __n128 v5 = [MEMORY[0x1E4F428B8] colorWithWhite:0.8 alpha:0.6];
    [v4 setBackgroundColor:v5];
  }
  return v4;
}

- (id)makeIconView
{
  uint64_t v2 = [(SBSUIHomeScreenSilhouetteViewBuilder *)self iconViewBuilder];
  double v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    __n128 v5 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.7];
    [v4 setBackgroundColor:v5];
  }
  return v4;
}

- (CGRect)frameForNormalizedFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SBSUIHomeScreenSilhouetteViewBuilder *)self viewSize];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v22);
  v23.origin.CGFloat x = 0.0;
  v23.origin.CGFloat y = 0.0;
  v23.size.CGFloat width = v8;
  v23.size.CGFloat height = v10;
  double v21 = MinX * CGRectGetWidth(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v24);
  v25.origin.CGFloat x = 0.0;
  v25.origin.CGFloat y = 0.0;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  double v13 = MinY * CGRectGetHeight(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v26);
  v27.origin.CGFloat x = 0.0;
  v27.origin.CGFloat y = 0.0;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  double v15 = v14 * CGRectGetWidth(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v28);
  v29.origin.CGFloat x = 0.0;
  v29.origin.CGFloat y = 0.0;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v10;
  double v17 = v16 * CGRectGetHeight(v29);
  double v18 = v21;
  double v19 = v13;
  double v20 = v15;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (SBSHomeScreenSilhouetteLayout)silhouetteLayout
{
  return self->_silhouetteLayout;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)rootViewBuilder
{
  return self->_rootViewBuilder;
}

- (void)setRootViewBuilder:(id)a3
{
}

- (id)iconViewBuilder
{
  return self->_iconViewBuilder;
}

- (void)setIconViewBuilder:(id)a3
{
}

- (id)dockViewBuilder
{
  return self->_dockViewBuilder;
}

- (void)setDockViewBuilder:(id)a3
{
}

- (BOOL)includesDock
{
  return self->_includesDock;
}

- (void)setIncludesDock:(BOOL)a3
{
  self->_includesDock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dockViewBuilder, 0);
  objc_storeStrong(&self->_iconViewBuilder, 0);
  objc_storeStrong(&self->_rootViewBuilder, 0);
  objc_storeStrong((id *)&self->_silhouetteLayout, 0);
}

@end