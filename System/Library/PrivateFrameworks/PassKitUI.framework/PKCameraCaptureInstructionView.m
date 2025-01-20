@interface PKCameraCaptureInstructionView
- (BOOL)hasSecondaryButton;
- (BOOL)isBuddyiPad;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCameraCaptureInstructionView)initWithFrame:(CGRect)a3 context:(int64_t)a4 primaryAction:(id)a5 primaryActionTitle:(id)a6 secondaryAction:(id)a7 secondaryActionTitle:(id)a8;
- (PKTableHeaderView)headerView;
- (void)layoutSubviews;
- (void)removeSecondaryButton;
- (void)setHeaderView:(id)a3;
- (void)setPrimaryButtonEnabled:(BOOL)a3;
- (void)setPrimaryButtonHidden:(BOOL)a3;
- (void)setPrimaryButtonTitle:(id)a3;
- (void)setSecondaryButtonTitle:(id)a3;
- (void)setupHeaderView;
- (void)setupPrimaryButtonWithTitle:(id)a3 action:(id)a4;
- (void)setupScrollView;
- (void)setupSecondaryButtonWithTitle:(id)a3 action:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKCameraCaptureInstructionView

- (PKCameraCaptureInstructionView)initWithFrame:(CGRect)a3 context:(int64_t)a4 primaryAction:(id)a5 primaryActionTitle:(id)a6 secondaryAction:(id)a7 secondaryActionTitle:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKCameraCaptureInstructionView;
  v21 = -[PKCameraCaptureInstructionView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    v21->_context = a4;
    [(PKCameraCaptureInstructionView *)v21 setupScrollView];
    [(PKCameraCaptureInstructionView *)v22 setupPrimaryButtonWithTitle:v18 action:v17];
    [(PKCameraCaptureInstructionView *)v22 setupSecondaryButtonWithTitle:v20 action:v19];
    [(PKCameraCaptureInstructionView *)v22 setupHeaderView];
  }

  return v22;
}

- (void)setupScrollView
{
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  v5 = self->_scrollView;

  [(PKCameraCaptureInstructionView *)self addSubview:v5];
}

- (void)setupPrimaryButtonWithTitle:(id)a3 action:(id)a4
{
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E4FB14D8];
    v7 = (NSString *)*MEMORY[0x1E4FB28C8];
    v8 = (NSString *)*MEMORY[0x1E4FB2788];
    id v9 = a4;
    id v10 = a3;
    v11 = PKFontForDefaultDesign(v7, v8);
    objc_msgSend(v6, "pkui_plainConfigurationWithTitle:font:", v10, v11);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    v12 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v14 primaryAction:v9];

    primaryButton = self->_primaryButton;
    self->_primaryButton = v12;

    [(UIButton *)self->_primaryButton setConfigurationUpdateHandler:&__block_literal_global_247];
    [(UIScrollView *)self->_scrollView addSubview:self->_primaryButton];
  }
}

void __69__PKCameraCaptureInstructionView_setupPrimaryButtonWithTitle_action___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  id v4 = [v2 titleLabel];

  [v4 setNumberOfLines:3];
}

- (void)setupSecondaryButtonWithTitle:(id)a3 action:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  if (v6 && IsSetupAssistant)
  {
    v8 = (void *)MEMORY[0x1E4FB14D8];
    id v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2788]);
    id v10 = objc_msgSend(v8, "pkui_plainConfigurationWithTitle:font:", v13, v9);

    v11 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:v6];
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v11;

    [(UIButton *)self->_secondaryButton setConfigurationUpdateHandler:&__block_literal_global_14];
    [(UIScrollView *)self->_scrollView addSubview:self->_secondaryButton];
  }
}

void __71__PKCameraCaptureInstructionView_setupSecondaryButtonWithTitle_action___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  id v4 = [v2 titleLabel];

  [v4 setNumberOfLines:2];
}

- (void)setupHeaderView
{
  v3 = [PKTableHeaderView alloc];
  id v4 = -[PKTableHeaderView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v4;

  BOOL v6 = [(PKCameraCaptureInstructionView *)self isBuddyiPad];
  [(PKTableHeaderView *)self->_headerView setStyle:v6];
  double v7 = 10.0;
  if (v6)
  {
    double v7 = 20.0;
    double v8 = 19.0;
  }
  else
  {
    double v8 = 9.0;
  }
  [(PKTableHeaderView *)self->_headerView setTopPadding:v7];
  [(PKTableHeaderView *)self->_headerView setBottomPadding:v8];
  scrollView = self->_scrollView;
  id v10 = self->_headerView;

  [(UIScrollView *)scrollView addSubview:v10];
}

- (void)setPrimaryButtonEnabled:(BOOL)a3
{
}

- (void)setPrimaryButtonHidden:(BOOL)a3
{
}

- (void)setPrimaryButtonTitle:(id)a3
{
}

- (void)setSecondaryButtonTitle:(id)a3
{
}

- (void)removeSecondaryButton
{
  [(UIButton *)self->_secondaryButton removeFromSuperview];
  secondaryButton = self->_secondaryButton;
  self->_secondaryButton = 0;
}

- (BOOL)hasSecondaryButton
{
  return self->_secondaryButton != 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCameraCaptureInstructionView;
  [(PKCameraCaptureInstructionView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(PKCameraCaptureInstructionView *)self traitCollection];
    BOOL v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(PKCameraCaptureInstructionView *)self setNeedsLayout];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  unint64_t v5 = PKUIGetMinScreenWidthType() - 5;
  if (v5 > 9) {
    double v6 = 216.0;
  }
  else {
    double v6 = dbl_1A0445D08[v5];
  }
  if ([(PKCameraCaptureInstructionView *)self isBuddyiPad]) {
    double v7 = 313.0;
  }
  else {
    double v7 = v6;
  }
  double v8 = width;
  result.double height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)layoutSubviews
{
  *(void *)&rect.size.double height = self;
  v69 = PKCameraCaptureInstructionView;
  [(CGFloat *)(objc_super *)&rect.size.height layoutSubviews];
  [(PKCameraCaptureInstructionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = v7 + -16.0;
  [(UIScrollView *)self->_scrollView setFrame:v3];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v8, v10);
  uint64_t v12 = MEMORY[0x1E4F1DB28];
  double v13 = *MEMORY[0x1E4F1DB28];
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v8, v10);
  UIRectCenteredXInRect();
  v61.origin.CGFloat x = v15;
  v61.origin.CGFloat y = v16;
  v61.size.CGFloat width = v17;
  v61.size.double height = v18;
  -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:");
  id v19 = [(UIButton *)self->_primaryButton titleLabel];
  objc_msgSend(v19, "sizeThatFits:", v11, v10);

  -[UIButton sizeThatFits:](self->_primaryButton, "sizeThatFits:", v11, v10);
  double v67 = v13;
  UIRectCenteredXInRect();
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  rect.origin.CGFloat y = v25;
  rect.size.CGFloat width = v24;
  double v66 = *(double *)(v12 + 16);
  double v65 = *(double *)(v12 + 24);
  BOOL v26 = [(PKCameraCaptureInstructionView *)self isBuddyiPad];
  double v27 = 38.0;
  if (!v26) {
    double v27 = 14.0;
  }
  CGFloat v59 = v4;
  double v60 = v27;
  rect.origin.CGFloat x = v21;
  if (self->_secondaryButton)
  {
    CGFloat MaxY = CGRectGetMaxY(v61);
    v28 = [(UIButton *)self->_secondaryButton titleLabel];
    objc_msgSend(v28, "sizeThatFits:", v11, v10);

    -[UIButton sizeThatFits:](self->_secondaryButton, "sizeThatFits:", v11, v10);
    double v64 = v14;
    UIRectCenteredXInRect();
    CGFloat v29 = v8;
    double v31 = v30;
    CGFloat v33 = v32;
    double v35 = v34;
    double v37 = v36;
    v70.origin.CGFloat x = v4;
    CGFloat v63 = v29;
    v70.origin.CGFloat y = v6;
    v70.size.CGFloat width = v29;
    v70.size.double height = v10;
    double v38 = CGRectGetMaxY(v70);
    v71.origin.CGFloat x = v31;
    v71.origin.CGFloat y = v33;
    v71.size.CGFloat width = v35;
    v71.size.double height = v37;
    double v39 = MaxY;
    double v40 = v38 - CGRectGetHeight(v71) - v60;
    v72.origin.CGFloat x = rect.origin.x;
    v72.origin.CGFloat y = MaxY;
    v72.size.CGFloat width = rect.size.width;
    v72.size.double height = rect.origin.y;
    CGFloat v41 = CGRectGetMaxY(v72);
    CGFloat v42 = v67;
    CGFloat y = rect.origin.y;
    if (v40 < v41)
    {
      CGFloat x = rect.origin.x;
      CGFloat v45 = MaxY;
      CGFloat width = rect.size.width;
      double v47 = CGRectGetMaxY(*(CGRect *)(&y - 3));
      BOOL v48 = [(PKCameraCaptureInstructionView *)self isBuddyiPad];
      double v49 = 9.0;
      if (v48) {
        double v49 = 19.0;
      }
      double v40 = v47 + v49;
      CGFloat v42 = v31;
      double v65 = v37;
      double v66 = v35;
      double v64 = v40;
    }
    -[UIButton setFrame:](self->_secondaryButton, "setFrame:", v31, v40, v35, v37, *(void *)&v59);
    CGFloat v14 = v64;
    CGFloat v51 = v65;
    CGFloat v50 = v66;
    double v8 = v63;
  }
  else
  {
    double v52 = v27;
    v73.origin.CGFloat x = v4;
    v73.origin.CGFloat y = v6;
    v73.size.CGFloat width = v8;
    v73.size.double height = v10;
    double v53 = CGRectGetMaxY(v73);
    v74.origin.CGFloat x = v21;
    v74.origin.CGFloat y = v23;
    v74.size.double height = rect.origin.y;
    v74.size.CGFloat width = rect.size.width;
    double v39 = v53 - CGRectGetHeight(v74) - v52;
    CGFloat v50 = v66;
    CGFloat v42 = v67;
    CGFloat v51 = v65;
    if (v39 < CGRectGetMaxY(v61))
    {
      double v39 = CGRectGetMaxY(v61);
      CGFloat v42 = rect.origin.x;
      CGFloat v51 = rect.origin.y;
      CGFloat v14 = v39;
      CGFloat v50 = rect.size.width;
    }
  }
  v75.origin.CGFloat x = v42;
  v75.origin.CGFloat y = v14;
  v75.size.CGFloat width = v50;
  v75.size.double height = v51;
  if (!CGRectIsEmpty(v75))
  {
    scrollView = self->_scrollView;
    v76.origin.CGFloat x = v59;
    v76.origin.CGFloat y = v6;
    v76.size.CGFloat width = v8;
    v76.size.double height = v10;
    double v55 = v39;
    CGFloat v56 = CGRectGetWidth(v76);
    v77.origin.CGFloat x = v42;
    v77.origin.CGFloat y = v14;
    v77.size.CGFloat width = v50;
    v77.size.double height = v51;
    double v57 = v60 + CGRectGetMaxY(v77);
    double v58 = v56;
    double v39 = v55;
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v58, v57);
  }
  -[UIButton setFrame:](self->_primaryButton, "setFrame:", rect.origin.x, v39, rect.size.width, rect.origin.y, *(void *)&v59);
}

- (BOOL)isBuddyiPad
{
  id v2 = [(PKCameraCaptureInstructionView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }

  return PKPaymentSetupContextIsSetupAssistant();
}

- (PKTableHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end