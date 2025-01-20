@interface PXZoomableInlineHeaderSectionInfoMetaDataStore
- (BOOL)updateWithDataSourceAfterChanges:(id)a3 changeDetails:(id)a4;
- (PXAssetsDataSource)dataSource;
- (PXZoomableInlineHeaderSectionInfoMetaDataStore)initWithDataSource:(id)a3;
- (const)sectionInfosForLevel:(unint64_t)a3;
- (id)description;
- (int64_t)numberOfSectionInfosForLevel:(unint64_t)a3;
- (void)_resizeStorageIfNeededForNumberOfSections:(int64_t)a3 level:(unint64_t)a4;
- (void)addSectionInfo:(id *)a3 forLevel:(unint64_t)a4;
- (void)dealloc;
- (void)resetSectionInfos;
@end

@implementation PXZoomableInlineHeaderSectionInfoMetaDataStore

- (void)addSectionInfo:(id *)a3 forLevel:(unint64_t)a4
{
  v5 = &self->super.isa + a4;
  Class v6 = v5[3];
  v5[3] = (Class)((char *)v6 + 1);
  -[PXZoomableInlineHeaderSectionInfoMetaDataStore _resizeStorageIfNeededForNumberOfSections:level:](self, "_resizeStorageIfNeededForNumberOfSections:level:");
  v7 = (_OWORD *)((char *)v5[1] + 32 * (void)v6);
  long long v8 = *(_OWORD *)&a3->var2;
  _OWORD *v7 = *(_OWORD *)&a3->var0;
  v7[1] = v8;
}

- (void)_resizeStorageIfNeededForNumberOfSections:(int64_t)a3 level:(unint64_t)a4
{
  sectionsCapacityByLevel = self->_sectionsCapacityByLevel;
  int64_t v6 = self->_sectionsCapacityByLevel[a4];
  if (v6 < a3)
  {
    if (!v6)
    {
      int64_t v6 = 8;
      sectionsCapacityByLevel[a4] = 8;
    }
    if (v6 < a3)
    {
      do
        v6 *= 2;
      while (v6 < a3);
      sectionsCapacityByLevel[a4] = v6;
    }
    _PXGArrayResize();
  }
}

- (const)sectionInfosForLevel:(unint64_t)a3
{
  return (const $4479F518DFD59EF68F6FA14DAF968345 *)self->_sectionInfosByLevel[a3];
}

- (int64_t)numberOfSectionInfosForLevel:(unint64_t)a3
{
  return self->_sectionsCountByLevel[a3];
}

- (BOOL)updateWithDataSourceAfterChanges:(id)a3 changeDetails:(id)a4
{
  v7 = (PXAssetsDataSource *)a3;
  id v8 = a4;
  if ([off_1E5DA8488 changesHaveAnyInsertionsRemovalsOrMoves:v8])
  {
    v25 = [(PXZoomableInlineHeaderSectionInfoMetaDataStore *)self dataSource];
    uint64_t v9 = [v25 identifier];
    if ([(PXAssetsDataSource *)v7 numberOfSections] >= 2)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"PXZoomableInlineHeadersDataSourceManager.m" lineNumber:396 description:@"Only supports data sources with 1 section (or empty)"];
    }
    if ([(PXAssetsDataSource *)v7 numberOfSections]) {
      uint64_t v10 = [(PXAssetsDataSource *)v7 numberOfItemsInSection:0] - 1;
    }
    else {
      uint64_t v10 = -1;
    }
    uint64_t v12 = 0;
    sectionsCountByLevel = self->_sectionsCountByLevel;
    v26 = self;
    sectionInfosByLevel = self->_sectionInfosByLevel;
    uint64_t v13 = *(void *)off_1E5DAAED8;
    char v14 = 1;
    long long v15 = 0uLL;
    char v16 = 1;
    do
    {
      char v29 = v16;
      uint64_t v17 = sectionsCountByLevel[v12];
      if (v17 >= 1)
      {
        v18 = sectionInfosByLevel[v12];
        do
        {
          uint64_t v19 = *(void *)v18;
          long long v31 = v15;
          long long v32 = v15;
          v30[0] = v9;
          v30[1] = 0;
          v30[2] = v19;
          v30[3] = 0x7FFFFFFFFFFFFFFFLL;
          [off_1E5DA8488 indexPathAfterApplyingChanges:v8 toIndexPath:v30 hasIncrementalChanges:0 objectChanged:0];
          long long v15 = 0uLL;
          if (v19 >= v10) {
            uint64_t v20 = v10;
          }
          else {
            uint64_t v20 = v19;
          }
          if ((void)v31 == v13) {
            uint64_t v21 = v20;
          }
          else {
            uint64_t v21 = v32;
          }
          if ((void)v31 == v13) {
            char v14 = 0;
          }
          *(void *)v18 = v21;
          v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v18 + 32);
          --v17;
        }
        while (v17);
      }
      char v16 = 0;
      uint64_t v12 = 1;
    }
    while ((v29 & 1) != 0);

    BOOL v11 = v14 & 1;
    self = v26;
  }
  else
  {
    BOOL v11 = 1;
  }
  dataSource = self->_dataSource;
  self->_dataSource = v7;

  return v11;
}

- (PXZoomableInlineHeaderSectionInfoMetaDataStore)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXZoomableInlineHeaderSectionInfoMetaDataStore;
  int64_t v6 = [(PXZoomableInlineHeaderSectionInfoMetaDataStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

- (void)resetSectionInfos
{
  self->_sectionsCountByLevel[0] = 0;
  self->_sectionsCountByLevel[1] = 0;
}

- (id)description
{
  uint64_t v3 = self->_sectionsCountByLevel[0];
  uint64_t v4 = self->_sectionsCountByLevel[1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  int64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  v7 = self;
  uint64_t v8 = [(PXZoomableInlineHeaderSectionInfoMetaDataStore *)v7 sectionInfosForLevel:0];
  if (v3 >= 1)
  {
    objc_super v9 = (uint64_t *)(v8 + 8);
    uint64_t v10 = v3;
    do
    {
      uint64_t v11 = *v9;
      v9 += 4;
      uint64_t v12 = [NSNumber numberWithInteger:v11];
      [v5 addObject:v12];

      --v10;
    }
    while (v10);
  }
  uint64_t v13 = v7;
  uint64_t v14 = [(PXZoomableInlineHeaderSectionInfoMetaDataStore *)v13 sectionInfosForLevel:1];
  if (v4 >= 1)
  {
    long long v15 = (void *)(v14 + 16);
    uint64_t v16 = v4;
    do
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld", *(v15 - 1), *v15);
      [v6 addObject:v17];

      v15 += 4;
      --v16;
    }
    while (v16);
  }
  v18 = NSString;
  uint64_t v19 = (objc_class *)objc_opt_class();
  uint64_t v20 = NSStringFromClass(v19);
  uint64_t v21 = [v5 componentsJoinedByString:@", "];
  v22 = [v6 componentsJoinedByString:@", "];
  v23 = [v18 stringWithFormat:@"<%@: %p, %ld years:[%@] %ld months:[%@]>", v20, v13, v3, v21, v4, v22];

  return v23;
}

- (void)dealloc
{
  free(self->_sectionInfosByLevel[0]);
  free(self->_sectionInfosByLevel[1]);
  v3.receiver = self;
  v3.super_class = (Class)PXZoomableInlineHeaderSectionInfoMetaDataStore;
  [(PXZoomableInlineHeaderSectionInfoMetaDataStore *)&v3 dealloc];
}

@end