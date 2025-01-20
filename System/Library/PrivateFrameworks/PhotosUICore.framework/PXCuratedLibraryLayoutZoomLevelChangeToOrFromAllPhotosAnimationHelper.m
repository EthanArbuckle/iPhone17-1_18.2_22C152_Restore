@interface PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper
- (PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper)initWithLayout:(id)a3;
- (double)animationDuration;
- (id)_snapshotForZoomLevel:(int64_t)a3;
- (unsigned)highFrameRateReason;
- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5;
@end

@implementation PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSnapshot, 0);
  objc_storeStrong((id *)&self->_fromSnapshot, 0);
}

- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t length = a6.length;
  unsigned int v11 = a6.length;
  if ([(_PXCuratedLibraryLayoutAssetsSnapshot *)self->_toSnapshot zoomLevel] == 4)
  {
    v13 = self->_toSnapshot;
    v12 = self->_fromSnapshot;
    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
    v13 = self->_fromSnapshot;
    v14 = self->_toSnapshot;
    v12 = v14;
    if (!v7)
    {
LABEL_6:
      v15 = +[PXCuratedLibrarySettings sharedInstance];
      [v15 cornerRadiusForYears];
      [v15 cornerRadiusForMonths];
      if (v11)
      {
        v16 = a4;
        do
        {
          v16->var0 = 0.0;
          v16 = ($225AF24142A77900D29617A74D173C5F *)((char *)v16 + 160);
          --length;
        }
        while (length);
      }
      uint64_t v20 = 0;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
      __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke((uint64_t)&v17, v13);
    }
  }
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke((uint64_t)&v17, v12);
}

void __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke(uint64_t a1, void *a2)
{
}

void __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_3(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (double *)(v6 + 32 * a3);
  int v8 = *(unsigned __int8 *)(*(void *)(a1 + 64) + 40 * a3 + 1);
  if (v8 == 8)
  {
    v9 = *(void **)(a1 + 32);
    if (v9) {
LABEL_3:
    }
      [v9 spriteSnapshotForAssetWithIdentifier:v5];
  }
  else if (v8 == 2 && *(unsigned char *)(a1 + 152) != 0)
  {
    v9 = *(void **)(a1 + 32);
    if (v9) {
      goto LABEL_3;
    }
  }
  double v11 = *(double *)(a1 + 80);
  double v12 = *(double *)(a1 + 88);
  double v13 = *(double *)(a1 + 96);
  double v14 = *(double *)(a1 + 104);
  uint64_t v15 = v6 + 32 * a3;
  double v16 = COERCE_FLOAT(HIDWORD(*(void *)(v15 + 24)));
  *(float *)&uint64_t v17 = v13 * v16 + v11 * COERCE_FLOAT(*(void *)(v15 + 24));
  *(float *)&double v16 = v14 * v16 + v12 * *(float *)&v17;
  HIDWORD(v17) = LODWORD(v16);
  double v18 = *(double *)(a1 + 112);
  double v19 = *(double *)(a1 + 120);
  *(void *)(v15 + 24) = v17;
  double v20 = v7[1];
  double v21 = v18 + v13 * v20 + v11 * *v7;
  *BOOL v7 = v21;
  v7[1] = v19 + v14 * v20 + v12 * v21;
  *(float *)&double v21 = *(double *)(a1 + 128);
  v7[2] = v7[2] + *(float *)&v21;
}

void __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_4(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72) + 160 * a3;
  uint64_t v9 = v7 + 32 * v6;
  v31.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v31.size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  float v10 = *(double *)(v9 + 16);
  float v30 = v10;
  int v11 = *(_DWORD *)v8;
  long long v29 = *(_OWORD *)(v8 + 4);
  if (v5)
  {
    double v12 = *(void **)(a1 + 32);
    if (v12) {
      [v12 spriteSnapshotForAssetWithIdentifier:v5];
    }
  }
  if (!CGRectIsNull(v31))
  {
    CGFloat MidX = CGRectGetMidX(v31);
    CGFloat MidY = CGRectGetMidY(v31);
    CGFloat Width = CGRectGetWidth(v31);
    CGFloat Height = CGRectGetHeight(v31);
    v27.f64[0] = Width;
    v27.f64[1] = Height;
    *(CGFloat *)uint64_t v9 = MidX;
    *(CGFloat *)(v9 + 8) = MidY;
    *(double *)(v9 + 16) = v30;
    *(float32x2_t *)(v9 + 24) = vcvt_f32_f64(v27);
    *(_DWORD *)uint64_t v8 = v11;
    *(_OWORD *)(v8 + 4) = v29;
    PXGSpriteStyleUnionClippingRect();
  }
  double v13 = *(double *)(a1 + 88);
  double v14 = *(double *)(a1 + 96);
  double v15 = *(double *)(a1 + 104);
  double v16 = *(double *)(a1 + 112);
  double v17 = *(double *)(a1 + 120);
  double v18 = *(double *)(a1 + 128);
  uint64_t v19 = v7 + 32 * v6;
  double v20 = COERCE_FLOAT(HIDWORD(*(void *)(v19 + 24)));
  *(float *)&uint64_t v21 = v15 * v20 + v13 * COERCE_FLOAT(*(void *)(v19 + 24));
  *(float *)&double v20 = v16 * v20 + v14 * *(float *)&v21;
  HIDWORD(v21) = LODWORD(v20);
  *(void *)(v19 + 24) = v21;
  double v22 = *(double *)(v9 + 8);
  double v23 = v17 + v15 * v22 + v13 * *(double *)v9;
  *(double *)uint64_t v9 = v23;
  *(double *)(v9 + 8) = v18 + v16 * v22 + v14 * v23;
  *(float *)&double v23 = *(double *)(a1 + 136);
  *(double *)(v9 + 16) = *(double *)(v9 + 16) + *(float *)&v23;
  *(_DWORD *)uint64_t v8 = 0;
  [*(id *)(a1 + 48) removeIndex:v6];
}

uint64_t __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_5(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 160 * a2) = 0;
  return result;
}

void __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_2()
{
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
}

- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v10 = a3;
  id v11 = a4;
  -[_PXCuratedLibraryLayoutAssetsSnapshot setOffset:](self->_fromSnapshot, "setOffset:", x, y);
  id v12 = v11;
  if (!v12)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    [v37 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m", 114, @"%@ should be an instance inheriting from %@, but it is nil", @"rootLayout", v39 object file lineNumber description];
LABEL_13:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v40 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v40);
    v41 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v37 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m", 114, @"%@ should be an instance inheriting from %@, but it is %@", @"rootLayout", v39, v41 object file lineNumber description];

    goto LABEL_13;
  }
LABEL_3:
  double v13 = [[_PXCuratedLibraryLayoutAssetsSnapshot alloc] initWithLayout:v12];
  toSnapshot = self->_toSnapshot;
  self->_toSnapshot = v13;

  double v15 = [(PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper *)self _snapshotForZoomLevel:3];
  double v16 = [(PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper *)self _snapshotForZoomLevel:4];
  double v17 = v16;
  if (v15 && v16)
  {
    [v16 visibleRect];
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke;
    aBlock[3] = &unk_1E5DBFDA0;
    id v59 = v17;
    uint64_t v60 = v19;
    uint64_t v61 = v21;
    uint64_t v62 = v23;
    uint64_t v63 = v25;
    v26 = _Block_copy(aBlock);
    float64x2_t v27 = [v15 dominantAssetIdentifier];
    if (((*((uint64_t (**)(void *, void *))v26 + 2))(v26, v27) & 1) == 0)
    {
      [v15 visibleRect];
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      uint64_t v33 = v32;
      uint64_t v35 = v34;
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__154825;
      v56 = __Block_byref_object_dispose__154826;
      id v57 = 0;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v51[3] = 0;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke_2;
      v42[3] = &unk_1E5DBFDC8;
      id v44 = v26;
      id v36 = v15;
      uint64_t v47 = v29;
      uint64_t v48 = v31;
      uint64_t v49 = v33;
      uint64_t v50 = v35;
      id v43 = v36;
      v45 = v51;
      v46 = &v52;
      [v36 enumerateAssetIdentifiersUsingBlock:v42];
      if (v53[5]) {
        objc_msgSend(v36, "setDominantAssetIdentifier:");
      }

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(&v52, 8);
    }
  }
}

BOOL __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 spriteSnapshotForAssetWithIdentifier:v3];
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  if (CGRectIsNull(*(CGRect *)&v5))
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.origin = 0u;
    v11.size = 0u;
    BOOL v9 = CGRectIntersectsRect(v11, *(CGRect *)(a1 + 40));
  }

  return v9;
}

void __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      [v4 spriteSnapshotForAssetWithIdentifier:v3];
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      uint64_t v8 = 0;
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v6 = 0;
      uint64_t v5 = 0;
    }
    CGRect v9 = CGRectIntersection(*(CGRect *)&v5, *(CGRect *)(a1 + 64));
    if (!CGRectIsEmpty(v9)) {
      PXSizeGetArea();
    }
  }
}

- (id)_snapshotForZoomLevel:(int64_t)a3
{
  uint64_t v8 = 0;
  CGRect v9 = &v8;
  uint64_t v10 = 0x3032000000;
  CGRect v11 = __Block_byref_object_copy__154825;
  id v12 = __Block_byref_object_dispose__154826;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__snapshotForZoomLevel___block_invoke;
  v7[3] = &unk_1E5DBFD78;
  v7[4] = &v8;
  v7[5] = a3;
  v4 = (void (**)(void *, _PXCuratedLibraryLayoutAssetsSnapshot *))_Block_copy(v7);
  v4[2](v4, self->_fromSnapshot);
  v4[2](v4, self->_toSnapshot);
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __95__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__snapshotForZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [v4 zoomLevel] == *(void *)(a1 + 40);
    id v4 = v6;
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      id v4 = v6;
    }
  }
}

- (unsigned)highFrameRateReason
{
  return 2228227;
}

- (double)animationDuration
{
  v2 = +[PXCuratedLibrarySettings sharedInstance];
  [v2 transitionToOrFromAllPhotosAnimationDuration];
  double v4 = v3;

  return v4;
}

- (PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper)initWithLayout:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper;
  BOOL v5 = [(PXCuratedLibraryLayoutAnimationHelper *)&v9 initWithLayout:v4];
  if (v5)
  {
    id v6 = [[_PXCuratedLibraryLayoutAssetsSnapshot alloc] initWithLayout:v4];
    fromSnapshot = v5->_fromSnapshot;
    v5->_fromSnapshot = v6;
  }
  return v5;
}

@end