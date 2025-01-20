@interface PKPaymentPreferenceCardCell
+ (double)textOffset;
- (BOOL)dimCardArt;
- (BOOL)isActivityIndicatorActive;
- (BOOL)showBillingAddress;
- (NSString)additionalContextString;
- (NSString)availabilityString;
- (NSString)disclosureString;
- (NSString)subtitleOverrideString;
- (PKPassSnapshotter)passSnapshotter;
- (PKPaymentPass)pass;
- (PKPaymentPreferenceCardCell)initWithReuseIdentifier:(id)a3;
- (PKPaymentPreferenceCardCellAccessoryViewDelegate)delegate;
- (PKTransitBalanceModel)transitBalanceModel;
- (UIColor)activityIndicatorColor;
- (UIColor)disabledMainLabelColor;
- (UIColor)disabledSubtitleLabelColor;
- (UIColor)mainLabelColor;
- (UIColor)subtitleLabelColor;
- (UIImageView)cardArtView;
- (UIImageView)disclosureView;
- (UILabel)additionalContextLabel;
- (UILabel)disclosureLabel;
- (UILabel)displayLabel;
- (UILabel)subtitleLabel;
- (UISwitch)actionSwitch;
- (double)heightThatFitsLabels;
- (int64_t)accessoryViewType;
- (void)_calculateAccessoryLayout;
- (void)_performSwitchToggle:(id)a3;
- (void)_setupConstraints;
- (void)_updateAccessoryView;
- (void)_updateAdditionalContextLabel;
- (void)_updateCellContent;
- (void)_updateDisclosureLabel;
- (void)_updateLabelTextColors;
- (void)_updateSubtitleLabel;
- (void)pk_applyAppearance:(id)a3;
- (void)prepareForReuse;
- (void)setAccessoryViewType:(int64_t)a3;
- (void)setActivityIndicatorActive:(BOOL)a3;
- (void)setActivityIndicatorColor:(id)a3;
- (void)setAdditionalContextString:(id)a3;
- (void)setAvailabilityString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimCardArt:(BOOL)a3;
- (void)setDisabledMainLabelColor:(id)a3;
- (void)setDisabledSubtitleLabelColor:(id)a3;
- (void)setDisclosureString:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHasError:(BOOL)a3;
- (void)setMainLabelColor:(id)a3;
- (void)setPass:(id)a3;
- (void)setPassSnapshotter:(id)a3;
- (void)setShowBillingAddress:(BOOL)a3;
- (void)setSubtitleLabelColor:(id)a3;
- (void)setSubtitleOverrideString:(id)a3;
- (void)setTransitBalanceModel:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PKPaymentPreferenceCardCell

- (PKPaymentPreferenceCardCell)initWithReuseIdentifier:(id)a3
{
  v49.receiver = self;
  v49.super_class = (Class)PKPaymentPreferenceCardCell;
  v3 = [(PKPaymentPreferenceCell *)&v49 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    v3->_isRightToLeft = [v4 userInterfaceLayoutDirection] == 1;

    v3->_editing = 0;
    v3->_accessoryViewType = 0;
    uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
    mainLabelColor = v3->_mainLabelColor;
    v3->_mainLabelColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    subtitleLabelColor = v3->_subtitleLabelColor;
    v3->_subtitleLabelColor = (UIColor *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    disabledMainLabelColor = v3->_disabledMainLabelColor;
    v3->_disabledMainLabelColor = (UIColor *)v9;

    uint64_t v11 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    disabledSubtitleLabelColor = v3->_disabledSubtitleLabelColor;
    v3->_disabledSubtitleLabelColor = (UIColor *)v11;

    v48 = [(PKPaymentPreferenceCardCell *)v3 contentView];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    displayLabel = v3->_displayLabel;
    v3->_displayLabel = v13;

    v15 = v3->_displayLabel;
    v16 = (void *)*MEMORY[0x1E4FB2788];
    v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2788], 16.0));
    [(UILabel *)v15 setFont:v17];

    [(UILabel *)v3->_displayLabel setTextColor:v3->_mainLabelColor];
    [(UILabel *)v3->_displayLabel setNumberOfLines:0];
    [(UILabel *)v3->_displayLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v18;

    v20 = v3->_subtitleLabel;
    v21 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v16, 12.0));
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v3->_subtitleLabel setTextColor:v3->_subtitleLabelColor];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    additionalContextLabel = v3->_additionalContextLabel;
    v3->_additionalContextLabel = v22;

    v24 = v3->_additionalContextLabel;
    v25 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v16, 12.0));
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v3->_additionalContextLabel setTextColor:v3->_subtitleLabelColor];
    [(UILabel *)v3->_additionalContextLabel setNumberOfLines:0];
    [(UILabel *)v3->_additionalContextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    cardArtView = v3->_cardArtView;
    v3->_cardArtView = v26;

    [(UIImageView *)v3->_cardArtView setContentMode:1];
    [(UIImageView *)v3->_cardArtView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_cardArtView setAccessibilityIgnoresInvertColors:1];
    [v48 addSubview:v3->_cardArtView];
    id v28 = objc_alloc(MEMORY[0x1E4FB1C60]);
    uint64_t v29 = objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    labelStackView = v3->_labelStackView;
    v3->_labelStackView = (UIStackView *)v29;

    [(UIStackView *)v3->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_labelStackView setAxis:1];
    [(UIStackView *)v3->_labelStackView setDistribution:0];
    [(UIStackView *)v3->_labelStackView addArrangedSubview:v3->_displayLabel];
    [(UIStackView *)v3->_labelStackView addArrangedSubview:v3->_subtitleLabel];
    [(UIStackView *)v3->_labelStackView addArrangedSubview:v3->_additionalContextLabel];
    [v48 addSubview:v3->_labelStackView];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v31;

    [(UIActivityIndicatorView *)v3->_activityIndicator setHidesWhenStopped:1];
    v33 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    actionSwitch = v3->_actionSwitch;
    v3->_actionSwitch = v33;

    [(UISwitch *)v3->_actionSwitch addTarget:v3 action:sel__performSwitchToggle_ forControlEvents:4096];
    id v35 = objc_alloc(MEMORY[0x1E4FB1838]);
    v36 = PKUIChevronImage();
    uint64_t v37 = [v35 initWithImage:v36];
    disclosureView = v3->_disclosureView;
    v3->_disclosureView = (UIImageView *)v37;

    v39 = v3->_disclosureView;
    v40 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v39 setTintColor:v40];

    v41 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    disclosureLabel = v3->_disclosureLabel;
    v3->_disclosureLabel = v41;

    v43 = v3->_disclosureLabel;
    v44 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v16, 16.0));
    [(UILabel *)v43 setFont:v44];

    v45 = v3->_disclosureLabel;
    v46 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UILabel *)v45 setTextColor:v46];

    [(PKPaymentPreferenceCardCell *)v3 _setupConstraints];
  }
  return v3;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceCardCell;
  [(PKPaymentPreferenceCell *)&v6 prepareForReuse];
  [(PKPaymentPreferenceCardCell *)self setUserInteractionEnabled:1];
  ++self->_snapshotCounter;
  pass = self->_pass;
  self->_pass = 0;

  additionalContextString = self->_additionalContextString;
  self->_additionalContextString = 0;

  disclosureString = self->_disclosureString;
  self->_disclosureString = 0;

  [(UIImageView *)self->_cardArtView setImage:0];
  [(UILabel *)self->_displayLabel setText:0];
  [(UILabel *)self->_subtitleLabel setText:0];
  [(UILabel *)self->_additionalContextLabel setText:0];
  [(UILabel *)self->_disclosureLabel setText:0];
  [(PKPaymentPreferenceCardCell *)self setAccessoryViewType:0];
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)setHasError:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceCardCell;
  -[PKPaymentPreferenceCell setHasError:](&v6, sel_setHasError_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
    uint64_t v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (self->_subtitleLabelColorOverride != v5)
  {
    objc_storeStrong((id *)&self->_subtitleLabelColorOverride, v5);
    [(PKPaymentPreferenceCardCell *)self _updateLabelTextColors];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPreferenceCardCell;
  -[PKPaymentPreferenceCardCell setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  [(UISwitch *)self->_actionSwitch setEnabled:v3];
  [(PKPaymentPreferenceCardCell *)self _updateLabelTextColors];
}

- (void)setAccessoryViewType:(int64_t)a3
{
  if (self->_accessoryViewType != a3)
  {
    self->_accessoryViewType = a3;
    [(PKPaymentPreferenceCardCell *)self _updateAccessoryView];
  }
}

- (void)setMainLabelColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_mainLabelColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_mainLabelColor, a3);
    [(PKPaymentPreferenceCardCell *)self _updateLabelTextColors];
    objc_super v5 = v6;
  }
}

- (void)setSubtitleLabelColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_subtitleLabelColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_subtitleLabelColor, a3);
    [(PKPaymentPreferenceCardCell *)self _updateLabelTextColors];
    objc_super v5 = v6;
  }
}

- (void)setDisabledMainLabelColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_disabledMainLabelColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_disabledMainLabelColor, a3);
    [(PKPaymentPreferenceCardCell *)self _updateLabelTextColors];
    objc_super v5 = v6;
  }
}

- (void)setDisabledSubtitleLabelColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_disabledSubtitleLabelColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_disabledSubtitleLabelColor, a3);
    [(PKPaymentPreferenceCardCell *)self _updateLabelTextColors];
    objc_super v5 = v6;
  }
}

- (void)setActivityIndicatorColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_activityIndicatorColor != v5)
  {
    objc_storeStrong((id *)&self->_activityIndicatorColor, a3);
    [(UIActivityIndicatorView *)self->_activityIndicator setColor:v5];
  }
}

- (void)setActivityIndicatorActive:(BOOL)a3
{
  if (((!self->_activityIndicatorActive ^ a3) & 1) == 0)
  {
    self->_activityIndicatorActive = a3;
    [(PKPaymentPreferenceCardCell *)self _updateAccessoryView];
  }
}

- (void)setDimCardArt:(BOOL)a3
{
  if (((!self->_dimCardArt ^ a3) & 1) == 0)
  {
    self->_dimCardArt = a3;
    [(PKPaymentPreferenceCardCell *)self _updateCellContent];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_editing ^ a3) & 1) == 0)
  {
    BOOL v4 = a4;
    self->_editing = a3;
    if (a3) {
      double v6 = 0.2;
    }
    else {
      double v6 = 1.0;
    }
    if (a3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 3;
    }
    [(PKPaymentPreferenceCardCell *)self setSelectionStyle:v7];
    if (v4)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__PKPaymentPreferenceCardCell_setEditing_animated___block_invoke;
      v8[3] = &unk_1E59CB460;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v8 completion:0];
    }
    else
    {
      [(PKPaymentPreferenceCardCell *)self setAlpha:v6];
    }
  }
}

uint64_t __51__PKPaymentPreferenceCardCell_setEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setPass:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    [(PKPaymentPreferenceCardCell *)self _updateCellContent];
  }
}

- (void)setTransitBalanceModel:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transitBalanceModel, a3);
    [(PKPaymentPreferenceCardCell *)self _updateSubtitleLabel];
  }
}

- (void)setSubtitleOverrideString:(id)a3
{
  id v4 = a3;
  id v5 = self->_subtitleOverrideString;
  double v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    subtitleOverrideString = self->_subtitleOverrideString;
    self->_subtitleOverrideString = v8;

    [(PKPaymentPreferenceCardCell *)self _updateSubtitleLabel];
  }
LABEL_9:
}

- (void)setDisclosureString:(id)a3
{
  id v4 = a3;
  id v5 = self->_disclosureString;
  double v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    disclosureString = self->_disclosureString;
    self->_disclosureString = v8;

    [(PKPaymentPreferenceCardCell *)self _updateDisclosureLabel];
  }
LABEL_9:
}

- (void)setAdditionalContextString:(id)a3
{
  id v4 = a3;
  id v5 = self->_additionalContextString;
  double v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    additionalContextString = self->_additionalContextString;
    self->_additionalContextString = v8;

    [(PKPaymentPreferenceCardCell *)self _updateAdditionalContextLabel];
  }
LABEL_9:
}

- (void)_performSwitchToggle:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "paymentPreferenceCardCell:didChangeSwitchState:", self, objc_msgSend(v5, "isOn"));
  }
}

- (void)_updateSubtitleLabel
{
  if ([(NSString *)self->_subtitleOverrideString length])
  {
    subtitleLabel = self->_subtitleLabel;
    subtitleOverrideString = self->_subtitleOverrideString;
    [(UILabel *)subtitleLabel setText:subtitleOverrideString];
    return;
  }
  int v5 = [(PKPaymentPass *)self->_pass isAccessPass];
  pass = self->_pass;
  if (!v5)
  {
    if ([(PKPaymentPass *)pass isTransitPass])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = PKSanitizedPrimaryAccountRepresentationForPass();
      if ([v9 length]) {
        [v8 addObject:v9];
      }
      v10 = [(PKTransitBalanceModel *)self->_transitBalanceModel primaryDisplayableBalance];
      [v8 safelyAddObject:v10];

      uint64_t v11 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayableCommutePlanCount];
      [v8 safelyAddObject:v11];

      if (![v8 count])
      {

        goto LABEL_18;
      }
      uint64_t v12 = [v8 componentsJoinedByString:@", "];
    }
    else
    {
      if (![(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount])goto LABEL_18; {
      v13 = [(PKPaymentPass *)self->_pass peerPaymentBalance];
      }

      if (!v13) {
        goto LABEL_18;
      }
      id v8 = [(PKPaymentPass *)self->_pass peerPaymentBalance];
      uint64_t v9 = [v8 minimalFormattedStringValue];
      uint64_t v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA.isa, &stru_1EF1B4C70.isa, v9);
    }
    id v22 = (id)v12;

    if (v22) {
      goto LABEL_19;
    }
LABEL_18:
    PKSanitizedPrimaryAccountRepresentationForPass();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  BOOL v7 = [(PKPaymentPass *)pass fieldForKey:*MEMORY[0x1E4F87A30]];
  id v22 = [v7 value];

LABEL_19:
  v14 = self->_availabilityString;
  if ([v22 length] && -[NSString length](v14, "length"))
  {
    v15 = [NSString stringWithFormat:@"%@ (%@)", v22, v14];
LABEL_26:
    v16 = v15;
    goto LABEL_27;
  }
  if ([v22 length])
  {
    v15 = (NSString *)v22;
    goto LABEL_26;
  }
  if ([(NSString *)v14 length])
  {
    v15 = v14;
    goto LABEL_26;
  }
  v16 = 0;
LABEL_27:
  v17 = [MEMORY[0x1E4F84B40] defaults];
  v18 = [v17 defaultBillingAddressForPaymentPass:self->_pass];

  if (self->_showBillingAddress && v18)
  {
    v19 = [v18 pkSingleLineFormattedContactAddress];
    v20 = self->_subtitleLabel;
    v21 = [NSString stringWithFormat:@"%@ - %@", v16, v19];
    [(UILabel *)v20 setText:v21];
  }
  else
  {
    [(UILabel *)self->_subtitleLabel setText:v16];
  }
}

- (void)_updateAdditionalContextLabel
{
  [(UILabel *)self->_additionalContextLabel setText:self->_additionalContextString];

  [(PKPaymentPreferenceCardCell *)self setNeedsLayout];
}

- (void)_updateDisclosureLabel
{
  [(UILabel *)self->_disclosureLabel setText:self->_disclosureString];
  [(PKPaymentPreferenceCardCell *)self _calculateAccessoryLayout];

  [(PKPaymentPreferenceCardCell *)self setNeedsLayout];
}

- (void)_updateCellContent
{
  displayLabel = self->_displayLabel;
  id v4 = [(PKPaymentPass *)self->_pass localizedDescription];
  [(UILabel *)displayLabel setText:v4];

  [(PKPaymentPreferenceCardCell *)self _updateSubtitleLabel];
  [(PKPaymentPreferenceCardCell *)self _updateAdditionalContextLabel];
  [(PKPaymentPreferenceCardCell *)self _updateDisclosureLabel];
  unsigned int v5 = self->_snapshotCounter + 1;
  self->_snapshotCounter = v5;
  if (self->_pass && self->_passSnapshotter)
  {
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    -[PKPaymentPreferenceCardCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 90.0, 0.0, 0.0);
    [(UIImageView *)self->_cardArtView setImage:0];
    passSnapshotter = self->_passSnapshotter;
    pass = self->_pass;
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke;
    v13[3] = &unk_1E59D8F88;
    unsigned int v14 = v5;
    v13[4] = self;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](passSnapshotter, "snapshotWithPass:size:completion:", pass, v13, 66.0, v8);
  }
  else
  {
    [(UIImageView *)self->_cardArtView setImage:0];
    double v9 = *MEMORY[0x1E4FB2848];
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[PKPaymentPreferenceCardCell setSeparatorInset:](self, "setSeparatorInset:", v9, v10, v11, v12);
  }
}

void __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke_2;
  block[3] = &unk_1E59D8F60;
  int v7 = *(_DWORD *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(v1 + 1112)) {
    return;
  }
  if (*(void *)(v1 + 1136))
  {
    v2 = *(void **)(v1 + 1224);
    id v3 = *(void **)(a1 + 40);
    if (*(unsigned char *)(v1 + 1117))
    {
      id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.7];
      id v4 = objc_msgSend(v3, "pkui_imageOverlaidWithColor:", v7);
      [v2 setImage:v4];

      return;
    }
    unsigned int v5 = *(void **)(v1 + 1224);
    id v6 = v3;
  }
  else
  {
    unsigned int v5 = *(void **)(v1 + 1224);
    id v6 = 0;
  }

  [v5 setImage:v6];
}

- (void)_updateLabelTextColors
{
  int v3 = [(PKPaymentPreferenceCardCell *)self isUserInteractionEnabled];
  displayLabel = self->_displayLabel;
  if (v3)
  {
    [(UILabel *)displayLabel setTextColor:self->_mainLabelColor];
    subtitleLabelColorOverride = self->_subtitleLabelColorOverride;
    if (!subtitleLabelColorOverride) {
      subtitleLabelColorOverride = self->_subtitleLabelColor;
    }
    [(UILabel *)self->_subtitleLabel setTextColor:subtitleLabelColorOverride];
    additionalContextLabel = self->_additionalContextLabel;
    subtitleLabelColor = self->_subtitleLabelColorOverride;
    if (!subtitleLabelColor) {
      subtitleLabelColor = self->_subtitleLabelColor;
    }
  }
  else
  {
    [(UILabel *)displayLabel setTextColor:self->_disabledMainLabelColor];
    [(UILabel *)self->_subtitleLabel setTextColor:self->_disabledSubtitleLabelColor];
    additionalContextLabel = self->_additionalContextLabel;
    subtitleLabelColor = self->_disabledSubtitleLabelColor;
  }

  [(UILabel *)additionalContextLabel setTextColor:subtitleLabelColor];
}

- (double)heightThatFitsLabels
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v3 = [(PKPaymentPreferenceCardCell *)self textLabel];
  id v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(PKPaymentPreferenceCardCell *)self textLabel];
    id v7 = [v6 font];
    [v7 xHeight];
    double v9 = v8;

    return fmax(v9 + 36.0, 44.0);
  }
  else
  {
    [(UIStackView *)self->_labelStackView spacing];
    double v12 = 16.0 - v11;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v13 = [(UIStackView *)self->_labelStackView arrangedSubviews];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      uint64_t v17 = *MEMORY[0x1E4FB06F8];
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v20 = [v19 text];
          if ([v20 length])
          {
            uint64_t v30 = v17;
            v21 = [v19 font];
            uint64_t v31 = v21;
            id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
            [v20 sizeWithAttributes:v22];
            double v24 = v23;

            [(UIStackView *)self->_labelStackView spacing];
            double v12 = v12 + v24 + v25;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v15);
    }

    return fmax(v12, 67.0);
  }
}

- (void)_calculateAccessoryLayout
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(PKPaymentPreferenceCardCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(PKPaymentPreferenceCardCell *)self accessoryView];
  double v8 = [v7 subviews];
  if ([v8 count])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    double v11 = 0.0;
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v34;
      double v14 = 0.0;
      double v15 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "sizeThatFits:", v4, v6);
          double v14 = v14 + v18 + 8.0;
          if (v17 > v15) {
            double v15 = v17;
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v12);
      double v19 = v14 + -8.0;
    }
    else
    {
      double v19 = -8.0;
      double v15 = 0.0;
    }

    if (v19 >= 0.0) {
      double v11 = v19;
    }
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v15);
    remainder.origin.x = 0.0;
    remainder.origin.y = 0.0;
    remainder.size.width = v11;
    remainder.size.height = v15;
    memset(&slice, 0, sizeof(slice));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v9;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          double v25 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          objc_msgSend(v25, "sizeThatFits:", v4, v6, (void)v27);
          CGRectDivide(remainder, &slice, &remainder, v26, CGRectMaxXEdge);
          PKSizeAlignedInRect();
          objc_msgSend(v25, "setFrame:");
          CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMaxXEdge);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v22);
    }
  }
}

- (void)_updateAccessoryView
{
  BOOL v3 = !self->_activityIndicatorActive;
  BOOL v4 = [(UIActivityIndicatorView *)self->_activityIndicator isAnimating];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  int64_t accessoryViewType = self->_accessoryViewType;
  id v13 = v5;
  if (accessoryViewType == 1)
  {
    id v7 = &OBJC_IVAR___PKPaymentPreferenceCardCell__actionSwitch;
  }
  else
  {
    if (accessoryViewType != 2) {
      goto LABEL_6;
    }
    id v7 = &OBJC_IVAR___PKPaymentPreferenceCardCell__disclosureLabel;
    [v5 addSubview:self->_disclosureView];
  }
  [v13 addSubview:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v7)];
  id v5 = v13;
LABEL_6:
  char v8 = v3 ^ v4;
  if (self->_activityIndicatorActive)
  {
    [v13 addSubview:self->_activityIndicator];
    id v5 = v13;
  }
  if ((v8 & 1) == 0)
  {
    activityIndicator = self->_activityIndicator;
    if (self->_activityIndicatorActive) {
      [(UIActivityIndicatorView *)activityIndicator startAnimating];
    }
    else {
      [(UIActivityIndicatorView *)activityIndicator stopAnimating];
    }
    id v5 = v13;
  }
  uint64_t v10 = [v5 subviews];
  uint64_t v11 = [v10 count];

  if (v11) {
    id v12 = v13;
  }
  else {
    id v12 = 0;
  }
  [(PKPaymentPreferenceCardCell *)self setAccessoryView:v12];
  [(PKPaymentPreferenceCardCell *)self _calculateAccessoryLayout];
  [(PKPaymentPreferenceCardCell *)self setNeedsLayout];
}

- (void)_setupConstraints
{
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  double v4 = v3;
  id v5 = [(PKPaymentPreferenceCardCell *)self contentView];
  double v6 = [(UIImageView *)self->_cardArtView centerYAnchor];
  id v7 = [v5 centerYAnchor];
  char v8 = [v6 constraintEqualToAnchor:v7 constant:0.0];
  [v42 addObject:v8];

  id v9 = [(UIImageView *)self->_cardArtView leadingAnchor];
  uint64_t v10 = [v5 leadingAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10 constant:16.0];
  [v42 addObject:v11];

  id v12 = [(UIImageView *)self->_cardArtView heightAnchor];
  id v13 = [v12 constraintEqualToConstant:v4];
  [v42 addObject:v13];

  double v14 = [(UIImageView *)self->_cardArtView widthAnchor];
  double v15 = [v14 constraintEqualToConstant:66.0];
  [v42 addObject:v15];

  LODWORD(v16) = 1148846080;
  [(UILabel *)self->_displayLabel setContentHuggingPriority:1 forAxis:v16];
  LODWORD(v17) = 1148846080;
  [(UILabel *)self->_displayLabel setContentCompressionResistancePriority:1 forAxis:v17];
  LODWORD(v18) = 1148846080;
  [(UILabel *)self->_subtitleLabel setContentHuggingPriority:1 forAxis:v18];
  LODWORD(v19) = 1148846080;
  [(UILabel *)self->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v19];
  LODWORD(v20) = 1148846080;
  [(UILabel *)self->_additionalContextLabel setContentHuggingPriority:1 forAxis:v20];
  LODWORD(v21) = 1148846080;
  [(UILabel *)self->_additionalContextLabel setContentCompressionResistancePriority:1 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [(UIStackView *)self->_labelStackView setContentCompressionResistancePriority:1 forAxis:v22];
  LODWORD(v23) = 1148846080;
  [(UIStackView *)self->_labelStackView setContentHuggingPriority:1 forAxis:v23];
  double v24 = [(UIStackView *)self->_labelStackView centerYAnchor];
  double v25 = [v5 centerYAnchor];
  CGFloat v26 = [v24 constraintEqualToAnchor:v25 constant:0.0];
  [v42 addObject:v26];

  long long v27 = [(UIStackView *)self->_labelStackView leadingAnchor];
  long long v28 = [(UIImageView *)self->_cardArtView trailingAnchor];
  long long v29 = [v27 constraintEqualToAnchor:v28 constant:8.0];
  [v42 addObject:v29];

  long long v30 = [(UIStackView *)self->_labelStackView topAnchor];
  uint64_t v31 = [v5 topAnchor];
  v32 = [v30 constraintGreaterThanOrEqualToAnchor:v31 constant:8.0];
  [v42 addObject:v32];

  long long v33 = [(UIStackView *)self->_labelStackView bottomAnchor];
  long long v34 = [v5 bottomAnchor];
  long long v35 = [v33 constraintLessThanOrEqualToAnchor:v34 constant:-8.0];
  [v42 addObject:v35];

  long long v36 = [(UIStackView *)self->_labelStackView trailingAnchor];
  uint64_t v37 = [v5 trailingAnchor];
  v38 = [v36 constraintLessThanOrEqualToAnchor:v37 constant:0.0];
  labelStackTrailingAnchorToCell = self->_labelStackTrailingAnchorToCell;
  self->_labelStackTrailingAnchorToCell = v38;

  [v42 addObject:self->_labelStackTrailingAnchorToCell];
  v40 = [v5 heightAnchor];
  v41 = [v40 constraintGreaterThanOrEqualToConstant:v4 + 16.0];
  [v42 addObject:v41];

  [MEMORY[0x1E4F28DC8] activateConstraints:v42];
}

+ (double)textOffset
{
  return 90.0;
}

- (PKPaymentPreferenceCardCellAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPreferenceCardCellAccessoryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKPassSnapshotter)passSnapshotter
{
  return self->_passSnapshotter;
}

- (void)setPassSnapshotter:(id)a3
{
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (UIColor)mainLabelColor
{
  return self->_mainLabelColor;
}

- (UIColor)subtitleLabelColor
{
  return self->_subtitleLabelColor;
}

- (UIColor)disabledMainLabelColor
{
  return self->_disabledMainLabelColor;
}

- (UIColor)disabledSubtitleLabelColor
{
  return self->_disabledSubtitleLabelColor;
}

- (UIColor)activityIndicatorColor
{
  return self->_activityIndicatorColor;
}

- (UILabel)displayLabel
{
  return self->_displayLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)additionalContextLabel
{
  return self->_additionalContextLabel;
}

- (UIImageView)cardArtView
{
  return self->_cardArtView;
}

- (UISwitch)actionSwitch
{
  return self->_actionSwitch;
}

- (UILabel)disclosureLabel
{
  return self->_disclosureLabel;
}

- (UIImageView)disclosureView
{
  return self->_disclosureView;
}

- (NSString)availabilityString
{
  return self->_availabilityString;
}

- (void)setAvailabilityString:(id)a3
{
}

- (NSString)subtitleOverrideString
{
  return self->_subtitleOverrideString;
}

- (NSString)additionalContextString
{
  return self->_additionalContextString;
}

- (NSString)disclosureString
{
  return self->_disclosureString;
}

- (BOOL)showBillingAddress
{
  return self->_showBillingAddress;
}

- (void)setShowBillingAddress:(BOOL)a3
{
  self->_showBillingAddress = a3;
}

- (BOOL)dimCardArt
{
  return self->_dimCardArt;
}

- (BOOL)isActivityIndicatorActive
{
  return self->_activityIndicatorActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureString, 0);
  objc_storeStrong((id *)&self->_additionalContextString, 0);
  objc_storeStrong((id *)&self->_subtitleOverrideString, 0);
  objc_storeStrong((id *)&self->_availabilityString, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_disclosureLabel, 0);
  objc_storeStrong((id *)&self->_actionSwitch, 0);
  objc_storeStrong((id *)&self->_cardArtView, 0);
  objc_storeStrong((id *)&self->_additionalContextLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorColor, 0);
  objc_storeStrong((id *)&self->_disabledSubtitleLabelColor, 0);
  objc_storeStrong((id *)&self->_disabledMainLabelColor, 0);
  objc_storeStrong((id *)&self->_subtitleLabelColor, 0);
  objc_storeStrong((id *)&self->_mainLabelColor, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labelStackTrailingAnchorToCell, 0);
  objc_storeStrong((id *)&self->_subtitleLabelColorOverride, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

- (void)pk_applyAppearance:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferenceCardCell;
  id v4 = a3;
  [(PKTableViewCell *)&v10 pk_applyAppearance:v4];
  id v5 = objc_msgSend(v4, "textColor", v10.receiver, v10.super_class);
  [(PKPaymentPreferenceCardCell *)self setMainLabelColor:v5];

  double v6 = [v4 altTextColor];
  [(PKPaymentPreferenceCardCell *)self setSubtitleLabelColor:v6];

  id v7 = [v4 altTextColor];
  [(PKPaymentPreferenceCardCell *)self setDisabledMainLabelColor:v7];

  char v8 = [v4 altTextColor];
  [(PKPaymentPreferenceCardCell *)self setDisabledSubtitleLabelColor:v8];

  id v9 = [v4 tintColor];

  [(PKPaymentPreferenceCardCell *)self setTintColor:v9];
}

@end