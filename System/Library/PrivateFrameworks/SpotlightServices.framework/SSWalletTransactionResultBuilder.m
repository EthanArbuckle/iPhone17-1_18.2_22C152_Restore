@interface SSWalletTransactionResultBuilder
+ (BOOL)supportsResult:(id)a3;
- (BOOL)buildSecondaryTitleIsDetached;
- (NSArray)descriptions;
- (NSNumber)transactionAmount;
- (NSString)businessName;
- (NSString)cashBackPercentage;
- (NSString)currencyCode;
- (NSString)date;
- (SSWalletTransactionResultBuilder)initWithResult:(id)a3;
- (id)buildDescriptions;
- (id)buildSecondaryTitle;
- (id)buildTitle;
- (id)buildTrailingTopText;
- (void)setBusinessName:(id)a3;
- (void)setCashBackPercentage:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDate:(id)a3;
- (void)setDescriptions:(id)a3;
- (void)setTransactionAmount:(id)a3;
@end

@implementation SSWalletTransactionResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSWalletTransactionResultBuilder;
  if (objc_msgSendSuper2(&v9, sel_supportsResult_, v4))
  {
    v10[0] = @"com.apple.finance.transaction";
    v10[1] = @"com.apple.pktransaction";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    v6 = [v4 contentType];
    char v7 = [v5 containsObject:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (SSWalletTransactionResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSWalletTransactionResultBuilder;
  v5 = [(SSResultBuilder *)&v15 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSWalletTransactionResultBuilder *)v5 setBusinessName:v6];

    char v7 = [v4 valueForAttribute:*MEMORY[0x1E4F231F0] withType:objc_opt_class()];
    [(SSWalletTransactionResultBuilder *)v5 setTransactionAmount:v7];

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F231F8] withType:objc_opt_class()];
    [(SSWalletTransactionResultBuilder *)v5 setCurrencyCode:v8];

    objc_super v9 = [v4 valueForAttribute:*MEMORY[0x1E4F23070] withType:objc_opt_class()];
    [(SSWalletTransactionResultBuilder *)v5 setDate:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22BF8] withType:objc_opt_class()];
    [(SSWalletTransactionResultBuilder *)v5 setCashBackPercentage:v10];

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    v12 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    v13 = [v11 componentsSeparatedByCharactersInSet:v12];
    [(SSWalletTransactionResultBuilder *)v5 setDescriptions:v13];
  }
  return v5;
}

- (id)buildTitle
{
  v3 = [(SSWalletTransactionResultBuilder *)self businessName];
  if ([v3 length])
  {
    id v4 = (void *)MEMORY[0x1E4F9A378];
    v5 = [(SSWalletTransactionResultBuilder *)self businessName];
    v6 = [v4 textWithString:v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSWalletTransactionResultBuilder;
    v6 = [(SSResultBuilder *)&v8 buildTitle];
  }

  return v6;
}

- (id)buildDescriptions
{
  v3 = [(SSWalletTransactionResultBuilder *)self descriptions];
  if ((unint64_t)[v3 count] > 1)
  {
    v5 = objc_opt_class();
    v6 = [(SSWalletTransactionResultBuilder *)self descriptions];
    id v4 = [v5 richTextsFromStrings:v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSWalletTransactionResultBuilder;
    id v4 = [(SSResultBuilder *)&v8 buildDescriptions];
  }

  return v4;
}

- (id)buildSecondaryTitle
{
  v3 = [(SSWalletTransactionResultBuilder *)self descriptions];
  if ((unint64_t)[v3 count] <= 2
    && ([(SSWalletTransactionResultBuilder *)self transactionAmount],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = [(SSWalletTransactionResultBuilder *)self currencyCode];

    if (v6)
    {
      char v7 = (void *)MEMORY[0x1E4F9A0E0];
      objc_super v8 = [(SSWalletTransactionResultBuilder *)self transactionAmount];
      objc_super v9 = [(SSWalletTransactionResultBuilder *)self currencyCode];
      v10 = +[SSNumberFormatManager currencyStringWithAmount:v8 currencyCode:v9];
      v11 = [v7 textWithString:v10];

      goto LABEL_7;
    }
  }
  else
  {
  }
  v13.receiver = self;
  v13.super_class = (Class)SSWalletTransactionResultBuilder;
  v11 = [(SSResultBuilder *)&v13 buildSecondaryTitle];
LABEL_7:
  return v11;
}

- (BOOL)buildSecondaryTitleIsDetached
{
  v2 = [(SSWalletTransactionResultBuilder *)self buildSecondaryTitle];
  v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)buildTrailingTopText
{
  v3 = [(SSWalletTransactionResultBuilder *)self cashBackPercentage];
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F9A0E0];
    v5 = [(SSWalletTransactionResultBuilder *)self cashBackPercentage];
    v6 = [v4 textWithString:v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSWalletTransactionResultBuilder;
    v6 = [(SSResultBuilder *)&v8 buildTrailingTopText];
  }

  [v6 setEncapsulationStyle:2];
  return v6;
}

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessName:(id)a3
{
}

- (NSNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)cashBackPercentage
{
  return self->_cashBackPercentage;
}

- (void)setCashBackPercentage:(id)a3
{
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (void)setDescriptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_cashBackPercentage, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_businessName, 0);
}

@end