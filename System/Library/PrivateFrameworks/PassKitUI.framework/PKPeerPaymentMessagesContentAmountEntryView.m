@interface PKPeerPaymentMessagesContentAmountEntryView
- (BOOL)_isPresentedAsSheet;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3 progressToExpanded:(double)a4 sizeCategory:(unint64_t)a5 isTemplate:(BOOL)a6;
- (PKPeerPaymentMessagesAmountStepperView)amountStepperView;
- (PKPeerPaymentMessagesContentAmountEntryView)initWithFrame:(CGRect)a3;
- (PKPeerPaymentMessagesMultiActionView)actionView;
- (PKPeerPaymentMessagesNumberPadView)numberPadView;
- (UILabel)balanceLabel;
- (UITextField)memoField;
- (double)navigationBarHeight;
- (double)percentExpanded;
- (id)memoChangedHandler;
- (int64_t)presentationContext;
- (unint64_t)_style;
- (unint64_t)sizeCategory;
- (unint64_t)subtitleType;
- (void)_setActiveSubtitleVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setNumberPadVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setShowKeypadHintVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setSubtitleType:(unint64_t)a3 updateLayout:(BOOL)a4;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setMemoChangedHandler:(id)a3;
- (void)setNavigationBarHeight:(double)a3;
- (void)setPercentExpanded:(double)a3;
- (void)setPresentationContext:(int64_t)a3;
- (void)setSubtitleType:(unint64_t)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIsExpansionSupported;
- (void)updateIsKeypadSupported;
@end

@implementation PKPeerPaymentMessagesContentAmountEntryView

- (PKPeerPaymentMessagesContentAmountEntryView)initWithFrame:(CGRect)a3
{
  v77[1] = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
  v3 = -[PKPeerPaymentMessagesContentAmountEntryView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = [(PKPeerPaymentMessagesContentAmountEntryView *)v3 traitCollection];
    v5 = [v4 preferredContentSizeCategory];
    v3->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;

    v3->_presentationContext = 1;
    uint64_t v65 = [(PKPeerPaymentMessagesContentAmountEntryView *)v3 sizeCategory];
    id v6 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v7 = (void *)[v6 initWithType:*MEMORY[0x1E4F3A0D0]];
    [v7 setName:@"gaussianBlur"];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = v3->_containerView;
    v3->_containerView = v8;

    [(PKPeerPaymentMessagesContentAmountEntryView *)v3 addSubview:v3->_containerView];
    v10 = v3->_containerView;
    v11 = [[PKPeerPaymentMessagesAmountStepperView alloc] initWithSizeCategory:v65];
    amountStepperView = v3->_amountStepperView;
    v3->_amountStepperView = v11;

    [(UIView *)v10 addSubview:v3->_amountStepperView];
    int v13 = PKIsPad();
    v14 = (NSString *)*MEMORY[0x1E4FB28C8];
    if (v13) {
      v15 = (NSString *)*MEMORY[0x1E4FB28C8];
    }
    else {
      v15 = (NSString *)*MEMORY[0x1E4FB28F0];
    }
    v16 = (NSString *)*MEMORY[0x1E4FB27B8];
    v17 = PKFontForDefaultDesign(v15, (NSString *)*MEMORY[0x1E4FB27B8]);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    balanceLabel = v3->_balanceLabel;
    v3->_balanceLabel = v18;

    [(UILabel *)v3->_balanceLabel setTextAlignment:1];
    v20 = v3->_balanceLabel;
    v21 = +[PKPeerPaymentTheme secondaryTextColor];
    [(UILabel *)v20 setTextColor:v21];

    [(UILabel *)v3->_balanceLabel setFont:v17];
    [(UILabel *)v3->_balanceLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->_balanceLabel setAccessibilityIdentifier:@"AppleCash.Balance.Label"];
    v22 = [(UILabel *)v3->_balanceLabel layer];
    v77[0] = v7;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
    [v22 setFilters:v23];

    [(UIView *)v10 addSubview:v3->_balanceLabel];
    v24 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    memoField = v3->_memoField;
    v3->_memoField = v24;

    [(UITextField *)v3->_memoField setTextAlignment:1];
    v26 = v3->_memoField;
    v27 = +[PKPeerPaymentTheme primaryTextColor];
    [(UITextField *)v26 setTextColor:v27];

    v28 = v3->_memoField;
    v29 = PKLocalizedNearbyPeerPaymentString(&cfstr_NearbyAmountEn_2.isa);
    [(UITextField *)v28 setPlaceholder:v29];

    v30 = v3->_memoField;
    v31 = PKFontForDefaultDesign(v14, v16);
    [(UITextField *)v30 setFont:v31];

    [(UITextField *)v3->_memoField setReturnKeyType:9];
    [(UITextField *)v3->_memoField setDelegate:v3];
    v32 = [(UITextField *)v3->_memoField layer];
    v76 = v7;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    [v32 setFilters:v33];

    [(UITextField *)v3->_memoField setAlpha:0.0];
    [(UITextField *)v3->_memoField addTarget:v3 action:sel_textFieldDidChange_ forControlEvents:0x20000];
    [(UITextField *)v3->_memoField setAccessibilityIdentifier:*MEMORY[0x1E4F856C0]];
    [(UIView *)v10 addSubview:v3->_memoField];
    [(PKPeerPaymentMessagesContentAmountEntryView *)v3 _setSubtitleType:0 updateLayout:0];
    if (PKIsPad())
    {
      v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      showKeypadHint = v3->_showKeypadHint;
      v3->_showKeypadHint = v34;

      [(UILabel *)v3->_showKeypadHint setTextAlignment:1];
      v36 = v3->_showKeypadHint;
      v37 = +[PKPeerPaymentTheme secondaryTextColor];
      [(UILabel *)v36 setTextColor:v37];

      [(UILabel *)v3->_showKeypadHint setFont:v17];
      v38 = v3->_showKeypadHint;
      v39 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_15.isa);
      [(UILabel *)v38 setText:v39];

      [(UIView *)v10 addSubview:v3->_showKeypadHint];
    }
    v40 = (void *)MEMORY[0x1E4FB14D0];
    v41 = (void *)MEMORY[0x1E4FB13F0];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke;
    v68[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v69, &location);
    v42 = [v41 actionWithHandler:v68];
    uint64_t v43 = [v40 systemButtonWithPrimaryAction:v42];
    showKeypadButton = v3->_showKeypadButton;
    v3->_showKeypadButton = (UIButton *)v43;

    v45 = v3->_showKeypadButton;
    v46 = +[PKPeerPaymentTheme secondaryTextColor];
    [(UIButton *)v45 setTitleColor:v46 forState:0];

    v47 = v3->_showKeypadButton;
    v48 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIButton *)v47 setBackgroundColor:v48];

    id v49 = objc_alloc(MEMORY[0x1E4F28B18]);
    v50 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_16.isa);
    uint64_t v74 = *MEMORY[0x1E4FB06F8];
    v75 = v17;
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    v52 = (void *)[v49 initWithString:v50 attributes:v51];

    [(UIButton *)v3->_showKeypadButton setAttributedTitle:v52 forState:0];
    v53 = [(UIButton *)v3->_showKeypadButton layer];
    v73 = v7;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    [v53 setFilters:v54];

    [(UIButton *)v3->_showKeypadButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
    [(UIView *)v10 addSubview:v3->_showKeypadButton];
    v55 = [[PKPeerPaymentMessagesNumberPadView alloc] initWithSizeCategory:v65];
    numberPadView = v3->_numberPadView;
    v3->_numberPadView = v55;

    v57 = [(PKPeerPaymentMessagesNumberPadView *)v3->_numberPadView layer];
    [v57 setMasksToBounds:0];

    v58 = [(PKPeerPaymentMessagesNumberPadView *)v3->_numberPadView layer];
    v72 = v7;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    [v58 setFilters:v59];

    [(UIView *)v10 addSubview:v3->_numberPadView];
    v60 = v3->_numberPadView;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke_2;
    v66[3] = &unk_1E59D3C60;
    objc_copyWeak(&v67, &location);
    [(PKPeerPaymentMessagesNumberPadView *)v60 setActionHandler:v66];
    v61 = objc_alloc_init(PKPeerPaymentMessagesMultiActionView);
    actionView = v3->_actionView;
    v3->_actionView = v61;

    v63 = [(PKPeerPaymentMessagesMultiActionView *)v3->_actionView layer];
    [v63 setMasksToBounds:0];

    [(PKPeerPaymentMessagesContentAmountEntryView *)v3 addSubview:v3->_actionView];
    [(PKPeerPaymentMessagesContentAmountEntryView *)v3 _setNumberPadVisible:1 animated:0];
    [(PKPeerPaymentMessagesContentAmountEntryView *)v3 _setActiveSubtitleVisible:0 animated:0];
    [(PKPeerPaymentMessagesContentAmountEntryView *)v3 _setShowKeypadHintVisible:1 animated:0];
    [(PKPeerPaymentMessagesContentAmountEntryView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];
    objc_destroyWeak(&v67);

    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    uint64_t v2 = [WeakRetained[61] amountTappedHandler];
    v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }

    WeakRetained = v4;
  }
}

void __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[61] handleNumberPadAction:a3];
}

- (unint64_t)_style
{
  return self->_percentExpanded >= 0.75;
}

- (unint64_t)sizeCategory
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(PKPeerPaymentMessagesContentAmountEntryView *)self _isPresentedAsSheet])
  {
    v11 = [(PKPeerPaymentMessagesContentAmountEntryView *)self window];
    v12 = [v11 _rootSheetPresentationController];

    int v13 = [v12 _detentValues];
    if ([v13 count] != 2)
    {
      v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Root sheet controller did not contain expected detent values. Actual: %@. Defaulting layout to small", buf, 0xCu);
      }

      return 0;
    }
    v14 = [v13 firstObject];
    [v14 floatValue];
    double v10 = v15;
  }
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  if (CGRectEqualToRect(self->_lastMaxBounds, v33)) {
    return self->_sizeCategory;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t result = [&unk_1EF2BA008 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (result)
  {
    unint64_t v17 = result;
    uint64_t v18 = *(void *)v25;
    while (2)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(&unk_1EF2BA008);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
        -[PKPeerPaymentMessagesContentAmountEntryView _layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:](self, "_layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:", [v20 integerValue], 1, v4, v6, v8, v10, 1.0);
        double v22 = v21;
        v32.origin.x = v4;
        v32.origin.y = v6;
        v32.size.width = v8;
        v32.size.height = v10;
        if (v22 <= CGRectGetHeight(v32))
        {
          unint64_t result = [v20 integerValue];
          goto LABEL_19;
        }
        ++v19;
      }
      while (v17 != v19);
      unint64_t result = [&unk_1EF2BA008 countByEnumeratingWithState:&v24 objects:v28 count:16];
      unint64_t v17 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
LABEL_19:
  self->_lastMaxBounds.origin.x = v4;
  self->_lastMaxBounds.origin.y = v6;
  self->_lastMaxBounds.size.width = v8;
  self->_lastMaxBounds.size.height = v10;
  self->_sizeCategory = result;
  return result;
}

- (void)updateIsExpansionSupported
{
  double v3 = [(PKPeerPaymentMessagesContentAmountEntryView *)self window];
  id v8 = [v3 windowScene];

  if (v8)
  {
    BOOL v4 = [(PKPeerPaymentMessagesContentAmountEntryView *)self _isPresentedAsSheet];
    BOOL v5 = !PKIsPhone()
      || (unint64_t)([v8 interfaceOrientation] - 5) < 0xFFFFFFFFFFFFFFFELL;
    int v6 = v4 && v5;
    if (self->_isExpansionSupported != v6)
    {
      self->_isExpansionSupported = v6;
      CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_lastMaxBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_lastMaxBounds.size = v7;
      [(PKPeerPaymentMessagesContentAmountEntryView *)self setNeedsLayout];
    }
  }
}

- (void)updateIsKeypadSupported
{
  double v3 = [(PKPeerPaymentMessagesContentAmountEntryView *)self window];
  id v6 = [v3 windowScene];

  if (v6)
  {
    BOOL v4 = !PKIsPhone()
      || (unint64_t)([v6 interfaceOrientation] - 5) < 0xFFFFFFFFFFFFFFFELL;
    if (self->_isKeypadSupported != v4)
    {
      self->_isKeypadSupported = v4;
      CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_lastMaxBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_lastMaxBounds.size = v5;
      [(PKPeerPaymentMessagesContentAmountEntryView *)self setNeedsLayout];
    }
  }
}

- (void)setPercentExpanded:(double)a3
{
  if (self->_percentExpanded != a3)
  {
    self->_percentExpanded = a3;
    [(PKPeerPaymentMessagesContentAmountEntryView *)self setNeedsLayout];
  }
}

- (void)setPresentationContext:(int64_t)a3
{
  if (!a3)
  {
    BOOL v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGSize v5 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Unspecified semantic presentation context, defaulting to normal", v5, 2u);
    }

    a3 = 1;
  }
  if (self->_presentationContext != a3)
  {
    self->_presentationContext = a3;
    [(PKPeerPaymentMessagesContentAmountEntryView *)self updateIsExpansionSupported];
    [(PKPeerPaymentMessagesContentAmountEntryView *)self setNeedsLayout];
  }
}

- (void)setSubtitleType:(unint64_t)a3
{
}

- (void)_setSubtitleType:(unint64_t)a3 updateLayout:(BOOL)a4
{
  BOOL v4 = a4;
  p_activeSubtitleView = &self->_activeSubtitleView;
  activeSubtitleView = self->_activeSubtitleView;
  if (activeSubtitleView && self->_subtitleType == a3) {
    return;
  }
  [(UIView *)activeSubtitleView setAlpha:0.0];
  double v9 = &OBJC_IVAR___PKPeerPaymentMessagesContentAmountEntryView__balanceLabel;
  self->_subtitleType = a3;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_7;
    }
    double v9 = &OBJC_IVAR___PKPeerPaymentMessagesContentAmountEntryView__memoField;
  }
  objc_storeStrong((id *)p_activeSubtitleView, *(id *)((char *)&self->super.super.super.isa + *v9));
LABEL_7:
  [(UIView *)*p_activeSubtitleView setAlpha:1.0];
  if (v4)
  {
    [(PKPeerPaymentMessagesContentAmountEntryView *)self setNeedsLayout];
  }
}

- (BOOL)_isPresentedAsSheet
{
  return self->_presentationContext == 2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
  id v4 = a3;
  [(PKPeerPaymentMessagesContentAmountEntryView *)&v8 traitCollectionDidChange:v4];
  CGSize v5 = [(PKPeerPaymentMessagesContentAmountEntryView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  CGSize v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v7 isEqualToString:v6];
  if ((v4 & 1) == 0)
  {
    self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;
    [(PKPeerPaymentMessagesContentAmountEntryView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
  [(PKPeerPaymentMessagesContentAmountEntryView *)&v15 layoutSubviews];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double percentExpanded = self->_percentExpanded;
  unint64_t v12 = [(PKPeerPaymentMessagesContentAmountEntryView *)self sizeCategory];
  if (PKIsPad() && self->_presentationContext == 3)
  {
    -[PKPeerPaymentMessagesContentAmountEntryView _layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:](self, "_layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:", v12, 1, v4, v6, v8, v10, 1.0);
    double v14 = v13;
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    if (CGRectGetHeight(v16) < v14) {
      double percentExpanded = 0.0;
    }
    else {
      double percentExpanded = 1.0;
    }
  }
  -[PKPeerPaymentMessagesContentAmountEntryView _layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:](self, "_layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:", v12, 0, v4, v6, v8, v10, percentExpanded);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 progressToExpanded:(double)a4 sizeCategory:(unint64_t)a5 isTemplate:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&slice, 0, sizeof(slice));
  CGRect remainder = a3;
  if (!a6)
  {
    -[PKPeerPaymentMessagesMultiActionView setStyle:](self->_actionView, "setStyle:", a4 >= 0.75, 0.75);
    [(PKPeerPaymentMessagesMultiActionView *)self->_actionView setUsesFlexibleButtonWidth:PKIsPad() ^ 1];
    [(PKPeerPaymentMessagesAmountStepperView *)self->_amountStepperView setStyle:a4 >= 0.75];
    [(PKPeerPaymentMessagesAmountStepperView *)self->_amountStepperView setSizeCategory:a5];
    [(PKPeerPaymentMessagesNumberPadView *)self->_numberPadView setStyle:a4 >= 0.75];
    [(PKPeerPaymentMessagesNumberPadView *)self->_numberPadView setSizeCategory:a5];
    double v14 = 24.0;
    if (![(PKPeerPaymentMessagesMultiActionView *)self->_actionView usesFlexibleButtonWidth])
    {
      v67.origin.CGFloat x = x;
      v67.origin.CGFloat y = y;
      v67.size.double width = width;
      v67.size.double height = height;
      double v15 = CGRectGetWidth(v67);
      -[PKPeerPaymentMessagesMultiActionView sizeThatFits:](self->_actionView, "sizeThatFits:", width + -48.0, height);
      double v14 = (v15 - v16) * 0.5;
    }
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.double width = width;
    v68.size.double height = height;
    CGRectDivide(v68, &slice, &remainder, v14, CGRectMinXEdge);
    CGRectDivide(remainder, &slice, &remainder, v14, CGRectMaxXEdge);
  }
  int v17 = PKIsPad();
  BOOL v18 = [(PKPeerPaymentMessagesContentAmountEntryView *)self _isPresentedAsSheet];
  if (((a5 == 0) & v17) != 0) {
    double v19 = 0.0;
  }
  else {
    double v19 = 16.0;
  }
  if (!a6) {
    CGRectDivide(remainder, &slice, &remainder, v19, CGRectMaxYEdge);
  }
  double v60 = v19;
  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:forStyle:](self->_actionView, "sizeThatFits:forStyle:", 0, remainder.size.width, remainder.size.height);
  double v21 = v20;
  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:forStyle:](self->_actionView, "sizeThatFits:forStyle:", 1, remainder.size.width, remainder.size.height);
  double v23 = v21 + (v22 - v21) * a4;
  if (!a6)
  {
    CGRectDivide(remainder, &slice, &remainder, v23, CGRectMaxYEdge);
    -[PKPeerPaymentMessagesMultiActionView setFrame:](self->_actionView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  if (a5 - 1 < 2)
  {
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.double width = width;
    v70.size.double height = height;
    double v25 = CGRectGetHeight(v70);
    if (!v17)
    {
      double v26 = 0.1;
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (a5 == 3)
  {
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.double width = width;
    v71.size.double height = height;
    double v25 = CGRectGetHeight(v71);
    double v26 = 0.12;
    goto LABEL_21;
  }
  double v24 = 0.0;
  if (!a5 && (v17 & 1) == 0)
  {
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = y;
    v69.size.double width = width;
    v69.size.double height = height;
    double v25 = CGRectGetHeight(v69);
LABEL_18:
    double v26 = 0.04;
LABEL_21:
    double v24 = v25 * v26;
  }
  double v59 = v23;
  CGFloat v61 = x;
  double v62 = a4;
  double v27 = v24 * a4;
  if (!a6) {
    CGRectDivide(remainder, &slice, &remainder, v27, CGRectMinYEdge);
  }
  double v58 = v27;
  -[UIView setFrame:](self->_containerView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  remainder.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
  +[PKPeerPaymentMessagesAmountStepperView sizeThatFits:forSizeCategory:](PKPeerPaymentMessagesAmountStepperView, "sizeThatFits:forSizeCategory:", a5, remainder.size.width, remainder.size.height);
  CGFloat v29 = v28;
  -[UIView sizeThatFits:](self->_activeSubtitleView, "sizeThatFits:", remainder.size.width, remainder.size.height);
  uint64_t v31 = v30;
  double v33 = v32;
  uint64_t v34 = 54;
  if (v18) {
    uint64_t v34 = 55;
  }
  uint64_t v35 = OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v34];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "sizeThatFits:", remainder.size.width, remainder.size.height);
  if (v33 <= v36) {
    CGFloat v37 = v36;
  }
  else {
    CGFloat v37 = v33;
  }
  if (!a6)
  {
    uint64_t v57 = v31;
    PKSizeAlignedInRect();
    CGRectDivide(remainder, &slice, &remainder, (1.0 - v62) * v38, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v29, CGRectMinYEdge);
    -[PKPeerPaymentMessagesAmountStepperView setFrame:](self->_amountStepperView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(remainder, &slice, &remainder, v37, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIView setFrame:](self->_activeSubtitleView, "setFrame:");
    v39 = *(Class *)((char *)&self->super.super.super.isa + v35);
    PKSizeAlignedInRect();
    objc_msgSend(v39, "setFrame:");
  }
  BOOL isExpansionSupported = self->_isExpansionSupported;
  BOOL v41 = !self->_isExpansionSupported && v62 < 0.75;
  double v42 = 0.0;
  double v43 = v29 + 0.0 + v37;
  double v44 = 0.001;
  if (!v41 && self->_isKeypadSupported)
  {
    +[PKPeerPaymentMessagesNumberPadView referenceSizeForSizeCategory:a5];
    if (isExpansionSupported)
    {
      double v42 = v45 * v62;
      if (v62 >= 0.001) {
        double v44 = v62;
      }
      else {
        double v44 = 0.001;
      }
    }
    else
    {
      if (v62 >= 0.75) {
        double v42 = v45;
      }
      else {
        double v42 = 0.0;
      }
      if (v62 >= 0.75) {
        double v44 = 1.0;
      }
      else {
        double v44 = 0.001;
      }
    }
    double v46 = v42;
    if (!a6) {
      double v46 = remainder.size.height;
    }
    double v43 = v43 + v46;
  }
  if (!a6)
  {
    CGRectDivide(remainder, &slice, &remainder, v42, CGRectMinYEdge);
    UIRectCenteredYInRect();
    slice.origin.CGFloat x = v47;
    slice.origin.CGFloat y = v48;
    slice.size.double width = v49;
    slice.size.double height = v50;
    numberPadView = self->_numberPadView;
    CGAffineTransformMakeScale(&v63, 1.0, v44);
    [(PKPeerPaymentMessagesNumberPadView *)numberPadView setTransform:&v63];
    -[PKPeerPaymentMessagesNumberPadView setFrame:](self->_numberPadView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    BOOL v52 = v62 >= 0.75 && self->_isKeypadSupported;
    BOOL v53 = v62 >= 0.75;
    BOOL v54 = [(PKPeerPaymentMessagesContentAmountEntryView *)self _isAnimationAllowed];
    [(PKPeerPaymentMessagesContentAmountEntryView *)self _setNumberPadVisible:v52 animated:v54];
    [(PKPeerPaymentMessagesContentAmountEntryView *)self _setActiveSubtitleVisible:v53 animated:v54];
    [(PKPeerPaymentMessagesContentAmountEntryView *)self _setShowKeypadHintVisible:v62 < 0.75 animated:v54];
    [(PKPeerPaymentMessagesMultiActionView *)self->_actionView setCenterButtonVisible:v53 animated:v54];
    [(PKPeerPaymentMessagesAmountStepperView *)self->_amountStepperView setPlusMinusVisible:v52 ^ 1 animated:v54];
  }
  v72.origin.CGFloat x = v61;
  v72.origin.CGFloat y = y;
  v72.size.double width = width;
  v72.size.double height = height;
  double v55 = CGRectGetWidth(v72);
  double v56 = v58 + v60 + v59 + v43;
  result.double height = v56;
  result.double width = v55;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetHeight(a3);
  [(PKPeerPaymentMessagesContentAmountEntryView *)self bounds];
  if (v8 - CGRectGetHeight(v12) == 100.0)
  {
    double v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring frame update. (<rdar://problem/31900645>)", buf, 2u);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
    -[PKPeerPaymentMessagesContentAmountEntryView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  }
}

- (void)_setNumberPadVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v6 = [(PKPeerPaymentMessagesNumberPadView *)self->_numberPadView layer];
  [v6 opacity];
  if (*(float *)&v7 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        id v18 = 0;
        id v19 = 0;
        ContentViewVisibilityAnimations(0, &v19, &v18, 0);
        id v8 = v19;
        id v9 = v18;
        id v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v8);
        id v11 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);

LABEL_6:
        LODWORD(v7) = 1.0;
        [v6 setOpacity:v7];
        [v6 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
        goto LABEL_9;
      }
      id v16 = 0;
      id v17 = 0;
      ContentViewVisibilityAnimations(&v17, 0, 0, &v16);
      id v12 = v17;
      id v13 = v16;
      id v14 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v13);
      id v15 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v12);
    }
    else if (v5)
    {
      goto LABEL_6;
    }
    [v6 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    [v6 setOpacity:0.0];
  }
LABEL_9:
}

- (void)_setActiveSubtitleVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v6 = [(UIView *)self->_activeSubtitleView layer];
  [v6 opacity];
  if (*(float *)&v7 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        id v18 = 0;
        id v19 = 0;
        ContentViewVisibilityAnimations(0, &v19, &v18, 0);
        id v8 = v19;
        id v9 = v18;
        id v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v8);
        id v11 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);

LABEL_6:
        LODWORD(v7) = 1.0;
        [v6 setOpacity:v7];
        [v6 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
        goto LABEL_9;
      }
      id v16 = 0;
      id v17 = 0;
      ContentViewVisibilityAnimations(&v17, 0, 0, &v16);
      id v12 = v17;
      id v13 = v16;
      id v14 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v12);
      id v15 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v13);
    }
    else if (v5)
    {
      goto LABEL_6;
    }
    [v6 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    [v6 setOpacity:0.0];
  }
LABEL_9:
}

- (void)_setShowKeypadHintVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(PKPeerPaymentMessagesContentAmountEntryView *)self _isPresentedAsSheet];
  if (v7) {
    uint64_t v8 = 55;
  }
  else {
    uint64_t v8 = 54;
  }
  if (v7) {
    uint64_t v9 = 54;
  }
  else {
    uint64_t v9 = 55;
  }
  id v10 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v8]) layer];
  id v11 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v9]) layer];
  [v11 setHidden:1];

  [v10 setHidden:0];
  [v10 opacity];
  if (*(float *)&v12 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        id v23 = 0;
        id v24 = 0;
        ContentViewVisibilityAnimations(0, &v24, &v23, 0);
        id v13 = v24;
        id v14 = v23;
        id v15 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v13);
        id v16 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v14);

LABEL_12:
        LODWORD(v12) = 1.0;
        [v10 setOpacity:v12];
        [v10 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
        goto LABEL_15;
      }
      id v21 = 0;
      id v22 = 0;
      ContentViewVisibilityAnimations(&v22, 0, 0, &v21);
      id v17 = v22;
      id v18 = v21;
      id v19 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v17);
      id v20 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v18);
    }
    else if (v5)
    {
      goto LABEL_12;
    }
    [v10 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    [v10 setOpacity:0.0];
  }
LABEL_15:
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  [v4 resignFirstResponder];
  memoChangedHandler = (void (**)(id, void *))self->_memoChangedHandler;
  if (memoChangedHandler)
  {
    double v6 = [v4 text];
    memoChangedHandler[2](memoChangedHandler, v6);
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  numberPadView = self->_numberPadView;
  uint64_t v6 = 0;
  _PKViewSetAlphaAnimated(numberPadView, 0, (double *)&v6, 0.3, 0.0);
  BOOL v5 = self->_numberPadView;

  [(PKPeerPaymentMessagesNumberPadView *)v5 setUserInteractionEnabled:0];
}

- (void)textFieldDidEndEditing:(id)a3
{
  numberPadView = self->_numberPadView;
  uint64_t v6 = 0;
  _PKViewSetAlphaAnimated(numberPadView, 0, (double *)&v6, 1.0, 0.0);
  BOOL v5 = self->_numberPadView;

  [(PKPeerPaymentMessagesNumberPadView *)v5 setUserInteractionEnabled:1];
}

- (void)textFieldDidChange:(id)a3
{
  memoChangedHandler = (void (**)(id, id))self->_memoChangedHandler;
  if (memoChangedHandler)
  {
    id v4 = [a3 text];
    memoChangedHandler[2](memoChangedHandler, v4);
  }
}

- (PKPeerPaymentMessagesAmountStepperView)amountStepperView
{
  return self->_amountStepperView;
}

- (PKPeerPaymentMessagesNumberPadView)numberPadView
{
  return self->_numberPadView;
}

- (PKPeerPaymentMessagesMultiActionView)actionView
{
  return self->_actionView;
}

- (UILabel)balanceLabel
{
  return self->_balanceLabel;
}

- (UITextField)memoField
{
  return self->_memoField;
}

- (id)memoChangedHandler
{
  return self->_memoChangedHandler;
}

- (void)setMemoChangedHandler:(id)a3
{
}

- (double)percentExpanded
{
  return self->_percentExpanded;
}

- (double)navigationBarHeight
{
  return self->_navigationBarHeight;
}

- (void)setNavigationBarHeight:(double)a3
{
  self->_navigationBarHeight = a3;
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (unint64_t)subtitleType
{
  return self->_subtitleType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_memoChangedHandler, 0);
  objc_storeStrong((id *)&self->_memoField, 0);
  objc_storeStrong((id *)&self->_balanceLabel, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_numberPadView, 0);
  objc_storeStrong((id *)&self->_amountStepperView, 0);
  objc_storeStrong((id *)&self->_activeSubtitleView, 0);
  objc_storeStrong((id *)&self->_showKeypadButton, 0);
  objc_storeStrong((id *)&self->_showKeypadHint, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end