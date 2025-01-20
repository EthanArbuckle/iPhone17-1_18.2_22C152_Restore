@interface TSIDSSimTransferringViewController
- (TSIDSSimTransferringViewController)initWithTitle:(id)a3 subtitle:(id)a4;
- (TSSIMSetupFlowDelegate)delegate;
- (UIActivityIndicatorView)indicatorView;
- (UILabel)placeHolderLabel;
- (UIStackView)stackView;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setIndicatorView:(id)a3;
- (void)setPlaceHolderLabel:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation TSIDSSimTransferringViewController

- (TSIDSSimTransferringViewController)initWithTitle:(id)a3 subtitle:(id)a4
{
  v46[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)TSIDSSimTransferringViewController;
  v8 = [(TSIDSSimTransferringViewController *)&v44 init];
  v9 = v8;
  if (v8)
  {
    [(TSIDSSimTransferringViewController *)v8 setTitle:v6];
    [(TSIDSSimTransferringViewController *)v9 setSubtitle:v7];
    id v10 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v41 = v6;
    placeHolderLabel = v9->_placeHolderLabel;
    v9->_placeHolderLabel = (UILabel *)v11;

    [(UILabel *)v9->_placeHolderLabel setText:@" "];
    [(UILabel *)v9->_placeHolderLabel setNumberOfLines:0];
    [(UILabel *)v9->_placeHolderLabel setTextAlignment:1];
    [(UILabel *)v9->_placeHolderLabel setHidden:1];
    [(UILabel *)v9->_placeHolderLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v13 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    indicatorView = v9->_indicatorView;
    v9->_indicatorView = (UIActivityIndicatorView *)v13;

    [(UIActivityIndicatorView *)v9->_indicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    CGAffineTransformMakeScale(&v43, 1.5, 1.5);
    v15 = v9->_indicatorView;
    CGAffineTransform v42 = v43;
    [(UIActivityIndicatorView *)v15 setTransform:&v42];
    [(UIActivityIndicatorView *)v9->_indicatorView startAnimating];
    id v40 = v7;
    id v16 = objc_alloc(MEMORY[0x263F82BF8]);
    v46[0] = v9->_placeHolderLabel;
    v46[1] = v9->_indicatorView;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
    uint64_t v18 = [v16 initWithArrangedSubviews:v17];
    stackView = v9->_stackView;
    v9->_stackView = (UIStackView *)v18;

    [(UIStackView *)v9->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v9->_stackView setAxis:1];
    [(UIStackView *)v9->_stackView setSpacing:16.0];
    [(UIStackView *)v9->_stackView setAlignment:3];
    v20 = [(TSIDSSimTransferringViewController *)v9 contentView];
    [v20 addSubview:v9->_stackView];

    [(TSIDSSimTransferringViewController *)v9 setDismissalType:0];
    v33 = (void *)MEMORY[0x263F08938];
    v38 = [(UIStackView *)v9->_stackView topAnchor];
    v39 = [(TSIDSSimTransferringViewController *)v9 contentView];
    v37 = [v39 mainContentGuide];
    v36 = [v37 topAnchor];
    v35 = [v38 constraintGreaterThanOrEqualToAnchor:v36];
    v45[0] = v35;
    v32 = [(UIStackView *)v9->_stackView centerXAnchor];
    v34 = [(TSIDSSimTransferringViewController *)v9 contentView];
    v21 = [v34 mainContentGuide];
    v22 = [v21 centerXAnchor];
    v23 = [v32 constraintEqualToAnchor:v22];
    v45[1] = v23;
    v24 = [(UIStackView *)v9->_stackView centerYAnchor];
    v25 = [(TSIDSSimTransferringViewController *)v9 contentView];
    v26 = [v25 mainContentGuide];
    v27 = [v26 centerYAnchor];
    v28 = [v24 constraintEqualToAnchor:v27];
    v45[2] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
    [v33 activateConstraints:v29];

    id v7 = v40;
    id v6 = v41;

    v30 = v9;
  }

  return v9;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_indicatorView stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)TSIDSSimTransferringViewController;
  [(TSIDSSimTransferringViewController *)&v3 dealloc];
}

- (UILabel)placeHolderLabel
{
  return self->_placeHolderLabel;
}

- (void)setPlaceHolderLabel:(id)a3
{
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIActivityIndicatorView)indicatorView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setIndicatorView:(id)a3
{
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeHolderLabel, 0);
}

@end