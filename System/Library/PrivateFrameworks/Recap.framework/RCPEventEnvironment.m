@interface RCPEventEnvironment
+ (id)currentEnvironment;
- (BOOL)hasAbsoluteTimeCorrelation;
- (BOOL)isSimulator;
- (NSArray)screens;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)recapVersion;
- (RCPEventEnvironment)init;
- (RCPEventEnvironment)initWithCoder:(id)a3;
- (double)speedFactorToAdjustRecordingEnvironment:(id)a3;
- (double)startTimeAsIntervalSince1970;
- (double)timeIntervalForMachAbsoluteTime:(unint64_t)a3;
- (double)timeIntervalSince1970ForMachAbsoluteTime:(unint64_t)a3;
- (double)timeScale;
- (id)_buttonConfigurationDescription;
- (id)description;
- (id)timeDescriptionForEvent:(id)a3;
- (int)pointerScanRate;
- (int)touchScanRate;
- (int64_t)homeButtonHardware;
- (int64_t)machTimeDenominator;
- (int64_t)machTimeNumerator;
- (unint64_t)machAbsoluteTimeForTimeInterval:(double)a3;
- (unint64_t)machAbsoluteTimeForTimeIntervalSince1970:(double)a3;
- (unint64_t)startTimeAsMachTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeButtonHardware:(int64_t)a3;
- (void)setIsSimulator:(BOOL)a3;
- (void)setMachTimeDenominator:(int64_t)a3;
- (void)setMachTimeNumerator:(int64_t)a3;
- (void)setPointerScanRate:(int)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRecapVersion:(id)a3;
- (void)setScreens:(id)a3;
- (void)setStartDate:(id)a3 machAbsoluteTime:(unint64_t)a4;
- (void)setStartTimeAsIntervalSince1970:(double)a3;
- (void)setStartTimeAsMachTimestamp:(unint64_t)a3;
- (void)setTimeScale:(double)a3;
- (void)setTouchScanRate:(int)a3;
@end

@implementation RCPEventEnvironment

- (unint64_t)machAbsoluteTimeForTimeInterval:(double)a3
{
  return (unint64_t)(a3 * 1000000000.0 / self->_timeScale);
}

- (int)touchScanRate
{
  return self->_touchScanRate;
}

- (NSArray)screens
{
  return self->_screens;
}

- (int)pointerScanRate
{
  return self->_pointerScanRate;
}

+ (id)currentEnvironment
{
  v2 = objc_opt_new();
  return v2;
}

- (double)speedFactorToAdjustRecordingEnvironment:(id)a3
{
  id v4 = a3;
  [(RCPEventEnvironment *)self timeScale];
  double v6 = v5;
  [v4 timeScale];
  double v8 = v7;

  return v6 / v8;
}

- (double)timeScale
{
  return self->_timeScale;
}

- (BOOL)isSimulator
{
  return self->_isSimulator;
}

- (RCPEventEnvironment)init
{
  v23.receiver = self;
  v23.super_class = (Class)RCPEventEnvironment;
  v2 = [(RCPEventEnvironment *)&v23 init];
  if (v2)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    int64_t numer = info.numer;
    uint32_t denom = info.denom;
    double v5 = (double)info.numer;
    v2->_machTimeDenominator = info.denom;
    v2->_machTimeNumerator = numer;
    v2->_timeScale = v5 / (double)denom;
    size_t size = 0;
    sysctlbyname("hw.model", 0, &size, 0, 0);
    if (size)
    {
      double v6 = malloc_type_malloc(size, 0x100004077774924uLL);
      if (v6)
      {
        double v7 = v6;
        sysctlbyname("hw.model", v6, &size, 0, 0);
        double v8 = [NSString stringWithUTF8String:v7];
        [(RCPEventEnvironment *)v2 setProductType:v8];

        free(v7);
      }
      else
      {
        v9 = [NSString stringWithUTF8String:"Mac"];
        [(RCPEventEnvironment *)v2 setProductType:v9];
      }
    }
    int v24 = 0;
    v10 = (void *)MGCopyAnswerWithError();
    [(RCPEventEnvironment *)v2 setProductName:v10];

    v11 = [MEMORY[0x1E4F28F80] processInfo];
    v12 = [v11 operatingSystemVersionString];

    v13 = [v12 stringByReplacingOccurrencesOfString:@"Version " withString:&stru_1EFF926D0];

    v14 = [v13 stringByReplacingOccurrencesOfString:@"Build " withString:&stru_1EFF926D0];

    [(RCPEventEnvironment *)v2 setProductVersion:v14];
    [(RCPEventEnvironment *)v2 setRecapVersion:@"1.4"];
    [(RCPEventEnvironment *)v2 setPointerScanRate:120];
    if (MGGetBoolAnswer()) {
      uint64_t v15 = 120;
    }
    else {
      uint64_t v15 = 60;
    }
    [(RCPEventEnvironment *)v2 setTouchScanRate:v15];
    v16 = _RCPActiveScreens();
    [(RCPEventEnvironment *)v2 setScreens:v16];

    v17 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    unint64_t v18 = [v17 homeButtonType] + 1;
    if (v18 <= 3) {
      [(RCPEventEnvironment *)v2 setHomeButtonHardware:qword_1A9077AC8[v18]];
    }
    v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSince1970];
    -[RCPEventEnvironment setStartTimeAsIntervalSince1970:](v2, "setStartTimeAsIntervalSince1970:");

    [(RCPEventEnvironment *)v2 setStartTimeAsMachTimestamp:mach_absolute_time()];
  }
  return v2;
}

- (void)setTouchScanRate:(int)a3
{
  self->_touchScanRate = a3;
}

- (void)setStartTimeAsMachTimestamp:(unint64_t)a3
{
  self->_startTimeAsMachTimestamp = a3;
}

- (void)setStartTimeAsIntervalSince1970:(double)a3
{
  self->_startTimeAsIntervalSince1970 = a3;
}

- (void)setScreens:(id)a3
{
}

- (void)setRecapVersion:(id)a3
{
}

- (void)setProductVersion:(id)a3
{
}

- (void)setProductType:(id)a3
{
}

- (void)setProductName:(id)a3
{
}

- (void)setPointerScanRate:(int)a3
{
  self->_pointerScanRate = a3;
}

- (void)setHomeButtonHardware:(int64_t)a3
{
  self->_homeButtonHardware = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screens, 0);
  objc_storeStrong((id *)&self->_recapVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
}

- (double)timeIntervalForMachAbsoluteTime:(unint64_t)a3
{
  return self->_timeScale * (double)a3 / 1000000000.0;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeInt64:self->_machTimeDenominator forKey:@"denom"];
  [v13 encodeInt64:self->_machTimeNumerator forKey:@"num"];
  objc_msgSend(v13, "encodeBool:forKey:", -[RCPEventEnvironment isSimulator](self, "isSimulator"), @"isSim");
  [v13 encodeInt:self->_touchScanRate forKey:@"touchScanRate"];
  [v13 encodeInt:self->_touchScanRate forKey:@"pointerScanRate"];
  id v4 = [(RCPEventEnvironment *)self screens];
  double v5 = [v4 firstObject];
  [v5 pointSize];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v15);

  [v13 encodeObject:DictionaryRepresentation forKey:@"screenSize"];
  double v7 = [(RCPEventEnvironment *)self screens];
  [v13 encodeObject:v7 forKey:@"screens"];

  double v8 = [(RCPEventEnvironment *)self productType];
  [v13 encodeObject:v8 forKey:@"productType"];

  v9 = [(RCPEventEnvironment *)self productName];
  [v13 encodeObject:v9 forKey:@"productName"];

  v10 = [(RCPEventEnvironment *)self productVersion];
  [v13 encodeObject:v10 forKey:@"productVersion"];

  v11 = [(RCPEventEnvironment *)self recapVersion];
  [v13 encodeObject:v11 forKey:@"recapVersion"];

  int64_t homeButtonHardware = self->_homeButtonHardware;
  if (homeButtonHardware) {
    [v13 encodeInteger:homeButtonHardware forKey:@"homeButtonHardware"];
  }
  [(RCPEventEnvironment *)self startTimeAsIntervalSince1970];
  objc_msgSend(v13, "encodeDouble:forKey:", @"startTimeAsIntervalSince1970");
  objc_msgSend(v13, "encodeInt64:forKey:", -[RCPEventEnvironment startTimeAsMachTimestamp](self, "startTimeAsMachTimestamp"), @"startTimeAsMachTimestamp");
}

- (RCPEventEnvironment)initWithCoder:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(RCPEventEnvironment *)self init];
  if (v5)
  {
    v5->_machTimeDenominator = [v4 decodeInt64ForKey:@"denom"];
    v5->_machTimeNumerator = [v4 decodeInt64ForKey:@"num"];
    -[RCPEventEnvironment setIsSimulator:](v5, "setIsSimulator:", [v4 decodeBoolForKey:@"isSim"]);
    if ([v4 requiresSecureCoding]) {
      [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"screens"];
    }
    else {
    uint64_t v6 = [v4 decodeObjectForKey:@"screens"];
    }
    screens = v5->_screens;
    v5->_screens = (NSArray *)v6;

    if (!v5->_screens)
    {
      v14 = _RCPActiveScreens();
      uint64_t v15 = [v14 count];

      if (v15)
      {
        v16 = _RCPActiveScreens();
        v17 = [v16 firstObject];
        v24[0] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        v19 = v5->_screens;
        v5->_screens = (NSArray *)v18;

        v23.double width = 0.0;
        v23.double height = 0.0;
        if (CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)[v4 decodeObjectForKey:@"screenSize"], &v23))
        {
          double width = v23.width;
          double height = v23.height;
          v22 = [(NSArray *)v5->_screens firstObject];
          objc_msgSend(v22, "setPointSize:", width, height);
        }
      }
    }
    double v8 = [v4 decodeObjectForKey:@"productType"];
    [(RCPEventEnvironment *)v5 setProductType:v8];

    v9 = [v4 decodeObjectForKey:@"productName"];
    [(RCPEventEnvironment *)v5 setProductName:v9];

    v10 = [v4 decodeObjectForKey:@"productVersion"];
    [(RCPEventEnvironment *)v5 setProductVersion:v10];

    v11 = [v4 decodeObjectForKey:@"recapVersion"];
    [(RCPEventEnvironment *)v5 setRecapVersion:v11];

    v12 = [(RCPEventEnvironment *)v5 recapVersion];

    if (!v12) {
      [(RCPEventEnvironment *)v5 setRecapVersion:@"1.0"];
    }
    -[RCPEventEnvironment setHomeButtonHardware:](v5, "setHomeButtonHardware:", [v4 decodeIntegerForKey:@"homeButtonHardware"]);
    -[RCPEventEnvironment setTouchScanRate:](v5, "setTouchScanRate:", [v4 decodeIntForKey:@"touchScanRate"]);
    -[RCPEventEnvironment setPointerScanRate:](v5, "setPointerScanRate:", [v4 decodeIntForKey:@"pointerScanRate"]);
    v5->_timeScale = (double)v5->_machTimeNumerator / (double)v5->_machTimeDenominator;
    if ([v4 containsValueForKey:@"startTimeAsMachTimestamp"])
    {
      -[RCPEventEnvironment setStartTimeAsMachTimestamp:](v5, "setStartTimeAsMachTimestamp:", [v4 decodeInt64ForKey:@"startTimeAsMachTimestamp"]);
      [v4 decodeDoubleForKey:@"startTimeAsIntervalSince1970"];
      -[RCPEventEnvironment setStartTimeAsIntervalSince1970:](v5, "setStartTimeAsIntervalSince1970:");
    }
    else
    {
      v5->_startTimeAsIntervalSince1970 = 0.0;
      v5->_startTimeAsMachTimestamp = 0;
    }
  }

  return v5;
}

- (void)setStartDate:(id)a3 machAbsoluteTime:(unint64_t)a4
{
  self->_startTimeAsMachTimestamp = a4;
  [a3 timeIntervalSince1970];
  self->_startTimeAsIntervalSince1970 = v5;
}

- (BOOL)hasAbsoluteTimeCorrelation
{
  return self->_startTimeAsMachTimestamp && self->_startTimeAsIntervalSince1970 != 0.0;
}

- (double)timeIntervalSince1970ForMachAbsoluteTime:(unint64_t)a3
{
  [(RCPEventEnvironment *)self timeIntervalForMachAbsoluteTime:self->_startTimeAsMachTimestamp];
  double v6 = v5;
  [(RCPEventEnvironment *)self timeIntervalForMachAbsoluteTime:a3];
  return self->_startTimeAsIntervalSince1970 + v7 - v6;
}

- (unint64_t)machAbsoluteTimeForTimeIntervalSince1970:(double)a3
{
  [(RCPEventEnvironment *)self timeIntervalForMachAbsoluteTime:self->_startTimeAsMachTimestamp];
  double v6 = v5 + a3 - self->_startTimeAsIntervalSince1970;
  return [(RCPEventEnvironment *)self machAbsoluteTimeForTimeInterval:v6];
}

- (id)_buttonConfigurationDescription
{
  if (self->_homeButtonHardware == 2) {
    return @"(H)";
  }
  else {
    return @"(h)";
  }
}

- (id)description
{
  v3 = [(RCPEventEnvironment *)self _buttonConfigurationDescription];
  v19 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(RCPEventEnvironment *)self productType];
  double v7 = [(RCPEventEnvironment *)self productName];
  double v8 = [(RCPEventEnvironment *)self productVersion];
  BOOL v9 = [(RCPEventEnvironment *)self isSimulator];
  v10 = [(RCPEventEnvironment *)self screens];
  if ([v10 count] == 1)
  {
    v11 = [v10 firstObject];
    v12 = [v11 description];
  }
  else
  {
    v12 = [v10 componentsJoinedByString:@", "];
  }
  if (v9) {
    id v13 = @"Simulator";
  }
  else {
    id v13 = @"Device";
  }
  [(RCPEventEnvironment *)self timeScale];
  uint64_t v15 = v14;
  v16 = [(RCPEventEnvironment *)self recapVersion];
  v17 = [v19 stringWithFormat:@"<%@ %p> %@ -- %@ -- %@ -- %@ -- <%@> - %0.5f -- %@%@", v5, self, v6, v7, v8, v13, v12, v15, v3, v16];

  return v17;
}

- (id)timeDescriptionForEvent:(id)a3
{
  uint64_t v4 = [a3 deliveryTimestamp];
  [(RCPEventEnvironment *)self timeIntervalForMachAbsoluteTime:v4];
  double v6 = objc_msgSend(NSString, "stringWithFormat:", @"%f %llu", v5, v4);
  if ([(RCPEventEnvironment *)self hasAbsoluteTimeCorrelation])
  {
    [(RCPEventEnvironment *)self timeIntervalSince1970ForMachAbsoluteTime:v4];
    uint64_t v8 = v7;
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
    v10 = [v9 description];
    uint64_t v11 = [v6 stringByAppendingFormat:@" - %@ - %f", v10, v8];

    double v6 = (void *)v11;
  }
  return v6;
}

- (void)setTimeScale:(double)a3
{
  self->_timeScale = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)recapVersion
{
  return self->_recapVersion;
}

- (int64_t)homeButtonHardware
{
  return self->_homeButtonHardware;
}

- (void)setIsSimulator:(BOOL)a3
{
  self->_isSimulator = a3;
}

- (int64_t)machTimeDenominator
{
  return self->_machTimeDenominator;
}

- (void)setMachTimeDenominator:(int64_t)a3
{
  self->_machTimeDenominator = a3;
}

- (int64_t)machTimeNumerator
{
  return self->_machTimeNumerator;
}

- (void)setMachTimeNumerator:(int64_t)a3
{
  self->_machTimeNumerator = a3;
}

- (double)startTimeAsIntervalSince1970
{
  return self->_startTimeAsIntervalSince1970;
}

- (unint64_t)startTimeAsMachTimestamp
{
  return self->_startTimeAsMachTimestamp;
}

@end