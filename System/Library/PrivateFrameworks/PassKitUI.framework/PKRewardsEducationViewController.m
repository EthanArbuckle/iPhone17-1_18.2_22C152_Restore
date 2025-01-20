@interface PKRewardsEducationViewController
- (BOOL)_shouldShowLinkSection;
- (PKRewardsEducationViewController)initWithAccount:(id)a3 accountService:(id)a4 enhancedMerchantsFetcher:(id)a5;
- (id)_linkTableViewCellForIndexPath:(id)a3;
- (id)_tierTableViewCellForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_close:(id)a3;
- (void)_presentMerchantBenefitsView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKRewardsEducationViewController

- (PKRewardsEducationViewController)initWithAccount:(id)a3 accountService:(id)a4 enhancedMerchantsFetcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKRewardsEducationViewController;
  v12 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v17, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_accountService, a4);
    objc_storeStrong((id *)&v13->_enhancedMerchantsFetcher, a5);
    v14 = [(PKRewardsEducationViewController *)v13 navigationItem];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:v13 action:sel__close_];
    [v14 setRightBarButtonItem:v15];
  }
  return v13;
}

- (void)viewDidLoad
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PKRewardsEducationViewController;
  [(PKSectionTableViewController *)&v22 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F84F50]);
  v4 = PKLocalizedFeatureString();
  v5 = PKLocalizedFeatureString();
  v6 = (void *)[v3 initWithTier:3 localizedTitle:v4 localizedSubtitle:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F84F50]);
  v8 = PKLocalizedFeatureString();
  id v9 = PKLocalizedFeatureString();
  id v10 = (void *)[v7 initWithTier:2 localizedTitle:v8 localizedSubtitle:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F84F50]);
  v12 = PKLocalizedFeatureString();
  v13 = PKLocalizedFeatureString();
  v14 = (void *)[v11 initWithTier:1 localizedTitle:v12 localizedSubtitle:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F84F50]);
  v16 = PKLocalizedFeatureString();
  objc_super v17 = PKLocalizedFeatureString();
  v18 = (void *)[v15 initWithTier:4 localizedTitle:v16 localizedSubtitle:v17];

  v23[0] = v6;
  v23[1] = v10;
  v23[2] = v14;
  v23[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  tiers = self->_tiers;
  self->_tiers = v19;

  v21 = [(PKRewardsEducationViewController *)self tableView];
  [v21 registerClass:objc_opt_class() forCellReuseIdentifier:@"RewardsTierEducationCellIdentifier"];
  [v21 registerClass:objc_opt_class() forCellReuseIdentifier:@"LinkEducationCellIdentifier"];
  [v21 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"HeaderIdentifier"];
  [v21 setDataSource:self];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKRewardsEducationViewController;
  [(PKRewardsEducationViewController *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKRewardsEducationViewController *)self traitCollection];
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      id v7 = [v4 preferredContentSizeCategory];
      v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        id v10 = [(PKRewardsEducationViewController *)self tableView];
        [v10 reloadData];
      }
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(PKRewardsEducationViewController *)self _shouldShowLinkSection]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v7 = [(PKRewardsEducationViewController *)self _shouldShowLinkSection];
  }
  else if (a4)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(NSArray *)self->_tiers count];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  if (v6 == 1)
  {
    uint64_t v7 = [(PKRewardsEducationViewController *)self _linkTableViewCellForIndexPath:v5];
    goto LABEL_5;
  }
  if (!v6)
  {
    uint64_t v7 = [(PKRewardsEducationViewController *)self _tierTableViewCellForIndexPath:v5];
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)_tierTableViewCellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PKRewardsEducationViewController *)self tableView];
  uint64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"RewardsTierEducationCellIdentifier" forIndexPath:v4];

  tiers = self->_tiers;
  uint64_t v8 = [v4 row];

  NSComparisonResult v9 = [(NSArray *)tiers objectAtIndex:v8];
  id v10 = [v9 localizedTitle];
  [v6 setTitle:v10];

  objc_super v11 = [v9 localizedSubtitle];
  [v6 setSubtitle:v11];

  unint64_t v12 = [v9 tier] - 1;
  if (v12 > 3)
  {
    v13 = 0;
  }
  else
  {
    v13 = PKUIImageNamed(off_1E59CB688[v12]);
  }
  v14 = [v6 tierIcon];
  [v14 setImage:v13];

  [v6 setLink:0];
  [v6 setSelectionStyle:0];

  return v6;
}

- (id)_linkTableViewCellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PKRewardsEducationViewController *)self tableView];
  uint64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"LinkEducationCellIdentifier" forIndexPath:v4];

  uint64_t v7 = [v6 textLabel];
  uint64_t v8 = PKLocalizedFeatureString();
  [v7 setText:v8];

  NSComparisonResult v9 = [v6 textLabel];
  id v10 = [MEMORY[0x1E4FB1618] linkColor];
  [v9 setTextColor:v10];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [v6 section];

  if (v7 == 1)
  {
    [(PKRewardsEducationViewController *)self _presentMerchantBenefitsView];
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(PKRewardsEducationViewController *)self tableView];
    id v4 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderIdentifier"];
  }

  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([a3 numberOfSections] - 1 == a4)
  {
    id v4 = PKLocalizedFeatureString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_presentMerchantBenefitsView
{
  id v3 = [[PKEnhancedMerchantsViewController alloc] initWithAccount:self->_account accountService:self->_accountService enhancedMerchantsFetcher:self->_enhancedMerchantsFetcher];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke;
  aBlock[3] = &unk_1E59CB010;
  objc_copyWeak(&v10, &location);
  id v4 = v3;
  NSComparisonResult v9 = v4;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_3;
    v6[3] = &unk_1E59CA9F8;
    uint64_t v7 = v5;
    [(PKEnhancedMerchantsViewController *)v4 preflightWithCompletion:v6];
  }
  else
  {
    v5[2](v5);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_2;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:*(void *)(a1 + 32)];
  [WeakRetained presentViewController:v2 animated:1 completion:0];
}

uint64_t __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_close:(id)a3
{
  id v3 = [(PKRewardsEducationViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_shouldShowLinkSection
{
  return [(PKAccount *)self->_account showEnhancedMerchants];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiers, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end