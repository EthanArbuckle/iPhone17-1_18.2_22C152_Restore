@interface _PXCuratedLibraryLayoutAssetsSnapshot
- ($610C715A8B7E26897ADA48D0AF0CD277)spriteSnapshotForAssetWithIdentifier:(SEL)a3;
- (CGPoint)offset;
- (CGRect)fullyVisibleRect;
- (CGRect)visibleRect;
- (NSCopying)dominantAssetIdentifier;
- (_PXCuratedLibraryLayoutAssetsSnapshot)initWithLayout:(id)a3;
- (id)assetIdentifierForAssetReference:(id)a3;
- (int64_t)_addSpriteSnapshot:(id *)a3;
- (int64_t)zoomLevel;
- (void)dealloc;
- (void)enumerateAssetIdentifiersUsingBlock:(id)a3;
- (void)enumerateAssetInfoForGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 count:(unsigned int)a6 options:(unint64_t)a7 usingBlock:(id)a8;
- (void)setDominantAssetIdentifier:(id)a3;
- (void)setOffset:(CGPoint)a3;
@end

@implementation _PXCuratedLibraryLayoutAssetsSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteSnapshotIndexByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDominantAssetIdentifier:(id)a3
{
  v5 = [(NSDictionary *)self->_spriteSnapshotIndexByAssetIdentifier objectForKeyedSubscript:a3];
  id v17 = v5;
  if (!v5)
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m", 494, @"Invalid parameter not satisfying: %@", @"dominantIndex >= 0 && dominantIndex < _spriteSnapshotsCount" object file lineNumber description];

    int64_t spriteSnapshotsCount = self->_spriteSnapshotsCount;
    goto LABEL_7;
  }
  uint64_t v6 = [v5 integerValue];
  uint64_t v7 = v6;
  if (v6 < 0) {
    goto LABEL_6;
  }
  int64_t spriteSnapshotsCount = self->_spriteSnapshotsCount;
  if (v6 >= spriteSnapshotsCount) {
    goto LABEL_6;
  }
LABEL_7:
  unint64_t v10 = spriteSnapshotsCount - 1;
  if (spriteSnapshotsCount >= 1)
  {
    unint64_t v11 = (spriteSnapshotsCount + 1) & 0xFFFFFFFFFFFFFFFELL;
    uint64x2_t v12 = (uint64x2_t)vdupq_n_s64(v10);
    int64x2_t v13 = (int64x2_t)xmmword_1AB2F42D0;
    v14 = (BOOL *)&self->_spriteSnapshots[2].var0.size.height + 4;
    int64x2_t v15 = vdupq_n_s64(2uLL);
    do
    {
      int32x2_t v16 = vmovn_s64((int64x2_t)vcgeq_u64(v12, (uint64x2_t)v13));
      if (v16.i8[0]) {
        *(v14 - 56) = v7 == 0;
      }
      if (v16.i8[4]) {
        BOOL *v14 = v7 == 1;
      }
      int64x2_t v13 = vaddq_s64(v13, v15);
      v14 += 112;
      v7 -= 2;
      v11 -= 2;
    }
    while (v11);
  }
}

- (NSCopying)dominantAssetIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__154825;
  unint64_t v10 = __Block_byref_object_dispose__154826;
  id v11 = 0;
  spriteSnapshotIndexByAssetIdentifier = self->_spriteSnapshotIndexByAssetIdentifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___PXCuratedLibraryLayoutAssetsSnapshot_dominantAssetIdentifier__block_invoke;
  v5[3] = &unk_1E5DBFF70;
  v5[5] = &v6;
  v5[6] = a2;
  v5[4] = self;
  [(NSDictionary *)spriteSnapshotIndexByAssetIdentifier enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSCopying *)v3;
}

- (void)enumerateAssetIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  spriteSnapshotIndexByAssetIdentifier = self->_spriteSnapshotIndexByAssetIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77___PXCuratedLibraryLayoutAssetsSnapshot_enumerateAssetIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_1E5DBFF48;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)spriteSnapshotIndexByAssetIdentifier enumerateKeysAndObjectsUsingBlock:v7];
}

- ($610C715A8B7E26897ADA48D0AF0CD277)spriteSnapshotForAssetWithIdentifier:(SEL)a3
{
  id v7 = a4;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr[1].var0.origin.double y = 0.0;
  if (v7)
  {
    id v15 = v7;
    id v8 = [(NSDictionary *)self->_spriteSnapshotIndexByAssetIdentifier objectForKeyedSubscript:v7];
    id v7 = v15;
    if (v8)
    {
      int64_t v9 = [v8 integerValue];
      int64_t v10 = v9;
      if (v9 < 0 || v9 >= self->_spriteSnapshotsCount)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a3, self, @"PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m", 465, @"Invalid parameter not satisfying: %@", @"index >= 0 && index < _spriteSnapshotsCount" object file lineNumber description];
      }
      id v11 = (char *)self->_spriteSnapshots + 56 * v10;
      CGSize v12 = (CGSize)*((_OWORD *)v11 + 1);
      retstr->var0.origin = *(CGPoint *)v11;
      retstr->var0.size = v12;
      *(_OWORD *)&retstr->var1 = *((_OWORD *)v11 + 2);
      retstr[1].var0.origin.double y = *((CGFloat *)v11 + 6);
      [(_PXCuratedLibraryLayoutAssetsSnapshot *)self offset];
      PXPointAdd();
    }
  }
  retstr[1].var0.origin.double y = 0.0;
  retstr->var0.origin = (CGPoint)PXCuratedLibrarySpriteSnapshotNull;
  retstr->var0.size = (CGSize)unk_1AB35B160;
  *(_OWORD *)&retstr->var1 = xmmword_1AB35B170;

  return result;
}

- (id)assetIdentifierForAssetReference:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  dataSource = self->_dataSource;
  if (dataSource)
  {
    [(PXAssetsDataSource *)dataSource indexPathForAssetReference:v4];
    uint64_t v6 = v11;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6 == *(void *)off_1E5DAAED8)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = self->_dataSource;
    v10[0] = v11;
    v10[1] = v12;
    id v7 = [(PXAssetsDataSource *)v8 assetIdentifierAtItemIndexPath:v10];
  }

  return v7;
}

- (void)enumerateAssetInfoForGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 count:(unsigned int)a6 options:(unint64_t)a7 usingBlock:(id)a8
{
  char v8 = a7;
  id v12 = a8;
  [(PXAssetsDataSource *)self->_dataSource identifier];
  if (a6)
  {
    uint64_t v13 = 0;
    v14 = a5 + 1;
    do
    {
      if ((v8 & 1) != 0 || v14[-1].var1 == 2) {
        PXGSectionedSpriteTagDecompose();
      }
      ++v13;
      v14 = (const $786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)v14 + 40);
    }
    while (a6 != v13);
  }
}

- (CGRect)fullyVisibleRect
{
}

- (CGRect)visibleRect
{
}

- (int64_t)_addSpriteSnapshot:(id *)a3
{
  uint64_t spriteSnapshotsCount = self->_spriteSnapshotsCount;
  spriteSnapshotsCapacitdouble y = self->_spriteSnapshotsCapacity;
  self->_uint64_t spriteSnapshotsCount = spriteSnapshotsCount + 1;
  if (spriteSnapshotsCount >= spriteSnapshotsCapacity)
  {
    if (spriteSnapshotsCapacity)
    {
      do
      {
        int64_t v5 = 2 * spriteSnapshotsCapacity;
        BOOL v6 = spriteSnapshotsCount < 2 * spriteSnapshotsCapacity;
        spriteSnapshotsCapacity *= 2;
      }
      while (!v6);
    }
    else
    {
      int64_t v5 = 32;
    }
    self->_spriteSnapshotsCapacitdouble y = v5;
    _PXGArrayResize();
  }
  id v7 = (char *)self->_spriteSnapshots + 56 * spriteSnapshotsCount;
  CGPoint origin = a3->var0.origin;
  CGSize size = a3->var0.size;
  long long v10 = *(_OWORD *)&a3->var1;
  *((void *)v7 + 6) = *(void *)&a3[1].var0.origin.y;
  *((CGSize *)v7 + 1) = size;
  *((_OWORD *)v7 + 2) = v10;
  *(CGPoint *)id v7 = origin;
  return spriteSnapshotsCount;
}

- (void)dealloc
{
  free(self->_spriteSnapshots);
  v3.receiver = self;
  v3.super_class = (Class)_PXCuratedLibraryLayoutAssetsSnapshot;
  [(_PXCuratedLibraryLayoutAssetsSnapshot *)&v3 dealloc];
}

- (_PXCuratedLibraryLayoutAssetsSnapshot)initWithLayout:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_PXCuratedLibraryLayoutAssetsSnapshot *)self init];
  if (v5)
  {
    [v4 visibleRect];
    v5->_visibleRect.origin.double x = v6;
    v5->_visibleRect.origin.double y = v7;
    v5->_visibleRect.size.width = v8;
    v5->_visibleRect.size.height = v9;
    [v4 fullyVisibleRect];
    v5->_fullyVisibleRect.origin.double x = v10;
    v5->_fullyVisibleRect.origin.double y = v11;
    v5->_fullyVisibleRect.size.width = v12;
    v5->_fullyVisibleRect.size.height = v13;
    uint64_t v14 = [v4 presentedZoomLevel];
    v5->_int64_t zoomLevel = v14;
    if (v14 == 4) {
      [v4 allPhotosLayout];
    }
    else {
    id v15 = [v4 libraryBodyLayout];
    }
    uint64_t v16 = [v15 presentedDataSource];
    dataSource = v5->_dataSource;
    v5->_dataSource = (PXAssetsDataSource *)v16;

    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__154825;
    v47 = __Block_byref_object_dispose__154826;
    id v48 = 0;
    int64_t zoomLevel = v5->_zoomLevel;
    if ((unint64_t)(zoomLevel - 1) >= 2)
    {
      if (zoomLevel != 3)
      {
LABEL_10:
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v26 = [v4 numberOfSprites] << 32;
        uint64_t v32 = MEMORY[0x1E4F143A8];
        uint64_t v33 = 3221225472;
        v34 = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_4;
        v35 = &unk_1E5DBFF20;
        v27 = v5;
        v36 = v27;
        v38 = &v43;
        id v28 = v25;
        id v37 = v28;
        [v4 enumerateSpritesInRange:v26 options:1 usingBlock:&v32];
        uint64_t v29 = objc_msgSend(v28, "copy", v32, v33, v34, v35);
        spriteSnapshotIndexByAssetIdentifier = v27->_spriteSnapshotIndexByAssetIdentifier;
        v27->_spriteSnapshotIndexByAssetIdentifier = (NSDictionary *)v29;

        _Block_object_dispose(&v43, 8);
        goto LABEL_11;
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke;
      v39[3] = &unk_1E5DBFED0;
      id v40 = v4;
      v41 = v5;
      v42 = &v43;
      [v40 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v39];

      id v22 = v40;
    }
    else
    {
      v19 = [v4 libraryBodyLayout];
      v20 = [v19 dominantSectionLayout];
      v21 = [v20 assetCollectionReference];
      id v22 = [v21 keyAssetReference];

      uint64_t v23 = [(_PXCuratedLibraryLayoutAssetsSnapshot *)v5 assetIdentifierForAssetReference:v22];
      v24 = (void *)v44[5];
      v44[5] = v23;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

@end