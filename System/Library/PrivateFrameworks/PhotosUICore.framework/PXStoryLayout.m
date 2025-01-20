@interface PXStoryLayout
- (BOOL)allowsRepeatedSublayoutsUpdates;
- (NSShadow)shadow;
- (PXGExposureBlurEffect)overlayBlurEffect;
- (PXGHostingControllerProposedSize)pendingSizeChange;
- (PXGItemPlacement)fullsizeContentPlacementOverride;
- (PXGLayout)accessoryItemPlacementLayout;
- (PXGLayout)diagnosticOverlayLayout;
- (PXGLayout)fullsizeLayout;
- (PXStoryFadeOverlayLayout)fadeOverlayLayout;
- (PXStoryFullsizeLayout)currentFullsizePlayerLayout;
- (PXStoryFullsizeLayout)thumbnailFullsizeLayout;
- (PXStoryLayout)init;
- (PXStoryLayout)initWithModel:(id)a3;
- (PXStoryModel)model;
- (PXStoryScrollLayout)scrollLayout;
- (PXStoryStyleSwitchingFullsizeLayout)styleSwitchingFullsizeLayout;
- (PXStoryThumbnailChromeLayout)thumbnailChromeLayout;
- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (double)relativeZPositionAboveLegibilityGradients;
- (id)diagnosticsItemProvidersInRect:(CGRect)a3;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)itemReference;
- (id)placementInContext:(id)a3 forItemReference:(id)a4;
- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)diagnosticOverlayLayoutIndex;
- (int64_t)fadeOverlayLayoutIndex;
- (int64_t)fullsizeLayoutIndex;
- (int64_t)scrollLayoutIndex;
- (int64_t)scrollableAxis;
- (int64_t)thumbnailChromeLayoutIndex;
- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)contentChangeTrend;
- (unsigned)contentCaptureSpriteIndex;
- (unsigned)representingSpriteIndex;
- (unsigned)shadowSpriteIndex;
- (void)_acceptAnyPendingSizeChange;
- (void)_invalidateAXGroupRole;
- (void)_invalidateContent;
- (void)_invalidateContentCapture;
- (void)_invalidateOverlayBlurEffect;
- (void)_invalidateShadow;
- (void)_setFrame:(CGRect)a3 relativeZPosition:(double)a4 depth:(double)a5 forSublayoutAtIndex:(int64_t)a6;
- (void)_updateAXGroupRole;
- (void)_updateContent;
- (void)_updateContentCapture;
- (void)_updateOverlayBlurEffect;
- (void)_updateShadow;
- (void)alphaDidChange;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didUpdate;
- (void)entityManagerDidChange;
- (void)enumerateSublayoutsForDetailedPlacement:(id)a3 ofItemWithReference:(id)a4 usingBlock:(id)a5;
- (void)hostingControllerCanceledPreviouslyProposedReferenceSize;
- (void)hostingControllerDidChangeReferenceSize:(CGSize)a3;
- (void)hostingControllerProposedReferenceSize:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setAccessoryItemPlacementLayout:(id)a3;
- (void)setDiagnosticOverlayLayout:(id)a3;
- (void)setFullsizeContentPlacementOverride:(id)a3;
- (void)setOverlayBlurEffect:(id)a3;
- (void)setPendingSizeChange:(id)a3;
- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3;
- (void)setShadow:(id)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXStoryLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticOverlayLayout, 0);
  objc_destroyWeak((id *)&self->_accessoryItemPlacementLayout);
  objc_storeStrong((id *)&self->_fullsizeContentPlacementOverride, 0);
  objc_storeStrong((id *)&self->_pendingSizeChange, 0);
  objc_storeStrong((id *)&self->_overlayBlurEffect, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_thumbnailChromeLayout, 0);
  objc_storeStrong((id *)&self->_scrollLayout, 0);
  objc_storeStrong((id *)&self->_fadeOverlayLayout, 0);
  objc_storeStrong((id *)&self->_fullsizeLayout, 0);
  objc_storeStrong((id *)&self->_thumbnailFullsizeLayout, 0);
  objc_storeStrong((id *)&self->_styleSwitchingFullsizeLayout, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (PXGLayout)diagnosticOverlayLayout
{
  return self->_diagnosticOverlayLayout;
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (void)setAccessoryItemPlacementLayout:(id)a3
{
}

- (PXGLayout)accessoryItemPlacementLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryItemPlacementLayout);
  return (PXGLayout *)WeakRetained;
}

- (PXGItemPlacement)fullsizeContentPlacementOverride
{
  return self->_fullsizeContentPlacementOverride;
}

- (void)setPendingSizeChange:(id)a3
{
}

- (PXGHostingControllerProposedSize)pendingSizeChange
{
  return self->_pendingSizeChange;
}

- (PXGExposureBlurEffect)overlayBlurEffect
{
  return self->_overlayBlurEffect;
}

- (unsigned)contentCaptureSpriteIndex
{
  return self->_contentCaptureSpriteIndex;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (unsigned)shadowSpriteIndex
{
  return self->_shadowSpriteIndex;
}

- (int64_t)diagnosticOverlayLayoutIndex
{
  return self->_diagnosticOverlayLayoutIndex;
}

- (int64_t)fadeOverlayLayoutIndex
{
  return self->_fadeOverlayLayoutIndex;
}

- (int64_t)thumbnailChromeLayoutIndex
{
  return self->_thumbnailChromeLayoutIndex;
}

- (int64_t)scrollLayoutIndex
{
  return self->_scrollLayoutIndex;
}

- (int64_t)fullsizeLayoutIndex
{
  return self->_fullsizeLayoutIndex;
}

- (PXStoryThumbnailChromeLayout)thumbnailChromeLayout
{
  return self->_thumbnailChromeLayout;
}

- (PXStoryScrollLayout)scrollLayout
{
  return self->_scrollLayout;
}

- (PXStoryFadeOverlayLayout)fadeOverlayLayout
{
  return self->_fadeOverlayLayout;
}

- (PXGLayout)fullsizeLayout
{
  return self->_fullsizeLayout;
}

- (PXStoryFullsizeLayout)thumbnailFullsizeLayout
{
  return self->_thumbnailFullsizeLayout;
}

- (PXStoryStyleSwitchingFullsizeLayout)styleSwitchingFullsizeLayout
{
  return self->_styleSwitchingFullsizeLayout;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (id)diagnosticsItemProvidersInRect:(CGRect)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(PXStoryLayout *)self model];
  v6 = [v5 currentAssetCollection];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = +[PXDiagnosticsItemProvider providerWithItem:v6 identifier:@"PXDiagnosticsItemIdentifierAssetCollection"];
    [v4 addObject:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = +[PXDiagnosticsItemProvider providerWithItem:v6 identifier:@"PXDiagnosticsItemIdentifierMemory"];
    [v4 addObject:v8];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryLayout *)self currentFullsizePlayerLayout];
  [v4 addSubprovider:v5];
}

- (void)enumerateSublayoutsForDetailedPlacement:(id)a3 ofItemWithReference:(id)a4 usingBlock:(id)a5
{
  id v12 = a4;
  v7 = (void (**)(id, void *, id))a5;
  v8 = [(PXStoryLayout *)self itemReference];
  int v9 = [v12 isEqual:v8];

  if (v9)
  {
    v10 = [(PXStoryLayout *)self currentFullsizePlayerLayout];
    v7[2](v7, v10, v12);

    v11 = [(PXStoryLayout *)self thumbnailChromeLayout];
    if (v11) {
      v7[2](v7, v11, v12);
    }
  }
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXStoryLayout *)self itemReference];
  int v9 = [v7 isEqual:v8];

  if (!v9) {
    PXAssertGetLog();
  }
  if ([v6 hasGeometry]) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }
  [(PXStoryLayout *)self setFullsizeContentPlacementOverride:v10];
  [(PXGLayout *)self setDetailedPlacementOverride:v6 forItemReference:v7];
  v11 = [(PXStoryLayout *)self accessoryItemPlacementLayout];
  [v11 setDetailedPlacementOverride:v6 forItemReference:v7];
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXStoryLayout *)self itemReference];
  int v9 = [v7 isEqual:v8];

  if (!v9) {
    PXAssertGetLog();
  }
  id v10 = [PXGItemPlacement alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__PXStoryLayout_placementInContext_forItemReference___block_invoke;
  v13[3] = &unk_1E5DC5CC0;
  v13[4] = self;
  id v14 = v7;
  v11 = [(PXGItemPlacement *)v10 initWithContext:v6 configuration:v13];

  return v11;
}

void __53__PXStoryLayout_placementInContext_forItemReference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(double **)(a1 + 32);
  id v12 = v3;
  objc_msgSend(v3, "setRect:velocity:inLayout:", v4[129], v4[130], v4[131], v4[132], v4[133], v4[134], v4[135], v4[136]);
  id v5 = [*(id *)(a1 + 32) model];
  id v6 = [v5 visibleDisplayAssets];

  if ([v6 count] == 1)
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    [v12 setDisplayedAsset:v7];
  }
  [*(id *)(a1 + 32) getDetailedPresentedPlacement:v12 forItemReference:*(void *)(a1 + 40)];
  v8 = [*(id *)(a1 + 32) accessoryItemPlacementLayout];
  [v8 getDetailedPresentedPlacement:v12 forItemReference:*(void *)(a1 + 40)];

  int v9 = [*(id *)(a1 + 32) model];
  char v10 = [v9 options];
  double v11 = 0.0;
  if ((v10 & 2) == 0) {
    *(float *)&double v11 = 1.0;
  }
  [v12 setSoundVolume:v11];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)ModelObservationContext_213880 != a5)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXStoryLayout.m" lineNumber:639 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 0x10000) != 0) {
    [(PXStoryLayout *)self _invalidateAXGroupRole];
  }
  if ((a4 & 0x2000) != 0) {
    [(PXStoryLayout *)self _invalidateShadow];
  }
  if ((a4 & 0x8000000000410000) != 0) {
    [(PXStoryLayout *)self _invalidateContent];
  }
  if ((a4 & 0x20) != 0) {
    [(PXStoryLayout *)self _acceptAnyPendingSizeChange];
  }
}

- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if ([(PXStoryLayout *)self shadowSpriteIndex] != a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStoryLayout.m" lineNumber:612 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = [(PXStoryLayout *)self model];
  int v9 = [v8 layoutSpec];
  [v9 thumbnailCornerRadius];
  double v11 = v10;

  return v11;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if ([(PXStoryLayout *)self shadowSpriteIndex] != a3)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryLayout.m" lineNumber:604 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = [(PXStoryLayout *)self shadow];

  return v8;
}

- (void)_acceptAnyPendingSizeChange
{
  id v3 = [(PXStoryLayout *)self pendingSizeChange];
  if (v3)
  {
    [(PXStoryLayout *)self setPendingSizeChange:0];
    [v3 willAccept];
    id v4 = [(PXGLayout *)self layoutQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PXStoryLayout__acceptAnyPendingSizeChange__block_invoke;
    block[3] = &unk_1E5DD36F8;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __44__PXStoryLayout__acceptAnyPendingSizeChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accept];
}

- (void)hostingControllerDidChangeReferenceSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryLayout;
  -[PXGLayout hostingControllerDidChangeReferenceSize:](&v9, sel_hostingControllerDidChangeReferenceSize_);
  id v6 = [(PXStoryLayout *)self model];
  id v7 = [v6 extendedTraitCollection];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PXStoryLayout_hostingControllerDidChangeReferenceSize___block_invoke;
    v8[3] = &__block_descriptor_48_e49_v16__0___PXStoryMutableExtendedTraitCollection__8l;
    *(CGFloat *)&v8[4] = width;
    *(CGFloat *)&v8[5] = height;
    [v7 performChanges:v8];
  }
}

uint64_t __57__PXStoryLayout_hostingControllerDidChangeReferenceSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutReferenceSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)hostingControllerCanceledPreviouslyProposedReferenceSize
{
}

- (void)hostingControllerProposedReferenceSize:(id)a3
{
}

- (void)_setFrame:(CGRect)a3 relativeZPosition:(double)a4 depth:(double)a5 forSublayoutAtIndex:(int64_t)a6
{
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    [(PXGLayout *)self referenceDepth];
    double v16 = v15;
    -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", a6, x, y, width, height);
    [(PXGAbsoluteCompositeLayout *)self setZPosition:a6 forSublayoutAtIndex:-(a4 * v16)];
    [(PXGAbsoluteCompositeLayout *)self setReferenceDepth:a6 forSublayoutAtIndex:v16 * a5];
  }
}

- (void)_updateAXGroupRole
{
  id v3 = [(PXStoryLayout *)self model];
  BOOL v4 = [v3 viewMode] != 4;

  id v5 = [(PXGLayout *)self axGroup];
  [v5 setAxRole:v4];
}

- (void)_invalidateAXGroupRole
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryLayout _invalidateAXGroupRole]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryLayout.m", 534, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContentCapture
{
  if (self->_contentCaptureSpriteIndex != -1)
  {
    id v3 = [(PXStoryLayout *)self overlayBlurEffect];

    if (v3)
    {
      [(PXGLayout *)self visibleRect];
      uint64_t v5 = v4;
      uint64_t v7 = v6;
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      [(PXGLayout *)self displayScale];
      contentCaptureSpriteIndedouble x = self->_contentCaptureSpriteIndex;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __38__PXStoryLayout__updateContentCapture__block_invoke;
      v14[3] = &unk_1E5DC5C78;
      v14[5] = v5;
      v14[6] = v7;
      v14[7] = v9;
      v14[8] = v11;
      v14[9] = v13;
      v14[4] = self;
      [(PXGLayout *)self modifySpritesInRange:contentCaptureSpriteIndex | 0x100000000 fullState:v14];
    }
  }
}

void __38__PXStoryLayout__updateContentCapture__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(float32x2_t **)(a3 + 16);
  CGFloat v6 = *(double *)(a1 + 40);
  CGFloat v7 = *(double *)(a1 + 48);
  CGFloat v8 = *(double *)(a1 + 56);
  CGFloat v9 = *(double *)(a1 + 64);
  v27.origin.double x = v6;
  v27.origin.double y = v7;
  v27.size.double width = v8;
  v27.size.double height = v9;
  CGFloat MidX = CGRectGetMidX(v27);
  v28.origin.double x = v6;
  v28.origin.double y = v7;
  v28.size.double width = v8;
  v28.size.double height = v9;
  CGFloat MidY = CGRectGetMidY(v28);
  v29.origin.double x = v6;
  v29.origin.double y = v7;
  v29.size.double width = v8;
  v29.size.double height = v9;
  CGFloat Width = CGRectGetWidth(v29);
  v30.origin.double x = v6;
  v30.origin.double y = v7;
  v30.size.double width = v8;
  v30.size.double height = v9;
  CGFloat Height = CGRectGetHeight(v30);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)uint64_t v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0xBFF0000000000000;
  v5[3] = vcvt_f32_f64(v13);
  id v14 = *(_OWORD **)(a3 + 24);
  long long v15 = *((_OWORD *)off_1E5DAAF90 + 1);
  *id v14 = *(_OWORD *)off_1E5DAAF90;
  v14[1] = v15;
  long long v16 = *((_OWORD *)off_1E5DAAF90 + 5);
  v14[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v14[5] = v16;
  long long v17 = *((_OWORD *)off_1E5DAAF90 + 3);
  v14[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v14[3] = v17;
  long long v18 = *((_OWORD *)off_1E5DAAF90 + 9);
  v14[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v14[9] = v18;
  long long v19 = *((_OWORD *)off_1E5DAAF90 + 7);
  v14[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v14[7] = v19;
  v20 = *(float32x2_t **)(a3 + 32);
  v20->i8[1] = 9;
  *(float *)&long long v15 = *(double *)(a1 + 72);
  v20[1] = vmul_n_f32(v5[3], *(float *)&v15);
  *(_WORD *)(*(void *)(a3 + 32) + 32) = 1;
  int v21 = **(_DWORD **)(a3 + 8);
  v22 = [*(id *)(a1 + 32) entityManager];
  v23 = [v22 effectComponent];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __38__PXStoryLayout__updateContentCapture__block_invoke_2;
  v25[3] = &unk_1E5DC5C50;
  int v26 = v21;
  v25[4] = *(void *)(a1 + 32);
  [v23 performChanges:v25];
}

void __38__PXStoryLayout__updateContentCapture__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 overlayBlurEffect];
  LODWORD(v3) = [v7 effectId];
  id v5 = v4;
  uint64_t v6 = [v5 mutableEffectIds];

  *(_DWORD *)(v6 + 4 * *(unsigned int *)(a1 + 40)) = v3;
}

- (void)_invalidateContentCapture
{
  if (self->_isPerformingUpdate)
  {
    [(PXStoryLayout *)self _updateContentCapture];
    return;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_10:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_9:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryLayout _invalidateContentCapture]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryLayout.m", 481, @"invalidating %lu after it already has been updated", 128);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_9;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 128;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
}

void __31__PXStoryLayout__updateContent__block_invoke()
{
}

uint64_t __31__PXStoryLayout__updateContent__block_invoke_2(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40) + a2 * *(double *)(a1 + 48));
}

uint64_t __31__PXStoryLayout__updateContent__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v9 = [*(id *)(a1 + 32) shadowSpriteIndex];
  uint64_t v10 = [*(id *)(a1 + 32) shadow];
  if (v10) {
    PXGConfigureShadowSprite((float32x2_t *)(a3 + 32 * v9), a4 + 160 * v9, a5 + 40 * v9, v10, *(void **)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  }
  *(_DWORD *)(a4 + 160 * v9) = 0;
  return MEMORY[0x1F4181870](0, v11, v12, 0);
}

- (void)_invalidateContent
{
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryLayout.m", 391, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateOverlayBlurEffect
{
  id v3 = [(PXStoryLayout *)self model];
  id v4 = [v3 configuration];
  [v4 overlayBlurRadius];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    id v10 = 0;
  }
  else
  {
    id v7 = [(PXGLayout *)self entityManager];
    CGFloat v8 = [(PXStoryLayout *)self overlayBlurEffect];
    unsigned int v9 = [v8 entityManager];

    if (v9 == v7)
    {
      id v11 = [(PXStoryLayout *)self overlayBlurEffect];
    }
    else
    {
      id v11 = (id)[objc_alloc((Class)off_1E5DA6820) initWithEntityManager:v7];
      [v11 setRadius:v6];
      [v11 setExposure:0.0];
    }

    id v10 = v11;
  }
  id v12 = v10;
  [(PXStoryLayout *)self setOverlayBlurEffect:v10];
}

- (void)_invalidateOverlayBlurEffect
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryLayout _invalidateOverlayBlurEffect]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryLayout.m", 371, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateShadow
{
  id v5 = [(PXStoryLayout *)self model];
  id v3 = [v5 layoutSpec];
  id v4 = [v3 thumbnailShadow];
  [(PXStoryLayout *)self setShadow:v4];
}

- (void)_invalidateShadow
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryLayout _invalidateShadow]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryLayout.m", 363, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryLayout;
  [(PXGCompositeLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryLayout.m", 359, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  self->_isPerformingUpdate = 1;
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      unsigned int v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v10 = [NSString stringWithUTF8String:"-[PXStoryLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXStoryLayout.m", 331, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryLayout *)self _updateShadow];
      if (!p_updateFlags->isPerformingUpdate)
      {
        long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
        v20 = [NSString stringWithUTF8String:"-[PXStoryLayout update]"];
        [v19 handleFailureInFunction:v20, @"PXStoryLayout.m", 335, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v5 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"-[PXStoryLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXStoryLayout.m", 338, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v6 & 0x40) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXStoryLayout *)self _updateOverlayBlurEffect];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      float64x2_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXStoryLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXStoryLayout.m", 341, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80uLL;
    if ((v7 & 0x80) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFF7FLL;
      [(PXStoryLayout *)self _updateContentCapture];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v16 = [NSString stringWithUTF8String:"-[PXStoryLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXStoryLayout.m", 349, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryLayout *)self _updateAXGroupRole];
      unint64_t v8 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v8)
    {
      long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v18 = [NSString stringWithUTF8String:"-[PXStoryLayout update]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PXStoryLayout.m", 352, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXStoryLayout;
  [(PXGCompositeLayout *)&v21 update];
  self->_isPerformingUpdate = 0;
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryLayout;
  [(PXGCompositeLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryLayout.m", 326, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  v2 = [(PXStoryLayout *)self model];
  id v3 = [v2 layoutSpec];
  char v4 = [v3 thumbnailChromeShowsPlayButton];

  return v4;
}

- (void)setDiagnosticOverlayLayout:(id)a3
{
  unsigned int v9 = (PXGLayout *)a3;
  objc_super v5 = self->_diagnosticOverlayLayout;
  if (v5 == v9)
  {
  }
  else
  {
    char v6 = [(PXGLayout *)v9 isEqual:v5];

    unint64_t v7 = v9;
    if (v6) {
      goto LABEL_11;
    }
    if (self->_diagnosticOverlayLayoutIndex != 0x7FFFFFFFFFFFFFFFLL) {
      [(PXGLayout *)self removeSublayoutAtIndex:"removeSublayoutAtIndex:"];
    }
    objc_storeStrong((id *)&self->_diagnosticOverlayLayout, a3);
    if (self->_diagnosticOverlayLayout) {
      int64_t v8 = [(PXGLayout *)self addSublayout:"addSublayout:"];
    }
    else {
      int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->_diagnosticOverlayLayoutIndedouble x = v8;
  }
  unint64_t v7 = v9;
LABEL_11:
}

- (PXStoryFullsizeLayout)currentFullsizePlayerLayout
{
  id v3 = [(PXStoryLayout *)self thumbnailFullsizeLayout];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    char v6 = [(PXStoryLayout *)self styleSwitchingFullsizeLayout];
    id v5 = [v6 dominantFullsizePlayerLayout];
  }
  return (PXStoryFullsizeLayout *)v5;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryLayout *)self itemReference];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    unint64_t v7 = self;
  }
  else {
    unint64_t v7 = [[PXGOtherItemPlacementController alloc] initWithOriginalItemPlacementController:self originalItemReference:v5];
  }
  int64_t v8 = v7;

  return v8;
}

- (id)itemReference
{
  v2 = [(PXStoryLayout *)self model];
  id v3 = [v2 currentAssetCollection];

  return v3;
}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    [(PXStoryLayout *)self _invalidateContent];
  }
}

- (void)setFullsizeContentPlacementOverride:(id)a3
{
  id v5 = (PXGItemPlacement *)a3;
  int v6 = self->_fullsizeContentPlacementOverride;
  if (v6 == v5)
  {
  }
  else
  {
    unint64_t v7 = v6;
    char v8 = [(PXGItemPlacement *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fullsizeContentPlacementOverride, a3);
      [(PXStoryLayout *)self _invalidateContent];
      if (v5)
      {
        unsigned int v9 = [(PXStoryLayout *)self model];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __53__PXStoryLayout_setFullsizeContentPlacementOverride___block_invoke;
        v10[3] = &unk_1E5DCEE38;
        id v11 = v5;
        [v9 performChanges:v10];
      }
    }
  }
}

void __53__PXStoryLayout_setFullsizeContentPlacementOverride___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 soundVolume];
  objc_msgSend(v3, "setVolumeDuringViewControllerTransition:");
}

- (void)setOverlayBlurEffect:(id)a3
{
  unint64_t v7 = (PXGExposureBlurEffect *)a3;
  id v5 = self->_overlayBlurEffect;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGExposureBlurEffect *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overlayBlurEffect, a3);
      [(PXStoryLayout *)self _invalidateContentCapture];
    }
  }
}

- (void)setShadow:(id)a3
{
  char v8 = (NSShadow *)a3;
  id v4 = self->_shadow;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSShadow *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSShadow *)[(NSShadow *)v8 copy];
      shadow = self->_shadow;
      self->_shadow = v6;

      [(PXStoryLayout *)self _invalidateContent];
    }
  }
}

- (int64_t)scrollableAxis
{
  return 2;
}

- (unsigned)representingSpriteIndex
{
  return self->_shadowSpriteIndex;
}

- (unint64_t)contentChangeTrend
{
  return 4;
}

- (void)entityManagerDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  [(PXGLayout *)&v3 entityManagerDidChange];
  [(PXStoryLayout *)self _invalidateOverlayBlurEffect];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  [(PXGCompositeLayout *)&v3 referenceDepthDidChange];
  [(PXStoryLayout *)self _invalidateContent];
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryLayout *)self _invalidateContent];
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  [(PXGCompositeLayout *)&v3 visibleRectDidChange];
  [(PXStoryLayout *)self _invalidateContentCapture];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXStoryLayout *)self _invalidateContent];
}

- (PXStoryLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PXStoryLayout;
  char v6 = [(PXGAbsoluteCompositeLayout *)&v38 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    p_model = &v7->_model;
    [(PXStoryModel *)v7->_model registerChangeObserver:v7 context:ModelObservationContext_213880];
    unint64_t v8 = [v5 options];
    unsigned int v9 = [v5 configuration];
    char v10 = [v9 isExportPreview];
    char v36 = [v9 isPresentedForAirPlay];
    uint64_t v11 = [v5 viewMode];
    if ([v9 options] & 0x400 | v8 & 1) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 3;
    }
    int v13 = !v12;
    if (v8 & 1) != 0 || ([v5 isAsync]) {
      LODWORD(v14) = 0;
    }
    else {
      uint64_t v14 = (v8 >> 1) & 1;
    }
    char v15 = [v9 shouldFadeToBlackAtEnd];
    long long v16 = [[PXStoryScrollLayout alloc] initWithModel:*p_model];
    scrollLayout = v7->_scrollLayout;
    v7->_scrollLayout = v16;

    if (v13) {
      uint64_t v18 = [(PXGLayout *)v7 addSublayout:v7->_scrollLayout];
    }
    else {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    char v19 = v15 | v8;
    v7->_scrollLayoutIndedouble x = v18;
    if (v14)
    {
      v20 = [[PXStoryThumbnailChromeLayout alloc] initWithModel:v5];
      thumbnailChromeLayout = v7->_thumbnailChromeLayout;
      v7->_thumbnailChromeLayout = v20;

      uint64_t v22 = [(PXGLayout *)v7 addSublayout:v7->_thumbnailChromeLayout];
    }
    else
    {
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    char v23 = v19 | v36 | v10;
    v7->_thumbnailChromeLayoutIndedouble x = v22;
    if (v11 == 3) {
      char v24 = 1;
    }
    else {
      char v24 = v10;
    }
    if ((v24 & 1) != 0 || [v5 isAsync])
    {
      v25 = [[PXStoryFullsizeLayout alloc] initWithModel:*p_model];
      uint64_t v26 = 1120;
    }
    else
    {
      v25 = [[PXStoryStyleSwitchingFullsizeLayout alloc] initWithModel:*p_model];
      uint64_t v26 = 1112;
    }
    CGRect v27 = (id *)((char *)&v7->super.super.super.super.isa + v26);
    CGRect v28 = *(Class *)((char *)&v7->super.super.super.super.isa + v26);
    *CGRect v27 = v25;

    CGRect v29 = (PXGLayout *)*v27;
    fullsizeLayout = v7->_fullsizeLayout;
    v7->_fullsizeLayout = v29;

    v7->_fullsizeLayoutIndedouble x = [(PXGLayout *)v7 addSublayout:v7->_fullsizeLayout];
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    if (v23)
    {
      v32 = [[PXStoryFadeOverlayLayout alloc] initWithModel:*p_model];
      fadeOverlayLayout = v7->_fadeOverlayLayout;
      v7->_fadeOverlayLayout = v32;

      uint64_t v31 = [(PXGLayout *)v7 addSublayout:v7->_fadeOverlayLayout];
    }
    v7->_fadeOverlayLayoutIndedouble x = v31;
    v7->_diagnosticOverlayLayoutIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    [(PXStoryLayout *)v7 _invalidateContent];
    v7->_shadowSpriteIndedouble x = [(PXGLayout *)v7 addSpriteWithInitialState:0];
    [v9 overlayBlurRadius];
    if (v34 <= 0.0)
    {
      v7->_contentCaptureSpriteIndedouble x = -1;
    }
    else
    {
      v7->_contentCaptureSpriteIndedouble x = [(PXGLayout *)v7 addSpriteWithInitialState:0];
      [(PXStoryLayout *)v7 _invalidateOverlayBlurEffect];
    }
    [(PXGLayout *)v7 setContentSource:v7];
    [(PXStoryLayout *)v7 _invalidateShadow];
    [(PXStoryLayout *)v7 _invalidateAXGroupRole];
  }
  return v7;
}

- (PXStoryLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryLayout.m", 109, @"%s is not available as initializer", "-[PXStoryLayout init]");

  abort();
}

@end