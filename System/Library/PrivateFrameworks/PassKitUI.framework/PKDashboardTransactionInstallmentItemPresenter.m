@interface PKDashboardTransactionInstallmentItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardTransactionInstallmentItemPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
@end

@implementation PKDashboardTransactionInstallmentItemPresenter

- (PKDashboardTransactionInstallmentItemPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardTransactionInstallmentItemPresenter;
  v2 = [(PKDashboardTransactionInstallmentItemPresenter *)&v7 init];
  if (v2)
  {
    v3 = [PKDashboardStackedImageCollectionViewCell alloc];
    uint64_t v4 = -[PKDashboardStackedImageCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardStackedImageCollectionViewCell *)v4;
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"TransactionInstallmentItemCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"TransactionInstallmentItemCellReuseIdentifier" forIndexPath:v8];
  [(PKDashboardTransactionInstallmentItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v9 = a4;
  [(PKDashboardTransactionInstallmentItemPresenter *)self _configureCell:sampleCell forItem:a3 inCollectionView:v9 forIndexPath:a5];
  id v10 = self->_sampleCell;
  [v9 bounds];
  double v12 = v11;

  -[PKDashboardStackedImageCollectionViewCell sizeThatFits:](v10, "sizeThatFits:", v12, 1.79769313e308);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v7 = a3;
  id v8 = [a4 installmentPlan];
  id v9 = [v8 product];
  id v10 = [v9 serialNumber];
  double v11 = PKSerialNumber();
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {

LABEL_7:
    v16 = PKDeviceName();
    v17 = [v9 model];
    goto LABEL_10;
  }
  double v14 = v13;
  if (v12 && v13)
  {
    uint64_t v15 = [v12 caseInsensitiveCompare:v13];

    if (!v15) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  v16 = [v9 model];
  v17 = 0;
LABEL_10:
  v18 = [v9 iconURLForScale:0 suffix:PKUIScreenScale()];
  if (v18)
  {
    v19 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
    uint64_t v20 = [v19 cachedDataForURL:v18];
    if (v20)
    {
      v21 = (void *)v20;
      v22 = [MEMORY[0x1E4FB1818] imageWithData:v20];

      if (v22) {
        goto LABEL_19;
      }
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke;
      v30[3] = &unk_1E59DBE50;
      id v31 = v7;
      [v19 downloadFromUrl:v18 completionHandler:v30];
    }
  }
  v23 = PKPassKitUIBundle();
  v24 = [v23 URLForResource:@"InstallmentsFallback" withExtension:@"pdf"];

  if (v24)
  {
    double v25 = PKUIScreenScale();
    v22 = PKUIImageFromPDF(v24, 70.0, 70.0, v25);
  }
  else
  {
    v22 = 0;
  }

LABEL_19:
  v26 = [v8 summary];
  v27 = [v26 startDate];

  if (v27)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v28 setDateStyle:1];
    [v28 setTimeStyle:0];
    v29 = [v28 stringFromDate:v27];
  }
  else
  {
    v29 = 0;
  }
  [v7 setIcon:v22];
  [v7 setTitle:v16];
  [v7 setSubtitle:v17];
  [v7 setTertiaryText:v29];
}

void __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    v5 = [MEMORY[0x1E4FB1818] imageWithData:a2];
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2;
      v6[3] = &unk_1E59CA870;
      id v7 = *(id *)(a1 + 32);
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v6);
    }
  }
}

uint64_t __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIcon:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end