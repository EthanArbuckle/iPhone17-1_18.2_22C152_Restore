@interface PKPaymentPassTableCell
+ (double)heightForCellWithMinimum:(double)a3 hasSubTitle:(BOOL)a4;
+ (id)subTitleFont;
+ (id)titleFont;
- (BOOL)showAddButton;
- (BOOL)showSubTitle;
- (PKPassFaceViewRendererState)rendererState;
- (PKPaymentPass)pass;
- (PKPaymentPassTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PKPaymentPassTableCellDelegate)delegate;
- (UIControl)actionButton;
- (UILabel)mainLabel;
- (UILabel)subTextLabel;
- (id)_stringForPassState:(unint64_t)a3;
- (id)pk_childrenForAppearance;
- (void)_addButtonPressed:(id)a3;
- (void)_configureActionButtonWithTitle:(id)a3;
- (void)_configureCellWithSpecifier:(id)a3;
- (void)_configureMainLabelWithText:(id)a3;
- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4;
- (void)_verifyButtonPressed:(id)a3;
- (void)dealloc;
- (void)didChangeVerificationPresentation;
- (void)disableAddButton;
- (void)dismissVerificationViewControllerAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)prepareForReuse;
- (void)presentVerificationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPass:(id)a3 passView:(id)a4;
- (void)setShowAddButton:(BOOL)a3;
- (void)setShowSubTitle:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)showActivitySpinner:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateSubtitle;
- (void)updateSubtitleForTransitProperties;
@end

@implementation PKPaymentPassTableCell

- (PKPaymentPassTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassTableCell;
  v9 = [(PKPaymentPassTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(PKPaymentPassTableCell *)v9 setSpecifier:v8];
    [(PKPaymentPassTableCell *)v10 setAutoresizingMask:18];
  }

  return v10;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPassTableCell;
  [(PSTableCell *)&v3 prepareForReuse];
  [(UILabel *)self->_subTextLabel setText:0];
  self->_showActionButton = 0;
  self->_showSpinner = 0;
  self->_showSnapshotSpinner = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentPassTableCell;
  [(PSTableCell *)&v2 dealloc];
}

+ (id)titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (id)subTitleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (double)heightForCellWithMinimum:(double)a3 hasSubTitle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [a1 titleFont];
  [v7 lineHeight];
  double v9 = v8;

  if (v4)
  {
    v10 = [a1 subTitleFont];
    [v10 lineHeight];
    double v9 = v9 + v11;
  }
  double result = v9 + 16.0;
  if (v9 + 16.0 <= a3) {
    return a3;
  }
  return result;
}

- (PKPassFaceViewRendererState)rendererState
{
  return [(PKPassView *)self->_passView rendererState];
}

- (void)setPass:(id)a3 passView:(id)a4
{
  v7 = (PKPaymentPass *)a3;
  double v8 = (PKPassView *)a4;
  double v9 = v8;
  p_pass = &self->_pass;
  if (self->_pass != v7 || self->_passView != v8)
  {
    unsigned int v11 = self->_snapshotCounter + 1;
    self->_snapshotCounter = v11;
    objc_storeStrong((id *)&self->_pass, a3);
    objc_super v12 = [(PKPaymentPass *)*p_pass devicePrimaryPaymentApplication];
    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = v12;

    p_passView = &self->_passView;
    [(PKPassView *)self->_passView removeFromSuperview];
    objc_storeStrong((id *)&self->_passView, a4);
    if (*p_pass) {
      [(PKPaymentPass *)*p_pass style];
    }
    PKPassFrontFaceContentSize();
    PKSizeAspectFit();
    double v16 = v15;
    double v18 = v17;
    v19 = [(PKPaymentPassTableCell *)self contentView];
    if (*p_passView)
    {
      [(PKPassView *)*p_passView sizeOfFrontFace];
      CGFloat v21 = v16 / v20;
      v22 = [(PKPassView *)*p_passView layer];
      CATransform3DMakeScale(&v37, v21, v21, 1.0);
      [v22 setTransform:&v37];

      [(PKPassView *)*p_passView setUserInteractionEnabled:0];
      [(PKPassView *)*p_passView setAccessibilityElementsHidden:1];
      [v19 addSubview:*p_passView];
    }
    else
    {
      self->_showSnapshotSpinner = 1;
      snapshotSpinner = self->_snapshotSpinner;
      if (!snapshotSpinner)
      {
        v24 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        v25 = self->_snapshotSpinner;
        self->_snapshotSpinner = v24;

        [(UIActivityIndicatorView *)self->_snapshotSpinner startAnimating];
        snapshotSpinner = self->_snapshotSpinner;
      }
      [v19 addSubview:snapshotSpinner];
      [(UIImageView *)self->_cardSnapshotView setImage:0];
      v26 = +[PKPassSnapshotter sharedInstance];
      v27 = *p_pass;
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      v31 = __43__PKPaymentPassTableCell_setPass_passView___block_invoke;
      v32 = &unk_1E59D8988;
      v33 = self;
      unsigned int v36 = v11;
      id v34 = v19;
      id v35 = v26;
      id v28 = v26;
      objc_msgSend(v28, "snapshotWithPass:size:completion:", v27, &v29, v16, v18);
    }
    [(PKPaymentPassTableCell *)self setNeedsLayout];
    [(PKPaymentPassTableCell *)self updateSubtitleForTransitProperties];
  }
}

void __43__PKPaymentPassTableCell_setPass_passView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PKPaymentPassTableCell_setPass_passView___block_invoke_2;
  v6[3] = &unk_1E59D8960;
  int v9 = *(_DWORD *)(a1 + 56);
  BOOL v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __43__PKPaymentPassTableCell_setPass_passView___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 1208) == *(_DWORD *)(result + 56))
  {
    uint64_t v2 = result;
    id v3 = *(void **)(v1 + 1232);
    if (v3)
    {
      [v3 setImage:*(void *)(v2 + 40)];
      [*(id *)(*(void *)(v2 + 32) + 1232) sizeToFit];
    }
    else
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*(void *)(v2 + 40)];
      uint64_t v5 = *(void *)(v2 + 32);
      v6 = *(void **)(v5 + 1232);
      *(void *)(v5 + 1232) = v4;

      [*(id *)(*(void *)(v2 + 32) + 1232) setAccessibilityIgnoresInvertColors:1];
      id v7 = [*(id *)(*(void *)(v2 + 32) + 1232) layer];
      [*(id *)(v2 + 40) size];
      id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
      [v8 CGColor];
      PKPaymentStyleApplyCorners();

      [*(id *)(v2 + 48) addSubview:*(void *)(*(void *)(v2 + 32) + 1232)];
    }
    [*(id *)(*(void *)(v2 + 32) + 1216) removeFromSuperview];
    *(unsigned char *)(*(void *)(v2 + 32) + 1282) = 0;
    int v9 = *(void **)(v2 + 32);
    return [v9 setNeedsLayout];
  }
  return result;
}

- (void)layoutSubviews
{
  v76.receiver = self;
  v76.super_class = (Class)PKPaymentPassTableCell;
  [(PSTableCell *)&v76 layoutSubviews];
  int v3 = [(PKPaymentPassTableCell *)self _shouldReverseLayoutDirection];
  if (v3) {
    CGRectEdge v4 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v4 = CGRectMinXEdge;
  }
  if (v3) {
    CGRectEdge v5 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v5 = CGRectMaxXEdge;
  }
  v6 = [(PKPaymentPassTableCell *)self contentView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  memset(&remainder, 0, sizeof(remainder));
  memset(&v74, 0, sizeof(v74));
  double v15 = 0.0;
  if (self->_showActionButton)
  {
    actionButton = self->_actionButton;
    if (actionButton)
    {
      memset(&slice, 0, sizeof(slice));
      [(UIControl *)actionButton frame];
      CGFloat v18 = v17 + 16.0;
      v77.origin.CGFloat x = v8;
      v77.origin.double y = v10;
      v77.size.CGFloat width = v12;
      v77.size.CGFloat height = v14;
      CGRectDivide(v77, &slice, &remainder, v18, v5);
      [(UIControl *)self->_actionButton frame];
      UIRectCenteredIntegralRect();
      slice.origin.CGFloat x = v19;
      slice.origin.double y = v20;
      slice.size.CGFloat width = v21;
      slice.size.CGFloat height = v22;
      -[UIControl setFrame:](self->_actionButton, "setFrame:");
      v78.origin.CGFloat x = v8;
      v78.origin.double y = v10;
      v78.size.CGFloat width = v12;
      v78.size.CGFloat height = v14;
      double v15 = fmax(CGRectGetMaxX(v78) - slice.origin.x + 8.0, 0.0);
    }
  }
  if (self->_showSpinner)
  {
    spinner = self->_spinner;
    if (spinner)
    {
      memset(&slice, 0, sizeof(slice));
      [(UIActivityIndicatorView *)spinner frame];
      CGFloat v25 = v24 + 16.0;
      v79.origin.CGFloat x = v8;
      v79.origin.double y = v10;
      v79.size.CGFloat width = v12;
      v79.size.CGFloat height = v14;
      CGRectDivide(v79, &slice, &remainder, v25, v5);
      [(UIActivityIndicatorView *)self->_spinner frame];
      UIRectCenteredIntegralRect();
      slice.origin.CGFloat x = v26;
      slice.origin.double y = v27;
      slice.size.CGFloat width = v28;
      slice.size.CGFloat height = v29;
      -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
      v80.origin.CGFloat x = v8;
      v80.origin.double y = v10;
      v80.size.CGFloat width = v12;
      v80.size.CGFloat height = v14;
      double v15 = fmax(v15, CGRectGetMaxX(v80) - slice.origin.x + 8.0);
    }
  }
  remainder.origin.CGFloat x = v8;
  remainder.origin.double y = v10;
  remainder.size.CGFloat width = v12;
  remainder.size.CGFloat height = v14;
  v81.origin.CGFloat x = v8;
  v81.origin.double y = v10;
  v81.size.CGFloat width = v12;
  v81.size.CGFloat height = v14;
  CGRectDivide(v81, &v74, &remainder, 16.0, v4);
  CGRectDivide(remainder, &v74, &remainder, v15, v5);
  CGRectDivide(remainder, &v74, &remainder, 66.0, v4);
  if (self->_showSnapshotSpinner)
  {
    snapshotSpinner = self->_snapshotSpinner;
    if (snapshotSpinner)
    {
      [(UIActivityIndicatorView *)self->_snapshotSpinner frame];
      PKSizeAlignedInRect();
      -[UIActivityIndicatorView setFrame:](snapshotSpinner, "setFrame:");
    }
  }
  passView = self->_passView;
  if (passView)
  {
    v32 = passView;
  }
  else
  {
    v32 = self->_cardSnapshotView;
    if (!v32) {
      goto LABEL_27;
    }
  }
  [(UIImageView *)v32 frame];
  PKSizeAlignedInRect();
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  double v40 = fmax(v39, v74.origin.y + 8.0);
  -[UIImageView setFrame:](v32, "setFrame:", v33, v40, v35);
  v82.origin.CGFloat x = v34;
  v82.origin.double y = v40;
  v82.size.CGFloat width = v36;
  v82.size.CGFloat height = v38;
  v88.origin.CGFloat x = v8;
  v88.origin.double y = v10;
  v88.size.CGFloat width = v12;
  v88.size.CGFloat height = v14;
  CGRect v83 = CGRectUnion(v82, v88);
  v89.origin.CGFloat x = v8;
  v89.origin.double y = v10;
  v89.size.CGFloat width = v12;
  v89.size.CGFloat height = v14;
  if (CGRectEqualToRect(v83, v89))
  {
    v41 = 0;
  }
  else
  {
    cardSnapshotMask = self->_cardSnapshotMask;
    if (!cardSnapshotMask)
    {
      v43 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      v44 = self->_cardSnapshotMask;
      self->_cardSnapshotMask = v43;

      v45 = self->_cardSnapshotMask;
      id v46 = [MEMORY[0x1E4FB1618] blackColor];
      -[CALayer setBackgroundColor:](v45, "setBackgroundColor:", [v46 CGColor]);

      cardSnapshotMask = self->_cardSnapshotMask;
    }
    v84.origin.CGFloat x = v8;
    v84.origin.double y = v10;
    v84.size.CGFloat width = v12;
    v84.size.CGFloat height = v14;
    v90.origin.CGFloat x = v34;
    v90.origin.double y = v40;
    v90.size.CGFloat width = v36;
    v90.size.CGFloat height = v38;
    CGRect v85 = CGRectIntersection(v84, v90);
    -[UIImageView convertRect:fromView:](v32, "convertRect:fromView:", v6, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height);
    -[CALayer setFrame:](cardSnapshotMask, "setFrame:");
    v41 = self->_cardSnapshotMask;
  }
  v47 = [(UIImageView *)v32 layer];
  v48 = [v47 mask];

  if (v41 != v48) {
    [v47 setMask:v41];
  }

LABEL_27:
  CGRectDivide(remainder, &v74, &remainder, 10.0, v4);
  CGFloat x = remainder.origin.x;
  double y = remainder.origin.y;
  CGFloat width = remainder.size.width;
  CGFloat height = remainder.size.height;
  [(UILabel *)self->_mainLabel frame];
  PKSizeAlignedInRect();
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  v61 = [(UILabel *)self->_subTextLabel text];
  uint64_t v62 = [v61 length];

  if (v62)
  {
    CGFloat v71 = width;
    CGFloat v72 = x;
    [(UILabel *)self->_subTextLabel frame];
    double v64 = v63;
    PKFloatRoundToPixel();
    double v66 = y + fmax(v65, 0.0);
    double v56 = 8.0;
    if (v66 <= 8.0)
    {
      v87.origin.CGFloat x = v54;
      v87.origin.double y = v66;
      v87.size.CGFloat width = v58;
      v87.size.CGFloat height = v60;
      double MaxY = CGRectGetMaxY(v87);
      double v56 = v66;
    }
    else
    {
      v86.size.CGFloat width = v71;
      v86.origin.CGFloat x = v72;
      v86.origin.double y = y;
      v86.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v86) + -8.0 - v64;
    }
    -[UILabel setFrame:](self->_subTextLabel, "setFrame:", v54, MaxY, v58, v64);
  }
  -[UILabel setFrame:](self->_mainLabel, "setFrame:", v54, v56, v58, v60);
  if (self->_showFullSeparatorInset)
  {
    double v68 = *MEMORY[0x1E4FB2848];
    double v54 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v69 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v70 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v68 = 0.0;
    double v69 = 0.0;
    double v70 = 0.0;
  }
  -[PKPaymentPassTableCell setSeparatorInset:](self, "setSeparatorInset:", v68, v54, v69, v70);
}

- (void)tintColorDidChange
{
  int v3 = [(PKPaymentPassTableCell *)self tintColor];
  [(UIControl *)self->_actionButton setTintColor:v3];
  if (self->_showState
    && [(PKPaymentPass *)self->_pass activationState] != PKPaymentPassActivationStateRequiresActivation
    && [(PKPaymentPass *)self->_pass activationState])
  {
    [(UILabel *)self->_subTextLabel setColor:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassTableCell;
  [(PKPaymentPassTableCell *)&v4 tintColorDidChange];
}

- (void)presentVerificationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a3 && self->_verificationController)
  {
    BOOL v6 = a4;
    id v8 = a5;
    id v9 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained requestPresentationOfViewController:v9 animated:v6 completion:v8];

    objc_storeWeak((id *)&self->_verificationViewController, v9);
  }
}

- (void)dismissVerificationViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  p_verificationViewController = &self->_verificationViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_verificationViewController);
  [WeakRetained dismissViewControllerAnimated:v3 completion:0];

  objc_storeWeak((id *)p_verificationViewController, 0);
}

- (void)didChangeVerificationPresentation
{
  if (self->_verificationController)
  {
    actionButton = self->_actionButton;
    uint64_t v3 = [(PKPaymentVerificationController *)self->_verificationController shouldDisabledVerificationButton] ^ 1;
    [(UIControl *)actionButton setEnabled:v3];
  }
}

- (id)_stringForPassState:(unint64_t)a3
{
  BOOL v6 = @"PAYMENT_CARD_STATE_VERIFY";
  switch(a3)
  {
    case 1uLL:
      goto LABEL_10;
    case 2uLL:
      BOOL v6 = @"PAYMENT_CARD_STATE_ACTIVATING";
      goto LABEL_10;
    case 3uLL:
      if ([(PKPaymentApplication *)self->_paymentApplication state] == 7) {
        BOOL v6 = @"PAYMENT_CARD_STATE_SUSPENDED_LOSTMODE";
      }
      else {
        BOOL v6 = @"PAYMENT_CARD_STATE_SUSPENDED";
      }
      goto LABEL_10;
    case 4uLL:
      BOOL v6 = @"PAYMENT_CARD_STATE_DEACTIVATED";
LABEL_10:
      double v7 = PKLocalizedPaymentString(&v6->isa);
      break;
    default:
      double v7 = 0;
      break;
  }
  return v7;
}

- (void)_verifyButtonPressed:(id)a3
{
  id v4 = a3;
  CGRectEdge v5 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:[(PKPaymentVerificationController *)self->_verificationController context]];
  [(PKPaymentSetupDismissibleNavigationController *)v5 useStandardPlatformPresentationStyle];
  id v6 = objc_alloc(MEMORY[0x1E4F84BB8]);
  double v7 = [(PKPaymentVerificationController *)self->_verificationController webService];
  id v8 = (void *)[v6 initWithWebService:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:4 provisioningController:v8 groupsController:0];
  [v9 setIsFollowupProvisioning:1];
  objc_initWeak(&location, self);
  pass = self->_pass;
  verificationController = self->_verificationController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__PKPaymentPassTableCell__verifyButtonPressed___block_invoke;
  v13[3] = &unk_1E59CB010;
  objc_copyWeak(&v15, &location);
  CGFloat v12 = v5;
  CGFloat v14 = v12;
  +[PKProvisioningFlowBridge startVerificationFlowWithNavController:v12 context:v9 pass:pass verificationController:verificationController presentNavController:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __47__PKPaymentPassTableCell__verifyButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 162);
    [v3 requestPresentationOfViewController:*(void *)(a1 + 32) animated:1 completion:0];

    id WeakRetained = v4;
  }
}

- (void)_addButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained addButtonPressedForPaymentPass:self->_pass];
    id WeakRetained = v5;
  }
}

- (void)_configureMainLabelWithText:(id)a3
{
  id v4 = a3;
  mainLabel = self->_mainLabel;
  id v11 = v4;
  if (!mainLabel)
  {
    id v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v7 = self->_mainLabel;
    self->_mainLabel = v6;

    id v8 = self->_mainLabel;
    id v9 = [(id)objc_opt_class() titleFont];
    [(UILabel *)v8 setFont:v9];

    id v4 = v11;
    mainLabel = self->_mainLabel;
  }
  [(UILabel *)mainLabel setText:v4];
  [(UILabel *)self->_mainLabel sizeToFit];
  CGFloat v10 = [(PKPaymentPassTableCell *)self contentView];
  [v10 addSubview:self->_mainLabel];
}

- (void)_configureActionButtonWithTitle:(id)a3
{
  id v4 = a3;
  self->_showActionButton = 1;
  actionButton = self->_actionButton;
  id v11 = v4;
  if (!actionButton)
  {
    id v6 = (UIControl *)objc_alloc_init(getSKUIItemOfferButtonClass());
    double v7 = self->_actionButton;
    self->_actionButton = v6;

    id v8 = self->_actionButton;
    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIControl *)v8 setBackgroundColor:v9];

    id v4 = v11;
    actionButton = self->_actionButton;
  }
  [(UIControl *)actionButton setTitle:v4];
  [(UIControl *)self->_actionButton sizeToFit];
  -[UIControl _setTouchInsets:](self->_actionButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  CGFloat v10 = [(PKPaymentPassTableCell *)self contentView];
  [v10 addSubview:self->_actionButton];
}

- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  subTextLabel = self->_subTextLabel;
  if (subTextLabel)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  CGFloat v10 = self->_subTextLabel;
  self->_subTextLabel = v9;

  id v11 = self->_subTextLabel;
  CGFloat v12 = [(id)objc_opt_class() subTitleFont];
  [(UILabel *)v11 setFont:v12];

  subTextLabel = self->_subTextLabel;
  if (v6)
  {
LABEL_3:
    [(UILabel *)subTextLabel setColor:v6];
    subTextLabel = self->_subTextLabel;
  }
LABEL_4:
  [(UILabel *)subTextLabel setText:v13];
  [(UILabel *)self->_subTextLabel sizeToFit];
  id v8 = [(PKPaymentPassTableCell *)self contentView];
  [v8 addSubview:self->_subTextLabel];
}

- (void)_configureCellWithSpecifier:(id)a3
{
  id v17 = a3;
  id v4 = [(PKPaymentPass *)self->_pass localizedDescription];
  [(PKPaymentPassTableCell *)self _configureMainLabelWithText:v4];

  [(PKPaymentPassTableCell *)self setAccessoryType:1];
  if (self->_showSubTitle)
  {
    id v5 = [v17 objectForKeyedSubscript:@"pkCustomSubTitle"];
    uint64_t v6 = [v5 length];

    if (v6) {
      [v17 objectForKeyedSubscript:@"pkCustomSubTitle"];
    }
    else {
    double v7 = PKSanitizedPrimaryAccountRepresentationForPass();
    }
    id v8 = [v17 objectForKeyedSubscript:@"pkCustomSubTitleColor"];
    [(PKPaymentPassTableCell *)self _configureSubTextLabelWithText:v7 textColor:v8];

    [(PKPaymentPassTableCell *)self updateSubtitleForTransitProperties];
  }
  if (self->_showAddButton)
  {
    id v9 = PKLocalizedString(&cfstr_IngestionAdd.isa);
    CGFloat v10 = objc_msgSend(v9, "pk_uppercaseStringForPreferredLocale");
    [(PKPaymentPassTableCell *)self _configureActionButtonWithTitle:v10];

    actionButton = self->_actionButton;
    CGFloat v12 = [v17 objectForKeyedSubscript:@"pkActionButtonEnabled"];
    -[UIControl setEnabled:](actionButton, "setEnabled:", [v12 BOOLValue]);

    [(UIControl *)self->_actionButton addTarget:self action:sel__addButtonPressed_ forControlEvents:64];
    [(PKPaymentPassTableCell *)self setAccessoryType:0];
  }
  if (self->_showState)
  {
    id v13 = [(PKPaymentPassTableCell *)self _stringForPassState:[(PKPaymentPass *)self->_pass activationState]];
    CGFloat v14 = v13;
    if (self->_verificationController)
    {
      [(PKPaymentPassTableCell *)self _configureActionButtonWithTitle:v13];
      [(UIControl *)self->_actionButton addTarget:self action:sel__verifyButtonPressed_ forControlEvents:64];
      [(PKPaymentPassTableCell *)self setAccessoryType:0];
      [(UIControl *)self->_actionButton setEnabled:[(PKPaymentVerificationController *)self->_verificationController shouldDisabledVerificationButton] ^ 1];
    }
    else if ([v13 length])
    {
      id v15 = [(PKPaymentPassTableCell *)self tintColor];
      [(PKPaymentPassTableCell *)self _configureSubTextLabelWithText:v14 textColor:v15];
    }
  }
  if (self->_settingsContext == 1)
  {
    double v16 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v16, self);
  }
}

- (void)showActivitySpinner:(BOOL)a3
{
  if (self->_showAddButton)
  {
    self->_showSpinner = a3;
    self->_showActionButton = !a3;
    spinner = self->_spinner;
    if (!a3)
    {
      [(UIActivityIndicatorView *)spinner removeFromSuperview];
      id v8 = [(PKPaymentPassTableCell *)self contentView];
      [v8 addSubview:self->_actionButton];
    }
    else
    {
      if (!spinner)
      {
        id v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        uint64_t v6 = self->_spinner;
        self->_spinner = v5;
      }
      double v7 = [(PKPaymentPassTableCell *)self contentView];
      [v7 addSubview:self->_spinner];

      [(UIControl *)self->_actionButton removeFromSuperview];
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    [(PKPaymentPassTableCell *)self setNeedsLayout];
  }
}

- (void)disableAddButton
{
  if (self->_showAddButton)
  {
    actionButton = self->_actionButton;
    if (actionButton) {
      [(UIControl *)actionButton setEnabled:0];
    }
  }
}

- (void)updateSubtitleForTransitProperties
{
  id v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F78]);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v11 = [WeakRetained objectForKeyedSubscript:@"pkTransitServerBalance"];

  if ([v11 hasBalanceContent]
    && (!self->_showState
     || [(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateActivated)
    && self->_showSubTitle)
  {
    id v5 = objc_loadWeakRetained(v3);
    uint64_t v6 = [v5 objectForKeyedSubscript:@"pkCustomSubTitle"];
    if ([v6 length])
    {
    }
    else
    {
      double v7 = [(PKPaymentPass *)self->_pass paymentPass];
      int v8 = [v7 isStoredValuePass];

      if (v8)
      {
        subTextLabel = self->_subTextLabel;
        CGFloat v10 = [v11 primaryDisplayableBalance];
        [(UILabel *)subTextLabel setText:v10];

        [(UILabel *)self->_subTextLabel sizeToFit];
        [(PKPaymentPassTableCell *)self setNeedsLayout];
      }
    }
  }
}

- (void)updateSubtitle
{
  id v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F78]);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v7 = [WeakRetained objectForKeyedSubscript:@"pkCustomSubTitle"];

  id v5 = objc_loadWeakRetained(v3);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"pkCustomSubTitleColor"];

  if ([v7 length])
  {
    [(UILabel *)self->_subTextLabel setText:v7];
    if (v6) {
      [(UILabel *)self->_subTextLabel setTextColor:v6];
    }
    [(UILabel *)self->_subTextLabel sizeToFit];
    [(PKPaymentPassTableCell *)self setNeedsLayout];
  }
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F78]));
  char v6 = [WeakRetained isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKPaymentPassTableCell;
    [(PSTableCell *)&v17 setSpecifier:v4];
    id v7 = [v4 objectForKeyedSubscript:@"pkPass"];
    int v8 = [v4 objectForKeyedSubscript:@"pkSnapshotPassView"];
    id v9 = [v4 objectForKeyedSubscript:@"pkShowAddButton"];
    self->_showAddButton = [v9 BOOLValue];

    CGFloat v10 = [v4 objectForKeyedSubscript:@"pkShowState"];
    self->_showState = [v10 BOOLValue];

    id v11 = [v4 objectForKeyedSubscript:@"pkShowSubTitle"];
    self->_showSubTitle = [v11 BOOLValue];

    CGFloat v12 = [v4 objectForKeyedSubscript:@"pkShowFullSeparatorInset"];
    self->_showFullSeparatorInset = [v12 BOOLValue];

    id v13 = [v4 target];
    objc_storeWeak((id *)&self->_delegate, v13);

    CGFloat v14 = [v4 objectForKeyedSubscript:@"pkSettingsContext"];
    self->_settingsContext = (int)[v14 intValue];

    id v15 = [v4 objectForKeyedSubscript:@"pkVerificationController"];
    verificationController = self->_verificationController;
    self->_verificationController = v15;

    [(PKPaymentVerificationController *)self->_verificationController setDelegate:self];
    [(PKPaymentPassTableCell *)self setPass:v7 passView:v8];
    [(PKPaymentPassTableCell *)self _configureCellWithSpecifier:v4];
  }
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (BOOL)showSubTitle
{
  return self->_showSubTitle;
}

- (void)setShowSubTitle:(BOOL)a3
{
  self->_showSubTitle = a3;
}

- (BOOL)showAddButton
{
  return self->_showAddButton;
}

- (void)setShowAddButton:(BOOL)a3
{
  self->_showAddButton = a3;
}

- (PKPaymentPassTableCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPassTableCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (UILabel)subTextLabel
{
  return self->_subTextLabel;
}

- (UIControl)actionButton
{
  return self->_actionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subTextLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_verificationViewController);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cardSnapshotMask, 0);
  objc_storeStrong((id *)&self->_cardSnapshotView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_snapshotSpinner, 0);

  objc_storeStrong((id *)&self->_paymentApplication, 0);
}

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentPassTableCell *)self mainLabel];
  char v6 = [v4 textColor];
  [v5 setTextColor:v6];

  id v7 = [(PKPaymentPassTableCell *)self subTextLabel];
  int v8 = [v4 altTextColor];
  [v7 setTextColor:v8];

  id v9 = [v4 buttonTextColor];

  [(PKPaymentPassTableCell *)self setTintColor:v9];
}

@end