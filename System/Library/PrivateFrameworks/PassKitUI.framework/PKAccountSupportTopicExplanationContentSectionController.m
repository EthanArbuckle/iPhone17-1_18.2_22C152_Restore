@interface PKAccountSupportTopicExplanationContentSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKAccountSupportTopicExplanationContentSectionController)initWithContent:(id)a3;
- (id)cellRegistrationForItem:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
@end

@implementation PKAccountSupportTopicExplanationContentSectionController

- (PKAccountSupportTopicExplanationContentSectionController)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountSupportTopicExplanationContentSectionController;
  v6 = [(PKPaymentSetupListSectionController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_content, a3);
  }

  return v7;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v6 = v5;
  if (self->_content)
  {
    v9[0] = self->_content;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 appendItems:v7];
  }
  else
  {
    [v5 appendItems:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 registrationWithCellClass:v4 configurationHandler:&__block_literal_global_79];
}

uint64_t __84__PKAccountSupportTopicExplanationContentSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 setExplanationContent:a4];
}

- (void).cxx_destruct
{
}

@end