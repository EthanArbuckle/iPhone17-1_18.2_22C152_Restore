@interface PKCurrencyAmountSelectorOptionProvider
- (NSArray)options;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (PKCurrencyAmountSelectorOption)selectedOption;
- (PKCurrencyAmountSelectorOptionProvider)initWithType:(int64_t)a3 accountUser:(id)a4 currencyCode:(id)a5;
- (id)_optionWithAmount:(id)a3 isCustom:(BOOL)a4 selected:(BOOL)a5;
- (id)optionsUpdateHandler;
- (int64_t)type;
- (void)_updateOptions;
- (void)insertCustomAmount:(id)a3;
- (void)removeCustomAmount:(id)a3;
- (void)selectAmount:(id)a3;
- (void)setOptionsUpdateHandler:(id)a3;
@end

@implementation PKCurrencyAmountSelectorOptionProvider

- (PKCurrencyAmountSelectorOptionProvider)initWithType:(int64_t)a3 accountUser:(id)a4 currencyCode:(id)a5
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PKCurrencyAmountSelectorOptionProvider;
  v11 = [(PKCurrencyAmountSelectorOptionProvider *)&v28 init];
  v12 = v11;
  if (v11)
  {
    v11->_int64_t type = a3;
    objc_storeStrong((id *)&v11->_accountUser, a4);
    uint64_t v13 = [v10 copy];
    currencyCode = v12->_currencyCode;
    v12->_currencyCode = (NSString *)v13;

    v15 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"25"];
    v29[0] = v15;
    v16 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"50"];
    v29[1] = v16;
    v17 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"100"];
    v29[2] = v17;
    v18 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"250"];
    v29[3] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];

    defaultAmounts = v12->_defaultAmounts;
    v12->_defaultAmounts = (NSArray *)v19;

    uint64_t v21 = PKSharedCacheGetCustomOptions();
    customAmounts = v12->_customAmounts;
    v12->_customAmounts = (NSArray *)v21;

    int64_t type = v12->_type;
    if (type == 2)
    {
      v24 = [(PKAccountUser *)v12->_accountUser notificationSettings];
      uint64_t v25 = [v24 transactionNotificationThreshold];
    }
    else if (type == 1)
    {
      v24 = [(PKAccountUser *)v12->_accountUser notificationSettings];
      uint64_t v25 = [v24 monthlySpendNotificationThreshold];
    }
    else
    {
      if (type)
      {
LABEL_11:
        [(PKCurrencyAmountSelectorOptionProvider *)v12 _updateOptions];
        goto LABEL_12;
      }
      v24 = [(PKAccountUser *)v12->_accountUser preferences];
      if (![v24 transactionSpendLimitEnabled])
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v25 = [v24 transactionSpendLimitAmount];
    }
    amount = v12->_amount;
    v12->_amount = (NSDecimalNumber *)v25;

    goto LABEL_10;
  }
LABEL_12:

  return v12;
}

- (void)insertCustomAmount:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v11 = v5;
    objc_storeStrong((id *)&self->_amount, a3);
    id v6 = v11;
    PKSharedCacheGetCustomOptions();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    v8 = [v7 arrayByAddingObject:v6];

    PKSharedCacheSetCustomOptions(v8);
    PKSharedCacheGetCustomOptions();
    id v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customAmounts = self->_customAmounts;
    self->_customAmounts = v9;

    [(PKCurrencyAmountSelectorOptionProvider *)self _updateOptions];
    id v5 = v11;
  }
}

- (void)removeCustomAmount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    if (PKEqualObjects())
    {
      amount = self->_amount;
      self->_amount = 0;
    }
    id v6 = v11;
    id v7 = PKSharedCacheGetCustomOptions();
    v8 = objc_msgSend(v7, "pk_arrayByRemovingObject:", v6);

    PKSharedCacheSetCustomOptions(v8);
    PKSharedCacheGetCustomOptions();
    id v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customAmounts = self->_customAmounts;
    self->_customAmounts = v9;

    [(PKCurrencyAmountSelectorOptionProvider *)self _updateOptions];
    id v4 = v11;
  }
}

- (void)selectAmount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    [(PKCurrencyAmountSelectorOptionProvider *)self _updateOptions];
  }
}

- (id)_optionWithAmount:(id)a3 isCustom:(BOOL)a4 selected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    id v9 = PKCurrencyAmountMake();
    id v10 = v9;
    int64_t type = self->_type;
    if (type == 2 || type == 1)
    {
      v14 = [v9 formattedStringValue];
      v12 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_1.isa, &stru_1EF1B4C70.isa, v14);
    }
    else if (type)
    {
      v12 = 0;
    }
    else
    {
      v12 = [v9 formattedStringValue];
    }
    v15 = [[PKCurrencyAmountSelectorOption alloc] initWithCurrencyAmount:v10 displayValue:v12 customOption:v6 selected:v5];
  }
  else
  {
    unint64_t v13 = self->_type;
    if (v13 > 2)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = PKLocalizedMadisonString(&off_1E59D81F0[v13]->isa);
    }
    v15 = [[PKCurrencyAmountSelectorOption alloc] initWithCurrencyAmount:0 displayValue:v10 customOption:v6 selected:v5];
  }

  return v15;
}

- (void)_updateOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  defaultAmounts = self->_defaultAmounts;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke;
  v18[3] = &unk_1E59D8128;
  v18[4] = self;
  BOOL v5 = [(NSArray *)defaultAmounts pk_arrayByApplyingBlock:v18];
  [v3 addObjectsFromArray:v5];

  customAmounts = self->_customAmounts;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_2;
  v17[3] = &unk_1E59D8128;
  v17[4] = self;
  id v7 = [(NSArray *)customAmounts pk_arrayByApplyingBlock:v17];
  [v3 addObjectsFromArray:v7];

  id v8 = [(PKCurrencyAmountSelectorOptionProvider *)self _optionWithAmount:0 isCustom:0 selected:PKEqualObjects()];
  [v3 addObject:v8];

  id v9 = objc_msgSend(v3, "pk_anyObjectPassingTest:", &__block_literal_global_141);

  if (!v9)
  {
    id v10 = [(PKCurrencyAmountSelectorOptionProvider *)self _optionWithAmount:self->_amount isCustom:1 selected:1];
    [v3 addObject:v10];
  }
  id v11 = [v3 allObjects];
  v12 = [v11 sortedArrayUsingSelector:sel_compare_];
  options = self->_options;
  self->_options = v12;

  objc_msgSend(v3, "pk_anyObjectPassingTest:", &__block_literal_global_198_1);
  v14 = (PKCurrencyAmountSelectorOption *)objc_claimAutoreleasedReturnValue();
  selectedOption = self->_selectedOption;
  self->_selectedOption = v14;

  optionsUpdateHandler = (void (**)(id, NSArray *))self->_optionsUpdateHandler;
  if (optionsUpdateHandler) {
    optionsUpdateHandler[2](optionsUpdateHandler, self->_options);
  }
}

id __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _optionWithAmount:v3 isCustom:0 selected:PKEqualObjects()];

  return v4;
}

id __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _optionWithAmount:v3 isCustom:1 selected:PKEqualObjects()];

  return v4;
}

uint64_t __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 selected];
}

uint64_t __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 selected];
}

- (int64_t)type
{
  return self->_type;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSArray)options
{
  return self->_options;
}

- (PKCurrencyAmountSelectorOption)selectedOption
{
  return self->_selectedOption;
}

- (id)optionsUpdateHandler
{
  return self->_optionsUpdateHandler;
}

- (void)setOptionsUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_optionsUpdateHandler, 0);
  objc_storeStrong((id *)&self->_selectedOption, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_customAmounts, 0);
  objc_storeStrong((id *)&self->_defaultAmounts, 0);

  objc_storeStrong((id *)&self->_accountUser, 0);
}

@end