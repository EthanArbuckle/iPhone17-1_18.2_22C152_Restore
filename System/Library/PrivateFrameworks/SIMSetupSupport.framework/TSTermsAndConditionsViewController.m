@interface TSTermsAndConditionsViewController
- (CoreTelephonyClient)client;
- (NSString)mainText;
- (NSString)sourceIccid;
- (SSSpinner)spinner;
- (TSSIMSetupFlowDelegate)delegate;
- (TSTermsAndConditionsViewController)initWithSourceIccid:(id)a3 mainText:(id)a4;
- (UIButton)acceptButton;
- (UIButton)declineButton;
- (UILabel)titleLabel;
- (UITextView)textView;
- (void)_acceptClicked:(id)a3;
- (void)_cancelTransfer:(id)a3;
- (void)loadView;
- (void)setAcceptButton:(id)a3;
- (void)setClient:(id)a3;
- (void)setDeclineButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMainText:(id)a3;
- (void)setSourceIccid:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSTermsAndConditionsViewController

- (TSTermsAndConditionsViewController)initWithSourceIccid:(id)a3 mainText:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TSTermsAndConditionsViewController;
  v9 = [(TSTermsAndConditionsViewController *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainText, a4);
    objc_storeStrong((id *)&v10->_sourceIccid, a3);
    id v11 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v12 = [v11 initWithQueue:MEMORY[0x263EF83A0]];
    client = v10->_client;
    v10->_client = (CoreTelephonyClient *)v12;
  }
  return v10;
}

- (void)loadView
{
  v3 = (UITextView *)objc_alloc_init(MEMORY[0x263F82D60]);
  textView = self->_textView;
  self->_textView = v3;

  v5 = self->_textView;
  [(TSTermsAndConditionsViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v25[3] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)TSTermsAndConditionsViewController;
  [(SSUIViewController *)&v22 viewDidLoad];
  [(TSTermsAndConditionsViewController *)self setModalInPresentation:1];
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DISAGREE" value:&stru_26DBE8E78 table:@"Localizable"];
  v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__cancelTransfer_];

  id v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v8 = objc_alloc(MEMORY[0x263F824A8]);
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"AGREE" value:&stru_26DBE8E78 table:@"Localizable"];
  id v11 = (void *)[v8 initWithTitle:v10 style:2 target:self action:sel__acceptClicked_];

  uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"TERMS_AND_CONDITIONS_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  [(TSTermsAndConditionsViewController *)self setTitle:v13];

  v25[0] = v6;
  v25[1] = v7;
  v25[2] = v11;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  [(TSTermsAndConditionsViewController *)self setToolbarItems:v14];

  objc_super v15 = [(TSTermsAndConditionsViewController *)self navigationController];
  [v15 setToolbarHidden:0 animated:0];

  [(UITextView *)self->_textView setEditable:0];
  uint64_t v23 = *MEMORY[0x263F81500];
  v16 = [MEMORY[0x263F825C8] labelColor];
  v24 = v16;
  v17 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  textView = self->_textView;
  v19 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:self->_mainText attributes:v17];
  [(UITextView *)textView setAttributedText:v19];

  v20 = self->_textView;
  v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UITextView *)v20 setFont:v21];
}

- (void)_acceptClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startTimer:1];

  [(CoreTelephonyClient *)self->_client handleTermsAndConditionsCompleted:self->_sourceIccid consented:1 completion:&__block_literal_global];
  [(TSTermsAndConditionsViewController *)self dismissViewControllerAnimated:1 completion:0];
}

void __53__TSTermsAndConditionsViewController__acceptClicked___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__TSTermsAndConditionsViewController__acceptClicked___block_invoke_cold_1();
    }
  }
}

- (void)_cancelTransfer:(id)a3
{
  [(TSTermsAndConditionsViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(CoreTelephonyClient *)self->_client handleTermsAndConditionsCompleted:self->_sourceIccid consented:0 completion:&__block_literal_global_47];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"user.disagreed.terms.and.conditions" object:0 userInfo:0];
}

void __54__TSTermsAndConditionsViewController__cancelTransfer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__TSTermsAndConditionsViewController__cancelTransfer___block_invoke_cold_1();
    }
  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 984, 1);
}

- (void)setClient:(id)a3
{
}

- (NSString)sourceIccid
{
  return (NSString *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSourceIccid:(id)a3
{
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (NSString)mainText
{
  return (NSString *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setMainText:(id)a3
{
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTextView:(id)a3
{
}

- (UIButton)acceptButton
{
  return (UIButton *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setAcceptButton:(id)a3
{
}

- (UIButton)declineButton
{
  return (UIButton *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setDeclineButton:(id)a3
{
}

- (SSSpinner)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_mainText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TSTermsAndConditionsViewController__acceptClicked___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  id v2 = "-[TSTermsAndConditionsViewController _acceptClicked:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]handleTermsAndConditionsCompleted failed : %@ @%s", v1, 0x16u);
}

void __54__TSTermsAndConditionsViewController__cancelTransfer___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  id v2 = "-[TSTermsAndConditionsViewController _cancelTransfer:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]handleTermsAndConditionsCompleted failed : %@ @%s", v1, 0x16u);
}

@end