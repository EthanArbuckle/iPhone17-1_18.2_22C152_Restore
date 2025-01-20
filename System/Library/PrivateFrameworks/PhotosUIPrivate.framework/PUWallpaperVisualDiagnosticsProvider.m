@interface PUWallpaperVisualDiagnosticsProvider
+ (id)visualDiagnosticsActionForSuggestion:(id)a3 asset:(id)a4 fromViewController:(id)a5;
+ (id)visualDiagnosticsConfigurationForSuggestion:(id)a3 asset:(id)a4;
- (PHAsset)asset;
- (PHSuggestion)suggestion;
- (PUWallpaperVisualDiagnosticsProvider)initWithSuggestion:(id)a3 asset:(id)a4;
- (PXMediaProvider)mediaProvider;
- (void)_addAssetDiagnostics:(id)a3;
- (void)_addCoverPage:(id)a3;
- (void)_addCropDiagnostics:(id)a3;
- (void)_addSuggestionDiagnostics:(id)a3;
- (void)_drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5;
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
@end

@implementation PUWallpaperVisualDiagnosticsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(PUWallpaperVisualDiagnosticsProvider *)self suggestion];
  v7 = [(PUWallpaperVisualDiagnosticsProvider *)self asset];
  v8 = [v5 visualDiagnosticsConfigurationForSuggestion:v6 asset:v7];

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v10 = (void *)MEMORY[0x1E4F908E0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__PUWallpaperVisualDiagnosticsProvider_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  v14[3] = &unk_1E5F2E390;
  id v15 = v4;
  dispatch_semaphore_t v16 = v9;
  v11 = v9;
  id v12 = v4;
  [v10 requestVisualDiagnosticsPDFDocumentURLWithConfiguration:v8 resultHandler:v14];
  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v11, v13);
}

intptr_t __82__PUWallpaperVisualDiagnosticsProvider_collectTapToRadarDiagnosticsIntoContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addAttachment:a2];
  v3 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v3);
}

- (void)_drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v11 = [(PUWallpaperVisualDiagnosticsProvider *)self mediaProvider];
  id v12 = objc_alloc_init(MEMORY[0x1E4F91260]);
  [v12 setDeliveryMode:1];
  [v12 setSynchronous:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PUWallpaperVisualDiagnosticsProvider__drawAsset_inRect_context___block_invoke;
  v13[3] = &__block_descriptor_64_e34_v24__0__UIImage_8__NSDictionary_16l;
  *(CGFloat *)&v13[4] = x;
  *(CGFloat *)&v13[5] = y;
  *(double *)&v13[6] = width;
  *(double *)&v13[7] = height;
  objc_msgSend(v11, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v12, v13, width, height);
}

uint64_t __66__PUWallpaperVisualDiagnosticsProvider__drawAsset_inRect_context___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "drawInRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_addSuggestionDiagnostics:(id)a3
{
  id v4 = a3;
  v5 = [(PUWallpaperVisualDiagnosticsProvider *)self suggestion];

  if (v5)
  {
    [v4 addTitlePageWithTitle:@"Suggestion Details" subtitle:&stru_1F06BE7B8];
    [v4 beginPage];
    [v4 currentPageBounds];
    CGRect v17 = CGRectInset(v16, 20.0, 20.0);
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v10 appendString:@"\n"];
    v11 = [(PUWallpaperVisualDiagnosticsProvider *)self suggestion];
    id v12 = [v11 debugDescription];
    [v10 appendFormat:@"%@\n", v12];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__PUWallpaperVisualDiagnosticsProvider__addSuggestionDiagnostics___block_invoke;
    v14[3] = &unk_1E5F2E348;
    id v15 = v10;
    id v13 = v10;
    objc_msgSend(v4, "drawTextInRect:configuration:", v14, x, y, width, height);
    [v4 endPage];
  }
}

void __66__PUWallpaperVisualDiagnosticsProvider__addSuggestionDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:10.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

- (void)_addAssetDiagnostics:(id)a3
{
  id v4 = a3;
  [v4 addTitlePageWithTitle:@"Asset Details" subtitle:&stru_1F06BE7B8];
  [v4 beginPage];
  v5 = [(PUWallpaperVisualDiagnosticsProvider *)self asset];
  [v4 currentPageBounds];
  CGRect v22 = CGRectInset(v21, 20.0, 20.0);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v10 appendString:@"\n"];
  v11 = [v5 uuid];
  [v10 appendFormat:@"UUID: %@\n", v11];

  id v12 = [v5 localCreationDate];
  [v10 appendFormat:@"Date: %@\n", v12];

  [v5 curationScore];
  objc_msgSend(v10, "appendFormat:", @"Curation Score: %0.2f\n", v13);
  v14 = [v5 mediaAnalysisProperties];
  [v14 wallpaperScore];
  objc_msgSend(v10, "appendFormat:", @"Wallpaper Score: %0.2f\n", v15);

  CGRect v16 = [v5 sceneClassifications];
  CGRect v17 = PXStorySceneClassificationDescription();
  [v10 appendFormat:@"Scenes: %@\n", v17];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__PUWallpaperVisualDiagnosticsProvider__addAssetDiagnostics___block_invoke;
  v19[3] = &unk_1E5F2E348;
  id v20 = v10;
  id v18 = v10;
  objc_msgSend(v4, "drawTextInRect:configuration:", v19, x, y, width, height);
  [v4 endPage];
}

void __61__PUWallpaperVisualDiagnosticsProvider__addAssetDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:10.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

- (void)_addCropDiagnostics:(id)a3
{
  id v4 = a3;
  [v4 addTitlePageWithTitle:@"Wallpaper Crop" subtitle:&stru_1F06BE7B8];
  uint64_t v5 = [v4 CGContext];
  v6 = [(PUWallpaperVisualDiagnosticsProvider *)self asset];
  [v6 preferredCropRect];
  double v106 = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(v7, v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v6 acceptableCropRect];
  double v21 = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(v17, v18, v19, v20);
  double v109 = v22;
  double v110 = v21;
  double v107 = v24;
  double v108 = v23;
  [v6 faceAreaRect];
  double v29 = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(v25, v26, v27, v28);
  double v115 = v30;
  double v117 = v29;
  double v111 = v32;
  double v113 = v31;
  [v4 beginPage];
  [v4 currentPageBounds];
  CGRect slice = CGRectInset(v138, 10.0, 10.0);
  memset(&remainder, 0, sizeof(remainder));
  memset(&v135, 0, sizeof(v135));
  CGRectDivide(slice, &slice, &remainder, 260.0, CGRectMaxYEdge);
  CGRectDivide(slice, &v135, &slice, 250.0, CGRectMaxYEdge);
  [v6 aspectRatio];
  PXRectWithAspectRatioFittingRect();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  -[PUWallpaperVisualDiagnosticsProvider _drawAsset:inRect:context:](self, "_drawAsset:inRect:context:", v6, v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_2;
  aBlock[3] = &unk_1E5F2E2F8;
  uint64_t v134 = v5;
  id v41 = v4;
  id v133 = v41;
  v42 = _Block_copy(aBlock);
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_4;
  v126[3] = &unk_1E5F2E320;
  uint64_t v128 = v34;
  uint64_t v129 = v36;
  uint64_t v130 = v38;
  uint64_t v131 = v40;
  id v119 = v42;
  id v127 = v119;
  v43 = (void (**)(void *, void *, __CFString *, double, double, double, double))_Block_copy(v126);
  v44 = [MEMORY[0x1E4FB1618] redColor];
  v43[2](v43, v44, @"Preferred", v106, v12, v14, v16);

  v45 = [MEMORY[0x1E4FB1618] orangeColor];
  v43[2](v43, v45, @"Acceptable", v110, v109, v108, v107);

  v46 = [MEMORY[0x1E4FB1618] blueColor];
  v43[2](v43, v46, @"Face Area", v117, v115, v113, v111);

  PFDeviceScreenSize();
  double v48 = v47;
  double v50 = v49;
  [v6 pixelWidth];
  [v6 pixelHeight];
  uint64_t v125 = 0;
  PFDeviceLockScreenFocusAreaRectNormalized();
  objc_msgSend(v6, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v125, v48, v50, v51, v52, v53, v54);
  PXRectNormalize();
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  objc_msgSend(NSString, "stringWithFormat:", @"Wallpaper w/ FocusRegion %.3f", v125);
  v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v64 = [MEMORY[0x1E4FB1618] systemYellowColor];
  v43[2](v43, v64, v63, v56, v58, v60, v62);

  uint64_t v124 = 0;
  double v116 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v118 = *MEMORY[0x1E4F1DB20];
  double v112 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v114 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  [v6 suggestedCropForTargetSize:&v124 withFocusRegion:v48 andOutputCropScore:v50];
  PXRectNormalize();
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  objc_msgSend(NSString, "stringWithFormat:", @"Wallpaper %.3f", v124);
  v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v74 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v43[2](v43, v74, v73, v66, v68, v70, v72);

  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
  {
    uint64_t v123 = 0;
    PFDeviceLockScreenFocusAreaRectNormalized();
    objc_msgSend(v6, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v123, v50, v48, v75, v76, v77, v78);
    PXRectNormalize();
    double v80 = v79;
    double v82 = v81;
    double v84 = v83;
    double v86 = v85;
    objc_msgSend(NSString, "stringWithFormat:", @"Alternative Wallpaper w/ FocusRegion %.3f", v123);
    v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v88 = [MEMORY[0x1E4FB1618] systemYellowColor];
    v43[2](v43, v88, v87, v80, v82, v84, v86);

    uint64_t v122 = 0;
    objc_msgSend(v6, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v122, v50, v48, v118, v116, v114, v112);
    PXRectNormalize();
    double v90 = v89;
    double v92 = v91;
    double v94 = v93;
    double v96 = v95;
    objc_msgSend(NSString, "stringWithFormat:", @"Alternative Wallpaper %.3f", v124);
    v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v98 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v43[2](v43, v98, v97, v90, v92, v94, v96);
  }
  [v41 endPage];
  [v41 beginPage];
  id v99 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v100 = [v6 wallpaperCroppingDebugKeyValuePairs];
  [v99 appendFormat:@"%@\n", v100];

  [v41 currentPageBounds];
  CGRect v140 = CGRectInset(v139, 20.0, 20.0);
  double x = v140.origin.x;
  double y = v140.origin.y;
  double width = v140.size.width;
  double height = v140.size.height;
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_5;
  v120[3] = &unk_1E5F2E348;
  id v121 = v99;
  id v105 = v99;
  objc_msgSend(v41, "drawTextInRect:configuration:", v120, x, y, width, height);
  [v41 endPage];
}

double __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v7 = a1;
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v10.origin.double x = v7;
    v10.origin.double y = a2;
    v10.size.double width = a3;
    v10.size.double height = a4;
    if (!CGRectIsInfinite(v10))
    {
      PXRectFlippedVertically();
      return v8;
    }
  }
  return v7;
}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_2(uint64_t a1, const CGPath *a2, void *a3, void *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  id v17 = a4;
  CGFloat v18 = [a3 colorWithAlphaComponent:0.8];
  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  CGFloat v19 = *(CGContext **)(a1 + 40);
  id v20 = v18;
  CGContextSetStrokeColorWithColor(v19, (CGColorRef)[v20 CGColor]);
  CGContextAddPath(*(CGContextRef *)(a1 + 40), a2);
  CGContextStrokePath(*(CGContextRef *)(a1 + 40));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
  double v21 = *(void **)(a1 + 32);
  v32.origin.double x = a5;
  v32.origin.double y = a6;
  v32.size.double width = a7;
  v32.size.double height = a8;
  CGRect v33 = CGRectInset(v32, 3.0, 3.0);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_3;
  v28[3] = &unk_1E5F2E2D0;
  id v29 = v17;
  id v30 = v20;
  double v31 = a9;
  id v26 = v20;
  id v27 = v17;
  objc_msgSend(v21, "drawTextInRect:configuration:", v28, x, y, width, height);
}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_4(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v19 = a2;
  id v13 = a3;
  v21.origin.double x = a4;
  v21.origin.double y = a5;
  v21.size.double width = a6;
  v21.size.double height = a7;
  if (!CGRectIsEmpty(v21))
  {
    PXRectDenormalize();
    double x = v22.origin.x;
    double y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
    CGFloat v18 = CGPathCreateWithRect(v22, 0);
    (*(void (**)(double, double, double, double, double))(*(void *)(a1 + 32) + 16))(x, y, width, height, 0.0);
    CGPathRelease(v18);
  }
}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:10.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setText:v3];
  [v4 setTextColor:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setRelativePosition:", *(double *)(a1 + 48), 1.0);
}

- (void)_addCoverPage:(id)a3
{
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  double v7 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  [(PUWallpaperVisualDiagnosticsProvider *)self _addCoverPage:v6];
  [(PUWallpaperVisualDiagnosticsProvider *)self _addCropDiagnostics:v6];
  [(PUWallpaperVisualDiagnosticsProvider *)self _addSuggestionDiagnostics:v6];
  [(PUWallpaperVisualDiagnosticsProvider *)self _addAssetDiagnostics:v6];

  v7[2](v7, 1, 0);
}

- (PUWallpaperVisualDiagnosticsProvider)initWithSuggestion:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUWallpaperVisualDiagnosticsProvider;
  CGFloat v9 = [(PUWallpaperVisualDiagnosticsProvider *)&v16 init];
  CGRect v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F904E0]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F390D0]);
    uint64_t v13 = [v11 initWithImageManager:v12];
    mediaProvider = v10->_mediaProvider;
    v10->_mediaProvider = (PXMediaProvider *)v13;
  }
  return v10;
}

+ (id)visualDiagnosticsActionForSuggestion:(id)a3 asset:(id)a4 fromViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4FB13F0];
  id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__PUWallpaperVisualDiagnosticsProvider_visualDiagnosticsActionForSuggestion_asset_fromViewController___block_invoke;
  v18[3] = &unk_1E5F2E2A8;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v22 = a1;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  objc_super v16 = [v11 actionWithTitle:@"Visual Diagnostics" image:v12 identifier:0 handler:v18];

  return v16;
}

void __102__PUWallpaperVisualDiagnosticsProvider_visualDiagnosticsActionForSuggestion_asset_fromViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 56) visualDiagnosticsConfigurationForSuggestion:*(void *)(a1 + 32) asset:*(void *)(a1 + 40)];
  [MEMORY[0x1E4F908E0] showVisualDiagnosticsWithConfiguration:v2 fromViewController:*(void *)(a1 + 48) completionHandler:&__block_literal_global_101001];
}

+ (id)visualDiagnosticsConfigurationForSuggestion:(id)a3 asset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PUWallpaperVisualDiagnosticsProvider alloc] initWithSuggestion:v6 asset:v5];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F91300]) initWithRootProvider:v7];
  [v8 setName:@"VisualDiagnostics"];
  [v8 setIsPrivateDataAllowed:1];

  return v8;
}

@end