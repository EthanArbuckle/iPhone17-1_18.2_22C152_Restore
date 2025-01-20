@interface PKPassTileValueNumber
+ (BOOL)supportsSecureCoding;
+ (id)createWithContent:(id)a3 currencyCode:(id)a4 numberStyle:(int64_t)a5;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (NSNumber)content;
- (NSString)currencyCode;
- (PKPassTileValueNumber)initWithCoder:(id)a3;
- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4;
- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4;
- (int64_t)numberStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setNumberStyle:(int64_t)a3;
@end

@implementation PKPassTileValueNumber

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassTileValueNumber;
  if ([(PKPassTileValue *)&v16 _setUpWithDictionary:v4]
    && ([v4 PKNumberForKey:@"content"],
        v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(),
        content = self->_content,
        self->_content = v5,
        content,
        self->_content))
  {
    v7 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = self->_currencyCode;
    self->_currencyCode = v7;

    v9 = [v4 PKStringForKey:@"numberStyle"];
    BOOL v10 = 1;
    self->_numberStyle = (int)_PKEnumValueFromString(v9, 0, @"PKNumberStyle", @"PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut", v11, v12, v13, v14, 1u);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)createWithContent:(id)a3 currencyCode:(id)a4 numberStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    BOOL v10 = +[PKPassTileValue _createForType:2 resolved:1];
    objc_storeStrong(v10 + 3, a3);
    objc_storeStrong(v10 + 4, a4);
    v10[5] = (id)a5;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileValueNumber;
  v5 = [(PKPassTileValue *)&v7 createResolvedValueWithBundle:a3 privateBundle:a4];
  objc_storeStrong(v5 + 3, self->_content);
  objc_storeStrong(v5 + 4, self->_currencyCode);
  v5[5] = self->_numberStyle;
  return v5;
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v6 = v5;
  if (self->_currencyCode)
  {
    objc_msgSend(v5, "setCurrencyCode:");
    int64_t numberStyle = 2;
  }
  else
  {
    int64_t numberStyle = self->_numberStyle;
  }
  [v6 setNumberStyle:numberStyle];
  id v8 = [v6 stringFromNumber:self->_content];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValueNumber)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassTileValueNumber;
  id v5 = [(PKPassTileValue *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberStyle"];
    v5->_int64_t numberStyle = (int)_PKEnumValueFromString(v10, 0, @"PKNumberStyle", @"PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut", v11, v12, v13, v14, 1u);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPassTileValueNumber;
  id v4 = a3;
  [(PKPassTileValue *)&v11 encodeWithCoder:v4];
  [v4 encodeObject:self->_content forKey:@"content"];
  [v4 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  BOOL v10 = _PKEnumValueToString(self->_numberStyle, @"PKNumberStyle", @"PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut", v5, v6, v7, v8, v9, 1);
  [v4 encodeObject:v10 forKey:@"numberStyle"];
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueNumber;
  id v7 = [(PKPassTileValue *)&v6 hash];
  uint64_t v8 = [(NSNumber *)self->_content hash];
  NSUInteger v3 = [(NSString *)self->_currencyCode hash];
  int64_t numberStyle = self->_numberStyle;
  NSUInteger v9 = v3;
  int64_t v10 = numberStyle;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileValueNumber;
  if ([(PKPassTileValue *)&v14 _isEqual:v4])
  {
    uint64_t v5 = (id *)v4;
    if ([v5[3] isEqualToNumber:self->_content])
    {
      currencyCode = self->_currencyCode;
      id v7 = (NSString *)v5[4];
      uint64_t v8 = currencyCode;
      if (v7 == v8)
      {

LABEL_13:
        BOOL v11 = v5[5] == self->_numberStyle;
LABEL_15:

        goto LABEL_16;
      }
      NSUInteger v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
      }
      else
      {
        BOOL v12 = [(NSString *)v7 isEqualToString:v8];

        if (v12) {
          goto LABEL_13;
        }
      }
    }
    BOOL v11 = 0;
    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (NSNumber)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (int64_t)numberStyle
{
  return self->_numberStyle;
}

- (void)setNumberStyle:(int64_t)a3
{
  self->_int64_t numberStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end