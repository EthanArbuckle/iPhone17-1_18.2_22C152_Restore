@interface PKPassDetailsPrecursorPassUpgradeSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (PKPassDetailsPrecursorPassUpgradeSectionController)init;
- (PKPassDetailsPrecursorPassUpgradeSectionController)initWithPass:(id)a3 webService:(id)a4 delegate:(id)a5;
- (PKPassDetailsPrecursorPassUpgradeSectionControllerDelegate)delegate;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)_updateSectionIdentifiersNotify:(BOOL)a3 animated:(BOOL)a4;
- (void)loadDescriptionWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)precursorPassUpgradeRequestDidChange;
- (void)preflight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPassDetailsPrecursorPassUpgradeSectionController

- (PKPassDetailsPrecursorPassUpgradeSectionController)init
{
  return 0;
}

- (PKPassDetailsPrecursorPassUpgradeSectionController)initWithPass:(id)a3 webService:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPassDetailsPrecursorPassUpgradeSectionController;
  v12 = [(PKPaymentPassDetailSectionController *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pass, a3);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F84E78]) initWithPass:v9 webService:v10];
    precursorController = v13->_precursorController;
    v13->_precursorController = (PKPrecursorPassUpgradeController *)v14;

    [(PKPrecursorPassUpgradeController *)v13->_precursorController setDelegate:v13];
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

- (void)_updateSectionIdentifiersNotify:(BOOL)a3 animated:(BOOL)a4
{
  int mapped = self->_mapped;
  int v5 = self->_description != 0;
  self->_int mapped = v5;
  if (a3 && mapped != v5)
  {
    BOOL v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v6)
    {
      v8 = [(PKPassDetailsPrecursorPassUpgradeSectionController *)self sectionIdentifiers];
      [WeakRetained reloadSections:v8];
    }
    else
    {
      [WeakRetained reloadData:0];
    }
  }
}

- (void)loadDescriptionWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(PKPrecursorPassUpgradeController *)self->_precursorController devicePrimaryPrecursorRequest];
  precursorController = self->_precursorController;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__PKPassDetailsPrecursorPassUpgradeSectionController_loadDescriptionWithAnimated_completion___block_invoke;
  v10[3] = &unk_1E59D3880;
  BOOL v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(PKPrecursorPassUpgradeController *)precursorController requestDescriptionFor:v7 completion:v10];
}

void __93__PKPassDetailsPrecursorPassUpgradeSectionController_loadDescriptionWithAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a2);
  [*(id *)(a1 + 32) _updateSectionIdentifiersNotify:1 animated:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)preflight:(id)a3
{
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PrecursorPassSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ((unint64_t)([(PKPaymentPassDetailSectionController *)self detailViewStyle] - 1) > 1
    || [(PKPaymentPassDetailSectionController *)self currentSegment]
    || !self->_mapped)
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKPassDetailsPrecursorPassUpgradeSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (PKEqualObjects())
  {
    uint64_t v9 = [v8 row];
    description = self->_description;
    if (v9)
    {
      id v11 = [(PKPrecursorPassUpgradeRequestDescription *)description localizedActionText];
      BOOL v12 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v11 forTableView:v7];
    }
    else
    {
      id v11 = [(PKPrecursorPassUpgradeRequestDescription *)description localizedTitle];
      v13 = [(PKPrecursorPassUpgradeRequestDescription *)self->_description localizedDescription];
      BOOL v12 = [(PKPaymentPassDetailSectionController *)self stackedInfoCellWithPrimaryText:v11 detailText:v13 cellStyle:1 forTableView:v7];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  if (!PKEqualObjects()) {
    return 0;
  }
  description = self->_description;
  if (!description) {
    return 0;
  }
  id v6 = [(PKPrecursorPassUpgradeRequestDescription *)description localizedActionText];
  if (v6) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 deselectRowAtIndexPath:v9 animated:1];
  int v11 = PKEqualObjects();

  if (v11 && [v9 row] == 1)
  {
    BOOL v12 = [v8 cellForRowAtIndexPath:v9];
    [(PKPaymentPassDetailSectionController *)self showSpinner:1 inCell:v12 overrideTextColor:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    description = self->_description;
    precursorController = self->_precursorController;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __106__PKPassDetailsPrecursorPassUpgradeSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v17[3] = &unk_1E59CA870;
    v17[4] = self;
    id v18 = v12;
    id v16 = v12;
    [WeakRetained didSelectPrecursorPassRequestForDescription:description controller:precursorController completion:v17];
  }
}

void __106__PKPassDetailsPrecursorPassUpgradeSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 linkTextColor];
  [v1 showSpinner:0 inCell:v2 overrideTextColor:v3];
}

- (void)precursorPassUpgradeRequestDidChange
{
}

- (PKPassDetailsPrecursorPassUpgradeSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassDetailsPrecursorPassUpgradeSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_precursorController, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end