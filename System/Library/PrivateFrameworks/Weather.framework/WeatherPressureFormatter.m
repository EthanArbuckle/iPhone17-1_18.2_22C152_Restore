@interface WeatherPressureFormatter
+ (id)convenienceFormatter;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (NSLocale)locale;
- (WeatherPressureFormatter)init;
- (float)convertInchesHGPressure:(float)result toUnit:(int)a4;
- (float)convertMBarPressure:(float)result toUnit:(int)a4;
- (id)fallbackStringForPressure:(float)a3;
- (id)formatStringForPressure:(float)a3 inUnit:(int)a4;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromInchesHG:(float)a3;
- (id)stringFromMillibars:(float)a3;
- (id)stringFromPressure:(float)a3 isDataMetric:(BOOL)a4;
- (int)pressureUnit;
- (void)createNumberFormatter;
- (void)dealloc;
- (void)resetFormatter;
- (void)setLocale:(id)a3;
@end

@implementation WeatherPressureFormatter

+ (id)convenienceFormatter
{
  if (convenienceFormatter_onceToken_2 != -1) {
    dispatch_once(&convenienceFormatter_onceToken_2, &__block_literal_global_23);
  }
  v2 = (void *)convenienceFormatter_pressureFormatter;
  return v2;
}

void __48__WeatherPressureFormatter_convenienceFormatter__block_invoke()
{
  if (!convenienceFormatter_pressureFormatter)
  {
    v0 = objc_alloc_init(WeatherPressureFormatter);
    uint64_t v1 = convenienceFormatter_pressureFormatter;
    convenienceFormatter_pressureFormatter = (uint64_t)v0;
    MEMORY[0x270F9A758](v0, v1);
  }
}

- (WeatherPressureFormatter)init
{
  v7.receiver = self;
  v7.super_class = (Class)WeatherPressureFormatter;
  v2 = [(WeatherPressureFormatter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    numberFormatter = [(WeatherPressureFormatter *)v2 createNumberFormatter];
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_resetFormatter name:*MEMORY[0x263EFF458] object:0];
  }
  return v2;
}

- (void)dealloc
{
  unum_close();
  v3.receiver = self;
  v3.super_class = (Class)WeatherPressureFormatter;
  [(WeatherPressureFormatter *)&v3 dealloc];
}

- (void)resetFormatter
{
  numberFormatter = [(WeatherPressureFormatter *)self createNumberFormatter];
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  [(WeatherPressureFormatter *)self resetFormatter];
}

- (id)stringFromPressure:(float)a3 isDataMetric:(BOOL)a4
{
  if (a4) {
    -[WeatherPressureFormatter stringFromMillibars:](self, "stringFromMillibars:");
  }
  else {
  v4 = -[WeatherPressureFormatter stringFromInchesHG:](self, "stringFromInchesHG:");
  }
  return v4;
}

- (id)stringFromMillibars:(float)a3
{
  uint64_t v5 = [(WeatherPressureFormatter *)self pressureUnit];
  *(float *)&double v6 = a3;
  [(WeatherPressureFormatter *)self convertMBarPressure:v5 toUnit:v6];
  objc_super v7 = -[WeatherPressureFormatter formatStringForPressure:inUnit:](self, "formatStringForPressure:inUnit:", v5);
  v9 = v7;
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    *(float *)&double v8 = a3;
    id v10 = [(WeatherPressureFormatter *)self fallbackStringForPressure:v8];
  }
  v11 = v10;

  return v11;
}

- (id)stringFromInchesHG:(float)a3
{
  uint64_t v5 = [(WeatherPressureFormatter *)self pressureUnit];
  *(float *)&double v6 = a3;
  [(WeatherPressureFormatter *)self convertInchesHGPressure:v5 toUnit:v6];
  objc_super v7 = -[WeatherPressureFormatter formatStringForPressure:inUnit:](self, "formatStringForPressure:inUnit:", v5);
  v9 = v7;
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    *(float *)&double v8 = a3;
    [(WeatherPressureFormatter *)self convertInchesHGPressure:2050 toUnit:v8];
    -[WeatherPressureFormatter fallbackStringForPressure:](self, "fallbackStringForPressure:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)formatStringForPressure:(float)a3 inUnit:(int)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  UErrorCode pErrorCode = U_ZERO_ERROR;
  v4 = [(WeatherPressureFormatter *)self locale];
  uint64_t v5 = [v4 localeIdentifier];

  if (v5)
  {
    [v5 UTF8String];
    unum_clone();
    uameasfmt_open();
    uameasfmt_format();
    int32_t pDestLength = 0;
    u_strToUTF8(dest, 100, &pDestLength, src, -1, &pErrorCode);
    uameasfmt_close();
    double v6 = [NSString stringWithUTF8String:dest];
    objc_super v7 = v6;
    if (v6 && pErrorCode < U_ILLEGAL_ARGUMENT_ERROR)
    {
      id v8 = v6;
    }
    else
    {
      v9 = WALogForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        UErrorCode v14 = pErrorCode;
        _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "#Formatter Something went wrong - returning nil. Error %i", buf, 8u);
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fallbackStringForPressure:(float)a3
{
  objc_super v3 = NSString;
  uint64_t v4 = (int)a3;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"HECTOPASCAL" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  objc_super v7 = [v3 localizedStringWithFormat:@"%d %@", v4, v6];

  return v7;
}

- (void)createNumberFormatter
{
  objc_super v3 = [(WeatherPressureFormatter *)self locale];
  uint64_t v4 = [v3 localeIdentifier];

  id v5 = v4;
  [v5 UTF8String];
  numberFormatter = unum_open();
  unum_setAttribute();
  [(WeatherPressureFormatter *)self pressureUnit];
  unum_setAttribute();
  double v6 = (void *)numberFormatter;

  return v6;
}

- (int)pressureUnit
{
  objc_super v3 = [(WeatherPressureFormatter *)self locale];

  int v4 = 2048;
  if (v3)
  {
    id v5 = [(WeatherPressureFormatter *)self locale];
    double v6 = [v5 objectForKey:*MEMORY[0x263EFF560]];
    int v7 = [v6 BOOLValue];

    id v8 = [(WeatherPressureFormatter *)self locale];
    v9 = [v8 objectForKey:*MEMORY[0x263EFF4D0]];

    int v10 = [&unk_26DAEAEE0 containsObject:v9];
    if (v7) {
      int v11 = 2048;
    }
    else {
      int v11 = 2049;
    }
    if (v10) {
      int v4 = 2051;
    }
    else {
      int v4 = v11;
    }
  }
  return v4;
}

- (float)convertMBarPressure:(float)result toUnit:(int)a4
{
  if (a4 == 2051)
  {
    float v4 = 1.3332;
  }
  else
  {
    if (a4 != 2049) {
      return result;
    }
    float v4 = 33.864;
  }
  return result / v4;
}

- (float)convertInchesHGPressure:(float)result toUnit:(int)a4
{
  if (a4 == 2051)
  {
    float v4 = 25.4;
  }
  else
  {
    if (a4 != 2048) {
      return result;
    }
    float v4 = 33.864;
  }
  return result * v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v4 floatValue];
    id v5 = -[WeatherPressureFormatter stringFromMillibars:](self, "stringFromMillibars:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
}

@end