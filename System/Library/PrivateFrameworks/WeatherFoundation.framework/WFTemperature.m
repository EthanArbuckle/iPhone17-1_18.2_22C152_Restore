@interface WFTemperature
+ (BOOL)supportsSecureCoding;
- (BOOL)_unitIsHydrated:(int)a3 outputValue:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTemperature:(id)a3;
- (WFTemperature)init;
- (WFTemperature)initWithCoder:(id)a3;
- (WFTemperature)initWithTemperatureUnit:(int)a3 value:(double)a4;
- (double)celsius;
- (double)fahrenheit;
- (double)kelvin;
- (double)temperatureForUnit:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_resetTemperatureValues;
- (void)_setValue:(double)a3 forUnit:(int)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCelsius:(double)a3;
- (void)setFahrenheit:(double)a3;
- (void)setKelvin:(double)a3;
@end

@implementation WFTemperature

- (WFTemperature)initWithTemperatureUnit:(int)a3 value:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = [(WFTemperature *)self init];
  v7 = v6;
  if (v6) {
    [(WFTemperature *)v6 _setValue:v5 forUnit:a4];
  }
  return v7;
}

- (WFTemperature)init
{
  v5.receiver = self;
  v5.super_class = (Class)WFTemperature;
  v2 = [(WFTemperature *)&v5 init];
  v3 = v2;
  if (v2) {
    [(WFTemperature *)v2 _resetTemperatureValues];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFTemperature)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFTemperature;
  objc_super v5 = [(WFTemperature *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(WFTemperature *)v5 setKelvin:__31__WFTemperature_initWithCoder___block_invoke((uint64_t)v5, @"WFTemperatureKelvinKey", v4)];
    uint64_t v8 = [(WFTemperature *)v6 setFahrenheit:__31__WFTemperature_initWithCoder___block_invoke(v7, @"WFTemperatureFahrenheitKey", v4)];
    [(WFTemperature *)v6 setCelsius:__31__WFTemperature_initWithCoder___block_invoke(v8, @"WFTemperatureCelsiusKey", v4)];
  }

  return v6;
}

double __31__WFTemperature_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v5 containsValueForKey:v4])
  {
    [v5 decodeDoubleForKey:v4];
    double v7 = v6;
  }
  else
  {
    double v7 = NAN;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"WFTemperatureKelvinKey" forKey:self->_temperatureValues.kelvinVal];
  [v4 encodeDouble:@"WFTemperatureFahrenheitKey" forKey:self->_temperatureValues.fahrenheitVal];
  [v4 encodeDouble:@"WFTemperatureCelsiusKey" forKey:self->_temperatureValues.celsiusVal];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  [(WFTemperature *)self kelvin];
  objc_msgSend(v4, "setKelvin:");
  [(WFTemperature *)self celsius];
  objc_msgSend(v4, "setCelsius:");
  [(WFTemperature *)self fahrenheit];
  objc_msgSend(v4, "setFahrenheit:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFTemperature *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WFTemperature *)self isEqualToTemperature:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = NSNumber;
  [(WFTemperature *)self temperatureForUnit:2];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqualToTemperature:(id)a3
{
  [a3 temperatureForUnit:2];
  double v5 = v4;
  [(WFTemperature *)self temperatureForUnit:2];
  return vabdd_f64(v6, v5) < 2.22044605e-16;
}

- (double)kelvin
{
  double v4 = NAN;
  if ([(WFTemperature *)self _unitIsHydrated:3 outputValue:&v4]) {
    return v4;
  }
  [(WFTemperature *)self temperatureForUnit:3];
  return result;
}

- (void)setKelvin:(double)a3
{
}

- (double)celsius
{
  double v4 = NAN;
  if ([(WFTemperature *)self _unitIsHydrated:2 outputValue:&v4]) {
    return v4;
  }
  [(WFTemperature *)self temperatureForUnit:2];
  return result;
}

- (void)setCelsius:(double)a3
{
}

- (double)fahrenheit
{
  double v4 = NAN;
  if ([(WFTemperature *)self _unitIsHydrated:1 outputValue:&v4]) {
    return v4;
  }
  [(WFTemperature *)self temperatureForUnit:1];
  return result;
}

- (void)setFahrenheit:(double)a3
{
}

- (double)temperatureForUnit:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FF8000000000000;
  if ([(WFTemperature *)self _unitIsHydrated:*(void *)&a3 outputValue:&v16])
  {
    double v5 = v14[3];
  }
  else
  {
    uint64_t v9 = 0;
    objc_super v10 = &v9;
    uint64_t v11 = 0x2020000000;
    int v12 = 0;
    double v6 = [MEMORY[0x263F089C8] indexSetWithIndex:3];
    [v6 addIndex:2];
    [v6 addIndex:1];
    [v6 removeIndex:v3];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__WFTemperature_temperatureForUnit___block_invoke;
    v8[3] = &unk_2644322B8;
    v8[4] = self;
    v8[5] = &v13;
    v8[6] = &v9;
    [v6 enumerateIndexesUsingBlock:v8];
    if (WFTemperatureUnitIsValid(*((_DWORD *)v10 + 6)))
    {
      double v5 = WFConvertTemperature(*((_DWORD *)v10 + 6), v3, v14[3]);
      -[WFTemperature _setValue:forUnit:](self, "_setValue:forUnit:", v3);
    }
    else
    {
      double v5 = NAN;
    }

    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __36__WFTemperature_temperatureForUnit___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v4 = a2;
  uint64_t result = [*(id *)(a1 + 32) _unitIsHydrated:a2 outputValue:*(void *)(*(void *)(a1 + 40) + 8) + 24];
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
    *a3 = 1;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = NSNumber;
  [(WFTemperature *)self celsius];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = NSNumber;
  [(WFTemperature *)self fahrenheit];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v9 = NSNumber;
  [(WFTemperature *)self kelvin];
  objc_super v10 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v11 = [v3 stringWithFormat:@"<%@: %p, celsius = %@, fahrenheit = %@, kelvin = %@>", v4, self, v6, v8, v10];

  return v11;
}

- (void)_setValue:(double)a3 forUnit:(int)a4
{
  if ((a4 - 1) <= 2) {
    *(double *)((char *)&self->super.isa + qword_21C9D8DF0[a4 - 1]) = a3;
  }
}

- (BOOL)_unitIsHydrated:(int)a3 outputValue:(double *)a4
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  if (a4) {
    *a4 = *(double *)((char *)&self->super.isa + qword_21C9D8DF0[a3 - 1]);
  }
  return 1;
}

- (void)_resetTemperatureValues
{
  *(int64x2_t *)&self->_temperatureValues.celsiusVal = vdupq_n_s64(0x7FF8000000000000uLL);
  self->_temperatureValues.fahrenheitVal = NAN;
}

@end