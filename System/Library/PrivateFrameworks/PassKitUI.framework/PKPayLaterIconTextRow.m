@interface PKPayLaterIconTextRow
+ (id)rowConfiguredForDisputeLayoutWithFinancingPlan:(id)a3 payment:(id)a4 selectionHandler:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlightItem;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)amountText;
- (NSString)primaryText;
- (NSString)secondaryText;
- (NSString)tertiaryText;
- (PKPayLaterIconTextRow)initWithPrimaryTitle:(id)a3 identifier:(id)a4 selectionHandler:(id)a5;
- (UIColor)amountTextColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)tertiaryTextColor;
- (UIFont)amountFont;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (UIFont)tertiaryFont;
- (UIImage)icon;
- (double)minimumHeight;
- (unint64_t)accessory;
- (unint64_t)hash;
- (unint64_t)maskType;
- (void)configureCell:(id)a3;
- (void)handleCellSelectionWithContinueBlock:(id)a3;
- (void)setAccessory:(unint64_t)a3;
- (void)setAmountFont:(id)a3;
- (void)setAmountText:(id)a3;
- (void)setAmountTextColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMaskType:(unint64_t)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setTertiaryFont:(id)a3;
- (void)setTertiaryText:(id)a3;
- (void)setTertiaryTextColor:(id)a3;
@end

@implementation PKPayLaterIconTextRow

- (PKPayLaterIconTextRow)initWithPrimaryTitle:(id)a3 identifier:(id)a4 selectionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterIconTextRow;
  v12 = [(PKPayLaterIconTextRow *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primaryText, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    v14 = _Block_copy(v11);
    id selectionHandler = v13->_selectionHandler;
    v13->_id selectionHandler = v14;
  }
  return v13;
}

+ (id)rowConfiguredForDisputeLayoutWithFinancingPlan:(id)a3 payment:(id)a4 selectionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 merchant];
  uint64_t v11 = [v10 displayName];

  v12 = [PKPayLaterIconTextRow alloc];
  v13 = [v7 planIdentifier];
  v48 = (void *)v11;
  v14 = [(PKPayLaterIconTextRow *)v12 initWithPrimaryTitle:v11 identifier:v13 selectionHandler:v9];
  id v47 = v9;

  id v15 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v16 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v15 setCalendar:v16];

  [v15 setDateStyle:1];
  if (v8)
  {
    objc_super v17 = PKLocalizedCocoonString(&cfstr_ApplePayLaterP.isa);
    v18 = [v8 postedDate];
    v19 = [v15 stringFromDate:v18];

    v20 = [v8 amount];
    v21 = [v20 formattedStringValue];
  }
  else
  {
    v22 = [v7 planSummary];
    v23 = [v22 transactionDate];
    objc_super v17 = [v15 stringFromDate:v23];

    switch([v7 state])
    {
      case 2:
      case 3:
        v24 = NSString;
        v25 = PKLocalizedCocoonString(&cfstr_InstallmentPen.isa);
        uint64_t v26 = [v24 stringWithFormat:@"%@ - %@", v17, v25];
        goto LABEL_5;
      case 5:
        v28 = [v7 planSummary];
        v25 = [v28 cancellationDate];

        if (v25)
        {
          uint64_t v29 = [v15 stringFromDate:v25];
          uint64_t v27 = PKLocalizedCocoonString(&cfstr_InstallmentCan.isa, &stru_1EF1B4C70.isa, v29);

          objc_super v17 = (void *)v29;
        }
        else
        {
          uint64_t v26 = PKLocalizedCocoonString(&cfstr_InstallmentCan_0.isa);
LABEL_5:
          uint64_t v27 = v26;
        }

        objc_super v17 = (void *)v27;
        goto LABEL_15;
      case 6:
        v30 = [v7 scheduleSummary];
        v25 = [v30 lastPayment];

        v31 = [v25 postedDate];
        if (v31)
        {
          uint64_t v32 = [v15 stringFromDate:v31];
          uint64_t v33 = PKLocalizedCocoonString(&cfstr_InstallmentPai.isa, &stru_1EF1B4C70.isa, v32);

          objc_super v17 = (void *)v32;
        }
        else
        {
          uint64_t v33 = PKLocalizedCocoonString(&cfstr_InstallmentPai_0.isa);
        }

        objc_super v17 = (void *)v33;
        goto LABEL_15;
      case 8:
        PKLocalizedCocoonString(&cfstr_InstallmentPen_0.isa);
        objc_super v17 = v25 = v17;
LABEL_15:

        break;
      default:
        break;
    }
    v34 = [v7 planSummary];
    v20 = [v34 totalAmount];

    if (v20)
    {
      v35 = [v20 formattedStringValue];
      v19 = PKLocalizedCocoonString(&cfstr_InstallmentTot_0.isa, &stru_1EF1B4C70.isa, v35);

      v21 = 0;
    }
    else
    {
      v21 = 0;
      v19 = 0;
    }
  }
  v36 = v8;

  [(PKPayLaterIconTextRow *)v14 setSecondaryText:v17];
  [(PKPayLaterIconTextRow *)v14 setTertiaryText:v19];
  [(PKPayLaterIconTextRow *)v14 setAmountText:v21];
  v37 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKPayLaterIconTextRow *)v14 setPrimaryTextColor:v37];

  v38 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKPayLaterIconTextRow *)v14 setAmountTextColor:v38];

  v39 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(PKPayLaterIconTextRow *)v14 setSecondaryTextColor:v39];

  v40 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(PKPayLaterIconTextRow *)v14 setTertiaryTextColor:v40];

  v41 = (void *)*MEMORY[0x1E4FB2790];
  v42 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 32770, 0);
  [(PKPayLaterIconTextRow *)v14 setPrimaryFont:v42];

  v43 = (void *)*MEMORY[0x1E4FB2950];
  v44 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], v41, 0x8000, 0);
  [(PKPayLaterIconTextRow *)v14 setSecondaryFont:v44];

  v45 = PKFontForDefaultDesign(v43, v41, 0x8000, 0);
  [(PKPayLaterIconTextRow *)v14 setTertiaryFont:v45];

  [(PKPayLaterIconTextRow *)v14 setAccessory:v47 != 0];
  [(PKPayLaterIconTextRow *)v14 setMaskType:3];
  [(PKPayLaterIconTextRow *)v14 setMinimumHeight:76.0];

  return v14;
}

- (NSCopying)identifier
{
  v2 = (void *)[(NSString *)self->_identifier copy];

  return (NSCopying *)v2;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKPayLaterIconTextRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    primaryText = self->_primaryText;
    id v5 = v6;
    [v5 setPrimaryText:primaryText];
    [v5 setSecondaryText:self->_secondaryText];
    [v5 setTertiaryText:self->_tertiaryText];
    [v5 setAmountText:self->_amountText];
    [v5 setAccessory:self->_accessory];
    [v5 setIcon:self->_icon animated:1];
    [v5 setMaskType:self->_maskType];
    [v5 setPrimaryTextColor:self->_primaryTextColor];
    [v5 setSecondaryTextColor:self->_secondaryTextColor];
    [v5 setTertiaryTextColor:self->_tertiaryTextColor];
    [v5 setAmountTextColor:self->_amountTextColor];
    [v5 setPrimaryFont:self->_primaryFont];
    [v5 setSecondaryFont:self->_secondaryFont];
    [v5 setTertiaryFont:self->_tertiaryFont];
    [v5 setAmountFont:self->_amountFont];
    [v5 setMinimumHeight:self->_minimumHeight];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_primaryText];
  [v3 safelyAddObject:self->_secondaryText];
  [v3 safelyAddObject:self->_tertiaryText];
  [v3 safelyAddObject:self->_amountText];
  [v3 safelyAddObject:self->_icon];
  v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_primaryTextColor];
  [v3 safelyAddObject:self->_secondaryTextColor];
  [v3 safelyAddObject:self->_tertiaryTextColor];
  [v3 safelyAddObject:self->_amountTextColor];
  [v3 safelyAddObject:self->_primaryFont];
  [v3 safelyAddObject:self->_secondaryFont];
  [v3 safelyAddObject:self->_tertiaryFont];
  [v3 safelyAddObject:self->_amountFont];
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterIconTextRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        primaryText = v6->_primaryText;
        id v8 = self->_primaryText;
        id v9 = primaryText;
        if (v8 == v9)
        {
        }
        else
        {
          id v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_45;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_46;
          }
        }
        secondaryText = v6->_secondaryText;
        id v8 = self->_secondaryText;
        v13 = secondaryText;
        if (v8 == v13)
        {
        }
        else
        {
          id v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13) {
            goto LABEL_45;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v13];

          if (!v11) {
            goto LABEL_46;
          }
        }
        tertiaryText = v6->_tertiaryText;
        id v8 = self->_tertiaryText;
        id v15 = tertiaryText;
        if (v8 == v15)
        {
        }
        else
        {
          id v10 = v15;
          LOBYTE(v11) = 0;
          if (!v8 || !v15) {
            goto LABEL_45;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v15];

          if (!v11) {
            goto LABEL_46;
          }
        }
        amountText = v6->_amountText;
        id v8 = self->_amountText;
        objc_super v17 = amountText;
        if (v8 == v17)
        {
        }
        else
        {
          id v10 = v17;
          LOBYTE(v11) = 0;
          if (!v8 || !v17) {
            goto LABEL_45;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v17];

          if (!v11) {
            goto LABEL_46;
          }
        }
        if (!PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_46:

          goto LABEL_47;
        }
        id v8 = (NSString *)_Block_copy(self->_selectionHandler);
        id v10 = _Block_copy(v6->_selectionHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && self->_accessory == v6->_accessory
                   && self->_maskType == v6->_maskType
                   && self->_minimumHeight == v6->_minimumHeight;
LABEL_45:

        goto LABEL_46;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_47:

  return v11;
}

- (void)handleCellSelectionWithContinueBlock:(id)a3
{
  id selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2](selectionHandler, a3);
  }
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (void)setTertiaryText:(id)a3
{
}

- (NSString)amountText
{
  return self->_amountText;
}

- (void)setAmountText:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (unint64_t)maskType
{
  return self->_maskType;
}

- (void)setMaskType:(unint64_t)a3
{
  self->_maskType = a3;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(unint64_t)a3
{
  self->_accessory = a3;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (void)setTertiaryTextColor:(id)a3
{
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (void)setAmountTextColor:(id)a3
{
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setPrimaryFont:(id)a3
{
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setSecondaryFont:(id)a3
{
}

- (UIFont)tertiaryFont
{
  return self->_tertiaryFont;
}

- (void)setTertiaryFont:(id)a3
{
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (void)setAmountFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_tertiaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_selectionHandler, 0);
}

@end