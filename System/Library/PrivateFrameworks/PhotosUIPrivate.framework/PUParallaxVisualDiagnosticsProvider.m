@interface PUParallaxVisualDiagnosticsProvider
- (PFWallpaperCompoundLayerStack)compoundLayerStack;
- (PHAsset)asset;
- (PISegmentationItem)segmentationItem;
- (void)_addCoverPage:(id)a3;
- (void)_addImagingGatingScores:(id)a3;
- (void)_addLayerStack:(id)a3;
- (void)_addLayerStackProperties:(id)a3;
- (void)_addLayersTable:(id)a3;
- (void)_addSegmentationItemProperties:(id)a3;
- (void)_drawLayer:(id)a3 inRect:(CGRect)a4 context:(id)a5;
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
- (void)setAsset:(id)a3;
- (void)setCompoundLayerStack:(id)a3;
- (void)setSegmentationItem:(id)a3;
@end

@implementation PUParallaxVisualDiagnosticsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_compoundLayerStack, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setSegmentationItem:(id)a3
{
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setCompoundLayerStack:(id)a3
{
}

- (PFWallpaperCompoundLayerStack)compoundLayerStack
{
  return self->_compoundLayerStack;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)_addSegmentationItemProperties:(id)a3
{
  id v4 = a3;
  [v4 beginPage];
  [v4 currentPageBounds];
  CGRect v22 = CGRectInset(v21, 20.0, 20.0);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"\n"];
  [v9 appendString:@"Segmentation Item Properties\n\n"];
  v10 = [(PUParallaxVisualDiagnosticsProvider *)self segmentationItem];
  [v10 classification];
  v11 = PFPosterClassificationName();
  [v9 appendFormat:@"Classification: %@\n", v11];

  [v9 appendFormat:@"Available styles:\n"];
  v12 = [(PUParallaxVisualDiagnosticsProvider *)self segmentationItem];
  v13 = [v12 availableStyles];
  v14 = PFMap();

  v15 = [v14 componentsJoinedByString:@",\n\t"];
  [v9 appendFormat:@"\t%@\n", v15];
  v16 = [(PUParallaxVisualDiagnosticsProvider *)self segmentationItem];
  [v16 settlingEffectStatus];
  v17 = PIPosterSettlingEffectStatusDescription();
  [v9 appendFormat:@"Settling Effect Status: %@", v17];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__PUParallaxVisualDiagnosticsProvider__addSegmentationItemProperties___block_invoke_2;
  v19[3] = &unk_1E5F2E348;
  id v20 = v9;
  id v18 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v19, x, y, width, height);
  [v4 endPage];
}

void __70__PUParallaxVisualDiagnosticsProvider__addSegmentationItemProperties___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:15.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

uint64_t __70__PUParallaxVisualDiagnosticsProvider__addSegmentationItemProperties___block_invoke(uint64_t a1, void *a2)
{
  return [a2 kind];
}

- (void)_addImagingGatingScores:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 beginPage];
  [v4 currentPageBounds];
  CGRect v32 = CGRectInset(v31, 20.0, 20.0);
  double x = v32.origin.x;
  double y = v32.origin.y;
  double width = v32.size.width;
  double height = v32.size.height;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"\n"];
  [v9 appendString:@"Imaging Gating scores\n\n"];
  v10 = [(PUParallaxVisualDiagnosticsProvider *)self segmentationItem];

  if (v10)
  {
    v11 = [(PUParallaxVisualDiagnosticsProvider *)self segmentationItem];
    v12 = [v11 scores];

    if ([MEMORY[0x1E4F8A378] curatedSegmentationGatingDecisionForSegmentationScores:v12]) {
      v13 = @"Pass";
    }
    else {
      v13 = @"Fail";
    }
    [v9 appendFormat:@"Curated Segmentation gating: %@\n", v13];
    if ([MEMORY[0x1E4F8A378] manualSegmentationGatingDecisionForSegmentationScores:v12]) {
      v14 = @"Pass";
    }
    else {
      v14 = @"Fail";
    }
    [v9 appendFormat:@"Manual Segmentation gating: %@\n", v14];
    if ([MEMORY[0x1E4F8A378] layoutGatingDecisionForSegmentationScores:v12]) {
      v15 = @"Pass";
    }
    else {
      v15 = @"Fail";
    }
    [v9 appendFormat:@"Layout gating: %@\n", v15];
    [v9 appendFormat:@"Scores: %@\n", v12];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v16 = [(PUParallaxVisualDiagnosticsProvider *)self segmentationItem];
    v17 = [v16 settlingEffectGatingDiagnostics];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          [v9 appendFormat:@"%@\n", *(void *)(*((void *)&v25 + 1) + 8 * v21++)];
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }
  }
  else
  {
    [v9 appendFormat:@"Segmentation item not available\n"];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__PUParallaxVisualDiagnosticsProvider__addImagingGatingScores___block_invoke;
  v23[3] = &unk_1E5F2E348;
  id v24 = v9;
  id v22 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v23, x, y, width, height);
  [v4 endPage];
}

void __63__PUParallaxVisualDiagnosticsProvider__addImagingGatingScores___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:15.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

- (void)_addLayerStackProperties:(id)a3
{
  id v4 = a3;
  [v4 beginPage];
  [v4 currentPageBounds];
  CGRect v26 = CGRectInset(v25, 20.0, 20.0);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"\n"];
  [v9 appendString:@"LayerStack Properties\n\n"];
  v10 = [(PUParallaxVisualDiagnosticsProvider *)self compoundLayerStack];
  v11 = [v10 portraitLayerStack];
  [v11 size];
  v12 = NSStringFromCGSize(v24);
  [v9 appendFormat:@"CanvasSize: %@\n\n", v12];

  v13 = [(PUParallaxVisualDiagnosticsProvider *)self compoundLayerStack];
  v14 = [v13 portraitLayerStack];
  v15 = [v14 layout];
  v16 = [v15 debugDescription];
  [v9 appendFormat:@"Portrait Layout: %@\n", v16];

  [v9 appendString:@"\n\n\n"];
  v17 = [(PUParallaxVisualDiagnosticsProvider *)self compoundLayerStack];
  uint64_t v18 = [v17 landscapeLayerStack];
  uint64_t v19 = [v18 layout];
  uint64_t v20 = [v19 debugDescription];
  [v9 appendFormat:@"Landscape Layout: %@\n", v20];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__PUParallaxVisualDiagnosticsProvider__addLayerStackProperties___block_invoke;
  v22[3] = &unk_1E5F2E348;
  id v23 = v9;
  id v21 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v22, x, y, width, height);
  [v4 endPage];
}

void __64__PUParallaxVisualDiagnosticsProvider__addLayerStackProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:15.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

- (void)_addLayersTable:(id)a3
{
  id v4 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_2;
  v13[3] = &unk_1E5F27480;
  v14 = @"Layer";
  v15 = @"Id";
  v16 = @"Size";
  v17 = @"Frame";
  uint64_t v18 = @"zPosition";
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_8;
  v6[3] = &unk_1E5F27540;
  v6[4] = self;
  v7 = @"Layer";
  id v8 = v4;
  id v9 = @"Id";
  v10 = @"Size";
  v11 = @"Frame";
  v12 = @"zPosition";
  id v5 = v4;
  [v5 addPagesForTableWithConfiguration:&__block_literal_global_375 columnsConfiguration:v13 rowsConfiguration:v6];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 addColumnWithIdentifier:v3 configuration:&__block_literal_global_381];
  [v4 addColumnWithIdentifier:a1[5] configuration:&__block_literal_global_383];
  [v4 addColumnWithIdentifier:a1[6] configuration:&__block_literal_global_385_42333];
  [v4 addColumnWithIdentifier:a1[7] configuration:&__block_literal_global_387];
  [v4 addColumnWithIdentifier:a1[8] configuration:&__block_literal_global_389];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_8(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] compoundLayerStack];
  id v5 = [v4 portraitLayerStack];
  v6 = [v5 layers];
  v7 = (void *)[v6 mutableCopy];

  id v8 = [a1[4] compoundLayerStack];
  id v9 = [v8 landscapeLayerStack];

  if (v9)
  {
    v10 = [a1[4] compoundLayerStack];
    v11 = [v10 landscapeLayerStack];
    v12 = [v11 layers];
    [v7 addObjectsFromArray:v12];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_9;
  v16[3] = &unk_1E5F27518;
  id v17 = v3;
  id v13 = a1[5];
  id v14 = a1[4];
  id v18 = v13;
  id v19 = v14;
  id v20 = a1[6];
  id v21 = a1[7];
  id v22 = a1[8];
  id v23 = a1[9];
  id v24 = a1[10];
  id v15 = v3;
  [v7 enumerateObjectsUsingBlock:v16];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Layers Stack"];
  [v2 setDefaultRowHeight:30.0];
  [v2 setDefaultRowFontSize:7.0];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_10;
  v11[3] = &unk_1E5F274F0;
  v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(a1 + 56);
  id v12 = v7;
  uint64_t v13 = v8;
  uint64_t v20 = a3;
  id v14 = v5;
  id v15 = v9;
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  id v10 = v5;
  [v6 addRowWithConfiguration:v11];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setHeight:70.0];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_11;
  id v22 = &unk_1E5F274C8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  uint64_t v26 = *(void *)(a1 + 96);
  uint64_t v23 = v4;
  id v24 = v6;
  id v25 = *(id *)(a1 + 56);
  [v3 addCellForColumnWithIdentifier:v5 rendering:&v19];
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = [*(id *)(a1 + 48) identifier];
  [v3 addCellForColumnWithIdentifier:v7 text:v8];

  [*(id *)(a1 + 48) pixelSize];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%0.0fx%0.0f", v9, v10);
  [v3 addCellForColumnWithIdentifier:*(void *)(a1 + 72) text:v11];
  [*(id *)(a1 + 48) frame];
  id v16 = [NSString stringWithFormat:@"{x:%.3f, y:%.3f, width:%.3f, height:%.3f}", v12, v13, v14, v15, v19, v20, v21, v22, v23];
  [v3 addCellForColumnWithIdentifier:*(void *)(a1 + 80) text:v16];
  uint64_t v17 = *(void *)(a1 + 88);
  [*(id *)(a1 + 48) zPosition];
  objc_msgSend(v3, "addCellForColumnWithIdentifier:format:", v17, @"%.1f", v18);
}

uint64_t __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_11(uint64_t a1, void *a2, double a3)
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_12;
  v14[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  v14[4] = *(void *)(a1 + 56);
  [a2 drawTextInRect:v14 configuration:a3];
  uint64_t v4 = [*(id *)(a1 + 32) asset];
  [v4 aspectRatio];
  PXRectWithAspectRatioFittingRect();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  return objc_msgSend(*(id *)(a1 + 32), "_drawLayer:inRect:context:", *(void *)(a1 + 40), *(void *)(a1 + 48), v6 + 25.0, v8, v10, v12);
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v5 = a2;
  uint64_t v4 = objc_msgSend([v3 alloc], "initWithFormat:", @"#%li", *(void *)(a1 + 32));
  [v5 setText:v4];

  [v5 setFontSize:7.0];
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"zPosition"];
  [v2 setWidth:70.0];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Frame"];
  [v2 setWidth:120.0];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Size"];
  [v2 setWidth:70.0];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Id"];
  [v2 setWidth:70.0];
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Layer"];
  [v2 setWidth:120.0];
}

- (void)_drawLayer:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  double v12 = (CGContext *)[v11 CGContext];
  CGContextSaveGState(v12);
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  CGContextClipToRect(v12, v40);
  id v13 = [MEMORY[0x1E4FB1618] lightGrayColor];
  CGContextSetFillColorWithColor(v12, (CGColorRef)[v13 CGColor]);

  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  CGContextFillRect(v12, v41);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v10;
    id v15 = objc_alloc(MEMORY[0x1E4F1E050]);
    uint64_t v16 = [v14 image];
    uint64_t v31 = *MEMORY[0x1E4F1E3A0];
    uint64_t v32 = MEMORY[0x1E4F1CC28];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v18 = (void *)[v15 initWithCVPixelBuffer:v16 options:v17];

    [v18 extent];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    long long v27 = [MEMORY[0x1E4F1E018] context];
    long long v28 = (CGImage *)objc_msgSend(v27, "createCGImage:fromRect:", v18, v20, v22, v24, v26);

    if ((v24 == 0.0 || v26 == 0.0 || v24 == *MEMORY[0x1E4F8A250] && v26 == *(double *)(MEMORY[0x1E4F8A250] + 8))
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      double v34 = v24;
      __int16 v35 = 2048;
      double v36 = v26;
      __int16 v37 = 2048;
      uint64_t v38 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1AE9F8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
    PFSizeWithAspectRatioFittingSize();
    v42.size.double width = v29;
    v42.size.double height = v30;
    v42.origin.double x = x + width * 0.5 + v29 * -0.5;
    v42.origin.double y = y + height * 0.5 + v30 * -0.5;
    CGContextDrawImage(v12, v42, v28);
    CGImageRelease(v28);
  }
  else
  {
    objc_msgSend(v11, "drawTextInRect:configuration:", &__block_literal_global_42341, x, y, width, height);
  }
  CGContextRestoreGState(v12);
}

void __65__PUParallaxVisualDiagnosticsProvider__drawLayer_inRect_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setText:@"Settling Effect Video"];
  [v2 setFontSize:15.0];
  id v3 = [MEMORY[0x1E4FB1618] blackColor];
  [v2 setTextColor:v3];
}

- (void)_addLayerStack:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUParallaxVisualDiagnosticsProvider *)self compoundLayerStack];
  double v6 = [v5 portraitLayerStack];
  double v7 = [v6 layers];
  double v8 = (void *)[v7 mutableCopy];

  double v9 = [(PUParallaxVisualDiagnosticsProvider *)self compoundLayerStack];
  id v10 = [v9 landscapeLayerStack];

  if (v10)
  {
    id v11 = [(PUParallaxVisualDiagnosticsProvider *)self compoundLayerStack];
    double v12 = [v11 landscapeLayerStack];
    id v13 = [v12 layers];
    [v8 addObjectsFromArray:v13];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * v17);
        [v4 beginPage];
        memset(&slice, 0, sizeof(slice));
        [v4 currentPageBounds];
        CGRect slice = CGRectInset(v47, 10.0, 10.0);
        memset(&remainder, 0, sizeof(remainder));
        memset(&v38, 0, sizeof(v38));
        CGRectDivide(slice, &slice, &remainder, 260.0, CGRectMaxYEdge);
        CGRectDivide(slice, &v38, &slice, 250.0, CGRectMaxYEdge);
        double v19 = [(PUParallaxVisualDiagnosticsProvider *)self asset];
        [v19 aspectRatio];
        PXRectWithAspectRatioFittingRect();
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;

        -[PUParallaxVisualDiagnosticsProvider _drawLayer:inRect:context:](self, "_drawLayer:inRect:context:", v18, v4, v21, v23, v25, v27);
        id v28 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        [v28 appendString:@"\n"];
        double v29 = [v18 debugDescription];
        [v28 appendFormat:@"%@\n", v29];

        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __54__PUParallaxVisualDiagnosticsProvider__addLayerStack___block_invoke;
        v36[3] = &unk_1E5F2E348;
        id v37 = v28;
        double x = v38.origin.x;
        double y = v38.origin.y;
        double width = v38.size.width;
        double height = v38.size.height;
        id v34 = v28;
        objc_msgSend(v4, "drawTextInRect:configuration:", v36, x, y, width, height);
        [v4 endPage];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v15);
  }
}

void __54__PUParallaxVisualDiagnosticsProvider__addLayerStack___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:10.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

- (void)_addCoverPage:(id)a3
{
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  double v7 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  [(PUParallaxVisualDiagnosticsProvider *)self _addCoverPage:v6];
  [(PUParallaxVisualDiagnosticsProvider *)self _addLayersTable:v6];
  [(PUParallaxVisualDiagnosticsProvider *)self _addLayerStack:v6];
  [(PUParallaxVisualDiagnosticsProvider *)self _addLayerStackProperties:v6];
  [(PUParallaxVisualDiagnosticsProvider *)self _addImagingGatingScores:v6];
  [(PUParallaxVisualDiagnosticsProvider *)self _addSegmentationItemProperties:v6];

  v7[2](v7, 1, 0);
}

@end