@interface SXLinkHoverStylingManager
- (NSArray)hoverViews;
- (SXLinkHoverStylingManager)initWithTangierController:(id)a3;
- (SXTangierController)tangierController;
- (id)allHoverViews;
- (id)createHoverView;
- (void)applyHoverStyling;
- (void)setHoverViews:(id)a3;
@end

@implementation SXLinkHoverStylingManager

- (SXLinkHoverStylingManager)initWithTangierController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLinkHoverStylingManager;
  v6 = [(SXLinkHoverStylingManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tangierController, a3);
  }

  return v7;
}

- (void)applyHoverStyling
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(SXLinkHoverStylingManager *)self hoverViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 removeFromSuperview];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_super v9 = [(SXLinkHoverStylingManager *)self allHoverViews];
  [(SXLinkHoverStylingManager *)self setHoverViews:v9];
}

- (id)allHoverViews
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v19 = (id)objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [(SXLinkHoverStylingManager *)self tangierController];
  v3 = [v2 icc];
  uint64_t v4 = [v3 canvas];
  uint64_t v5 = [v4 topLevelReps];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        long long v11 = TSUDynamicCast();
        long long v12 = v11;
        if (v11)
        {
          long long v13 = [v11 storage];
          uint64_t v14 = [v12 range];
          uint64_t v16 = v15;
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __42__SXLinkHoverStylingManager_allHoverViews__block_invoke;
          v20[3] = &unk_264651FA8;
          id v21 = v12;
          uint64_t v22 = v10;
          v23 = self;
          id v24 = v19;
          objc_msgSend(v13, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v14, v16, v20);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  return v19;
}

void __42__SXLinkHoverStylingManager_allHoverViews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    id v28 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) columns];
    uint64_t v6 = [v5 firstObject];

    uint64_t v7 = [v4 range];
    long long v27 = v6;
    objc_super v9 = objc_msgSend(v6, "rectsForSelectionRange:selectionType:", v7, v8, 0);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(a1 + 40);
          [*(id *)(*((void *)&v29 + 1) + 8 * v13) CGRectValue];
          objc_msgSend(v14, "convertNaturalRectToUnscaledCanvas:");
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          v23 = [*(id *)(a1 + 48) createHoverView];
          objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);
          id v24 = [*(id *)(a1 + 48) tangierController];
          long long v25 = [v24 icc];
          long long v26 = [v25 canvasView];
          [v26 addSubview:v23];

          [*(id *)(a1 + 56) addObject:v23];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    id v3 = v28;
  }
}

- (id)createHoverView
{
  v2 = objc_alloc_init(SXHoverStyleView);
  id v3 = [MEMORY[0x263F1C6A8] automaticStyle];
  [(SXHoverStyleView *)v2 setHoverStyle:v3];

  return v2;
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (NSArray)hoverViews
{
  return self->_hoverViews;
}

- (void)setHoverViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverViews, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
}

@end