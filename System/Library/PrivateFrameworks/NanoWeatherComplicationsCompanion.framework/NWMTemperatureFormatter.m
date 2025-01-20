@interface NWMTemperatureFormatter
+ (NWMTemperatureFormatter)autoupdatingFormatter;
+ (NWMTemperatureFormatter)autoupdatingSharedFormatter;
- (BOOL)isCelsiusPreferred;
- (BOOL)shouldAvoidDegreeSymbolOnly;
- (NSLocale)locale;
- (NSMeasurement)noMeasurement;
- (NSMeasurementFormatter)degreeSymbolOnlyFormatter;
- (NSMeasurementFormatter)unitFormatter;
- (NSNumberFormatter)noUnitFormatter;
- (NSString)formattedStaleTemperatureWithDegreeSymbol;
- (NSString)formattedStaleTemperatureWithDegreeSymbolRoundedVariant;
- (NSString)formattedStaleTemperatureWithUnit;
- (NSString)formattedStaleTemperatureWithUnitRoundedVariant;
- (NSString)formattedStaleTemperatureWithoutUnit;
- (NSString)formattedStaleTemperatureWithoutUnitRoundedVariant;
- (NWMTemperatureFormatter)init;
- (NWMTemperatureFormatter)initWithLocale:(id)a3;
- (NWMTemperatureFormatter)initWithLocale:(id)a3 temperatureUnit:(int)a4;
- (double)_value:(id)a3;
- (id)_formattedStaleTemperatureWithDegreeSymbol:(unint64_t)a3;
- (id)_formattedStaleTemperatureWithUnit:(unint64_t)a3;
- (id)_formattedStaleTemperatureWithoutUnit:(unint64_t)a3;
- (id)_measurementForTemperature:(id)a3;
- (id)formattedWithDegreeSymbol:(id)a3 fallbackStyle:(unint64_t)a4;
- (id)formattedWithDegreeSymbol:(id)a3 style:(unint64_t)a4 fallbackStyle:(unint64_t)a5;
- (id)formattedWithUnit:(id)a3;
- (id)formattedWithUnit:(id)a3 style:(unint64_t)a4;
- (id)formattedWithoutUnit:(id)a3;
- (id)formattedWithoutUnit:(id)a3 style:(unint64_t)a4;
- (int)temperatureUnit;
- (void)_localeChanged:(id)a3;
- (void)dealloc;
- (void)reloadWithLocale:(id)a3;
- (void)setAvoidDegreeSymbolOnly:(BOOL)a3;
- (void)setCelsiusPreferred:(BOOL)a3;
- (void)setDegreeSymbolOnlyFormatter:(id)a3;
- (void)setFormattedStaleTemperatureWithDegreeSymbol:(id)a3;
- (void)setFormattedStaleTemperatureWithDegreeSymbolRoundedVariant:(id)a3;
- (void)setFormattedStaleTemperatureWithUnit:(id)a3;
- (void)setFormattedStaleTemperatureWithUnitRoundedVariant:(id)a3;
- (void)setFormattedStaleTemperatureWithoutUnit:(id)a3;
- (void)setFormattedStaleTemperatureWithoutUnitRoundedVariant:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNoMeasurement:(id)a3;
- (void)setNoUnitFormatter:(id)a3;
- (void)setUnitFormatter:(id)a3;
@end

@implementation NWMTemperatureFormatter

+ (NWMTemperatureFormatter)autoupdatingSharedFormatter
{
  if (autoupdatingSharedFormatter_onceToken != -1) {
    dispatch_once(&autoupdatingSharedFormatter_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)autoupdatingSharedFormatter_SharedFormatter;

  return (NWMTemperatureFormatter *)v2;
}

void __54__NWMTemperatureFormatter_autoupdatingSharedFormatter__block_invoke()
{
  v0 = [NWMTemperatureFormatter alloc];
  v1 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v2 = [(NWMTemperatureFormatter *)v0 initWithLocale:v1];
  v3 = (void *)autoupdatingSharedFormatter_SharedFormatter;
  autoupdatingSharedFormatter_SharedFormatter = v2;

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:autoupdatingSharedFormatter_SharedFormatter selector:sel__localeChanged_ name:*MEMORY[0x263EFF458] object:0];
}

+ (NWMTemperatureFormatter)autoupdatingFormatter
{
  uint64_t v2 = [NWMTemperatureFormatter alloc];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [(NWMTemperatureFormatter *)v2 initWithLocale:v3];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:v4 selector:sel__localeChanged_ name:*MEMORY[0x263EFF458] object:0];

  return v4;
}

- (NWMTemperatureFormatter)init
{
  v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [(NWMTemperatureFormatter *)self initWithLocale:v3];

  return v4;
}

- (NWMTemperatureFormatter)initWithLocale:(id)a3
{
  return [(NWMTemperatureFormatter *)self initWithLocale:a3 temperatureUnit:0];
}

- (NWMTemperatureFormatter)initWithLocale:(id)a3 temperatureUnit:(int)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NWMTemperatureFormatter;
  v7 = [(NWMTemperatureFormatter *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_temperatureUnit = a4;
    id v9 = objc_alloc(MEMORY[0x263F08980]);
    v10 = [MEMORY[0x263F08D20] celsius];
    uint64_t v11 = [v9 initWithDoubleValue:v10 unit:-40.0];
    noMeasurement = v8->_noMeasurement;
    v8->_noMeasurement = (NSMeasurement *)v11;

    [(NWMTemperatureFormatter *)v8 reloadWithLocale:v6];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NWMTemperatureFormatter;
  [(NWMTemperatureFormatter *)&v4 dealloc];
}

- (id)formattedWithDegreeSymbol:(id)a3 fallbackStyle:(unint64_t)a4
{
  return [(NWMTemperatureFormatter *)self formattedWithDegreeSymbol:a3 style:0 fallbackStyle:a4];
}

- (id)formattedWithDegreeSymbol:(id)a3 style:(unint64_t)a4 fallbackStyle:(unint64_t)a5
{
  id v8 = a3;
  if (v8)
  {
    if (![(NWMTemperatureFormatter *)self shouldAvoidDegreeSymbolOnly]) {
      goto LABEL_6;
    }
    if (a5 == 1)
    {
      uint64_t v9 = [(NWMTemperatureFormatter *)self formattedWithoutUnit:v8];
      goto LABEL_9;
    }
    if (a5)
    {
LABEL_6:
      v10 = [(NWMTemperatureFormatter *)self _measurementForTemperature:v8];
      uint64_t v11 = [(NWMTemperatureFormatter *)self degreeSymbolOnlyFormatter];
      v12 = [v11 stringFromMeasurement:v10];

      goto LABEL_10;
    }
    uint64_t v9 = [(NWMTemperatureFormatter *)self formattedWithUnit:v8];
  }
  else
  {
    uint64_t v9 = [(NWMTemperatureFormatter *)self _formattedStaleTemperatureWithDegreeSymbol:a4];
  }
LABEL_9:
  v12 = (void *)v9;
LABEL_10:

  return v12;
}

- (id)formattedWithUnit:(id)a3
{
  return [(NWMTemperatureFormatter *)self formattedWithUnit:a3 style:0];
}

- (id)formattedWithUnit:(id)a3 style:(unint64_t)a4
{
  if (a3)
  {
    v5 = -[NWMTemperatureFormatter _measurementForTemperature:](self, "_measurementForTemperature:", a3, a4);
    id v6 = [(NWMTemperatureFormatter *)self unitFormatter];
    v7 = [v6 stringFromMeasurement:v5];
  }
  else
  {
    v7 = [(NWMTemperatureFormatter *)self _formattedStaleTemperatureWithUnit:a4];
  }

  return v7;
}

- (id)formattedWithoutUnit:(id)a3
{
  return [(NWMTemperatureFormatter *)self formattedWithoutUnit:a3 style:0];
}

- (id)formattedWithoutUnit:(id)a3 style:(unint64_t)a4
{
  if (a3)
  {
    v5 = -[NWMTemperatureFormatter _measurementForTemperature:](self, "_measurementForTemperature:", a3, a4);
    id v6 = [(NWMTemperatureFormatter *)self noUnitFormatter];
    v7 = NSNumber;
    [v5 doubleValue];
    id v8 = objc_msgSend(v7, "numberWithDouble:");
    uint64_t v9 = [v6 stringFromNumber:v8];
  }
  else
  {
    uint64_t v9 = [(NWMTemperatureFormatter *)self _formattedStaleTemperatureWithoutUnit:a4];
  }

  return v9;
}

- (void)reloadWithLocale:(id)a3
{
  id v4 = a3;
  [(NWMTemperatureFormatter *)self setLocale:v4];
  v5 = [v4 objectForKey:*MEMORY[0x263EFF548]];
  uint64_t v6 = [(id)*MEMORY[0x263EFF550] isEqualToString:v5];

  [(NWMTemperatureFormatter *)self setCelsiusPreferred:v6];
  v7 = [v4 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v8 = [@"ja" isEqualToString:v7];

  [(NWMTemperatureFormatter *)self setAvoidDegreeSymbolOnly:v8];
  id v38 = +[NWCCBundle bundle];
  uint64_t v9 = NWMLocaleCurrentNumberSystem(v4);

  if ((unint64_t)(v9 - 1) >= 2) {
    v10 = @"TEMPERATURE_UNKNOWN_NODEGREES_ALWAYS_LTR";
  }
  else {
    v10 = @"TEMPERATURE_UNKNOWN_NODEGREES";
  }
  if ((unint64_t)(v9 - 1) >= 2) {
    uint64_t v11 = @"TEMPERATURE_UNKNOWN_NODEGREES_ALWAYS_LTR_ROUNDED";
  }
  else {
    uint64_t v11 = @"TEMPERATURE_UNKNOWN_NODEGREES_ROUNDED";
  }
  v12 = [v38 localizedStringForKey:v10 value:&stru_26EEA3A40 table:@"Temperature"];
  [(NWMTemperatureFormatter *)self setFormattedStaleTemperatureWithoutUnit:v12];

  v13 = [v38 localizedStringForKey:v11 value:&stru_26EEA3A40 table:@"Temperature"];
  [(NWMTemperatureFormatter *)self setFormattedStaleTemperatureWithoutUnitRoundedVariant:v13];

  [(NWMTemperatureFormatter *)self setNoUnitFormatter:0];
  [(NWMTemperatureFormatter *)self setDegreeSymbolOnlyFormatter:0];
  [(NWMTemperatureFormatter *)self setUnitFormatter:0];
  objc_super v14 = [(NWMTemperatureFormatter *)self unitFormatter];
  v15 = [(NWMTemperatureFormatter *)self noMeasurement];
  v16 = [v14 stringFromMeasurement:v15];

  v17 = [(NWMTemperatureFormatter *)self noUnitFormatter];
  v18 = [v17 stringFromNumber:&unk_26EEA86F0];
  v19 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithoutUnit];
  v20 = [v16 stringByReplacingOccurrencesOfString:v18 withString:v19];

  [(NWMTemperatureFormatter *)self setFormattedStaleTemperatureWithUnit:v20];
  v21 = [(NWMTemperatureFormatter *)self unitFormatter];
  v22 = [(NWMTemperatureFormatter *)self noMeasurement];
  v23 = [v21 stringFromMeasurement:v22];

  v24 = [(NWMTemperatureFormatter *)self noUnitFormatter];
  v25 = [v24 stringFromNumber:&unk_26EEA86F0];
  v26 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithoutUnitRoundedVariant];
  v27 = [v23 stringByReplacingOccurrencesOfString:v25 withString:v26];

  [(NWMTemperatureFormatter *)self setFormattedStaleTemperatureWithUnitRoundedVariant:v27];
  v28 = [(NWMTemperatureFormatter *)self degreeSymbolOnlyFormatter];
  v29 = [v28 stringFromMeasurement:self->_noMeasurement];

  v30 = [(NWMTemperatureFormatter *)self noUnitFormatter];
  v31 = [v30 stringFromNumber:&unk_26EEA86F0];
  v32 = [v29 stringByReplacingOccurrencesOfString:v31 withString:self->_formattedStaleTemperatureWithoutUnit];

  [(NWMTemperatureFormatter *)self setFormattedStaleTemperatureWithDegreeSymbol:v32];
  v33 = [(NWMTemperatureFormatter *)self degreeSymbolOnlyFormatter];
  v34 = [v33 stringFromMeasurement:self->_noMeasurement];

  v35 = [(NWMTemperatureFormatter *)self noUnitFormatter];
  v36 = [v35 stringFromNumber:&unk_26EEA86F0];
  v37 = [v34 stringByReplacingOccurrencesOfString:v36 withString:self->_formattedStaleTemperatureWithoutUnitRoundedVariant];

  [(NWMTemperatureFormatter *)self setFormattedStaleTemperatureWithDegreeSymbolRoundedVariant:v37];
}

- (id)_formattedStaleTemperatureWithDegreeSymbol:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithDegreeSymbolRoundedVariant];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithDegreeSymbol];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_formattedStaleTemperatureWithUnit:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithUnitRoundedVariant];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithUnit];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_formattedStaleTemperatureWithoutUnit:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithoutUnitRoundedVariant];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(NWMTemperatureFormatter *)self formattedStaleTemperatureWithoutUnit];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_measurementForTemperature:(id)a3
{
  id v4 = a3;
  int v5 = [(NWMTemperatureFormatter *)self temperatureUnit];
  switch(v5)
  {
    case 2:
      goto LABEL_5;
    case 1:
      goto LABEL_6;
    case 0:
      if ([(NWMTemperatureFormatter *)self isCelsiusPreferred])
      {
LABEL_5:
        [v4 celsius];
        double v7 = v6;
        uint64_t v8 = [MEMORY[0x263F08D20] celsius];
        goto LABEL_8;
      }
LABEL_6:
      [v4 fahrenheit];
      double v7 = v9;
      uint64_t v8 = [MEMORY[0x263F08D20] fahrenheit];
      goto LABEL_8;
  }
  [v4 kelvin];
  double v7 = v10;
  uint64_t v8 = [MEMORY[0x263F08D20] kelvin];
LABEL_8:
  uint64_t v11 = (void *)v8;
  if (v7 == 0.0) {
    double v7 = 0.0;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x263F08980]) initWithDoubleValue:v8 unit:v7];

  return v12;
}

- (double)_value:(id)a3
{
  id v4 = a3;
  if ([(NWMTemperatureFormatter *)self isCelsiusPreferred]) {
    [v4 celsius];
  }
  else {
    [v4 fahrenheit];
  }
  double v6 = v5;

  return v6;
}

- (void)_localeChanged:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF960], "currentLocale", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NWMTemperatureFormatter *)self reloadWithLocale:v4];
}

- (NSNumberFormatter)noUnitFormatter
{
  noUnitFormatter = self->_noUnitFormatter;
  if (!noUnitFormatter)
  {
    id v4 = (NSNumberFormatter *)objc_opt_new();
    double v5 = [(NWMTemperatureFormatter *)self locale];
    [(NSNumberFormatter *)v4 setLocale:v5];

    [(NSNumberFormatter *)v4 setMaximumFractionDigits:0];
    double v6 = self->_noUnitFormatter;
    self->_noUnitFormatter = v4;

    noUnitFormatter = self->_noUnitFormatter;
  }

  return noUnitFormatter;
}

- (NSMeasurementFormatter)degreeSymbolOnlyFormatter
{
  degreeSymbolOnlyFormatter = self->_degreeSymbolOnlyFormatter;
  if (!degreeSymbolOnlyFormatter)
  {
    id v4 = (NSMeasurementFormatter *)objc_opt_new();
    double v5 = [(NWMTemperatureFormatter *)self locale];
    [(NSMeasurementFormatter *)v4 setLocale:v5];

    double v6 = [(NWMTemperatureFormatter *)self noUnitFormatter];
    [(NSMeasurementFormatter *)v4 setNumberFormatter:v6];

    [(NSMeasurementFormatter *)v4 setUnitOptions:4];
    double v7 = self->_degreeSymbolOnlyFormatter;
    self->_degreeSymbolOnlyFormatter = v4;

    degreeSymbolOnlyFormatter = self->_degreeSymbolOnlyFormatter;
  }

  return degreeSymbolOnlyFormatter;
}

- (NSMeasurementFormatter)unitFormatter
{
  unitFormatter = self->_unitFormatter;
  if (!unitFormatter)
  {
    id v4 = (NSMeasurementFormatter *)objc_opt_new();
    double v5 = [(NWMTemperatureFormatter *)self locale];
    [(NSMeasurementFormatter *)v4 setLocale:v5];

    double v6 = [(NWMTemperatureFormatter *)self noUnitFormatter];
    [(NSMeasurementFormatter *)v4 setNumberFormatter:v6];

    double v7 = self->_unitFormatter;
    self->_unitFormatter = v4;

    unitFormatter = self->_unitFormatter;
  }

  return unitFormatter;
}

- (BOOL)isCelsiusPreferred
{
  return self->_celsiusPreferred;
}

- (void)setCelsiusPreferred:(BOOL)a3
{
  self->_celsiusPreferred = a3;
}

- (BOOL)shouldAvoidDegreeSymbolOnly
{
  return self->_avoidDegreeSymbolOnly;
}

- (void)setAvoidDegreeSymbolOnly:(BOOL)a3
{
  self->_avoidDegreeSymbolOnly = a3;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocale:(id)a3
{
}

- (int)temperatureUnit
{
  return self->_temperatureUnit;
}

- (NSMeasurement)noMeasurement
{
  return self->_noMeasurement;
}

- (void)setNoMeasurement:(id)a3
{
}

- (void)setNoUnitFormatter:(id)a3
{
}

- (void)setDegreeSymbolOnlyFormatter:(id)a3
{
}

- (void)setUnitFormatter:(id)a3
{
}

- (NSString)formattedStaleTemperatureWithDegreeSymbol
{
  return self->_formattedStaleTemperatureWithDegreeSymbol;
}

- (void)setFormattedStaleTemperatureWithDegreeSymbol:(id)a3
{
}

- (NSString)formattedStaleTemperatureWithDegreeSymbolRoundedVariant
{
  return self->_formattedStaleTemperatureWithDegreeSymbolRoundedVariant;
}

- (void)setFormattedStaleTemperatureWithDegreeSymbolRoundedVariant:(id)a3
{
}

- (NSString)formattedStaleTemperatureWithUnit
{
  return self->_formattedStaleTemperatureWithUnit;
}

- (void)setFormattedStaleTemperatureWithUnit:(id)a3
{
}

- (NSString)formattedStaleTemperatureWithUnitRoundedVariant
{
  return self->_formattedStaleTemperatureWithUnitRoundedVariant;
}

- (void)setFormattedStaleTemperatureWithUnitRoundedVariant:(id)a3
{
}

- (NSString)formattedStaleTemperatureWithoutUnit
{
  return self->_formattedStaleTemperatureWithoutUnit;
}

- (void)setFormattedStaleTemperatureWithoutUnit:(id)a3
{
}

- (NSString)formattedStaleTemperatureWithoutUnitRoundedVariant
{
  return self->_formattedStaleTemperatureWithoutUnitRoundedVariant;
}

- (void)setFormattedStaleTemperatureWithoutUnitRoundedVariant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedStaleTemperatureWithoutUnitRoundedVariant, 0);
  objc_storeStrong((id *)&self->_formattedStaleTemperatureWithoutUnit, 0);
  objc_storeStrong((id *)&self->_formattedStaleTemperatureWithUnitRoundedVariant, 0);
  objc_storeStrong((id *)&self->_formattedStaleTemperatureWithUnit, 0);
  objc_storeStrong((id *)&self->_formattedStaleTemperatureWithDegreeSymbolRoundedVariant, 0);
  objc_storeStrong((id *)&self->_formattedStaleTemperatureWithDegreeSymbol, 0);
  objc_storeStrong((id *)&self->_unitFormatter, 0);
  objc_storeStrong((id *)&self->_degreeSymbolOnlyFormatter, 0);
  objc_storeStrong((id *)&self->_noUnitFormatter, 0);
  objc_storeStrong((id *)&self->_noMeasurement, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end