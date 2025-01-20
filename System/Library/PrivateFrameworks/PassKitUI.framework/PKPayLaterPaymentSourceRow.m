@interface PKPayLaterPaymentSourceRow
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (BOOL)shouldHighlightItem;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)overrideSecondaryText;
- (PKPayLaterPaymentSourceRow)initWithPayLaterPaymentSource:(id)a3 selectionHandler:(id)a4;
- (UIImage)image;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
- (void)setDisabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setOverrideSecondaryText:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKPayLaterPaymentSourceRow

- (PKPayLaterPaymentSourceRow)initWithPayLaterPaymentSource:(id)a3 selectionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterPaymentSourceRow;
  v9 = [(PKPayLaterPaymentSourceRow *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentSource, a3);
    uint64_t v11 = [v8 copy];
    id selectionHandler = v10->_selectionHandler;
    v10->_id selectionHandler = (id)v11;
  }
  return v10;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  v6 = [(PKPayLaterPaymentSource *)self->_paymentSource identifier];
  [v3 appendString:v6];

  if (self->_disabled) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  id v8 = [NSString stringWithFormat:@"disabled-%@", v7];
  [v3 appendString:v8];

  if (self->_selected) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = [NSString stringWithFormat:@"selected-%@", v9];
  [v3 appendString:v10];

  uint64_t v11 = (void *)[v3 copy];

  return (NSCopying *)v11;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPayLaterPaymentSourceRow *)self cellClass];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  v5 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  v6 = [v5 textProperties];
  [v6 setNumberOfLines:1];

  uint64_t v7 = [(PKPayLaterPaymentSource *)self->_paymentSource type];
  switch(v7)
  {
    case 3:
      id v8 = [(PKPayLaterPaymentSource *)self->_paymentSource fundingSource];
      v10 = [v8 displayName];
      [v5 setText:v10];

      uint64_t v11 = [v8 panSuffix];
LABEL_10:
      v12 = (void *)v11;
      [v5 setSecondaryText:v11];
      goto LABEL_11;
    case 2:
      id v8 = [(PKPayLaterPaymentSource *)self->_paymentSource accountPaymentFundingSource];
      v12 = [v8 bankAccountRepresentation];
      v13 = [v12 bankName];
      [v5 setText:v13];

      objc_super v14 = [v12 maskedAccountNumber];
      [v5 setSecondaryText:v14];

LABEL_11:
      goto LABEL_12;
    case 1:
      id v8 = [(PKPayLaterPaymentSource *)self->_paymentSource paymentPass];
      v9 = [v8 localizedDescription];
      [v5 setText:v9];

      if (self->_overrideSecondaryText)
      {
        objc_msgSend(v5, "setSecondaryText:");
LABEL_12:

        break;
      }
      uint64_t v11 = PKSanitizedPrimaryAccountRepresentationForPass();
      goto LABEL_10;
  }
  v15 = [v5 secondaryTextProperties];
  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v15 setColor:v16];

  [v5 setImage:self->_image];
  objc_msgSend(v5, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
  if (self->_selected)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    v19[0] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v4 setAccessories:v18];
  [v4 setContentConfiguration:v5];
  [v4 setUserInteractionEnabled:!self->_disabled];

LABEL_17:
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_paymentSource];
  id v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  PKCombinedHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterPaymentSourceRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
    {
      uint64_t v7 = _Block_copy(self->_selectionHandler);
      id v8 = _Block_copy(v6[2]);
      BOOL v9 = PKEqualObjects()
        && self->_selected == *((unsigned __int8 *)v6 + 25)
        && self->_disabled == *((unsigned __int8 *)v6 + 24);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)handleCellSelection
{
  id selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2]();
  }
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler && !self->_selected;
}

- (NSString)overrideSecondaryText
{
  return self->_overrideSecondaryText;
}

- (void)setOverrideSecondaryText:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_overrideSecondaryText, 0);
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_paymentSource, 0);
}

@end