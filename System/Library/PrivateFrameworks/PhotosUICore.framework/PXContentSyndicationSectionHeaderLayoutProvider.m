@interface PXContentSyndicationSectionHeaderLayoutProvider
- (PXContentSyndicationSectionHeaderLayoutProvider)init;
- (PXContentSyndicationSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4;
- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider;
- (PXPhotosViewModel)viewModel;
- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7;
- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7;
@end

@implementation PXContentSyndicationSectionHeaderLayoutProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  return (PXPhotosSectionHeaderLayoutViewProvider *)WeakRetained;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7
{
  id v9 = a4;
  [v9 setDataSource:a5];
  long long v10 = *(_OWORD *)&a6->item;
  v11[0] = *(_OWORD *)&a6->dataSourceIdentifier;
  v11[1] = v10;
  [v9 setSectionIndexPath:v11];
}

- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7
{
  id v11 = a6;
  id v12 = a4;
  v13 = +[PXContentSyndicationConfigurationProvider sharedInstance];
  v14 = [v13 syndicationItemsDataSourceManager];

  v15 = [v14 socialLayerHighlightProvider];
  v16 = [[_PXContentSyndicationSectionHeaderLayout alloc] initWithSpec:v11 socialLayerHighlightProvider:v15];

  v17 = [(PXContentSyndicationSectionHeaderLayoutProvider *)self viewModel];
  v18 = [v17 assetCollectionActionManager];
  [(_PXContentSyndicationSectionHeaderLayout *)v16 setAssetCollectionManager:v18];

  [(_PXContentSyndicationSectionHeaderLayout *)v16 setDataSource:v12];
  long long v19 = *(_OWORD *)&a5->item;
  v22[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v22[1] = v19;
  [(_PXContentSyndicationSectionHeaderLayout *)v16 setSectionIndexPath:v22];
  [(PXGSingleViewLayout *)v16 setStyle:0];
  LODWORD(v20) = -1080452710;
  [(PXGSingleViewLayout *)v16 setZPosition:v20];
  *a7 = 1;

  return v16;
}

- (PXContentSyndicationSectionHeaderLayoutProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXContentSyndicationSectionHeaderLayoutProvider.m", 67, @"%s is not available as initializer", "-[PXContentSyndicationSectionHeaderLayoutProvider init]");

  abort();
}

- (PXContentSyndicationSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXContentSyndicationSectionHeaderLayoutProvider;
  id v9 = [(PXContentSyndicationSectionHeaderLayoutProvider *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_viewProvider, v8);
  }

  return v10;
}

@end