@interface PKPayLaterProgressRow
+ (id)progressRowsWithInstallmentCount:(int64_t)a3 firstRowFont:(id)a4 dynamicContentPage:(id)a5;
+ (void)_purchaseStringsForInstallmentNumber:(unint64_t)a3 title:(id *)a4 amountString:(id *)a5 dynamicContentPage:(id)a6;
- (BOOL)centerPrimaryText;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlightItem;
- (BOOL)showChevron;
- (Class)cellClass;
- (NSAttributedString)amountText;
- (NSAttributedString)primaryText;
- (NSAttributedString)secondaryText;
- (NSAttributedString)tertiaryText;
- (NSCopying)identifier;
- (NSString)description;
- (PKGradientVerticalConnector)bottomConnector;
- (PKGradientVerticalConnector)topConnector;
- (PKPayLaterProgressRow)initWithRowIndex:(int64_t)a3 primaryText:(id)a4 secondaryText:(id)a5 amountText:(id)a6 selectionHandler:(id)a7;
- (PKPayLaterProgressRow)initWithRowIndex:(int64_t)a3 selectionHandler:(id)a4;
- (UIColor)amountTextColor;
- (UIColor)backgroundColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)tertiaryTextColor;
- (UIFont)amountFont;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (double)minimumHeight;
- (id)selectionHandler;
- (int64_t)rowIndex;
- (unint64_t)hash;
- (unint64_t)targetType;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
- (void)setAmountFont:(id)a3;
- (void)setAmountText:(id)a3;
- (void)setAmountTextColor:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBottomConnector:(id)a3;
- (void)setCenterPrimaryText:(BOOL)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setShowChevron:(BOOL)a3;
- (void)setTargetType:(unint64_t)a3;
- (void)setTertiaryText:(id)a3;
- (void)setTertiaryTextColor:(id)a3;
- (void)setTopConnector:(id)a3;
@end

@implementation PKPayLaterProgressRow

- (PKPayLaterProgressRow)initWithRowIndex:(int64_t)a3 selectionHandler:(id)a4
{
  return [(PKPayLaterProgressRow *)self initWithRowIndex:a3 primaryText:0 secondaryText:0 amountText:0 selectionHandler:a4];
}

- (PKPayLaterProgressRow)initWithRowIndex:(int64_t)a3 primaryText:(id)a4 secondaryText:(id)a5 amountText:(id)a6 selectionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PKPayLaterProgressRow;
  v16 = [(PKPayLaterProgressRow *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_rowIndex = a3;
    uint64_t v18 = objc_msgSend(v12, "pk_attributedString");
    primaryText = v17->_primaryText;
    v17->_primaryText = (NSAttributedString *)v18;

    uint64_t v20 = objc_msgSend(v13, "pk_attributedString");
    secondaryText = v17->_secondaryText;
    v17->_secondaryText = (NSAttributedString *)v20;

    uint64_t v22 = objc_msgSend(v14, "pk_attributedString");
    amountText = v17->_amountText;
    v17->_amountText = (NSAttributedString *)v22;

    uint64_t v24 = [v15 copy];
    id selectionHandler = v17->_selectionHandler;
    v17->_id selectionHandler = (id)v24;
  }
  return v17;
}

+ (id)progressRowsWithInstallmentCount:(int64_t)a3 firstRowFont:(id)a4 dynamicContentPage:(id)a5
{
  id v43 = a5;
  v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  id v42 = objc_alloc_init(v7);
  uint64_t v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  v40 = (void *)v9;
  if (v8) {
    v10 = v8;
  }
  else {
    v10 = (void *)v9;
  }
  id v39 = v10;

  if (a3 >= 1)
  {
    uint64_t v11 = 0;
    id v12 = off_1E59C3000;
    while (1)
    {
      id v44 = 0;
      id v45 = 0;
      [a1 _purchaseStringsForInstallmentNumber:v11 title:&v45 amountString:&v44 dynamicContentPage:v43];
      id v13 = v45;
      id v14 = v44;
      id v15 = [[PKPayLaterProgressRow alloc] initWithRowIndex:v11 primaryText:v13 secondaryText:0 amountText:v14 selectionHandler:0];

      if (v11 == 1) {
        break;
      }
      if (v11)
      {
        id v33 = objc_alloc(v12[196]);
        v34 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        v35 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        v23 = (void *)[v33 initWithTopGradientColor:v34 bottomGradientColor:v35];

        if (v11 + 1 >= a3)
        {
          uint64_t v22 = 0;
          ++v11;
          id v24 = v40;
          uint64_t v25 = 2;
          goto LABEL_14;
        }
        id v36 = objc_alloc(v12[196]);
        v19 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        v21 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        uint64_t v22 = (void *)[v36 initWithTopGradientColor:v19 bottomGradientColor:v21];
        goto LABEL_12;
      }
      v16 = (void *)MEMORY[0x1E4FB1618];
      v17 = PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
      uint64_t v18 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
      v19 = objc_msgSend(v16, "pkui_blendFromColor:toColor:withProgress:", v17, v18, 0.5);

      id v20 = objc_alloc(v12[196]);
      v21 = PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
      uint64_t v22 = (void *)[v20 initWithTopGradientColor:v21 bottomGradientColor:v19];
      v23 = 0;
      id v24 = v39;
      uint64_t v25 = 3;
LABEL_13:

      ++v11;
LABEL_14:
      [(PKPayLaterProgressRow *)v15 setTargetType:v25];
      [(PKPayLaterProgressRow *)v15 setTopConnector:v23];
      [(PKPayLaterProgressRow *)v15 setBottomConnector:v22];
      [(PKPayLaterProgressRow *)v15 setPrimaryFont:v24];
      [(PKPayLaterProgressRow *)v15 setAmountFont:v24];
      [v42 addObject:v15];

      id v12 = off_1E59C3000;
      if (v11 == a3) {
        goto LABEL_17;
      }
    }
    v26 = (void *)MEMORY[0x1E4FB1618];
    objc_super v27 = PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
    v28 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    v19 = objc_msgSend(v26, "pkui_blendFromColor:toColor:withProgress:", v27, v28, 0.5);

    id v29 = objc_alloc(v12[196]);
    v30 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    v23 = (void *)[v29 initWithTopGradientColor:v19 bottomGradientColor:v30];

    id v31 = objc_alloc(v12[196]);
    v21 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    v32 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    uint64_t v22 = (void *)[v31 initWithTopGradientColor:v21 bottomGradientColor:v32];

LABEL_12:
    id v24 = v40;
    uint64_t v25 = 2;
    goto LABEL_13;
  }
LABEL_17:
  v37 = (void *)[v42 copy];

  return v37;
}

+ (void)_purchaseStringsForInstallmentNumber:(unint64_t)a3 title:(id *)a4 amountString:(id *)a5 dynamicContentPage:(id)a6
{
  id v15 = [a6 sections];
  if ([v15 count])
  {
    uint64_t v9 = [v15 firstObject];
    v10 = [v9 rows];
    uint64_t v11 = [v9 rows];
    unint64_t v12 = [v11 count];

    if (v12 > a3)
    {
      id v13 = [v9 rows];
      id v14 = [v13 objectAtIndexedSubscript:a3];

      if (a4)
      {
        *a4 = [v14 contentTitle];
      }
      if (a5)
      {
        *a5 = [v14 contentDetailTrailing];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  primaryText = self->_primaryText;
  if (primaryText)
  {
    v7 = [(NSAttributedString *)primaryText string];
    [v3 appendString:v7];
  }
  secondaryText = self->_secondaryText;
  if (secondaryText)
  {
    uint64_t v9 = [(NSAttributedString *)secondaryText string];
    [v3 appendString:v9];
  }
  tertiaryText = self->_tertiaryText;
  if (tertiaryText)
  {
    uint64_t v11 = [(NSAttributedString *)tertiaryText string];
    [v3 appendString:v11];
  }
  amountText = self->_amountText;
  if (amountText)
  {
    id v13 = [(NSAttributedString *)amountText string];
    [v3 appendString:v13];
  }
  objc_msgSend(v3, "appendFormat:", @"rowIndex:%ld", self->_rowIndex);
  if (self->_topConnector) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  id v15 = [NSString stringWithFormat:@"hasTopConnector-%@", v14];
  [v3 appendString:v15];

  if (self->_bottomConnector) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  v17 = [NSString stringWithFormat:@"hasBottomConnector-%@", v16];
  [v3 appendString:v17];

  uint64_t v18 = (void *)[v3 copy];

  return (NSCopying *)v18;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v8 = a3;
  [(PKPayLaterProgressRow *)self cellClass];
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = v8;
  if (isKindOfClass)
  {
    id v6 = v8;
    [v6 setPrimaryText:self->_primaryText];
    [v6 setSecondaryText:self->_secondaryText];
    [v6 setTertiaryText:self->_tertiaryText];
    [v6 setAmountText:self->_amountText];
    [v6 setShowChevron:self->_showChevron];
    [v6 setTopConnector:self->_topConnector];
    [v6 setBottomConnector:self->_bottomConnector];
    [v6 setTargetType:self->_targetType];
    [v6 setPrimaryTextColor:self->_primaryTextColor];
    [v6 setSecondaryTextColor:self->_secondaryTextColor];
    [v6 setTertiaryTextColor:self->_tertiaryTextColor];
    [v6 setAmountTextColor:self->_amountTextColor];
    [v6 setPrimaryFont:self->_primaryFont];
    [v6 setSecondaryFont:self->_secondaryFont];
    [v6 setAmountFont:self->_amountFont];
    [v6 setMinimumHeight:self->_minimumHeight];
    [v6 setCenterPrimaryText:self->_centerPrimaryText];
    [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F858A0]];
    if (self->_backgroundColor)
    {
      v7 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
      [v7 setBackgroundColor:self->_backgroundColor];
      [v6 setBackgroundConfiguration:v7];
    }
    v5 = v8;
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_primaryText];
  [v3 safelyAddObject:self->_secondaryText];
  [v3 safelyAddObject:self->_amountText];
  [v3 safelyAddObject:self->_tertiaryText];
  [v3 safelyAddObject:self->_topConnector];
  [v3 safelyAddObject:self->_bottomConnector];
  [v3 safelyAddObject:self->_primaryTextColor];
  [v3 safelyAddObject:self->_secondaryTextColor];
  [v3 safelyAddObject:self->_tertiaryTextColor];
  [v3 safelyAddObject:self->_amountTextColor];
  [v3 safelyAddObject:self->_primaryFont];
  [v3 safelyAddObject:self->_secondaryFont];
  [v3 safelyAddObject:self->_amountFont];
  v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_backgroundColor];
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterProgressRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if (PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects())
    {
      v7 = _Block_copy(self->_selectionHandler);
      id v8 = _Block_copy(v6[19]);
      BOOL v9 = PKEqualObjects()
        && PKEqualObjects()
        && self->_showChevron == *((unsigned __int8 *)v6 + 8)
        && self->_minimumHeight == *((double *)v6 + 15)
        && self->_centerPrimaryText == *((unsigned __int8 *)v6 + 9)
        && (const void *)self->_rowIndex == v6[2]
        && self->_targetType == (void)v6[18];
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

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"primaryText: '%@'; ", self->_primaryText];
  [v3 appendFormat:@"secondaryText: '%@'; ", self->_secondaryText];
  [v3 appendFormat:@"tertiaryText: '%@'; ", self->_tertiaryText];
  [v3 appendFormat:@"amountText: '%@'; ", self->_amountText];
  [v3 appendFormat:@">"];

  return (NSString *)v3;
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
  return self->_selectionHandler != 0;
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (void)setShowChevron:(BOOL)a3
{
  self->_showChevron = a3;
}

- (int64_t)rowIndex
{
  return self->_rowIndex;
}

- (NSAttributedString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
}

- (NSAttributedString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (NSAttributedString)tertiaryText
{
  return self->_tertiaryText;
}

- (void)setTertiaryText:(id)a3
{
}

- (NSAttributedString)amountText
{
  return self->_amountText;
}

- (void)setAmountText:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
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

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (void)setAmountFont:(id)a3
{
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (PKGradientVerticalConnector)topConnector
{
  return self->_topConnector;
}

- (void)setTopConnector:(id)a3
{
}

- (PKGradientVerticalConnector)bottomConnector
{
  return self->_bottomConnector;
}

- (void)setBottomConnector:(id)a3
{
}

- (unint64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(unint64_t)a3
{
  self->_targetType = a3;
}

- (BOOL)centerPrimaryText
{
  return self->_centerPrimaryText;
}

- (void)setCenterPrimaryText:(BOOL)a3
{
  self->_centerPrimaryText = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_bottomConnector, 0);
  objc_storeStrong((id *)&self->_topConnector, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);

  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end