@interface PXImportSectionHeaderLayoutProvider
- (PLDateRangeFormatter)dateRangeFormatter;
- (PXImportSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4;
- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
@end

@implementation PXImportSectionHeaderLayoutProvider

- (void).cxx_destruct
{
}

- (PLDateRangeFormatter)dateRangeFormatter
{
  return self->_dateRangeFormatter;
}

- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  [a3 numberOfItemsInSection:a4->section];
  v4 = PXLocalizedStringFromTable(@"PXImportItemsCount", @"PhotosUICore");
  v5 = PXLocalizedStringWithValidatedFormat(v4, @"%ld");

  return v5;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  long long v5 = *(_OWORD *)&a4->item;
  v13[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v13[1] = v5;
  v6 = [a3 assetCollectionAtSectionIndexPath:v13];
  v7 = [v6 startDate];
  if (v7)
  {
    v8 = [(PXImportSectionHeaderLayoutProvider *)self dateRangeFormatter];
    v9 = [v8 stringFromDate:v7];
  }
  else
  {
    v9 = &stru_1F00B0030;
  }
  v10 = PXLocalizedStringFromTable(@"IMPORT_HISTORY_IMPORTED_ON_DATE", @"PhotosUICore");
  v11 = PXStringWithValidatedFormat();

  return v11;
}

- (PXImportSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXImportSectionHeaderLayoutProvider;
  v4 = [(PXActionableSectionHeaderLayoutProvider *)&v8 initWithViewModel:a3 viewProvider:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8A798]) initWithPreset:3];
    dateRangeFormatter = v4->_dateRangeFormatter;
    v4->_dateRangeFormatter = (PLDateRangeFormatter *)v5;
  }
  return v4;
}

@end