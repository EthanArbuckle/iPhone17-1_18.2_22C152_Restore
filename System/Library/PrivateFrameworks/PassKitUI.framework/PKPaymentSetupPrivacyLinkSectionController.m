@interface PKPaymentSetupPrivacyLinkSectionController
- (OBPrivacyLinkController)privacyLink;
- (PKPaymentSetupPrivacyLinkSectionController)init;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)setPrivacyLink:(id)a3;
@end

@implementation PKPaymentSetupPrivacyLinkSectionController

- (PKPaymentSetupPrivacyLinkSectionController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupPrivacyLinkSectionController;
  v2 = [(PKPaymentSetupListSectionController *)&v10 initWithIdentifiers:&unk_1EF2B9F60];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v4 = objc_opt_class();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PKPaymentSetupPrivacyLinkSectionController_init__block_invoke;
    v8[3] = &unk_1E59CFAB8;
    v5 = v2;
    v9 = v5;
    v6 = [v3 registrationWithCellClass:v4 configurationHandler:v8];
    [(PKPaymentSetupListSectionController *)v5 setCellRegistration:v6];
  }
  return v2;
}

void __50__PKPaymentSetupPrivacyLinkSectionController_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  id v3 = a2;
  id v4 = [v2 view];
  [v3 setPrivacyView:v4];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v5 = objc_alloc_init(PKPaymentSetupListItem);
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 appendItems:v6];

  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  v6 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v7;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (void)setPrivacyLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end