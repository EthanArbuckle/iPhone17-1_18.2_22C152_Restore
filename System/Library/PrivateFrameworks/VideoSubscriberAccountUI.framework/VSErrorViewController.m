@interface VSErrorViewController
- (BOOL)isRecoveryDestructive;
- (NSError)error;
- (UIButton)recoveryButton;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (VSErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSFontCenter)fontCenter;
- (void)_recoveryButtonPressed:(id)a3;
- (void)_updateText;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setFontCenter:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setRecoveryButton:(id)a3;
- (void)setRecoveryDestructive:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation VSErrorViewController

- (VSErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  VSRequireMainThread();
  v14.receiver = self;
  v14.super_class = (Class)VSErrorViewController;
  v8 = [(VSErrorViewController *)&v14 initWithNibName:v7 bundle:v6];

  if (v8)
  {
    v9 = [[VSFontCenter alloc] initWithTraitEnvironment:v8];
    fontCenter = v8->_fontCenter;
    v8->_fontCenter = v9;

    v15[0] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    id v12 = (id)[(VSErrorViewController *)v8 registerForTraitChanges:v11 withHandler:&__block_literal_global];
  }
  return v8;
}

void __48__VSErrorViewController_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 fontCenter];
  v3 = [v2 traitCollection];

  [v4 setTraitCollection:v3];
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSErrorViewController;
  [(VSErrorViewController *)&v3 dealloc];
}

- (void)_updateText
{
  if ([(VSErrorViewController *)self isViewLoaded])
  {
    id v10 = [(VSErrorViewController *)self error];
    objc_super v3 = [v10 localizedDescription];
    id v4 = [(VSErrorViewController *)self titleLabel];
    [v4 setText:v3];

    v5 = [v10 localizedRecoverySuggestion];
    id v6 = [(VSErrorViewController *)self messageLabel];
    [v6 setText:v5];

    id v7 = [v10 localizedRecoveryOptions];
    v8 = [v7 firstObject];

    v9 = [(VSErrorViewController *)self recoveryButton];
    [v9 setTitle:v8 forState:0];
  }
}

- (void)_recoveryButtonPressed:(id)a3
{
  id v4 = [(VSErrorViewController *)self error];
  objc_super v3 = [v4 recoveryAttempter];
  [v3 attemptRecoveryFromError:v4 optionIndex:0 delegate:0 didRecoverSelector:0 contextInfo:0];
}

- (void)setError:(id)a3
{
  v5 = (NSError *)a3;
  p_error = &self->_error;
  if (self->_error != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_error, a3);
    p_error = (NSError **)[(VSErrorViewController *)self _updateText];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_error, v5);
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)VSErrorViewController;
  [(VSErrorViewController *)&v38 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(VSErrorViewController *)self view];
  id v5 = objc_alloc(MEMORY[0x263F1C940]);
  [v4 bounds];
  id v6 = objc_msgSend(v5, "initWithFrame:");
  [v6 setAutoresizingMask:18];
  id v7 = [MEMORY[0x263F1C550] groupTableViewBackgroundColor];
  [v6 setBackgroundColor:v7];

  [v4 addSubview:v6];
  id v8 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v8 setAxis:1];
  [v8 setAlignment:3];
  [v8 setSpacing:20.0];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:v8];
  v9 = [v8 leftAnchor];
  id v10 = [v4 layoutMarginsGuide];
  v11 = [v10 leftAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  v13 = [v8 rightAnchor];
  objc_super v14 = [v4 layoutMarginsGuide];
  v15 = [v14 rightAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v3 addObject:v16];

  v17 = [v6 leftAnchor];
  v18 = [v4 leftAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v3 addObject:v19];

  v20 = [v6 rightAnchor];
  v21 = [v4 rightAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [v3 addObject:v22];

  v23 = [v8 topAnchor];
  v24 = [v6 layoutMarginsGuide];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 constant:75.0];
  [v3 addObject:v26];

  v27 = [v6 bottomAnchor];
  v28 = [v8 bottomAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v3 addObject:v29];

  v30 = [(VSErrorViewController *)self fontCenter];
  id v31 = objc_alloc_init(MEMORY[0x263F1C768]);
  v32 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v31, "vs_bind:toObject:withKeyPath:options:", @"font", v30, @"title1Font", v32);

  [v31 setNumberOfLines:0];
  [v31 setTextAlignment:1];
  [(VSErrorViewController *)self setTitleLabel:v31];
  [v8 addArrangedSubview:v31];
  id v33 = objc_alloc_init(MEMORY[0x263F1C768]);
  v34 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v33, "vs_bind:toObject:withKeyPath:options:", @"font", v30, @"bodyFont", v34);

  [v33 setNumberOfLines:0];
  [v33 setTextAlignment:1];
  [(VSErrorViewController *)self setMessageLabel:v33];
  [v8 addArrangedSubview:v33];
  v35 = objc_alloc_init(VSMultilineButton);
  if ([(VSErrorViewController *)self isRecoveryDestructive])
  {
    v36 = [MEMORY[0x263F1C550] systemRedColor];
    [(VSMultilineButton *)v35 setTintColor:v36];
  }
  [(VSMultilineButton *)v35 addTarget:self action:sel__recoveryButtonPressed_ forControlEvents:64];
  v37 = [(VSMultilineButton *)v35 titleLabel];
  [v37 setNumberOfLines:0];

  [(VSErrorViewController *)self setRecoveryButton:v35];
  [v8 addArrangedSubview:v35];
  [MEMORY[0x263F08938] activateConstraints:v3];
  [(VSErrorViewController *)self _updateText];
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isRecoveryDestructive
{
  return self->_recoveryDestructive;
}

- (void)setRecoveryDestructive:(BOOL)a3
{
  self->_recoveryDestructive = a3;
}

- (UIButton)recoveryButton
{
  return self->_recoveryButton;
}

- (void)setRecoveryButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_recoveryButton, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end