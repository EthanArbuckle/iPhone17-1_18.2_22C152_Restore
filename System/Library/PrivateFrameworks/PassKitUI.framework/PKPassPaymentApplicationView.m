@interface PKPassPaymentApplicationView
- (BOOL)showHeader;
- (PKPassPaymentApplicationView)initWithCoder:(id)a3;
- (PKPassPaymentApplicationView)initWithFrame:(CGRect)a3;
- (PKPassPaymentApplicationView)initWithPass:(id)a3;
- (PKPassPaymentApplicationViewDelegate)delegate;
- (PKPaymentApplication)selectedApplication;
- (PKPaymentPass)pass;
- (void)_selectedApplicationDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setPass:(id)a3;
- (void)setSelectedApplication:(id)a3;
- (void)setShowHeader:(BOOL)a3;
@end

@implementation PKPassPaymentApplicationView

- (PKPassPaymentApplicationView)initWithCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This class is not NSCoding compliant"];

  return [(PKPassPaymentApplicationView *)self init];
}

- (PKPassPaymentApplicationView)initWithFrame:(CGRect)a3
{
  return -[PKPassPaymentApplicationView initWithPass:](self, "initWithPass:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPassPaymentApplicationView)initWithPass:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKPassPaymentApplicationView;
  v6 = -[PKPassPaymentApplicationView initWithFrame:](&v47, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_pass = (id *)&v6->_pass;
    objc_storeStrong((id *)&v6->_pass, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:0];
    paymentService = v7->_paymentService;
    v7->_paymentService = (PKPaymentService *)v9;

    v11 = objc_alloc_init(PKPassPaymentSummaryHeaderView);
    headerView = v7->_headerView;
    v7->_headerView = v11;

    v13 = v7->_headerView;
    v14 = PKLocalizedPaymentString(&cfstr_PaymentAccount_1.isa);
    [(PKPassPaymentSummaryHeaderView *)v13 setPrimaryTitle:v14];

    [(PKPassPaymentApplicationView *)v7 addSubview:v7->_headerView];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    horizontalSeparator = v7->_horizontalSeparator;
    v7->_horizontalSeparator = v15;

    v17 = v7->_horizontalSeparator;
    v18 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v17 setBackgroundColor:v18];

    [(PKPassPaymentApplicationView *)v7 addSubview:v7->_horizontalSeparator];
    v7->_showHeader = 1;
    v19 = [*p_pass devicePaymentApplications];
    v20 = [v19 allObjects];

    v21 = [MEMORY[0x1E4FB1438] sharedApplication];
    BOOL v22 = [v21 userInterfaceLayoutDirection] == 0;

    v23 = [v5 sortedPaymentApplications:v20 ascending:v22];

    v24 = v7->_paymentService;
    v25 = [v5 uniqueID];
    uint64_t v26 = [(PKPaymentService *)v24 defaultPaymentApplicationForPassUniqueIdentifier:v25];
    selectedApplication = v7->_selectedApplication;
    v7->_selectedApplication = (PKPaymentApplication *)v26;

    v28 = v7->_selectedApplication;
    if (!v28 || ([(PKPaymentApplication *)v28 supportsContactlessPayment] & 1) == 0)
    {
      uint64_t v29 = [*p_pass devicePrimaryContactlessPaymentApplication];
      v30 = v7->_selectedApplication;
      v7->_selectedApplication = (PKPaymentApplication *)v29;
    }
    if ([v23 count])
    {
      id v46 = v5;
      uint64_t v31 = [v23 copy];
      paymentApplications = v7->_paymentApplications;
      v7->_paymentApplications = (NSArray *)v31;

      v33 = [(PKPaymentApplication *)v7->_selectedApplication applicationIdentifier];
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([(NSArray *)v7->_paymentApplications count])
      {
        unint64_t v35 = 0;
        uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          v37 = [(NSArray *)v7->_paymentApplications objectAtIndexedSubscript:v35];
          v38 = [v37 applicationIdentifier];
          int v39 = [v38 isEqualToString:v33];

          if (v39) {
            uint64_t v36 = v35;
          }
          uint64_t v40 = [v37 displayName];
          v41 = (void *)v40;
          if (v40) {
            v42 = (__CFString *)v40;
          }
          else {
            v42 = &stru_1EF1B5B50;
          }
          [v34 addObject:v42];

          ++v35;
        }
        while (v35 < [(NSArray *)v7->_paymentApplications count]);
      }
      else
      {
        uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v43 = [objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v34];
      segmentedControl = v7->_segmentedControl;
      v7->_segmentedControl = (UISegmentedControl *)v43;

      [(UISegmentedControl *)v7->_segmentedControl setSelectedSegmentIndex:v36];
      [(UISegmentedControl *)v7->_segmentedControl setExclusiveTouch:1];
      [(UISegmentedControl *)v7->_segmentedControl addTarget:v7 action:sel__selectedApplicationDidChange_ forControlEvents:4096];
      [(PKPassPaymentApplicationView *)v7 addSubview:v7->_segmentedControl];

      id v5 = v46;
    }
  }
  return v7;
}

- (void)setShowHeader:(BOOL)a3
{
  self->_showHeader = a3;
  if (a3)
  {
    [(PKPassPaymentApplicationView *)self addSubview:self->_headerView];
    [(PKPassPaymentApplicationView *)self addSubview:self->_horizontalSeparator];
  }
  else
  {
    [(PKPassPaymentSummaryHeaderView *)self->_headerView removeFromSuperview];
    [(UIView *)self->_horizontalSeparator removeFromSuperview];
  }

  [(PKPassPaymentApplicationView *)self setNeedsLayout];
}

- (void)_selectedApplicationDidChange:(id)a3
{
  id v5 = self->_selectedApplication;
  -[NSArray objectAtIndexedSubscript:](self->_paymentApplications, "objectAtIndexedSubscript:", [a3 selectedSegmentIndex]);
  v6 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
  selectedApplication = self->_selectedApplication;
  self->_selectedApplication = v6;

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      [(UISegmentedControl *)self->_segmentedControl setUserInteractionEnabled:0];
      id v13 = objc_loadWeakRetained((id *)p_delegate);
      v14 = self->_selectedApplication;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__PKPassPaymentApplicationView__selectedApplicationDidChange___block_invoke;
      v15[3] = &unk_1E59CAEA8;
      v15[4] = self;
      v16 = v5;
      [v13 paymentApplicationView:self didSelectApplication:v14 completion:v15];
    }
  }
}

uint64_t __62__PKPassPaymentApplicationView__selectedApplicationDidChange___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 464), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setSelectedSegmentIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "indexOfObject:", *(void *)(*(void *)(a1 + 32) + 464)));
  }
  v3 = *(void **)(*(void *)(a1 + 32) + 424);

  return [v3 setUserInteractionEnabled:1];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKPassPaymentApplicationView;
  [(PKPassPaymentApplicationView *)&v16 layoutSubviews];
  +[PKPassPaymentSummaryHeaderView preferredHeight];
  double v4 = v3;
  [(PKPassPaymentApplicationView *)self bounds];
  double Width = CGRectGetWidth(v17);
  if (PKUIGetMinScreenWidthType()) {
    double v6 = 4.0;
  }
  else {
    double v6 = 20.0;
  }
  double v7 = Width + v6 * -2.0;
  headerView = self->_headerView;
  [(PKPassPaymentApplicationView *)self bounds];
  -[PKPassPaymentSummaryHeaderView setFrame:](headerView, "setFrame:", 0.0, 0.0);
  horizontalSeparator = self->_horizontalSeparator;
  if (PKUIGetMinScreenWidthType()) {
    double v10 = 4.0;
  }
  else {
    double v10 = 20.0;
  }
  -[UIView setFrame:](horizontalSeparator, "setFrame:", v10, v4, v7, PKUIPixelLength());
  BOOL showHeader = self->_showHeader;
  double v12 = v4 + 10.0;
  segmentedControl = self->_segmentedControl;
  if (PKUIGetMinScreenWidthType()) {
    double v14 = 4.0;
  }
  else {
    double v14 = 20.0;
  }
  if (showHeader) {
    double v15 = v12;
  }
  else {
    double v15 = 10.0;
  }
  -[UISegmentedControl setFrame:](segmentedControl, "setFrame:", v14, v15, v7, 28.0);
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKPaymentApplication)selectedApplication
{
  return self->_selectedApplication;
}

- (void)setSelectedApplication:(id)a3
{
}

- (PKPassPaymentApplicationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassPaymentApplicationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showHeader
{
  return self->_showHeader;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end