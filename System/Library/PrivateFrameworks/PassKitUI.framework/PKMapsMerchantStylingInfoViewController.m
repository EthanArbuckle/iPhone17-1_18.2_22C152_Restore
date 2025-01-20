@interface PKMapsMerchantStylingInfoViewController
- (PKMapsMerchantStylingInfoViewController)initWithStylingInfo:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKMapsMerchantStylingInfoViewController

- (PKMapsMerchantStylingInfoViewController)initWithStylingInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMapsMerchantStylingInfoViewController;
  v6 = [(PKMapsMerchantStylingInfoViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stylingInfo, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PKMapsMerchantStylingInfoViewController;
  [(PKMapsMerchantStylingInfoViewController *)&v9 viewDidLoad];
  double v3 = PKUIScreenScale();
  v4 = -[MKWalletMerchantStylingInfo tintColorForScale:](self->_stylingInfo, "tintColorForScale:");
  id v5 = [(MKWalletMerchantStylingInfo *)self->_stylingInfo imageForSize:4 scale:v3];
  v6 = [(PKMapsMerchantStylingInfoViewController *)self view];
  v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
  iconImageView = self->_iconImageView;
  self->_iconImageView = v7;

  [v6 addSubview:self->_iconImageView];
  [v6 setBackgroundColor:v4];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKMapsMerchantStylingInfoViewController;
  [(PKMapsMerchantStylingInfoViewController *)&v5 viewDidLayoutSubviews];
  iconImageView = self->_iconImageView;
  v4 = [(PKMapsMerchantStylingInfoViewController *)self view];
  [v4 bounds];
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](iconImageView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);

  objc_storeStrong((id *)&self->_stylingInfo, 0);
}

@end