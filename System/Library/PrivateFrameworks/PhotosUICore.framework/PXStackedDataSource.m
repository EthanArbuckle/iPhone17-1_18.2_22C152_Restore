@interface PXStackedDataSource
- (NSArray)dataSections;
- (PXStackedDataSource)init;
- (PXStackedDataSource)initWithDataSections:(id)a3;
- (id)changeDetailsToDataSource:(id)a3 sectionChanges:(id)a4 itemChanges:(id)a5;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXStackedDataSource

- (void).cxx_destruct
{
}

- (NSArray)dataSections
{
  return self->_dataSections;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = [(PXStackedDataSource *)self dataSections];
    v4 = [v5 objectAtIndexedSubscript:a3->section];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    goto LABEL_19;
  }
  if (a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->section != 0x7FFFFFFFFFFFFFFFLL && v4 != 0)
    {
      uint64_t v7 = [v4 outlineObject];
      goto LABEL_16;
    }
LABEL_19:
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL || v4 == 0) {
    goto LABEL_19;
  }
  uint64_t v7 = objc_msgSend(v4, "objectAtIndex:");
LABEL_16:
  v9 = (void *)v7;

  return v9;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v4 = [(PXStackedDataSource *)self dataSections];
  v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)numberOfSections
{
  v2 = [(PXStackedDataSource *)self dataSections];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)changeDetailsToDataSource:(id)a3 sectionChanges:(id)a4 itemChanges:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v12 = [(PXStackedDataSource *)self identifier];
    uint64_t v13 = [v10 identifier];

    v14 = (void *)[v11 initWithFromDataSourceIdentifier:v12 toDataSourceIdentifier:v13 sectionChanges:v9 itemChangeDetailsBySection:v8 subitemChangeDetailsByItemBySection:0];
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (PXStackedDataSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStackedDataSource.m", 25, @"%s is not available as initializer", "-[PXStackedDataSource init]");

  abort();
}

- (PXStackedDataSource)initWithDataSections:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStackedDataSource;
  int64_t v6 = [(PXStackedDataSource *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSections, a3);
  }

  return v7;
}

@end