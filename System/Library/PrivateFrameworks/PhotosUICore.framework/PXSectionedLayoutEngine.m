@interface PXSectionedLayoutEngine
- (BOOL)_computeSectionsIfNeeded;
- (BOOL)canComputeLayoutSnapshot;
- (CGSize)seedSize;
- (PXSectionedLayoutEngine)init;
- (PXSectionedLayoutEngine)initWithAxis:(int64_t)a3 layoutGenerator:(id)a4 dataSourceSnapshot:(id)a5;
- (PXSectionedLayoutEngine)initWithAxis:(int64_t)a3 layoutGenerator:(id)a4 dataSourceSnapshot:(id)a5 insets:(UIEdgeInsets)a6;
- (PXSectionedLayoutEngine)initWithLayoutGenerator:(id)a3 dataSourceSnapshot:(id)a4;
- (id)_computeSectionsFromSection:(id)a3 itemIndex:(int64_t)a4 kind:(int64_t)a5;
- (id)_emptyLayoutSnapshot;
- (id)_newLayoutSection;
- (id)_newLayoutSnapshot;
- (id)computeLayoutSnapshot;
- (id)performChangesAndWait:(id)a3;
- (int64_t)axis;
- (void)_computeSection:(id)a3;
- (void)_prepareGeometryBufferForCount:(unint64_t)a3;
- (void)_resetLayoutData;
- (void)_updateLayoutDataWithChangeDetails:(id)a3;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)setDataSourceSnapshot:(id)a3 withChangeDetails:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSeedItem:(id)a3;
- (void)setSeedSize:(CGSize)a3;
- (void)updateLayoutDataWithChangeDetails:(id)a3;
@end

@implementation PXSectionedLayoutEngine

- (void).cxx_destruct
{
}

- (CGSize)seedSize
{
  double width = self->_seedSize.width;
  double height = self->_seedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)axis
{
  return self->_axis;
}

- (id)_emptyLayoutSnapshot
{
  return +[PXSectionedLayoutSnapshot emptyLayoutSnapshot];
}

- (void)_prepareGeometryBufferForCount:(unint64_t)a3
{
  if (self->_geometryBufferCount < a3)
  {
    self->_geometryBuffer = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometryBuffer, 152 * a3, 0x100004050011849uLL);
    self->_geometryBufferCount = a3;
  }
}

- (void)_computeSection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutEngine.m" lineNumber:400 description:@"section is nil"];
  }
  v6 = [(PXLayoutEngine *)self dataSourceSnapshot];
  uint64_t v7 = [v5 index];
  uint64_t v8 = [v6 numberOfItemsInSection:v7];
  v9 = [(PXLayoutEngine *)self layoutGenerator];
  if (self->_delegateRespondsTo.willGenerateLayoutForSection)
  {
    v10 = [(PXLayoutEngine *)self delegate];
    [v10 layoutEngine:self willGenerateLayoutWithGenerator:v9 forSection:v7];
  }
  [v9 setItemCount:v8];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__PXSectionedLayoutEngine__computeSection___block_invoke;
  v20[3] = &unk_1E5DD0438;
  id v21 = v6;
  uint64_t v22 = v7;
  id v11 = v6;
  [v9 setItemLayoutInfoBlock:v20];
  v12 = [v9 geometryKinds];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__PXSectionedLayoutEngine__computeSection___block_invoke_2;
  v16[3] = &unk_1E5DD3088;
  id v17 = v9;
  v18 = self;
  id v19 = v5;
  id v13 = v5;
  id v14 = v9;
  [v12 enumerateIndexesUsingBlock:v16];
  [v14 size];
  objc_msgSend(v13, "setSize:");
  [v13 setAccurate:1];
}

id __43__PXSectionedLayoutEngine__computeSection___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  v4 = [*(id *)(a1 + 32) inputForItem:v3];

  return v4;
}

void __43__PXSectionedLayoutEngine__computeSection___block_invoke_2(id *a1, uint64_t a2)
{
  uint64_t v4 = [a1[4] numberOfGeometriesWithKind:a2];
  if (v4)
  {
    uint64_t v5 = v4;
    [a1[5] _prepareGeometryBufferForCount:v4];
    objc_msgSend(a1[4], "getGeometries:inRange:withKind:", *((void *)a1[5] + 11), 0, v5, a2);
    v6 = [[PXLayoutGeometryArray alloc] initWithGeometries:*((void *)a1[5] + 11) count:v5];
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = v6;
  [a1[6] setGeometries:v6 withKind:a2];
}

- (id)_computeSectionsFromSection:(id)a3 itemIndex:(int64_t)a4 kind:(int64_t)a5
{
  id v8 = a3;
  v9 = [MEMORY[0x1E4F1CA48] array];
  [(PXSectionedLayoutEngine *)self seedSize];
  double v11 = v10;
  double v13 = v12;
  v53 = [(PXLayoutEngine *)self dataSourceSnapshot];
  uint64_t v14 = [v53 numberOfSections];
  uint64_t v15 = [v8 index];
  id v16 = v8;
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  id v17 = [v16 geometriesWithKind:a5];
  v18 = v17;
  if (v17)
  {
    [v17 geometryAtIndex:a4];
  }
  else
  {
    uint64_t v64 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v55 = 0u;
  }

  [v16 frame];
  double v21 = v19;
  double v22 = v20;
  int64_t axis = self->_axis;
  double v24 = 0.0;
  if (axis)
  {
    if (axis == 2)
    {
      v26 = (double *)&v55 + 1;
      double v25 = v19;
      double v13 = v11;
    }
    else
    {
      double v25 = 0.0;
      if (axis != 1) {
        goto LABEL_26;
      }
      v26 = (double *)&v56;
      double v25 = v20;
    }
    double v24 = v13 * 0.5;
    if (v15)
    {
      double v28 = v25 + *v26 - v24;
      if (v25 > v28)
      {
        uint64_t v52 = v14;
        uint64_t v29 = v15 - 1;
        do
        {
          v30 = -[PXSectionedLayoutContent sectionAtIndex:](self->_layoutContent, "sectionAtIndex:", v29, v52);
          if (([v30 isAccurate] & 1) == 0)
          {
            [(PXSectionedLayoutEngine *)self _computeSection:v30];
            [v9 insertObject:v30 atIndex:0];
          }
          [v30 frame];
          int64_t v33 = self->_axis;
          if (v33)
          {
            if (v33 != 1) {
              double v32 = v25;
            }
            if (v33 == 2) {
              double v25 = v31;
            }
            else {
              double v25 = v32;
            }
          }
          else
          {
            v34 = [MEMORY[0x1E4F28B00] currentHandler];
            [v34 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutEngine.m" lineNumber:338 description:@"axis == PXAxisUndefined"];
          }
          BOOL v35 = v29-- != 0;
        }
        while (v35 && v25 > v28);
        uint64_t v14 = v52;
      }
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutEngine.m" lineNumber:311 description:@"axis == PXAxisUndefined"];

    double v25 = 0.0;
  }
LABEL_26:
  unint64_t v36 = [v16 index];
  int64_t v37 = self->_axis;
  double v38 = 0.0;
  if (v37)
  {
    if (v37 == 2)
    {
      double v38 = v24 + v21 + *((double *)&v55 + 1);
      [v16 frame];
      double v25 = v21 + v41;
    }
    else if (v37 == 1)
    {
      double v38 = v24 + v22 + *(double *)&v56;
      [v16 frame];
      double v25 = v22 + v39;
    }
  }
  else
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutEngine.m" lineNumber:363 description:@"axis == PXAxisUndefined"];
  }
  unint64_t v42 = v14 - 1;
  if (v36 < v14 - 1 && v25 < v38)
  {
    unint64_t v43 = v36 + 1;
    do
    {
      v44 = [(PXSectionedLayoutContent *)self->_layoutContent sectionAtIndex:v43];
      if (([v44 isAccurate] & 1) == 0)
      {
        [(PXSectionedLayoutEngine *)self _computeSection:v44];
        [v9 addObject:v44];
      }
      [v44 frame];
      int64_t v49 = self->_axis;
      if (v49)
      {
        if (v49 == 2)
        {
          double v25 = v45 + v47;
        }
        else if (v49 == 1)
        {
          double v25 = v46 + v48;
        }
      }
      else
      {
        v50 = [MEMORY[0x1E4F28B00] currentHandler];
        [v50 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutEngine.m" lineNumber:389 description:@"axis == PXAxisUndefined"];
      }
      if (v43 >= v42) {
        break;
      }
      ++v43;
    }
    while (v25 < v38);
  }

  return v9;
}

- (BOOL)_computeSectionsIfNeeded
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXLayoutEngine *)self dataSourceSnapshot];
  uint64_t v5 = [v4 numberOfSections];
  if (v5 < 1)
  {
    BOOL v29 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    SEL v31 = a2;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = [(PXLayoutEngine *)self seedItem];
    unint64_t v9 = objc_msgSend(v8, "px_section");
    uint64_t v33 = objc_msgSend(v8, "px_item");
    uint64_t v32 = objc_msgSend(v8, "px_kind");
    double v10 = [(PXSectionedLayoutContent *)self->_layoutContent sections];
    uint64_t v11 = [v10 count];

    double v12 = [(PXLayoutEngine *)self layoutGenerator];
    [v12 estimatedSize];
    if (v11 < v6)
    {
      double v15 = v13;
      double v16 = v14;
      do
      {
        id v17 = [(PXSectionedLayoutEngine *)self _newLayoutSection];
        [v17 setIndex:v11];
        objc_msgSend(v17, "setSize:", v15, v16);
        [v17 setAccurate:0];
        [(PXSectionedLayoutContent *)self->_layoutContent addSection:v17];

        ++v11;
      }
      while (v6 != v11);
    }
    v18 = [(PXSectionedLayoutContent *)self->_layoutContent sections];
    unint64_t v19 = [v18 count];

    if (v19 <= v9)
    {
      double v20 = PLUIGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = (uint64_t)v4;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEBUG, "dataSourceSnapshot %@", buf, 0xCu);
      }

      double v21 = PLUIGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v4 numberOfSections];
        *(_DWORD *)buf = 134217984;
        uint64_t v35 = v22;
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEBUG, "[dataSourceSnapshot numberOfSections] %ld", buf, 0xCu);
      }

      v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        layoutContent = self->_layoutContent;
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = (uint64_t)layoutContent;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEBUG, "_layoutContent %@", buf, 0xCu);
      }

      double v25 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, @"PXSectionedLayoutEngine.m", 260, @"Seed item specifies out of bounds section index: sections %ld > seedSectionIndex %ld", v19, v9);
    }
    v26 = [(PXSectionedLayoutContent *)self->_layoutContent sectionAtIndex:v9];
    if (([v26 isAccurate] & 1) == 0)
    {
      [(PXSectionedLayoutEngine *)self _computeSection:v26];
      [v7 addObject:v26];
    }
    v27 = [(PXSectionedLayoutEngine *)self _computeSectionsFromSection:v26 itemIndex:v33 kind:v32];
    [v7 addObjectsFromArray:v27];
    uint64_t v28 = [v7 count];
    BOOL v29 = v28 != 0;
    if (v28) {
      [(PXSectionedLayoutContent *)self->_layoutContent updateSections:v7];
    }
  }
  return v29;
}

- (id)_newLayoutSnapshot
{
  [(PXSectionedLayoutContent *)self->_layoutContent contentSize];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(PXSectionedLayoutContent *)self->_layoutContent sections];
  id v8 = -[PXSectionedLayoutSnapshot initWithContentRect:forSections:]([PXSectionedLayoutSnapshot alloc], "initWithContentRect:forSections:", v7, 0.0, 0.0, v4, v6);

  return v8;
}

- (id)_newLayoutSection
{
  v2 = [(PXLayoutEngine *)self layoutGenerator];
  [v2 estimatedSize];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = objc_alloc_init(PXLayoutSection);
  -[PXLayoutSection setFrame:](v7, "setFrame:", 0.0, 0.0, v4, v6);

  return v7;
}

- (void)_updateLayoutDataWithChangeDetails:(id)a3
{
  id v4 = a3;
  double v5 = [v4 sectionChanges];
  double v6 = [v5 removedIndexes];

  uint64_t v7 = [v4 sectionChanges];
  id v8 = [v7 insertedIndexes];

  unint64_t v9 = [v4 sectionsWithItemChanges];
  uint64_t v10 = [v6 count];
  uint64_t v11 = [v8 count];
  uint64_t v12 = [v9 count];
  if (v10)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke;
    v21[3] = &unk_1E5DD3010;
    v21[4] = self;
    [v6 enumerateIndexesWithOptions:2 usingBlock:v21];
  }
  if (v11)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_2;
    v20[3] = &unk_1E5DD3010;
    void v20[4] = self;
    [v8 enumerateIndexesUsingBlock:v20];
  }
  if (v12)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_3;
    v19[3] = &unk_1E5DD3010;
    v19[4] = self;
    [v9 enumerateIndexesUsingBlock:v19];
  }
  double v13 = [(PXLayoutEngine *)self seedItem];
  if (!v13) {
    goto LABEL_11;
  }
  if (!self->_needsUpdateSeedItem) {
    goto LABEL_11;
  }
  double v14 = [v4 sectionChanges];
  uint64_t v15 = objc_msgSend(v14, "indexAfterApplyingChangesToIndex:", objc_msgSend(v13, "px_section"));

  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
  double v16 = [v4 itemChangesInSection:v15];
  uint64_t v17 = objc_msgSend(v16, "indexAfterApplyingChangesToIndex:", objc_msgSend(v13, "px_item"));

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v17 inSection:v15];
  }
  else
  {
LABEL_11:
    v18 = 0;
  }
  [(PXSectionedLayoutEngine *)self setSeedItem:v18];
}

void __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 72) sectionAtIndex:a2];
  [*(id *)(*(void *)(a1 + 32) + 72) removeSection:v3];
}

void __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = (id)[*(id *)(a1 + 32) _newLayoutSection];
  [*(id *)(*(void *)(a1 + 32) + 72) insertSection:v4 atIndex:a2];
}

void __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 72) sectionAtIndex:a2];
  [v2 setAccurate:0];
}

- (void)_resetLayoutData
{
  id v11 = [(PXLayoutEngine *)self dataSourceSnapshot];
  uint64_t v3 = [v11 numberOfSections];
  id v4 = [(PXLayoutEngine *)self layoutGenerator];
  [v4 estimatedSize];
  double v6 = v5;
  double v8 = v7;
  [(PXSectionedLayoutContent *)self->_layoutContent removeAllSections];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      id v10 = [(PXSectionedLayoutEngine *)self _newLayoutSection];
      [v10 setIndex:i];
      objc_msgSend(v10, "setSize:", v6, v8);
      [v10 setAccurate:0];
      [(PXSectionedLayoutContent *)self->_layoutContent addSection:v10];
    }
  }
  [(PXLayoutEngine *)self invalidateLayoutSnapshot];
}

- (id)computeLayoutSnapshot
{
  uint64_t v3 = [(PXLayoutEngine *)self dataSourceSnapshot];
  if ([v3 numberOfSections])
  {
    if (![(PXSectionedLayoutEngine *)self _computeSectionsIfNeeded])
    {
      uint64_t v4 = [v3 identifier];
      double v5 = [(PXLayoutEngine *)self layoutSnapshot];
      double v6 = [v5 dataSourceSnapshot];
      uint64_t v7 = [v6 identifier];

      if (v4 == v7)
      {
        double v8 = 0;
        goto LABEL_8;
      }
    }
    id v9 = [(PXSectionedLayoutEngine *)self _newLayoutSnapshot];
  }
  else
  {
    id v9 = [(PXSectionedLayoutEngine *)self _emptyLayoutSnapshot];
  }
  double v8 = v9;
LABEL_8:

  return v8;
}

- (void)updateLayoutDataWithChangeDetails:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    double v6 = [v4 sectionChanges];
    if ([v6 hasIncrementalChanges])
    {
      uint64_t v7 = [v9 sectionChanges];
      char v8 = [v7 hasMoves];

      id v5 = v9;
      if ((v8 & 1) == 0)
      {
        [(PXSectionedLayoutEngine *)self _updateLayoutDataWithChangeDetails:v9];
        [(PXLayoutEngine *)self invalidateLayoutSnapshot];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  [(PXSectionedLayoutEngine *)self _resetLayoutData];
LABEL_7:
}

- (BOOL)canComputeLayoutSnapshot
{
  v5.receiver = self;
  v5.super_class = (Class)PXSectionedLayoutEngine;
  BOOL v3 = [(PXLayoutEngine *)&v5 canComputeLayoutSnapshot];
  if (v3) {
    LOBYTE(v3) = *(double *)(MEMORY[0x1E4F1DB30] + 8) != self->_seedSize.height
  }
              || *MEMORY[0x1E4F1DB30] != self->_seedSize.width;
  return v3;
}

- (void)setSeedItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXSectionedLayoutEngine;
  [(PXLayoutEngine *)&v4 setSeedItem:a3];
  self->_needsUpdateSeedItem = 0;
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXSectionedLayoutEngine;
  id v4 = a3;
  [(PXLayoutEngine *)&v6 setDelegate:v4];
  char v5 = objc_opt_respondsToSelector();

  self->_delegateRespondsTo.willGenerateLayoutForSection = v5 & 1;
}

- (void)setDataSourceSnapshot:(id)a3 withChangeDetails:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXSectionedLayoutEngine;
  [(PXLayoutEngine *)&v4 setDataSourceSnapshot:a3 withChangeDetails:a4];
}

- (void)setSeedSize:(CGSize)a3
{
  if (a3.width != self->_seedSize.width || a3.height != self->_seedSize.height)
  {
    self->_seedSize = a3;
    [(PXLayoutEngine *)self invalidateLayoutSnapshot];
  }
}

- (id)performChangesAndWait:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PXSectionedLayoutEngine_performChangesAndWait___block_invoke;
  v9[3] = &unk_1E5DD0410;
  v9[4] = self;
  id v10 = v4;
  v8.receiver = self;
  v8.super_class = (Class)PXSectionedLayoutEngine;
  id v5 = v4;
  objc_super v6 = [(PXLayoutEngine *)&v8 performChangesAndWait:v9];

  return v6;
}

uint64_t __49__PXSectionedLayoutEngine_performChangesAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performChanges:(id)a3
{
  self->_needsUpdateSeedItem = 1;
  v3.receiver = self;
  v3.super_class = (Class)PXSectionedLayoutEngine;
  [(PXLayoutEngine *)&v3 performChanges:a3];
}

- (void)dealloc
{
  geometryBuffer = self->_geometryBuffer;
  if (geometryBuffer) {
    free(geometryBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXSectionedLayoutEngine;
  [(PXSectionedLayoutEngine *)&v4 dealloc];
}

- (PXSectionedLayoutEngine)initWithAxis:(int64_t)a3 layoutGenerator:(id)a4 dataSourceSnapshot:(id)a5 insets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  v16.receiver = self;
  v16.super_class = (Class)PXSectionedLayoutEngine;
  id v11 = [(PXLayoutEngine *)&v16 initWithLayoutGenerator:a4 dataSourceSnapshot:a5];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_int64_t axis = a3;
    double v13 = -[PXSectionedLayoutContent initWithAxis:insets:]([PXSectionedLayoutContent alloc], "initWithAxis:insets:", a3, top, left, bottom, right);
    layoutContent = v12->_layoutContent;
    v12->_layoutContent = v13;

    v12->_geometryBuffer = 0;
  }
  return v12;
}

- (PXSectionedLayoutEngine)initWithAxis:(int64_t)a3 layoutGenerator:(id)a4 dataSourceSnapshot:(id)a5
{
  return -[PXSectionedLayoutEngine initWithAxis:layoutGenerator:dataSourceSnapshot:insets:](self, "initWithAxis:layoutGenerator:dataSourceSnapshot:insets:", a3, a4, a5, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

- (PXSectionedLayoutEngine)initWithLayoutGenerator:(id)a3 dataSourceSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSectionedLayoutEngine.m", 55, @"%s is not available as initializer", "-[PXSectionedLayoutEngine initWithLayoutGenerator:dataSourceSnapshot:]");

  abort();
}

- (PXSectionedLayoutEngine)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSectionedLayoutEngine.m", 51, @"%s is not available as initializer", "-[PXSectionedLayoutEngine init]");

  abort();
}

@end