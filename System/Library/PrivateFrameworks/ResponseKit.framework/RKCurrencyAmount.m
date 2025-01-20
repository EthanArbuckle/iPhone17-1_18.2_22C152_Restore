@interface RKCurrencyAmount
+ (BOOL)supportsSecureCoding;
- (NSString)currency;
- (NSString)string;
- (RKCurrencyAmount)initWithCoder:(id)a3;
- (RKCurrencyAmount)initWithString:(id)a3 currency:(id)a4 value:(double)a5;
- (double)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RKCurrencyAmount

- (RKCurrencyAmount)initWithString:(id)a3 currency:(id)a4 value:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RKCurrencyAmount;
  v11 = [(RKCurrencyAmount *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_string, a3);
    objc_storeStrong((id *)&v12->_currency, a4);
    v12->_value = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RKCurrencyAmount)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RKCurrencyAmount;
  v5 = [(RKCurrencyAmount *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    [v4 decodeDoubleForKey:@"value"];
    v5->_value = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  string = self->_string;
  id v5 = a3;
  [v5 encodeObject:string forKey:@"string"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeDouble:@"value" forKey:self->_value];
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)currency
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end