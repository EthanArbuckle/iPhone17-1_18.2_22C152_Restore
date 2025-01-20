@interface CRLRulerUnits
+ (id)formatterForRulerUnits:(unint64_t)a3 decimalPlaces:(int)a4 trailingZeros:(BOOL)a5 lenient:(BOOL)a6;
+ (id)instance;
- (BOOL)centerRulerOrigin;
- (BOOL)showRulerAsPercentage;
- (CRLRulerUnits)init;
- (double)convertPointsToRulerUnits:(double)a3;
- (double)convertRulerUnitsToPoints:(double)a3;
- (id)compatibleRulerUnits;
- (id)formatter:(BOOL)a3 lenient:(BOOL)a4;
- (id)localizedCompatibleRulerAbbreviatedUnits;
- (id)localizedCompatibleRulerUnits;
- (unint64_t)preferredPixelUnit;
- (unint64_t)rulerUnits;
- (void)setCenterRulerOrigin:(BOOL)a3;
- (void)setPreferredPixelUnit:(unint64_t)a3;
- (void)setRulerUnits:(unint64_t)a3;
- (void)setShowRulerAsPercentage:(BOOL)a3;
@end

@implementation CRLRulerUnits

+ (id)instance
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2C90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101073CD4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2CB0);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v2);
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLRulerUnits instance]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLRulerUnits.m"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:64 isFatal:0 description:"Trying to acquire CRLRulerUnits singleton from a secondary thread - this class is not thread safe."];
  }
  if (qword_1016A9000 != -1) {
    dispatch_once(&qword_1016A9000, &stru_1014D2CD0);
  }
  v5 = (void *)qword_1016A9008;

  return v5;
}

- (CRLRulerUnits)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLRulerUnits;
  v2 = [(CRLRulerUnits *)&v5 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v2->_rulerUnits = (unint64_t)[v3 integerForKey:@"CRLRulerUnitTypeUserDefault"];
    v2->_showRulerAsPercentage = [v3 BOOLForKey:@"ShowRulerAsPercentage"];
    v2->_centerRulerOrigin = [v3 BOOLForKey:@"CenterRulerOrigin"];
    v2->_preferredPixelUnit = 2;
  }
  return v2;
}

- (void)setRulerUnits:(unint64_t)a3
{
  if (self->_rulerUnits != a3)
  {
    self->_rulerUnits = a3;
    formatter = self->_formatter;
    self->_formatter = 0;

    lenientFormatter = self->_lenientFormatter;
    self->_lenientFormatter = 0;

    highPrecisionFormatter = self->_highPrecisionFormatter;
    self->_highPrecisionFormatter = 0;

    lenientHighPrecisionFormatter = self->_lenientHighPrecisionFormatter;
    self->_lenientHighPrecisionFormatter = 0;

    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setInteger:self->_rulerUnits forKey:@"CRLRulerUnitTypeUserDefault"];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"RulerUnitsDidChange" object:self];
  }
}

- (void)setShowRulerAsPercentage:(BOOL)a3
{
  if (self->_showRulerAsPercentage != a3)
  {
    self->_showRulerAsPercentage = a3;
    v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:self->_showRulerAsPercentage forKey:@"ShowRulerAsPercentage"];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"ShowRulerAsPercentageDidChange" object:self];
  }
}

- (void)setCenterRulerOrigin:(BOOL)a3
{
  if (self->_centerRulerOrigin != a3)
  {
    self->_centerRulerOrigin = a3;
    v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:self->_centerRulerOrigin forKey:@"CenterRulerOrigin"];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"CenterRulerOriginDidChange" object:self];
  }
}

- (double)convertRulerUnitsToPoints:(double)a3
{
  unint64_t rulerUnits = self->_rulerUnits;
  double v4 = 1.0;
  if (rulerUnits <= 3) {
    double v4 = dbl_101175310[rulerUnits];
  }
  return v4 * a3;
}

- (double)convertPointsToRulerUnits:(double)a3
{
  unint64_t rulerUnits = self->_rulerUnits;
  double v4 = 1.0;
  if (rulerUnits <= 3) {
    double v4 = dbl_101175310[rulerUnits];
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
      uint64_t v8 = 16;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  unint64_t rulerUnits = self->_rulerUnits;
  if (a4)
  {
    if (!rulerUnits)
    {
      int v7 = 1;
      uint64_t v8 = 32;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (rulerUnits)
  {
LABEL_8:
    int v7 = 0;
    uint64_t v8 = 8;
    goto LABEL_10;
  }
  int v7 = 1;
  uint64_t v8 = 24;
LABEL_10:
  id v9 = *(id *)((char *)&self->super.isa + v8);
  if (!v9)
  {
    unint64_t v10 = self->_rulerUnits;
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
    id v9 = [(id)objc_opt_class() formatterForRulerUnits:self->_rulerUnits decimalPlaces:v12 trailingZeros:0 lenient:v4];
    uint64_t v13 = 16;
    if (v7) {
      uint64_t v13 = 32;
    }
    uint64_t v14 = 8;
    if (v7) {
      uint64_t v14 = 24;
    }
    if (!v4) {
      uint64_t v13 = v14;
    }
    objc_storeStrong((id *)((char *)&self->super.isa + v13), v9);
  }

  return v9;
}

- (id)compatibleRulerUnits
{
  unint64_t rulerUnits = self->_rulerUnits;
  if (rulerUnits > 4) {
    return &stru_101538650;
  }
  else {
    return *(&off_1014D2D30 + rulerUnits);
  }
}

- (id)localizedCompatibleRulerUnits
{
  switch(self->_rulerUnits)
  {
    case 0uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"Inches";
      goto LABEL_8;
    case 1uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"Centimeters";
      goto LABEL_8;
    case 2uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"Points";
      goto LABEL_8;
    case 3uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"Picas";
      goto LABEL_8;
    case 4uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"Pixels";
LABEL_8:
      id v5 = [v2 localizedStringForKey:v4 value:0 table:0];

      break;
    default:
      id v5 = &stru_101538650;
      break;
  }

  return v5;
}

- (id)localizedCompatibleRulerAbbreviatedUnits
{
  switch(self->_rulerUnits)
  {
    case 0uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"in";
      goto LABEL_8;
    case 1uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"cm";
      goto LABEL_8;
    case 2uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"pt";
      goto LABEL_8;
    case 3uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"pc";
      goto LABEL_8;
    case 4uLL:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"px";
LABEL_8:
      id v5 = [v2 localizedStringForKey:v4 value:0 table:0];

      break;
    default:
      id v5 = &stru_101538650;
      break;
  }

  return v5;
}

+ (id)formatterForRulerUnits:(unint64_t)a3 decimalPlaces:(int)a4 trailingZeros:(BOOL)a5 lenient:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  if (a3 == 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2CF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101073D68();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2D10);
    }
    unint64_t v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v10);
    }
    unsigned int v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLRulerUnits formatterForRulerUnits:decimalPlaces:trailingZeros:lenient:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLRulerUnits.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:264 isFatal:0 description:"Pica formatting not currently supported"];
  }
  if ((int)v8 < 1)
  {
    uint64_t v14 = @"0";
  }
  else if (v7)
  {
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%%.%df" v8];
    uint64_t v14 = [(__CFString *)[objc_alloc((Class)NSString) initWithFormat:v13];
  }
  else
  {
    uint64_t v14 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithString:@"0."];
    unsigned int v15 = v8 + 1;
    do
    {
      [(__CFString *)v14 appendString:@"#"];
      --v15;
    }
    while (v15 > 1);
  }
  v16 = @"%@";
  switch(a3)
  {
    case 0uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"%@ in";
      goto LABEL_23;
    case 1uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"%@ cm";
      goto LABEL_23;
    case 2uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"%@ pt";
      goto LABEL_23;
    case 4uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"%@ px";
LABEL_23:
      v16 = [v17 localizedStringForKey:v19 value:0 table:0];

      break;
    case 5uLL:
      break;
    default:
      v16 = &stru_101538650;
      break;
  }
  id v20 = [objc_alloc((Class)NSString) initWithFormat:v16, v14];
  v21 = objc_alloc_init(CRLPositiveZeroNumberFormatter);
  [(CRLPositiveZeroNumberFormatter *)v21 setPositiveFormat:v20];
  [(CRLPositiveZeroNumberFormatter *)v21 setLenient:v6];

  return v21;
}

- (unint64_t)rulerUnits
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

- (unint64_t)preferredPixelUnit
{
  return self->_preferredPixelUnit;
}

- (void)setPreferredPixelUnit:(unint64_t)a3
{
  self->_preferredPixelUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lenientHighPrecisionFormatter, 0);
  objc_storeStrong((id *)&self->_highPrecisionFormatter, 0);
  objc_storeStrong((id *)&self->_lenientFormatter, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end