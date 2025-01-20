@interface ChartLabelInfo
- (BOOL)immutable;
- (CGSize)size;
- (NSString)string;
- (double)position;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)retainStringAndSizeFromLabelInfo:(id)a3;
- (void)setImmutable:(BOOL)a3;
- (void)setPosition:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setString:(id)a3;
- (void)setStringToMonthAndDayWithDate:(id)a3 timeZone:(id)a4;
- (void)setStringToYearWithDate:(id)a3 timeZone:(id)a4;
@end

@implementation ChartLabelInfo

- (void)setString:(id)a3
{
  v5 = (NSString *)a3;
  p_string = &self->_string;
  if (self->_string != v5 && !self->_immutable)
  {
    v7 = v5;
    objc_storeStrong((id *)p_string, a3);
    v5 = v7;
    self->_size = (CGSize)*MEMORY[0x263F001B0];
  }

  MEMORY[0x270F9A758](p_string, v5);
}

- (void)setPosition:(double)a3
{
  if (!self->_immutable) {
    self->_position = a3;
  }
}

- (void)setImmutable:(BOOL)a3
{
  self->_immutable = a3;
}

- (void)setStringToMonthAndDayWithDate:(id)a3 timeZone:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = (void *)monthDayFormatter;
  if (!monthDayFormatter)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08790]);
    v9 = (void *)monthDayFormatter;
    monthDayFormatter = (uint64_t)v8;

    v10 = (void *)monthDayFormatter;
    v11 = [MEMORY[0x263EFF960] currentLocale];
    [v10 setLocale:v11];

    [(id)monthDayFormatter setDateStyle:1];
    [(id)monthDayFormatter setTimeStyle:1];
    v12 = (void *)monthDayFormatter;
    v13 = CPDateFormatStringForFormatType();
    [v12 setDateFormat:v13];

    v7 = (void *)monthDayFormatter;
  }
  [v7 setTimeZone:v6];
  v14 = [(id)monthDayFormatter stringFromDate:v15];
  [(ChartLabelInfo *)self setString:v14];
}

- (void)setStringToYearWithDate:(id)a3 timeZone:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = (void *)yearFormatter;
  if (!yearFormatter)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08790]);
    v9 = (void *)yearFormatter;
    yearFormatter = (uint64_t)v8;

    v10 = (void *)yearFormatter;
    v11 = [MEMORY[0x263EFF960] currentLocale];
    [v10 setLocale:v11];

    [(id)yearFormatter setDateStyle:1];
    [(id)yearFormatter setTimeStyle:1];
    v12 = (void *)yearFormatter;
    v13 = CPDateFormatStringForFormatType();
    [v12 setDateFormat:v13];

    v7 = (void *)yearFormatter;
  }
  [v7 setTimeZone:v6];
  v14 = [(id)yearFormatter stringFromDate:v15];
  [(ChartLabelInfo *)self setString:v14];
}

- (CGSize)size
{
  v12[1] = *MEMORY[0x263EF8340];
  if ([(NSString *)self->_string length])
  {
    if (self->_size.width == *MEMORY[0x263F001B0] && self->_size.height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      string = self->_string;
      uint64_t v11 = *MEMORY[0x263F1C238];
      v5 = +[ChartLabelInfoManager chartLabelFont];
      v12[0] = v5;
      id v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      [(NSString *)string sizeWithAttributes:v6];
      self->_size.double width = v7;
      self->_size.double height = v8;
    }
  }
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)retainStringAndSizeFromLabelInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 string];
  [(ChartLabelInfo *)self setString:v5];

  [v4 size];
  -[ChartLabelInfo setSize:](self, "setSize:");
  id v6 = [v4 accessibilityLabel];

  [(ChartLabelInfo *)self setAccessibilityLabel:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ChartLabelInfo);
  [(ChartLabelInfo *)v4 setString:self->_string];
  -[ChartLabelInfo setSize:](v4, "setSize:", self->_size.width, self->_size.height);
  [(ChartLabelInfo *)v4 setPosition:self->_position];
  v5 = [(ChartLabelInfo *)self accessibilityLabel];
  [(ChartLabelInfo *)v4 setAccessibilityLabel:v5];

  return v4;
}

- (id)description
{
  v3 = NSString;
  string = self->_string;
  v5 = NSStringFromCGSize(self->_size);
  id v6 = [v3 stringWithFormat:@"ChartLabelInfo with string = %@, size = %@, position = %f", string, v5, *(void *)&self->_position];

  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)position
{
  return self->_position;
}

- (BOOL)immutable
{
  return self->_immutable;
}

- (void).cxx_destruct
{
}

@end