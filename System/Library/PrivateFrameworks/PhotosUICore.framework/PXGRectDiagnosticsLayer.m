@interface PXGRectDiagnosticsLayer
+ (NSArray)defaultRectDiagnosticsProviders;
- (NSArray)rectDiagnosticsProviders;
- (PXGLayout)layout;
- (void)setLayout:(id)a3;
- (void)setRectDiagnosticsProviders:(id)a3;
- (void)update;
@end

@implementation PXGRectDiagnosticsLayer

- (void)update
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
  v19 = self;
  v4 = [(PXGRectDiagnosticsLayer *)self superlayer];
  [v4 bounds];
  -[PXGRectDiagnosticsLayer setFrame:](self, "setFrame:");

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v5 = [(PXGRectDiagnosticsLayer *)self layout];
  if (v5)
  {
    v6 = [off_1E5DA9658 sharedInstance];
    int v7 = [v6 wantsRectDiagnosticsDebugHUD];

    if (v7)
    {
      [v5 visibleRect];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __33__PXGRectDiagnosticsLayer_update__block_invoke;
      aBlock[3] = &unk_1E5DB68A8;
      aBlock[5] = &v27;
      aBlock[4] = self;
      aBlock[6] = v8;
      aBlock[7] = v9;
      aBlock[8] = a2;
      v10 = _Block_copy(aBlock);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v11 = [(PXGRectDiagnosticsLayer *)self rectDiagnosticsProviders];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __33__PXGRectDiagnosticsLayer_update__block_invoke_2;
            v20[3] = &unk_1E5DB68D0;
            id v21 = v10;
            [v15 enumerateRectDiagnosticsForLayout:v5 usingBlock:v20];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v12);
      }
    }
  }
  v16 = [(PXGRectDiagnosticsLayer *)v19 sublayers];
  for (unint64_t j = v28[3]; j < [v16 count]; ++j)
  {
    v18 = [v16 objectAtIndexedSubscript:j];
    [v18 setHidden:1];
  }
  [MEMORY[0x1E4F39CF8] commit];

  _Block_object_dispose(&v27, 8);
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void)setRectDiagnosticsProviders:(id)a3
{
}

+ (NSArray)defaultRectDiagnosticsProviders
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PXGAnchoringRectDiagnosticsProvider);
  v9[0] = v2;
  v3 = objc_alloc_init(PXGSpritesRectDiagnosticsProvider);
  v9[1] = v3;
  v4 = objc_alloc_init(PXGAssetsRectDiagnosticsProvider);
  v9[2] = v4;
  v5 = objc_alloc_init(PXGFocusRectDiagnosticsProvider);
  v9[3] = v5;
  v6 = objc_alloc_init(PXGCurrentFocusRectDiagnosticsProvider);
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return (NSArray *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectDiagnosticsProviders, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (NSArray)rectDiagnosticsProviders
{
  return self->_rectDiagnosticsProviders;
}

void __33__PXGRectDiagnosticsLayer_update__block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  id v14 = a3;
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void *)(v15 + 24);
  *(void *)(v15 + 24) = v16 + 1;
  v17 = [*(id *)(a1 + 32) sublayers];
  unint64_t v18 = [v17 count];
  unint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  if (v18 < v19)
  {
    do
    {
      v20 = [MEMORY[0x1E4F39BE8] layer];
      [*(id *)(a1 + 32) addSublayer:v20];
      id v21 = [MEMORY[0x1E4F39CE8] layer];
      [v20 addSublayer:v21];

      long long v22 = [*(id *)(a1 + 32) sublayers];
      unint64_t v23 = [v22 count];
      unint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    while (v23 < v24);
  }
  long long v25 = [*(id *)(a1 + 32) sublayers];
  v26 = [v25 objectAtIndexedSubscript:v16];

  id v27 = [v13 colorWithAlphaComponent:0.15];
  objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

  id v28 = v13;
  objc_msgSend(v26, "setBorderColor:", objc_msgSend(v28, "CGColor"));
  [v26 setBorderWidth:5.0];
  v44.origin.x = a4;
  v44.origin.y = a5;
  v44.size.width = a6;
  v44.size.height = a7;
  CGRect v45 = CGRectOffset(v44, -*(double *)(a1 + 48), -*(double *)(a1 + 56));
  objc_msgSend(v26, "setFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
  [v26 setHidden:0];
  [*(id *)(a1 + 32) contentsScale];
  objc_msgSend(v26, "setContentsScale:");
  uint64_t v29 = [v26 sublayers];
  uint64_t v30 = [v29 firstObject];

  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v38 = *(void *)(a1 + 64);
    uint64_t v39 = *(void *)(a1 + 32);
    v40 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v40);
    v41 = objc_msgSend(v30, "px_descriptionForAssertionMessage");
    [v33 handleFailureInMethod:v38, v39, @"PXGRectDiagnosticsLayer.m", 64, @"%@ should be an instance inheriting from %@, but it is %@", @"sublayer.sublayers.firstObject", v37, v41 object file lineNumber description];
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v34 = *(void *)(a1 + 64);
    uint64_t v35 = *(void *)(a1 + 32);
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    [v33 handleFailureInMethod:v34, v35, @"PXGRectDiagnosticsLayer.m", 64, @"%@ should be an instance inheriting from %@, but it is nil", @"sublayer.sublayers.firstObject", v37 object file lineNumber description];
  }

LABEL_5:
  [v26 bounds];
  CGRect v47 = CGRectInset(v46, 10.0, 10.0);
  objc_msgSend(v30, "setFrame:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
  [v30 setString:v14];
  [v30 setFontSize:13.0];
  id v42 = v28;
  objc_msgSend(v30, "setForegroundColor:", objc_msgSend(v42, "CGColor"));
  id v31 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v30, "setShadowColor:", objc_msgSend(v31, "CGColor"));

  objc_msgSend(v30, "setShadowOffset:", 0.0, 0.0);
  [v30 setShadowRadius:5.0];
  LODWORD(v32) = 1.0;
  [v30 setShadowOpacity:v32];
  [v30 setWrapped:1];
  [*(id *)(a1 + 32) contentsScale];
  objc_msgSend(v30, "setContentsScale:");
}

uint64_t __33__PXGRectDiagnosticsLayer_update__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end