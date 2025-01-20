@interface PKAccountSupportTopicsSectionController
- (PKAccountSupportTopicsSectionController)initWithAccount:(id)a3 topics:(id)a4 sectionTitle:(id)a5 delegate:(id)a6;
- (id)_decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
@end

@implementation PKAccountSupportTopicsSectionController

- (PKAccountSupportTopicsSectionController)initWithAccount:(id)a3 topics:(id)a4 sectionTitle:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKAccountSupportTopicsSectionController;
  v15 = [(PKPaymentSetupListSectionController *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong((id *)&v16->_account, a3);
    objc_storeStrong((id *)&v16->_topics, a4);
    objc_storeStrong((id *)&v16->_sectionTitle, a5);
    objc_initWeak(&location, v16);
    v17 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v18 = objc_opt_class();
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __88__PKAccountSupportTopicsSectionController_initWithAccount_topics_sectionTitle_delegate___block_invoke;
    v24 = &unk_1E59CBB38;
    objc_copyWeak(&v25, &location);
    v19 = [v17 registrationWithCellClass:v18 configurationHandler:&v21];
    -[PKPaymentSetupListSectionController setCellRegistration:](v16, "setCellRegistration:", v19, v21, v22, v23, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __88__PKAccountSupportTopicsSectionController_initWithAccount_topics_sectionTitle_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained _decorateListCell:v9 forRowItem:v6];
  }
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  sectionTitle = self->_sectionTitle;
  v11[0] = *MEMORY[0x1E4FB06F8];
  id v6 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E4FB0700];
  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = (void *)[v4 initWithString:sectionTitle attributes:v8];

  return v9;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_topics];

  return v5;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKAccountSupportTopicsSectionController;
  id v4 = a3;
  id v5 = [(PKPaymentSetupListSectionController *)&v8 defaultListLayout];
  objc_msgSend(v5, "setFooterMode:", 1, v8.receiver, v8.super_class);
  id v6 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v5 layoutEnvironment:v4];

  return v6;
}

- (void)didSelectItem:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deselectCells];

    id v6 = v9;
    v7 = [v6 explanation];
    if (v7)
    {
    }
    else if ([v6 supportsBusinessChat])
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 openBusinessChatForTopic:v6];
LABEL_7:

      goto LABEL_8;
    }
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 showExplanationForTopic:v6];
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_decorateListCell:(id)a3 forRowItem:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 valueCellConfiguration];
  id v9 = [v6 title];

  [v8 setText:v9];
  [v7 setContentConfiguration:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1518]);
  v13[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v7 setAccessories:v11];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end