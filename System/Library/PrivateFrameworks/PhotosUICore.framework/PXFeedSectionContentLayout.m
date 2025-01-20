@interface PXFeedSectionContentLayout
- (BOOL)_handlePresentMenuActionForIndex:(int64_t)a3 atLocation:(CGPoint)a4 inView:(id)a5;
- (BOOL)_handlePrimaryActionForItemAtIndex:(int64_t)a3;
- (BOOL)axShouldSearchLeafsInSubgroups;
- (BOOL)wantsCustomAlphaForSublayouts;
- (CGRect)decorationOverlayRectForSpriteIndex:(unsigned int)a3;
- (PXFeedAutoplayController)autoplayController;
- (PXFeedItemLayoutFactory)itemLayoutFactory;
- (PXFeedSectionContentLayout)init;
- (PXFeedSectionContentLayout)initWithViewModel:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5;
- (PXFeedViewModel)viewModel;
- (PXSectionedDataSource)dataSource;
- (PXSimpleIndexPath)sectionIndexPath;
- (double)alphaForSublayout:(id)a3 atIndex:(int64_t)a4;
- (id)_handleHoverForItemAtIndex:(int64_t)a3;
- (id)_handleTouchForItemAtIndex:(int64_t)a3;
- (id)axSpriteIndexes;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (int64_t)itemForSpriteIndex:(unsigned int)a3;
- (int64_t)presentedRootLayoutOrientation;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3;
- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_invalidateAutoplayControllerParameters;
- (void)_invalidateCompositionParameters;
- (void)_invalidateFeedSublayouts;
- (void)_invalidatePresentedRootLayoutOrientation;
- (void)_updateAutoplayControllerParameters;
- (void)_updateCompositionParameters;
- (void)_updateFeedSprites;
- (void)_updateFeedSublayouts;
- (void)_updatePresentedRootLayoutOrientation;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didUpdate;
- (void)didUpdateSublayouts;
- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3;
- (void)localHiddenSpriteIndexesDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
- (void)setPresentedRootLayoutOrientation:(int64_t)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)willUpdate;
@end

@implementation PXFeedSectionContentLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoplayController, 0);
  objc_storeStrong((id *)&self->_itemLayoutFactory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_lastChangeDetails, 0);
}

- (int64_t)presentedRootLayoutOrientation
{
  return self->_presentedRootLayoutOrientation;
}

- (PXFeedAutoplayController)autoplayController
{
  return self->_autoplayController;
}

- (PXFeedItemLayoutFactory)itemLayoutFactory
{
  return self->_itemLayoutFactory;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[34].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[33].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  v5 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
  if (objc_opt_respondsToSelector())
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x4010000000;
    v11[3] = &unk_1AB5D584F;
    long long v12 = 0u;
    long long v13 = 0u;
    [(PXFeedSectionContentLayout *)self sectionIndexPath];
    v6 = [(PXGLayout *)self sublayoutDataStore];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__PXFeedSectionContentLayout_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
    v7[3] = &unk_1E5DD1CB0;
    v10 = v11;
    id v8 = v5;
    id v9 = v4;
    [v6 enumerateSublayoutsUsingBlock:v7];

    _Block_object_dispose(v11, 8);
  }
}

uint64_t __72__PXFeedSectionContentLayout_collectTapToRadarDiagnosticsIntoContainer___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(a1[6] + 8) + 48) = a2;
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = (void *)a1[4];
  long long v6 = *(_OWORD *)(v4 + 48);
  v8[0] = *(_OWORD *)(v4 + 32);
  v8[1] = v6;
  return [v5 collectTapToRadarDiagnosticsForItemLayout:a3 indexPath:v8 intoContainer:v3];
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if ((a4 & 2) == 0)
  {
    id v11 = 0;
    if ((a4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v21 = 0;
  PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v21);
  id v11 = v21;
  if ((a4 & 4) != 0)
  {
LABEL_5:
    id v20 = v11;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v20);
    id v12 = v20;

    id v11 = v12;
  }
LABEL_6:
  if (v11)
  {
    long long v13 = [v11 axContainingGroup];
    v14 = [(PXGLayout *)self axGroup];

    if (v13 == v14)
    {
      int64_t v19 = -[PXFeedSectionContentLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", [v11 spriteIndex]);
      v15 = [(PXFeedSectionContentLayout *)self dataSource];
      uint64_t v16 = [v15 identifier];

      uint64_t v18 = v16;
      PXGAXAddSimpleIndexPathGroupChangeUserInfo(v10, &v18, 0, &v19);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PXFeedSectionContentLayout;
  [(PXGCompositeLayout *)&v17 axGroup:v8 didChange:a4 userInfo:v10];
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  uint64_t v4 = [(PXFeedSectionContentLayout *)self viewModel];
  v5 = [v4 spec];
  unsigned __int8 v6 = [v5 wantsFirstItemFullscreen];

  if (((a3 == 0) & v6) != 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = [(PXFeedSectionContentLayout *)self viewModel];
  id v8 = [v7 spec];
  unint64_t v9 = [v8 numberOfColumns];

  if (v9)
  {
    unint64_t v10 = v5 % v9;
    switch(a4)
    {
      case 1uLL:
        if (v9 > v5) {
          unsigned int v11 = -1;
        }
        else {
          unsigned int v11 = v5 - v9;
        }
        break;
      case 2uLL:
        unsigned int v11 = v9 + v5;
        break;
      case 3uLL:
        if (v10) {
          unsigned int v11 = v5 - 1;
        }
        else {
          unsigned int v11 = -1;
        }
        break;
      case 4uLL:
        if ((v10 + 1) < v9) {
          unsigned int v11 = v5 + 1;
        }
        else {
          unsigned int v11 = -1;
        }
        break;
      case 5uLL:
        unsigned int v11 = v5 + 1;
        break;
      case 6uLL:
        unsigned int v11 = v5 - 1;
        break;
      default:
        unsigned int v11 = -1;
        break;
    }
    if (v11 >= [(PXGLayout *)self localNumberOfSprites]) {
      return -1;
    }
    else {
      return v11;
    }
  }
  else
  {
    return [(PXGLayout *)self axSpriteIndexClosestToSpriteIndexDefaultImplementation:v5 inDirection:a4];
  }
}

- (id)axSpriteIndexes
{
  uint64_t v2 = [(PXGLayout *)self localNumberOfSprites];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v2);
  return v3;
}

- (BOOL)axShouldSearchLeafsInSubgroups
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ViewModelObservationContext_293261 != a5)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXFeedSectionContentLayout.m" lineNumber:500 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v11 = v9;
  if ((v6 & 8) != 0)
  {
    [(PXFeedSectionContentLayout *)self _invalidateCompositionParameters];
    [(PXFeedSectionContentLayout *)self _invalidatePresentedRootLayoutOrientation];
    id v9 = v11;
  }
  if (v6)
  {
    [(PXFeedSectionContentLayout *)self _invalidateAutoplayControllerParameters];
    id v9 = v11;
  }
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PXFeedSectionContentLayout;
  id v8 = a3;
  [(PXGCompositeLayout *)&v10 willRemoveSublayout:v8 atIndex:a4 flags:a5];
  id v9 = [(PXFeedSectionContentLayout *)self autoplayController];
  [v9 removeItemLayout:v8];
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  v7 = [(PXFeedSectionContentLayout *)self viewModel];
  id v8 = [(PXFeedSectionContentLayout *)self dataSource];
  long long v23 = 0u;
  long long v24 = 0u;
  [(PXFeedSectionContentLayout *)self sectionIndexPath];
  if (*(void *)off_1E5DAAED8) {
    BOOL v9 = *((void *)&v23 + 1) == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || (void)v24 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXFeedSectionContentLayout.m", 468, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(indexPath)" object file lineNumber description];
  }
  *(void *)&long long v24 = a4;
  id v11 = [(PXGLayout *)self sublayoutDataStore];
  id v12 = (double *)([v11 geometries] + 136 * a4);
  double v13 = *v12;
  double v14 = v12[1];

  v15 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
  id v22 = 0;
  v21[0] = v23;
  v21[1] = v24;
  uint64_t v16 = objc_msgSend(v15, "createLayoutForFeedItemAtIndexPath:inDataSource:viewModel:initialReferenceSize:thumbnailAsset:", v21, v8, v7, &v22, v13, v14);
  id v17 = v22;

  if (v17)
  {
    uint64_t v18 = [(PXFeedSectionContentLayout *)self autoplayController];
    [v18 addItemLayout:v16 withDisplayAsset:v17];
  }
  return v16;
}

- (void)_updateAutoplayControllerParameters
{
  id v5 = [(PXFeedSectionContentLayout *)self viewModel];
  uint64_t v3 = [v5 isActive];
  uint64_t v4 = [(PXFeedSectionContentLayout *)self autoplayController];
  [v4 setIsContainerLayoutVisible:v3];
}

- (void)_invalidateAutoplayControllerParameters
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
      char v6 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout _invalidateAutoplayControllerParameters]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedSectionContentLayout.m", 451, @"invalidating %lu after it already has been updated", 4);

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

- (void)_updateCompositionParameters
{
  id v5 = [(PXFeedSectionContentLayout *)self viewModel];
  uint64_t v3 = [v5 spec];
  uint64_t v4 = [(PXGCompositeLayout *)self composition];
  [v4 setSpec:v3];
}

- (void)_invalidateCompositionParameters
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      char v6 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout _invalidateCompositionParameters]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedSectionContentLayout.m", 443, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateFeedSprites
{
  id v3 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v4 = [v3 geometries];

  id v5 = [(PXFeedSectionContentLayout *)self viewModel];
  char v6 = [v5 spec];
  [v6 itemCornerRadius];
  *(float *)v7.i32 = *(double *)v7.i32;
  int32x2_t v9 = v7;

  uint64_t v8 = [(PXGLayout *)self localNumberOfSprites];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PXFeedSectionContentLayout__updateFeedSprites__block_invoke;
  v10[3] = &__block_descriptor_56_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  v10[4] = v4;
  int32x4_t v11 = vdupq_lane_s32(v9, 0);
  [(PXGLayout *)self modifySpritesInRange:v8 << 32 state:v10];
}

void __48__PXFeedSectionContentLayout__updateFeedSprites__block_invoke(uint64_t a1, unint64_t a2, float32x2_t *a3, _OWORD *a4, uint64_t a5)
{
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v7 = a2;
    int32x2_t v9 = (_OWORD *)(a1 + 40);
    objc_super v10 = (unsigned char *)(a5 + 34);
    int32x4_t v11 = a3 + 2;
    long long v29 = *(_OWORD *)off_1E5DAAF90;
    long long v30 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v27 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v28 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v25 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v26 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v23 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v24 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v21 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v22 = *((_OWORD *)off_1E5DAAF90 + 7);
    do
    {
      id v12 = (double *)(*(void *)(a1 + 32) + 136 * v7);
      CGFloat v13 = v12[6];
      CGFloat v14 = v12[7];
      CGFloat v15 = v12[4];
      CGFloat v16 = v12[5];
      v32.origin.x = v13;
      v32.origin.y = v14;
      v32.size.width = v15;
      v32.size.height = v16;
      CGFloat MidX = CGRectGetMidX(v32);
      v33.origin.x = v13;
      v33.origin.y = v14;
      v33.size.width = v15;
      v33.size.height = v16;
      CGFloat MidY = CGRectGetMidY(v33);
      v34.origin.x = v13;
      v34.origin.y = v14;
      v34.size.width = v15;
      v34.size.height = v16;
      CGFloat Width = CGRectGetWidth(v34);
      v35.origin.x = v13;
      v35.origin.y = v14;
      v35.size.width = v15;
      v35.size.height = v16;
      CGFloat Height = CGRectGetHeight(v35);
      v20.f64[0] = Width;
      v20.f64[1] = Height;
      *(CGFloat *)&v11[-2] = MidX;
      *(CGFloat *)&v11[-1] = MidY;
      *int32x4_t v11 = (float32x2_t)0xC000000000000000;
      v11[1] = vcvt_f32_f64(v20);
      *a4 = v29;
      a4[1] = v30;
      a4[4] = v27;
      a4[5] = v28;
      a4[2] = v25;
      a4[3] = v26;
      a4[8] = v23;
      a4[9] = v24;
      a4[6] = v21;
      a4[7] = v22;
      *(_OWORD *)((char *)a4 + 36) = *v9;
      ++v7;
      *(v10 - 33) = 0;
      unsigned char *v10 = 4;
      v10 += 40;
      v11 += 4;
      a4 += 10;
      --v5;
    }
    while (v5);
  }
}

- (void)_updateFeedSublayouts
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXFeedSectionContentLayout *)self dataSource];
  long long v47 = 0u;
  long long v48 = 0u;
  [(PXFeedSectionContentLayout *)self sectionIndexPath];
  if ([v4 identifier])
  {
    long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PXFeedSectionContentLayout.m", 375, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.dataSourceIdentifier == dataSource.identifier" object file lineNumber description];
  }
  uint64_t v5 = *((void *)&v47 + 1);
  char v6 = self->_presentedDataSource;
  unsigned int v7 = PLStoryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [(PXSectionedDataSource *)v6 identifier];
    uint64_t v10 = [v4 identifier];
    lastChangeDetails = self->_lastChangeDetails;
    *(_DWORD *)buf = 134219266;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    v54 = (void *)*((void *)&v47 + 1);
    LOWORD(v55[0]) = 2048;
    *(void *)((char *)v55 + 2) = v9;
    WORD5(v55[0]) = 2048;
    *(void *)((char *)v55 + 12) = v10;
    WORD2(v55[1]) = 2112;
    *(void *)((char *)&v55[1] + 6) = lastChangeDetails;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p %@ section:%li ds:%lu->%lu lastChangeDetails: %@", buf, 0x3Eu);
  }
  int64_t v12 = [(PXSectionedDataSourceChangeDetails *)self->_lastChangeDetails fromDataSourceIdentifier];
  if (v12 == [(PXSectionedDataSource *)v6 identifier]
    && (int64_t v13 = -[PXSectionedDataSourceChangeDetails toDataSourceIdentifier](self->_lastChangeDetails, "toDataSourceIdentifier"), v13 == [v4 identifier]))
  {
    id v14 = [(PXSectionedDataSourceChangeDetails *)self->_lastChangeDetails itemChangesInSection:*((void *)&v47 + 1)];
    CGFloat v15 = PLStoryGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p sectionChangeDetails: %@", buf, 0x16u);
    }

    BOOL shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = self->_itemLayoutFactoryRespondsTo.shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
    BOOL configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = self->_itemLayoutFactoryRespondsTo.configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
    if (configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource
      || shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource)
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      long long v30 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x4010000000;
      v54 = &unk_1AB5D584F;
      memset(v55, 0, sizeof(v55));
      *(void *)&v55[0] = [(PXSectionedDataSource *)v6 identifier];
      *((void *)&v55[0] + 1) = v5;
      int64x2_t v29 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v55[1] = v29;
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x4010000000;
      v44[3] = &unk_1AB5D584F;
      long long v45 = 0u;
      int64x2_t v46 = 0u;
      *(void *)&long long v45 = [v4 identifier];
      *((void *)&v45 + 1) = v5;
      int64x2_t v46 = v29;
      uint64_t v18 = [v14 changedIndexes];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __51__PXFeedSectionContentLayout__updateFeedSublayouts__block_invoke;
      v33[3] = &unk_1E5DD1C68;
      id v14 = v14;
      id v34 = v14;
      CGRect v35 = self;
      v40 = v44;
      v41 = buf;
      BOOL v42 = shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
      id v31 = v30;
      id v36 = v31;
      v37 = v6;
      id v38 = v4;
      id v19 = v32;
      id v39 = v19;
      BOOL v43 = configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
      [v18 enumerateIndexesUsingBlock:v33];

      if ([v19 count])
      {
        float64x2_t v20 = PLStoryGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v49 = 134218242;
          v50 = self;
          __int16 v51 = 2112;
          id v52 = v19;
          _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p indexesToReload: %@", v49, 0x16u);
        }

        long long v21 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v19 insertedIndexes:v19 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
        uint64_t v22 = [v14 changeDetailsByAddingChangeDetails:v21];

        id v14 = (id)v22;
      }

      _Block_object_dispose(v44, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v23 = [v4 numberOfItemsInSection:v5];
  long long v24 = PLStoryGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v25 = [(PXGLayout *)self numberOfSublayouts];
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2048;
    v54 = (void *)v23;
    _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p numberOfSublayouts: %li->%li", buf, 0x20u);
  }

  [(PXGLayout *)self applySublayoutChangeDetails:v14 countAfterChanges:v23 sublayoutProvider:self];
  [(PXGLayout *)self applySpriteChangeDetails:v14 countAfterChanges:v23 initialState:0 modifyState:0];
  objc_storeStrong((id *)&self->_presentedDataSource, v4);
  long long v26 = PLStoryGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    presentedDataSource = self->_presentedDataSource;
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = presentedDataSource;
    _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p presentedDataSource: %@", buf, 0x16u);
  }
}

void __51__PXFeedSectionContentLayout__updateFeedSublayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) indexAfterRevertingChangesFromIndex:a2];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    char v6 = [*(id *)(a1 + 40) sublayoutAtIndex:v4 loadIfNeeded:0];
    if (v6)
    {
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 48) = a2;
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 48) = v5;
      if (!*(unsigned char *)(a1 + 96)) {
        goto LABEL_11;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v8 = *(void **)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v11 = *(void *)(a1 + 64);
      long long v12 = *(_OWORD *)(v7 + 48);
      long long v23 = *(_OWORD *)(v7 + 32);
      long long v24 = v12;
      long long v13 = *(_OWORD *)(v10 + 48);
      long long v21 = *(_OWORD *)(v10 + 32);
      long long v22 = v13;
      if ([v8 shouldReloadItemLayout:v6 forChangedItemFromIndexPath:&v23 inDataSource:v9 toIndexPath:&v21 inDataSource:v11])
      {
        [*(id *)(a1 + 72) addIndex:a2];
      }
      else
      {
LABEL_11:
        if (*(unsigned char *)(a1 + 97))
        {
          uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
          CGFloat v15 = *(void **)(a1 + 48);
          uint64_t v16 = *(void *)(a1 + 56);
          uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
          uint64_t v18 = *(void *)(a1 + 64);
          long long v19 = *(_OWORD *)(v14 + 48);
          long long v23 = *(_OWORD *)(v14 + 32);
          long long v24 = v19;
          long long v20 = *(_OWORD *)(v17 + 48);
          long long v21 = *(_OWORD *)(v17 + 32);
          long long v22 = v20;
          [v15 configureItemLayout:v6 forChangedItemFromIndexPath:&v23 inDataSource:v16 toIndexPath:&v21 inDataSource:v18];
        }
      }
    }
  }
}

- (void)_invalidateFeedSublayouts
{
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
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      char v6 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout _invalidateFeedSublayouts]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedSectionContentLayout.m", 369, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setPresentedRootLayoutOrientation:(int64_t)a3
{
  if (self->_presentedRootLayoutOrientation != a3)
  {
    self->_presentedRootLayoutOrientation = a3;
    [(PXFeedSectionContentLayout *)self _invalidateFeedSublayouts];
  }
}

- (void)_updatePresentedRootLayoutOrientation
{
  id v4 = [(PXFeedSectionContentLayout *)self viewModel];
  id v3 = [v4 spec];
  -[PXFeedSectionContentLayout setPresentedRootLayoutOrientation:](self, "setPresentedRootLayoutOrientation:", [v3 rootLayoutOrientation]);
}

- (void)_invalidatePresentedRootLayoutOrientation
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
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      char v6 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout _invalidatePresentedRootLayoutOrientation]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedSectionContentLayout.m", 349, @"invalidating %lu after it already has been updated", 8);

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

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXFeedSectionContentLayout;
  [(PXGCompositeLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXFeedSectionContentLayout.m", 344, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout update]"];
      [v8 handleFailureInFunction:v9, @"PXFeedSectionContentLayout.m", 323, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 8;
    if ((needsUpdate & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
      [(PXFeedSectionContentLayout *)self _updatePresentedRootLayoutOrientation];
      if (!p_updateFlags->isPerformingUpdate)
      {
        uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v17 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout update]"];
        [v16 handleFailureInFunction:v17, @"PXFeedSectionContentLayout.m", 329, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v5)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      [(PXFeedSectionContentLayout *)self _updateFeedSublayouts];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXFeedSectionContentLayout.m", 332, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXFeedSectionContentLayout *)self _updateCompositionParameters];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v13 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXFeedSectionContentLayout.m", 335, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v7 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXFeedSectionContentLayout *)self _updateAutoplayControllerParameters];
      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v15 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout update]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXFeedSectionContentLayout.m", 338, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXFeedSectionContentLayout;
  [(PXGCompositeLayout *)&v18 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXFeedSectionContentLayout;
  [(PXGCompositeLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXFeedSectionContentLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXFeedSectionContentLayout.m", 319, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_itemLayoutFactoryRespondsTo.itemPlacementControllerForItemReferenceItemLayout)
  {
    unint64_t v6 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
    unint64_t v7 = [(PXGLayout *)self sublayoutDataStore];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__PXFeedSectionContentLayout_itemPlacementControllerForItemReference___block_invoke;
    v11[3] = &unk_1E5DD1C40;
    id v12 = v6;
    id v13 = v4;
    id v14 = v5;
    id v8 = v6;
    [v7 enumerateSublayoutsUsingBlock:v11];
  }
  uint64_t v9 = +[PXGMultiplexedItemPlacementController itemPlacementControllerForItemPlacementControllers:v5];

  return v9;
}

void __70__PXFeedSectionContentLayout_itemPlacementControllerForItemReference___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) itemPlacementControllerForItemReference:*(void *)(a1 + 40) itemLayout:a3];
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 48) addObject:v4];
    id v4 = v5;
  }
}

- (CGRect)decorationOverlayRectForSpriteIndex:(unsigned int)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (self->_itemLayoutFactoryRespondsTo.decorationOverlayAnchorSpriteIndexForItemLayout)
  {
    id v8 = [(PXGLayout *)self sublayoutAtIndex:a3 loadIfNeeded:0];
    if (v8)
    {
      uint64_t v9 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
      uint64_t v10 = [v9 decorationOverlayAnchorSpriteIndexForItemLayout:v8];

      [v8 geometryForSpriteAtIndex:v10];
      float32x2_t v11 = vmul_f32(0, (float32x2_t)0x3F0000003F000000);
      -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v8, 0.0 - v11.f32[0], 0.0 - v11.f32[1], 0.0, 0.0);
      double v3 = v12;
      double v4 = v13;
      double v5 = v14;
      double v6 = v15;
    }
  }
  double v16 = v3;
  double v17 = v4;
  double v18 = v5;
  double v19 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (PXSectionedDataSource *)a3;
  id v8 = (PXSectionedDataSourceChangeDetails *)a4;
  uint64_t v9 = PLStoryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [(PXSectionedDataSource *)self->_dataSource identifier];
    *(_DWORD *)buf = 134219010;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&unsigned char buf[24] = v11;
    __int16 v20 = 2048;
    uint64_t v21 = [(PXSectionedDataSource *)v7 identifier];
    __int16 v22 = 2112;
    long long v23 = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p %@ ds:%lu->%lu changeDetails: %@", buf, 0x34u);
  }
  p_sectionIndexPath = &self->_sectionIndexPath;
  if (v8)
  {
    long long v13 = *(_OWORD *)&self->_sectionIndexPath.item;
    v18[0] = *(_OWORD *)&p_sectionIndexPath->dataSourceIdentifier;
    v18[1] = v13;
    [(PXSectionedDataSourceChangeDetails *)v8 indexPathAfterApplyingChangesToIndexPath:v18 hasIncrementalChanges:0 objectChanged:0];
  }
  else
  {
    memset(buf, 0, sizeof(buf));
  }
  long long v14 = *(_OWORD *)&buf[16];
  *(_OWORD *)&p_sectionIndexPath->dataSourceIdentifier = *(_OWORD *)buf;
  *(_OWORD *)&self->_sectionIndexPath.item = v14;
  dataSource = self->_dataSource;
  self->_dataSource = v7;
  double v16 = v7;

  lastChangeDetails = self->_lastChangeDetails;
  self->_lastChangeDetails = v8;

  [(PXFeedSectionContentLayout *)self _invalidateFeedSublayouts];
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(PXFeedSectionContentLayout *)self dataSource];
    uint64_t v10 = [v9 objectReferenceNearestToObjectReference:v8];
    int64x2_t v18 = 0u;
    *(void *)&long long v19 = 0;
    if (v10)
    {
      if (v9) {
        [v9 indexPathForObjectReference:v10];
      }
    }
    else
    {
      int64x2_t v18 = *(int64x2_t *)off_1E5DAB028;
      long long v19 = *((_OWORD *)off_1E5DAB028 + 1);
    }
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v18.i64[0] != *(void *)off_1E5DAAED8)
    {
      [(PXFeedSectionContentLayout *)self sectionIndexPath];
      if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v18, v16), (int32x4_t)vceqq_s64(v17, vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)))), 0xFuLL))))
      {
        int64_t v11 = v19;
        if (!v10)
        {
          double v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"PXFeedSectionContentLayout.m", 272, @"Invalid parameter not satisfying: %@", @"nearestObjectReference != nil" object file lineNumber description];
        }
        id v12 = v10;

        id v8 = v12;
      }
    }
  }
  else
  {
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v13 = v8;
  *a5 = v13;

  return v11;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  return [(PXFeedSectionContentLayout *)self sublayoutIndexForObjectReference:a3 options:a4 updatedObjectReference:a5];
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(PXGLayout *)self localNumberOfSprites] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXFeedSectionContentLayout;
    double v6 = [(PXGLayout *)&v8 objectReferenceForSpriteIndex:v3];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    [(PXFeedSectionContentLayout *)self sectionIndexPath];
    *(void *)&long long v11 = v3;
    double v5 = [(PXFeedSectionContentLayout *)self dataSource];
    v9[0] = v10;
    v9[1] = v11;
    double v6 = [v5 objectReferenceAtIndexPath:v9];
  }
  return v6;
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  [(PXGLayout *)self visibleRect];
  PXRectGetCenter();
}

void __79__PXFeedSectionContentLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke()
{
}

- (BOOL)_handlePresentMenuActionForIndex:(int64_t)a3 atLocation:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  long long v10 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
  char v11 = objc_opt_respondsToSelector();
  if (v11)
  {
    id v12 = [(PXGLayout *)self sublayoutAtIndex:a3 loadIfNeeded:0];
    objc_msgSend(v10, "presentMenuForItemLayout:atLocation:inView:", v12, v9, x, y);
  }
  return v11 & 1;
}

- (id)_handleHoverForItemAtIndex:(int64_t)a3
{
  id v4 = [(PXGLayout *)self sublayoutAtIndex:a3 loadIfNeeded:0];
  if (v4 && self->_itemLayoutFactoryRespondsTo.setItemLayoutIsHovered)
  {
    double v5 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
    [v5 setItemLayout:v4 isHovered:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _OWORD v9[2] = __57__PXFeedSectionContentLayout__handleHoverForItemAtIndex___block_invoke;
    v9[3] = &unk_1E5DD32A8;
    id v10 = v5;
    id v11 = v4;
    id v6 = v5;
    unint64_t v7 = _Block_copy(v9);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

uint64_t __57__PXFeedSectionContentLayout__handleHoverForItemAtIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setItemLayout:*(void *)(a1 + 40) isHovered:0];
}

- (id)_handleTouchForItemAtIndex:(int64_t)a3
{
  id v4 = [(PXGLayout *)self sublayoutAtIndex:a3 loadIfNeeded:0];
  if (v4 && self->_itemLayoutFactoryRespondsTo.setItemLayoutIsTouched)
  {
    double v5 = [(PXFeedSectionContentLayout *)self itemLayoutFactory];
    [v5 setItemLayout:v4 isTouched:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _OWORD v9[2] = __57__PXFeedSectionContentLayout__handleTouchForItemAtIndex___block_invoke;
    v9[3] = &unk_1E5DD32A8;
    id v10 = v5;
    id v11 = v4;
    id v6 = v5;
    unint64_t v7 = _Block_copy(v9);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

uint64_t __57__PXFeedSectionContentLayout__handleTouchForItemAtIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setItemLayout:*(void *)(a1 + 40) isTouched:0];
}

- (BOOL)_handlePrimaryActionForItemAtIndex:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  [(PXFeedSectionContentLayout *)self sectionIndexPath];
  *(void *)&long long v12 = a3;
  double v5 = [(PXFeedSectionContentLayout *)self viewModel];
  id v6 = [v5 actionPerformer];
  unint64_t v7 = [(PXFeedSectionContentLayout *)self dataSource];
  v10[0] = v11;
  v10[1] = v12;
  char v8 = [v6 handlePrimaryActionOnItemAtIndexPath:v10 inDataSource:v7];

  return v8;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(PXGLayout *)self localNumberOfSprites] <= a3)
  {
    double v5 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    double v5 = [[PXFeedHitTestResult alloc] initWithSpriteIndex:v3 layout:self];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke;
    v27[3] = &unk_1E5DD1B78;
    objc_copyWeak(&v28, &location);
    int v29 = v3;
    id v6 = [(PXFeedHitTestResult *)v5 primaryAction:v27];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_2;
    v24[3] = &unk_1E5DD1BA0;
    objc_copyWeak(&v25, &location);
    int v26 = v3;
    id v7 = [(PXFeedHitTestResult *)v5 touchAction:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    _OWORD v21[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_3;
    v21[3] = &unk_1E5DD1BC8;
    objc_copyWeak(&v22, &location);
    int v23 = v3;
    id v8 = [(PXFeedHitTestResult *)v5 hoverAction:v21];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    _OWORD v18[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_4;
    v18[3] = &unk_1E5DD1BF0;
    objc_copyWeak(&v19, &location);
    int v20 = v3;
    id v9 = [(PXFeedHitTestResult *)v5 presentMenuAction:v18];
    long long v16 = 0u;
    long long v17 = 0u;
    [(PXFeedSectionContentLayout *)self sectionIndexPath];
    *(void *)&long long v17 = v3;
    id v10 = [(PXFeedSectionContentLayout *)self dataSource];
    v15[0] = v16;
    v15[1] = v17;
    long long v11 = [v10 objectReferenceAtIndexPath:v15];

    id v12 = [(PXFeedHitTestResult *)v5 objectReference:v11];
    v14[0] = v16;
    v14[1] = v17;
    [(PXFeedHitTestResult *)v5 setDataSourceIndexPath:v14];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v5;
}

uint64_t __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _handlePrimaryActionForItemAtIndex:*(unsigned int *)(a1 + 40)];

  return v3;
}

id __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _handleTouchForItemAtIndex:*(unsigned int *)(a1 + 40)];

  return v3;
}

id __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _handleHoverForItemAtIndex:*(unsigned int *)(a1 + 40)];

  return v3;
}

uint64_t __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_4(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = (id *)(a1 + 32);
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  uint64_t v10 = objc_msgSend(WeakRetained, "_handlePresentMenuActionForIndex:atLocation:inView:", *(unsigned int *)(a1 + 40), v8, a3, a4);

  return v10;
}

- (double)alphaForSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v6 = [(PXGLayout *)self localHiddenSpriteIndexes];
  char v7 = [v6 containsIndex:a4];

  double v8 = 0.0;
  if ((v7 & 1) == 0)
  {
    double v8 = 1.0;
    if (!a4)
    {
      id v9 = [(PXFeedSectionContentLayout *)self viewModel];
      uint64_t v10 = [v9 spec];
      int v11 = [v10 wantsFirstItemFullscreen];

      if (v11)
      {
        [(PXGLayout *)self visibleRect];
        double v13 = v12;
        long long v14 = [(PXFeedSectionContentLayout *)self viewModel];
        double v15 = [v14 spec];
        long long v16 = [v15 scrollBehavior];
        [v16 intrinsicContentOffset];
        double v18 = v13 / v17;
        double v8 = 1.0;
        double v19 = 1.0 - v18;

        double v20 = fmax(v19, 0.0);
        if (v20 <= 1.0) {
          return v20;
        }
      }
    }
  }
  return v8;
}

- (BOOL)wantsCustomAlphaForSublayouts
{
  return 1;
}

- (void)localHiddenSpriteIndexesDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedSectionContentLayout;
  [(PXGLayout *)&v3 localHiddenSpriteIndexesDidChange];
  [(PXGCompositeLayout *)self invalidateSublayouts];
}

- (void)visibleRectDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXFeedSectionContentLayout;
  [(PXGCompositeLayout *)&v8 visibleRectDidChange];
  objc_super v3 = [(PXFeedSectionContentLayout *)self autoplayController];
  [v3 containerLayoutVisibleRectDidChange];

  id v4 = [(PXFeedSectionContentLayout *)self viewModel];
  double v5 = [v4 visibleRectChangeObserver];

  if (v5)
  {
    id v6 = [(PXFeedSectionContentLayout *)self viewModel];
    char v7 = [v6 visibleRectChangeObserver];
    [(PXGLayout *)self visibleRect];
    v7[2](v7);
  }
}

- (void)didUpdateSublayouts
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedSectionContentLayout;
  [(PXGCompositeLayout *)&v3 didUpdateSublayouts];
  [(PXFeedSectionContentLayout *)self _updateFeedSprites];
}

- (int64_t)scrollableAxis
{
  uint64_t v2 = [(PXGCompositeLayout *)self composition];
  int64_t v3 = [v2 scrollableAxis];

  return v3;
}

- (int64_t)itemForSpriteIndex:(unsigned int)a3
{
  if ([(PXGLayout *)self localNumberOfSprites] <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3;
  }
}

- (PXFeedSectionContentLayout)initWithViewModel:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXFeedSectionContentLayout;
  int v11 = [(PXGCompositeLayout *)&v25 init];
  double v12 = v11;
  if (v11)
  {
    p_viewModel = (id *)&v11->_viewModel;
    objc_storeStrong((id *)&v11->_viewModel, a3);
    [*p_viewModel registerChangeObserver:v12 context:ViewModelObservationContext_293261];
    [*p_viewModel registerAccessoryTapToRadarDiagnosticsProvider:v12];
    long long v14 = [*p_viewModel itemLayoutFactory];
    objc_storeStrong((id *)&v12->_itemLayoutFactory, v14);
    v12->_itemLayoutFactoryRespondsTo.setItemLayoutShouldAutoplayContentVideoTimeRange = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.setItemLayoutIsTouched = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.setItemLayoutIsHovered = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.BOOL shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.BOOL configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.decorationOverlayAnchorSpriteIndexForItemLayout = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.itemPlacementControllerForItemReferenceItemLayout = objc_opt_respondsToSelector() & 1;
    objc_storeStrong((id *)&v12->_dataSource, a4);
    long long v15 = *(_OWORD *)&a5->item;
    *(_OWORD *)&v12->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a5->dataSourceIdentifier;
    *(_OWORD *)&v12->_sectionIndexPath.item = v15;
    [(PXGLayout *)v12 setContentSource:v12];
    long long v16 = objc_alloc_init(PXFeedSublayoutComposition);
    [(PXGCompositeLayout *)v12 setComposition:v16];

    if (v12->_itemLayoutFactoryRespondsTo.setItemLayoutShouldAutoplayContentVideoTimeRange)
    {
      double v17 = [v9 spec];
      int v18 = [v17 allowsAutoplayContent];

      if (v18)
      {
        double v19 = [PXFeedAutoplayController alloc];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __76__PXFeedSectionContentLayout_initWithViewModel_dataSource_sectionIndexPath___block_invoke;
        v23[3] = &unk_1E5DD1B50;
        id v24 = v14;
        uint64_t v20 = [(PXFeedAutoplayController *)v19 initWithContainerLayout:v12 viewModel:v9 itemLayoutDesiredPlayStateSetter:v23];
        autoplayController = v12->_autoplayController;
        v12->_autoplayController = (PXFeedAutoplayController *)v20;
      }
    }
    [(PXFeedSectionContentLayout *)v12 _invalidateFeedSublayouts];
    [(PXFeedSectionContentLayout *)v12 _invalidateCompositionParameters];
    [(PXFeedSectionContentLayout *)v12 _invalidateAutoplayControllerParameters];
  }
  return v12;
}

uint64_t __76__PXFeedSectionContentLayout_initWithViewModel_dataSource_sectionIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  id v4 = *(void **)(a1 + 32);
  long long v5 = a4[1];
  v7[0] = *a4;
  v7[1] = v5;
  v7[2] = a4[2];
  return [v4 setItemLayout:a2 shouldAutoplayContent:a3 videoTimeRange:v7];
}

- (PXFeedSectionContentLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedSectionContentLayout.m", 67, @"%s is not available as initializer", "-[PXFeedSectionContentLayout init]");

  abort();
}

@end