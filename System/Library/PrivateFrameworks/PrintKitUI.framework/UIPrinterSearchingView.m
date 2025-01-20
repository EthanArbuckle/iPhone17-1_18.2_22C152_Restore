@interface UIPrinterSearchingView
- (UIPrintMessageAndSpinnerView)messageAndSpinner;
- (UIPrinterSearchingView)initWithFrame:(CGRect)a3;
- (void)searchTimeout;
- (void)setMessageAndSpinner:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)updateConstraints;
- (void)updateFont;
@end

@implementation UIPrinterSearchingView

- (UIPrinterSearchingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIPrinterSearchingView;
  v3 = -[UIPrinterSearchingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIPrinterSearchingView *)v3 setHidden:1];
    v5 = [UIPrintMessageAndSpinnerView alloc];
    [(UIPrinterSearchingView *)v4 bounds];
    v6 = -[UIPrintMessageAndSpinnerView initWithFrame:](v5, "initWithFrame:");
    [(UIPrintMessageAndSpinnerView *)v6 setSpinnerHidden:0];
    [(UIPrintMessageAndSpinnerView *)v6 setSpinSpinner:1];
    objc_storeWeak((id *)&v4->_messageAndSpinner, v6);
    [(UIPrinterSearchingView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPrinterSearchingView *)v4 addSubview:v6];
    [(UIPrinterSearchingView *)v4 setNeedsUpdateConstraints];
  }
  return v4;
}

- (void)updateConstraints
{
  if (!self->_constraintsSet)
  {
    v3 = [(UIPrinterSearchingView *)self messageAndSpinner];
    v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:-50.0];
    v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:7 relatedBy:1 toItem:v3 attribute:7 multiplier:1.0 constant:0.0];
    v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:8 relatedBy:1 toItem:v3 attribute:8 multiplier:1.0 constant:0.0];
    [(UIPrinterSearchingView *)self addConstraint:v4];
    [(UIPrinterSearchingView *)self addConstraint:v5];
    [(UIPrinterSearchingView *)self addConstraint:v6];
    [(UIPrinterSearchingView *)self addConstraint:v7];
    self->_constraintsSet = 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)UIPrinterSearchingView;
  [(UIPrinterSearchingView *)&v8 updateConstraints];
}

- (void)searchTimeout
{
  v2 = [(UIPrinterSearchingView *)self messageAndSpinner];
  if (pthread_main_np() == 1)
  {
    [v2 setSpinnerHidden:1];
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"No AirPrint Printers Found" value:@"No AirPrint Printers Found" table:@"Localizable"];
    [v2 setMessageText:v4];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__UIPrinterSearchingView_searchTimeout__block_invoke;
    block[3] = &unk_1E6DA1408;
    id v6 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __39__UIPrinterSearchingView_searchTimeout__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSpinnerHidden:1];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v3 localizedStringForKey:@"No AirPrint Printers Found" value:@"No AirPrint Printers Found" table:@"Localizable"];
  [*(id *)(a1 + 32) setMessageText:v2];
}

- (void)setSearching:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIPrinterSearchingView *)self isHidden] == a3)
  {
    if (v3)
    {
      [(UIPrinterSearchingView *)self setHidden:0];
      id v7 = [(UIPrinterSearchingView *)self messageAndSpinner];
      v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = [v5 localizedStringForKey:@"Looking for Printers…" value:@"Looking for Printers…" table:@"Localizable"];
      [v7 setMessageText:v6];

      [v7 setSpinnerHidden:0];
      [(UIPrinterSearchingView *)self performSelector:sel_searchTimeout withObject:0 afterDelay:5.0];
    }
    else
    {
      [(UIPrinterSearchingView *)self setHidden:1];
    }
  }
}

- (void)updateFont
{
  id v2 = [(UIPrinterSearchingView *)self messageAndSpinner];
  [v2 updateFont];
}

- (UIPrintMessageAndSpinnerView)messageAndSpinner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageAndSpinner);
  return (UIPrintMessageAndSpinnerView *)WeakRetained;
}

- (void)setMessageAndSpinner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end