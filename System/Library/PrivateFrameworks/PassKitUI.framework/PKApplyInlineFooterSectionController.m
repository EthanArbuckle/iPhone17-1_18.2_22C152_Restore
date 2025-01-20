@interface PKApplyInlineFooterSectionController
- (PKApplyInlineFooterSectionController)initWithController:(id)a3 applyPage:(id)a4 content:(id)a5 delegate:(id)a6;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureContentSection:(id)a3;
- (void)didTapFooterLink:(id)a3;
@end

@implementation PKApplyInlineFooterSectionController

- (PKApplyInlineFooterSectionController)initWithController:(id)a3 applyPage:(id)a4 content:(id)a5 delegate:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKApplyInlineFooterSectionController;
  v13 = [(PKApplyCollectionViewSectionController *)&v18 initWithController:a3 applyPage:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    objc_storeStrong((id *)&v14->_content, a5);
    uint64_t v15 = [v11 footerText];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;
  }
  return v14;
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_identifier;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  identifier = self->_identifier;
  v8 = (NSString *)v5;
  v9 = identifier;
  if (v9 == v8)
  {

    goto LABEL_7;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_9;
  }
  BOOL v11 = [(NSString *)v8 isEqualToString:v9];

  if (v11) {
LABEL_7:
  }
    [(PKApplyInlineFooterSectionController *)self _configureContentSection:v6];
LABEL_9:

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  identifier = self->_identifier;
  v9 = (NSString *)v7;
  v10 = identifier;
  BOOL v11 = v10;
  if (v10 == v9)
  {
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
    if (v9 && v10) {
      int v12 = [(NSString *)v9 isEqualToString:v10];
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)PKApplyInlineFooterSectionController;
  v13 = [(PKApplyCollectionViewSectionController *)&v16 layoutWithLayoutEnvironment:v6 sectionIdentifier:v9];
  [v13 contentInsets];
  if (v12) {
    double v14 = 16.0;
  }
  [v13 setContentInsets:v14];

  return v13;
}

- (void)didTapFooterLink:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained didTapFooterLink:v5];
  }
}

- (void)_configureContentSection:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[PKApplySavingsInlineTermsRow alloc] initWithContent:self->_content delegate:self];
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 appendItems:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end