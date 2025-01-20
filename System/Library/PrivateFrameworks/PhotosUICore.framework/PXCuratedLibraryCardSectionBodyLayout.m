@interface PXCuratedLibraryCardSectionBodyLayout
- (BOOL)isSelected;
- (BOOL)isSkimming;
- (CGRect)assetFrame;
- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3;
- (PXAssetsDataSource)dataSource;
- (PXCuratedLibraryCardSectionBodyLayout)init;
- (PXCuratedLibraryCardSectionBodyLayoutSpec)spec;
- (PXCuratedLibrarySectionGeometryDescriptor)presentedGeometryDescriptor;
- (PXDisplayAssetFetchResult)keyAssetsFetchResult;
- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController;
- (PXGLayoutGuide)assetLayoutGuide;
- (PXIndexPathSet)skimmingIndexPaths;
- (PXSimpleIndexPath)sectionIndexPath;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axSelectedSpriteIndexes;
- (id)axSpriteIndexes;
- (id)axSpriteIndexesInRect:(CGRect)a3;
- (id)axVisibleSpriteIndexes;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)layoutForItemChanges;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (int64_t)currentSkimmingIndex;
- (int64_t)maxSkimmingIndex;
- (int64_t)section;
- (int64_t)zoomLevel;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3;
- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (void)_updateAXSprites;
- (void)_updateKeyAssetFetchResultWithDataSource:(id)a3 section:(int64_t)a4;
- (void)_updateSprites;
- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6;
- (void)displayScaleDidChange;
- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3;
- (void)referenceSizeDidChange;
- (void)setCurrentSkimmingIndex:(int64_t)a3;
- (void)setDataSource:(id)a3 section:(int64_t)a4;
- (void)setInlinePlaybackController:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setIsSkimming:(BOOL)a3;
- (void)setMaxSkimmingIndex:(int64_t)a3;
- (void)setSkimmingIndexPaths:(id)a3;
- (void)setSpec:(id)a3;
- (void)setZoomLevel:(int64_t)a3;
- (void)update;
@end

@implementation PXCuratedLibraryCardSectionBodyLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetLayoutGuide, 0);
  objc_storeStrong((id *)&self->_skimmingIndexPaths, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

- (PXDisplayAssetFetchResult)keyAssetsFetchResult
{
  return self->_keyAssetsFetchResult;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[32].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[31].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXGLayoutGuide)assetLayoutGuide
{
  return self->_assetLayoutGuide;
}

- (int64_t)currentSkimmingIndex
{
  return self->_currentSkimmingIndex;
}

- (int64_t)maxSkimmingIndex
{
  return self->_maxSkimmingIndex;
}

- (PXIndexPathSet)skimmingIndexPaths
{
  return self->_skimmingIndexPaths;
}

- (BOOL)isSkimming
{
  return self->_isSkimming;
}

- (void)setInlinePlaybackController:(id)a3
{
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (PXCuratedLibraryCardSectionBodyLayoutSpec)spec
{
  return self->_spec;
}

- (void)setZoomLevel:(int64_t)a3
{
  self->_zoomLevel = a3;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)section
{
  return self->_section;
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  long long v4 = 0u;
  long long v5 = 0u;
  -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", self->_assetSpriteIndexRange.location, 0, 0, 0, 0);
  PXRectWithCenterAndSize();
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  if (self->_assetSpriteIndexRange.location != a3) {
    return -1;
  }
  if (a4 != 6)
  {
    if (a4 == 5)
    {
      uint64_t v4 = 1001;
      unsigned int v5 = 1001;
      goto LABEL_7;
    }
    return -1;
  }
  uint64_t v4 = 1000;
  unsigned int v5 = 1000;
LABEL_7:
  if ([(NSMutableIndexSet *)self->_axSpriteIndexes containsIndex:v4]) {
    return v5;
  }
  else {
    return -1;
  }
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  if (self->_assetSpriteIndexRange.location == a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
    uint64_t v4 = [(PXGLayout *)&v7 axContentInfoAtSpriteIndex:*(void *)&a3];
  }
  else
  {
    unsigned int v5 = [(PXCuratedLibraryCardSectionBodyLayout *)self displayAssetFetchResultForSpritesInRange:a3 | 0x100000000 inLayout:self];
    if ([v5 count] >= 1)
    {
      [(PXGLayout *)self geometryForSpriteAtIndex:self->_assetSpriteIndexRange.location];
      PXRectWithCenterAndSize();
    }
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)axSelectedSpriteIndexes
{
  if ([(PXCuratedLibraryCardSectionBodyLayout *)self isSelected]) {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:self->_assetSpriteIndexRange.location];
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  return v3;
}

- (id)axSpriteIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_axSpriteIndexes copy];
  return v2;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  unsigned int location = a3.location;
  v6 = (PXCuratedLibraryCardSectionBodyLayout *)a4;
  objc_super v7 = v6;
  if (v6 != self || (location & 0xFFFFFFFE) != 0x3E8)
  {
LABEL_18:
    v17 = [(PXCuratedLibraryCardSectionBodyLayout *)self keyAssetsFetchResult];
    goto LABEL_19;
  }
  v8 = [(PXCuratedLibraryCardSectionBodyLayout *)v6 skimmingIndexPaths];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = [(PXCuratedLibraryCardSectionBodyLayout *)v7 currentSkimmingIndex];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x4010000000;
  v28 = &unk_1AB5D584F;
  long long v9 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v29 = *(_OWORD *)off_1E5DAB028;
  long long v30 = v9;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__PXCuratedLibraryCardSectionBodyLayout_displayAssetFetchResultForSpritesInRange_inLayout___block_invoke;
  v24[3] = &unk_1E5DB62B8;
  v24[4] = v31;
  v24[5] = &v25;
  [v8 enumerateSectionIndexPathsUsingBlock:v24];
  uint64_t v10 = *(void *)off_1E5DAB028;
  long long v22 = *(_OWORD *)((char *)off_1E5DAB028 + 8);
  uint64_t v23 = *((void *)off_1E5DAB028 + 3);
  v11 = (long long *)(v26 + 4);
  uint64_t v12 = *(void *)off_1E5DAAED8;
  if (v26[4] != *(void *)off_1E5DAAED8)
  {
    if (location == 1001)
    {
      if (v8)
      {
        long long v14 = *((_OWORD *)v26 + 3);
        long long v19 = *v11;
        long long v20 = v14;
        [v8 indexPathGreaterThanIndexPath:&v19];
        goto LABEL_10;
      }
LABEL_11:
      uint64_t v10 = 0;
      memset(v21, 0, sizeof(v21));
      goto LABEL_12;
    }
    if (location == 1000)
    {
      if (v8)
      {
        long long v13 = *((_OWORD *)v26 + 3);
        long long v19 = *v11;
        long long v20 = v13;
        [v8 indexPathLessThanIndexPath:&v19];
LABEL_10:
        uint64_t v10 = *(void *)&v21[0];
LABEL_12:
        long long v22 = *(_OWORD *)((char *)v21 + 8);
        uint64_t v23 = *((void *)&v21[1] + 1);
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
LABEL_13:
  v15 = [(PXCuratedLibraryCardSectionBodyLayout *)v7 dataSource];
  v16 = v15;
  if (v10 == v12 || [v15 identifier] != v10)
  {
    v17 = 0;
  }
  else
  {
    *(void *)&v21[0] = v10;
    *(_OWORD *)((char *)v21 + 8) = v22;
    *((void *)&v21[1] + 1) = v23;
    v17 = [v16 keyAssetsInSectionIndexPath:v21];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);

  if (!v17) {
    goto LABEL_18;
  }
LABEL_19:

  return v17;
}

uint64_t __91__PXCuratedLibraryCardSectionBodyLayout_displayAssetFetchResultForSpritesInRange_inLayout___block_invoke(uint64_t result, _OWORD *a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (!v4)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
    long long v6 = a2[1];
    *(_OWORD *)(v5 + 32) = *a2;
    *(_OWORD *)(v5 + 48) = v6;
    *a3 = 1;
    uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
    uint64_t v4 = *(void *)(v3 + 24);
  }
  *(void *)(v3 + 24) = v4 - 1;
  return result;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3 == 2)
  {
    long long v6 = [(PXCuratedLibraryCardSectionBodyLayout *)self spec];
    char v7 = [v6 allowsVideoPlaybackAtAnySize];

    if ((v7 & 1) == 0)
    {
      [(PXCuratedLibraryCardSectionBodyLayout *)self assetFrame];
      double v3 = v8;
      double v4 = v9;
    }
  }
  double v10 = v3;
  double v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 3;
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  p_assetSpriteIndexRange = &self->_assetSpriteIndexRange;
  if (self->_assetSpriteIndexRange.length)
  {
    uint64_t v5 = [(PXCuratedLibraryCardSectionBodyLayout *)self dataSource];
    uint64_t v6 = [v5 identifier];
    int64_t v7 = [(PXCuratedLibraryCardSectionBodyLayout *)self section];
    uint64_t location = p_assetSpriteIndexRange->location;
    v11[0] = v6;
    v11[1] = v7;
    v11[2] = location;
    v11[3] = 0x7FFFFFFFFFFFFFFFLL;
    double v9 = [v5 assetReferenceAtItemIndexPath:v11];
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  if (self->_assetSpriteIndexRange.length)
  {
    char v3 = 0;
    (*((void (**)(id, void, uint64_t, char *))a3 + 2))(a3, self->_assetSpriteIndexRange.location, 1, &v3);
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
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
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryCardSectionBodyLayout.m", 268, @"invalidating %lu after it already has been updated", 1);

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
  v8.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
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
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryCardSectionBodyLayout.m", 263, @"invalidating %lu after it already has been updated", 1);

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

- (void)setSpec:(id)a3
{
  uint64_t v5 = (PXCuratedLibraryCardSectionBodyLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    double v11 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
LABEL_8:
        uint64_t v5 = v11;
        goto LABEL_9;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v9 = [MEMORY[0x1E4F28B00] currentHandler];
        double v10 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout setSpec:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXCuratedLibraryCardSectionBodyLayout.m", 256, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    uint64_t v5 = v11;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)setIsSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    [(PXGLayout *)self setNeedsUpdate];
    id v4 = [(PXGLayout *)self axGroup];
    [v4 invalidateLeafs];
  }
}

- (void)setCurrentSkimmingIndex:(int64_t)a3
{
  if (self->_currentSkimmingIndex != a3)
  {
    self->_currentSkimmingIndex = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    int isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        uint64_t v7 = needsUpdate | 1;
        p_updateFlags->unint64_t needsUpdate = v7;
        goto LABEL_9;
      }
LABEL_7:
      if (self->_updateFlags.updated)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout setCurrentSkimmingIndex:]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryCardSectionBodyLayout.m", 238, @"invalidating %lu after it already has been updated", 1);
        goto LABEL_25;
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
      int isPerformingUpdate = 1;
      goto LABEL_7;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (willPerformUpdate)
    {
      uint64_t v8 = 3;
      goto LABEL_12;
    }
    [(PXGLayout *)self setNeedsUpdate];
    uint64_t v7 = p_updateFlags->needsUpdate;
    int isPerformingUpdate = p_updateFlags->isPerformingUpdate;
    if (p_updateFlags->needsUpdate)
    {
LABEL_9:
      if (!isPerformingUpdate)
      {
LABEL_11:
        uint64_t v8 = v7 | 2;
LABEL_12:
        p_updateFlags->unint64_t needsUpdate = v8;
        return;
      }
      goto LABEL_10;
    }
    if (p_updateFlags->isPerformingUpdate)
    {
      uint64_t v7 = 0;
LABEL_10:
      if ((p_updateFlags->updated & 2) == 0) {
        goto LABEL_11;
      }
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout setCurrentSkimmingIndex:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryCardSectionBodyLayout.m", 239, @"invalidating %lu after it already has been updated", 2);
LABEL_25:

      abort();
    }
    BOOL v10 = p_updateFlags->willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!v10)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setMaxSkimmingIndex:(int64_t)a3
{
  if (self->_maxSkimmingIndex != a3)
  {
    self->_maxSkimmingIndex = a3;
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout setMaxSkimmingIndex:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryCardSectionBodyLayout.m", 230, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setSkimmingIndexPaths:(id)a3
{
  long long v13 = (PXIndexPathSet *)a3;
  uint64_t v5 = self->_skimmingIndexPaths;
  if (v5 == v13)
  {

LABEL_10:
    uint64_t v7 = v13;
    goto LABEL_11;
  }
  char v6 = [(PXIndexPathSet *)v13 isEqual:v5];

  uint64_t v7 = v13;
  if (v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_skimmingIndexPaths, a3);
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      goto LABEL_10;
    }
LABEL_8:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout setSkimmingIndexPaths:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryCardSectionBodyLayout.m", 222, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  uint64_t v7 = v13;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setIsSkimming:(BOOL)a3
{
  if (self->_isSkimming != a3)
  {
    self->_isSkimming = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    int isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        uint64_t v7 = needsUpdate | 1;
        p_updateFlags->unint64_t needsUpdate = v7;
        goto LABEL_9;
      }
LABEL_7:
      if (self->_updateFlags.updated)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout setIsSkimming:]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryCardSectionBodyLayout.m", 213, @"invalidating %lu after it already has been updated", 1);
        goto LABEL_25;
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
      int isPerformingUpdate = 1;
      goto LABEL_7;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (willPerformUpdate)
    {
      uint64_t v8 = 3;
      goto LABEL_12;
    }
    [(PXGLayout *)self setNeedsUpdate];
    uint64_t v7 = p_updateFlags->needsUpdate;
    int isPerformingUpdate = p_updateFlags->isPerformingUpdate;
    if (p_updateFlags->needsUpdate)
    {
LABEL_9:
      if (!isPerformingUpdate)
      {
LABEL_11:
        uint64_t v8 = v7 | 2;
LABEL_12:
        p_updateFlags->unint64_t needsUpdate = v8;
        return;
      }
      goto LABEL_10;
    }
    if (p_updateFlags->isPerformingUpdate)
    {
      uint64_t v7 = 0;
LABEL_10:
      if ((p_updateFlags->updated & 2) == 0) {
        goto LABEL_11;
      }
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout setIsSkimming:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryCardSectionBodyLayout.m", 214, @"invalidating %lu after it already has been updated", 2);
LABEL_25:

      abort();
    }
    BOOL v10 = p_updateFlags->willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!v10)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_updateKeyAssetFetchResultWithDataSource:(id)a3 section:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [v6 identifier];
  int64_t v26 = v7;
  int64_t v27 = a4;
  int64x2_t v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  int64x2_t v28 = v25;
  uint64_t v8 = [v6 keyAssetsInSectionIndexPath:&v26];
  if (![v8 count])
  {
    int64_t v26 = v7;
    int64_t v27 = a4;
    int64x2_t v28 = v25;
    uint64_t v9 = [v6 assetsInSectionIndexPath:&v26];

    uint64_t v8 = (void *)v9;
  }
  BOOL v10 = [v8 firstObject];
  double v11 = [(PXDisplayAssetFetchResult *)self->_keyAssetsFetchResult firstObject];
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_13;
  }
  long long v14 = v13;
  if (!v12 || !v13)
  {

LABEL_12:
    ++self->_assetVersion;
    goto LABEL_13;
  }
  uint64_t v15 = [v12 isContentEqualTo:v13];
  if (!v15) {
    uint64_t v15 = [v14 isContentEqualTo:v12];
  }

  if (v15 != 2) {
    goto LABEL_12;
  }
LABEL_13:
  self->_sectionIndexPath.dataSourceIdentifier = v7;
  self->_sectionIndexPath.section = a4;
  *(int64x2_t *)&self->_sectionIndexPath.item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, v8);
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  BOOL isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_19:
      uint64_t v19 = needsUpdate | 1;
      p_updateFlags->unint64_t needsUpdate = v19;
      goto LABEL_20;
    }
LABEL_18:
    if (self->_updateFlags.updated)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout _updateKeyAssetFetchResultWithDataSource:section:]"];
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXCuratedLibraryCardSectionBodyLayout.m", 204, @"invalidating %lu after it already has been updated", 1);
      goto LABEL_34;
    }
    goto LABEL_19;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
    BOOL isPerformingUpdate = 1;
    goto LABEL_18;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (willPerformUpdate)
  {
    uint64_t v20 = 3;
    goto LABEL_23;
  }
  [(PXGLayout *)self setNeedsUpdate];
  uint64_t v19 = p_updateFlags->needsUpdate;
  BOOL isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
  if (p_updateFlags->needsUpdate)
  {
LABEL_20:
    if (!isPerformingUpdate)
    {
LABEL_22:
      uint64_t v20 = v19 | 2;
LABEL_23:
      p_updateFlags->unint64_t needsUpdate = v20;
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v19 = 0;
LABEL_21:
    if ((self->_updateFlags.updated & 2) == 0) {
      goto LABEL_22;
    }
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout _updateKeyAssetFetchResultWithDataSource:section:]"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXCuratedLibraryCardSectionBodyLayout.m", 205, @"invalidating %lu after it already has been updated", 2);
LABEL_34:

    abort();
  }
  BOOL v22 = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!v22) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_24:
}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_section != __PAIR128__((unint64_t)v7, a4))
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    self->_section = a4;
    [(PXCuratedLibraryCardSectionBodyLayout *)self _updateKeyAssetFetchResultWithDataSource:v8 section:a4];
    id v7 = v8;
  }
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 removedIndexes];
  long long v14 = [v10 insertedIndexes];
  if (![v13 isEqualToIndexSet:v14]) {
    goto LABEL_6;
  }
  uint64_t v15 = [v10 changedIndexes];
  if ([v15 count])
  {

LABEL_6:
    goto LABEL_7;
  }
  v16 = [v10 removedIndexes];
  uint64_t v17 = [v16 count];

  if (v17 == 1)
  {
    id v13 = [v10 insertedIndexes];
    [off_1E5DA5568 changeDetailsWithChangedIndexes:v13];
    long long v14 = v10;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  v18.receiver = self;
  v18.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  [(PXGLayout *)&v18 applySpriteChangeDetails:v10 countAfterChanges:v8 initialState:v11 modifyState:v12];
}

- (id)layoutForItemChanges
{
  return 0;
}

- (PXCuratedLibrarySectionGeometryDescriptor)presentedGeometryDescriptor
{
}

- (id)axVisibleSpriteIndexes
{
  char v3 = [(PXCuratedLibraryCardSectionBodyLayout *)self axSpriteIndexes];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeIndex:1000];
  [v4 removeIndex:1001];
  uint64_t v5 = [(PXGLayout *)self spriteDataStore];
  if ([v4 lastIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = [v4 lastIndex];
    if (v6 > [v5 count]) {
      PXAssertGetLog();
    }
  }
  [(PXGLayout *)self visibleRect];
  id v7 = objc_msgSend(v5, "spriteAtIndexes:inRect:", v4);

  return v7;
}

- (void)_updateAXSprites
{
  if ([(PXCuratedLibraryCardSectionBodyLayout *)self zoomLevel] == 1
    && [(PXCuratedLibraryCardSectionBodyLayout *)self isSkimming])
  {
    uint64_t v3 = [(PXCuratedLibraryCardSectionBodyLayout *)self currentSkimmingIndex];
    axSpriteIndexes = self->_axSpriteIndexes;
    if (v3 < 1) {
      [(NSMutableIndexSet *)axSpriteIndexes removeIndex:1000];
    }
    else {
      [(NSMutableIndexSet *)axSpriteIndexes addIndex:1000];
    }
    int64_t v5 = [(PXCuratedLibraryCardSectionBodyLayout *)self maxSkimmingIndex];
    unint64_t v6 = self->_axSpriteIndexes;
    if (v3 >= v5)
    {
      [(NSMutableIndexSet *)v6 removeIndex:1001];
    }
    else
    {
      [(NSMutableIndexSet *)v6 addIndex:1001];
    }
  }
}

- (void)_updateSprites
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(PXCuratedLibraryCardSectionBodyLayout *)self spec];
  if (!objc_claimAutoreleasedReturnValue())
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCuratedLibraryCardSectionBodyLayout.m", 85, @"missing spec on %@", self object file lineNumber description];
  }
  [(PXGLayout *)self displayScale];
  [(PXGLayout *)self referenceSize];
  [(PXCuratedLibraryCardSectionBodyLayout *)self assetFrame];
  id v4 = [(PXCuratedLibraryCardSectionBodyLayout *)self keyAssetsFetchResult];
  int64_t v5 = [v4 firstObject];
  keyAsset = self->_keyAsset;
  self->_keyAsset = v5;

  if (!self->_keyAsset)
  {
    id v7 = [(PXCuratedLibraryCardSectionBodyLayout *)self dataSource];
    [(PXCuratedLibraryCardSectionBodyLayout *)self sectionIndexPath];
    uint64_t v8 = [v7 assetCollectionAtSectionIndexPath:v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_fault_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Empty key asset fetch result for asset collection: %@", buf, 0xCu);
    }
  }
  PXSizeGetAspectRatio();
}

void __55__PXCuratedLibraryCardSectionBodyLayout__updateSprites__block_invoke(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  CGFloat v9 = *(double *)(a1 + 48);
  CGFloat v10 = *(double *)(a1 + 56);
  CGFloat v11 = *(double *)(a1 + 64);
  CGFloat v12 = *(double *)(a1 + 72);
  v31.origin.x = v9;
  v31.origin.y = v10;
  v31.size.width = v11;
  v31.size.height = v12;
  CGFloat MidX = CGRectGetMidX(v31);
  v32.origin.x = v9;
  v32.origin.y = v10;
  v32.size.width = v11;
  v32.size.height = v12;
  CGFloat MidY = CGRectGetMidY(v32);
  v33.origin.x = v9;
  v33.origin.y = v10;
  v33.size.width = v11;
  v33.size.height = v12;
  CGFloat Width = CGRectGetWidth(v33);
  v34.origin.x = v9;
  v34.origin.y = v10;
  v34.size.width = v11;
  v34.size.height = v12;
  CGFloat Height = CGRectGetHeight(v34);
  v16.f64[0] = Width;
  v16.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFD99999A0000000;
  a3[3] = vcvt_f32_f64(v16);
  long long v17 = *((_OWORD *)off_1E5DAAF90 + 1);
  *(_OWORD *)a4 = *(_OWORD *)off_1E5DAAF90;
  *(_OWORD *)(a4 + 16) = v17;
  long long v18 = *((_OWORD *)off_1E5DAAF90 + 5);
  *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
  *(_OWORD *)(a4 + 80) = v18;
  long long v19 = *((_OWORD *)off_1E5DAAF90 + 3);
  *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
  *(_OWORD *)(a4 + 48) = v19;
  long long v20 = *((_OWORD *)off_1E5DAAF90 + 9);
  *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
  *(_OWORD *)(a4 + 144) = v20;
  long long v21 = *((_OWORD *)off_1E5DAAF90 + 7);
  *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
  *(_OWORD *)(a4 + 112) = v21;
  *(float32x4_t *)(a4 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 80)), *(float64x2_t *)(a1 + 96));
  [*(id *)(a1 + 32) cornerRadius];
  *(_DWORD *)(a4 + 36) = v22;
  *(_DWORD *)(a4 + 40) = v23;
  *(_DWORD *)(a4 + 44) = v24;
  *(_DWORD *)(a4 + 48) = v25;
  *(void *)(a5 + 32) = *((void *)off_1E5DAAF88 + 4);
  long long v26 = *((_OWORD *)off_1E5DAAF88 + 1);
  *(_OWORD *)a5 = *(_OWORD *)off_1E5DAAF88;
  *(_OWORD *)(a5 + 16) = v26;
  if (*(void *)(*(void *)(a1 + 40) + 856)) {
    char v27 = 2;
  }
  else {
    char v27 = 5;
  }
  *(unsigned char *)(a5 + 1) = v27;
  *(_WORD *)(a5 + 32) = *(_WORD *)(*(void *)(a1 + 40) + 848);
  float v28 = *(double *)(a1 + 112);
  *(float32x2_t *)(a5 + 8) = vmul_n_f32(a3[3], v28);
  long long v29 = *(void **)(a1 + 40);
  if (v29) {
    [v29 sectionIndexPath];
  }
  PXGSectionedSpriteTagMake();
}

uint64_t __55__PXCuratedLibraryCardSectionBodyLayout__updateSprites__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRect:inLayout:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
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
      CGFloat v9 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v10 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXCuratedLibraryCardSectionBodyLayout.m", 69, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->BOOL isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXCuratedLibraryCardSectionBodyLayout *)self _updateSprites];
      if (!p_updateFlags->isPerformingUpdate)
      {
        float64x2_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
        long long v17 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout update]"];
        [v16 handleFailureInFunction:v17, @"PXCuratedLibraryCardSectionBodyLayout.m", 73, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXCuratedLibraryCardSectionBodyLayout *)self _updateAXSprites];
      unint64_t v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->BOOL isPerformingUpdate = 0;
    if (v5)
    {
      CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout update]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryCardSectionBodyLayout.m", 76, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  [(PXGLayout *)&v18 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      self->_postUpdateFlags.updated = 0;
      self->_postUpdateFlags.BOOL isPerformingUpdate = 0;
LABEL_14:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXCuratedLibraryCardSectionBodyLayout.m", 80, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);

      return;
    }
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v14 = [NSString stringWithUTF8String:"-[PXCuratedLibraryCardSectionBodyLayout update]"];
    [v13 handleFailureInFunction:v14, @"PXCuratedLibraryCardSectionBodyLayout.m", 78, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t v15 = p_postUpdateFlags->needsUpdate;
    p_postUpdateFlags->updated = 0;
    p_postUpdateFlags->BOOL isPerformingUpdate = 0;
    if (v15) {
      goto LABEL_14;
    }
  }
}

- (CGRect)assetFrame
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PXGLayout *)self referenceSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (PXCuratedLibraryCardSectionBodyLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  double v2 = [(PXGLayout *)&v8 init];
  if (v2)
  {
    double v3 = objc_alloc_init(PXGLayoutGuide);
    assetLayoutGuide = v2->_assetLayoutGuide;
    v2->_assetLayoutGuide = v3;

    v2->_assetSpriteIndexRange = (_PXGSpriteIndexRange)0x100000000;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:v2->_assetSpriteIndexRange.location];
    axSpriteIndexes = v2->_axSpriteIndexes;
    v2->_axSpriteIndexes = (NSMutableIndexSet *)v5;
  }
  return v2;
}

@end