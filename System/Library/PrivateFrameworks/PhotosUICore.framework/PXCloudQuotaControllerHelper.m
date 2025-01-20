@interface PXCloudQuotaControllerHelper
- (BOOL)dismissibleOffers;
- (BOOL)hasAnyInformationViews;
- (PXCloudQuotaControllerHelper)init;
- (PXCloudQuotaControllerHelperDelegate)delegate;
- (UIView)informationView;
- (UIView)premiumInformationView;
- (id)initForDismissibleOffers:(BOOL)a3;
- (id)presentingViewControllerForCloudQuotaController:(id)a3;
- (void)cloudQuotaController:(id)a3 informationViewDidChange:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PXCloudQuotaControllerHelper

- (void)setDelegate:(id)a3
{
}

- (id)initForDismissibleOffers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_opt_class();
    v7 = @"non-dismissible";
    *(_DWORD *)buf = 138543874;
    v17 = v6;
    if (v3) {
      v7 = @"dismissible";
    }
    __int16 v18 = 2048;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v7;
    id v8 = v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> init %@", buf, 0x20u);
  }
  v15.receiver = self;
  v15.super_class = (Class)PXCloudQuotaControllerHelper;
  v9 = [(PXCloudQuotaControllerHelper *)&v15 init];
  if (v9)
  {
    v10 = [[PXCloudQuotaOfferController alloc] initForDismissibleOffers:v3];
    offerController = v9->_offerController;
    v9->_offerController = v10;

    [(PXCloudQuotaController *)v9->_offerController setDelegate:v9];
    v12 = objc_alloc_init(PXCloudQuotaPremiumOfferController);
    premiumOfferController = v9->_premiumOfferController;
    v9->_premiumOfferController = v12;

    [(PXCloudQuotaController *)v9->_premiumOfferController setDelegate:v9];
    v9->_dismissibleOffers = v3;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_premiumOfferController, 0);
  objc_storeStrong((id *)&self->_offerController, 0);
}

- (BOOL)dismissibleOffers
{
  return self->_dismissibleOffers;
}

- (PXCloudQuotaControllerHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCloudQuotaControllerHelperDelegate *)WeakRetained;
}

- (id)presentingViewControllerForCloudQuotaController:(id)a3
{
  v4 = [(PXCloudQuotaControllerHelper *)self delegate];
  v5 = [v4 presentingViewControllerForCloudQuotaControllerHelper:self];

  return v5;
}

- (void)cloudQuotaController:(id)a3 informationViewDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(PXCloudQuotaControllerHelper *)self delegate];
  [v6 cloudQuotaControllerHelper:self informationViewDidChange:v5];
}

- (UIView)premiumInformationView
{
  return [(PXCloudQuotaController *)self->_premiumOfferController informationView];
}

- (UIView)informationView
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXCloudQuotaController *)self->_offerController informationView];
  v4 = [(PXCloudQuotaControllerHelper *)self premiumInformationView];

  if (v4 && v3)
  {
    id v5 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      v11 = self;
      id v6 = v9;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Both offer and premium offer available. Will only use premium offer", (uint8_t *)&v8, 0x16u);
    }
    BOOL v3 = 0;
  }
  return (UIView *)v3;
}

- (BOOL)hasAnyInformationViews
{
  BOOL v3 = [(PXCloudQuotaController *)self->_offerController informationView];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PXCloudQuotaController *)self->_premiumOfferController informationView];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (PXCloudQuotaControllerHelper)init
{
  return (PXCloudQuotaControllerHelper *)[(PXCloudQuotaControllerHelper *)self initForDismissibleOffers:0];
}

@end