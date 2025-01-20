@interface PKPaymentAuthorizationCouponCodeEntryViewController
- (BOOL)isPaymentStyle;
- (BOOL)isViewTranslucent;
- (BOOL)shouldUpdatePreferredContentSize;
- (BOOL)textFieldShouldReturn:(id)a3;
- (PKPaymentAuthorizationCouponCodeEntryViewController)initWithStyle:(int64_t)a3;
- (PKPaymentAuthorizationCouponCodeEntryViewControllerDelegate)delegate;
- (id)canonicalizedText;
- (int64_t)style;
- (void)clearAccessoryView;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)reloadDataItem;
- (void)setAccessoryViewToActivityIndicator;
- (void)setAccessoryViewToCheckmark;
- (void)setAccessoryViewToError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateAccessoryView;
- (void)updatePreferredContentSize;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentAuthorizationCouponCodeEntryViewController

- (PKPaymentAuthorizationCouponCodeEntryViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  result = [(PKPaymentAuthorizationCouponCodeEntryViewController *)&v5 init];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (BOOL)isPaymentStyle
{
  return (self->_style & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)isViewTranslucent
{
  return (self->_style < 5uLL) & (0x19u >> self->_style);
}

- (void)reloadDataItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [WeakRetained dataItemForPaymentAuthorizationCouponCodeEntryViewController:self];

  objc_super v5 = [v4 couponCode];
  couponCode = self->_couponCode;
  self->_couponCode = v5;

  BOOL awaitingCouponCodeUpdate = self->_awaitingCouponCodeUpdate;
  self->_BOOL awaitingCouponCodeUpdate = [v4 isAwaitingCouponCodeUpdate];
  v8 = [v4 errors];
  v9 = [v8 firstObject];
  firstError = self->_firstError;
  self->_firstError = v9;

  BOOL v11 = !self->_awaitingCouponCodeUpdate && !self->_finishing;
  [(UITextField *)self->_textField setEnabled:v11];
  if (self->_active && self->_firstError) {
    [(UITextField *)self->_textField becomeFirstResponder];
  }
  if (awaitingCouponCodeUpdate && !self->_awaitingCouponCodeUpdate && !self->_firstError)
  {
    self->_finishing = 1;
    dispatch_time_t v12 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationCouponCodeEntryViewController_reloadDataItem__block_invoke;
    block[3] = &unk_1E59CA7D0;
    block[4] = self;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);
  }
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)self updateAccessoryView];
}

uint64_t __69__PKPaymentAuthorizationCouponCodeEntryViewController_reloadDataItem__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1033) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1048));
  [WeakRetained paymentAuthorizationCouponCodeEntryViewControllerDidFinish:*(void *)(a1 + 32)];

  v3 = *(void **)(a1 + 32);

  return [v3 reloadDataItem];
}

- (id)canonicalizedText
{
  v2 = [(UITextField *)self->_textField text];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EF1B5B50;
  }
  v4 = v2;

  return v4;
}

- (void)setAccessoryViewToActivityIndicator
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    LODWORD(v4) = 1148846080;
    [(UIView *)v3 setContentHuggingPriority:0 forAxis:v4];
    LODWORD(v5) = 1148846080;
    [(UIView *)v3 setContentCompressionResistancePriority:0 forAxis:v5];
    [(UIView *)v3 startAnimating];
    [(UIView *)self->_accessoryView removeFromSuperview];
    [(UIStackView *)self->_stackView addArrangedSubview:v3];
    accessoryView = self->_accessoryView;
    self->_accessoryView = v3;
  }
}

- (void)setAccessoryViewToError:(id)a3
{
  p_accessoryView = &self->_accessoryView;
  v10 = self->_accessoryView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1930]);

    LODWORD(v6) = 1148846080;
    [(UIView *)v5 setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UIView *)v5 setContentCompressionResistancePriority:0 forAxis:v7];
    [(UIView *)*p_accessoryView removeFromSuperview];
    [(UIStackView *)self->_stackView addArrangedSubview:v5];
    objc_storeStrong((id *)p_accessoryView, v5);
    v10 = v5;
  }
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
  [(UIView *)v10 setTextColor:v8];

  v9 = [(NSError *)self->_firstError localizedDescription];
  [(UIView *)v10 setText:v9];
}

- (void)setAccessoryViewToCheckmark
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v4 = [MEMORY[0x1E4FB1818] checkmarkImage];
    double v5 = (UIView *)[v3 initWithImage:v4];

    [(UIView *)v5 setContentMode:1];
    LODWORD(v6) = 1148846080;
    [(UIView *)v5 setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UIView *)v5 setContentCompressionResistancePriority:0 forAxis:v7];
    [(UIView *)self->_accessoryView removeFromSuperview];
    [(UIStackView *)self->_stackView addArrangedSubview:v5];
    accessoryView = self->_accessoryView;
    self->_accessoryView = v5;
  }
}

- (void)clearAccessoryView
{
  [(UIView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;
}

- (void)updateAccessoryView
{
  if (self->_awaitingCouponCodeUpdate)
  {
    [(PKPaymentAuthorizationCouponCodeEntryViewController *)self setAccessoryViewToActivityIndicator];
    return;
  }
  if ([(NSString *)self->_couponCode length])
  {
    couponCode = self->_couponCode;
    double v4 = [(PKPaymentAuthorizationCouponCodeEntryViewController *)self canonicalizedText];
    double v5 = couponCode;
    double v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_15;
    }
    double v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
    }
    else
    {
      BOOL v9 = [(NSString *)v5 isEqualToString:v6];

      if (v9)
      {
LABEL_15:
        if (self->_firstError)
        {
          -[PKPaymentAuthorizationCouponCodeEntryViewController setAccessoryViewToError:](self, "setAccessoryViewToError:");
        }
        else
        {
          [(PKPaymentAuthorizationCouponCodeEntryViewController *)self setAccessoryViewToCheckmark];
        }
        return;
      }
    }
  }

  [(PKPaymentAuthorizationCouponCodeEntryViewController *)self clearAccessoryView];
}

- (void)viewDidLoad
{
  v75[4] = *MEMORY[0x1E4F143B8];
  v72.receiver = self;
  v72.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)&v72 viewDidLoad];
  id v3 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo.isa);
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)self setTitle:v3];

  if ([(PKPaymentAuthorizationCouponCodeEntryViewController *)self isPaymentStyle]) {
    [(PKPaymentAuthorizationCouponCodeEntryViewController *)self setEdgesForExtendedLayout:0];
  }
  double v4 = [(PKPaymentAuthorizationCouponCodeEntryViewController *)self view];
  double v5 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setKeyboardDismissMode:0];
  if ([(PKPaymentAuthorizationCouponCodeEntryViewController *)self isViewTranslucent])
  {
    double v7 = self->_scrollView;
    BOOL v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIScrollView *)v7 setBackgroundColor:v8];
  }
  [v4 addSubview:self->_scrollView];
  v56 = (void *)MEMORY[0x1E4F28DC8];
  v70 = [(UIScrollView *)self->_scrollView topAnchor];
  v67 = [v4 topAnchor];
  v65 = [v70 constraintEqualToAnchor:v67];
  v75[0] = v65;
  v62 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v59 = [v4 leadingAnchor];
  BOOL v9 = [v62 constraintEqualToAnchor:v59];
  v75[1] = v9;
  v10 = [v4 bottomAnchor];
  BOOL v11 = [(UIScrollView *)self->_scrollView bottomAnchor];
  dispatch_time_t v12 = [v10 constraintEqualToAnchor:v11];
  v75[2] = v12;
  v69 = v4;
  v13 = [v4 trailingAnchor];
  v14 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v75[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
  [v56 activateConstraints:v16];

  id v17 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  objc_msgSend(v17, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([(PKPaymentAuthorizationCouponCodeEntryViewController *)self isViewTranslucent])
  {
    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [v17 setBackgroundColor:v18];
  }
  [(UIScrollView *)self->_scrollView addSubview:v17];
  v19 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v20 = [(UIScrollView *)self->_scrollView frameLayoutGuide];
  v48 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [v17 topAnchor];
  v60 = [v19 topAnchor];
  v57 = [v63 constraintEqualToAnchor:v60];
  v74[0] = v57;
  v54 = [v17 leadingAnchor];
  v52 = [v19 leadingAnchor];
  v50 = [v54 constraintEqualToAnchor:v52];
  v74[1] = v50;
  v47 = [v19 bottomAnchor];
  v21 = [v17 bottomAnchor];
  v22 = [v47 constraintEqualToAnchor:v21];
  v74[2] = v22;
  v68 = v19;
  v23 = [v19 trailingAnchor];
  v24 = [v17 trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v74[3] = v25;
  v71 = v17;
  v26 = [v17 widthAnchor];
  v66 = v20;
  v27 = [v20 widthAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v74[4] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:5];
  [v48 activateConstraints:v29];

  v30 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  stackView = self->_stackView;
  self->_stackView = v30;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setSpacing:1.17549435e-38];
  if ([(PKPaymentAuthorizationCouponCodeEntryViewController *)self isViewTranslucent])
  {
    v32 = self->_stackView;
    v33 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIStackView *)v32 setBackgroundColor:v33];
  }
  [v71 addSubview:self->_stackView];
  v34 = [v71 readableContentGuide];
  v49 = (void *)MEMORY[0x1E4F28DC8];
  v61 = [(UIStackView *)self->_stackView topAnchor];
  v58 = [v34 topAnchor];
  v55 = [v61 constraintEqualToAnchor:v58];
  v73[0] = v55;
  v53 = [(UIStackView *)self->_stackView leadingAnchor];
  v51 = [v34 leadingAnchor];
  v35 = [v53 constraintEqualToAnchor:v51];
  v73[1] = v35;
  v64 = v34;
  v36 = [v34 bottomAnchor];
  v37 = [(UIStackView *)self->_stackView bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v73[2] = v38;
  v39 = [v34 trailingAnchor];
  v40 = [(UIStackView *)self->_stackView trailingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v73[3] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
  [v49 activateConstraints:v42];

  v43 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
  textField = self->_textField;
  self->_textField = v43;

  v45 = self->_textField;
  v46 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_0.isa);
  [(UITextField *)v45 setPlaceholder:v46];

  [(UITextField *)self->_textField setDelegate:self];
  [(UITextField *)self->_textField addTarget:self action:sel_textFieldDidEditingChanged_ forControlEvents:0x20000];
  [(UITextField *)self->_textField setAutocapitalizationType:0];
  [(UITextField *)self->_textField setAutocorrectionType:1];
  [(UITextField *)self->_textField setReturnKeyType:9];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_textField];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)&v6 viewWillAppear:a3];
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  [(PKPaymentAuthorizationCouponCodeEntryViewController *)self reloadDataItem];
  [(UITextField *)self->_textField setText:self->_couponCode];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)&v4 viewDidAppear:a3];
  self->_active = 1;
  [(UITextField *)self->_textField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)&v5 viewWillDisappear:a3];
  self->_active = 0;
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)&v3 viewDidLayoutSubviews];
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)self updatePreferredContentSize];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  [a3 resignFirstResponder];
  objc_super v4 = [(PKPaymentAuthorizationCouponCodeEntryViewController *)self canonicalizedText];
  objc_super v5 = self->_couponCode;
  objc_super v6 = v4;
  double v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (!v6 || !v5)
    {

LABEL_9:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained paymentAuthorizationCouponCodeEntryViewController:self didChangeCouponCode:v7];
      goto LABEL_10;
    }
    BOOL v8 = [(NSString *)v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_9;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained paymentAuthorizationCouponCodeEntryViewControllerDidFinish:self];
LABEL_10:

  return 1;
}

- (BOOL)shouldUpdatePreferredContentSize
{
  if (![(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])return 1; {

  }
  return [(PKPaymentAuthorizationCouponCodeEntryViewController *)self isPaymentStyle];
}

- (void)updatePreferredContentSize
{
  if ([(PKPaymentAuthorizationCouponCodeEntryViewController *)self shouldUpdatePreferredContentSize])
  {
    [(UIScrollView *)self->_scrollView contentSize];
    double v4 = v3;
    double v6 = v5;
    [(UIScrollView *)self->_scrollView contentInset];
    -[PKPaymentAuthorizationCouponCodeEntryViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6 + v7);
  }
}

- (void)keyboardDidShow:(id)a3
{
  id v26 = [a3 userInfo];
  double v4 = [v26 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(PKPaymentAuthorizationCouponCodeEntryViewController *)self view];
  v14 = [v13 window];
  v15 = [(PKPaymentAuthorizationCouponCodeEntryViewController *)self view];
  objc_msgSend(v14, "convertRect:toView:", v15, v6, v8, v10, v12);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v24 = [(PKPaymentAuthorizationCouponCodeEntryViewController *)self view];
  [v24 bounds];
  v30.origin.x = v17;
  v30.origin.y = v19;
  v30.size.width = v21;
  v30.size.double height = v23;
  CGRect v29 = CGRectIntersection(v28, v30);
  double height = v29.size.height;

  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, height, 0.0);
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", 0.0, 0.0, height, 0.0);
  [(PKPaymentAuthorizationCouponCodeEntryViewController *)self updatePreferredContentSize];
}

- (void)keyboardWillHide:(id)a3
{
  double v4 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", a3, *MEMORY[0x1E4FB2848], v5, v6, v7);
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v4, v5, v6, v7);

  [(PKPaymentAuthorizationCouponCodeEntryViewController *)self updatePreferredContentSize];
}

- (int64_t)style
{
  return self->_style;
}

- (PKPaymentAuthorizationCouponCodeEntryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationCouponCodeEntryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_firstError, 0);

  objc_storeStrong((id *)&self->_couponCode, 0);
}

@end