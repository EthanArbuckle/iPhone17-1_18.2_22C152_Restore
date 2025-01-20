@interface WeatherVisibilityFormatter
+ (id)convenienceFormatter;
- (NSLocale)locale;
- (WeatherVisibilityFormatter)init;
- (id)stringFromDistance:(double)a3 isDataMetric:(BOOL)a4;
- (id)stringFromKilometers:(double)a3;
- (id)stringFromMiles:(double)a3;
- (void)setLocale:(id)a3;
@end

@implementation WeatherVisibilityFormatter

+ (id)convenienceFormatter
{
  v2 = (void *)convenienceFormatter_distanceFormatter;
  if (!convenienceFormatter_distanceFormatter)
  {
    if (convenienceFormatter_onceToken_1 != -1) {
      dispatch_once(&convenienceFormatter_onceToken_1, &__block_literal_global_14);
    }
    v2 = (void *)convenienceFormatter_distanceFormatter;
  }
  return v2;
}

uint64_t __50__WeatherVisibilityFormatter_convenienceFormatter__block_invoke()
{
  v0 = objc_alloc_init(WeatherVisibilityFormatter);
  uint64_t v1 = convenienceFormatter_distanceFormatter;
  convenienceFormatter_distanceFormatter = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WeatherVisibilityFormatter)init
{
  v7.receiver = self;
  v7.super_class = (Class)WeatherVisibilityFormatter;
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

- (id)stringFromKilometers:(double)a3
{
  return [(WeatherVisibilityFormatter *)self stringFromDistance:1 isDataMetric:a3];
}

- (id)stringFromMiles:(double)a3
{
  return [(WeatherVisibilityFormatter *)self stringFromDistance:0 isDataMetric:a3];
}

- (id)stringFromDistance:(double)a3 isDataMetric:(BOOL)a4
{
  if (!a4) {
    a3 = a3 * 1.60934;
  }
  v6.receiver = self;
  v6.super_class = (Class)WeatherVisibilityFormatter;
  v4 = [(NSLengthFormatter *)&v6 stringFromMeters:a3 * 1000.0];
  return v4;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
}

@end