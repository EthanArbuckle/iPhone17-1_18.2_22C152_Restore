@interface GuidanceETA
+ (id)_arrivalTimeStringForEtaDate:(id)a3 timeZone:(id)a4 includingAMPMSymbols:(BOOL)a5;
+ (id)defaultArrivalString;
+ (id)defaultBatteryOnArrivalString;
+ (id)defaultDistanceUnit;
+ (id)defaultDistanceUnitAccessibility;
+ (id)defaultTimeUnit;
+ (id)defaultTimeUnitAccessibility;
+ (id)displayDateForDate:(id)a3;
+ (id)etaStringFromEtaLegInfo:(id)a3 includingAMPMSymbols:(BOOL)a4;
+ (id)invalidValueString;
+ (unint64_t)displayMinutesForTimeInterval:(double)a3;
- (BOOL)isEtaToFinalDestination;
- (GuidanceETA)initWithDisplayETA:(id)a3 remainingDistance:(id)a4 batteryChargeInfo:(id)a5 destinationTimeZone:(id)a6 transportType:(int)a7;
- (GuidanceETA)initWithRemainingTime:(double)a3 remainingDistance:(double)a4 arrivalBatteryCharge:(id)a5 destinationTimeZone:(id)a6 transportType:(int)a7;
- (NSDate)etaDate;
- (NSNumber)arrivalBatteryCharge;
- (NSString)arrivalTimeBottomString;
- (NSString)distanceUnit;
- (NSString)distanceUnitAccessibility;
- (NSString)distanceValue;
- (NSString)timeUnit;
- (NSString)timeUnitAccessibility;
- (NSString)timeValue;
- (double)remainingDistance;
- (id)_chargeImageAttachmentWithFont:(id)a3;
- (id)arrivalTimeExpandedStringIncludingAMPMSymbols:(BOOL)a3;
- (id)arrivalTimeStringIncludingAMPMSymbols:(BOOL)a3;
- (id)arrivalWithBatteryChargeStringWithFont:(id)a3 includingAMPMSymbols:(BOOL)a4;
- (id)batteryChargeStringWithFont:(id)a3;
- (id)description;
- (id)etaDateStringWithAMPMSymbol:(BOOL)a3;
- (id)etaDateStringWithAMPMSymbol:(BOOL)a3 allowTimeZone:(BOOL)a4;
- (id)extendedArrivalBatteryChargeStringWithFont:(id)a3;
- (int64_t)_lengthUnitFromUnit:(id)a3;
- (int64_t)_unitStyleForUnit:(int64_t)a3;
- (unint64_t)remainingMinutes;
- (void)_computeDistanceProperties;
- (void)_computeTimeProperties;
@end

@implementation GuidanceETA

- (GuidanceETA)initWithRemainingTime:(double)a3 remainingDistance:(double)a4 arrivalBatteryCharge:(id)a5 destinationTimeZone:(id)a6 transportType:(int)a7
{
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)GuidanceETA;
  v15 = [(GuidanceETA *)&v23 init];
  if (v15)
  {
    v15->_remainingMinutes = (unint64_t)[(id)objc_opt_class() displayMinutesForTimeInterval:a3];
    v15->_remainingDistance = a4;
    v16 = +[NSDate date];
    v17 = +[GuidanceETA displayDateForDate:v16];

    uint64_t v18 = [v17 dateByAddingTimeInterval:(double)v15->_remainingMinutes * 60.0];
    etaDate = v15->_etaDate;
    v15->_etaDate = (NSDate *)v18;

    objc_storeStrong((id *)&v15->_arrivalBatteryCharge, a5);
    if (v14)
    {
      v20 = (NSTimeZone *)v14;
    }
    else
    {
      v20 = +[NSTimeZone defaultTimeZone];
    }
    destinationTimeZone = v15->_destinationTimeZone;
    v15->_destinationTimeZone = v20;

    v15->_transportType = a7;
    v15->_isEtaToFinalDestination = 1;
  }
  return v15;
}

- (GuidanceETA)initWithDisplayETA:(id)a3 remainingDistance:(id)a4 batteryChargeInfo:(id)a5 destinationTimeZone:(id)a6 transportType:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)GuidanceETA;
  v16 = [(GuidanceETA *)&v26 init];
  if (v16)
  {
    v16->_remainingMinutes = (unint64_t)[v12 displayRemainingMinutesToEndOfLeg];
    [v13 distanceRemainingToEndOfLeg];
    v16->_remainingDistance = v17;
    uint64_t v18 = [v12 displayETAToEndOfLeg];
    etaDate = v16->_etaDate;
    v16->_etaDate = (NSDate *)v18;

    if (v14)
    {
      [v14 batteryChargeRemainingAtEndOfLeg];
      uint64_t v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      arrivalBatteryCharge = v16->_arrivalBatteryCharge;
      v16->_arrivalBatteryCharge = (NSNumber *)v20;
    }
    else
    {
      arrivalBatteryCharge = v16->_arrivalBatteryCharge;
      v16->_arrivalBatteryCharge = 0;
    }

    if (v15)
    {
      v22 = (NSTimeZone *)v15;
    }
    else
    {
      v22 = +[NSTimeZone defaultTimeZone];
    }
    destinationTimeZone = v16->_destinationTimeZone;
    v16->_destinationTimeZone = v22;

    v16->_transportType = a7;
    v24 = [v12 legInfos];
    v16->_isEtaToFinalDestination = (unint64_t)[v24 count] < 2;
  }
  return v16;
}

- (id)etaDateStringWithAMPMSymbol:(BOOL)a3
{
  return [(GuidanceETA *)self etaDateStringWithAMPMSymbol:a3 allowTimeZone:1];
}

- (id)etaDateStringWithAMPMSymbol:(BOOL)a3 allowTimeZone:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (qword_1000ACB00 == -1)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    etaDateStringWithoutAMPM = self->_etaDateStringWithoutAMPM;
    if (etaDateStringWithoutAMPM) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  dispatch_once(&qword_1000ACB00, &stru_10009F3B0);
  if (!v5) {
    goto LABEL_6;
  }
LABEL_3:
  etaDateStringWithoutAMPM = self->_etaDateString;
  if (etaDateStringWithoutAMPM)
  {
LABEL_4:
    v8 = etaDateStringWithoutAMPM;
    goto LABEL_19;
  }
LABEL_7:
  if (v4 && self->_destinationTimeZone)
  {
    v9 = +[NSTimeZone defaultTimeZone];
    destinationTimeZone = self->_destinationTimeZone;
    v11 = [(GuidanceETA *)self etaDate];
    unsigned __int8 v12 = [v9 _navigation_isEquivalentToTimeZone:destinationTimeZone forDate:v11];

    id v13 = @"J:mm";
    if (v5) {
      id v13 = @"j:mm";
    }
    id v14 = v13;
    id v15 = v14;
    if ((v12 & 1) == 0)
    {
      uint64_t v16 = [(__CFString *)v14 stringByAppendingString:@"z"];

      id v15 = (__CFString *)v16;
    }
  }
  else
  {
    double v17 = @"J:mm";
    if (v5) {
      double v17 = @"j:mm";
    }
    id v15 = v17;
  }
  [(id)qword_1000ACAF8 setLocalizedDateFormatFromTemplate:v15];
  [(id)qword_1000ACAF8 setTimeZone:self->_destinationTimeZone];
  uint64_t v18 = (void *)qword_1000ACAF8;
  v19 = [(GuidanceETA *)self etaDate];
  v8 = [v18 stringFromDate:v19];

  uint64_t v20 = (objc_class *)[(NSString *)v8 copy];
  uint64_t v21 = 24;
  if (v5) {
    uint64_t v21 = 16;
  }
  v22 = *(Class *)((char *)&self->super.isa + v21);
  *(Class *)((char *)&self->super.isa + v21) = v20;

LABEL_19:

  return v8;
}

+ (id)etaStringFromEtaLegInfo:(id)a3 includingAMPMSymbols:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_class();
  v7 = [v5 eta];
  v8 = [v5 timeZone];

  v9 = [v6 _arrivalTimeStringForEtaDate:v7 timeZone:v8 includingAMPMSymbols:v4];

  return v9;
}

+ (unint64_t)displayMinutesForTimeInterval:(double)a3
{
  return vcvtpd_u64_f64(a3 / 60.0);
}

+ (id)displayDateForDate:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSCalendar currentCalendar];
  id v5 = +[NSCalendar currentCalendar];
  v6 = [v5 components:96 fromDate:v3];

  v7 = [v4 dateBySettingHour:[v6 hour] minute:[v6 minute] second:0 ofDate:v3 options:2];

  return v7;
}

- (id)description
{
  arrivalBatteryCharge = self->_arrivalBatteryCharge;
  uint64_t v4 = objc_opt_class();
  unint64_t remainingMinutes = self->_remainingMinutes;
  double remainingDistance = self->_remainingDistance;
  uint64_t v7 = [(GuidanceETA *)self etaDate];
  v8 = (void *)v7;
  if (arrivalBatteryCharge) {
    +[NSString stringWithFormat:@"<%@: %p remainingMinutes=%lu remainingDistance=%f etaDate=%@ arrivalBatteryCharge=%lu timezone=%@>", v4, self, remainingMinutes, *(void *)&remainingDistance, v7, [(NSNumber *)self->_arrivalBatteryCharge unsignedIntegerValue], self->_destinationTimeZone];
  }
  else {
  v9 = +[NSString stringWithFormat:@"<%@: %p remainingMinutes=%lu remainingDistance=%f etaDate=%@ timezone=%@>", v4, self, remainingMinutes, *(void *)&remainingDistance, v7, self->_destinationTimeZone, v11];
  }

  return v9;
}

- (id)arrivalTimeStringIncludingAMPMSymbols:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_class();
  v6 = [(GuidanceETA *)self etaDate];
  uint64_t v7 = [v5 _arrivalTimeStringForEtaDate:v6 timeZone:self->_destinationTimeZone includingAMPMSymbols:v3];

  return v7;
}

- (NSString)arrivalTimeBottomString
{
  unsigned int v2 = [(GuidanceETA *)self isEtaToFinalDestination];
  BOOL v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"[NavTray] arrival label";
  }
  else {
    CFStringRef v5 = @"[NavTray] arrival label (next stop)";
  }
  v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return (NSString *)v6;
}

- (id)arrivalTimeExpandedStringIncludingAMPMSymbols:(BOOL)a3
{
  BOOL v3 = self;
  uint64_t v4 = [(GuidanceETA *)self arrivalTimeStringIncludingAMPMSymbols:a3];
  LODWORD(v3) = [(GuidanceETA *)v3 isEtaToFinalDestination];
  CFStringRef v5 = +[NSBundle mainBundle];
  v6 = v5;
  if (v3) {
    CFStringRef v7 = @"[NavTray] Arrival time format";
  }
  else {
    CFStringRef v7 = @"[NavTray] Arrival time format (next stop)";
  }
  v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  return v9;
}

+ (id)_arrivalTimeStringForEtaDate:(id)a3 timeZone:(id)a4 includingAMPMSymbols:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (qword_1000ACB10 != -1) {
    dispatch_once(&qword_1000ACB10, &stru_10009F3D0);
  }
  [(id)qword_1000ACB08 setTimeZone:v8];
  if (v5) {
    CFStringRef v9 = @"j:mm";
  }
  else {
    CFStringRef v9 = @"J:mm";
  }
  [(id)qword_1000ACB08 setLocalizedDateFormatFromTemplate:v9];
  v10 = [(id)qword_1000ACB08 stringFromDate:v7];

  return v10;
}

- (NSString)timeValue
{
  timeValue = self->_timeValue;
  if (!timeValue)
  {
    [(GuidanceETA *)self _computeTimeProperties];
    timeValue = self->_timeValue;
  }

  return timeValue;
}

- (NSString)timeUnit
{
  timeUnit = self->_timeUnit;
  if (!timeUnit)
  {
    [(GuidanceETA *)self _computeTimeProperties];
    timeUnit = self->_timeUnit;
  }

  return timeUnit;
}

- (NSString)timeUnitAccessibility
{
  timeUnitAccessibility = self->_timeUnitAccessibility;
  if (!timeUnitAccessibility)
  {
    [(GuidanceETA *)self _computeTimeProperties];
    timeUnitAccessibility = self->_timeUnitAccessibility;
  }

  return timeUnitAccessibility;
}

- (void)_computeTimeProperties
{
  uint64_t remainingMinutes_low = LODWORD(self->_remainingMinutes);
  if ((int)remainingMinutes_low < 14401)
  {
    uint64_t v10 = ((int)remainingMinutes_low / 60);
    if ((int)remainingMinutes_low <= 1439) {
      uint64_t v11 = ((int)remainingMinutes_low % 60);
    }
    else {
      uint64_t v11 = 0;
    }
    if (v11) {
      BOOL v12 = (remainingMinutes_low - 60) >= 0x3C;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 2;
    }
    if (v13)
    {
      if (v11)
      {
        id v14 = +[NSBundle mainBundle];
        id v15 = [v14 localizedStringForKey:@"Hours and minutes value [ETA]" value:@"localized string not found" table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v10, v11);
        uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        timeValue = self->_timeValue;
        self->_timeValue = v16;
      }
      else
      {
        v25 = +[NSString localizedStringWithFormat:@"%d", v10];
        id v14 = self->_timeValue;
        self->_timeValue = v25;
      }

      objc_super v26 = +[NSBundle mainBundle];
      v27 = [v26 localizedStringForKey:@"Hours label [ETA]" value:@"localized string not found" table:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v13);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      timeUnit = self->_timeUnit;
      self->_timeUnit = v28;

      +[NSBundle mainBundle];
      v24 = [(id)objc_claimAutoreleasedReturnValue() localizedStringForKey:@"Hours accessibility label [ETA]" value:@"localized string not found" table:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v13);
    }
    else
    {
      uint64_t v18 = +[NSString localizedStringWithFormat:@"%d", LODWORD(self->_remainingMinutes)];
      v19 = self->_timeValue;
      self->_timeValue = v18;

      uint64_t v20 = +[NSBundle mainBundle];
      uint64_t v21 = [v20 localizedStringForKey:@"Minutes label [ETA]" value:@"localized string not found" table:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, remainingMinutes_low);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_super v23 = self->_timeUnit;
      self->_timeUnit = v22;

      +[NSBundle mainBundle];
      v24 = [(id)objc_claimAutoreleasedReturnValue() localizedStringForKey:@"Minutes accessibility label [ETA]" value:@"localized string not found" table:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, remainingMinutes_low);
    }
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    timeUnitAccessibility = self->_timeUnitAccessibility;
    self->_timeUnitAccessibility = v30;
  }
  else
  {
    uint64_t v4 = +[NSBundle mainBundle];
    BOOL v5 = [v4 localizedStringForKey:@"Excessive time (10+ days) [ETA]" value:@"localized string not found" table:0];
    v6 = self->_timeValue;
    self->_timeValue = v5;

    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"Days label [ETA]" value:@"localized string not found" table:0];
    CFStringRef v9 = self->_timeUnit;
    self->_timeUnit = v8;

    self->_timeUnitAccessibility = self->_timeUnit;
  }

  _objc_release_x1();
}

- (NSString)distanceValue
{
  distanceValue = self->_distanceValue;
  if (!distanceValue)
  {
    [(GuidanceETA *)self _computeDistanceProperties];
    distanceValue = self->_distanceValue;
  }

  return distanceValue;
}

- (NSString)distanceUnit
{
  distanceUnit = self->_distanceUnit;
  if (!distanceUnit)
  {
    [(GuidanceETA *)self _computeDistanceProperties];
    distanceUnit = self->_distanceUnit;
  }

  return distanceUnit;
}

- (NSString)distanceUnitAccessibility
{
  distanceUnitAccessibility = self->_distanceUnitAccessibility;
  if (!distanceUnitAccessibility)
  {
    [(GuidanceETA *)self _computeDistanceProperties];
    distanceUnitAccessibility = self->_distanceUnitAccessibility;
  }

  return distanceUnitAccessibility;
}

- (int64_t)_lengthUnitFromUnit:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUnitLength kilometers];

  if (v4 == v3)
  {
    int64_t v9 = 14;
  }
  else
  {
    id v5 = +[NSUnitLength meters];

    if (v5 == v3)
    {
      int64_t v9 = 11;
    }
    else
    {
      id v6 = +[NSUnitLength miles];

      if (v6 == v3)
      {
        int64_t v9 = 1284;
      }
      else
      {
        id v7 = +[NSUnitLength yards];

        if (v7 == v3)
        {
          int64_t v9 = 1283;
        }
        else
        {
          id v8 = +[NSUnitLength feet];

          if (v8 == v3) {
            int64_t v9 = 1282;
          }
          else {
            int64_t v9 = 1284;
          }
        }
      }
    }
  }

  return v9;
}

- (int64_t)_unitStyleForUnit:(int64_t)a3
{
  int64_t result = 1;
  if (a3 > 1282)
  {
    if ((unint64_t)(a3 - 1283) >= 2) {
      return 2;
    }
  }
  else if (a3 != 11 && a3 != 14)
  {
    return 2;
  }
  return result;
}

- (void)_computeDistanceProperties
{
  GEORoundedMeasurementForDistance();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [v17 doubleValue];
  double v4 = v3;
  if (self->_remainingDistance >= 0.0)
  {
    if (vabdd_f64(v3, floor(v3)) < 0.000001) {
      +[NSString localizedStringWithFormat:@"%.0f", *(void *)&v3];
    }
    else {
    id v8 = +[NSString localizedStringWithFormat:@"%.1f", *(void *)&v3];
    }
    distanceValue = self->_distanceValue;
    self->_distanceValue = v8;
  }
  else
  {
    distanceValue = +[NSBundle mainBundle];
    id v6 = [distanceValue localizedStringForKey:@"Invalid Distance [ETA]" value:@"localized string not found" table:0];
    id v7 = self->_distanceValue;
    self->_distanceValue = v6;
  }
  int64_t v9 = [v17 unit];
  int64_t v10 = [(GuidanceETA *)self _lengthUnitFromUnit:v9];

  if (qword_1000ACB20 != -1) {
    dispatch_once(&qword_1000ACB20, &stru_10009F3F0);
  }
  id v11 = (id)qword_1000ACB18;
  [v11 setUnitStyle:[self _unitStyleForUnit:v10]];
  BOOL v12 = [v11 unitStringFromValue:v10 unit:v4];
  distanceUnit = self->_distanceUnit;
  self->_distanceUnit = v12;

  if (qword_1000ACB30 != -1) {
    dispatch_once(&qword_1000ACB30, &stru_10009F410);
  }
  id v14 = (id)qword_1000ACB28;
  id v15 = [v14 unitStringFromValue:v10 unit:v4];
  distanceUnitAccessibility = self->_distanceUnitAccessibility;
  self->_distanceUnitAccessibility = v15;
}

+ (id)defaultArrivalString
{
  unsigned int v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"arrival/ETA" value:@"localized string not found" table:0];

  return v3;
}

+ (id)invalidValueString
{
  unsigned int v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"[NavTray] Unknown value" value:@"localized string not found" table:0];

  return v3;
}

+ (id)defaultTimeUnit
{
  unsigned int v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"[NavTray] default time units" value:@"localized string not found" table:0];

  return v3;
}

+ (id)defaultTimeUnitAccessibility
{
  unsigned int v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"[NavTray] default time units accessibility" value:@"localized string not found" table:0];

  return v3;
}

+ (id)defaultDistanceUnit
{
  unsigned int v2 = +[NSLocale currentLocale];
  unsigned int v3 = [v2 _navigation_distanceUsesMetricSystem];

  double v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"[NavTray][Metric] default distance units";
  }
  else {
    CFStringRef v6 = @"[NavTray][Imperial] default distance units";
  }
  id v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  return v7;
}

+ (id)defaultDistanceUnitAccessibility
{
  unsigned int v2 = +[NSLocale currentLocale];
  unsigned int v3 = [v2 _navigation_distanceUsesMetricSystem];

  double v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"[NavTray][Metric] default distance units accessibility";
  }
  else {
    CFStringRef v6 = @"[NavTray][Imperial] default distance units accessibility";
  }
  id v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  return v7;
}

+ (id)defaultBatteryOnArrivalString
{
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"on arrival/ETA" value:@"localized string not found" table:0];

  return v3;
}

- (id)_chargeImageAttachmentWithFont:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v4 pointSize];
  double v7 = v6;
  id v8 = [(GuidanceETA *)self arrivalBatteryCharge];
  int64_t v9 = +[UIImage chargeImageOfSize:batteryLevel:](UIImage, "chargeImageOfSize:batteryLevel:", [v8 unsignedIntegerValue], v7);

  [v5 setImage:v9];
  [v4 capHeight];
  double v11 = v10;

  [v9 size];
  double v13 = (v11 - v12) * 0.5;
  [v9 size];
  double v15 = v14;
  [v9 size];
  [v5 setBounds:0.0, v13, v15, v16];
  id v17 = +[NSAttributedString attributedStringWithAttachment:v5];

  return v17;
}

- (id)batteryChargeStringWithFont:(id)a3
{
  id v4 = a3;
  id v5 = [(GuidanceETA *)self _chargeImageAttachmentWithFont:v4];
  id v6 = [v5 mutableCopy];

  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
  [v6 appendAttributedString:v7];

  id v8 = objc_alloc((Class)NSAttributedString);
  int64_t v9 = [(GuidanceETA *)self arrivalBatteryCharge];
  double v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld%%", [v9 integerValue]);
  id v11 = [v8 initWithString:v10];
  [v6 appendAttributedString:v11];

  double v12 = [v6 string];
  id v13 = [v12 length];

  NSAttributedStringKey v17 = NSFontAttributeName;
  id v18 = v4;
  double v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  [v6 addAttributes:v14 range:0];
  id v15 = [v6 copy];

  return v15;
}

- (id)arrivalWithBatteryChargeStringWithFont:(id)a3 includingAMPMSymbols:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(GuidanceETA *)self _chargeImageAttachmentWithFont:v6];
  id v8 = [(GuidanceETA *)self etaDateStringWithAMPMSymbol:v4 allowTimeZone:0];
  int64_t v9 = +[NSBundle mainBundle];
  double v10 = [v9 localizedStringForKey:@"00:00 arrival with X%" value:@"localized string not found" table:0];
  id v11 = [(GuidanceETA *)self arrivalBatteryCharge];
  double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8, [v11 integerValue]);

  id v13 = [objc_alloc((Class)NSAttributedString) initWithString:v12];
  id v14 = [v13 mutableCopy];

  id v15 = [v14 string];
  id v16 = [v15 rangeOfString:@"$1$@"];
  uint64_t v18 = v17;

  if (v16 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [v14 replaceCharactersInRange:v16 withAttributedString:v18];
  }
  v19 = [v14 string];
  id v20 = [v19 length];

  NSAttributedStringKey v24 = NSFontAttributeName;
  id v25 = v6;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v14 addAttributes:v21 range:0];

  id v22 = [v14 copy];

  return v22;
}

- (id)extendedArrivalBatteryChargeStringWithFont:(id)a3
{
  id v4 = a3;
  id v5 = [(GuidanceETA *)self _chargeImageAttachmentWithFont:v4];
  id v6 = [v5 mutableCopy];

  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
  [v6 appendAttributedString:v7];

  id v8 = objc_alloc((Class)NSAttributedString);
  int64_t v9 = +[NSBundle mainBundle];
  double v10 = [v9 localizedStringForKey:@"[NavTray] Extended arrival battery charge format" value:@"localized string not found" table:0];
  id v11 = [(GuidanceETA *)self arrivalBatteryCharge];
  double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, [v11 integerValue]);
  id v13 = [v8 initWithString:v12];
  [v6 appendAttributedString:v13];

  id v14 = [v6 string];
  id v15 = [v14 length];

  NSAttributedStringKey v19 = NSFontAttributeName;
  id v20 = v4;
  id v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  [v6 addAttributes:v16 range:0];
  id v17 = [v6 copy];

  return v17;
}

- (double)remainingDistance
{
  return self->_remainingDistance;
}

- (NSNumber)arrivalBatteryCharge
{
  return self->_arrivalBatteryCharge;
}

- (unint64_t)remainingMinutes
{
  return self->_remainingMinutes;
}

- (NSDate)etaDate
{
  return self->_etaDate;
}

- (BOOL)isEtaToFinalDestination
{
  return self->_isEtaToFinalDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaDate, 0);
  objc_storeStrong((id *)&self->_timeUnitAccessibility, 0);
  objc_storeStrong((id *)&self->_timeUnit, 0);
  objc_storeStrong((id *)&self->_timeValue, 0);
  objc_storeStrong((id *)&self->_distanceUnitAccessibility, 0);
  objc_storeStrong((id *)&self->_distanceUnit, 0);
  objc_storeStrong((id *)&self->_distanceValue, 0);
  objc_storeStrong((id *)&self->_arrivalBatteryCharge, 0);
  objc_storeStrong((id *)&self->_etaDateStringWithoutAMPM, 0);
  objc_storeStrong((id *)&self->_etaDateString, 0);

  objc_storeStrong((id *)&self->_destinationTimeZone, 0);
}

@end