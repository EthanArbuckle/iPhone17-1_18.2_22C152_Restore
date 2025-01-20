@interface PXGDecoratingLayout
- (BOOL)allowsViewDecorationHitTesting;
- (BOOL)appliesAlphaToSublayouts;
- (BOOL)canHandleVisibleRectRejection;
- (BOOL)definesContextForPointReferences;
- (BOOL)enabled;
- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4;
- (BOOL)spritesAreInSyncWithDecoratedLayout;
- (CGRect)sublayout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4;
- (PXGAssetBackgroundDecorationSource)assetBackgroundDecorationSource;
- (PXGAssetBadgeDecorationSource)assetBadgeDecorationSource;
- (PXGAssetBadgeDecorationSource)assetProgressDecorationSource;
- (PXGCaptionDecorationSource)captionDecorationSource;
- (PXGDebugDecorationSource)debugDecorationSource;
- (PXGDecoratingLayout)init;
- (PXGDecoratingLayout)initWithDecoratedLayout:(id)a3;
- (PXGDragDecorationSource)dragDecorationSource;
- (PXGHighlightDecorationSource)highlightDecorationSource;
- (PXGItemsGeometry)itemsGeometry;
- (PXGLayout)decoratedLayout;
- (PXGLayoutContentSource)decorationSource;
- (PXGSelectionDecorationSource)selectionDecorationSource;
- (PXGSolidColorOverlayDecorationSource)solidColorOverlayDecorationSource;
- (PXGTapbackDecorationSource)tapbackDecorationSource;
- (PXGViewDecorationSource)viewDecorationSource;
- (double)lastBaseline;
- (double)textureScale;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axSpriteIndexes;
- (id)currentDataSourceChange;
- (id)description;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)itemsLayout;
- (id)layoutForItemChanges;
- (id)preferredFocusLayouts;
- (int64_t)decoratingTypeForSpriteIndex:(unsigned int)a3;
- (int64_t)decorationSizeClass;
- (int64_t)focusRingType;
- (int64_t)scrollableAxis;
- (int64_t)selectionDecorationStyle;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unint64_t)selectionDecorationOptions;
- (unsigned)debugDecorationIndex;
- (unsigned)decoratedIndexForDecoratingIndex:(unsigned int)a3;
- (unsigned)decorationIndexForSpriteIndex:(unsigned int)a3;
- (unsigned)numberOfDecoratingSpritesPerDecoratedSprite;
- (unsigned)spriteIndexForDecorationIndex:(unsigned int)a3 decoratingSpriteIndex:(unsigned int)a4;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_applyDecoratedLayoutChangeDetails:(id)a3;
- (void)_invalidateDecorationForSpriteRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4 invalidateSprites:(BOOL)a5;
- (void)_updateDecoratedLayout;
- (void)_updateDecorationSources;
- (void)_updateDecorationSprites;
- (void)_updateReloadSprites;
- (void)addActiveDecorations:(id)a3;
- (void)alphaDidChange;
- (void)dealloc;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4;
- (void)referenceSizeDidChange;
- (void)removeSublayoutsInRange:(_NSRange)a3;
- (void)safeAreaInsetsDidChange;
- (void)setActiveDecorations:(id)a3;
- (void)setAllowsViewDecorationHitTesting:(BOOL)a3;
- (void)setAppliesAlphaToSublayouts:(BOOL)a3;
- (void)setContentSource:(id)a3;
- (void)setDecoratedLayout:(id)a3;
- (void)setDecorationSizeClass:(int64_t)a3;
- (void)setDecorationSource:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLastBaseline:(double)a3;
- (void)sublayout:(id)a3 didApplySpriteChangeDetails:(id)a4 fromDescendentSublayout:(id)a5;
- (void)sublayoutDidChangeContentSize:(id)a3;
- (void)sublayoutDidChangeLastBaseline:(id)a3;
- (void)sublayoutNeedsUpdate:(id)a3;
- (void)update;
- (void)userInterfaceDirectionDidChange;
- (void)viewEnvironmentWillChange:(id)a3;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXGDecoratingLayout

- (int64_t)decoratingTypeForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = [(PXGDecoratingLayout *)self decorationIndexForSpriteIndex:*(void *)&a3];
  return _DecorationTypeForIndex(v3);
}

- (unsigned)decorationIndexForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(PXGLayout *)self localNumberOfSprites] <= a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGDecoratingLayout.m", 982, @"Sprite index %u is not valid for decorating layout with %u sprites", v3, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"));
  }
  unsigned int v6 = self->_activeDecorationSpriteIndexes[v3 % self->_activeDecorationsCount];
  if (v6 >= 9)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGDecoratingLayout.m", 986, @"Invalid parameter not satisfying: %@", @"decorationIndex < PXGDecoratingLayoutMaxNumberOfDecoratingSpritesPerDecoratedSprite" object file lineNumber description];
  }
  return v6;
}

- (PXGSolidColorOverlayDecorationSource)solidColorOverlayDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_solidColorOverlayDecorationSource);
  return (PXGSolidColorOverlayDecorationSource *)WeakRetained;
}

- (PXGLayout)decoratedLayout
{
  return self->_decoratedLayout;
}

- (unsigned)numberOfDecoratingSpritesPerDecoratedSprite
{
  return self->_activeDecorationsCount;
}

- (PXGSelectionDecorationSource)selectionDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDecorationSource);
  return (PXGSelectionDecorationSource *)WeakRetained;
}

- (PXGViewDecorationSource)viewDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDecorationSource);
  return (PXGViewDecorationSource *)WeakRetained;
}

- (double)textureScale
{
  return 1.0;
}

- (PXGHighlightDecorationSource)highlightDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightDecorationSource);
  return (PXGHighlightDecorationSource *)WeakRetained;
}

- (PXGDragDecorationSource)dragDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragDecorationSource);
  return (PXGDragDecorationSource *)WeakRetained;
}

- (int64_t)decorationSizeClass
{
  return self->_decorationSizeClass;
}

- (PXGDebugDecorationSource)debugDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugDecorationSource);
  return (PXGDebugDecorationSource *)WeakRetained;
}

- (unsigned)debugDecorationIndex
{
  return 2;
}

- (PXGAssetBadgeDecorationSource)assetProgressDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetProgressDecorationSource);
  return (PXGAssetBadgeDecorationSource *)WeakRetained;
}

- (PXGAssetBadgeDecorationSource)assetBadgeDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetBadgeDecorationSource);
  return (PXGAssetBadgeDecorationSource *)WeakRetained;
}

- (int64_t)selectionDecorationStyle
{
  return self->_selectionDecorationStyle;
}

- (unint64_t)selectionDecorationOptions
{
  return self->_selectionDecorationOptions;
}

void __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, float32x2_t *a5)
{
  int v71 = a2;
  unint64_t v9 = HIDWORD(a2);
  [*(id *)(a1 + 32) displayScale];
  unsigned int v72 = v9;
  if (!v9) {
    return;
  }
  unsigned int v11 = 0;
  float v12 = v10;
  float v75 = v12;
  double v76 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v77 = *MEMORY[0x1E4F1DAD8];
  float32x4_t v74 = *(float32x4_t *)off_1E5DAAF50;
  do
  {
    uint64_t v13 = [*(id *)(a1 + 40) assetBackgroundStyleForSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) inLayout:*(void *)(a1 + 32)];
    if (!*(_DWORD *)(a1 + 152)) {
      goto LABEL_59;
    }
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    unsigned int v73 = v11;
    int v16 = v71 + v11;
    do
    {
      float64x2_t v17 = vcvtq_f64_f32(*(float32x2_t *)(*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 24));
      v18 = *(void **)(a1 + 48);
      if (v18)
      {
        [v18 itemsLayout:*(void *)(a1 + 56) insetForItem:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)];
        PXSizeAdd();
      }
      uint64_t v19 = *(unsigned int *)(*(void *)(a1 + 136) + 4 * v15);
      float32x2_t v20 = vcvt_f32_f64(vmlaq_f64(vcvtq_f64_f32(PXGDecorationSpriteSizeTransforms[2 * v19]), v17, vcvtq_f64_f32(PXGDecorationSpriteSizeTransforms[2 * v19 + 1])));
      *(float32x2_t *)(a3 + 24) = v20;
      v21 = (double *)((char *)&PXGDecorationSpriteRelativePositions + 24 * v19);
      double v22 = *v21;
      double v23 = v21[1];
      double v24 = v21[2];
      v25 = (double *)((char *)&PXGDecorationSpriteRelativeOffset + 16 * v19);
      double v26 = v25[1];
      if (*(unsigned char *)(a1 + 156)) {
        double v27 = -v22;
      }
      else {
        double v27 = v22;
      }
      if (*(unsigned char *)(a1 + 156)) {
        double v28 = -*v25;
      }
      else {
        double v28 = *v25;
      }
      uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
      float v30 = *(float *)v29;
      float v31 = *(float *)(v29 + 60);
      float32x4_t v32 = PXGDecorationSpriteRelativeCornerRadius[v19];
      float64x2_t v82 = v17;
      float v79 = v20.f32[0];
      double v78 = v28;
      if (v14)
      {
        float32x4_t v80 = PXGDecorationSpriteRelativeCornerRadius[v19];
        [*(id *)(a1 + 40) assetBackgroundCornerRadiusForSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) inLayout:*(void *)(a1 + 32)];
        v36.i32[1] = v33;
        float32x4_t v32 = v80;
        v36.i64[1] = __PAIR64__(v35, v34);
      }
      else
      {
        float32x4_t v36 = *(float32x4_t *)(v29 + 36);
      }
      if (!*(unsigned char *)(a1 + 157)) {
        a5->i8[1] = 8 * (*(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) + 1) != 0);
      }
      double v37 = v30;
      double v38 = v31;
      float32x4_t v81 = vmulq_f32(v32, v36);
      if (v19 == 2)
      {
        double v39 = v24;
        [*(id *)(a1 + 64) overlayInsetsForSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) inLayout:*(void *)(a1 + 72)];
        float v42 = v41.f32[0] - v40.f32[0];
        v40.f32[1] = v43;
        v41.f32[1] = v44;
        float32x2_t v45 = vsub_f32(*(float32x2_t *)(a3 + 24), vadd_f32(v40, v41));
        *(float32x2_t *)(a3 + 24) = v45;
        double v46 = v77 - (float)(v42 * 0.5);
        double v47 = v76 - (float)((float)(v44 - v43) * 0.5);
        if (*(void *)(*(void *)(a1 + 32) + 968) == 2)
        {
          *(float32x2_t *)(a3 + 24) = vadd_f32(v45, (float32x2_t)0x4100000041000000);
          float32x4_t v81 = v74;
        }
        goto LABEL_31;
      }
      if (v19 != 7)
      {
        double v39 = v24;
        if (v19 == 6) {
          PXRectWithCenterAndSize();
        }
        if (v19 == 3) {
          a5->i8[0] = 1;
        }
        goto LABEL_30;
      }
      a5->i8[0] = 1;
      double v39 = v24;
      if (![*(id *)(a1 + 80) hasTapbacksForSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) inLayout:*(void *)(a1 + 72)])
      {
        double v37 = 0.0;
LABEL_30:
        double v47 = v76;
        double v46 = v77;
        goto LABEL_31;
      }
      objc_msgSend(*(id *)(a1 + 80), "tapbackConfigurationForProposedConfiguration:spriteIndex:inLayout:", *(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), *(void *)(a1 + 72), v37, v31, 0.0, 0.0);
      double v38 = v48;
      double v46 = v49;
      double v47 = v50;
      double v37 = v51;
      if (v51 > 0.0) {
        a5->i8[1] = 8;
      }
LABEL_31:
      CGFloat v52 = v26 * *(float *)(a3 + 28) + (v82.f64[1] - *(float *)(a3 + 28)) * v23;
      memset(&v87, 0, sizeof(v87));
      CGAffineTransformMakeTranslation(&v86, v78 * v79 + (v82.f64[0] - v79) * v27, v52);
      uint64_t v53 = *(void *)(a1 + 120);
      CGAffineTransformMakeScale(&t1, *(float *)(*(void *)(*(void *)(v53 + 8) + 24) + 60), *(float *)(*(void *)(*(void *)(v53 + 8) + 24) + 60));
      CGAffineTransformMakeRotation(&t2, *(float *)(*(void *)(*(void *)(v53 + 8) + 24) + 56));
      CGAffineTransformConcat(&v85, &t1, &t2);
      CGAffineTransformConcat(&v87, &v86, &v85);
      *(double *)a3 = **(double **)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + v87.tx;
      *(double *)(a3 + 8) = *(double *)(*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 8) + v87.ty;
      double v54 = v47 + *(double *)(a3 + 8);
      *(double *)a3 = v46 + *(double *)a3;
      *(double *)(a3 + 8) = v54;
      double v55 = v39 + *(double *)(*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 16);
      *(double *)(a3 + 16) = v55;
      *(_DWORD *)(a4 + 80) = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) + 80);
      if (v19 == 2)
      {
        uint64_t v56 = *(void *)(a1 + 32);
        uint64_t v57 = *(void *)(v56 + 968);
        if ((unint64_t)(v57 - 1) <= 1)
        {
          if (*(unsigned char *)(v56 + 976))
          {
            double v58 = v55 + -0.1;
            goto LABEL_43;
          }
          if (v57 == 1)
          {
            double v58 = -0.95;
LABEL_43:
            *(double *)(a3 + 16) = v58;
            uint64_t v56 = *(void *)(a1 + 32);
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)(v56 + 1032));
        if (WeakRetained)
        {
          id v61 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1032));
          [v61 solidColorOverlayAlphaForSpriteIndex:(v16 + v15) / *(_DWORD *)(a1 + 152) inLayout:*(void *)(a1 + 72)];
          double v59 = v62;
        }
        else
        {
          double v59 = 1.0;
        }

        goto LABEL_48;
      }
      double v59 = 1.0;
      if (v19 == 5)
      {
        if (v14)
        {
          a5->i8[1] = 2;
          a5[4].i16[0] = *(_WORD *)(*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) + 32);
          PXFloatApproximatelyEqualToFloat();
        }
        a5->i8[1] = 0;
      }
      else if (v19 == 3 && *(unsigned char *)(*(void *)(a1 + 32) + 912))
      {
        *(float *)(a3 + 28) = *(float *)(a3 + 28) + 18.0;
        *(double *)(a3 + 8) = v54 + 9.0;
      }
LABEL_48:
      *(_DWORD *)(a4 + 56) = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) + 56);
      float v63 = v59 * (v37 * *(double *)(a1 + 144));
      *(float *)a4 = v63;
      *(_OWORD *)(a4 + 20) = *(_OWORD *)(*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) + 20);
      *(float32x4_t *)(a4 + 36) = v81;
      float v64 = v38;
      *(float *)(a4 + 60) = v64;
      v65 = *(_OWORD **)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
      long long v66 = v65[6];
      long long v67 = v65[7];
      long long v68 = v65[9];
      *(_OWORD *)(a4 + 128) = v65[8];
      *(_OWORD *)(a4 + 144) = v68;
      *(_OWORD *)(a4 + 96) = v66;
      *(_OWORD *)(a4 + 112) = v67;
      if (*(unsigned char *)(a1 + 158) || (float32x2_t v70 = a5[1], v70.f32[0] == 0.0) || v70.f32[1] == 0.0) {
        a5[1] = vmul_n_f32(*(float32x2_t *)(a3 + 24), v75);
      }
      float32x2_t v69 = *(float32x2_t *)(*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) + 24);
      a5[3] = v69;
      if (v69)
      {
        if (!v69.i8[0]) {
          a5[3].i8[0] = v19 + 1;
        }
      }
      a3 += 32;
      a4 += 160;
      a5 += 5;
      ++v15;
    }
    while (v15 < *(unsigned int *)(a1 + 152));
    unsigned int v11 = v73 + v15;
LABEL_59:
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += 32;
    *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += 160;
    *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) += 40;
  }
  while (v11 < v72);
}

- (int64_t)focusRingType
{
  return self->_focusRingType;
}

- (void)sublayout:(id)a3 didApplySpriteChangeDetails:(id)a4 fromDescendentSublayout:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v13 sublayout:a3 didApplySpriteChangeDetails:v8 fromDescendentSublayout:v9];
  id v10 = [(PXGDecoratingLayout *)self decoratedLayout];
  if (v10 == v9)
  {
    BOOL v11 = [(PXGDecoratingLayout *)self spritesAreInSyncWithDecoratedLayout];

    if (v11)
    {
      if (self->_isChangingDecoratedLayout) {
        id v12 = 0;
      }
      else {
        id v12 = v8;
      }
      [(PXGDecoratingLayout *)self _applyDecoratedLayoutChangeDetails:v12];
    }
  }
  else
  {
  }
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  *a5 = v8;
  id v9 = [(PXGDecoratingLayout *)self decoratedLayout];
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXGDecoratingLayout;
    id v10 = [(PXGLayout *)&v12 sublayoutIndexForObjectReference:v8 options:a4 updatedObjectReference:a5];
  }

  return (int64_t)v10;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    id v10 = [(PXGDecoratingLayout *)self decoratedLayout];
    BOOL v11 = [v9 decoratedSpriteReference];
    int v12 = [v10 spriteIndexForSpriteReference:v11 options:a4];

    unsigned int v13 = -1;
    if (v10 && v12 != -1)
    {
      unsigned int v14 = [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
      unsigned int v13 = _DecorationIndexForType([v9 decorationType]) + v14 * v12;
      if (v13 >= [(PXGLayout *)self localNumberOfSprites]) {
        unsigned int v13 = -1;
      }
      else {
        *a5 = v9;
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PXGDecoratingLayout;
    unsigned int v13 = [(PXGLayout *)&v16 spriteIndexForObjectReference:v8 options:a4 updatedObjectReference:a5];
  }

  return v13;
}

- (void)_updateDecorationSources
{
  id v30 = [(PXGDecoratingLayout *)self decoratedLayout];
  uint64_t v3 = [(PXGLayout *)self contentSource];
  v4 = [(PXGDecoratingLayout *)self decorationSource];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v30 contentSource];
  }
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  id v8 = v7;
  if (([v8 wantsAssetBadgeDecorationsInLayout:v30] & 1) == 0)
  {

LABEL_10:
    id v9 = 0;
    id v8 = 0;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = v8;
    id v8 = v9;
  }
  else
  {
    id v9 = 0;
  }
LABEL_11:
  objc_storeWeak((id *)&self->_assetBadgeDecorationSource, v8);
  objc_storeWeak((id *)&self->_assetProgressDecorationSource, v9);
  if (objc_opt_respondsToSelector()) {
    objc_storeWeak((id *)&self->_assetBackgroundDecorationSource, v7);
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = v7;
    self->_wantsCaptionDecorations = [v10 wantsCaptionDecorationsInLayout:v30];
  }
  else
  {
    id v10 = 0;
  }
  objc_storeWeak((id *)&self->_captionDecorationSource, v10);
  double v28 = v9;
  uint64_t v29 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = v7;
    int64_t v12 = [v11 selectionDecorationStyleInLayout:v30];
    uint64_t v13 = [v11 selectionDecorationAdditionsInLayout:v30];
    if (v12 | v13)
    {
      unint64_t v14 = v13;
      goto LABEL_22;
    }
  }
  id v11 = 0;
  int64_t v12 = 0;
  unint64_t v14 = 0;
LABEL_22:
  objc_storeWeak((id *)&self->_selectionDecorationSource, v11);
  self->_selectionDecorationStyle = v12;
  self->_selectionDecorationOptions = v14;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    id v15 = v3;
  }
  else {
    id v15 = 0;
  }
  objc_storeStrong((id *)&self->_shadowSource, v15);
  if (objc_opt_respondsToSelector()) {
    id v16 = v3;
  }
  else {
    id v16 = 0;
  }
  objc_storeStrong((id *)&self->_shadowDecorationSource, v16);
  if (objc_opt_respondsToSelector()) {
    id v17 = v7;
  }
  else {
    id v17 = 0;
  }
  objc_storeWeak((id *)&self->_highlightDecorationSource, v17);
  if (objc_opt_respondsToSelector()) {
    id v18 = v7;
  }
  else {
    id v18 = 0;
  }
  objc_storeWeak((id *)&self->_solidColorOverlayDecorationSource, v18);
  if (objc_opt_respondsToSelector()) {
    int64_t v19 = [v7 focusRingTypeInLayout:v30];
  }
  else {
    int64_t v19 = 1;
  }
  self->_focusRingType = v19;
  if (objc_opt_respondsToSelector()) {
    id v20 = v7;
  }
  else {
    id v20 = 0;
  }
  objc_storeWeak((id *)&self->_dragDecorationSource, v20);
  double v26 = v15;
  double v27 = v10;
  v25 = v16;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v21 = v7;
    if (objc_msgSend(v21, "wantsDebugDecorationInLayout:", v30, v16, v15, v27, v28, v29)) {
      goto LABEL_46;
    }
  }
  id v21 = 0;
LABEL_46:
  objc_storeWeak((id *)&self->_debugDecorationSource, v21);
  if (objc_opt_respondsToSelector()) {
    id v22 = v7;
  }
  else {
    id v22 = 0;
  }
  objc_storeWeak((id *)&self->_viewDecorationSource, v22);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v7 wantsTapbackDecorationInLayout:v30])
  {
    double v23 = v3;
    id v24 = v7;
  }
  else
  {
    double v23 = v3;
    id v24 = 0;
  }
  objc_storeWeak((id *)&self->_tapbackDecorationSource, v24);
}

- (PXGLayoutContentSource)decorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decorationSource);
  return (PXGLayoutContentSource *)WeakRetained;
}

- (int64_t)scrollableAxis
{
  id v2 = [(PXGDecoratingLayout *)self decoratedLayout];
  int64_t v3 = [v2 scrollableAxis];

  return v3;
}

- (void)_updateDecoratedLayout
{
  v4 = [(PXGDecoratingLayout *)self decoratedLayout];
  if (v4)
  {
    id v15 = v4;
    if (self->_isUpdatingDecoratedLayout)
    {
      unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PXGDecoratingLayout.m", 298, @"Invalid parameter not satisfying: %@", @"!_isUpdatingDecoratedLayout" object file lineNumber description];
    }
    self->_isUpdatingDecoratedLayout = 1;
    v5 = [(PXGLayout *)self viewEnvironment];
    [v15 setViewEnvironment:v5];

    [(PXGLayout *)self referenceSize];
    objc_msgSend(v15, "setReferenceSize:");
    [(PXGLayout *)self referenceDepth];
    objc_msgSend(v15, "setReferenceDepth:");
    [(PXGLayout *)self visibleRect];
    objc_msgSend(v15, "setVisibleRect:");
    [(PXGLayout *)self displayScale];
    objc_msgSend(v15, "setDisplayScale:");
    [(PXGLayout *)self safeAreaInsets];
    objc_msgSend(v15, "setSafeAreaInsets:");
    objc_msgSend(v15, "setUserInterfaceDirection:", -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection"));
    id v6 = [v15 createAnchorFromSuperlayoutWithSublayoutIndex:0 sublayoutPositionEdges:15 ignoringScrollingAnimationAnchors:0];
    id v7 = (id)[v6 autoInvalidate];

    [v15 updateIfNeeded];
    [v15 contentSize];
    double v9 = v8;
    double v11 = v10;
    id v12 = [(PXGLayout *)self sublayoutDataStore];
    uint64_t v13 = [v12 geometries];

    *(_OWORD *)(v13 + 48) = *(_OWORD *)off_1E5DAAF68;
    *(void *)(v13 + 64) = *((void *)off_1E5DAAF68 + 2);
    *(double *)(v13 + 32) = v9;
    *(double *)(v13 + 40) = v11;
    -[PXGLayout setContentSize:](self, "setContentSize:", v9, v11);
    [v15 visibleRect];
    -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:");
    v4 = v15;
    self->_isUpdatingDecoratedLayout = 0;
  }
}

- (id)itemsLayout
{
  id v2 = [(PXGDecoratingLayout *)self decoratedLayout];
  int64_t v3 = [v2 itemsLayout];

  return v3;
}

- (double)lastBaseline
{
  id v2 = [(PXGDecoratingLayout *)self decoratedLayout];
  [v2 lastBaseline];
  double v4 = v3;

  return v4;
}

- (void)visibleRectDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v8 visibleRectDidChange];
  if (!self->_isUpdatingDecoratedLayout)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout visibleRectDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGDecoratingLayout.m", 708, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v5 sublayoutDidChangeLastBaseline:a3];
  double v4 = [(PXGLayout *)self superlayout];
  [v4 sublayoutDidChangeLastBaseline:self];
}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v10 sublayoutDidChangeContentSize:v4];
  if (!self->_isUpdatingDecoratedLayout)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        double v9 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout sublayoutDidChangeContentSize:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGDecoratingLayout.m", 741, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (CGRect)sublayout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  objc_super v10 = [(PXGLayout *)self superlayout];
  if (v10)
  {
    double v11 = [(PXGLayout *)self superlayout];
    objc_msgSend(v11, "sublayout:visibleRectForRequestedVisibleRect:", v9, x, y, width, height);
    double x = v12;
    double y = v13;
    double width = v14;
    double height = v15;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v10 sublayoutNeedsUpdate:v4];
  if (!self->_isUpdatingDecoratedLayout)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        id v9 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout sublayoutNeedsUpdate:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGDecoratingLayout.m", 734, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGDecoratingLayout.m", 266, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout update]"];
      [v8 handleFailureInFunction:v9, @"PXGDecoratingLayout.m", 270, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGDecoratingLayout *)self _updateDecoratedLayout];
      if (!p_updateFlags->isPerformingUpdate)
      {
        double v16 = [MEMORY[0x1E4F28B00] currentHandler];
        double v17 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout update]"];
        [v16 handleFailureInFunction:v17, @"PXGDecoratingLayout.m", 274, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXGDecoratingLayout *)self _updateDecorationSources];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXGDecoratingLayout.m", 277, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXGDecoratingLayout *)self _updateReloadSprites];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      double v13 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXGDecoratingLayout.m", 280, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXGDecoratingLayout *)self _updateDecorationSprites];
      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout update]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXGDecoratingLayout.m", 283, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v18 update];
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGDecoratingLayout.m", 289, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)viewEnvironmentWillChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v13 viewEnvironmentWillChange:v4];
  objc_super v5 = [(PXGLayout *)self viewEnvironment];
  char v6 = [v5 hasEqualAppearanceTo:v4];

  if ((v6 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
LABEL_8:
        id v9 = [(PXGDecoratingLayout *)self decoratedLayout];
        [v9 invalidateDecoration];

        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 1;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.updated)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      double v12 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout viewEnvironmentWillChange:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXGDecoratingLayout.m", 694, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:
}

- (void)safeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v8 safeAreaInsetsDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout safeAreaInsetsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGDecoratingLayout.m", 719, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGDecoratingLayout.m", 701, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGDecoratingLayout.m", 714, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xC;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xC) != 0)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout setEnabled:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGDecoratingLayout.m", 208, @"invalidating %lu after it already has been updated", 12);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 12;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (BOOL)appliesAlphaToSublayouts
{
  return self->_appliesAlphaToSublayouts;
}

- (void)setDecorationSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decorationSource);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decorationSource, obj);
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
LABEL_8:
        objc_super v5 = obj;
        goto LABEL_9;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v10 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout setDecorationSource:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXGDecoratingLayout.m", 241, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    objc_super v5 = obj;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)setDecorationSizeClass:(int64_t)a3
{
  self->_decorationSizeClass = a3;
}

- (void)setContentSource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v10 setContentSource:v4];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout setContentSource:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGDecoratingLayout.m", 233, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_7:
}

- (void)setAppliesAlphaToSublayouts:(BOOL)a3
{
  self->_appliesAlphaToSublayouts = a3;
}

- (PXGDecoratingLayout)initWithDecoratedLayout:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PXGDecoratingLayout *)self init];
  [(PXGDecoratingLayout *)v5 setDecoratedLayout:v4];

  return v5;
}

- (PXGDecoratingLayout)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXGDecoratingLayout;
  id v2 = [(PXGLayout *)&v9 init];
  if (v2)
  {
    double v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    invalidatedDecoratedSpriteIndexes = v2->_invalidatedDecoratedSpriteIndexes;
    v2->_invalidatedDecoratedSpriteIndexes = v3;

    v2->_activeDecorationsCount = 5;
    objc_super v5 = (unsigned int *)malloc_type_calloc(5uLL, 4uLL, 0x100004052888210uLL);
    v2->_activeDecorationSpriteIndexes = v5;
    if (v2->_activeDecorationsCount)
    {
      unint64_t v6 = 0;
      do
        v5[v6++] = 0;
      while (v6 < v2->_activeDecorationsCount);
    }
    for (uint64_t i = 0; i != 5; ++i)
      v2->_activeDecorationSpriteIndexes[i] = i;
    v2->_enabled = 1;
    v2->_focusRingType = 1;
  }
  return v2;
}

- (void)setDecoratedLayout:(id)a3
{
  objc_super v5 = (PXGLayout *)a3;
  decoratedLayout = self->_decoratedLayout;
  if (decoratedLayout != v5)
  {
    objc_super v9 = v5;
    unint64_t v7 = decoratedLayout;
    objc_storeStrong((id *)&self->_decoratedLayout, a3);
    self->_isChangingDecoratedLayout = 1;
    if (v7) {
      [(PXGLayout *)self removeSublayoutAtIndex:0];
    }
    if (v9) {
      [(PXGDecoratingLayout *)self insertSublayout:v9 atIndex:0];
    }
    self->_isChangingDecoratedLayout = 0;
    objc_super v8 = [(PXGLayout *)self superlayout];
    [v8 sublayoutDidChangeLastBaseline:self];

    [(PXGLayout *)self setNeedsUpdateOfScrollableAxis];
    objc_super v5 = v9;
  }
}

uint64_t __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)(a1 + 44)) {
    BOOL v5 = HIDWORD(a2) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    unint64_t v6 = (_WORD *)(a5 + 32);
    unint64_t v7 = HIDWORD(a2);
    do
    {
      if (*((unsigned char *)v6 - 31) != 2) {
        ++*v6;
      }
      v6 += 20;
      --v7;
    }
    while (v7);
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 880), "addIndexesInRange:");
}

void __86__PXGDecoratingLayout__invalidateDecorationForSpriteRange_inLayout_invalidateSprites___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unint64_t v6 = (_WORD *)(a5 + 32);
    do
    {
      if (*((unsigned char *)v6 - 31) != 2) {
        ++*v6;
      }
      v6 += 20;
      --v5;
    }
    while (v5);
  }
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v7 = a3;
  BOOL isChangingDecoratedLayout = self->_isChangingDecoratedLayout;
  if (!a4)
  {
    self->_BOOL isChangingDecoratedLayout = 1;
    objc_storeStrong((id *)&self->_decoratedLayout, a3);
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        double v12 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v13 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout insertSublayout:atIndex:]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXGDecoratingLayout.m", 225, @"invalidating %lu after it already has been updated", 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 3;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
  v14.receiver = self;
  v14.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v14 insertSublayout:v7 atIndex:a4];
  self->_BOOL isChangingDecoratedLayout = isChangingDecoratedLayout;
}

uint64_t __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (HIDWORD(a2))
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    do
    {
      unint64_t v5 = (_OWORD *)(*(void *)(a3 + 24) + v4);
      long long v6 = *(_OWORD *)(a1 + 48);
      _OWORD *v5 = *(_OWORD *)(a1 + 32);
      v5[1] = v6;
      long long v7 = *(_OWORD *)(a1 + 64);
      long long v8 = *(_OWORD *)(a1 + 80);
      long long v9 = *(_OWORD *)(a1 + 112);
      v5[4] = *(_OWORD *)(a1 + 96);
      v5[5] = v9;
      v5[2] = v7;
      v5[3] = v8;
      long long v10 = *(_OWORD *)(a1 + 128);
      long long v11 = *(_OWORD *)(a1 + 144);
      long long v12 = *(_OWORD *)(a1 + 176);
      v5[8] = *(_OWORD *)(a1 + 160);
      v5[9] = v12;
      v5[6] = v10;
      v5[7] = v11;
      uint64_t v13 = *(void *)(a3 + 32) + v3;
      long long v14 = *(_OWORD *)(a1 + 200);
      long long v15 = *(_OWORD *)(a1 + 216);
      *(void *)(v13 + 32) = *(void *)(a1 + 232);
      *(_OWORD *)uint64_t v13 = v14;
      *(_OWORD *)(v13 + 16) = v15;
      v4 += 160;
      v3 += 40;
    }
    while (160 * HIDWORD(a2) != v4);
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 192) + 880), "addIndexesInRange:");
}

- (void)_updateDecorationSprites
{
  uint64_t v3 = [(PXGDecoratingLayout *)self decoratedLayout];
  if (v3
    && [(NSMutableIndexSet *)self->_invalidatedDecoratedSpriteIndexes count]
    && [(PXGDecoratingLayout *)self enabled])
  {
    unsigned int v4 = [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
    if (v4)
    {
      unsigned int v5 = v4;
      [(PXGLayout *)self alpha];
      uint64_t v7 = v6;
      activeDecorationSpriteIndexes = self->_activeDecorationSpriteIndexes;
      BOOL v21 = [(PXGDecoratingLayout *)self scrollableAxis] == 2
         && [(PXGLayout *)self userInterfaceDirection] == 1;
      long long v8 = [(PXGDecoratingLayout *)self itemsLayout];
      id v20 = [v8 insetDelegate];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_assetBackgroundDecorationSource);
      id v10 = objc_loadWeakRetained((id *)&self->_selectionDecorationSource);
      id v11 = objc_loadWeakRetained((id *)&self->_tapbackDecorationSource);
      char v12 = [v3 shouldDecorateUndefinedMediaKind];
      char v13 = [v3 shouldUpdateDecorationMediaTargetSizes];
      invalidatedDecoratedSpriteIndexes = self->_invalidatedDecoratedSpriteIndexes;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke;
      v23[3] = &unk_1E5DC54F0;
      id v24 = v3;
      id v25 = v8;
      id v26 = WeakRetained;
      double v27 = self;
      unsigned int v33 = v5;
      BOOL v34 = v21;
      char v35 = v12;
      id v28 = v20;
      id v29 = v10;
      id v30 = v11;
      float v31 = activeDecorationSpriteIndexes;
      uint64_t v32 = v7;
      char v36 = v13;
      id v14 = v11;
      id v15 = v10;
      id v16 = v20;
      id v17 = WeakRetained;
      id v18 = v8;
      [(NSMutableIndexSet *)invalidatedDecoratedSpriteIndexes enumerateRangesUsingBlock:v23];
      [(NSMutableIndexSet *)self->_invalidatedDecoratedSpriteIndexes removeAllIndexes];
    }
    else
    {
      [(NSMutableIndexSet *)self->_invalidatedDecoratedSpriteIndexes removeAllIndexes];
    }
  }
}

- (void)_invalidateDecorationForSpriteRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4 invalidateSprites:(BOOL)a5
{
  id v21 = a4;
  id v8 = [(PXGDecoratingLayout *)self decoratedLayout];
  if (v8 != v21)
  {

    goto LABEL_19;
  }
  BOOL v9 = [(PXGDecoratingLayout *)self spritesAreInSyncWithDecoratedLayout];

  if (v9)
  {
    if (!a5) {
      goto LABEL_12;
    }
    invalidatedDecoratedSpriteIndexes = self->_invalidatedDecoratedSpriteIndexes;
    id v11 = [(PXGDecoratingLayout *)self decoratedLayout];
    -[NSMutableIndexSet addIndexesInRange:](invalidatedDecoratedSpriteIndexes, "addIndexesInRange:", 0, [v11 localNumberOfSprites]);

    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_11:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
LABEL_12:
        id v14 = &self->_updateFlags;
        unint64_t v15 = self->_updateFlags.needsUpdate;
        if (v15)
        {
          if (!self->_updateFlags.isPerformingUpdate) {
            goto LABEL_17;
          }
        }
        else if (!self->_updateFlags.isPerformingUpdate)
        {
          BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
          v14->unint64_t needsUpdate = 2;
          if (!willPerformUpdate) {
            [(PXGLayout *)self setNeedsUpdate];
          }
          goto LABEL_18;
        }
        if ((self->_updateFlags.updated & 2) == 0)
        {
LABEL_17:
          v14->unint64_t needsUpdate = v15 | 2;
LABEL_18:
          unsigned int v16 = [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
          [(PXGLayout *)self modifySpritesInRange:(v16 * a3.location) | ((unint64_t)(v16 * a3.length) << 32) state:&__block_literal_global_209746];
          goto LABEL_19;
        }
        double v19 = [MEMORY[0x1E4F28B00] currentHandler];
        id v20 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout _invalidateDecorationForSpriteRange:inLayout:invalidateSprites:]"];
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"PXGDecoratingLayout.m", 833, @"invalidating %lu after it already has been updated", 2);
LABEL_28:

        abort();
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL v18 = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 8;
      if (!v18) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_12;
    }
    if ((self->_updateFlags.updated & 8) != 0)
    {
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      id v20 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout _invalidateDecorationForSpriteRange:inLayout:invalidateSprites:]"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"PXGDecoratingLayout.m", 830, @"invalidating %lu after it already has been updated", 8);
      goto LABEL_28;
    }
    goto LABEL_11;
  }
LABEL_19:
}

- (void)_applyDecoratedLayoutChangeDetails:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(PXGDecoratingLayout *)self decoratedLayout];
  BOOL v6 = [(PXGDecoratingLayout *)self enabled];
  unsigned int v7 = v6;
  if (v4) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = [v5 shouldInvalidateDecorationForModifiedSprites];
  if (v7) {
    unsigned int v7 = [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
  }
  uint64_t v10 = [v5 localNumberOfSprites] * v7;
  if (v8)
  {
    [v4 applyToIndexSet:self->_invalidatedDecoratedSpriteIndexes];
    id v11 = [v4 changeDetailsShiftedBy:0 scaledBy:v7];
  }
  else
  {
    unsigned int v12 = [(PXGLayout *)self localNumberOfSprites];
    id v13 = objc_alloc((Class)off_1E5DA5568);
    id v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v12);
    unint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v10);
    id v11 = (void *)[v13 initWithIncrementalChangeDetailsRemovedIndexes:v14 insertedIndexes:v15 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

    [(NSMutableIndexSet *)self->_invalidatedDecoratedSpriteIndexes removeAllIndexes];
  }
  long long v16 = *((_OWORD *)off_1E5DAAF90 + 7);
  long long v37 = *((_OWORD *)off_1E5DAAF90 + 6);
  long long v38 = v16;
  long long v17 = *((_OWORD *)off_1E5DAAF90 + 9);
  long long v39 = *((_OWORD *)off_1E5DAAF90 + 8);
  long long v40 = v17;
  long long v18 = *((_OWORD *)off_1E5DAAF90 + 3);
  long long v33 = *((_OWORD *)off_1E5DAAF90 + 2);
  long long v34 = v18;
  long long v19 = *((_OWORD *)off_1E5DAAF90 + 5);
  long long v35 = *((_OWORD *)off_1E5DAAF90 + 4);
  long long v36 = v19;
  long long v20 = *((_OWORD *)off_1E5DAAF90 + 1);
  long long v31 = *(_OWORD *)off_1E5DAAF90;
  long long v32 = v20;
  char v21 = *(unsigned char *)off_1E5DAAF88;
  *(void *)float v44 = *(void *)((char *)off_1E5DAAF88 + 2);
  *(void *)&v44[6] = *((void *)off_1E5DAAF88 + 1);
  long long v46 = *(_OWORD *)((char *)off_1E5DAAF88 + 20);
  int v47 = *((_DWORD *)off_1E5DAAF88 + 9);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke;
  v30[3] = &unk_1E5DC5518;
  char v42 = v21;
  char v43 = 8;
  float32x2_t v41 = self;
  int v45 = 1065353216;
  unsigned int v48 = v7;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke_2;
  v27[3] = &unk_1E5DC5540;
  char v29 = v9;
  v27[4] = self;
  unsigned int v28 = v7;
  [(PXGLayout *)self applySpriteChangeDetails:v11 countAfterChanges:v10 initialState:v30 modifyState:v27];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_14:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      goto LABEL_15;
    }
LABEL_13:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      id v25 = [MEMORY[0x1E4F28B00] currentHandler];
      id v26 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout _applyDecoratedLayoutChangeDetails:]"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"PXGDecoratingLayout.m", 809, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_14;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_13;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_15:
}

- (BOOL)spritesAreInSyncWithDecoratedLayout
{
  BOOL v3 = [(PXGDecoratingLayout *)self enabled];
  if (v3) {
    LOBYTE(v3) = (self->_updateFlags.needsUpdate & 4) == 0;
  }
  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

void __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v12 = a7;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  int v42 = a2;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v40 = [*(id *)(a1 + 32) itemForSpriteIndex:a2];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = a6;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  char v35 = [*(id *)(a1 + 40) wantsBackgroundForZeroInset];
  id v13 = *(void **)(a1 + 48);
  unint64_t v14 = (*(_DWORD *)(a1 + 104) * a2) | ((unint64_t)(*(_DWORD *)(a1 + 104)
                                                                                     * HIDWORD(a2)) << 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_3;
  v16[3] = &unk_1E5DC54A0;
  v16[4] = v13;
  id v17 = *(id *)(a1 + 40);
  double v23 = v41;
  id v24 = v38;
  int v31 = *(_DWORD *)(a1 + 104);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 32);
  id v25 = v39;
  id v26 = v34;
  uint64_t v15 = *(void *)(a1 + 88);
  __int16 v32 = *(_WORD *)(a1 + 108);
  double v27 = v37;
  unsigned int v28 = v36;
  uint64_t v29 = v15;
  id v20 = *(id *)(a1 + 64);
  id v21 = *(id *)(a1 + 72);
  id v22 = *(id *)(a1 + 80);
  uint64_t v30 = *(void *)(a1 + 96);
  char v33 = *(unsigned char *)(a1 + 110);
  [v13 modifySpritesInRange:v14 state:v16];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

void __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t v4 = a2 | ((unint64_t)a3 << 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_2;
  v11[3] = &unk_1E5DC54C8;
  unsigned int v5 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  BOOL v8 = *(void **)(a1 + 64);
  id v13 = v6;
  uint64_t v14 = v7;
  int v21 = *(_DWORD *)(a1 + 104);
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 88);
  id v15 = v9;
  uint64_t v19 = v10;
  __int16 v22 = *(_WORD *)(a1 + 108);
  id v16 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 80);
  uint64_t v20 = *(void *)(a1 + 96);
  char v23 = *(unsigned char *)(a1 + 110);
  [v5 enumerateSpritesInRange:v4 usingBlock:v11];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapbackDecorationSource);
  objc_destroyWeak((id *)&self->_viewDecorationSource);
  objc_destroyWeak((id *)&self->_debugDecorationSource);
  objc_destroyWeak((id *)&self->_dragDecorationSource);
  objc_destroyWeak((id *)&self->_solidColorOverlayDecorationSource);
  objc_destroyWeak((id *)&self->_highlightDecorationSource);
  objc_destroyWeak((id *)&self->_selectionDecorationSource);
  objc_destroyWeak((id *)&self->_captionDecorationSource);
  objc_destroyWeak((id *)&self->_assetProgressDecorationSource);
  objc_destroyWeak((id *)&self->_assetBackgroundDecorationSource);
  objc_destroyWeak((id *)&self->_assetBadgeDecorationSource);
  objc_destroyWeak((id *)&self->_decorationSource);
  objc_storeStrong((id *)&self->_decoratedLayout, 0);
  objc_storeStrong((id *)&self->_shadowDecorationSource, 0);
  objc_storeStrong((id *)&self->_shadowSource, 0);
  objc_storeStrong((id *)&self->_pendingActiveDecorationSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_invalidatedDecoratedSpriteIndexes, 0);
}

- (PXGTapbackDecorationSource)tapbackDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapbackDecorationSource);
  return (PXGTapbackDecorationSource *)WeakRetained;
}

- (PXGCaptionDecorationSource)captionDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captionDecorationSource);
  return (PXGCaptionDecorationSource *)WeakRetained;
}

- (PXGAssetBackgroundDecorationSource)assetBackgroundDecorationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetBackgroundDecorationSource);
  return (PXGAssetBackgroundDecorationSource *)WeakRetained;
}

- (void)setAllowsViewDecorationHitTesting:(BOOL)a3
{
  self->_allowsViewDecorationHitTesting = a3;
}

- (BOOL)allowsViewDecorationHitTesting
{
  return self->_allowsViewDecorationHitTesting;
}

- (id)preferredFocusLayouts
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXGDecoratingLayout *)self decoratedLayout];

  if (v3)
  {
    unint64_t v4 = [(PXGDecoratingLayout *)self decoratedLayout];
    v8[0] = v4;
    unsigned int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXGDecoratingLayout;
    unsigned int v5 = [(PXGLayout *)&v7 preferredFocusLayouts];
  }
  return v5;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(PXGLayout *)self spriteDataStore];
  if ([v5 count] > v3
    && [(PXGDecoratingLayout *)self decorationIndexForSpriteIndex:v3] == 3)
  {
    id v6 = +[PXGReusableAXInfo sharedPool];
    objc_super v7 = [v6 checkOutReusableObjectWithReuseIdentifier:1];
    id v8 = v5;
    id v9 = (long long *)([v8 geometries] + 32 * v3);
    long long v10 = v9[1];
    long long v20 = *v9;
    long long v21 = v10;
    id v11 = (long long *)([v8 styles] + 160 * v3);
    long long v12 = v11[7];
    long long v29 = v11[6];
    long long v30 = v12;
    long long v13 = v11[9];
    long long v31 = v11[8];
    long long v32 = v13;
    long long v14 = v11[3];
    long long v25 = v11[2];
    long long v26 = v14;
    long long v15 = v11[5];
    long long v27 = v11[4];
    long long v28 = v15;
    long long v16 = v11[1];
    long long v23 = *v11;
    long long v24 = v16;
    [v7 setSpriteIndex:v3];
    v19[0] = v20;
    v19[1] = v21;
    [v7 setSpriteGeometry:v19];
    v22[6] = v29;
    v22[7] = v30;
    v22[8] = v31;
    v22[9] = v32;
    v22[2] = v25;
    v22[3] = v26;
    v22[4] = v27;
    v22[5] = v28;
    v22[0] = v23;
    v22[1] = v24;
    [v7 setSpriteStyle:v22];
    id v17 = [(PXGLayout *)self axGroup];
    [v7 setAxContainingGroup:v17];

    [v7 setContent:0 ofContentKind:5];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (unsigned)decoratedIndexForDecoratingIndex:(unsigned int)a3
{
  return a3
       / [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
}

- (void)addActiveDecorations:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 count];
  unsigned int v5 = v9;
  if (v4)
  {
    id v6 = (void *)[v9 mutableCopy];
    if (self->_activeDecorationsCount)
    {
      unint64_t v7 = 0;
      do
      {
        id v8 = [NSNumber numberWithInteger:_DecorationTypeForIndex(self->_activeDecorationSpriteIndexes[v7])];
        [v6 addObject:v8];

        ++v7;
      }
      while (v7 < self->_activeDecorationsCount);
    }
    [(PXGDecoratingLayout *)self setActiveDecorations:v6];

    unsigned int v5 = v9;
  }
}

- (void)setActiveDecorations:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [MEMORY[0x1E4F28E60] indexSet];
  pendingActiveDecorationSpriteIndexes = self->_pendingActiveDecorationSpriteIndexes;
  self->_pendingActiveDecorationSpriteIndexes = v5;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableIndexSet addIndex:](self->_pendingActiveDecorationSpriteIndexes, "addIndex:", _DecorationIndexForType([*(id *)(*((void *)&v17 + 1) + 8 * i) integerValue]));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_13:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xC;
      goto LABEL_14;
    }
LABEL_12:
    if ((self->_updateFlags.updated & 0xC) != 0)
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v16 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout setActiveDecorations:]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PXGDecoratingLayout.m", 967, @"invalidating %lu after it already has been updated", 12);

      abort();
    }
    goto LABEL_13;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_12;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 12;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_14:
}

- (BOOL)canHandleVisibleRectRejection
{
  id v2 = [(PXGDecoratingLayout *)self itemsLayout];
  char v3 = [v2 canHandleVisibleRectRejection];

  return v3;
}

- (PXGItemsGeometry)itemsGeometry
{
  id v2 = [(PXGDecoratingLayout *)self itemsLayout];
  char v3 = [v2 itemsGeometry];

  return (PXGItemsGeometry *)v3;
}

- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4
{
  unsigned int v8 = [(PXGLayout *)self localNumberOfSprites];
  unsigned int v9 = a3;
  if (v8 > a3)
  {
    uint64_t v10 = a3
        / [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
    id v11 = [(PXGDecoratingLayout *)self decoratedLayout];
    if (!v11)
    {
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PXGDecoratingLayout.m", 933, @"Invalid parameter not satisfying: %@", @"decoratedLayout != nil" object file lineNumber description];
    }
    unsigned int v9 = [(PXGLayout *)self convertSpriteIndex:v10 fromDescendantLayout:v11];
  }
  if (a4) {
    *a4 = v9;
  }
  return v8 > a3;
}

- (unsigned)spriteIndexForDecorationIndex:(unsigned int)a3 decoratingSpriteIndex:(unsigned int)a4
{
  unsigned int v6 = [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite]* a4;
  if (v6 >= [(PXGLayout *)self localNumberOfSprites]) {
    return -1;
  }
  else {
    return v6 + a3;
  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(PXGDecoratingLayout *)self decoratedLayout];
  unsigned int v6 = (void *)v5;
  id v7 = 0;
  if (v3 != -1 && v5)
  {
    uint64_t v8 = [(PXGLayout *)self convertSpriteIndex:v3 toDescendantLayout:v5];
    if (v8 != -1)
    {
      uint64_t v9 = v8;
      uint64_t v10 = v6;
LABEL_5:
      id v7 = [v10 hitTestResultForSpriteIndex:v9];
      goto LABEL_12;
    }
    if ([(PXGLayout *)self localNumberOfSprites] > v3)
    {
      unsigned int v11 = v3
          % [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
      uint64_t v12 = v3
          / [(PXGDecoratingLayout *)self numberOfDecoratingSpritesPerDecoratedSprite];
      BOOL v13 = [(PXGDecoratingLayout *)self allowsViewDecorationHitTesting];
      unsigned int v14 = self->_activeDecorationSpriteIndexes[v11];
      if (v13 && v14 == 3)
      {
        long long v15 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v3];
        long long v16 = [PXGHitTestResult alloc];
        long long v17 = [v6 objectReferenceForSpriteIndex:v12];
        id v7 = [(PXGHitTestResult *)v16 initWithSpriteReference:v15 layout:self identifier:@"PXGHitTestUserDataIdentifierDecorationView" userData:v17];

        goto LABEL_12;
      }
      if (v14 != 6)
      {
        uint64_t v10 = v6;
        uint64_t v9 = v12;
        goto LABEL_5;
      }
    }
    id v7 = 0;
  }
LABEL_12:

  return v7;
}

- (void)setLastBaseline:(double)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  unsigned int v6 = [(PXGDecoratingLayout *)self decoratedLayout];
  [v5 handleFailureInMethod:a2, self, @"PXGDecoratingLayout.m", 880, @"baseline shouldn't be set on %@, did you mean to set it on %@ instead?", self, v6 object file lineNumber description];

  abort();
}

- (id)currentDataSourceChange
{
  id v2 = [(PXGDecoratingLayout *)self decoratedLayout];
  uint64_t v3 = [v2 currentDataSourceChange];

  return v3;
}

- (id)layoutForItemChanges
{
  id v2 = [(PXGDecoratingLayout *)self decoratedLayout];
  uint64_t v3 = [v2 layoutForItemChanges];

  return v3;
}

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (void)userInterfaceDirectionDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v8 userInterfaceDirectionDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 9;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 9) != 0)
    {
      unsigned int v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout userInterfaceDirectionDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGDecoratingLayout.m", 724, @"invalidating %lu after it already has been updated", 9);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 9;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)alphaDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v10 alphaDidChange];
  invalidatedDecoratedSpriteIndexes = self->_invalidatedDecoratedSpriteIndexes;
  id v4 = [(PXGDecoratingLayout *)self decoratedLayout];
  -[NSMutableIndexSet addIndexesInRange:](invalidatedDecoratedSpriteIndexes, "addIndexesInRange:", 0, [v4 localNumberOfSprites]);

  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PXGDecoratingLayout alphaDidChange]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGDecoratingLayout.m", 688, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateReloadSprites
{
  pendingActiveDecorationSpriteIndexes = self->_pendingActiveDecorationSpriteIndexes;
  if (pendingActiveDecorationSpriteIndexes)
  {
    uint64_t v5 = [(NSMutableIndexSet *)pendingActiveDecorationSpriteIndexes count];
    if (v5
      && (unint64_t)[(NSMutableIndexSet *)self->_pendingActiveDecorationSpriteIndexes lastIndex] >= 9)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PXGDecoratingLayout.m", 450, @"Invalid parameter not satisfying: %@", @"pendingCount == 0 || _pendingActiveDecorationSpriteIndexes.lastIndex < PXGDecoratingLayoutMaxNumberOfDecoratingSpritesPerDecoratedSprite" object file lineNumber description];
    }
    if (v5 != self->_activeDecorationsCount)
    {
      self->_activeDecorationsCount = v5;
      _PXGArrayResize();
    }
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    unsigned int v6 = self->_pendingActiveDecorationSpriteIndexes;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__PXGDecoratingLayout__updateReloadSprites__block_invoke;
    v9[3] = &unk_1E5DC5478;
    v9[4] = self;
    v9[5] = v10;
    [(NSMutableIndexSet *)v6 enumerateIndexesUsingBlock:v9];
    id v7 = self->_pendingActiveDecorationSpriteIndexes;
    self->_pendingActiveDecorationSpriteIndexes = 0;

    _Block_object_dispose(v10, 8);
  }
  [(PXGDecoratingLayout *)self _applyDecoratedLayoutChangeDetails:0];
}

uint64_t __43__PXGDecoratingLayout__updateReloadSprites__block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 888);
  uint64_t v3 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v4 = *(unsigned int *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  return result;
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  BOOL isChangingDecoratedLayout = self->_isChangingDecoratedLayout;
  if (!a3.location) {
    self->_BOOL isChangingDecoratedLayout = 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v5 removeSublayoutsInRange:sel_removeSublayoutsInRange_];
  self->_BOOL isChangingDecoratedLayout = isChangingDecoratedLayout;
}

- (id)description
{
  uint64_t v3 = [(PXGDecoratingLayout *)self decoratedLayout];
  v9.receiver = self;
  v9.super_class = (Class)PXGDecoratingLayout;
  uint64_t v4 = [(PXGDecoratingLayout *)&v9 description];
  objc_super v5 = (objc_class *)objc_opt_class();
  unsigned int v6 = NSStringFromClass(v5);
  id v7 = objc_msgSend(v4, "px_stringByAppendingDescriptionDetailsWithFormat:", @", decoratedLayout=<%@: %p>", v6, v3);

  return v7;
}

- (void)dealloc
{
  free(self->_activeDecorationSpriteIndexes);
  v3.receiver = self;
  v3.super_class = (Class)PXGDecoratingLayout;
  [(PXGLayout *)&v3 dealloc];
}

@end