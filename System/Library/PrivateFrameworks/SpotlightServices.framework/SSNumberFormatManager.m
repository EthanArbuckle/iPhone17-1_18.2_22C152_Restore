@interface SSNumberFormatManager
+ (id)currencyStringWithAmount:(id)a3 currencyCode:(id)a4;
+ (id)stringFromByteCount:(int64_t)a3;
+ (id)stringFromInt:(int)a3 withMinimumDigits:(unint64_t)a4;
+ (void)initialize;
- (NSByteCountFormatter)byteCountFormatter;
- (NSNumberFormatter)currencyFormatter;
- (NSNumberFormatter)numberFormatter;
- (SSNumberFormatManager)init;
- (void)setByteCountFormatter:(id)a3;
- (void)setCurrencyFormatter:(id)a3;
- (void)setNumberFormatter:(id)a3;
@end

@implementation SSNumberFormatManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sharedNumberFormatManager = objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
}

- (SSNumberFormatManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SSNumberFormatManager;
  v2 = [(SSNumberFormatManager *)&v9 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SSNumberFormatManager *)v2 setNumberFormatter:v3];

    v4 = objc_opt_new();
    [(SSNumberFormatManager *)v2 setByteCountFormatter:v4];

    v5 = [(SSNumberFormatManager *)v2 byteCountFormatter];
    [v5 setCountStyle:0];

    v6 = objc_opt_new();
    [(SSNumberFormatManager *)v2 setCurrencyFormatter:v6];

    v7 = [(SSNumberFormatManager *)v2 currencyFormatter];
    [v7 setNumberStyle:2];
  }
  return v2;
}

+ (id)stringFromInt:(int)a3 withMinimumDigits:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = [(id)sharedNumberFormatManager numberFormatter];
  [v6 setMinimumIntegerDigits:a4];
  v7 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
  v8 = [v6 stringFromNumber:v7];

  return v8;
}

+ (id)stringFromByteCount:(int64_t)a3
{
  v4 = [(id)sharedNumberFormatManager byteCountFormatter];
  uint64_t v5 = [v4 stringFromByteCount:a3];

  return v5;
}

+ (id)currencyStringWithAmount:(id)a3 currencyCode:(id)a4
{
  uint64_t v5 = (void *)sharedNumberFormatManager;
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 currencyFormatter];
  [v8 setCurrencyCode:v6];

  objc_super v9 = [(id)sharedNumberFormatManager currencyFormatter];
  v10 = [v9 stringFromNumber:v7];

  return v10;
}

- (NSNumberFormatter)numberFormatter
{
  return (NSNumberFormatter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNumberFormatter:(id)a3
{
}

- (NSByteCountFormatter)byteCountFormatter
{
  return (NSByteCountFormatter *)objc_getProperty(self, a2, 16, 1);
}

- (void)setByteCountFormatter:(id)a3
{
}

- (NSNumberFormatter)currencyFormatter
{
  return (NSNumberFormatter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrencyFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end