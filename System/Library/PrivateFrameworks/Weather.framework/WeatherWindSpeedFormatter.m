@interface WeatherWindSpeedFormatter
+ (id)convenienceFormatter;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (NSDictionary)directionSubstringAttributes;
- (NSLocale)locale;
- (WeatherWindSpeedFormatter)init;
- (double)speedByConvertingToUserUnit:(double)a3;
- (id)attributedFormattedStringForSpeed:(float)a3 direction:(float)a4;
- (id)fallbackStringForWindSpeed:(float)a3;
- (id)fallbackUnitString;
- (id)formattedStringForSpeed:(float)a3 direction:(float)a4;
- (id)formattedStringForSpeed:(float)a3 direction:(float)a4 shortDescription:(BOOL)a5;
- (id)speedStringByConvertingToUserUnits:(float)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringForWindDirection:(float)a3 shortDescription:(BOOL)a4;
- (id)stringForWindSpeed:(float)a3;
- (id)templateStringForSpeed:(float)a3 direction:(float)a4;
- (int)windSpeedUnit;
- (void)setDirectionSubstringAttributes:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation WeatherWindSpeedFormatter

+ (id)convenienceFormatter
{
  if (convenienceFormatter_onceToken != -1) {
    dispatch_once(&convenienceFormatter_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)convenienceFormatter_convenienceFormatter;
  return v2;
}

uint64_t __49__WeatherWindSpeedFormatter_convenienceFormatter__block_invoke()
{
  v0 = objc_alloc_init(WeatherWindSpeedFormatter);
  uint64_t v1 = convenienceFormatter_convenienceFormatter;
  convenienceFormatter_convenienceFormatter = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WeatherWindSpeedFormatter)init
{
  v7.receiver = self;
  v7.super_class = (Class)WeatherWindSpeedFormatter;
  v2 = [(WeatherWindSpeedFormatter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v4 floatValue];
    v5 = -[WeatherWindSpeedFormatter formattedStringForSpeed:direction:](self, "formattedStringForSpeed:direction:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (id)formattedStringForSpeed:(float)a3 direction:(float)a4
{
  return -[WeatherWindSpeedFormatter formattedStringForSpeed:direction:shortDescription:](self, "formattedStringForSpeed:direction:shortDescription:", 1);
}

- (id)formattedStringForSpeed:(float)a3 direction:(float)a4 shortDescription:(BOOL)a5
{
  float v5 = a4;
  a4 = 1.1755e-38;
  if (a3 == 1.1755e-38)
  {
    v6 = @"--";
  }
  else
  {
    BOOL v7 = a5;
    -[WeatherWindSpeedFormatter speedByConvertingToUserUnit:](self, "speedByConvertingToUserUnit:", a3, *(double *)&a4);
    *(float *)&double v9 = v9;
    *(float *)&double v10 = v5;
    v11 = [(WeatherWindSpeedFormatter *)self templateStringForSpeed:v9 direction:v10];
    *(float *)&double v12 = v5;
    v13 = [(WeatherWindSpeedFormatter *)self stringForWindDirection:v7 shortDescription:v12];
    objc_msgSend(NSString, "stringWithFormat:", v11, v13);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)attributedFormattedStringForSpeed:(float)a3 direction:(float)a4
{
  BOOL v7 = [(WeatherWindSpeedFormatter *)self directionSubstringAttributes];

  if (v7)
  {
    *(float *)&double v8 = a3;
    *(float *)&double v9 = a4;
    double v10 = [(WeatherWindSpeedFormatter *)self templateStringForSpeed:v8 direction:v9];
    *(float *)&double v11 = a3;
    *(float *)&double v12 = a4;
    v13 = [(WeatherWindSpeedFormatter *)self formattedStringForSpeed:v11 direction:v12];
    *(float *)&double v14 = a4;
    v15 = [(WeatherWindSpeedFormatter *)self stringForWindDirection:1 shortDescription:v14];
    v16 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v13];
    uint64_t v17 = [v10 rangeOfString:@"%@"];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v18 = v17;
      uint64_t v19 = [v15 length];
      v20 = [(WeatherWindSpeedFormatter *)self directionSubstringAttributes];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __73__WeatherWindSpeedFormatter_attributedFormattedStringForSpeed_direction___block_invoke;
      v26[3] = &unk_2647E03F0;
      id v27 = v16;
      uint64_t v28 = v18;
      uint64_t v29 = v19;
      [v20 enumerateKeysAndObjectsUsingBlock:v26];
    }
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x263F086A0]);
    *(float *)&double v22 = a3;
    *(float *)&double v23 = a4;
    v24 = [(WeatherWindSpeedFormatter *)self formattedStringForSpeed:v22 direction:v23];
    v16 = (void *)[v21 initWithString:v24];
  }
  return v16;
}

uint64_t __73__WeatherWindSpeedFormatter_attributedFormattedStringForSpeed_direction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", a2, a3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)templateStringForSpeed:(float)a3 direction:(float)a4
{
  *(float *)&double v6 = a4;
  BOOL v7 = [(WeatherWindSpeedFormatter *)self stringForWindDirection:1 shortDescription:v6];
  *(float *)&double v8 = a3;
  double v9 = [(WeatherWindSpeedFormatter *)self stringForWindSpeed:v8];
  double v10 = NSString;
  double v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v12 = v11;
  if (v7)
  {
    v13 = [v11 localizedStringForKey:@"WIND_DETAIL_FORMAT_WITH_DIRECTION" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    [v10 stringWithFormat:v13, @"%@", v9];
  }
  else
  {
    v13 = [v11 localizedStringForKey:@"WIND_DETAIL_FORMAT_WITHOUT_DIRECTION" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    objc_msgSend(v10, "stringWithFormat:", v13, v9, v16);
  double v14 = };

  return v14;
}

- (id)stringForWindSpeed:(float)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  UErrorCode pErrorCode = U_ZERO_ERROR;
  float v5 = [(WeatherWindSpeedFormatter *)self locale];
  double v6 = [v5 localeIdentifier];

  if (v6)
  {
    [v6 cStringUsingEncoding:4];
    uameasfmt_open();
    [(WeatherWindSpeedFormatter *)self windSpeedUnit];
    uameasfmt_format();
    int32_t pDestLength = 0;
    u_strToUTF8(dest, 100, &pDestLength, src, -1, &pErrorCode);
    uameasfmt_close();
    double v8 = [NSString stringWithCString:dest encoding:4];
    double v10 = v8;
    if (v8)
    {
      id v11 = v8;
    }
    else
    {
      *(float *)&double v9 = a3;
      id v11 = [(WeatherWindSpeedFormatter *)self fallbackStringForWindSpeed:v9];
    }
    double v12 = v11;
  }
  else
  {
    *(float *)&double v7 = a3;
    double v12 = [(WeatherWindSpeedFormatter *)self fallbackStringForWindSpeed:v7];
  }

  return v12;
}

- (id)fallbackStringForWindSpeed:(float)a3
{
  uint64_t v3 = NSString;
  double v4 = a3;
  float v5 = [(WeatherWindSpeedFormatter *)self fallbackUnitString];
  double v6 = [v3 stringWithFormat:@"%.0f %@", *(void *)&v4, v5];

  return v6;
}

- (id)fallbackUnitString
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"km/h" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

  return v3;
}

- (id)stringForWindDirection:(float)a3 shortDescription:(BOOL)a4
{
  if (a3 < 0.0 || a3 == 1.1755e-38)
  {
    double v7 = 0;
  }
  else
  {
    BOOL v5 = a4;
    unint64_t v6 = CardinalDirectionFromAngle(a3);
    double v7 = CardinalDirectionStringForIndex(v6, v5);
  }
  return v7;
}

- (id)speedStringByConvertingToUserUnits:(float)a3
{
  [(WeatherWindSpeedFormatter *)self speedByConvertingToUserUnit:a3];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.0f", v3);
}

- (int)windSpeedUnit
{
  uint64_t v3 = [(WeatherWindSpeedFormatter *)self locale];

  if (!v3) {
    return 2305;
  }
  double v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"CN", @"JP", @"KR", @"RU", @"SE", @"TW", @"NO", @"FI", @"DK", 0);
  BOOL v5 = [(WeatherWindSpeedFormatter *)self locale];
  unint64_t v6 = [v5 objectForKey:*MEMORY[0x263EFF4D0]];

  double v7 = [(WeatherWindSpeedFormatter *)self locale];
  double v8 = [v7 objectForKey:*MEMORY[0x263EFF560]];
  if ([v8 BOOLValue])
  {
    double v9 = [(WeatherWindSpeedFormatter *)self locale];
    double v10 = [v9 localeIdentifier];
    if ([v10 isEqualToString:@"en_GB"]) {
      int v11 = 2306;
    }
    else {
      int v11 = 2305;
    }
  }
  else
  {
    int v11 = 2306;
  }

  if (v6 && ([v4 containsObject:v6] & 1) != 0) {
    int v11 = 2304;
  }

  return v11;
}

- (double)speedByConvertingToUserUnit:(double)a3
{
  int v4 = [(WeatherWindSpeedFormatter *)self windSpeedUnit];
  if (v4 != 2305)
  {
    if (v4 == 2304) {
      double v5 = 0.278;
    }
    else {
      double v5 = 0.621;
    }
    a3 = a3 * v5;
  }
  float v6 = a3;
  return roundf(v6);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSDictionary)directionSubstringAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDirectionSubstringAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionSubstringAttributes, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end