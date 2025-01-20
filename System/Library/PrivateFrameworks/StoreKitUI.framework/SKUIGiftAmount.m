@interface SKUIGiftAmount
- (NSNumber)value;
- (NSString)displayLabel;
- (NSString)partNumber;
- (SKUIGiftAmount)initWithAmountDictionary:(id)a3;
- (id)HTTPBodyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisplayLabel:(id)a3;
- (void)setPartNumber:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SKUIGiftAmount

- (SKUIGiftAmount)initWithAmountDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftAmount initWithAmountDictionary:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGiftAmount;
  v5 = [(SKUIGiftAmount *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      displayLabel = v5->_displayLabel;
      v5->_displayLabel = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"partNumber"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      partNumber = v5->_partNumber;
      v5->_partNumber = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"value"];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v12, "integerValue"));
      value = v5->_value;
      v5->_value = (NSNumber *)v13;
    }
  }

  return v5;
}

- (id)HTTPBodyDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"charity" forKey:@"giftType"];
  partNumber = self->_partNumber;
  if (partNumber) {
    [v3 setObject:partNumber forKey:@"partNumber"];
  }
  value = self->_value;
  if (value)
  {
    v6 = [(NSNumber *)value stringValue];
    [v3 setObject:v6 forKey:@"amount"];
  }
  uint64_t v7 = [MEMORY[0x1E4FB8800] sharedInstance];
  v8 = [v7 guid];

  if (v8) {
    [v3 setObject:v8 forKey:@"guid"];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_displayLabel copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_partNumber copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSNumber *)self->_value copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
}

- (NSString)partNumber
{
  return self->_partNumber;
}

- (void)setPartNumber:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_partNumber, 0);

  objc_storeStrong((id *)&self->_displayLabel, 0);
}

- (void)initWithAmountDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftAmount initWithAmountDictionary:]";
}

@end