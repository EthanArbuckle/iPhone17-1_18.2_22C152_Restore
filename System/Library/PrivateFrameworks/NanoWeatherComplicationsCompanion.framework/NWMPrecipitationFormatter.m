@interface NWMPrecipitationFormatter
+ (NWMPrecipitationFormatter)sharedFormatter;
- (NSNumber)minimumPercentage;
- (NSNumberFormatter)numberFormatter;
- (NSNumberFormatter)percentageFormatter;
- (NSString)percentSymbol;
- (NWMPrecipitationFormatter)init;
- (double)roundedChanceOfPrecipitation:(id)a3;
- (double)value:(id)a3;
- (id)formattedChanceOfPrecipitation:(id)a3 shouldIncludePercentSymbol:(BOOL)a4;
- (id)formattedChanceOfPrecipitation:(id)a3 style:(unint64_t)a4 shouldIncludePercentSymbol:(BOOL)a5;
- (id)formattedChanceOfPrecipitationChance:(id)a3 style:(unint64_t)a4 shouldIncludePercentSymbol:(BOOL)a5;
- (void)setMinimumPercentage:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setPercentageFormatter:(id)a3;
@end

@implementation NWMPrecipitationFormatter

- (NWMPrecipitationFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)NWMPrecipitationFormatter;
  v2 = [(NWMPrecipitationFormatter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    minimumPercentage = v2->_minimumPercentage;
    v2->_minimumPercentage = (NSNumber *)&unk_26EEA87D8;
  }
  return v3;
}

- (NSString)percentSymbol
{
  v2 = [(NWMPrecipitationFormatter *)self percentageFormatter];
  v3 = [v2 percentSymbol];

  return (NSString *)v3;
}

+ (NWMPrecipitationFormatter)sharedFormatter
{
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedFormatter_SharedFormatter;

  return (NWMPrecipitationFormatter *)v2;
}

uint64_t __44__NWMPrecipitationFormatter_sharedFormatter__block_invoke()
{
  sharedFormatter_SharedFormatter = objc_alloc_init(NWMPrecipitationFormatter);

  return MEMORY[0x270F9A758]();
}

- (id)formattedChanceOfPrecipitation:(id)a3 shouldIncludePercentSymbol:(BOOL)a4
{
  return [(NWMPrecipitationFormatter *)self formattedChanceOfPrecipitation:a3 style:0 shouldIncludePercentSymbol:a4];
}

- (id)formattedChanceOfPrecipitation:(id)a3 style:(unint64_t)a4 shouldIncludePercentSymbol:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = [a3 objectForKeyedSubscript:*MEMORY[0x263F86018]];
  v9 = [(NWMPrecipitationFormatter *)self formattedChanceOfPrecipitationChance:v8 style:a4 shouldIncludePercentSymbol:v5];

  return v9;
}

- (id)formattedChanceOfPrecipitationChance:(id)a3 style:(unint64_t)a4 shouldIncludePercentSymbol:(BOOL)a5
{
  v8 = NSNumber;
  [(NWMPrecipitationFormatter *)self roundedChanceOfPrecipitation:a3];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v9 doubleValue];
  double v11 = v10;
  v12 = [(NWMPrecipitationFormatter *)self minimumPercentage];
  [v12 doubleValue];
  double v14 = v13;

  if (v11 < v14)
  {

    v9 = &unk_26EEA87E8;
  }
  if (a5) {
    [(NWMPrecipitationFormatter *)self percentageFormatter];
  }
  else {
  v15 = [(NWMPrecipitationFormatter *)self numberFormatter];
  }
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_11;
    }
    v16 = @"NO_DATA_ROUNDED";
  }
  else
  {
    v16 = @"NO_DATA";
  }
  v17 = NWMConditionsLocalizedString(v16);
  [v15 setNilSymbol:v17];

  v18 = NWMConditionsLocalizedString(v16);
  [v15 setNotANumberSymbol:v18];

LABEL_11:
  v19 = [v15 stringFromNumber:v9];

  return v19;
}

- (double)value:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F86018]];
  [(NWMPrecipitationFormatter *)self roundedChanceOfPrecipitation:v4];
  double v6 = v5;

  return v6;
}

- (double)roundedChanceOfPrecipitation:(id)a3
{
  if (!a3) {
    return NAN;
  }
  [a3 doubleValue];
  return round(v3 / 10.0) / 10.0;
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_opt_new();
    double v5 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(NSNumberFormatter *)v4 setLocale:v5];

    double v6 = NWMConditionsLocalizedString(@"NO_DATA_ROUNDED");
    [(NSNumberFormatter *)v4 setNilSymbol:v6];

    v7 = NWMConditionsLocalizedString(@"NO_DATA_ROUNDED");
    [(NSNumberFormatter *)v4 setNotANumberSymbol:v7];

    [(NSNumberFormatter *)v4 setNumberStyle:3];
    [(NSNumberFormatter *)v4 setPercentSymbol:&stru_26EEA3A40];
    v8 = self->_numberFormatter;
    self->_numberFormatter = v4;

    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (NSNumberFormatter)percentageFormatter
{
  percentageFormatter = self->_percentageFormatter;
  if (!percentageFormatter)
  {
    v4 = (NSNumberFormatter *)objc_opt_new();
    double v5 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(NSNumberFormatter *)v4 setLocale:v5];

    double v6 = NWMConditionsLocalizedString(@"NO_DATA_ROUNDED");
    [(NSNumberFormatter *)v4 setNilSymbol:v6];

    v7 = NWMConditionsLocalizedString(@"NO_DATA_ROUNDED");
    [(NSNumberFormatter *)v4 setNotANumberSymbol:v7];

    [(NSNumberFormatter *)v4 setNumberStyle:3];
    v8 = self->_percentageFormatter;
    self->_percentageFormatter = v4;

    percentageFormatter = self->_percentageFormatter;
  }

  return percentageFormatter;
}

- (NSNumber)minimumPercentage
{
  return self->_minimumPercentage;
}

- (void)setMinimumPercentage:(id)a3
{
}

- (void)setNumberFormatter:(id)a3
{
}

- (void)setPercentageFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);

  objc_storeStrong((id *)&self->_minimumPercentage, 0);
}

@end