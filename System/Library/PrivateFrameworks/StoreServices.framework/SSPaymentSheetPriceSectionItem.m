@interface SSPaymentSheetPriceSectionItem
- (NSString)label;
- (NSString)price;
- (SSPaymentSheetPriceSectionItem)initWithDictionary:(id)a3;
- (SSPaymentSheetPriceSectionItem)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)_parseDictionary:(id)a3 withCaseControl:(BOOL)a4;
- (void)setLabel:(id)a3;
- (void)setPrice:(id)a3;
@end

@implementation SSPaymentSheetPriceSectionItem

- (SSPaymentSheetPriceSectionItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSPaymentSheetPriceSectionItem;
  v5 = [(SSPaymentSheetPriceSectionItem *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"caseControl"];
    uint64_t v7 = [v6 BOOLValue];

    [(SSPaymentSheetPriceSectionItem *)v5 _parseDictionary:v4 withCaseControl:v7];
  }

  return v5;
}

- (void)_parseDictionary:(id)a3 withCaseControl:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  v6 = [v12 objectForKeyedSubscript:@"header"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v7 = [v6 localizedUppercaseString];
    }
    label = self->_label;
    self->_label = v7;
  }
  objc_super v9 = [v12 objectForKeyedSubscript:@"value"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      v10 = v9;
    }
    else
    {
      v10 = [v9 localizedUppercaseString];
    }
    price = self->_price;
    self->_price = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(SSPaymentSheetPriceSectionItem);
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  label = v5->_label;
  v5->_label = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_price copyWithZone:a3];
  price = v5->_price;
  v5->_price = (NSString *)v8;

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_label);
  SSXPCDictionarySetObject(v3, "1", self->_price);
  return v3;
}

- (SSPaymentSheetPriceSectionItem)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSPaymentSheetPriceSectionItem;
    uint64_t v6 = [(SSPaymentSheetPriceSectionItem *)&v14 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      label = v6->_label;
      v6->_label = (NSString *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      price = v6->_price;
      v6->_price = (NSString *)v12;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabel:(id)a3
{
}

- (NSString)price
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end