@interface PKPassPersonalizationTermsViewController
- (NSString)termsAndConditions;
- (PKPassPersonalizationTermsViewController)initWithTermsAndConditions:(id)a3;
- (PKPassPersonalizationTermsViewControllerDelegate)delegate;
- (void)_acceptButtonPressed:(id)a3;
- (void)_applyTermsAndConditions;
- (void)_declineButtonPressed:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setTermsAndConditions:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassPersonalizationTermsViewController

- (PKPassPersonalizationTermsViewController)initWithTermsAndConditions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassPersonalizationTermsViewController;
  v5 = [(PKPassPersonalizationTermsViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    termsAndConditions = v5->_termsAndConditions;
    v5->_termsAndConditions = (NSString *)v6;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPassPersonalizationTermsViewController;
  [(PKPassPersonalizationTermsViewController *)&v2 dealloc];
}

- (void)loadView
{
  v3 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  textView = self->_textView;
  self->_textView = v3;

  v5 = self->_textView;

  [(PKPassPersonalizationTermsViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKPassPersonalizationTermsViewController;
  [(PKPassPersonalizationTermsViewController *)&v12 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v4 = PKLocalizedString(&cfstr_Personalizatio_11.isa);
  v5 = (void *)[v3 initWithTitle:v4 style:0 target:self action:sel__declineButtonPressed_];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v8 = PKLocalizedString(&cfstr_Personalizatio_12.isa);
  objc_super v9 = (void *)[v7 initWithTitle:v8 style:2 target:self action:sel__acceptButtonPressed_];

  v10 = PKLocalizedString(&cfstr_Personalizatio_13.isa);
  [(PKPassPersonalizationTermsViewController *)self setTitle:v10];

  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [(PKPassPersonalizationTermsViewController *)self setToolbarItems:v11];

  [(UITextView *)self->_textView setEditable:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassPersonalizationTermsViewController;
  [(PKPassPersonalizationTermsViewController *)&v5 viewWillAppear:a3];
  [(PKPassPersonalizationTermsViewController *)self _applyTermsAndConditions];
  id v4 = [(PKPassPersonalizationTermsViewController *)self navigationController];
  [v4 setToolbarHidden:0 animated:0];
}

- (void)_applyTermsAndConditions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  objc_super v5 = PKAttributedStringByParsingLinksInString();
  [(UITextView *)self->_textView setAttributedText:v5];
}

- (void)_declineButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passPersonalizationTermsViewControllerDidDeclineTerms:self];
}

- (void)_acceptButtonPressed:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1418];
  objc_super v5 = PKLocalizedString(&cfstr_Personalizatio_14.isa);
  uint64_t v6 = PKLocalizedString(&cfstr_Personalizatio_15.isa);
  id v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  v8 = (void *)MEMORY[0x1E4FB1410];
  objc_super v9 = PKLocalizedString(&cfstr_Personalizatio_16.isa);
  v10 = [v8 actionWithTitle:v9 style:1 handler:0];
  [v7 addAction:v10];

  v11 = (void *)MEMORY[0x1E4FB1410];
  objc_super v12 = PKLocalizedString(&cfstr_Personalizatio_17.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PKPassPersonalizationTermsViewController__acceptButtonPressed___block_invoke;
  v14[3] = &unk_1E59CB1F0;
  v14[4] = self;
  v13 = [v11 actionWithTitle:v12 style:0 handler:v14];
  [v7 addAction:v13];

  [(PKPassPersonalizationTermsViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __65__PKPassPersonalizationTermsViewController__acceptButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 992));
  [WeakRetained passPersonalizationTermsViewControllerDidAcceptTerms:*(void *)(a1 + 32)];
}

- (NSString)termsAndConditions
{
  return self->_termsAndConditions;
}

- (void)setTermsAndConditions:(id)a3
{
}

- (PKPassPersonalizationTermsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassPersonalizationTermsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end