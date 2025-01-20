@interface PKPaymentPassActionWidgetView
- (BOOL)_bankConnectHasDigitalServicing;
- (BOOL)hasEnabledWidgets;
- (BOOL)hasSingleColumnLayout;
- (CGRect)widgetBoundsForRowWithBounds:(CGRect)result;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FKAccount)bankConnectAccount;
- (PKAccount)account;
- (PKFamilyMember)currentUser;
- (PKPaymentPass)paymentPass;
- (PKPaymentPassActionWidgetView)initWithWidgetViewStyle:(unint64_t)a3;
- (PKPaymentPassActionWidgetViewDelegate)delegate;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3;
- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3 rowBounds:(CGRect)a4;
- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3 rowSize:(CGSize)a4;
- (id)_createButtonForTitle:(id)a3 image:(id)a4;
- (unint64_t)numberOfRows;
- (unint64_t)numberOfRowsWithWidgetsPerRow:(unint64_t)a3;
- (unint64_t)numberOfWidgetsPerRowWithSize:(CGSize)a3;
- (void)_determineWidgetContentWithAvailableWidgets;
- (void)cleanUpExistingWidgets;
- (void)layoutSubviews;
- (void)setAccount:(id)a3;
- (void)setBankConnectAccount:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateNumberOfWidgetsPerRow;
- (void)updateUseAccessibilityLayout;
- (void)updateWidgetsAccessibilityLayoutState;
@end

@implementation PKPaymentPassActionWidgetView

- (PKPaymentPassActionWidgetView)initWithWidgetViewStyle:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassActionWidgetView;
  v4 = -[PKPaymentPassActionWidgetView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPaymentPassActionWidgetView *)v4 setBackgroundColor:v5];

    v4->_widgetViewStyle = a3;
  }
  return v4;
}

- (CGRect)widgetBoundsForRowWithBounds:(CGRect)result
{
  double v3 = result.origin.x + 0.0;
  double v4 = result.origin.y + 15.0;
  double v5 = result.size.height + -30.0;
  result.size.height = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3
{
  [(PKPaymentPassActionWidgetView *)self bounds];

  -[PKPaymentPassActionWidgetView targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:](self, "targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:", a3);
  return result;
}

- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3 rowSize:(CGSize)a4
{
  -[PKPaymentPassActionWidgetView targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:](self, "targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:", a3, 0.0, 0.0, a4.width, a4.height);
  return result;
}

- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3 rowBounds:(CGRect)a4
{
  -[PKPaymentPassActionWidgetView widgetBoundsForRowWithBounds:](self, "widgetBoundsForRowWithBounds:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return fmax((v5 + (double)(a3 - 1) * -10.0) / (double)a3, 0.0);
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentPassActionWidgetView;
  [(PKPaymentPassActionWidgetView *)&v26 layoutSubviews];
  NSUInteger v3 = [(NSArray *)self->_displayableWidgets count];
  [(PKPaymentPassActionWidgetView *)self updateNumberOfWidgetsPerRow];
  if (v3)
  {
    [(PKPaymentPassActionWidgetView *)self bounds];
    -[PKPaymentPassActionWidgetView widgetBoundsForRowWithBounds:](self, "widgetBoundsForRowWithBounds:");
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    remainder.origin.x = v8;
    remainder.origin.y = v9;
    CGRectEdge v10 = [(PKPaymentPassActionWidgetView *)self _shouldReverseLayoutDirection]? CGRectMaxXEdge: CGRectMinXEdge;
    remainder.size.width = v5;
    remainder.size.height = v7;
    memset(&v24, 0, sizeof(v24));
    memset(&slice, 0, sizeof(slice));
    unint64_t v11 = [(PKPaymentPassActionWidgetView *)self numberOfRows];
    [(PKPaymentPassActionWidgetView *)self targetWidgetWidthForRowWithNumberOfWidgets:self->_numberOfWidgetsPerRow];
    CGFloat v13 = v12;
    +[PKPaymentPassActionWidgetButton widgetHeightWithAccessibilityLayout:[(PKPaymentPassActionWidgetView *)self hasSingleColumnLayout]];
    unint64_t v22 = v11;
    if (v11)
    {
      CGFloat v15 = v14;
      uint64_t v16 = 0;
      unint64_t v17 = v11 - 1;
      do
      {
        CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
        unint64_t numberOfWidgetsPerRow = self->_numberOfWidgetsPerRow;
        if (numberOfWidgetsPerRow)
        {
          for (unint64_t i = 0; i < numberOfWidgetsPerRow; ++i)
          {
            if (i + v16 * numberOfWidgetsPerRow < v3)
            {
              v20 = -[NSArray objectAtIndex:](self->_displayableWidgets, "objectAtIndex:");
              PKSizeAlignedInRect();
              objc_msgSend(v20, "setFrame:");
              CGRectDivide(slice, &v24, &slice, v13, v10);
              unint64_t v21 = self->_numberOfWidgetsPerRow;
              if (v21 <= 1) {
                unint64_t v21 = 1;
              }
              if (i != v21 - 1) {
                CGRectDivide(slice, &v24, &slice, 10.0, v10);
              }

              unint64_t numberOfWidgetsPerRow = self->_numberOfWidgetsPerRow;
            }
          }
        }
        if (v17 != v16) {
          CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
        }
        ++v16;
      }
      while (v16 != v22);
    }
  }
}

- (BOOL)_bankConnectHasDigitalServicing
{
  v2 = [(PKPaymentPassActionWidgetView *)self bankConnectAccount];
  NSUInteger v3 = [v2 actions];
  double v4 = [v3 digitalServicingURL];

  if (v4)
  {
    CGFloat v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    char v6 = [v5 canOpenURL:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_determineWidgetContentWithAvailableWidgets
{
  [(PKPaymentPassActionWidgetView *)self cleanUpExistingWidgets];
  +[PKPaymentPassActionWidgetButton glyphImageHeight:[(PKPaymentPassActionWidgetView *)self hasSingleColumnLayout]];
  CGFloat v4 = v3;
  if (!self->_account) {
    goto LABEL_18;
  }
  CGFloat v5 = [(PKPaymentPass *)self->_paymentPass associatedAccountServiceAccountIdentifier];
  char v6 = [(PKAccount *)self->_account accountIdentifier];
  if (([v5 isEqualToString:v6] & 1) == 0)
  {

LABEL_18:
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained) {
      int v23 = objc_opt_respondsToSelector() ^ 1;
    }
    else {
      LOBYTE(v23) = 1;
    }
    uint64_t v24 = [(PKAccount *)self->_account type];
    v25 = [(PKPaymentPass *)self->_paymentPass associatedAccountServiceAccountIdentifier];
    uint64_t v26 = [v25 length];

    if (v26) {
      BOOL v27 = 1;
    }
    else {
      BOOL v27 = v24 == 4;
    }
    BOOL v28 = v27 && self->_hasBusinessChatIdentifier;
    if (+[PKBusinessChatController deviceSupportsBusinessChat]&& !(v23 & 1 | (((v28 | [(PKPaymentPassActionWidgetView *)self _bankConnectHasDigitalServicing]) & 1) == 0)))
    {
      v29 = PKPassKitUIBundle();
      v30 = [v29 URLForResource:@"MessageWidgetIcon" withExtension:@"pdf"];
      double v31 = PKUIScreenScale();
      v32 = PKUIImageFromPDF(v30, 1.79769313e308, v4, v31);

      if ([(PKPaymentPassActionWidgetView *)self _bankConnectHasDigitalServicing]) {
        v33 = @"CHAT";
      }
      else {
        v33 = @"MESSAGE";
      }
      v34 = PKLocalizedPaymentString(&v33->isa);
      v35 = [(PKPaymentPassActionWidgetView *)self _createButtonForTitle:v34 image:v32];

      [v35 setAccessibilityIdentifier:*MEMORY[0x1E4F856E0]];
      [v35 addTarget:WeakRetained action:sel_openBusinessChat forControlEvents:64];
      [v8 addObject:v35];
    }
    NSUInteger v36 = [(NSString *)self->_phoneNumber length];
    NSUInteger v37 = [(NSString *)self->_website length];
    NSUInteger v38 = [(NSString *)self->_email length];
    BOOL v42 = (unint64_t)[v8 count] < 2 && v36 == 0 && v37 == 0 && v38 == 0;
    if ((unint64_t)[v8 count] >= 2 && v36 && v37 && v38)
    {
      if (WeakRetained)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_72:
          if ((objc_opt_respondsToSelector() & 1) != 0 && v37)
          {
            v65 = PKPassKitUIBundle();
            v66 = [v65 URLForResource:@"SafariWidgetIcon" withExtension:@"pdf"];
            double v67 = PKUIScreenScale();
            v68 = PKUIImageFromPDF(v66, 1.79769313e308, v4, v67);

            v69 = PKLocalizedPaymentString(&cfstr_Website_0.isa);
            v70 = [(PKPaymentPassActionWidgetView *)self _createButtonForTitle:v69 image:v68];

            [v70 setAccessibilityIdentifier:*MEMORY[0x1E4F85B78]];
            [v70 addTarget:WeakRetained action:sel_openIssuerWebsite forControlEvents:64];
            [v70 setEnabled:1];
            [v8 addObject:v70];
          }
          goto LABEL_75;
        }
        v43 = PKPassKitUIBundle();
        v44 = [v43 URLForResource:@"ContactWidgetIcon" withExtension:@"pdf"];
        double v45 = PKUIScreenScale();
        v46 = PKUIImageFromPDF(v44, 1.79769313e308, v4, v45);

        v47 = PKLocalizedPaymentString(&cfstr_Contact.isa);
        v48 = [(PKPaymentPassActionWidgetView *)self _createButtonForTitle:v47 image:v46];

        [v48 setAccessibilityIdentifier:*MEMORY[0x1E4F853C0]];
        [v48 addTarget:WeakRetained action:sel_presentContactIssuerSheet forControlEvents:64];
LABEL_71:
        [v8 addObject:v48];

        goto LABEL_72;
      }
    }
    else if (WeakRetained)
    {
      char v49 = objc_opt_respondsToSelector();
      if (v36) {
        int v50 = 1;
      }
      else {
        int v50 = v42;
      }
      if ((v49 & 1) != 0 && v50)
      {
        v51 = PKPassKitUIBundle();
        v52 = [v51 URLForResource:@"PhoneWidgetIcon" withExtension:@"pdf"];
        double v53 = PKUIScreenScale();
        v54 = PKUIImageFromPDF(v52, 1.79769313e308, v4, v53);

        v55 = PKLocalizedPaymentString(&cfstr_Call_0.isa);
        v56 = [(PKPaymentPassActionWidgetView *)self _createButtonForTitle:v55 image:v54];

        [v56 setAccessibilityIdentifier:*MEMORY[0x1E4F85338]];
        [v56 addTarget:WeakRetained action:sel_callIssuer forControlEvents:64];
        [v56 setEnabled:v36 != 0];
        [v8 addObject:v56];
        BOOL v42 = (unint64_t)[v8 count] < 2 && (v37 | v38) == 0;
      }
      char v58 = objc_opt_respondsToSelector();
      if (v38) {
        int v59 = 1;
      }
      else {
        int v59 = v42;
      }
      if ((v58 & 1) == 0 || !v59) {
        goto LABEL_72;
      }
      BOOL v60 = v38 != 0;
      v61 = PKPassKitUIBundle();
      v62 = [v61 URLForResource:@"EmailWidgetIcon" withExtension:@"pdf"];
      double v63 = PKUIScreenScale();
      v46 = PKUIImageFromPDF(v62, 1.79769313e308, v4, v63);

      v64 = PKLocalizedPaymentString(&cfstr_Email.isa);
      v48 = [(PKPaymentPassActionWidgetView *)self _createButtonForTitle:v64 image:v46];

      [v48 setAccessibilityIdentifier:*MEMORY[0x1E4F854C8]];
      [v48 addTarget:WeakRetained action:sel_emailIssuer forControlEvents:64];
      [v48 setEnabled:v60];
      goto LABEL_71;
    }
LABEL_75:
    v71 = (NSArray *)[v8 copy];
    displayableWidgets = self->_displayableWidgets;
    self->_displayableWidgets = v71;

    goto LABEL_76;
  }
  uint64_t v7 = [(PKAccount *)self->_account feature];

  if (v7 != 4) {
    goto LABEL_18;
  }
  if (!PKCanShowAppleBalanceTopUpOptions()) {
    goto LABEL_77;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKAccount *)self->_account supportsAMPRedeemGiftcard])
  {
    CGFloat v9 = (void *)MEMORY[0x1E4FB1818];
    CGRectEdge v10 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    unint64_t v11 = [v9 systemImageNamed:@"giftcard.fill" withConfiguration:v10];

    double v12 = PKLocalizedLynxString(&cfstr_PassDetailsRed.isa);
    CGFloat v13 = [(PKPaymentPassActionWidgetView *)self _createButtonForTitle:v12 image:v11];

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v13 addTarget:v14 action:sel_redeemGiftCard forControlEvents:64];
    }
    [v8 addObject:v13];
  }
  if (([(PKAccount *)self->_account supportsTopUp] & 1) != 0
    || [(PKAccount *)self->_account supportsAMPTopUp])
  {
    CGFloat v15 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v16 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    unint64_t v17 = [v15 systemImageNamed:@"dollarsign.square.fill" withConfiguration:v16];

    v18 = PKLocalizedLynxString(&cfstr_PassDetailsAdd.isa);
    v19 = [(PKPaymentPassActionWidgetView *)self _createButtonForTitle:v18 image:v17];

    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v19 addTarget:v20 action:sel_addMoney forControlEvents:64];
    }
    [v8 addObject:v19];
  }
  unint64_t v21 = (NSArray *)[v8 copy];
  WeakRetained = self->_displayableWidgets;
  self->_displayableWidgets = v21;
LABEL_76:

LABEL_77:
  [(PKPaymentPassActionWidgetView *)self updateUseAccessibilityLayout];

  [(PKPaymentPassActionWidgetView *)self updateWidgetsAccessibilityLayoutState];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  unint64_t v5 = -[PKPaymentPassActionWidgetView numberOfWidgetsPerRowWithSize:](self, "numberOfWidgetsPerRowWithSize:", a3.width, a3.height);
  unint64_t v6 = [(PKPaymentPassActionWidgetView *)self numberOfRowsWithWidgetsPerRow:v5];
  if (v6)
  {
    unint64_t v7 = v6;
    BOOL v8 = v5 == 1 || self->_usesAccessibilityLayout;
    +[PKPaymentPassActionWidgetButton widgetHeightWithAccessibilityLayout:v8];
    double v9 = (double)(v7 - 1) * 10.0 + (double)v7 * v10 + 30.0;
  }
  else
  {
    CGFloat width = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v11 = width;
  result.height = v9;
  result.CGFloat width = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassActionWidgetView;
  id v4 = a3;
  [(PKPaymentPassActionWidgetView *)&v8 traitCollectionDidChange:v4];
  unint64_t v5 = [(PKPaymentPassActionWidgetView *)self traitCollection];
  unint64_t v6 = [v5 preferredContentSizeCategory];

  unint64_t v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v7 isEqualToString:v6];
  if ((v4 & 1) == 0)
  {
    [(PKPaymentPassActionWidgetView *)self updateUseAccessibilityLayout];
    [(PKPaymentPassActionWidgetView *)self setNeedsLayout];
  }
}

- (void)setPaymentPass:(id)a3
{
  p_paymentPass = &self->_paymentPass;
  id v14 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_paymentPass, a3);
    unint64_t v6 = [(PKPaymentPass *)*p_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
    phoneNumber = self->_phoneNumber;
    self->_phoneNumber = v6;

    objc_super v8 = [(PKPaymentPass *)*p_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A60]];
    website = self->_website;
    self->_website = v8;

    double v10 = [(PKPaymentPass *)*p_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A48]];
    email = self->_email;
    self->_email = v10;

    double v12 = [(PKPaymentPass *)*p_paymentPass businessChatIdentifier];
    self->_hasBusinessChatIdentifier = [v12 length] != 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained) {
      [(PKPaymentPassActionWidgetView *)self _determineWidgetContentWithAvailableWidgets];
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (self->_paymentPass)
  {
    [(PKPaymentPassActionWidgetView *)self _determineWidgetContentWithAvailableWidgets];
  }
}

- (void)setAccount:(id)a3
{
  p_account = &self->_account;
  id v13 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_account, a3);
    if ([(PKAccount *)*p_account type] == 4)
    {
      unint64_t v6 = [(PKAccount *)*p_account savingsDetails];
      unint64_t v7 = [v6 contactNumber];
      phoneNumber = self->_phoneNumber;
      self->_phoneNumber = v7;

      double v9 = [v6 contactWebsite];
      double v10 = [v9 absoluteString];
      website = self->_website;
      self->_website = v10;

      double v12 = [v6 businessChatIdentifier];
      self->_hasBusinessChatIdentifier = [v12 length] != 0;
    }
    [(PKPaymentPassActionWidgetView *)self _determineWidgetContentWithAvailableWidgets];
  }
}

- (void)setPeerPaymentAccount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
    [(PKPaymentPassActionWidgetView *)self _determineWidgetContentWithAvailableWidgets];
  }
}

- (void)setBankConnectAccount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bankConnectAccount, a3);
    if (self->_paymentPass) {
      [(PKPaymentPassActionWidgetView *)self _determineWidgetContentWithAvailableWidgets];
    }
  }
}

- (void)setCurrentUser:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentUser, a3);
    if (self->_paymentPass) {
      [(PKPaymentPassActionWidgetView *)self _determineWidgetContentWithAvailableWidgets];
    }
  }
}

- (BOOL)hasEnabledWidgets
{
  return [(NSArray *)self->_displayableWidgets pk_containsObjectPassingTest:&__block_literal_global_113];
}

uint64_t __50__PKPaymentPassActionWidgetView_hasEnabledWidgets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

- (id)_createButtonForTitle:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [[PKPaymentPassActionWidgetButton alloc] initWithWidgetViewStyle:self->_widgetViewStyle];
  [(PKPaymentPassActionWidgetButton *)v8 setUsesAccessibilityLayout:[(PKPaymentPassActionWidgetView *)self hasSingleColumnLayout]];
  [(PKPaymentPassActionWidgetButton *)v8 setTitle:v7 forState:0];

  double v9 = [v6 imageWithRenderingMode:2];

  [(PKPaymentPassActionWidgetButton *)v8 setImage:v9 forState:0];
  [(PKPaymentPassActionWidgetView *)self addSubview:v8];

  return v8;
}

- (void)updateUseAccessibilityLayout
{
  double v3 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2798]) != NSOrderedAscending;
  [(PKPaymentPassActionWidgetView *)self setNeedsLayout];
}

- (BOOL)hasSingleColumnLayout
{
  return self->_usesAccessibilityLayout || self->_numberOfWidgetsPerRow == 1;
}

- (void)updateNumberOfWidgetsPerRow
{
  [(PKPaymentPassActionWidgetView *)self bounds];
  unint64_t v5 = -[PKPaymentPassActionWidgetView numberOfWidgetsPerRowWithSize:](self, "numberOfWidgetsPerRowWithSize:", v3, v4);
  if (v5 != self->_numberOfWidgetsPerRow)
  {
    self->_unint64_t numberOfWidgetsPerRow = v5;
    [(PKPaymentPassActionWidgetView *)self updateWidgetsAccessibilityLayoutState];
  }
}

- (unint64_t)numberOfWidgetsPerRowWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  NSUInteger v6 = [(NSArray *)self->_displayableWidgets count];
  if (self->_usesAccessibilityLayout && v6 != 0) {
    return 1;
  }
  unint64_t v8 = v6;
  double v9 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]);

  if (v8 == 4 && v10 == NSOrderedDescending)
  {
    unint64_t v12 = 2;
    do
    {
LABEL_13:
      if (ldiv(v8, v12).rem == 1)
      {
        --v12;
      }
      else
      {
        -[PKPaymentPassActionWidgetView targetWidgetWidthForRowWithNumberOfWidgets:rowSize:](self, "targetWidgetWidthForRowWithNumberOfWidgets:rowSize:", v12, width, height);
        displayableWidgets = self->_displayableWidgets;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __63__PKPaymentPassActionWidgetView_numberOfWidgetsPerRowWithSize___block_invoke;
        v17[3] = &__block_descriptor_56_e41_B16__0__PKPaymentPassActionWidgetButton_8l;
        *(double *)&v17[4] = width;
        *(double *)&v17[5] = height;
        v17[6] = v14;
        unsigned int v15 = [(NSArray *)displayableWidgets pk_containsObjectPassingTest:v17];
        v12 -= v15;
        if (!v15) {
          return v12;
        }
      }
    }
    while (v12 > 1);
  }
  else
  {
    unint64_t v12 = v8;
    if (v8 >= 2) {
      goto LABEL_13;
    }
    return v8;
  }
  return v12;
}

BOOL __63__PKPaymentPassActionWidgetView_numberOfWidgetsPerRowWithSize___block_invoke(double *a1, void *a2)
{
  objc_msgSend(a2, "sizeThatFits:", a1[4], a1[5]);
  return v3 > a1[6];
}

- (unint64_t)numberOfRows
{
  return [(PKPaymentPassActionWidgetView *)self numberOfRowsWithWidgetsPerRow:self->_numberOfWidgetsPerRow];
}

- (unint64_t)numberOfRowsWithWidgetsPerRow:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  ldiv_t v4 = ldiv([(NSArray *)self->_displayableWidgets count], a3);
  unint64_t result = v4.quot;
  if (v4.rem) {
    return v4.quot + 1;
  }
  return result;
}

- (void)updateWidgetsAccessibilityLayoutState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentPassActionWidgetView *)self hasSingleColumnLayout];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  ldiv_t v4 = self->_displayableWidgets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setUsesAccessibilityLayout:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)cleanUpExistingWidgets
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_displayableWidgets;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "removeFromSuperview", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  displayableWidgets = self->_displayableWidgets;
  self->_displayableWidgets = 0;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (FKAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKPaymentPassActionWidgetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPassActionWidgetViewDelegate *)WeakRetained;
}

- (PKFamilyMember)currentUser
{
  return self->_currentUser;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_displayableWidgets, 0);
}

@end