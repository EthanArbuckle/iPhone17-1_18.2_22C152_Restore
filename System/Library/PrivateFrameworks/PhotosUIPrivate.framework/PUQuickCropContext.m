@interface PUQuickCropContext
- (BOOL)lockAspectRatio;
- (CGImage)_croppedCGImageForTransition:(CGImage *)a3;
- (CGRect)_normalizedCropRectForTransition;
- (CGRect)cropRectRelativeToRenderedImage;
- (CGSize)aspectRatio;
- (CGSize)renderedImageSize;
- (CGSize)selectedAspectRatio;
- (PUQuickCropContext)initWithTileTransform:(id)a3 renderedImageSize:(CGSize)a4 boundingSize:(CGSize)a5 selectedAspectRatio:(CGSize)a6;
- (id)_croppedSnapshotViewForTransition:(id)a3;
- (id)applyCropToAssetTransitionInfo:(id)a3;
- (void)applyCropRectToCompositionController:(id)a3;
- (void)setAspectRatio:(CGSize)a3;
- (void)setCropRectRelativeToRenderedImage:(CGRect)a3;
- (void)setLockAspectRatio:(BOOL)a3;
- (void)setRenderedImageSize:(CGSize)a3;
- (void)setSelectedAspectRatio:(CGSize)a3;
@end

@implementation PUQuickCropContext

- (void)setLockAspectRatio:(BOOL)a3
{
  self->_lockAspectRatio = a3;
}

- (BOOL)lockAspectRatio
{
  return self->_lockAspectRatio;
}

- (void)setAspectRatio:(CGSize)a3
{
  self->_aspectRatio = a3;
}

- (CGSize)aspectRatio
{
  double width = self->_aspectRatio.width;
  double height = self->_aspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRenderedImageSize:(CGSize)a3
{
  self->_renderedImageSize = a3;
}

- (CGSize)renderedImageSize
{
  double width = self->_renderedImageSize.width;
  double height = self->_renderedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCropRectRelativeToRenderedImage:(CGRect)a3
{
  self->_cropRectRelativeToRenderedImage = a3;
}

- (CGRect)cropRectRelativeToRenderedImage
{
  double x = self->_cropRectRelativeToRenderedImage.origin.x;
  double y = self->_cropRectRelativeToRenderedImage.origin.y;
  double width = self->_cropRectRelativeToRenderedImage.size.width;
  double height = self->_cropRectRelativeToRenderedImage.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSelectedAspectRatio:(CGSize)a3
{
  self->_selectedAspectRatio = a3;
}

- (CGSize)selectedAspectRatio
{
  double width = self->_selectedAspectRatio.width;
  double height = self->_selectedAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_croppedSnapshotViewForTransition:(id)a3
{
  id v4 = a3;
  [(PUQuickCropContext *)self _normalizedCropRectForTransition];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 bounds];
  v17 = objc_msgSend(v4, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v13 + v6 * v14, v15 + v8 * v16, v10 * v14, v12 * v16, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return v17;
}

- (CGImage)_croppedCGImageForTransition:(CGImage *)a3
{
  [(PUQuickCropContext *)self _normalizedCropRectForTransition];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double Width = (double)CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  double v14 = v5 * Width + 0.0;
  double v15 = v7 * (double)Height + 0.0;
  double v16 = v11 * (double)Height;
  ColorSpace = CGImageGetColorSpace(a3);
  if (CGColorSpaceUsesITUR_2100TF(ColorSpace))
  {
    v18 = [MEMORY[0x1E4F1E050] imageWithCGImage:a3];
    [v18 extent];
    double v21 = v19 + v20 - (v15 + v16);
    v22 = [MEMORY[0x1E4F1E018] context];
    v23 = (CGImage *)objc_msgSend(v22, "createCGImage:fromRect:format:colorSpace:deferred:", v18, *MEMORY[0x1E4F1E2D8], ColorSpace, 1, v14, v21, v9 * Width, v16);

    return v23;
  }
  else
  {
    double v25 = v14;
    double v26 = v15;
    double v28 = v16;
    double v27 = v9 * Width;
    return CGImageCreateWithImageInRect(a3, *(CGRect *)&v25);
  }
}

- (CGRect)_normalizedCropRectForTransition
{
  [(PUQuickCropContext *)self cropRectRelativeToRenderedImage];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PUQuickCropContext *)self renderedImageSize];
  double v12 = v11;
  [(PUQuickCropContext *)self renderedImageSize];
  CGFloat v13 = v4 / v12;
  CGFloat v15 = v6 / v14;
  CGFloat v16 = v8 / v12;
  CGFloat v17 = v10 / v14;
  v25.origin.double x = v13;
  v25.origin.double y = v15;
  v25.size.double width = v16;
  v25.size.double height = v17;
  CGFloat MinX = CGRectGetMinX(v25);
  v26.origin.double x = v13;
  v26.origin.double y = v15;
  v26.size.double width = v16;
  v26.size.double height = v17;
  double v19 = 1.0 - CGRectGetMaxY(v26);
  v27.origin.double x = v13;
  v27.origin.double y = v15;
  v27.size.double width = v16;
  v27.size.double height = v17;
  CGFloat Width = CGRectGetWidth(v27);
  v28.origin.double x = v13;
  v28.origin.double y = v15;
  v28.size.double width = v16;
  v28.size.double height = v17;
  double Height = CGRectGetHeight(v28);
  double v22 = MinX;
  double v23 = v19;
  double v24 = Width;
  result.size.double height = Height;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)applyCropRectToCompositionController:(id)a3
{
  id v4 = a3;
  [(PUQuickCropContext *)self cropRectRelativeToRenderedImage];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  if (!CGRectIsNull(v31))
  {
    double v9 = [v4 orientationAdjustmentController];
    [v9 orientation];

    NUOrientationInverse();
    if (NUOrientationIsValid())
    {
      [(PUQuickCropContext *)self renderedImageSize];
      NUPixelSizeFromCGSize();
      NUOrientationTransformRect();
      CGFloat x = v10;
      CGFloat y = v11;
      CGFloat width = v12;
      CGFloat height = v13;
    }
    double v14 = [v4 cropAdjustmentController];
    [v14 cropRect];
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRect v33 = CGRectOffset(v32, v16, v18);
    CGFloat v19 = v33.origin.x;
    CGFloat v20 = v33.origin.y;
    CGFloat v21 = v33.size.width;
    CGFloat v22 = v33.size.height;
    [(PUQuickCropContext *)self aspectRatio];
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    BOOL v27 = [(PUQuickCropContext *)self lockAspectRatio];
    uint64_t v28 = *MEMORY[0x1E4F8A418];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __59__PUQuickCropContext_applyCropRectToCompositionController___block_invoke;
    v29[3] = &__block_descriptor_81_e36_v16__0__PICropAdjustmentController_8l;
    *(CGFloat *)&v29[4] = v19;
    *(CGFloat *)&v29[5] = v20;
    *(CGFloat *)&v29[6] = v21;
    *(CGFloat *)&v29[7] = v22;
    BOOL v30 = v27;
    v29[8] = v24;
    v29[9] = v26;
    [v4 modifyAdjustmentWithKey:v28 modificationBlock:v29];
  }
}

void __59__PUQuickCropContext_applyCropRectToCompositionController___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(v4, "setCropRect:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (*(unsigned char *)(a1 + 80))
  {
    [v4 setConstraintWidth:(uint64_t)*(double *)(a1 + 64)];
    uint64_t v3 = (uint64_t)*(double *)(a1 + 72);
  }
  else
  {
    [v4 setConstraintWidth:0];
    uint64_t v3 = 0;
  }
  [v4 setConstraintHeight:v3];
  [v4 setIsAuto:0];
  [v4 setEnabled:1];
}

- (id)applyCropToAssetTransitionInfo:(id)a3
{
  id v4 = a3;
  [(PUQuickCropContext *)self cropRectRelativeToRenderedImage];
  if (CGRectIsNull(v23))
  {
    id v5 = v4;
  }
  else
  {
    double v6 = [v4 image];
    double v7 = v6;
    if (v6)
    {
      double v8 = -[PUQuickCropContext _croppedCGImageForTransition:](self, "_croppedCGImageForTransition:", [v6 CGImage]);
      double v9 = [MEMORY[0x1E4FB1818] imageWithCGImage:v8];
      CGImageRelease(v8);
    }
    else
    {
      double v9 = 0;
    }
    double v10 = [v4 imageLayerModulator];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke;
    v21[3] = &unk_1E5F2D330;
    v21[4] = self;
    [v10 performChanges:v21];
    double v11 = [v4 snapshotView];
    double v12 = v11;
    if (v11)
    {
      double v11 = [(PUQuickCropContext *)self _croppedSnapshotViewForTransition:v11];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke_2;
    v17[3] = &unk_1E5F2D358;
    id v18 = v9;
    id v19 = v10;
    id v20 = v11;
    id v13 = v11;
    id v14 = v10;
    id v15 = v9;
    id v5 = [v4 assetTransitionInfoWithModifications:v17];
  }
  return v5;
}

void __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (CGImage *)objc_msgSend(v2, "_croppedCGImageForTransition:", objc_msgSend(v3, "gainMapImage"));
  [v3 setGainMapImage:v4];

  CGImageRelease(v4);
}

void __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setImage:v3];
  [v4 setImageLayerModulator:a1[5]];
  [v4 setSnapshotView:a1[6]];
}

- (PUQuickCropContext)initWithTileTransform:(id)a3 renderedImageSize:(CGSize)a4 boundingSize:(CGSize)a5 selectedAspectRatio:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  double v10 = a4.height;
  double v11 = a4.width;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v106.receiver = self;
  v106.super_class = (Class)PUQuickCropContext;
  id v14 = [(PUQuickCropContext *)&v106 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_44;
  }
  v14->_selectedAspectRatio.double width = width;
  v14->_selectedAspectRatio.double height = height;
  BOOL v16 = height != *(double *)(MEMORY[0x1E4F1DB30] + 8) || width != *MEMORY[0x1E4F1DB30];
  if (v16) {
    double v17 = height;
  }
  else {
    double v17 = v8;
  }
  if (!v16) {
    double width = v9;
  }
  [v13 scale];
  double v102 = v8;
  double v19 = v9 / v8;
  double v20 = v11 / v10;
  double v21 = v10 / v18;
  if (v18 <= v19 / (v11 / v10)) {
    double v22 = v11;
  }
  else {
    double v22 = v19 * (v10 / v18);
  }
  double v23 = v11 / v18;
  BOOL v24 = v18 > v20 / v19;
  double v25 = v11 / v18 / v19;
  if (!v24) {
    double v25 = v10;
  }
  if (v20 >= v19) {
    double v26 = v25;
  }
  else {
    double v26 = v21;
  }
  if (v20 >= v19) {
    double v27 = v23;
  }
  else {
    double v27 = v22;
  }
  objc_msgSend(v13, "normalizedTranslation", v25);
  double v30 = v11;
  CGFloat v31 = v27;
  double v32 = v10;
  CGFloat v33 = v26;
  double v34 = (v11 - v27) * (0.5 - v28);
  double v35 = (v10 - v26) * (v29 + 0.5);
  double v104 = v17;
  double v105 = width;
  if (width != 0.0 && v17 != 0.0)
  {
    double v36 = v10;
    double v37 = v30;
    double v38 = v26;
    CGFloat v39 = v31;
    if (v9 == v105 && v102 == v17) {
      goto LABEL_31;
    }
    double v40 = v105 / v17;
    if (v40 <= 0.0) {
      goto LABEL_31;
    }
    double v101 = v32;
    double v103 = v30;
    v110.origin.CGFloat x = v34;
    v110.origin.CGFloat y = v35;
    v110.size.double width = v31;
    v110.size.double height = v33;
    CGFloat v41 = v35;
    CGFloat v42 = CGRectGetWidth(v110);
    CGFloat v43 = v34;
    double v44 = v42;
    double v45 = v43;
    v111.origin.CGFloat x = v43;
    v111.origin.CGFloat y = v41;
    v111.size.double width = v39;
    v111.size.double height = v38;
    double v46 = v44 / CGRectGetHeight(v111);
    if (v19 > 1.0)
    {
      CGFloat x = v45;
      double v48 = v40;
      double v49 = v41;
      double v36 = v101;
      if (v46 <= v40) {
        goto LABEL_59;
      }
      CGFloat v50 = x;
      CGFloat v51 = v39;
      double v52 = v38;
      CGFloat v53 = CGRectGetWidth(*(CGRect *)(&v49 - 1)) / v40;
      v112.origin.CGFloat x = x;
      v112.origin.CGFloat y = v41;
      v112.size.double width = v39;
      v112.size.double height = v38;
      CGFloat v54 = (v53 - CGRectGetHeight(v112)) * -0.5;
      v113.origin.CGFloat x = x;
      v113.origin.CGFloat y = v41;
      v113.size.double width = v39;
      v113.size.double height = v38;
      CGRect v114 = CGRectInset(v113, 0.0, v54);
      CGFloat x = v114.origin.x;
      CGFloat y = v114.origin.y;
      CGFloat v39 = v114.size.width;
      double v38 = v114.size.height;
      if (CGRectGetHeight(v114) > v101)
      {
        v115.origin.CGFloat x = x;
        v115.origin.CGFloat y = y;
        v115.size.double width = v39;
        v115.size.double height = v38;
        CGFloat MinX = CGRectGetMinX(v115);
        v116.origin.CGFloat x = x;
        CGFloat x = MinX;
        v116.origin.CGFloat y = y;
        v116.size.double width = v39;
        v116.size.double height = v38;
        CGFloat v39 = CGRectGetWidth(v116);
        double v38 = v101;
        double v49 = 0.0;
        goto LABEL_59;
      }
      v129.origin.CGFloat x = x;
      v129.origin.CGFloat y = y;
      v129.size.double width = v39;
      v129.size.double height = v38;
      if (CGRectGetMinY(v129) < 0.0)
      {
        v130.origin.CGFloat x = x;
        v130.origin.CGFloat y = y;
        v130.size.double width = v39;
        v130.size.double height = v38;
        double v80 = -CGRectGetMinY(v130);
LABEL_54:
        double v81 = 0.0;
        CGFloat v82 = x;
        CGFloat v83 = y;
LABEL_58:
        CGFloat v84 = v39;
        double v85 = v38;
        *(CGRect *)(&v49 - 1) = CGRectOffset(*(CGRect *)&v82, v81, v80);
        CGFloat x = v86;
        CGFloat v39 = v87;
        double v38 = v88;
        goto LABEL_59;
      }
      v133.origin.CGFloat x = x;
      v133.origin.CGFloat y = y;
      v133.size.double width = v39;
      v133.size.double height = v38;
      if (CGRectGetMaxY(v133) > v101)
      {
        v134.origin.CGFloat x = x;
        v134.origin.CGFloat y = y;
        v134.size.double width = v39;
        v134.size.double height = v38;
        double v80 = v101 - CGRectGetMaxY(v134);
        goto LABEL_54;
      }
      double v49 = y;
LABEL_59:
      CGFloat v89 = x;
      CGFloat v90 = v39;
      double v91 = v38;
      CGFloat v92 = v49;
      CGFloat v93 = CGRectGetWidth(*(CGRect *)(&v49 - 1));
      CGFloat v94 = x;
      double v95 = v93;
      CGFloat v96 = v94;
      v137.origin.CGFloat x = v94;
      CGFloat v97 = v92;
      v137.origin.CGFloat y = v92;
      v137.size.double width = v39;
      v137.size.double height = v38;
      double v98 = CGRectGetHeight(v137);
      if (vabdd_f64(v95 / v98, v48) <= 0.00000999999975)
      {
        double v34 = v96;
        double v35 = v92;
        double v37 = v103;
      }
      else
      {
        double v37 = v103;
        if (v95 / v98 >= v48)
        {
          double v100 = (v95 - v48 * v98) * 0.5;
          double v99 = 0.0;
        }
        else
        {
          double v99 = (v98 - v95 / v48) * 0.5;
          double v100 = 0.0;
        }
        v138.origin.CGFloat x = v96;
        v138.origin.CGFloat y = v97;
        v138.size.double width = v39;
        v138.size.double height = v38;
        CGRect v139 = CGRectInset(v138, v100, v99);
        double v34 = v139.origin.x;
        double v35 = v139.origin.y;
        CGFloat v39 = v139.size.width;
        double v38 = v139.size.height;
      }
      goto LABEL_31;
    }
    CGFloat x = v45;
    double v48 = v40;
    double v49 = v41;
    double v36 = v101;
    if (v46 >= v40) {
      goto LABEL_59;
    }
    CGFloat v71 = x;
    CGFloat v72 = v39;
    double v73 = v38;
    double v74 = v40 * CGRectGetHeight(*(CGRect *)(&v49 - 1));
    v124.origin.CGFloat x = x;
    v124.origin.CGFloat y = v41;
    v124.size.double width = v39;
    v124.size.double height = v38;
    CGFloat v75 = (v74 - CGRectGetWidth(v124)) * -0.5;
    v125.origin.CGFloat x = x;
    v125.origin.CGFloat y = v41;
    v125.size.double width = v39;
    v125.size.double height = v38;
    CGRect v126 = CGRectInset(v125, v75, 0.0);
    CGFloat v76 = v126.origin.x;
    CGFloat v77 = v126.origin.y;
    CGFloat v39 = v126.size.width;
    double v38 = v126.size.height;
    if (CGRectGetWidth(v126) > v103)
    {
      v127.origin.CGFloat x = v76;
      v127.origin.CGFloat y = v77;
      v127.size.double width = v39;
      v127.size.double height = v38;
      CGFloat MinY = CGRectGetMinY(v127);
      v128.origin.CGFloat x = v76;
      v128.origin.CGFloat y = v77;
      v128.size.double width = v39;
      v128.size.double height = v38;
      CGFloat v79 = CGRectGetHeight(v128);
      double v49 = MinY;
      double v38 = v79;
      CGFloat v39 = v103;
      CGFloat x = 0.0;
      goto LABEL_59;
    }
    v131.origin.CGFloat x = v76;
    v131.origin.CGFloat y = v77;
    v131.size.double width = v39;
    v131.size.double height = v38;
    if (CGRectGetMinX(v131) >= 0.0)
    {
      v135.origin.CGFloat x = v76;
      v135.origin.CGFloat y = v77;
      v135.size.double width = v39;
      v135.size.double height = v38;
      if (CGRectGetMaxX(v135) <= v103)
      {
        double v49 = v77;
        CGFloat x = v76;
        goto LABEL_59;
      }
      v136.origin.CGFloat x = v76;
      v136.origin.CGFloat y = v77;
      v136.size.double width = v39;
      v136.size.double height = v38;
      double v81 = v103 - CGRectGetMaxX(v136);
    }
    else
    {
      v132.origin.CGFloat x = v76;
      v132.origin.CGFloat y = v77;
      v132.size.double width = v39;
      v132.size.double height = v38;
      double v81 = -CGRectGetMinX(v132);
    }
    double v80 = 0.0;
    CGFloat v82 = v76;
    CGFloat v83 = v77;
    goto LABEL_58;
  }
  double v36 = v10;
  double v37 = v30;
  double v38 = v26;
  CGFloat v39 = v31;
LABEL_31:
  v117.origin.CGFloat x = v34;
  v117.origin.CGFloat y = v35;
  v117.size.double width = v39;
  v117.size.double height = v38;
  CGRect v118 = CGRectIntegral(v117);
  CGFloat v57 = v118.origin.x;
  CGFloat v58 = v118.origin.y;
  CGFloat v59 = v118.size.width;
  CGFloat v60 = v118.size.height;
  IsEmptCGFloat y = CGRectIsEmpty(v118);
  v62 = (CGFloat *)MEMORY[0x1E4F1DB20];
  if (IsEmpty)
  {
    v63 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v119.origin.CGFloat x = v57;
      v119.origin.CGFloat y = v58;
      v119.size.double width = v59;
      v119.size.double height = v60;
      v64 = NSStringFromCGRect(v119);
      *(_DWORD *)buf = 138412290;
      v108 = v64;
      _os_log_impl(&dword_1AE9F8000, v63, OS_LOG_TYPE_ERROR, "Quick crop rect is empty %@", buf, 0xCu);
    }
    CGFloat v57 = *v62;
    CGFloat v58 = v62[1];
    CGFloat v59 = v62[2];
    CGFloat v60 = v62[3];
  }
  v120.origin.CGFloat x = v57;
  v120.origin.CGFloat y = v58;
  v120.size.double width = v59;
  v120.size.double height = v60;
  if (CGRectIsInfinite(v120))
  {
    v65 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v121.origin.CGFloat x = v57;
      v121.origin.CGFloat y = v58;
      v121.size.double width = v59;
      v121.size.double height = v60;
      v66 = NSStringFromCGRect(v121);
      *(_DWORD *)buf = 138412290;
      v108 = v66;
      _os_log_impl(&dword_1AE9F8000, v65, OS_LOG_TYPE_ERROR, "Quick crop rect is infinite %@", buf, 0xCu);
    }
    CGFloat v57 = *v62;
    CGFloat v58 = v62[1];
    CGFloat v59 = v62[2];
    CGFloat v60 = v62[3];
  }
  v122.origin.CGFloat x = v57;
  v122.origin.CGFloat y = v58;
  v122.size.double width = v59;
  v122.size.double height = v60;
  if (CGRectIsNull(v122))
  {
    v67 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v123.origin.CGFloat x = v57;
      v123.origin.CGFloat y = v58;
      v123.size.double width = v59;
      v123.size.double height = v60;
      v68 = NSStringFromCGRect(v123);
      *(_DWORD *)buf = 138412290;
      v108 = v68;
      _os_log_impl(&dword_1AE9F8000, v67, OS_LOG_TYPE_ERROR, "Quick crop rect is null %@", buf, 0xCu);
    }
    CGFloat v57 = *v62;
    CGFloat v58 = v62[1];
    CGFloat v59 = v62[2];
    CGFloat v60 = v62[3];
  }
  v15->_cropRectRelativeToRenderedImage.origin.CGFloat x = v57;
  v15->_cropRectRelativeToRenderedImage.origin.CGFloat y = v58;
  v15->_cropRectRelativeToRenderedImage.size.double width = v59;
  v15->_cropRectRelativeToRenderedImage.size.double height = v60;
  v15->_renderedImageSize.double width = v37;
  v15->_renderedImageSize.double height = v36;
  v15->_aspectRatio.double width = v105;
  v15->_aspectRatio.double height = v104;
  v15->_lockAspectRatio = v16;
  v69 = v15;
LABEL_44:

  return v15;
}

@end