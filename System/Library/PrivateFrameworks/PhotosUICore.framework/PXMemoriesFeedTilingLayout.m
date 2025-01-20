@interface PXMemoriesFeedTilingLayout
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)_contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a3 forAspectRatio:(double)a4;
- (CGRect)contentBounds;
- (PXCollectionTileLayoutTemplate)_tileLayoutTemplate;
- (PXIndexPathSet)selectedMemoryIndexPaths;
- (PXMemoriesFeedDataSource)dataSource;
- (PXMemoriesFeedTilingLayout)init;
- (PXMemoriesFeedTilingLayout)initWithSpec:(id)a3 layoutSnapshot:(id)a4;
- (PXMemoriesFeedTilingLayoutDelegate)delegate;
- (PXMemoriesSpec)spec;
- (PXSectionedLayoutSnapshot)layoutSnapshot;
- (PXSimpleIndexPath)highlightedMemoryIndexPath;
- (PXSimpleIndexPath)indexPathForMemoryAtPoint:(SEL)a3;
- (PXSimpleIndexPath)indexPathForTileIdentifier:(SEL)a3;
- (PXTileIdentifier)tileIdentifierAtIndexPath:(SEL)a3 withTileKind:(PXSimpleIndexPath *)a4;
- (id)_titleFontNameForMemoryAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)_viewSpecForTileWithIdentifier:(PXTileIdentifier *)a3 boundingSize:(CGSize)a4;
- (id)indexPathsForMemoriesInRect:(CGRect)a3;
- (int64_t)_itemKindForTileKind:(int64_t)a3;
- (int64_t)dataSourceIdentifierForTileIdentifier:(PXTileIdentifier *)a3;
- (int64_t)tileKindForTileIdentifier:(PXTileIdentifier *)a3;
- (unint64_t)_zPositionForTileWithIdentifier:(PXTileIdentifier *)a3;
- (void)_addTileWithKind:(int64_t)a3 entryIndex:(unint64_t)a4 memoryIndex:(unint64_t)a5 usingBlock:(id)a6;
- (void)_invalidateSelectionTilesWithTag:(id)a3;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHighlightedMemoryIndexPath:(PXSimpleIndexPath *)a3;
- (void)setLayoutSnapshot:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setSelectedMemoryIndexPaths:(id)a3;
- (void)setSpec:(id)a3;
@end

@implementation PXMemoriesFeedTilingLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tileLayoutTemplate, 0);
  objc_storeStrong((id *)&self->_layoutSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedMemoryIndexPaths, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (PXCollectionTileLayoutTemplate)_tileLayoutTemplate
{
  return self->__tileLayoutTemplate;
}

- (PXSectionedLayoutSnapshot)layoutSnapshot
{
  return self->_layoutSnapshot;
}

- (PXMemoriesFeedTilingLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXMemoriesFeedTilingLayoutDelegate *)WeakRetained;
}

- (PXIndexPathSet)selectedMemoryIndexPaths
{
  return self->_selectedMemoryIndexPaths;
}

- (PXSimpleIndexPath)highlightedMemoryIndexPath
{
  long long v3 = *(_OWORD *)&self[5].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[5].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setSpec:(id)a3
{
}

- (PXMemoriesSpec)spec
{
  return self->_spec;
}

- (void)_invalidateSelectionTilesWithTag:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v5 setTag:v4];

  selectedMemoryIndexPaths = self->_selectedMemoryIndexPaths;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PXMemoriesFeedTilingLayout__invalidateSelectionTilesWithTag___block_invoke;
  v8[3] = &unk_1E5DCC248;
  v9 = v5;
  v7 = v5;
  [(PXIndexPathSet *)selectedMemoryIndexPaths enumerateAllIndexPathsUsingBlock:v8];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v7];
}

uint64_t __63__PXMemoriesFeedTilingLayout__invalidateSelectionTilesWithTag___block_invoke(uint64_t a1, long long *a2)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *a2;
  long long v4 = a2[1];
  v6[0] = xmmword_1AB359CE0;
  v6[1] = v3;
  v6[2] = v4;
  memset(&v6[3], 0, 32);
  uint64_t v7 = 0;
  return [v2 invalidateTileWithIdentifier:v6];
}

- (CGRect)_contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a3 forAspectRatio:(double)a4
{
  if (self->_delegateRespondsTo.contentsRectForItemAtIndexPathForAspectRatio)
  {
    uint64_t v7 = [(PXMemoriesFeedTilingLayout *)self delegate];
    long long v8 = *(_OWORD *)&a3->item;
    v21[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v21[1] = v8;
    [v7 memoriesFeedTilingLayout:self contentsRectForItemAtIndexPath:v21 forAspectRatio:a4];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *(double *)off_1E5DAB010;
    double v12 = *((double *)off_1E5DAB010 + 1);
    double v14 = *((double *)off_1E5DAB010 + 2);
    double v16 = *((double *)off_1E5DAB010 + 3);
  }
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int64_t)_itemKindForTileKind:(int64_t)a3
{
  if ((unint64_t)a3 < 5) {
    return qword_1AB35AB00[a3];
  }
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMemoriesFeedTilingLayout.m", 431, @"Asked for item kind for unknown tile kind: %ld", a3);

  return 0;
}

- (unint64_t)_zPositionForTileWithIdentifier:(PXTileIdentifier *)a3
{
  long long v5 = *(_OWORD *)&a3->index[5];
  long long v15 = *(_OWORD *)&a3->index[3];
  long long v16 = v5;
  long long v17 = *(_OWORD *)&a3->index[7];
  unint64_t v18 = a3->index[9];
  long long v6 = *(_OWORD *)&a3->index[1];
  long long v13 = *(_OWORD *)&a3->length;
  long long v14 = v6;
  unint64_t v7 = [(PXMemoriesFeedTilingLayout *)self tileKindForTileIdentifier:&v13];
  long long v8 = *(_OWORD *)&a3->index[5];
  long long v15 = *(_OWORD *)&a3->index[3];
  long long v16 = v8;
  long long v17 = *(_OWORD *)&a3->index[7];
  unint64_t v18 = a3->index[9];
  long long v9 = *(_OWORD *)&a3->index[1];
  long long v13 = *(_OWORD *)&a3->length;
  long long v14 = v9;
  [(PXMemoriesFeedTilingLayout *)self indexPathForTileIdentifier:&v13];
  BOOL v10 = 0;
  if (0 == *(_OWORD *)&self->_highlightedMemoryIndexPath.dataSourceIdentifier
    && !self->_highlightedMemoryIndexPath.item)
  {
    BOOL v10 = self->_highlightedMemoryIndexPath.subitem == 0;
  }
  if (v7 > 4) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = qword_1AB35AAD8[v7];
  }
  if (v10) {
    return v11 | 0x64;
  }
  else {
    return v11;
  }
}

- (id)_titleFontNameForMemoryAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (self->_delegateRespondsTo.titleFontNameForItemAtIndexPath)
  {
    long long v5 = [(PXMemoriesFeedTilingLayout *)self delegate];
    long long v6 = *(_OWORD *)&a3->item;
    v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v9[1] = v6;
    unint64_t v7 = [v5 memoriesFeedTilingLayout:self titleFontNameForItemAtIndexPath:v9];
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7;
}

- (id)_viewSpecForTileWithIdentifier:(PXTileIdentifier *)a3 boundingSize:(CGSize)a4
{
  CGFloat height = a4.height;
  double width = a4.width;
  long long v8 = *(_OWORD *)&a3->index[5];
  long long v28 = *(_OWORD *)&a3->index[3];
  long long v29 = v8;
  long long v30 = *(_OWORD *)&a3->index[7];
  unint64_t v31 = a3->index[9];
  long long v9 = *(_OWORD *)&a3->index[1];
  long long v26 = *(_OWORD *)&a3->length;
  long long v27 = v9;
  int64_t v10 = [(PXMemoriesFeedTilingLayout *)self tileKindForTileIdentifier:&v26];
  long long v11 = *(_OWORD *)&a3->index[5];
  long long v28 = *(_OWORD *)&a3->index[3];
  long long v29 = v11;
  long long v30 = *(_OWORD *)&a3->index[7];
  unint64_t v31 = a3->index[9];
  long long v12 = *(_OWORD *)&a3->index[1];
  long long v26 = *(_OWORD *)&a3->length;
  long long v27 = v12;
  [(PXMemoriesFeedTilingLayout *)self indexPathForTileIdentifier:&v26];
  long long v13 = *(_OWORD *)&a3->index[5];
  long long v28 = *(_OWORD *)&a3->index[3];
  long long v29 = v13;
  long long v30 = *(_OWORD *)&a3->index[7];
  unint64_t v31 = a3->index[9];
  long long v14 = *(_OWORD *)&a3->index[1];
  long long v26 = *(_OWORD *)&a3->length;
  long long v27 = v14;
  [(PXMemoriesFeedTilingLayout *)self indexPathForTileIdentifier:&v26];
  if (self->_highlightedMemoryIndexPath.dataSourceIdentifier) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = self->_highlightedMemoryIndexPath.section == 0;
  }
  char v17 = v15 && self->_highlightedMemoryIndexPath.item == 0;
  uint64_t v18 = v17 & (self->_highlightedMemoryIndexPath.subitem == 0);
  selectedMemoryIndexPaths = self->_selectedMemoryIndexPaths;
  long long v26 = 0u;
  long long v27 = 0u;
  if ([(PXIndexPathSet *)selectedMemoryIndexPaths containsIndexPath:&v26]) {
    v18 |= 2uLL;
  }
  [(PXMemoriesFeedTilingLayout *)self contentBounds];
  double v20 = CGRectGetWidth(v33) * 0.5;
  switch(v10)
  {
    case 0:
      uint64_t v21 = 2002;
      break;
    case 1:
      uint64_t v21 = 2005;
      break;
    case 2:
      long long v26 = 0u;
      long long v27 = 0u;
      v22 = [(PXMemoriesFeedTilingLayout *)self _titleFontNameForMemoryAtIndexPath:&v26];
      if (width <= v20) {
        uint64_t v21 = 2004;
      }
      else {
        uint64_t v21 = 2003;
      }
      uint64_t v18 = PXViewSpecOptionsWithTitleFontName(v18, v22);
      goto LABEL_23;
    case 3:
      long long v26 = 0u;
      long long v27 = 0u;
      v22 = [(PXMemoriesFeedTilingLayout *)self _titleFontNameForMemoryAtIndexPath:&v26];
      uint64_t v18 = PXViewSpecOptionsWithTitleFontName(v18, v22);
      if (width <= v20) {
        uint64_t v21 = 2007;
      }
      else {
        uint64_t v21 = 2006;
      }
LABEL_23:

      break;
    case 4:
      uint64_t v21 = 2001;
      break;
    default:
      uint64_t v21 = 0;
      break;
  }
  v23 = [(PXMemoriesFeedTilingLayout *)self spec];
  *(void *)&long long v26 = v21;
  *((void *)&v26 + 1) = v18;
  *(double *)&long long v27 = width;
  *((CGFloat *)&v27 + 1) = height;
  v24 = [v23 viewSpecWithDescriptor:&v26];

  return v24;
}

- (void)_addTileWithKind:(int64_t)a3 entryIndex:(unint64_t)a4 memoryIndex:(unint64_t)a5 usingBlock:(id)a6
{
  int64_t v10 = a6;
  if ((unint64_t)(a3 - 1) < 4) {
    goto LABEL_4;
  }
  if (!a3)
  {
    a5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_4:
    long long v11 = [(PXMemoriesFeedTilingLayout *)self dataSource];
    uint64_t v12 = [v11 identifier];

    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_5;
  }
  uint64_t v13 = 0;
  a5 = 0;
  a4 = 0;
  uint64_t v12 = 0;
LABEL_5:
  long long v14 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v48 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v49 = v14;
  long long v15 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v50 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v51 = v15;
  long long v16 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v44 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v45 = v16;
  long long v17 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v46 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v47 = v17;
  long long v18 = *((_OWORD *)off_1E5DAB048 + 1);
  long long v40 = *(_OWORD *)off_1E5DAB048;
  long long v41 = v18;
  long long v19 = *((_OWORD *)off_1E5DAB048 + 3);
  long long v42 = *((_OWORD *)off_1E5DAB048 + 2);
  long long v43 = v19;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  *(void *)&long long v21 = 5;
  *((void *)&v21 + 1) = a3;
  *(void *)&long long v22 = v12;
  *((void *)&v22 + 1) = a4;
  *(void *)&long long v23 = a5;
  *((void *)&v23 + 1) = v13;
  long long v24 = 0u;
  long long v25 = 0u;
  *(void *)&long long v26 = 0;
  if ([(PXMemoriesFeedTilingLayout *)self getGeometry:&v40 group:&v39 userData:&v38 forTileWithIdentifier:&v21])
  {
    char v37 = 0;
    double v20 = (void (*)(void *, void *, long long *, uint64_t, uint64_t, char *))v10[2];
    v33[0] = 5;
    v33[1] = a3;
    v33[2] = v12;
    v33[3] = a4;
    v33[4] = a5;
    v33[5] = v13;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v36 = 0;
    long long v29 = v48;
    long long v30 = v49;
    long long v31 = v50;
    long long v32 = v51;
    long long v25 = v44;
    long long v26 = v45;
    long long v27 = v46;
    long long v28 = v47;
    long long v21 = v40;
    long long v22 = v41;
    long long v23 = v42;
    long long v24 = v43;
    v20(v10, v33, &v21, v39, v38, &v37);
  }
}

- (void)setLayoutSnapshot:(id)a3
{
  long long v5 = (PXSectionedLayoutSnapshot *)a3;
  if (self->_layoutSnapshot != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_layoutSnapshot, a3);
    [(PXTilingLayout *)self invalidateLayout];
    long long v5 = v6;
  }
}

- (void)setSelectedMemoryIndexPaths:(id)a3
{
  long long v5 = (PXIndexPathSet *)a3;
  if (self->_selectedMemoryIndexPaths != v5)
  {
    long long v6 = v5;
    [(PXMemoriesFeedTilingLayout *)self _invalidateSelectionTilesWithTag:@"Memory Tile Deselecting"];
    objc_storeStrong((id *)&self->_selectedMemoryIndexPaths, a3);
    [(PXMemoriesFeedTilingLayout *)self _invalidateSelectionTilesWithTag:@"Memory Tile Selecting"];
    long long v5 = v6;
  }
}

- (void)setHighlightedMemoryIndexPath:(PXSimpleIndexPath *)a3
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&a3->dataSourceIdentifier, *(int64x2_t *)&self->_highlightedMemoryIndexPath.dataSourceIdentifier), (int32x4_t)vceqq_s64(*(int64x2_t *)&a3->item, *(int64x2_t *)&self->_highlightedMemoryIndexPath.item))), 0xFuLL))) & 1) == 0)
  {
    long long v5 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_highlightedMemoryIndexPath.int64_t dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_highlightedMemoryIndexPath.int64_t item = v5;
    long long v6 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v6 setTag:@"Memory Tile Highlighting"];
    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
    int64_t section = a3->section;
    int64_t item = a3->item;
    int64_t subitem = a3->subitem;
    long long v11 = xmmword_1AB338B30;
    int64_t v12 = dataSourceIdentifier;
    int64_t v13 = section;
    int64_t v14 = item;
    int64_t v15 = subitem;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
    [(PXTilingLayoutInvalidationContext *)v6 invalidateTileWithIdentifier:&v11];
    long long v11 = xmmword_1AB359CF0;
    int64_t v12 = dataSourceIdentifier;
    int64_t v13 = section;
    int64_t v14 = item;
    int64_t v15 = subitem;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
    [(PXTilingLayoutInvalidationContext *)v6 invalidateTileWithIdentifier:&v11];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v6];
  }
}

- (PXTileIdentifier)tileIdentifierAtIndexPath:(SEL)a3 withTileKind:(PXSimpleIndexPath *)a4
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  retstr->length = 5;
  retstr->index[0] = a5;
  long long v5 = *(_OWORD *)&a4->item;
  *(_OWORD *)&retstr->index[1] = *(_OWORD *)&a4->dataSourceIdentifier;
  *(_OWORD *)&retstr->index[3] = v5;
  return self;
}

- (int64_t)tileKindForTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->index[0];
}

- (int64_t)dataSourceIdentifierForTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->index[1];
}

- (PXSimpleIndexPath)indexPathForTileIdentifier:(SEL)a3
{
  unint64_t v8 = a4->index[1];
  long long v9 = [(PXMemoriesFeedTilingLayout *)self dataSource];
  uint64_t v10 = [v9 identifier];

  if (v8 != v10)
  {
    int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a3 object:self file:@"PXMemoriesFeedTilingLayout.m" lineNumber:233 description:@"Feed layout asked for index path for tile identifier from wrong datasource"];
  }
  long long v12 = *(_OWORD *)&a4->index[3];
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)&a4->index[1];
  *(_OWORD *)&retstr->int64_t item = v12;
  return result;
}

- (id)indexPathsForMemoriesInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v12 = 0;
  int64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int64_t v15 = __Block_byref_object_copy__60037;
  long long v16 = __Block_byref_object_dispose__60038;
  id v17 = [off_1E5DA7430 indexPathSet];
  unint64_t v8 = [(PXMemoriesFeedTilingLayout *)self layoutSnapshot];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PXMemoriesFeedTilingLayout_indexPathsForMemoriesInRect___block_invoke;
  v11[3] = &unk_1E5DB4A08;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "enumerateGeometriesForItemsInRect:usingBlock:", v11, x, y, width, height);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __58__PXMemoriesFeedTilingLayout_indexPathsForMemoriesInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!objc_msgSend(v3, "px_kind"))
  {
    long long v4 = [*(id *)(a1 + 32) dataSource];
    uint64_t v5 = [v4 identifier];
    uint64_t v6 = objc_msgSend(v3, "px_section");
    uint64_t v7 = objc_msgSend(v3, "px_item");

    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v9[0] = v5;
    v9[1] = v6;
    _OWORD v9[2] = v7;
    v9[3] = 0x7FFFFFFFFFFFFFFFLL;
    [v8 addIndexPath:v9];
  }
}

- (PXSimpleIndexPath)indexPathForMemoryAtPoint:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x4010000000;
  uint64_t v18 = &unk_1AB5D584F;
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v19 = *(_OWORD *)off_1E5DAB028;
  long long v20 = v8;
  id v9 = [(PXMemoriesFeedTilingLayout *)self layoutSnapshot];
  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__PXMemoriesFeedTilingLayout_indexPathForMemoryAtPoint___block_invoke;
  v14[3] = &unk_1E5DB4A08;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v9, "enumerateGeometriesForItemsInRect:usingBlock:", v14, x, y, v10, v11);

  long long v12 = *((_OWORD *)v16 + 3);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *((_OWORD *)v16 + 2);
  *(_OWORD *)&retstr->int64_t item = v12;
  _Block_object_dispose(&v15, 8);
  return result;
}

void __56__PXMemoriesFeedTilingLayout_indexPathForMemoryAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if (!objc_msgSend(v11, "px_kind"))
  {
    uint64_t v6 = [*(id *)(a1 + 32) dataSource];
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = objc_msgSend(v11, "px_section");
    uint64_t v9 = objc_msgSend(v11, "px_item");
    double v10 = *(void **)(*(void *)(a1 + 40) + 8);
    v10[4] = v7;
    v10[5] = v8;
    v10[6] = v9;
    v10[7] = 0x7FFFFFFFFFFFFFFFLL;

    *a4 = 1;
  }
}

- (PXMemoriesFeedDataSource)dataSource
{
  v2 = [(PXMemoriesFeedTilingLayout *)self layoutSnapshot];
  id v3 = [v2 dataSourceSnapshot];

  return (PXMemoriesFeedDataSource *)v3;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v8 = *(_OWORD *)&a6->index[5];
  long long v18 = *(_OWORD *)&a6->index[3];
  long long v19 = v8;
  long long v20 = *(_OWORD *)&a6->index[7];
  *(void *)&long long v21 = a6->index[9];
  long long v9 = *(_OWORD *)&a6->index[1];
  long long v16 = *(_OWORD *)&a6->length;
  long long v17 = v9;
  -[PXMemoriesFeedTilingLayout indexPathForTileIdentifier:](self, "indexPathForTileIdentifier:", &v16, a4);
  long long v10 = *(_OWORD *)&a6->index[5];
  long long v18 = *(_OWORD *)&a6->index[3];
  long long v19 = v10;
  long long v20 = *(_OWORD *)&a6->index[7];
  *(void *)&long long v21 = a6->index[9];
  long long v11 = *(_OWORD *)&a6->index[1];
  long long v16 = *(_OWORD *)&a6->length;
  long long v17 = v11;
  [(PXMemoriesFeedTilingLayout *)self _itemKindForTileKind:[(PXMemoriesFeedTilingLayout *)self tileKindForTileIdentifier:&v16]];
  if ((void)v26 == *(void *)off_1E5DAAED8)
  {
LABEL_11:
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    long long v16 = v26;
    long long v17 = v27;
    PXSimpleIndexPathDescription();
  }
  uint64_t v12 = v27;
  if (*((void *)&v26 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((void)v27 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_11;
    }
  }
  else if ((void)v27 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  if (*((void *)&v27 + 1) != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:withKind:", v12);
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  layoutSnapshot = self->_layoutSnapshot;
  if (layoutSnapshot) {
    [(PXSectionedLayoutSnapshot *)layoutSnapshot geometryForItem:v13];
  }
  PXRectWithCenterAndSize();
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  long long v11 = [(PXMemoriesFeedTilingLayout *)self layoutSnapshot];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PXMemoriesFeedTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  v13[3] = &unk_1E5DB49E0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  objc_msgSend(v11, "enumerateGeometriesForItemsInRect:usingBlock:", v13, x, y, width, height);
}

void __74__PXMemoriesFeedTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "px_section");
  uint64_t v5 = objc_msgSend(v3, "px_item");
  uint64_t v6 = objc_msgSend(v3, "px_kind");

  if (v6 == 2)
  {
    long long v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    [v11 _addTileWithKind:0 entryIndex:v4 memoryIndex:0 usingBlock:v12];
  }
  else if (!v6)
  {
    [*(id *)(a1 + 32) _addTileWithKind:1 entryIndex:v4 memoryIndex:v5 usingBlock:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _addTileWithKind:2 entryIndex:v4 memoryIndex:v5 usingBlock:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 128) idiom] == 4)
    {
      uint64_t v7 = [*(id *)(a1 + 32) dataSource];
      uint64_t v8 = [v7 identifier];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v9 = *(void **)(a1 + 32);
      long long v13 = xmmword_1AB359CE0;
      *(void *)&long long v14 = v8;
      *((void *)&v14 + 1) = v4;
      uint64_t v15 = v5;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v19 = 0;
      [v9 indexPathForTileIdentifier:&v13];
      id v10 = *(void **)(*(void *)(a1 + 32) + 136);
      long long v13 = v20;
      long long v14 = v21;
      if ([v10 containsIndexPath:&v13]) {
        [*(id *)(a1 + 32) _addTileWithKind:4 entryIndex:v4 memoryIndex:v5 usingBlock:*(void *)(a1 + 40)];
      }
    }
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  double v7 = v6;
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)PXMemoriesFeedTilingLayout;
  -[PXTilingLayout setReferenceSize:](&v11, sel_setReferenceSize_, width, height);
  if (width != v7 || height != v9) {
    [(PXTilingLayout *)self invalidateLayout];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->contentsRectForItemAtIndexPathForAspectRatio = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->titleFontNameForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  }
}

- (CGRect)contentBounds
{
  v2 = [(PXMemoriesFeedTilingLayout *)self layoutSnapshot];
  [v2 contentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (PXMemoriesFeedTilingLayout)init
{
  return [(PXMemoriesFeedTilingLayout *)self initWithSpec:0 layoutSnapshot:0];
}

- (PXMemoriesFeedTilingLayout)initWithSpec:(id)a3 layoutSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXMemoriesFeedTilingLayout;
  double v9 = [(PXTilingLayout *)&v16 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a3);
    long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&v10->_highlightedMemoryIndexPath.int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&v10->_highlightedMemoryIndexPath.int64_t item = v11;
    selectedMemoryIndexPaths = v10->_selectedMemoryIndexPaths;
    v10->_selectedMemoryIndexPaths = 0;

    objc_storeStrong((id *)&v10->_layoutSnapshot, a4);
    double v13 = objc_alloc_init(PXCollectionTileLayoutTemplate);
    tileLayoutTemplate = v10->__tileLayoutTemplate;
    v10->__tileLayoutTemplate = v13;
  }
  return v10;
}

@end