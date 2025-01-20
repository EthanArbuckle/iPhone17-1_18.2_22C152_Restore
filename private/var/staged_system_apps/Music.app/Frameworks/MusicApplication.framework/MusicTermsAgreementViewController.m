@interface MusicTermsAgreementViewController
- (BOOL)isAccepting;
- (BOOL)isLoading;
- (MusicTermsAgreementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MusicTermsAgreementViewControllerDelegate)delegate;
- (NSString)termsText;
- (id)contentScrollView;
- (void)_agreeBarButtonItemAction:(id)a3;
- (void)_cancelBarButtonItemAction:(id)a3;
- (void)_sendEmailBarButtonItemAction:(id)a3;
- (void)_updateBarButtonItems;
- (void)_updateViewState;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAccepting:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setTermsText:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MusicTermsAgreementViewController

- (MusicTermsAgreementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MusicTermsAgreementViewController;
  v4 = [(MusicTermsAgreementViewController *)&v10 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(MusicTermsAgreementViewController *)v4 navigationItem];
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Terms & Conditions" value:&stru_D2EE90 table:0];
    [v6 setTitle:v8];
  }
  return v5;
}

- (void)viewDidLayoutSubviews
{
  v69.receiver = self;
  v69.super_class = (Class)MusicTermsAgreementViewController;
  [(MusicTermsAgreementViewController *)&v69 viewDidLayoutSubviews];
  v3 = [(MusicTermsAgreementViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(MusicTermsAgreementViewController *)self traitCollection];
  [v12 displayScale];
  double v14 = MusicSafeDisplayScale(v13);
  if (self->_loading)
  {
    double v58 = v14;
    v15 = [(MusicTermsAgreementViewController *)self view];
    v16 = [v15 safeAreaLayoutGuide];
    [v16 layoutFrame];
    double rect = v11;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v70.origin.double x = v18;
    v70.origin.CGFloat y = v20;
    v70.size.CGFloat width = v22;
    v70.size.height = v24;
    double MinX = CGRectGetMinX(v70);
    v71.origin.double x = v5;
    double v62 = v7;
    double v63 = v5;
    v71.origin.CGFloat y = v7;
    v71.size.CGFloat width = v9;
    v71.size.height = rect;
    CGFloat v67 = v9;
    double Height = CGRectGetHeight(v71);
    v72.origin.double x = v18;
    v72.origin.CGFloat y = v20;
    v72.size.CGFloat width = v22;
    v72.size.height = v24;
    CGFloat v65 = v7 + MinX;
    CGFloat v66 = v5 + 0.0;
    CGFloat v64 = rect - (MinX + Height - CGRectGetMaxY(v72));
    [(UIActivityIndicatorView *)self->_loadingActivityIndicatorView frame];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat y = CGPointZero.y;
    [(UILabel *)self->_loadingLabel frame];
    v73.origin.double x = CGPointZero.x;
    v73.origin.CGFloat y = y;
    v73.size.CGFloat width = v28;
    v73.size.height = v30;
    CGRectGetMaxX(v73);
    double v53 = y;
    CGFloat v60 = v28;
    CGFloat v61 = v30;
    UIRectCenteredYInRectScale();
    double v54 = v74.origin.y;
    double x = v74.origin.x;
    CGFloat v56 = v74.size.height;
    CGFloat width = v74.size.width;
    v80.origin.double x = CGPointZero.x;
    v80.origin.CGFloat y = y;
    v80.size.CGFloat width = v28;
    v80.size.height = v30;
    CGRect v75 = CGRectUnion(v74, v80);
    CGFloat v32 = v75.origin.y;
    CGFloat v51 = v75.origin.x;
    CGFloat v52 = v75.size.width;
    CGFloat v33 = v75.size.height;
    double v50 = v58;
    CGFloat v34 = v75.origin.x;
    UIRectCenteredIntegralRectScale();
    CGFloat v35 = v76.origin.x;
    CGFloat v36 = v76.origin.y;
    CGFloat v37 = v76.size.width;
    CGFloat v38 = v76.size.height;
    double MinY = CGRectGetMinY(v76);
    v77.origin.double x = v34;
    v77.origin.CGFloat y = v32;
    v77.size.CGFloat width = v52;
    v77.size.height = v33;
    double v40 = MinY - CGRectGetMinY(v77);
    v78.origin.double x = v35;
    v78.origin.CGFloat y = v36;
    v78.size.CGFloat width = v37;
    v78.size.height = v38;
    double v41 = CGRectGetMinX(v78);
    v79.origin.double x = v51;
    v79.origin.CGFloat y = v32;
    v79.size.CGFloat width = v52;
    double v9 = v67;
    v79.size.height = v33;
    double v7 = v62;
    double v5 = v63;
    double v42 = v41 - CGRectGetMinX(v79);
    CGFloat v43 = x + v42;
    CGFloat v59 = CGPointZero.x + v42;
    loadingLabel = self->_loadingLabel;
    v45 = [(MusicTermsAgreementViewController *)self view];
    id v46 = [v45 effectiveUserInterfaceLayoutDirection];
    CGFloat v47 = v43;
    double v11 = rect;
    [(UILabel *)loadingLabel setFrame:MusicRectByApplyingUserInterfaceLayoutDirectionInRect((uint64_t)v46, v47, v54 + v40, width, v56, v66, v65, v67, v64)];

    loadingActivityIndicatorView = self->_loadingActivityIndicatorView;
    v49 = [(MusicTermsAgreementViewController *)self view];
    -[UIActivityIndicatorView setFrame:](loadingActivityIndicatorView, "setFrame:", MusicRectByApplyingUserInterfaceLayoutDirectionInRect((uint64_t)[v49 effectiveUserInterfaceLayoutDirection], v59, v53 + v40, v60, v61, v66, v65, v67, v64));
  }
  -[UITextView setFrame:](self->_termsTextView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)MusicTermsAgreementViewController;
  [(MusicTermsAgreementViewController *)&v11 viewDidLoad];
  v3 = [(MusicTermsAgreementViewController *)self view];
  double v4 = +[UIColor systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  double v5 = (UITextView *)[objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  termsTextView = self->_termsTextView;
  self->_termsTextView = v5;

  double v7 = self->_termsTextView;
  double v8 = +[UIColor clearColor];
  [(UITextView *)v7 setBackgroundColor:v8];

  double v9 = self->_termsTextView;
  double v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UITextView *)v9 setFont:v10];

  [(UITextView *)self->_termsTextView setEditable:0];
  [(UITextView *)self->_termsTextView setSelectable:0];
  [(UITextView *)self->_termsTextView setScrollEnabled:1];
  [(UITextView *)self->_termsTextView setScrollsToTop:1];
  [v3 addSubview:self->_termsTextView];
  [(MusicTermsAgreementViewController *)self _updateViewState];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MusicTermsAgreementViewController;
  [(MusicTermsAgreementViewController *)&v6 viewWillAppear:a3];
  double v4 = [(MusicTermsAgreementViewController *)self navigationController];
  double v5 = [v4 presentationController];
  [v5 setDelegate:self];

  [v4 setToolbarHidden:0];
  [(MusicTermsAgreementViewController *)self _updateBarButtonItems];
}

- (id)contentScrollView
{
  return self->_termsTextView;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)setAccepting:(BOOL)a3
{
  if (self->_accepting != a3)
  {
    self->_accepting = a3;
    [(MusicTermsAgreementViewController *)self _updateBarButtonItems];
  }
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    [(MusicTermsAgreementViewController *)self _updateBarButtonItems];
    [(MusicTermsAgreementViewController *)self _updateViewState];
  }
}

- (void)setTermsText:(id)a3
{
  double v4 = (NSString *)a3;
  termsText = self->_termsText;
  if (termsText != v4)
  {
    double v9 = v4;
    unsigned __int8 v6 = [(NSString *)termsText isEqualToString:v4];
    double v4 = v9;
    if ((v6 & 1) == 0)
    {
      double v7 = (NSString *)[(NSString *)v9 copy];
      double v8 = self->_termsText;
      self->_termsText = v7;

      [(MusicTermsAgreementViewController *)self _updateViewState];
      double v4 = v9;
    }
  }
}

- (void)_agreeBarButtonItemAction:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 termsAgreementViewControllerDidAcceptTerms:self];
  }
}

- (void)_cancelBarButtonItemAction:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 termsAgreementViewControllerDidCancel:self];
  }
}

- (void)_sendEmailBarButtonItemAction:(id)a3
{
  double v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"Send by Email" value:&stru_D2EE90 table:0];
  char v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Enter an email address to send these Terms & Conditions." value:&stru_D2EE90 table:0];
  double v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  [v8 addTextFieldWithConfigurationHandler:&__block_literal_global];
  double v9 = +[NSBundle mainBundle];
  double v10 = [v9 localizedStringForKey:@"Send" value:&stru_D2EE90 table:0];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  CGFloat v18 = __67__MusicTermsAgreementViewController__sendEmailBarButtonItemAction___block_invoke_2;
  double v19 = &unk_CCB350;
  CGFloat v20 = self;
  id v21 = v8;
  id v11 = v8;
  v12 = +[UIAlertAction actionWithTitle:v10 style:0 handler:&v16];

  [v11 addAction:v12, v16, v17, v18, v19, v20];
  double v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:@"Cancel" value:&stru_D2EE90 table:0];
  v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];

  [v11 addAction:v15];
  [(MusicTermsAgreementViewController *)self presentViewController:v11 animated:1 completion:0];
}

void __67__MusicTermsAgreementViewController__sendEmailBarButtonItemAction___block_invoke(id a1, UITextField *a2)
{
  v2 = a2;
  [(UITextField *)v2 setAutocorrectionType:1];
  [(UITextField *)v2 setAutocapitalizationType:0];
  [(UITextField *)v2 setKeyboardType:7];
}

void __67__MusicTermsAgreementViewController__sendEmailBarButtonItemAction___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = [*(id *)(a1 + 40) textFields];
    double v4 = [v3 firstObject];
    double v5 = [v4 text];
    [v6 termsAgreementViewController:v2 didRequestSendByEmailToEmailAddress:v5];
  }
}

- (void)_updateBarButtonItems
{
  sendEmailBarButtonItem = self->_sendEmailBarButtonItem;
  if (!sendEmailBarButtonItem)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    double v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Send by Email" value:&stru_D2EE90 table:0];
    id v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 style:0 target:self action:"_sendEmailBarButtonItemAction:"];
    double v8 = self->_sendEmailBarButtonItem;
    self->_sendEmailBarButtonItem = v7;

    id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    double v10 = self->_sendEmailBarButtonItem;
    v25[0] = v9;
    v25[1] = v10;
    id v11 = +[NSArray arrayWithObjects:v25 count:2];
    [(MusicTermsAgreementViewController *)self setToolbarItems:v11];

    sendEmailBarButtonItem = self->_sendEmailBarButtonItem;
  }
  BOOL v12 = !self->_loading && !self->_accepting;
  [(UIBarButtonItem *)sendEmailBarButtonItem setEnabled:v12];
  double v13 = [(MusicTermsAgreementViewController *)self navigationItem];
  if (self->_accepting)
  {
    p_acceptingBarButtonItem = &self->_acceptingBarButtonItem;
    acceptingBarButtonItem = self->_acceptingBarButtonItem;
    if (acceptingBarButtonItem) {
      goto LABEL_13;
    }
    id v16 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v16 sizeToFit];
    [v16 startAnimating];
    uint64_t v17 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v16];
    CGFloat v18 = *p_acceptingBarButtonItem;
    *p_acceptingBarButtonItem = v17;
    goto LABEL_9;
  }
  if (self->_loading)
  {
    acceptingBarButtonItem = 0;
  }
  else
  {
    p_acceptingBarButtonItem = &self->_agreeBarButtonItem;
    acceptingBarButtonItem = self->_agreeBarButtonItem;
    if (!acceptingBarButtonItem)
    {
      id v22 = objc_alloc((Class)UIBarButtonItem);
      id v16 = +[NSBundle mainBundle];
      CGFloat v18 = [v16 localizedStringForKey:@"Agree" value:&stru_D2EE90 table:0];
      double v23 = (UIBarButtonItem *)[v22 initWithTitle:v18 style:2 target:self action:"_agreeBarButtonItemAction:"];
      CGFloat v24 = *p_acceptingBarButtonItem;
      *p_acceptingBarButtonItem = v23;

LABEL_9:
      acceptingBarButtonItem = *p_acceptingBarButtonItem;
    }
  }
LABEL_13:
  [v13 setRightBarButtonItem:acceptingBarButtonItem];
  cancelBarButtonItem = self->_cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    CGFloat v20 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelBarButtonItemAction:"];
    id v21 = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v20;

    [v13 setLeftBarButtonItem:self->_cancelBarButtonItem];
    cancelBarButtonItem = self->_cancelBarButtonItem;
  }
  [(UIBarButtonItem *)cancelBarButtonItem setEnabled:!self->_accepting];
}

- (void)_updateViewState
{
  if (![(MusicTermsAgreementViewController *)self isViewLoaded]) {
    return;
  }
  id v22 = [(MusicTermsAgreementViewController *)self view];
  termsTextView = self->_termsTextView;
  if (self->_loading)
  {
    [(UITextView *)termsTextView setHidden:1];
    loadingLabel = self->_loadingLabel;
    BOOL v5 = loadingLabel == 0;
    if (!loadingLabel)
    {
      id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      id v7 = self->_loadingLabel;
      self->_loadingLabel = v6;

      double v8 = self->_loadingLabel;
      id v9 = +[UIColor clearColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      double v10 = self->_loadingLabel;
      id v11 = +[NSBundle mainBundle];
      BOOL v12 = [v11 localizedStringForKey:@"Loading…" value:&stru_D2EE90 table:0];
      [(UILabel *)v10 setText:v12];

      double v13 = self->_loadingLabel;
      double v14 = +[UIFont systemFontOfSize:14.0];
      [(UILabel *)v13 setFont:v14];

      [(UILabel *)self->_loadingLabel sizeToFit];
      [v22 addSubview:self->_loadingLabel];
    }
    if (!self->_loadingActivityIndicatorView)
    {
      v15 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      loadingActivityIndicatorView = self->_loadingActivityIndicatorView;
      self->_loadingActivityIndicatorView = v15;

      [(UIActivityIndicatorView *)self->_loadingActivityIndicatorView startAnimating];
      [(UIActivityIndicatorView *)self->_loadingActivityIndicatorView sizeToFit];
      [v22 addSubview:self->_loadingActivityIndicatorView];
LABEL_13:
      [v22 setNeedsLayout];
      id v21 = v22;
      goto LABEL_14;
    }
  }
  else
  {
    [(UITextView *)termsTextView setHidden:0];
    [(UITextView *)self->_termsTextView setText:self->_termsText];
    uint64_t v17 = self->_loadingLabel;
    BOOL v5 = v17 != 0;
    if (v17)
    {
      [(UILabel *)v17 removeFromSuperview];
      CGFloat v18 = self->_loadingLabel;
      self->_loadingLabel = 0;
    }
    double v19 = self->_loadingActivityIndicatorView;
    if (v19)
    {
      [(UIActivityIndicatorView *)v19 stopAnimating];
      [(UIActivityIndicatorView *)self->_loadingActivityIndicatorView removeFromSuperview];
      CGFloat v20 = self->_loadingLabel;
      self->_loadingLabel = 0;

      goto LABEL_13;
    }
  }
  id v21 = v22;
  if (v5) {
    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)isAccepting
{
  return self->_accepting;
}

- (MusicTermsAgreementViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MusicTermsAgreementViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (NSString)termsText
{
  return self->_termsText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_termsTextView, 0);
  objc_storeStrong((id *)&self->_sendEmailBarButtonItem, 0);
  objc_storeStrong((id *)&self->_loadingActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_agreeBarButtonItem, 0);

  objc_storeStrong((id *)&self->_acceptingBarButtonItem, 0);
}

@end