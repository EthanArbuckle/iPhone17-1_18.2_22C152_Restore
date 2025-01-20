@interface WFTemperatureFormatter
+ (id)temperatureFormatterWithInputUnit:(int)a3 outputUnit:(int)a4;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)includeDegreeSymbol;
- (NSLocale)locale;
- (NSString)fallbackTemperatureString;
- (UAMeasureFormat)measureFormatter;
- (WFTemperatureFormatter)init;
- (id)_formatTemperatureValue:(id)a3 toUnit:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedStringFromTemperature:(id)a3;
- (id)formattedTemperatureFromString:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (int)inputUnit;
- (int)outputUnit;
- (int)symbolType;
- (unint64_t)maximumFractionDigits;
- (unint64_t)roundingMode;
- (void)_localeDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setFallbackTemperatureString:(id)a3;
- (void)setIncludeDegreeSymbol:(BOOL)a3;
- (void)setInputUnit:(int)a3;
- (void)setLocale:(id)a3;
- (void)setMaximumFractionDigits:(unint64_t)a3;
- (void)setMeasureFormatter:(UAMeasureFormat *)a3;
- (void)setOutputUnit:(int)a3;
- (void)setRoundingMode:(unint64_t)a3;
- (void)setSymbolType:(int)a3;
@end

@implementation WFTemperatureFormatter

+ (id)temperatureFormatterWithInputUnit:(int)a3 outputUnit:(int)a4
{
  v4 = 0;
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    if (a4)
    {
      uint64_t v6 = *(void *)&a3;
      v4 = objc_alloc_init(WFTemperatureFormatter);
      [(WFTemperatureFormatter *)v4 setInputUnit:v6];
      [(WFTemperatureFormatter *)v4 setOutputUnit:v5];
    }
  }
  return v4;
}

- (WFTemperatureFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFTemperatureFormatter;
  v2 = [(WFTemperatureFormatter *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(WFTemperatureFormatter *)v2 setLocale:v3];

    [(WFTemperatureFormatter *)v2 setInputUnit:2];
    [(WFTemperatureFormatter *)v2 setOutputUnit:2];
    [(WFTemperatureFormatter *)v2 setFallbackTemperatureString:@"--"];
    [(WFTemperatureFormatter *)v2 setMaximumFractionDigits:0];
    [(WFTemperatureFormatter *)v2 setRoundingMode:0];
    [(WFTemperatureFormatter *)v2 setSymbolType:1];
    v2->_includeDegreeSymbol = 1;
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__localeDidChangeNotification_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  uint64_t v5 = [(WFTemperatureFormatter *)self locale];
  [v4 setLocale:v5];

  objc_msgSend(v4, "setInputUnit:", -[WFTemperatureFormatter inputUnit](self, "inputUnit"));
  objc_msgSend(v4, "setOutputUnit:", -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
  objc_super v6 = [(WFTemperatureFormatter *)self fallbackTemperatureString];
  [v4 setFallbackTemperatureString:v6];

  objc_msgSend(v4, "setMaximumFractionDigits:", -[WFTemperatureFormatter maximumFractionDigits](self, "maximumFractionDigits"));
  objc_msgSend(v4, "setRoundingMode:", -[WFTemperatureFormatter roundingMode](self, "roundingMode"));
  objc_msgSend(v4, "setSymbolType:", -[WFTemperatureFormatter symbolType](self, "symbolType"));
  return v4;
}

- (void)dealloc
{
  [(WFTemperatureFormatter *)self setMeasureFormatter:0];
  v3.receiver = self;
  v3.super_class = (Class)WFTemperatureFormatter;
  [(WFTemperatureFormatter *)&v3 dealloc];
}

- (void)setLocale:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_locale] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    [(WFTemperatureFormatter *)self setMeasureFormatter:0];
  }
}

- (NSString)fallbackTemperatureString
{
  objc_super v3 = self->_fallbackTemperatureString;
  if (self->_includeDegreeSymbol && [(WFTemperatureFormatter *)self symbolType])
  {
    if ([(WFTemperatureFormatter *)self symbolType] != 2) {
      goto LABEL_7;
    }
    uint64_t v4 = [(NSString *)v3 stringWithTemperatureUnit:[(WFTemperatureFormatter *)self outputUnit]];
  }
  else
  {
    uint64_t v4 = [(NSString *)v3 stringByReplacingOccurrencesOfString:@"°" withString:&stru_26CD4CE08];
  }
  id v5 = (NSString *)v4;

  objc_super v3 = v5;
LABEL_7:
  return v3;
}

- (void)setRoundingMode:(unint64_t)a3
{
  if (self->_roundingMode != a3)
  {
    self->_roundingMode = a3;
    [(WFTemperatureFormatter *)self setMeasureFormatter:0];
  }
}

- (void)setMaximumFractionDigits:(unint64_t)a3
{
  if (self->_maximumFractionDigits != a3)
  {
    self->_maximumFractionDigits = a3;
    [(WFTemperatureFormatter *)self setMeasureFormatter:0];
  }
}

- (UAMeasureFormat)measureFormatter
{
  result = self->_measureFormatter;
  if (!result)
  {
    uint64_t v4 = [(WFTemperatureFormatter *)self locale];
    id v5 = [v4 localeIdentifier];
    [v5 cStringUsingEncoding:4];

    unum_open();
    [(WFTemperatureFormatter *)self maximumFractionDigits];
    unum_setAttribute();
    [(WFTemperatureFormatter *)self roundingMode];
    unum_setAttribute();
    result = (UAMeasureFormat *)uameasfmt_open();
    self->_measureFormatter = result;
  }
  return result;
}

- (void)setMeasureFormatter:(UAMeasureFormat *)a3
{
  measureFormatter = self->_measureFormatter;
  if (measureFormatter != a3)
  {
    if (!a3)
    {
      if (measureFormatter) {
        uameasfmt_close();
      }
      a3 = 0;
    }
    self->_measureFormatter = a3;
  }
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(WFTemperatureFormatter *)self formattedTemperatureFromString:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = [v4 stringValue];
      v7 = [(WFTemperatureFormatter *)self formattedTemperatureFromString:v6];

      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(WFTemperatureFormatter *)self formattedStringFromTemperature:v4];
    }
    else {
    uint64_t v5 = [(WFTemperatureFormatter *)self fallbackTemperatureString];
    }
  }
  v7 = (void *)v5;
LABEL_10:

  return v7;
}

- (id)formattedStringFromTemperature:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_msgSend(v4, "temperatureForUnit:", -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
    objc_super v6 = [(WFTemperatureFormatter *)self _formatTemperatureValue:v5 toUnit:[(WFTemperatureFormatter *)self outputUnit]];
  }
  else
  {
    objc_super v6 = [(WFTemperatureFormatter *)self fallbackTemperatureString];
  }

  return v6;
}

- (id)formattedTemperatureFromString:(id)a3
{
  id v4 = a3;
  if ([v4 length] && !objc_msgSend(v4, "isEqualToString:", @"--"))
  {
    [v4 doubleValue];
    double v7 = v6;
    int v8 = [(WFTemperatureFormatter *)self inputUnit];
    uint64_t v9 = [(WFTemperatureFormatter *)self outputUnit];
    v10 = objc_msgSend(NSNumber, "numberWithDouble:", WFConvertTemperature(v8, v9, v7));
    uint64_t v5 = [(WFTemperatureFormatter *)self _formatTemperatureValue:v10 toUnit:v9];
  }
  else
  {
    uint64_t v5 = [(WFTemperatureFormatter *)self fallbackTemperatureString];
  }

  return v5;
}

- (id)_formatTemperatureValue:(id)a3 toUnit:(int)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(WFTemperatureFormatter *)self measureFormatter])
  {
    uint64_t v9 = [(WFTemperatureFormatter *)self fallbackTemperatureString];
    goto LABEL_14;
  }
  UErrorCode pErrorCode = U_ZERO_ERROR;
  [v5 doubleValue];
  uameasfmt_format();
  u_strToUTF8(dest, 100, 0, src, -1, &pErrorCode);
  double v6 = [NSString stringWithCString:dest encoding:4];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(WFTemperatureFormatter *)self fallbackTemperatureString];
  }
  uint64_t v9 = v8;

  if (self->_includeDegreeSymbol && [(WFTemperatureFormatter *)self symbolType])
  {
    if ([(WFTemperatureFormatter *)self symbolType] != 2) {
      goto LABEL_12;
    }
    uint64_t v10 = objc_msgSend(v9, "stringWithTemperatureUnit:", -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
  }
  else
  {
    uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"°" withString:&stru_26CD4CE08];
  }
  v11 = (void *)v10;

  uint64_t v9 = v11;
LABEL_12:
  if ([v9 hasPrefix:@"-0"])
  {
    uint64_t v12 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_26CD4CE08);

    uint64_t v9 = (void *)v12;
  }
LABEL_14:

  return v9;
}

- (void)_localeDidChangeNotification:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setFallbackTemperatureString:(id)a3
{
}

- (int)inputUnit
{
  return self->_inputUnit;
}

- (void)setInputUnit:(int)a3
{
  self->_inputUnit = a3;
}

- (int)outputUnit
{
  return self->_outputUnit;
}

- (void)setOutputUnit:(int)a3
{
  self->_outputUnit = a3;
}

- (unint64_t)roundingMode
{
  return self->_roundingMode;
}

- (unint64_t)maximumFractionDigits
{
  return self->_maximumFractionDigits;
}

- (int)symbolType
{
  return self->_symbolType;
}

- (void)setSymbolType:(int)a3
{
  self->_symbolType = a3;
}

- (BOOL)includeDegreeSymbol
{
  return self->_includeDegreeSymbol;
}

- (void)setIncludeDegreeSymbol:(BOOL)a3
{
  self->_includeDegreeSymbol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTemperatureString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end