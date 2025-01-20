@interface SXTextInteractionContextProvider
- (CGRect)viewportRectForLinkInRep:(id)a3 range:(_NSRange)a4 viewport:(id)a5;
- (SXActionManager)actionManager;
- (SXTangierController)tangierController;
- (SXTextInteractionContextProvider)initWithTangierController:(id)a3 actionManager:(id)a4;
- (id)contextMenuAtLocation:(CGPoint)a3 viewport:(id)a4;
- (id)targetedPreviewAtLocation:(CGPoint)a3 viewport:(id)a4;
- (id)toolTipAtLocation:(CGPoint)a3 viewport:(id)a4;
- (void)commitPreviewViewController:(id)a3;
- (void)repAndHyperlinkAtLocation:(CGPoint)a3 viewport:(id)a4 block:(id)a5;
@end

@implementation SXTextInteractionContextProvider

- (SXTextInteractionContextProvider)initWithTangierController:(id)a3 actionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXTextInteractionContextProvider;
  v9 = [(SXTextInteractionContextProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tangierController, a3);
    objc_storeStrong((id *)&v10->_actionManager, a4);
  }

  return v10;
}

- (id)contextMenuAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__SXTextInteractionContextProvider_contextMenuAtLocation_viewport___block_invoke;
  v11[3] = &unk_264652BC0;
  v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  v13 = &v14;
  -[SXTextInteractionContextProvider repAndHyperlinkAtLocation:viewport:block:](self, "repAndHyperlinkAtLocation:viewport:block:", v8, v11, x, y);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __67__SXTextInteractionContextProvider_contextMenuAtLocation_viewport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 range];
    objc_msgSend(v7, "viewportRectForLinkInRep:range:viewport:", v25, v8, v9, *(void *)(a1 + 40));
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [*(id *)(a1 + 32) actionManager];
    id v19 = [v6 action];
    v20 = [*(id *)(a1 + 40) view];
    uint64_t v21 = objc_msgSend(v18, "contextMenuConfigurationForAction:sourceView:sourceRect:", v19, v20, v11, v13, v15, v17);
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v24 = [*(id *)(a1 + 32) tangierController];
      [v24 endSelection];
    }
  }
}

- (void)commitPreviewViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SXTextInteractionContextProvider *)self actionManager];
  [v5 commitPreviewViewController:v4];
}

- (id)targetedPreviewAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__SXTextInteractionContextProvider_targetedPreviewAtLocation_viewport___block_invoke;
  v11[3] = &unk_264652BC0;
  v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  double v13 = &v14;
  -[SXTextInteractionContextProvider repAndHyperlinkAtLocation:viewport:block:](self, "repAndHyperlinkAtLocation:viewport:block:", v8, v11, x, y);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __71__SXTextInteractionContextProvider_targetedPreviewAtLocation_viewport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  v68 = v5;
  if (v5 && v6)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v6 range];
    objc_msgSend(v8, "viewportRectForLinkInRep:range:viewport:", v5, v9, v10, *(void *)(a1 + 40));
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    id v19 = [*(id *)(a1 + 40) view];
    v20 = objc_msgSend(v19, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v12, v14, v16, v18, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));

    if (v20)
    {
      objc_msgSend(v20, "setFrame:", v12, v14, v16, v18);
      uint64_t v21 = [*(id *)(a1 + 40) view];
      [v21 addSubview:v20];

      uint64_t v22 = [MEMORY[0x263EFF980] array];
      v23 = [v5 columns];
      v24 = [v23 firstObject];

      v66 = v7;
      uint64_t v25 = [v7 range];
      v65 = v24;
      objc_msgSend(v24, "rectsForSelectionRange:selectionType:", v25, v26, 0);
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v70 != v29) {
              objc_enumerationMutation(obj);
            }
            [*(id *)(*((void *)&v69 + 1) + 8 * i) CGRectValue];
            objc_msgSend(v68, "convertNaturalRectToUnscaledCanvas:");
            double v32 = v31;
            double v34 = v33;
            double v36 = v35;
            double v38 = v37;
            v39 = [*(id *)(a1 + 32) tangierController];
            v40 = [v39 icc];
            objc_msgSend(v40, "convertUnscaledToBoundsRect:", v32, v34, v36, v38);
            double v42 = v41;
            double v44 = v43;
            double v46 = v45;
            double v48 = v47;

            v49 = [*(id *)(a1 + 32) tangierController];
            v50 = [v49 icc];
            v51 = [v50 canvasView];
            objc_msgSend(v20, "convertRect:fromView:", v51, v42, v44, v46, v48);
            double v53 = v52;
            double v55 = v54;
            double v57 = v56;
            double v59 = v58;

            v60 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v53, v55, v57, v59);
            [v22 addObject:v60];
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
        }
        while (v28);
      }
      v61 = (void *)[objc_alloc(MEMORY[0x263F1C8C0]) initWithTextLineRects:v22];
      uint64_t v62 = [objc_alloc(MEMORY[0x263F1CA80]) initWithView:v20 parameters:v61];
      uint64_t v63 = *(void *)(*(void *)(a1 + 48) + 8);
      v64 = *(void **)(v63 + 40);
      *(void *)(v63 + 40) = v62;

      id v7 = v66;
    }
  }
}

- (id)toolTipAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__0;
  double v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__SXTextInteractionContextProvider_toolTipAtLocation_viewport___block_invoke;
  v11[3] = &unk_264652BC0;
  v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  double v13 = &v14;
  -[SXTextInteractionContextProvider repAndHyperlinkAtLocation:viewport:block:](self, "repAndHyperlinkAtLocation:viewport:block:", v8, v11, x, y);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __63__SXTextInteractionContextProvider_toolTipAtLocation_viewport___block_invoke(void *a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)a1[4];
    id v7 = v5;
    uint64_t v8 = [v7 range];
    objc_msgSend(v6, "viewportRectForLinkInRep:range:viewport:", v24, v8, v9, a1[5]);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = (void *)MEMORY[0x263F1CAD0];
    id v19 = [v7 url];

    v20 = [v19 absoluteString];
    uint64_t v21 = objc_msgSend(v18, "configurationWithToolTip:inRect:", v20, v11, v13, v15, v17);
    uint64_t v22 = *(void *)(a1[6] + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }
}

- (void)repAndHyperlinkAtLocation:(CGPoint)a3 viewport:(id)a4 block:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  double v10 = (void (**)(id, void *, void))a5;
  double v11 = [(SXTextInteractionContextProvider *)self tangierController];
  double v12 = [v11 icc];
  double v13 = [v12 canvasView];
  objc_msgSend(v9, "convertPoint:toView:", v13, x, y);
  double v15 = v14;
  double v17 = v16;

  double v18 = [(SXTextInteractionContextProvider *)self tangierController];
  id v19 = [v18 icc];
  objc_msgSend(v19, "convertBoundsToUnscaledPoint:", v15, v17);
  double v21 = v20;
  double v23 = v22;

  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  double v31 = __Block_byref_object_copy__0;
  double v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  id v24 = [(SXTextInteractionContextProvider *)self tangierController];
  uint64_t v25 = [v24 icc];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __77__SXTextInteractionContextProvider_repAndHyperlinkAtLocation_viewport_block___block_invoke;
  v27[3] = &unk_264652BE8;
  *(double *)&v27[5] = v21;
  *(double *)&v27[6] = v23;
  v27[4] = &v28;
  uint64_t v26 = objc_msgSend(v25, "hitRep:withGesture:passingTest:", 0, v27, v21, v23);

  v10[2](v10, v26, v29[5]);
  _Block_object_dispose(&v28, 8);
}

BOOL __77__SXTextInteractionContextProvider_repAndHyperlinkAtLocation_viewport_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v3, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    id v4 = objc_msgSend(v3, "smartFieldAtPoint:");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4);
    }
  }
  BOOL v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;

  return v5;
}

- (CGRect)viewportRectForLinkInRep:(id)a3 range:(_NSRange)a4 viewport:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = (void *)MEMORY[0x263F7C790];
  id v10 = a5;
  id v11 = a3;
  double v12 = objc_msgSend(v9, "selectionWithRange:", location, length);
  [v11 rectForSelection:v12];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v11, "convertNaturalRectToUnscaledCanvas:", v14, v16, v18, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  uint64_t v29 = [(SXTextInteractionContextProvider *)self tangierController];
  uint64_t v30 = [v29 icc];
  objc_msgSend(v30, "convertUnscaledToBoundsRect:", v22, v24, v26, v28);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  v39 = [(SXTextInteractionContextProvider *)self tangierController];
  v40 = [v39 icc];
  double v41 = [v40 canvasView];
  objc_msgSend(v10, "convertRect:fromView:", v41, v32, v34, v36, v38);
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;

  double v50 = v43;
  double v51 = v45;
  double v52 = v47;
  double v53 = v49;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.double y = v51;
  result.origin.double x = v50;
  return result;
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
}

@end