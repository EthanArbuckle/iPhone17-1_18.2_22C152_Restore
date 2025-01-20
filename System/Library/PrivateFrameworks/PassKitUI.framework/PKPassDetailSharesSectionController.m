@interface PKPassDetailSharesSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (PKPassDetailSharesSectionController)init;
- (PKPassDetailSharesSectionController)initWithSharesController:(id)a3 delegate:(id)a4;
- (PKPassDetailSharesSectionControllerDelegate)delegate;
- (PKSharedPassSharesController)sharesController;
- (id)_localizedEntitlementSummary;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)_updateSectionIdentifiers;
- (void)dealloc;
- (void)preflight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sharedPassSharesControllerDidUpdateShares:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPassDetailSharesSectionController

- (PKPassDetailSharesSectionController)init
{
  return 0;
}

- (PKPassDetailSharesSectionController)initWithSharesController:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassDetailSharesSectionController;
  v9 = [(PKPaymentPassDetailSectionController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharesController, a3);
    [(PKSharedPassSharesController *)v10->_sharesController addDelegate:v10];
    objc_storeWeak((id *)&v10->_delegate, v8);
    [(PKPassDetailSharesSectionController *)v10 _updateSectionIdentifiers];
  }

  return v10;
}

- (void)dealloc
{
  [(PKSharedPassSharesController *)self->_sharesController removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPassDetailSharesSectionController;
  [(PKPassDetailSharesSectionController *)&v3 dealloc];
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

- (void)_updateSectionIdentifiers
{
  objc_super v3 = [(PKSharedPassSharesController *)self->_sharesController myEntitlements];
  int mapped = self->_mapped;
  id v8 = v3;
  if (v3) {
    int v5 = [v3 count] != 0;
  }
  else {
    int v5 = 0;
  }
  self->_int mapped = v5;
  if (mapped != v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [(PKPassDetailSharesSectionController *)self sectionIdentifiers];
    [WeakRetained reloadSections:v7];
  }
}

- (void)preflight:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  sharesController = self->_sharesController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PKPassDetailSharesSectionController_preflight___block_invoke;
  v7[3] = &unk_1E59CB128;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(PKSharedPassSharesController *)sharesController updateSharesWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__PKPassDetailSharesSectionController_preflight___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F84870]);
    objc_super v3 = [WeakRetained[10] myEntitlements];
    id v4 = [WeakRetained[10] possiblePredefinedEntitlements];
    uint64_t v5 = [v2 initWithMyEntitlements:v3 predefinedSharedEntitlements:v4];
    id v6 = WeakRetained[9];
    WeakRetained[9] = (id)v5;

    *((unsigned char *)WeakRetained + 64) = 1;
    [WeakRetained _updateSectionIdentifiers];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"EntitlementsSection";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)_localizedEntitlementSummary
{
  entitlementComposer = self->_entitlementComposer;
  objc_super v3 = [(PKSharedPassSharesController *)self->_sharesController pass];
  id v4 = -[PKPassEntitlementsComposer localizedSelectedEntitlementSummaryForAccessType:](entitlementComposer, "localizedSelectedEntitlementSummaryForAccessType:", [v3 accessType]);

  return v4;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment] || !self->_mapped)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    objc_super v3 = [(PKPassDetailSharesSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6 = a3;
  if (PKEqualObjects())
  {
    id v7 = [(PKSharedPassSharesController *)self->_sharesController pass];
    uint64_t v8 = [v7 accessType];

    if (v8 == 4)
    {
      id v9 = PKLocalizedShareableCredentialString(&cfstr_MyEntitlements.isa);
      v10 = [(PKPassDetailSharesSectionController *)self _localizedEntitlementSummary];
      v11 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v9 detailText:v10 cellStyle:1 forTableView:v6];
    }
    else
    {
      id v9 = PKLocalizedShareableCredentialString(&cfstr_MyEntitlements_0.isa);
      v11 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v9 detailText:0 cellStyle:1 forTableView:v6];
    }

    [v11 setAccessoryType:1];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return PKEqualObjects();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  if (PKEqualObjects())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sharesSectionControllerDidSelectViewEntitlements:self];
  }
}

- (void)sharedPassSharesControllerDidUpdateShares:(id)a3
{
  if (self->_hasLoadedInitialData) {
    [(PKPassDetailSharesSectionController *)self _updateSectionIdentifiers];
  }
}

- (PKSharedPassSharesController)sharesController
{
  return self->_sharesController;
}

- (PKPassDetailSharesSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassDetailSharesSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharesController, 0);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end