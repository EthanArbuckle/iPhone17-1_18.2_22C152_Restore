@interface SUCreditCardReaderOutput
+ (BOOL)supportsSecureCoding;
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (BOOL)cancelled;
- (BOOL)manualEntrySelected;
- (NSError)error;
- (NSNumber)cardExpirationDay;
- (NSNumber)cardExpirationMonth;
- (NSNumber)cardExpirationYear;
- (NSString)cardCardholderName;
- (NSString)cardExpirationStringValue;
- (NSString)cardNumber;
- (SUCreditCardReaderOutput)initWithCoder:(id)a3;
- (SUCreditCardReaderOutput)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (id)scriptAttributeKeys;
- (void)encodeWithCoder:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCardCardholderName:(id)a3;
- (void)setCardExpirationDay:(id)a3;
- (void)setCardExpirationMonth:(id)a3;
- (void)setCardExpirationStringValue:(id)a3;
- (void)setCardExpirationYear:(id)a3;
- (void)setCardNumber:(id)a3;
- (void)setError:(id)a3;
- (void)setManualEntrySelected:(BOOL)a3;
@end

@implementation SUCreditCardReaderOutput

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUCreditCardReaderOutput;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  v3 = [(id)__KeyMapping_75 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(id)__KeyMapping_75 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUCreditCardReaderOutput;
    objc_super v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "1", self->_cancelled);
  MEMORY[0x22A680360](v3, "2", self->_cardCardholderName);
  MEMORY[0x22A680360](v3, "3", self->_cardExpirationDay);
  MEMORY[0x22A680360](v3, "4", self->_cardExpirationMonth);
  MEMORY[0x22A680360](v3, "5", self->_cardExpirationYear);
  MEMORY[0x22A680360](v3, "7", self->_cardNumber);
  MEMORY[0x22A680360](v3, "8", self->_error);
  xpc_dictionary_set_BOOL(v3, "9", self->_manualEntrySelected);
  return v3;
}

- (SUCreditCardReaderOutput)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4 && MEMORY[0x22A680D20](v4) == MEMORY[0x263EF8708])
  {
    v27.receiver = self;
    v27.super_class = (Class)SUCreditCardReaderOutput;
    v6 = [(SUScriptObject *)&v27 init];
    if (v6)
    {
      v6->_cancelled = xpc_dictionary_get_BOOL(v5, "1");
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = MEMORY[0x22A680350](v5, "2", v8);
      cardCardholderName = v6->_cardCardholderName;
      v6->_cardCardholderName = (NSString *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = MEMORY[0x22A680350](v5, "3", v11);
      cardExpirationDay = v6->_cardExpirationDay;
      v6->_cardExpirationDay = (NSNumber *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = MEMORY[0x22A680350](v5, "4", v14);
      cardExpirationMonth = v6->_cardExpirationMonth;
      v6->_cardExpirationMonth = (NSNumber *)v15;

      uint64_t v17 = objc_opt_class();
      uint64_t v18 = MEMORY[0x22A680350](v5, "5", v17);
      cardExpirationYear = v6->_cardExpirationYear;
      v6->_cardExpirationYear = (NSNumber *)v18;

      uint64_t v20 = objc_opt_class();
      uint64_t v21 = MEMORY[0x22A680350](v5, "7", v20);
      cardNumber = v6->_cardNumber;
      v6->_cardNumber = (NSString *)v21;

      id v23 = objc_alloc(MEMORY[0x263F087E8]);
      v24 = xpc_dictionary_get_value(v5, "8");
      uint64_t v25 = [v23 initWithXPCEncoding:v24];
      error = v6->_error;
      v6->_error = (NSError *)v25;

      v6->_manualEntrySelected = xpc_dictionary_get_BOOL(v5, "9");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL cancelled = self->_cancelled;
  id v5 = a3;
  [v5 encodeBool:cancelled forKey:@"1"];
  [v5 encodeObject:self->_cardCardholderName forKey:@"2"];
  [v5 encodeObject:self->_cardExpirationDay forKey:@"3"];
  [v5 encodeObject:self->_cardExpirationMonth forKey:@"4"];
  [v5 encodeObject:self->_cardExpirationYear forKey:@"5"];
  [v5 encodeObject:self->_cardNumber forKey:@"7"];
  [v5 encodeObject:self->_error forKey:@"8"];
  [v5 encodeBool:self->_manualEntrySelected forKey:@"9"];
}

- (SUCreditCardReaderOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUCreditCardReaderOutput;
  id v5 = [(SUScriptObject *)&v19 init];
  if (v5)
  {
    v5->_BOOL cancelled = [v4 decodeBoolForKey:@"1"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"2"];
    cardCardholderName = v5->_cardCardholderName;
    v5->_cardCardholderName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"3"];
    cardExpirationDay = v5->_cardExpirationDay;
    v5->_cardExpirationDay = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"4"];
    cardExpirationMonth = v5->_cardExpirationMonth;
    v5->_cardExpirationMonth = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"5"];
    cardExpirationYear = v5->_cardExpirationYear;
    v5->_cardExpirationYear = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"7"];
    cardNumber = v5->_cardNumber;
    v5->_cardNumber = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"8"];
    error = v5->_error;
    v5->_error = (NSError *)v16;

    v5->_manualEntrySelected = [v4 decodeBoolForKey:@"9"];
  }

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __KeyMapping_75 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"cardNumber", @"cardCardholderName", @"cardCardholderName", @"cardExpirationDay", @"cardExpirationDay", @"cardExpirationMonth", @"cardExpirationMonth", @"cardExpirationYear", @"cardExpirationYear", @"cardExpirationStringValue", @"cardExpirationStringValue", @"cancelled", @"cancelled", @"manualEntrySelected", @"manualEntrySelected", 0);
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_BOOL cancelled = a3;
}

- (NSString)cardCardholderName
{
  return self->_cardCardholderName;
}

- (void)setCardCardholderName:(id)a3
{
}

- (NSNumber)cardExpirationDay
{
  return self->_cardExpirationDay;
}

- (void)setCardExpirationDay:(id)a3
{
}

- (NSNumber)cardExpirationMonth
{
  return self->_cardExpirationMonth;
}

- (void)setCardExpirationMonth:(id)a3
{
}

- (NSNumber)cardExpirationYear
{
  return self->_cardExpirationYear;
}

- (void)setCardExpirationYear:(id)a3
{
}

- (NSString)cardExpirationStringValue
{
  return self->_cardExpirationStringValue;
}

- (void)setCardExpirationStringValue:(id)a3
{
}

- (NSString)cardNumber
{
  return self->_cardNumber;
}

- (void)setCardNumber:(id)a3
{
}

- (BOOL)manualEntrySelected
{
  return self->_manualEntrySelected;
}

- (void)setManualEntrySelected:(BOOL)a3
{
  self->_manualEntrySelected = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cardNumber, 0);
  objc_storeStrong((id *)&self->_cardExpirationStringValue, 0);
  objc_storeStrong((id *)&self->_cardExpirationYear, 0);
  objc_storeStrong((id *)&self->_cardExpirationMonth, 0);
  objc_storeStrong((id *)&self->_cardExpirationDay, 0);

  objc_storeStrong((id *)&self->_cardCardholderName, 0);
}

@end