@interface PXPhotosKeyAssetSectionHeaderLayoutProvider
- (PXPhotosBannerProvider)bannerProvider;
- (PXPhotosKeyAssetSectionHeaderLayoutProvider)init;
- (PXPhotosKeyAssetSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4 bannerProvider:(id)a5;
- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider;
- (PXPhotosViewModel)viewModel;
- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7;
- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7;
@end

@implementation PXPhotosKeyAssetSectionHeaderLayoutProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXPhotosBannerProvider)bannerProvider
{
  return self->_bannerProvider;
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
  v13 = [PXPhotosKeyAssetSectionHeaderLayout alloc];
  v14 = [(PXPhotosKeyAssetSectionHeaderLayoutProvider *)self viewModel];
  v15 = [(PXPhotosKeyAssetSectionHeaderLayout *)v13 initWithViewModel:v14];

  [(PXPhotosKeyAssetSectionHeaderLayout *)v15 setDataSource:v12];
  long long v16 = *(_OWORD *)&a5->item;
  v19[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v19[1] = v16;
  [(PXPhotosKeyAssetSectionHeaderLayout *)v15 setSectionIndexPath:v19];
  v17 = [(PXPhotosKeyAssetSectionHeaderLayoutProvider *)self bannerProvider];
  [(PXPhotosKeyAssetSectionHeaderLayout *)v15 setBannerProvider:v17];

  [(PXPhotosKeyAssetSectionHeaderLayout *)v15 setSpec:v11];
  *a7 = 2;
  return v15;
}

- (PXPhotosKeyAssetSectionHeaderLayoutProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosKeyAssetSectionHeaderLayoutProvider.m", 26, @"%s is not available as initializer", "-[PXPhotosKeyAssetSectionHeaderLayoutProvider init]");

  abort();
}

- (PXPhotosKeyAssetSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4 bannerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayoutProvider;
  id v12 = [(PXPhotosKeyAssetSectionHeaderLayoutProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeWeak((id *)&v13->_viewProvider, v10);
    objc_storeStrong((id *)&v13->_bannerProvider, a5);
  }

  return v13;
}

@end