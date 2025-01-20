@interface TSKRulerUnits
+ (id)formatterForRulerUnits:(int)a3 decimalPlaces:(int)a4 trailingZeros:(BOOL)a5 lenient:(BOOL)a6;
+ (id)instance;
- (BOOL)centerRulerOrigin;
- (BOOL)showRulerAsPercentage;
- (TSKRulerUnits)init;
- (double)convertPointsToRulerUnits:(double)a3;
- (double)convertRulerUnitsToPoints:(double)a3;
- (id)compatibleRulerUnits;
- (id)formatter:(BOOL)a3 lenient:(BOOL)a4;
- (id)localizedCompatibleRulerUnits;
- (int)preferredPixelUnit;
- (int)rulerUnits;
- (void)dealloc;
- (void)setCenterRulerOrigin:(BOOL)a3;
- (void)setPreferredPixelUnit:(int)a3;
- (void)setRulerUnits:(int)a3;
- (void)setShowRulerAsPercentage:(BOOL)a3;
@end

@implementation TSKRulerUnits

+ (id)instance
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"+[TSKRulerUnits instance]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKRulerUnits.m"), 68, @"Trying to acquire TSKRulerUnits singleton from a secondary thread - this class is not thread safe.");
  }
  id result = (id)instance_instance;
  if (!instance_instance)
  {
    id result = objc_alloc_init(TSKRulerUnits);
    instance_instance = (uint64_t)result;
  }
  return result;
}

- (TSKRulerUnits)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSKRulerUnits;
  v2 = [(TSKRulerUnits *)&v5 init];
  if (v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    v2->_rulerUnits = [v3 integerForKey:TSKDefaultsRulerUnits];
    v2->_showRulerAsPercentage = [v3 BOOLForKey:TSKDefaultsShowRulerAsPercentage];
    v2->_centerRulerOrigin = [v3 BOOLForKey:TSKDefaultsCenterRulerOrigin];
    v2->_preferredPixelUnit = 2;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKRulerUnits;
  [(TSKRulerUnits *)&v3 dealloc];
}

- (void)setRulerUnits:(int)a3
{
  if (self->_rulerUnits != a3)
  {
    self->_rulerUnits = a3;

    self->_formatter = 0;
    self->_lenientFormatter = 0;

    self->_highPrecisionFormatter = 0;
    self->_lenientHighPrecisionFormatter = 0;
    v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 setInteger:self->_rulerUnits forKey:TSKDefaultsRulerUnits];
    objc_super v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    v6 = TSKRulerUnitsDidChangeNotification;
    [v5 postNotificationName:v6 object:self];
  }
}

- (void)setShowRulerAsPercentage:(BOOL)a3
{
  if (self->_showRulerAsPercentage != a3)
  {
    self->_showRulerAsPercentage = a3;
    v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 setBool:self->_showRulerAsPercentage forKey:TSKDefaultsShowRulerAsPercentage];
    objc_super v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = TSKShowRulerAsPercentageDidChangeNotification;
    [v5 postNotificationName:v6 object:self];
  }
}

- (void)setCenterRulerOrigin:(BOOL)a3
{
  if (self->_centerRulerOrigin != a3)
  {
    self->_centerRulerOrigin = a3;
    v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 setBool:self->_centerRulerOrigin forKey:TSKDefaultsCenterRulerOrigin];
    objc_super v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = TSKCenterRulerOriginDidChangeNotification;
    [v5 postNotificationName:v6 object:self];
  }
}

- (double)convertRulerUnitsToPoints:(double)a3
{
  uint64_t rulerUnits = self->_rulerUnits;
  double v4 = 1.0;
  if (rulerUnits <= 3) {
    double v4 = dbl_223837FE0[rulerUnits];
  }
  return v4 * a3;
}

- (double)convertPointsToRulerUnits:(double)a3
{
  uint64_t rulerUnits = self->_rulerUnits;
  double v4 = 1.0;
  if (rulerUnits <= 3) {
    double v4 = dbl_223837FE0[rulerUnits];
  }
  return a3 / v4;
}

- (id)formatter:(BOOL)a3 lenient:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3)
  {
    if (a4)
    {
LABEL_6:
      int v7 = 0;
      uint64_t v8 = 32;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  int rulerUnits = self->_rulerUnits;
  if (a4)
  {
    if (!rulerUnits)
    {
      int v7 = 1;
      uint64_t v8 = 48;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (rulerUnits)
  {
LABEL_8:
    int v7 = 0;
    uint64_t v8 = 24;
    goto LABEL_10;
  }
  int v7 = 1;
  uint64_t v8 = 40;
LABEL_10:
  id result = *(Class *)((char *)&self->super.isa + v8);
  if (!result)
  {
    int v10 = self->_rulerUnits;
    if (v7) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10) {
      unsigned int v11 = 0;
    }
    if (v10 == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v11;
    }
    id result = (id)[(id)objc_opt_class() formatterForRulerUnits:self->_rulerUnits decimalPlaces:v12 trailingZeros:0 lenient:a4];
    uint64_t v13 = 32;
    if (v7) {
      uint64_t v13 = 48;
    }
    uint64_t v14 = 24;
    if (v7) {
      uint64_t v14 = 40;
    }
    if (!v4) {
      uint64_t v13 = v14;
    }
    *(Class *)((char *)&self->super.isa + v13) = (Class)result;
  }
  return result;
}

- (id)compatibleRulerUnits
{
  uint64_t rulerUnits = self->_rulerUnits;
  if (rulerUnits > 4) {
    return 0;
  }
  else {
    return off_2646B0908[rulerUnits];
  }
}

- (id)localizedCompatibleRulerUnits
{
  uint64_t rulerUnits = self->_rulerUnits;
  if (rulerUnits > 4) {
    return 0;
  }
  objc_super v3 = off_2646B0908[rulerUnits];
  BOOL v4 = (void *)TSKBundle();

  return (id)[v4 localizedStringForKey:v3 value:&stru_26D688A48 table:@"TSKit"];
}

+ (id)formatterForRulerUnits:(int)a3 decimalPlaces:(int)a4 trailingZeros:(BOOL)a5 lenient:(BOOL)a6
{
  if (a3 == 3)
  {
    uint64_t v6 = -[TSKPicaFormatter initWithPicaSeparator:]([TSKPicaFormatter alloc], "initWithPicaSeparator:", [(id)TSKBundle() localizedStringForKey:@"p" value:&stru_26D688A48 table:@"TSKit"]);
  }
  else
  {
    BOOL v7 = a6;
    if (a4 < 1)
    {
      unsigned int v11 = (void *)[[NSString alloc] initWithString:@"0"];
    }
    else if (a5)
    {
      int v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%%.%df", *(void *)&a4);
      unsigned int v11 = objc_msgSend([NSString alloc], "initWithFormat:", v10, 0);
    }
    else
    {
      unsigned int v11 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"0."];
      unsigned int v12 = a4 + 1;
      do
      {
        [v11 appendString:@"#"];
        --v12;
      }
      while (v12 > 1);
    }
    uint64_t v13 = @"%@";
    uint64_t v14 = @"0";
    switch(a3)
    {
      case 0:
        uint64_t v14 = (__CFString *)[(id)TSKBundle() localizedStringForKey:@"0 in" value:&stru_26D688A48 table:@"TSKit"];
        v15 = (void *)TSKBundle();
        v16 = @"%@ in";
        goto LABEL_15;
      case 1:
        uint64_t v14 = (__CFString *)[(id)TSKBundle() localizedStringForKey:@"0 cm" value:&stru_26D688A48 table:@"TSKit"];
        v15 = (void *)TSKBundle();
        v16 = @"%@ cm";
        goto LABEL_15;
      case 2:
        uint64_t v14 = (__CFString *)[(id)TSKBundle() localizedStringForKey:@"0 pt" value:&stru_26D688A48 table:@"TSKit"];
        v15 = (void *)TSKBundle();
        v16 = @"%@ pt";
        goto LABEL_15;
      case 4:
        uint64_t v14 = (__CFString *)[(id)TSKBundle() localizedStringForKey:@"0 px" value:&stru_26D688A48 table:@"TSKit"];
        v15 = (void *)TSKBundle();
        v16 = @"%@ px";
LABEL_15:
        uint64_t v13 = (__CFString *)[v15 localizedStringForKey:v16 value:&stru_26D688A48 table:@"TSKit"];
        break;
      case 5:
        break;
      default:
        uint64_t v14 = &stru_26D688A48;
        uint64_t v13 = &stru_26D688A48;
        break;
    }
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", v13, v11);
    uint64_t v6 = (TSKPicaFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    [(TSKPicaFormatter *)v6 setPositiveFormat:v17];
    -[TSKPicaFormatter setNegativeFormat:](v6, "setNegativeFormat:", [@"-" stringByAppendingString:v17]);
    [(TSKPicaFormatter *)v6 setZeroSymbol:v14];
    v18 = (void *)[MEMORY[0x263EFF960] currentLocale];
    -[TSKPicaFormatter setDecimalSeparator:](v6, "setDecimalSeparator:", [v18 objectForKey:*MEMORY[0x263EFF4E8]]);
    [(TSKPicaFormatter *)v6 setLenient:v7];
  }

  return v6;
}

- (int)rulerUnits
{
  return self->_rulerUnits;
}

- (BOOL)showRulerAsPercentage
{
  return self->_showRulerAsPercentage;
}

- (BOOL)centerRulerOrigin
{
  return self->_centerRulerOrigin;
}

- (int)preferredPixelUnit
{
  return self->_preferredPixelUnit;
}

- (void)setPreferredPixelUnit:(int)a3
{
  self->_preferredPixelUnit = a3;
}

@end