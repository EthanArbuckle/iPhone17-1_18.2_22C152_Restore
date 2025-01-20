@interface PXStoryVisualDiagnosticsProviderHelper
- (PXMediaProvider)mediaProvider;
- (PXStoryConfiguration)configuration;
- (PXStoryDisplayAssetCroppingContext)croppingContext;
- (PXStoryVisualDiagnosticsProviderHelper)init;
- (PXStoryVisualDiagnosticsProviderHelper)initWithConfiguration:(id)a3;
- (double)contentsScale;
- (void)drawAsset:(id)a3 contentsRect:(id *)a4 inRect:(CGRect)a5 context:(id)a6;
- (void)drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5;
- (void)drawCropRectsForAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5 configuration:(id)a6;
- (void)drawSegmentOfTimeline:(id)a3 withIdentifier:(int64_t)a4 inRect:(CGRect)a5 context:(id)a6;
@end

@implementation PXStoryVisualDiagnosticsProviderHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_croppingContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXStoryDisplayAssetCroppingContext)croppingContext
{
  return self->_croppingContext;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (void)drawCropRectsForAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5 configuration:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  v15 = (void (**)(id, _PXStoryVisualDiagnosticsCropRectsConfiguration *))a6;
  v16 = objc_alloc_init(_PXStoryVisualDiagnosticsCropRectsConfiguration);
  v15[2](v15, v16);

  uint64_t v17 = [v14 CGContext];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_2;
  aBlock[3] = &unk_1E5DAE5B0;
  aBlock[5] = v17;
  id v76 = v14;
  aBlock[4] = v76;
  v18 = _Block_copy(aBlock);
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_4;
  v104[3] = &unk_1E5DAE5D8;
  *(CGFloat *)&v104[5] = x;
  *(CGFloat *)&v104[6] = y;
  *(CGFloat *)&v104[7] = width;
  *(CGFloat *)&v104[8] = height;
  id v19 = v18;
  v104[4] = v19;
  v20 = (char *)_Block_copy(v104);
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_5;
  v103[3] = &unk_1E5DAE600;
  *(CGFloat *)&v103[5] = x;
  *(CGFloat *)&v103[6] = y;
  *(CGFloat *)&v103[7] = width;
  *(CGFloat *)&v103[8] = height;
  v103[9] = v17;
  v103[4] = v19;
  v21 = _Block_copy(v103);
  if (v16)
  {
    [(_PXStoryVisualDiagnosticsCropRectsConfiguration *)v16 kenBurnsAnimationInfo];
    long long v100 = v92;
    long long v101 = v93;
    long long v102 = v94;
    [(_PXStoryVisualDiagnosticsCropRectsConfiguration *)v16 kenBurnsAnimationInfo];
  }
  else
  {
    uint64_t v99 = 0;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v92 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v88 = 0;
  }
  long long v89 = v84;
  long long v90 = v85;
  long long v91 = v86;
  v22 = [(_PXStoryVisualDiagnosticsCropRectsConfiguration *)v16 movieHighlight];
  if (v22)
  {
    [v22 bestPlaybackRect];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
  }
  else
  {
    double v24 = *MEMORY[0x1E4F1DB20];
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v30 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  [v13 preferredCropRect];
  double v35 = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(v31, v32, v33, v34);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = [MEMORY[0x1E4FB1618] redColor];
  v43 = (void (**)(id, void *, __CFString *, double, double, double, double))(v20 + 16);
  (*((void (**)(char *, void *, __CFString *, double, double, double, double))v20 + 2))(v20, v42, @"Preferred", v35, v37, v39, v41);

  [v13 acceptableCropRect];
  double v48 = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(v44, v45, v46, v47);
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  v55 = [MEMORY[0x1E4FB1618] orangeColor];
  (*((void (**)(char *, void *, __CFString *, double, double, double, double))v20 + 2))(v20, v55, @"Acceptable", v48, v50, v52, v54);

  [v13 faceAreaRect];
  double v60 = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(v56, v57, v58, v59);
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  v67 = [MEMORY[0x1E4FB1618] blueColor];
  (*((void (**)(char *, void *, __CFString *, double, double, double, double))v20 + 2))(v20, v67, @"Face Area", v60, v62, v64, v66);

  v68 = [(PXStoryVisualDiagnosticsProviderHelper *)self croppingContext];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = v75;
  v80[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_6;
  v80[3] = &unk_1E5DAE628;
  v69 = v20;
  v80[4] = v69;
  [v68 requestIndividualFaceRectsInAsset:v13 options:1 resultHandler:v80];

  v70 = [MEMORY[0x1E4FB1618] greenColor];
  (*v43)(v69, v70, @"Best Playback", v24, v26, v28, v30);

  v71 = [MEMORY[0x1E4FB1618] cyanColor];
  v72 = (void (*)(void *, long long *, void *, __CFString *, double, double))v21[2];
  long long v77 = v100;
  long long v78 = v101;
  long long v79 = v102;
  v72(v21, &v77, v71, @"Source", 0.4, 3.0);

  v73 = [MEMORY[0x1E4FB1618] magentaColor];
  v74 = (void (*)(void *, long long *, void *, __CFString *, double, double))v21[2];
  long long v77 = v89;
  long long v78 = v90;
  long long v79 = v91;
  v74(v21, &v77, v73, @"Target", 0.6, 3.0);

  [(_PXStoryVisualDiagnosticsCropRectsConfiguration *)v16 TVPreviewSize];
  PXSizeIsEmpty();
}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_2(uint64_t a1, const CGPath *a2, void *a3, void *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  id v17 = a4;
  v18 = [a3 colorWithAlphaComponent:0.8];
  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  id v19 = *(CGContext **)(a1 + 40);
  id v20 = v18;
  CGContextSetStrokeColorWithColor(v19, (CGColorRef)[v20 CGColor]);
  CGContextAddPath(*(CGContextRef *)(a1 + 40), a2);
  CGContextStrokePath(*(CGContextRef *)(a1 + 40));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
  v21 = *(void **)(a1 + 32);
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
  v28[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_3;
  v28[3] = &unk_1E5DB5E70;
  id v29 = v17;
  id v30 = v20;
  double v31 = a9;
  id v26 = v20;
  id v27 = v17;
  objc_msgSend(v21, "drawTextInRect:configuration:", v28, x, y, width, height);
}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6, void *a7)
{
  id v13 = a6;
  id v12 = a7;
  v15.origin.double x = a1;
  v15.origin.double y = a2;
  v15.size.double width = a3;
  v15.size.double height = a4;
  if (!CGRectIsEmpty(v15)) {
    PXRectDenormalize();
  }
}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  PXStoryRectIsNull();
}

CGFloat __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v9.origin.double x = a1;
    v9.origin.double y = a2;
    v9.size.double width = a3;
    v9.size.double height = a4;
    if (!CGRectIsInfinite(v9)) {
      PXRectFlippedVertically();
    }
  }
  return a1;
}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    uint64_t v5 = 0;
    id v6 = (double *)(a3 + 16);
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = [MEMORY[0x1E4FB1618] colorWithRed:0.5 green:0.6 blue:1.0 alpha:1.0];
      CGRect v9 = objc_msgSend(NSString, "stringWithFormat:", @"%li", v5);
      double v10 = *(v6 - 2);
      double v11 = *(v6 - 1);
      double v12 = *v6;
      double v13 = v6[1];
      v6 += 4;
      (*(void (**)(uint64_t, void *, void *, double, double, double, double))(v7 + 16))(v7, v8, v9, v10, v11, v12, v13);

      ++v5;
    }
    while (a2 != v5);
  }
}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setText:v3];
  [v4 setTextColor:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setRelativePosition:", *(double *)(a1 + 48), 1.0);
}

- (void)drawSegmentOfTimeline:(id)a3 withIdentifier:(int64_t)a4 inRect:(CGRect)a5 context:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  if (v8) {
    [v8 timeRangeForSegmentWithIdentifier:a4];
  }
  [v8 size];
  PXRectWithOriginAndSize();
}

void __94__PXStoryVisualDiagnosticsProviderHelper_drawSegmentOfTimeline_withIdentifier_inRect_context___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 >= 1) {
    PXRectNormalize();
  }
}

- (void)drawAsset:(id)a3 contentsRect:(id *)a4 inRect:(CGRect)a5 context:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a6;
  double v13 = (CGContext *)[v12 CGContext];
  CGContextSaveGState(v13);
  if ([v12 isPrivateDataAllowed])
  {
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGContextClipToRect(v13, v23);
    PXStoryRectDecompose();
  }
  CGContextSetLineWidth(v13, 1.0);
  id v14 = [MEMORY[0x1E4FB1618] blackColor];
  CGContextSetStrokeColorWithColor(v13, (CGColorRef)[v14 CGColor]);

  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGContextStrokeRect(v13, v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v26);
  CGContextMoveToPoint(v13, MinX, MinY);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v28);
  CGContextAddLineToPoint(v13, MaxX, MaxY);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat v19 = CGRectGetMaxX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat v20 = CGRectGetMinY(v30);
  CGContextMoveToPoint(v13, v19, v20);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat v21 = CGRectGetMinX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGFloat v22 = CGRectGetMaxY(v32);
  CGContextAddLineToPoint(v13, v21, v22);
  CGContextStrokePath(v13);
  CGContextRestoreGState(v13);
}

uint64_t __80__PXStoryVisualDiagnosticsProviderHelper_drawAsset_contentsRect_inRect_context___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24)) {
    PXSizeScale();
  }
  return result;
}

double *__80__PXStoryVisualDiagnosticsProviderHelper_drawAsset_contentsRect_inRect_context___block_invoke_2(double *result, void *a2)
{
  if (a2)
  {
    v2 = result;
    result = (double *)objc_msgSend(a2, "drawInRect:", result[5], result[6], result[7], result[8]);
    *(unsigned char *)(*(void *)(*((void *)v2 + 4) + 8) + 24) = 1;
  }
  return result;
}

- (void)drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  long long v5 = *((_OWORD *)off_1E5DAB040 + 1);
  v6[0] = *(_OWORD *)off_1E5DAB040;
  v6[1] = v5;
  v6[2] = *((_OWORD *)off_1E5DAB040 + 2);
  -[PXStoryVisualDiagnosticsProviderHelper drawAsset:contentsRect:inRect:context:](self, "drawAsset:contentsRect:inRect:context:", a3, v6, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (PXStoryVisualDiagnosticsProviderHelper)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryVisualDiagnosticsProviderHelper;
  id v6 = [(PXStoryVisualDiagnosticsProviderHelper *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_contentsScale = 2.0;
    id v8 = [PXStoryDefaultDisplayAssetCroppingContext alloc];
    id v9 = [(PXStoryConfiguration *)v7->_configuration assetCollection];
    uint64_t v10 = [(PXStoryDefaultDisplayAssetCroppingContext *)v8 initWithAssetCollection:v9 detailedSaliency:0];
    croppingContext = v7->_croppingContext;
    v7->_croppingContext = (PXStoryDisplayAssetCroppingContext *)v10;

    uint64_t v12 = [(PXStoryConfiguration *)v7->_configuration mediaProvider];
    mediaProvider = v7->_mediaProvider;
    v7->_mediaProvider = (PXMediaProvider *)v12;
  }
  return v7;
}

- (PXStoryVisualDiagnosticsProviderHelper)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryVisualDiagnosticsProviderHelper.m", 40, @"%s is not available as initializer", "-[PXStoryVisualDiagnosticsProviderHelper init]");

  abort();
}

@end