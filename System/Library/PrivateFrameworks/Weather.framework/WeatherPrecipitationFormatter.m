@interface WeatherPrecipitationFormatter
+ (id)convenienceFormatter;
- (NSLocale)locale;
- (WeatherPrecipitationFormatter)init;
- (double)convertDistanceInImperial:(double)result to:(int64_t)a4;
- (double)convertDistanceInMetric:(double)result to:(int64_t)a4;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromCentimeters:(double)a3;
- (id)stringFromDistance:(double)a3 isDataMetric:(BOOL)a4;
- (id)stringFromInches:(double)a3;
- (int64_t)precipitationUnit;
- (void)setLocale:(id)a3;
@end

@implementation WeatherPrecipitationFormatter

+ (id)convenienceFormatter
{
  if (convenienceFormatter_onceToken_0 != -1) {
    dispatch_once(&convenienceFormatter_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)convenienceFormatter_precipitationFormatter;
  return v2;
}

void __53__WeatherPrecipitationFormatter_convenienceFormatter__block_invoke()
{
  if (!convenienceFormatter_precipitationFormatter)
  {
    v0 = objc_alloc_init(WeatherPrecipitationFormatter);
    uint64_t v1 = convenienceFormatter_precipitationFormatter;
    convenienceFormatter_precipitationFormatter = (uint64_t)v0;
    MEMORY[0x270F9A758](v0, v1);
  }
}

- (WeatherPrecipitationFormatter)init
{
  v7.receiver = self;
  v7.super_class = (Class)WeatherPrecipitationFormatter;
  v2 = [(NSLengthFormatter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    v5 = [(NSLengthFormatter *)v2 numberFormatter];
    [v5 setMaximumFractionDigits:1];
  }
  return v2;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  id v5 = a3;
  id v6 = [(NSLengthFormatter *)self numberFormatter];
  [v6 setLocale:v5];
}

- (id)stringFromCentimeters:(double)a3
{
  return [(WeatherPrecipitationFormatter *)self stringFromDistance:1 isDataMetric:a3];
}

- (id)stringFromInches:(double)a3
{
  return [(WeatherPrecipitationFormatter *)self stringFromDistance:0 isDataMetric:a3];
}

- (id)stringFromDistance:(double)a3 isDataMetric:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = @"--";
  if (1.1755e-38 != a3)
  {
    int64_t v8 = [(WeatherPrecipitationFormatter *)self precipitationUnit];
    if (v4) {
      [(WeatherPrecipitationFormatter *)self convertDistanceInMetric:v8 to:a3];
    }
    else {
      [(WeatherPrecipitationFormatter *)self convertDistanceInImperial:v8 to:a3];
    }
    uint64_t v9 = -[NSLengthFormatter stringFromValue:unit:](self, "stringFromValue:unit:", v8);

    objc_super v7 = (__CFString *)v9;
  }
  return v7;
}

- (double)convertDistanceInImperial:(double)result to:(int64_t)a4
{
  if (a4 != 1281)
  {
    result = result * 2.54;
    if (a4 == 8) {
      return result * 10.0;
    }
  }
  return result;
}

- (double)convertDistanceInMetric:(double)result to:(int64_t)a4
{
  if (a4 == 8) {
    return result * 10.0;
  }
  if (a4 == 1281) {
    return result / 2.54;
  }
  return result;
}

- (int64_t)precipitationUnit
{
  uint64_t v3 = [(WeatherPrecipitationFormatter *)self locale];

  if (!v3) {
    return 9;
  }
  BOOL v4 = [(WeatherPrecipitationFormatter *)self locale];
  id v5 = [v4 objectForKey:*MEMORY[0x263EFF4D0]];

  id v6 = [(WeatherPrecipitationFormatter *)self locale];
  objc_super v7 = [v6 objectForKey:*MEMORY[0x263EFF560]];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    if ([&unk_26DAEAAA8 containsObject:v5]) {
      int64_t v9 = 8;
    }
    else {
      int64_t v9 = 9;
    }
  }
  else
  {
    int64_t v9 = 1281;
  }

  return v9;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v4 doubleValue];
    id v5 = -[WeatherPrecipitationFormatter stringFromCentimeters:](self, "stringFromCentimeters:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
}

@end