@interface PKNumericSuggestionLastInput
- (BOOL)wentToMax;
- (NSDecimalNumber)value;
- (PKNumericSuggestionLastInput)init;
- (PKNumericSuggestionLastInput)initWithPassSerialNumber:(id)a3;
- (void)save;
- (void)setValue:(id)a3;
- (void)setWentToMax:(BOOL)a3;
@end

@implementation PKNumericSuggestionLastInput

- (PKNumericSuggestionLastInput)initWithPassSerialNumber:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKNumericSuggestionLastInput;
  v6 = [(PKNumericSuggestionLastInput *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialNumber, a3);
    v8 = PKNumericSuggestionLastInputForPassSerialNumber(v7->_serialNumber);
    uint64_t v9 = [v8 mutableCopy];
    passLastInputDictionary = v7->_passLastInputDictionary;
    v7->_passLastInputDictionary = (NSMutableDictionary *)v9;

    if (!v7->_passLastInputDictionary)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      v12 = v7->_passLastInputDictionary;
      v7->_passLastInputDictionary = (NSMutableDictionary *)v11;
    }
  }

  return v7;
}

- (PKNumericSuggestionLastInput)init
{
  return [(PKNumericSuggestionLastInput *)self initWithPassSerialNumber:0];
}

- (void)save
{
}

- (NSDecimalNumber)value
{
  v2 = [(NSMutableDictionary *)self->_passLastInputDictionary objectForKey:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = PKCurrencyStorageNumberToCurrencyDecimal(v2);
  }
  else
  {
    v3 = 0;
  }

  return (NSDecimalNumber *)v3;
}

- (BOOL)wentToMax
{
  v2 = [(NSMutableDictionary *)self->_passLastInputDictionary objectForKey:@"wentToMax"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setValue:(id)a3
{
  if (a3)
  {
    v4 = PKCurrencyDecimalToStorageNumber(a3);
    id v5 = v4;
    if (v4)
    {
      v7 = v4;
      uint64_t v6 = [v4 longLongValue];
      id v5 = v7;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableDictionary *)self->_passLastInputDictionary setObject:v7 forKey:@"value"];
        id v5 = v7;
      }
    }
  }
}

- (void)setWentToMax:(BOOL)a3
{
  passLastInputDictionary = self->_passLastInputDictionary;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)passLastInputDictionary setObject:v4 forKey:@"wentToMax"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLastInputDictionary, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end