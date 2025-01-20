@interface PKPassPersonalizationViewController
- (BOOL)_contactReadyForPersonalization;
- (BOOL)personalizationCellShouldBeginEditing:(id)a3;
- (BOOL)personalizationCellShouldReturn:(id)a3;
- (PKPassPersonalizationViewController)initWithPass:(id)a3 personalizationToken:(id)a4 personalizationSource:(unint64_t)a5;
- (PKPassPersonalizationViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_nextCellForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureHeaderViewForState:(unint64_t)a3;
- (void)_personalizeNowButtonPressed:(id)a3;
- (void)_personalizePass;
- (void)_positionFooterView;
- (void)_presentPersonalizationErrorAlert;
- (void)_scrollToCellsIfNeeded;
- (void)finishPersonalizationOfPassWithUniqueID:(id)a3 result:(BOOL)a4;
- (void)passPersonalizationTermsViewControllerDidAcceptTerms:(id)a3;
- (void)passPersonalizationTermsViewControllerDidDeclineTerms:(id)a3;
- (void)personalizationCellDidChangeValue:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPassPersonalizationViewController

- (PKPassPersonalizationViewController)initWithPass:(id)a3 personalizationToken:(id)a4 personalizationSource:(unint64_t)a5
{
  v62[16] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 personalization];
  if (!v11)
  {

    v13 = 0;
    goto LABEL_32;
  }
  v57.receiver = self;
  v57.super_class = (Class)PKPassPersonalizationViewController;
  v12 = [(PKPassPersonalizationViewController *)&v57 initWithStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pass, a3);
    uint64_t v14 = [v10 copy];
    personalizationToken = v13->_personalizationToken;
    v13->_personalizationToken = (NSString *)v14;

    v13->_personalizationSource = a5;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v17 = *MEMORY[0x1E4F1ADC8];
    v62[0] = *MEMORY[0x1E4F1AF10];
    v62[1] = v17;
    uint64_t v18 = *MEMORY[0x1E4F1ADF0];
    v62[2] = *MEMORY[0x1E4F1AEE0];
    v62[3] = v18;
    v62[4] = *MEMORY[0x1E4F1ADE0];
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:5];
    v20 = objc_msgSend(v16, "_ios_meContactWithKeysToFetch:error:", v19, 0);

    if (v20) {
      v21 = (PKContact *)[objc_alloc(MEMORY[0x1E4F845D0]) initWithCNContact:v20];
    }
    else {
      v21 = (PKContact *)objc_alloc_init(MEMORY[0x1E4F845D0]);
    }
    v22 = v21;

    contact = v13->_contact;
    v13->_contact = v22;

    char v24 = [v11 requiredPersonalizationFields];
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v26 = 0.0;
    if (v24)
    {
      v27 = objc_alloc_init(PKPassPersonalizationCellContext);
      v28 = PKLocalizedString(&cfstr_Personalizatio_4.isa);
      +[PKPassPersonalizationCell textLabelWidthForText:v28];
      if (v29 >= 0.0)
      {
        +[PKPassPersonalizationCell textLabelWidthForText:v28];
        double v26 = v30;
      }
      [(PKPassPersonalizationCellContext *)v27 setTitle:v28];
      [(PKPassPersonalizationCellContext *)v27 setKeyboardType:0];
      [(PKPassPersonalizationCellContext *)v27 setAutocapitalizationType:1];
      [(PKPassPersonalizationCellContext *)v27 setStringRepresentationBlock:&__block_literal_global_194];
      [(PKPassPersonalizationCellContext *)v27 setContactUpdateBlock:&__block_literal_global_198];
      [v25 addObject:v27];

      if ((v24 & 2) == 0)
      {
LABEL_9:
        if ((v24 & 4) == 0) {
          goto LABEL_10;
        }
        goto LABEL_18;
      }
    }
    else if ((v24 & 2) == 0)
    {
      goto LABEL_9;
    }
    v31 = objc_alloc_init(PKPassPersonalizationCellContext);
    v32 = PKLocalizedString(&cfstr_Personalizatio_5.isa);
    +[PKPassPersonalizationCell textLabelWidthForText:v32];
    if (v26 <= v33)
    {
      +[PKPassPersonalizationCell textLabelWidthForText:v32];
      double v26 = v34;
    }
    [(PKPassPersonalizationCellContext *)v31 setTitle:v32];
    [(PKPassPersonalizationCellContext *)v31 setKeyboardType:0];
    [(PKPassPersonalizationCellContext *)v31 setAutocapitalizationType:3];
    [(PKPassPersonalizationCellContext *)v31 setStringRepresentationBlock:&__block_literal_global_208];
    [(PKPassPersonalizationCellContext *)v31 setContactUpdateBlock:&__block_literal_global_210];
    [v25 addObject:v31];

    if ((v24 & 4) == 0)
    {
LABEL_10:
      if ((v24 & 8) == 0)
      {
LABEL_24:
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v43 = (NSArray *)v25;
        uint64_t v44 = [(NSArray *)v43 countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v59 != v46) {
                objc_enumerationMutation(v43);
              }
              [*(id *)(*((void *)&v58 + 1) + 8 * i) setMinimumTextLabelWidth:v26];
            }
            uint64_t v45 = [(NSArray *)v43 countByEnumeratingWithState:&v58 objects:v62 count:16];
          }
          while (v45);
        }

        cellContexts = v13->_cellContexts;
        v13->_cellContexts = v43;

        v49 = [(PKPassPersonalizationViewController *)v13 navigationItem];
        objc_msgSend(v49, "pkui_setupScrollEdgeChromelessAppearance");
        objc_msgSend(v49, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
        uint64_t v50 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 1);
        privacyController = v13->_privacyController;
        v13->_privacyController = (OBPrivacyLinkController *)v50;

        [(PKPassPersonalizationViewController *)v13 addChildViewController:v13->_privacyController];
        id v52 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        v53 = objc_msgSend(v52, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v54 = [(OBPrivacyLinkController *)v13->_privacyController view];
        [v53 addSubview:v54];

        v55 = [(PKPassPersonalizationViewController *)v13 tableView];
        [v55 setTableFooterView:v53];

        [(OBPrivacyLinkController *)v13->_privacyController didMoveToParentViewController:v13];
        goto LABEL_32;
      }
LABEL_21:
      v39 = objc_alloc_init(PKPassPersonalizationCellContext);
      v40 = PKLocalizedString(&cfstr_Personalizatio_7.isa);
      +[PKPassPersonalizationCell textLabelWidthForText:v40];
      if (v26 <= v41)
      {
        +[PKPassPersonalizationCell textLabelWidthForText:v40];
        double v26 = v42;
      }
      [(PKPassPersonalizationCellContext *)v39 setTitle:v40];
      [(PKPassPersonalizationCellContext *)v39 setKeyboardType:5];
      [(PKPassPersonalizationCellContext *)v39 setBindTextToStringRepresentation:1];
      [(PKPassPersonalizationCellContext *)v39 setStringRepresentationBlock:&__block_literal_global_223];
      [(PKPassPersonalizationCellContext *)v39 setContactUpdateBlock:&__block_literal_global_225];
      [v25 addObject:v39];

      goto LABEL_24;
    }
LABEL_18:
    v35 = objc_alloc_init(PKPassPersonalizationCellContext);
    v36 = PKLocalizedString(&cfstr_Personalizatio_6.isa);
    +[PKPassPersonalizationCell textLabelWidthForText:v36];
    if (v26 <= v37)
    {
      +[PKPassPersonalizationCell textLabelWidthForText:v36];
      double v26 = v38;
    }
    [(PKPassPersonalizationCellContext *)v35 setTitle:v36];
    [(PKPassPersonalizationCellContext *)v35 setKeyboardType:7];
    [(PKPassPersonalizationCellContext *)v35 setTextContentType:*MEMORY[0x1E4FB2F68]];
    [(PKPassPersonalizationCellContext *)v35 setStringRepresentationBlock:&__block_literal_global_216];
    [(PKPassPersonalizationCellContext *)v35 setContactUpdateBlock:&__block_literal_global_218];
    [v25 addObject:v35];

    if ((v24 & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_32:

  return v13;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PKPassPersonalizationViewController;
  [(PKPassPersonalizationViewController *)&v29 viewDidLoad];
  v3 = (void *)MEMORY[0x1E4FB1818];
  v4 = [(PKPass *)self->_pass personalizationLogoImage];
  v5 = [v3 imageWithPKImage:v4];

  v6 = [(PKPass *)self->_pass personalization];
  v7 = [v6 localizedDescription];

  v8 = [[PKPassPersonalizationHeaderView alloc] initWithLogoImage:v5 description:v7];
  headerView = self->_headerView;
  self->_headerView = v8;

  id v10 = PKLocalizedString(&cfstr_Personalizatio.isa);
  v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v10 style:2 target:self action:sel__personalizeNowButtonPressed_];
  personalizeNowButton = self->_personalizeNowButton;
  self->_personalizeNowButton = v11;

  v13 = (void *)MEMORY[0x1E4FB14D8];
  uint64_t v14 = PKLocalizedString(&cfstr_Personalizatio_0.isa);
  v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  id v16 = objc_msgSend(v13, "pkui_plainConfigurationWithTitle:font:", v14, v15);

  objc_msgSend(v16, "setContentInsets:", 23.0, 0.0, 5.0, 0.0);
  uint64_t v17 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v16 setBaseForegroundColor:v17];

  objc_initWeak(&location, self);
  uint64_t v18 = (void *)MEMORY[0x1E4FB13F0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__PKPassPersonalizationViewController_viewDidLoad__block_invoke;
  v26[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v27, &location);
  v26[4] = self;
  v19 = [v18 actionWithHandler:v26];
  v20 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v16 primaryAction:v19];
  personalizeLaterButton = self->_personalizeLaterButton;
  self->_personalizeLaterButton = v20;

  [(UIButton *)self->_personalizeLaterButton setConfigurationUpdateHandler:&__block_literal_global_43];
  v22 = [(PKPassPersonalizationViewController *)self tableView];
  [v22 setTableHeaderView:self->_headerView];

  v23 = [(PKPassPersonalizationViewController *)self tableView];
  [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPassPersonalizationCellReuseIdentifier"];

  [(UIBarButtonItem *)self->_personalizeNowButton setEnabled:[(PKPassPersonalizationViewController *)self _contactReadyForPersonalization]];
  char v24 = [(PKPassPersonalizationViewController *)self navigationItem];
  [v24 setRightBarButtonItem:self->_personalizeNowButton];

  id v25 = [(PKPassPersonalizationViewController *)self navigationItem];
  [v25 setHidesBackButton:1];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __50__PKPassPersonalizationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(WeakRetained + 138);
  [v2 passPersonalizationViewController:*(void *)(a1 + 32) didFinishPersonalizingPass:WeakRetained[131] success:0];
}

void __50__PKPassPersonalizationViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];

  [v3 setTextAlignment:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassPersonalizationViewController;
  [(PKPassPersonalizationViewController *)&v4 viewWillAppear:a3];
  [(PKPassPersonalizationViewController *)self _configureHeaderViewForState:[(PKPassPersonalizationHeaderView *)self->_headerView state]];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassPersonalizationViewController;
  [(PKPassPersonalizationViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKPassPersonalizationViewController *)self tableView];
  [v3 layoutIfNeeded];
  objc_super v4 = [(PKPassPersonalizationViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

  [(PKPassPersonalizationViewController *)self _positionFooterView];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_cellContexts count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  cellContexts = self->_cellContexts;
  id v7 = a4;
  id v8 = a3;
  id v9 = -[NSArray objectAtIndexedSubscript:](cellContexts, "objectAtIndexedSubscript:", [v7 row]);
  id v10 = [v8 dequeueReusableCellWithIdentifier:@"PKPassPersonalizationCellReuseIdentifier" forIndexPath:v7];

  [v10 setContext:v9 andContact:self->_contact];
  [v10 setDelegate:self];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[PKPassPersonalizationCell minimumCellHeight];
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result = 0.0;
  if (!a4)
  {
    objc_msgSend(a3, "bounds", 0.0);
    -[UIButton sizeThatFits:](self->_personalizeLaterButton, "sizeThatFits:", v6, v7);
    return v8;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    objc_super v5 = 0;
  }
  else
  {
    objc_super v5 = self->_personalizeLaterButton;
  }
  return v5;
}

- (BOOL)personalizationCellShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)personalizationCellDidChangeValue:(id)a3
{
  personalizeNowButton = self->_personalizeNowButton;
  BOOL v4 = [(PKPassPersonalizationViewController *)self _contactReadyForPersonalization];

  [(UIBarButtonItem *)personalizeNowButton setEnabled:v4];
}

- (BOOL)personalizationCellShouldReturn:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PKPassPersonalizationViewController *)self tableView];
  double v6 = [v5 indexPathForCell:v4];

  double v7 = [(PKPassPersonalizationViewController *)self _nextCellForIndexPath:v6];
  double v8 = v7;
  if (v7)
  {
    [v7 becomeFirstResponder];
  }
  else
  {
    if (![(PKPassPersonalizationViewController *)self _contactReadyForPersonalization])
    {
      BOOL v9 = 1;
      goto LABEL_7;
    }
    [(PKPassPersonalizationViewController *)self _personalizeNowButtonPressed:self];
  }
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKPassPersonalizationViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)passPersonalizationTermsViewControllerDidAcceptTerms:(id)a3
{
  self->_termsAndConditionsAccepted = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__PKPassPersonalizationViewController_passPersonalizationTermsViewControllerDidAcceptTerms___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [(PKPassPersonalizationViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __92__PKPassPersonalizationViewController_passPersonalizationTermsViewControllerDidAcceptTerms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _personalizePass];
}

- (void)passPersonalizationTermsViewControllerDidDeclineTerms:(id)a3
{
}

- (void)_personalizeNowButtonPressed:(id)a3
{
  id v9 = [(PKPass *)self->_pass personalization];
  if (self->_termsAndConditionsAccepted
    || ([v9 termsAndConditions],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        !v5))
  {
    [(PKPassPersonalizationViewController *)self _personalizePass];
  }
  else
  {
    double v6 = [v9 termsAndConditions];
    double v7 = [[PKPassPersonalizationTermsViewController alloc] initWithTermsAndConditions:v6];
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
    [(PKPassPersonalizationTermsViewController *)v7 setDelegate:self];
    [(PKPassPersonalizationViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_personalizePass
{
  id v3 = [MEMORY[0x1E4F84898] sharedInstance];
  id v4 = [(PKPass *)self->_pass uniqueID];
  [(UIBarButtonItem *)self->_personalizeNowButton setEnabled:0];
  [(UIButton *)self->_personalizeLaterButton setEnabled:0];
  [(PKPassPersonalizationViewController *)self _configureHeaderViewForState:1];
  uint64_t v5 = [(PKPassPersonalizationViewController *)self tableView];
  [v5 safeAreaInsets];
  double v7 = -v6;

  double v8 = [(PKPassPersonalizationViewController *)self tableView];
  objc_msgSend(v8, "setContentOffset:animated:", 1, 0.0, v7);

  id v9 = [(PKPassPersonalizationViewController *)self tableView];
  [v9 setUserInteractionEnabled:0];

  dispatch_time_t v10 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
  v11 = [(PKPass *)self->_pass personalization];
  uint64_t v12 = [v11 requiredPersonalizationFields];

  unint64_t personalizationSource = self->_personalizationSource;
  id v14 = objc_alloc_init(MEMORY[0x1E4F84518]);
  if (personalizationSource <= 1)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_2;
    v31[3] = &unk_1E59CE708;
    id v32 = v3;
    double v33 = self;
    [v14 addOperation:v31];
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_4;
  v26[3] = &unk_1E59CE730;
  id v15 = v3;
  id v27 = v15;
  id v16 = v4;
  id v28 = v16;
  objc_super v29 = self;
  uint64_t v30 = v12;
  [v14 addOperation:v26];
  uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_6;
  v21[3] = &unk_1E59CE758;
  BOOL v25 = personalizationSource < 2;
  id v22 = v15;
  id v23 = v16;
  char v24 = self;
  id v18 = v16;
  id v19 = v15;
  id v20 = (id)[v14 evaluateWithInput:v17 completion:v21];
}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) tableView];
  id v2 = [v1 firstResponder];

  [v2 resignFirstResponder];
}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = *(void **)(a1 + 32);
  v15[0] = *(void *)(*(void *)(a1 + 40) + 1048);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_3;
  v12[3] = &unk_1E59CE6E0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v8 addPasses:v9 withCompletionHandler:v12];
}

uint64_t __55__PKPassPersonalizationViewController__personalizePass__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2 != 0);
}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke_4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  id v10 = (void *)a1[6];
  uint64_t v11 = a1[7];
  uint64_t v12 = v10[133];
  uint64_t v13 = v10[132];
  uint64_t v14 = v10[135];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_5;
  v17[3] = &unk_1E59CA820;
  id v18 = v6;
  id v19 = v7;
  id v15 = v6;
  id v16 = v7;
  [v8 requestPersonalizationOfPassWithUniqueIdentifier:v9 contact:v12 personalizationToken:v13 requiredPersonalizationFields:v11 personalizationSource:v14 handler:v17];
}

uint64_t __55__PKPassPersonalizationViewController__personalizePass__block_invoke_5(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2 ^ 1u);
}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  id v7 = v6;
  if (*(unsigned char *)(a1 + 56) && [v6 isCanceled]) {
    [*(id *)(a1 + 32) removePassWithUniqueID:*(void *)(a1 + 40) diagnosticReason:@"personalization failed"];
  }
  objc_msgSend(*(id *)(a1 + 48), "finishPersonalizationOfPassWithUniqueID:result:", *(void *)(a1 + 40), objc_msgSend(v7, "isCanceled") ^ 1);
}

- (void)finishPersonalizationOfPassWithUniqueID:(id)a3 result:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke;
  block[3] = &unk_1E59CD7B0;
  BOOL v11 = a4;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [MEMORY[0x1E4F84898] sharedInstance];
    id v3 = [v2 passWithUniqueID:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) _configureHeaderViewForState:2];
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke_2;
    block[3] = &unk_1E59CD7B0;
    void block[4] = *(void *)(a1 + 40);
    id v9 = v3;
    char v10 = *(unsigned char *)(a1 + 48);
    id v5 = v3;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [*(id *)(a1 + 40) _configureHeaderViewForState:0];
    [*(id *)(a1 + 40) _presentPersonalizationErrorAlert];
    id v6 = [*(id *)(a1 + 40) tableView];
    [v6 setUserInteractionEnabled:1];

    [*(id *)(*(void *)(a1 + 40) + 1032) setEnabled:1];
    id v7 = *(void **)(*(void *)(a1 + 40) + 1040);
    [v7 setEnabled:1];
  }
}

void __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1104));
  [WeakRetained passPersonalizationViewController:*(void *)(a1 + 32) didFinishPersonalizingPass:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)_contactReadyForPersonalization
{
  id v3 = [(PKPass *)self->_pass personalization];
  char v4 = [v3 requiredPersonalizationFields];

  id v5 = [(PKContact *)self->_contact name];
  id v6 = [v5 givenName];

  id v7 = [(PKContact *)self->_contact postalAddress];
  id v8 = [v7 postalCode];

  id v9 = [(PKContact *)self->_contact phoneNumber];
  char v10 = [v9 stringValue];

  BOOL v11 = [(PKContact *)self->_contact emailAddress];
  BOOL v12 = ((v4 & 1) == 0 || [v6 length])
     && ((v4 & 2) == 0 || [v8 length])
     && ((v4 & 8) == 0 || [v10 length])
     && ((v4 & 4) == 0 || [v11 length] != 0);

  return v12;
}

- (void)_scrollToCellsIfNeeded
{
  if (!self->_hasScrolledToCells)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKPassPersonalizationViewController__scrollToCellsIfNeeded__block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    self->_hasScrolledToCells = 1;
  }
}

void __61__PKPassPersonalizationViewController__scrollToCellsIfNeeded__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 scrollToRowAtIndexPath:v3 atScrollPosition:1 animated:1];
}

- (void)_configureHeaderViewForState:(unint64_t)a3
{
  [(PKPassPersonalizationHeaderView *)self->_headerView setState:a3];
  char v4 = [(PKPassPersonalizationViewController *)self tableView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  -[PKPassPersonalizationHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v6, v8);
  double v10 = v9;
  [(PKPassPersonalizationHeaderView *)self->_headerView frame];
  -[PKPassPersonalizationHeaderView setFrame:](self->_headerView, "setFrame:");
  id v11 = [(PKPassPersonalizationViewController *)self tableView];
  [v11 _tableHeaderHeightDidChangeToHeight:v10];
}

- (void)_positionFooterView
{
  id v3 = [(PKPassPersonalizationViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  id v24 = [(PKPassPersonalizationViewController *)self tableView];
  double v6 = [v24 tableFooterView];
  [v24 bounds];
  if (v6)
  {
    double v8 = v7;
    if (PKUIGetMinScreenWidthType()) {
      double v9 = 24.0;
    }
    else {
      double v9 = 5.0;
    }
    objc_msgSend(v24, "pkui_readableContentBoundsWithMargins:", 0.0, v9, 11.0, v9);
    double v11 = v10;
    BOOL v12 = [(OBPrivacyLinkController *)self->_privacyController view];
    LODWORD(v13) = 1148846080;
    LODWORD(v14) = 1112014848;
    objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v11, 0.0, v13, v14);
    double v16 = v15;
    double v18 = v17;
    [v12 frame];
    v29.origin.y = 0.0;
    v29.origin.x = v9;
    v29.size.width = v16;
    v29.size.height = v18;
    if (!CGRectEqualToRect(v26, v29)) {
      objc_msgSend(v12, "setFrame:", v9, 0.0, v16, v18);
    }
    v27.origin.y = 0.0;
    v27.origin.x = v9;
    v27.size.width = v16;
    v27.size.height = v18;
    CGFloat v19 = CGRectGetMaxY(v27) + 11.0;
    [v24 layoutIfNeeded];
    [v24 _rectForTableFooterView];
    double v21 = v20;
    double v23 = v22;
    objc_msgSend(v24, "pkui_naturalRestingBounds");
    objc_msgSend(v6, "setFrame:", v21, fmax(v23, CGRectGetMaxY(v28) - v19 - v5), v8, v19);
  }
}

- (id)_nextCellForIndexPath:(id)a3
{
  unint64_t v4 = [a3 row] + 1;
  if (v4 >= [(NSArray *)self->_cellContexts count])
  {
    double v7 = 0;
  }
  else
  {
    double v5 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:0];
    double v6 = [(PKPassPersonalizationViewController *)self tableView];
    double v7 = [v6 cellForRowAtIndexPath:v5];
  }

  return v7;
}

- (void)_presentPersonalizationErrorAlert
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  unint64_t v4 = PKLocalizedString(&cfstr_Personalizatio_2.isa);
  double v5 = PKLocalizedString(&cfstr_Personalizatio_3.isa);
  id v9 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  double v6 = (void *)MEMORY[0x1E4FB1410];
  double v7 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  double v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v9 addAction:v8];

  [(PKPassPersonalizationViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (PKPassPersonalizationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassPersonalizationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_cellContexts, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_personalizationToken, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_personalizeLaterButton, 0);
  objc_storeStrong((id *)&self->_personalizeNowButton, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end