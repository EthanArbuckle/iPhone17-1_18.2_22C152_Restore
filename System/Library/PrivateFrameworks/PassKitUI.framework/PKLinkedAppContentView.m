@interface PKLinkedAppContentView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)storeIDs;
- (NSURL)appLaunchURL;
- (PKLinkedAppContentView)initWithCoder:(id)a3;
- (PKLinkedAppContentView)initWithFrame:(CGRect)a3;
- (PKLinkedAppContentView)initWithLinkedApplication:(id)a3;
- (PKLinkedAppViewDelegate)delegate;
- (PKLinkedApplication)linkedApplication;
- (id)_presentingViewController;
- (void)_cleanupViews;
- (void)_configureAppLockUpIfNecessary;
- (void)_layoutLoadingView;
- (void)_layoutLockupView;
- (void)_layoutNotAvailableView;
- (void)appLockupViewTapped;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3;
- (void)reloadApplicationStateIfNecessary;
- (void)setAppLaunchURL:(id)a3;
- (void)setCustomProductPageIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)setStoreIDs:(id)a3;
@end

@implementation PKLinkedAppContentView

- (PKLinkedAppContentView)initWithCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This class is not NSCoding compliant"];

  return [(PKLinkedAppContentView *)self init];
}

- (PKLinkedAppContentView)initWithFrame:(CGRect)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"This class is not NSCoding compliant", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return [(PKLinkedAppContentView *)self init];
}

- (PKLinkedAppContentView)initWithLinkedApplication:(id)a3
{
  v4 = (PKLinkedApplication *)a3;
  v11.receiver = self;
  v11.super_class = (Class)PKLinkedAppContentView;
  v5 = -[PKLinkedAppContentView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = v4;
    if (!v4) {
      v6 = [[PKLinkedApplication alloc] initWithStoreIDs:0 defaultLaunchURL:0];
    }
    objc_storeStrong((id *)&v5->_linkedApplication, v6);
    if (!v4) {

    }
    [(PKLinkedApplication *)v5->_linkedApplication addObserver:v5];
    v7 = (ASCLockupView *)objc_alloc_init(MEMORY[0x1E4F4BB08]);
    lockupView = v5->_lockupView;
    v5->_lockupView = v7;

    [(ASCLockupView *)v5->_lockupView setDelegate:v5];
    [(ASCLockupView *)v5->_lockupView setShowsPlaceholderContent:0];
    [(ASCLockupView *)v5->_lockupView setAutomaticallyPresentsProductDetails:0];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v5 action:sel_appLockupViewTapped];
    [(ASCLockupView *)v5->_lockupView addGestureRecognizer:v9];
    [(PKLinkedAppContentView *)v5 _configureAppLockUpIfNecessary];
  }
  return v5;
}

- (void)dealloc
{
  [(PKLinkedApplication *)self->_linkedApplication removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedAppContentView;
  [(PKLinkedAppContentView *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppContentView;
  [(PKLinkedAppContentView *)&v4 didMoveToWindow];
  objc_super v3 = [(PKLinkedAppContentView *)self window];

  if (v3) {
    [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
  }
}

- (CGSize)intrinsicContentSize
{
  [(ASCLockupView *)self->_lockupView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[ASCLockupView sizeThatFits:](self->_lockupView, "sizeThatFits:", a3.width + -28.0, 1.79769313e308);
  double v5 = v4 + 24.0;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppContentView;
  [(PKLinkedAppContentView *)&v4 layoutSubviews];
  int64_t v3 = [(PKLinkedApplication *)self->_linkedApplication state];
  switch(v3)
  {
    case 2:
      [(PKLinkedAppContentView *)self _layoutNotAvailableView];
      break;
    case 1:
      [(PKLinkedAppContentView *)self _layoutLockupView];
      break;
    case 0:
      [(PKLinkedAppContentView *)self _layoutLoadingView];
      break;
  }
}

- (void)_layoutLoadingView
{
  [(PKLinkedAppContentView *)self _cleanupViews];
  p_activityIndicator = (id *)&self->_activityIndicator;
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    id v6 = *p_activityIndicator;
    id *p_activityIndicator = (id)v5;

    [*p_activityIndicator sizeToFit];
    [*p_activityIndicator startAnimating];
    activityIndicator = (UIActivityIndicatorView *)*p_activityIndicator;
  }
  [(PKLinkedAppContentView *)self addSubview:activityIndicator];
  v7 = PKLocalizedString(&cfstr_Loading_1.isa);
  [(PKLinkedAppContentView *)self setLoadingText:v7];

  p_loadingLabel = &self->_loadingLabel;
  [(PKLinkedAppContentView *)self addSubview:self->_loadingLabel];
  [*p_activityIndicator frame];
  [(UILabel *)self->_loadingLabel frame];
  [*p_activityIndicator frame];
  double v10 = v9;
  [(UILabel *)self->_loadingLabel frame];
  if (v10 <= v11) {
    v12 = (id *)&self->_loadingLabel;
  }
  else {
    v12 = (id *)&self->_activityIndicator;
  }
  [*v12 frame];
  [(PKLinkedAppContentView *)self bounds];
  UIRectCenteredIntegralRect();
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(*p_activityIndicator, "frame", 0, 0, 0, 0, 0, 0, 0, 0);
  CGFloat v22 = v21;
  v32.origin.x = v14;
  v32.origin.y = v16;
  v32.size.CGFloat width = v18;
  v32.size.height = v20;
  CGRectDivide(v32, &slice, &remainder, v22, CGRectMinXEdge);
  [(UILabel *)*p_loadingLabel frame];
  CGFloat v24 = v23;
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.CGFloat width = v18;
  v33.size.height = v20;
  CGRectDivide(v33, &remainder, &v29, v24, CGRectMaxXEdge);
  UIRectCenteredYInRect();
  remainder.origin.x = v25;
  remainder.origin.y = v26;
  remainder.size.CGFloat width = v27;
  remainder.size.height = v28;
  objc_msgSend(*p_activityIndicator, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UILabel setFrame:](*p_loadingLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
}

- (void)_layoutNotAvailableView
{
  [(PKLinkedAppContentView *)self _cleanupViews];
  int64_t v3 = PKLocalizedString(&cfstr_NotAvailable.isa);
  [(PKLinkedAppContentView *)self setLoadingText:v3];

  [(UILabel *)self->_loadingLabel setTextAlignment:1];
  [(PKLinkedAppContentView *)self addSubview:self->_loadingLabel];
  [(PKLinkedAppContentView *)self bounds];
  UIRectInset();
  -[UILabel sizeThatFits:](self->_loadingLabel, "sizeThatFits:", v4, v5);
  UIRectCenteredIntegralRect();
  loadingLabel = self->_loadingLabel;

  -[UILabel setFrame:](loadingLabel, "setFrame:");
}

- (void)_layoutLockupView
{
  [(PKLinkedAppContentView *)self _cleanupViews];
  [(PKLinkedAppContentView *)self addSubview:self->_lockupView];
  [(PKLinkedAppContentView *)self _configureAppLockUpIfNecessary];
  [(PKLinkedAppContentView *)self bounds];
  CGRect v6 = CGRectInset(v5, 14.0, 12.0);
  -[ASCLockupView sizeThatFits:](self->_lockupView, "sizeThatFits:", v6.size.width, 1.79769313e308);
  lockupView = self->_lockupView;
  PKSizeAlignedInRect();

  -[ASCLockupView setFrame:](lockupView, "setFrame:");
}

- (void)_cleanupViews
{
  [(UILabel *)self->_loadingLabel removeFromSuperview];
  [(UIActivityIndicatorView *)self->_activityIndicator removeFromSuperview];
  lockupView = self->_lockupView;

  [(ASCLockupView *)lockupView removeFromSuperview];
}

- (void)_configureAppLockUpIfNecessary
{
  BOOL v3 = [(PKLinkedApplication *)self->_linkedApplication isInstalled];
  BOOL v4 = v3;
  int v5 = v3 ^ self->_wasInstalledWhenLastConfigured;
  CGRect v6 = [(ASCLockupView *)self->_lockupView request];

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    self->_wasInstalledWhenLastConfigured = v4;
    [(ASCLockupView *)self->_lockupView setLockup:0];
    [(ASCLockupView *)self->_lockupView setRequest:0];
    v8 = [(PKLinkedApplication *)self->_linkedApplication storeIdentifier];
    double v9 = v8;
    if (v8)
    {
      double v10 = _PKCreateASCLookupRequestForStoreID(v8, 0);
      [(ASCLockupView *)self->_lockupView setRequest:v10];
    }
    double v11 = [(PKLinkedApplication *)self->_linkedApplication systemAppBundleIdentifiers];
    v12 = [v11 firstObject];

    if (v9) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v12 == 0;
    }
    if (!v13)
    {
      CGFloat v14 = (void *)[objc_alloc(MEMORY[0x1E4F4BB10]) initWithName:@"Wallet App Lookup"];
      uint64_t v15 = *MEMORY[0x1E4F4BA70];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__PKLinkedAppContentView__configureAppLockUpIfNecessary__block_invoke;
      v16[3] = &unk_1E59DC300;
      v16[4] = self;
      [v14 _lockupRequestForBundleID:v12 withContext:v15 completionBlock:v16];
    }
  }
}

uint64_t __56__PKLinkedAppContentView__configureAppLockUpIfNecessary__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 408) setRequest:a2];
  }
  return result;
}

- (void)reloadApplicationStateIfNecessary
{
}

- (NSArray)storeIDs
{
  return [(PKLinkedApplication *)self->_linkedApplication storeIDs];
}

- (void)setStoreIDs:(id)a3
{
}

- (NSURL)appLaunchURL
{
  return [(PKLinkedApplication *)self->_linkedApplication defaultLaunchURL];
}

- (void)setAppLaunchURL:(id)a3
{
}

- (void)setCustomProductPageIdentifier:(id)a3
{
}

- (void)setLoadingText:(id)a3
{
  id v4 = a3;
  loadingLabel = self->_loadingLabel;
  id v13 = v4;
  if (!loadingLabel)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    BOOL v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v8 = self->_loadingLabel;
    self->_loadingLabel = v7;

    double v9 = self->_loadingLabel;
    double v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D8], (NSString *)*MEMORY[0x1E4FB2798]);
    [(UILabel *)v9 setFont:v10];

    [(UILabel *)self->_loadingLabel setNumberOfLines:3];
    double v11 = self->_loadingLabel;
    v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UILabel *)v11 setTextColor:v12];

    id v4 = v13;
    loadingLabel = self->_loadingLabel;
  }
  [(UILabel *)loadingLabel setText:v4];
  [(UILabel *)self->_loadingLabel sizeToFit];
}

- (void)appLockupViewTapped
{
  BOOL v3 = [(PKLinkedApplication *)self->_linkedApplication customProductPageIdentifier];

  if (v3)
  {
    linkedApplication = self->_linkedApplication;
    id v6 = [(PKLinkedAppContentView *)self _presentingViewController];
    [(PKLinkedApplication *)linkedApplication openApplication:v6];
  }
  else
  {
    lockupView = self->_lockupView;
    [(ASCLockupView *)lockupView presentProductDetailsViewController];
  }
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v5 = a3;
  if (![v5 state])
  {
    id v4 = [(PKLinkedAppContentView *)self window];

    if (v4) {
      [v5 reloadApplicationStateIfNecessary];
    }
  }
  [(PKLinkedAppContentView *)self _configureAppLockUpIfNecessary];
  [(PKLinkedAppContentView *)self setNeedsLayout];
  [(PKLinkedAppContentView *)self lockupViewDidInvalidateIntrinsicContentSize:self->_lockupView];
}

- (id)_presentingViewController
{
  double v2 = [(UIView *)self pkui_viewControllerFromResponderChain];
  BOOL v3 = objc_msgSend(v2, "pkui_frontMostViewController");

  return v3;
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: failed to load app with error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  if ([(PKLinkedApplication *)self->_linkedApplication state] == 1)
  {
    [(ASCLockupView *)self->_lockupView intrinsicContentSize];
    double width = self->_previousIntrinsicContentSize.width;
    double height = self->_previousIntrinsicContentSize.height;
    self->_previousIntrinsicContentSize.double width = v7;
    self->_previousIntrinsicContentSize.double height = v4;
    if (width != v7 || height != v4)
    {
      [(PKLinkedAppContentView *)self setNeedsLayout];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained appViewContentSizeChanged:self];
    }
  }
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  double v4 = (ASCLockupView *)a3;
  if (self->_lockupView == v4)
  {
    id v5 = [(PKLinkedApplication *)self->_linkedApplication defaultLaunchURL];
    if (!v5 || ![(PKLinkedApplication *)self->_linkedApplication isInstalled]) {
      goto LABEL_6;
    }
    int64_t v6 = [(PKLinkedApplication *)self->_linkedApplication state];

    if (v6 == 1)
    {
      double v7 = (void *)MEMORY[0x1E4F4BB20];
      uint64_t v8 = PKLocalizedString(&cfstr_OpenButton.isa);
      id v5 = [v7 textMetadataWithTitle:v8 subtitle:0];

      objc_initWeak(&location, self);
      id v9 = objc_alloc(MEMORY[0x1E4F4BAE0]);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __53__PKLinkedAppContentView_lockupViewDidFinishRequest___block_invoke;
      CGFloat v16 = &unk_1E59CA7F8;
      objc_copyWeak(&v17, &location);
      double v10 = (void *)[v9 initWithMetadata:v5 action:&v13];
      double v11 = [(ASCLockupView *)v4 lockup];
      v12 = [v11 lockupWithOffer:v10];
      [(ASCLockupView *)v4 setLockup:v12];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
LABEL_6:
    }
  }
}

void __53__PKLinkedAppContentView_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = (void *)WeakRetained[57];
    double v4 = WeakRetained;
    BOOL v3 = [WeakRetained _presentingViewController];
    [v2 openApplication:v3];

    id WeakRetained = v4;
  }
}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (PKLinkedAppViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKLinkedAppViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end