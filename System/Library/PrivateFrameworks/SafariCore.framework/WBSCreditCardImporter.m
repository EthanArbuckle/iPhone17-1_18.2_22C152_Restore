@interface WBSCreditCardImporter
- (BOOL)_checkNotAtRootLevel;
- (BOOL)_isParsingCreditCard;
- (BOOL)_isParsingCreditCardArray;
- (BOOL)jsonReader:(id)a3 appendKey:(id)a4;
- (BOOL)jsonReader:(id)a3 error:(id)a4;
- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4;
- (BOOL)jsonReaderBeginArray:(id)a3;
- (BOOL)jsonReaderBeginObject:(id)a3;
- (BOOL)jsonReaderEndArray:(id)a3;
- (BOOL)jsonReaderEndObject:(id)a3;
- (BOOL)parseFileHandle:(id)a3 error:(id *)a4;
- (BOOL)parseURL:(id)a3 error:(id *)a4;
- (WBSCreditCardImporterDelegate)delegate;
- (id)_popKeyFromStackIfPossible;
- (id)_sanitizedCardNumberFromImportedCardNumber:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WBSCreditCardImporter

- (BOOL)parseURL:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", a3, 0, 0, a4);
  if (v6) {
    BOOL v7 = [(WBSCreditCardImporter *)self parseFileHandle:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)parseFileHandle:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  id v6 = a3;
  BOOL v7 = objc_alloc_init(WBSJSONReader);
  [(WBSJSONReader *)v7 setDelegate:self];
  lastError = self->_lastError;
  self->_lastError = 0;

  v9 = [MEMORY[0x1E4F1CA48] array];
  stack = self->_stack;
  self->_stack = v9;

  self->_foundCreditCardArray = 0;
  BOOL v11 = [(WBSJSONReader *)v7 parseFileHandle:v6 error:a4];

  v12 = self->_lastError;
  if (!self->_foundCreditCardArray && !v12)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"Could not find credit card array in JSON file";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v15 = [v13 errorWithDomain:@"com.apple.Safari.Core.WBSCreditCardImporterErrorDomain" code:2 userInfo:v14];
    v16 = self->_lastError;
    self->_lastError = v15;

    BOOL v11 = 0;
    v12 = self->_lastError;
  }
  if (a4 && !*a4) {
    *a4 = v12;
  }
  if (v12) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v11;
  }

  return v17;
}

- (BOOL)_checkNotAtRootLevel
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_stack count];
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Root node is expected to be a dictionary";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = [v4 errorWithDomain:@"com.apple.Safari.Core.WBSCreditCardImporterErrorDomain" code:1 userInfo:v5];
    lastError = self->_lastError;
    self->_lastError = v6;
  }
  return v3 != 0;
}

- (BOOL)_isParsingCreditCardArray
{
  v5[3] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F10861D0;
  v5[1] = @"payment_cards";
  v5[2] = &unk_1F10861E8;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (BOOL)_isParsingCreditCard
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F10861D0;
  v5[1] = @"payment_cards";
  v5[2] = &unk_1F10861E8;
  v5[3] = &unk_1F10861D0;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (id)_popKeyFromStackIfPossible
{
  uint64_t v3 = [(NSMutableArray *)self->_stack lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(NSMutableArray *)self->_stack lastObject];
    [(NSMutableArray *)self->_stack removeLastObject];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)jsonReader:(id)a3 appendKey:(id)a4
{
  return 1;
}

- (BOOL)jsonReader:(id)a3 error:(id)a4
{
  return 0;
}

- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(WBSCreditCardImporter *)self _checkNotAtRootLevel];
  if (v7)
  {
    v8 = [(WBSCreditCardImporter *)self _popKeyFromStackIfPossible];
    if ([v8 isEqualToString:@"card_number"]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v9 = 32;
    }
    else if ([v8 isEqualToString:@"card_name"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"cardholder_name"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      uint64_t v9 = 48;
    }
    else if ([v8 isEqualToString:@"card_expiration_month"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      uint64_t v9 = 56;
    }
    else if ([v8 isEqualToString:@"card_expiration_year"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      uint64_t v9 = 64;
    }
    else
    {
      if (![v8 isEqualToString:@"card_last_used_time_usec"]) {
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      uint64_t v9 = 72;
    }
    objc_storeStrong((id *)((char *)&self->super.isa + v9), a4);
LABEL_21:
  }
  return v7;
}

- (BOOL)jsonReaderBeginArray:(id)a3
{
  BOOL v4 = [(WBSCreditCardImporter *)self _checkNotAtRootLevel];
  if (v4)
  {
    [(NSMutableArray *)self->_stack addObject:&unk_1F10861E8];
    if ([(WBSCreditCardImporter *)self _isParsingCreditCardArray]) {
      self->_foundCreditCardArray = 1;
    }
  }
  return v4;
}

- (BOOL)jsonReaderBeginObject:(id)a3
{
  [(NSMutableArray *)self->_stack addObject:&unk_1F10861D0];
  if ([(WBSCreditCardImporter *)self _isParsingCreditCard])
  {
    cardNumber = self->_cardNumber;
    self->_cardNumber = 0;

    cardName = self->_cardName;
    self->_cardName = 0;

    cardholderName = self->_cardholderName;
    self->_cardholderName = 0;

    expirationDateMonth = self->_expirationDateMonth;
    self->_expirationDateMonth = 0;

    expirationDateYear = self->_expirationDateYear;
    self->_expirationDateYear = 0;

    lastUsedDateTimeInterval = self->_lastUsedDateTimeInterval;
    self->_lastUsedDateTimeInterval = 0;
  }
  return 1;
}

- (BOOL)jsonReaderEndArray:(id)a3
{
  [(NSMutableArray *)self->_stack removeLastObject];
  id v4 = [(WBSCreditCardImporter *)self _popKeyFromStackIfPossible];
  return 1;
}

- (BOOL)jsonReaderEndObject:(id)a3
{
  if ([(WBSCreditCardImporter *)self _isParsingCreditCard])
  {
    id v4 = [(WBSCreditCardImporter *)self _sanitizedCardNumberFromImportedCardNumber:self->_cardNumber];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      cardName = self->_cardName;
      cardholderName = self->_cardholderName;
      expirationDateMonth = self->_expirationDateMonth;
      expirationDateYear = self->_expirationDateYear;
      lastUsedDateTimeInterval = self->_lastUsedDateTimeInterval;
      if (lastUsedDateTimeInterval)
      {
        BOOL v11 = (void *)MEMORY[0x1E4F1C9C8];
        [(NSNumber *)lastUsedDateTimeInterval doubleValue];
        v13 = [v11 dateWithTimeIntervalSince1970:v12 / 1000000.0];
        [WeakRetained importCreditCardDataWithCardNumber:v4 cardName:cardName cardholderName:cardholderName cardExpirationMonth:expirationDateMonth cardExpirationYear:expirationDateYear lastUsedDate:v13];
      }
      else
      {
        [WeakRetained importCreditCardDataWithCardNumber:v4 cardName:self->_cardName cardholderName:self->_cardholderName cardExpirationMonth:self->_expirationDateMonth cardExpirationYear:self->_expirationDateYear lastUsedDate:0];
      }
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[WBSCreditCardImporter jsonReaderEndObject:](v14);
      }
    }
  }
  [(NSMutableArray *)self->_stack removeLastObject];
  id v15 = [(WBSCreditCardImporter *)self _popKeyFromStackIfPossible];
  return 1;
}

- (id)_sanitizedCardNumberFromImportedCardNumber:(id)a3
{
  if (a3)
  {
    uint64_t v3 = WBSNormalizedCreditCardNumber(a3);
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (WBSCreditCardImporterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSCreditCardImporterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastUsedDateTimeInterval, 0);
  objc_storeStrong((id *)&self->_expirationDateYear, 0);
  objc_storeStrong((id *)&self->_expirationDateMonth, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_cardName, 0);
  objc_storeStrong((id *)&self->_cardNumber, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
}

- (void)jsonReaderEndObject:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Incomplete card data. Missing or invalid card number.", v1, 2u);
}

@end