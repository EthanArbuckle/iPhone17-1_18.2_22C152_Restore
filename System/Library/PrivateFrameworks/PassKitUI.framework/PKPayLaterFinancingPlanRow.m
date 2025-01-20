@interface PKPayLaterFinancingPlanRow
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlightItem;
- (BOOL)showSpinner;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)amountText;
- (NSString)tertiaryText;
- (PKPayLaterFinancingPlanRow)initWithFinancingPlan:(id)a3 rowIndex:(int64_t)a4 selectionHandler:(id)a5;
- (UIImage)icon;
- (unint64_t)context;
- (unint64_t)hash;
- (unint64_t)maskType;
- (void)configureCell:(id)a3;
- (void)handleCellSelectionWithContinueBlock:(id)a3;
- (void)setAmountText:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setIcon:(id)a3;
- (void)setMaskType:(unint64_t)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setTertiaryText:(id)a3;
@end

@implementation PKPayLaterFinancingPlanRow

- (PKPayLaterFinancingPlanRow)initWithFinancingPlan:(id)a3 rowIndex:(int64_t)a4 selectionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlanRow;
  v11 = [(PKPayLaterFinancingPlanRow *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_financingPlan, a3);
    v12->_rowIndex = a4;
    uint64_t v13 = [v10 copy];
    id selectionHandler = v12->_selectionHandler;
    v12->_id selectionHandler = (id)v13;
  }
  return v12;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  financingPlan = self->_financingPlan;
  if (financingPlan)
  {
    v7 = [(PKPayLaterFinancingPlan *)financingPlan planIdentifier];
    [v3 appendString:v7];
  }
  v8 = (void *)[v3 copy];

  return (NSCopying *)v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v8 = a3;
  [(PKPayLaterFinancingPlanRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    unint64_t context = self->_context;
    financingPlan = self->_financingPlan;
    int64_t rowIndex = self->_rowIndex;
    id v7 = v8;
    [v7 setFinancingPlan:financingPlan context:context rowIndex:rowIndex];
    [v7 setIcon:self->_icon animated:0];
    [v7 setMaskType:self->_maskType];
    [v7 setShowSpinner:self->_showSpinner];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_financingPlan];
  [v3 safelyAddObject:self->_icon];
  v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_tertiaryText];
  [v3 safelyAddObject:self->_amountText];
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterFinancingPlanRow *)a3;
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
        v6 = v5;
        if (!PKEqualObjects() || !PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
        id v7 = (void *)v6[6];
        id v8 = self->_tertiaryText;
        id v9 = v7;
        if (v8 == v9)
        {
        }
        else
        {
          id v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_27;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_28;
          }
        }
        v12 = (void *)v6[7];
        id v8 = self->_amountText;
        uint64_t v13 = v12;
        if (v8 == v13)
        {

LABEL_21:
          id v8 = (NSString *)_Block_copy(self->_selectionHandler);
          id v10 = _Block_copy(v6[3]);
          LOBYTE(v11) = PKEqualObjects()
                     && (const void *)self->_context == v6[8]
                     && self->_showSpinner == *((unsigned __int8 *)v6 + 32)
                     && (const void *)self->_rowIndex == v6[2]
                     && self->_maskType == (void)v6[9];
          goto LABEL_27;
        }
        id v10 = v13;
        LOBYTE(v11) = 0;
        if (v8 && v13)
        {
          BOOL v11 = [(NSString *)v8 isEqualToString:v13];

          if (!v11) {
            goto LABEL_28;
          }
          goto LABEL_21;
        }
LABEL_27:

        goto LABEL_28;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_29:

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

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
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

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_unint64_t context = a3;
}

- (unint64_t)maskType
{
  return self->_maskType;
}

- (void)setMaskType:(unint64_t)a3
{
  self->_maskType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end