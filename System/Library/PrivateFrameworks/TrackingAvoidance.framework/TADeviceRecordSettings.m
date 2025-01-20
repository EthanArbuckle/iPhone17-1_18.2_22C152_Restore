@interface TADeviceRecordSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAlertHELEImmediatelyForImmediateTypes;
- (BOOL)surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll;
- (BOOL)surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll;
- (BOOL)surfaceImmediatelyBeepOnMove;
- (TADeviceRecordSettings)init;
- (TADeviceRecordSettings)initWithCoder:(id)a3;
- (TADeviceRecordSettings)initWithExpiryTimeInterval:(double)a3 purgeTimeInterval:(double)a4 keepAliveInterval:(double)a5 minimumStagingInterval:(double)a6 stagingBackstopHour:(unint64_t)a7 assumedKeyRollHour:(unint64_t)a8 scanInterval:(double)a9 surfaceImmediatelyBeepOnMove:(BOOL)a10 surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:(BOOL)a11 maxExpectedHELEWildInterval:(double)a12 maxExpectedDurianWildInterval:(double)a13 shouldAlertHELEImmediatelyForImmediateTypes:(BOOL)a14 minimumHELEStagingInterval:(double)a15 stagingHELEBackstopHour:(unint64_t)a16 surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:(BOOL)a17 hyperHELEStagingInterval:(double)a18 hyperStagingInterval:(double)a19;
- (TADeviceRecordSettings)initWithExpiryTimeIntervalOrDefault:(id)a3 purgeTimeIntervalOrDefault:(id)a4 keepAliveIntervalOrDefault:(id)a5 minimumStagingIntervalOrDefault:(id)a6 stagingBackstopHourOrDefault:(id)a7 assumedKeyRollHourOrDefault:(id)a8 scanIntervalOrDefault:(id)a9 surfaceImmediatelyBeepOnMoveOrDefault:(id)a10 surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:(id)a11 maxExpectedHELEWildIntervalOrDefault:(id)a12 maxExpectedDurianWildIntervalOrDefault:(id)a13 shouldAlertHELEImmediatelyForImmediateTypesOrDefault:(id)a14 minimumHELEStagingIntervalOrDefault:(id)a15 stagingHELEBackstopHourOrDefault:(id)a16 surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:(id)a17 hyperHELEStagingIntervalOrDefault:(id)a18 hyperStagingIntervalOrDefault:(id)a19;
- (double)expiryTimeInterval;
- (double)hyperHELEStagingInterval;
- (double)hyperStagingInterval;
- (double)keepAliveInterval;
- (double)maxExpectedDurianWildInterval;
- (double)maxExpectedHELEWildInterval;
- (double)minimumHELEStagingInterval;
- (double)minimumStagingInterval;
- (double)purgeTimeInterval;
- (double)scanInterval;
- (int64_t)assumedKeyRollHour;
- (int64_t)stagingBackstopHour;
- (int64_t)stagingHELEBackstopHour;
- (void)encodeWithCoder:(id)a3;
- (void)setExpiryTimeInterval:(double)a3;
- (void)setPurgeTimeInterval:(double)a3;
@end

@implementation TADeviceRecordSettings

- (double)purgeTimeInterval
{
  return self->_purgeTimeInterval;
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (TADeviceRecordSettings)init
{
  LOBYTE(v3) = 1;
  return -[TADeviceRecordSettings initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:](self, "initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:", 22, 4, 1, 1, 1, 22, 90000.0, 3600.0, 7200.0, 28800.0, 3600.0, 3600.0, 960.0,
           28800.0,
           v3,
           0x40AC200000000000,
           0x40AC200000000000);
}

- (TADeviceRecordSettings)initWithExpiryTimeInterval:(double)a3 purgeTimeInterval:(double)a4 keepAliveInterval:(double)a5 minimumStagingInterval:(double)a6 stagingBackstopHour:(unint64_t)a7 assumedKeyRollHour:(unint64_t)a8 scanInterval:(double)a9 surfaceImmediatelyBeepOnMove:(BOOL)a10 surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:(BOOL)a11 maxExpectedHELEWildInterval:(double)a12 maxExpectedDurianWildInterval:(double)a13 shouldAlertHELEImmediatelyForImmediateTypes:(BOOL)a14 minimumHELEStagingInterval:(double)a15 stagingHELEBackstopHour:(unint64_t)a16 surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:(BOOL)a17 hyperHELEStagingInterval:(double)a18 hyperStagingInterval:(double)a19
{
  v34.receiver = self;
  v34.super_class = (Class)TADeviceRecordSettings;
  result = [(TADeviceRecordSettings *)&v34 init];
  if (result)
  {
    result->_expiryTimeInterval = a3;
    result->_purgeTimeInterval = a4;
    result->_keepAliveInterval = a5;
    result->_minimumStagingInterval = a6;
    result->_stagingBackstopHour = a7;
    result->_assumedKeyRollHour = a8;
    result->_surfaceImmediatelyBeepOnMove = a10;
    result->_surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll = a11;
    result->_scanInterval = a9;
    result->_maxExpectedHELEWildInterval = a12;
    result->_shouldAlertHELEImmediatelyForImmediateTypes = a14;
    result->_maxExpectedDurianWildInterval = a13;
    result->_minimumHELEStagingInterval = a15;
    result->_stagingHELEBackstopHour = a16;
    result->_surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll = a17;
    result->_hyperHELEStagingInterval = a18;
    result->_hyperStagingInterval = a19;
  }
  return result;
}

- (TADeviceRecordSettings)initWithExpiryTimeIntervalOrDefault:(id)a3 purgeTimeIntervalOrDefault:(id)a4 keepAliveIntervalOrDefault:(id)a5 minimumStagingIntervalOrDefault:(id)a6 stagingBackstopHourOrDefault:(id)a7 assumedKeyRollHourOrDefault:(id)a8 scanIntervalOrDefault:(id)a9 surfaceImmediatelyBeepOnMoveOrDefault:(id)a10 surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:(id)a11 maxExpectedHELEWildIntervalOrDefault:(id)a12 maxExpectedDurianWildIntervalOrDefault:(id)a13 shouldAlertHELEImmediatelyForImmediateTypesOrDefault:(id)a14 minimumHELEStagingIntervalOrDefault:(id)a15 stagingHELEBackstopHourOrDefault:(id)a16 surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:(id)a17 hyperHELEStagingIntervalOrDefault:(id)a18 hyperStagingIntervalOrDefault:(id)a19
{
  id v76 = a3;
  id v75 = a4;
  id v74 = a5;
  id v73 = a6;
  id v70 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  id v30 = a14;
  id v31 = a15;
  id v72 = a16;
  id v71 = a17;
  id v77 = a18;
  id v32 = a19;
  if (v76) {
    [v76 doubleValue];
  }
  else {
    *(double *)&uint64_t v33 = 90000.0;
  }
  double v65 = *(double *)&v33;
  if (v75) {
    [v75 doubleValue];
  }
  else {
    *(double *)&uint64_t v34 = 3600.0;
  }
  double v64 = *(double *)&v34;
  v66 = v32;
  if (v74)
  {
    [v74 doubleValue];
    double v36 = v35;
  }
  else
  {
    double v36 = 7200.0;
  }
  if (v73)
  {
    [v73 doubleValue];
    double v38 = v37;
  }
  else
  {
    double v38 = 28800.0;
  }
  if (v70) {
    uint64_t v39 = [v70 unsignedIntValue];
  }
  else {
    uint64_t v39 = 22;
  }
  uint64_t v63 = v39;
  if (v24) {
    uint64_t v40 = [v24 unsignedIntValue];
  }
  else {
    uint64_t v40 = 4;
  }
  uint64_t v62 = v40;
  if (v25)
  {
    [v25 doubleValue];
    double v42 = v41;
    if (v26)
    {
LABEL_21:
      unsigned int v61 = [v26 BOOLValue];
      goto LABEL_24;
    }
  }
  else
  {
    double v42 = 3600.0;
    if (v26) {
      goto LABEL_21;
    }
  }
  unsigned int v61 = 1;
LABEL_24:
  v69 = v26;
  if (v27)
  {
    unsigned int v60 = [v27 BOOLValue];
    if (v28)
    {
LABEL_26:
      [v28 doubleValue];
      double v44 = v43;
      goto LABEL_29;
    }
  }
  else
  {
    unsigned int v60 = 1;
    if (v28) {
      goto LABEL_26;
    }
  }
  double v44 = 3600.0;
LABEL_29:
  if (v29)
  {
    [v29 doubleValue];
    double v46 = v45;
  }
  else
  {
    double v46 = 960.0;
  }
  v67 = v27;
  if (v30)
  {
    uint64_t v47 = [v30 BOOLValue];
    if (v31)
    {
LABEL_34:
      v48 = v31;
      [v31 doubleValue];
      double v50 = v49;
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v47 = 1;
    if (v31) {
      goto LABEL_34;
    }
  }
  v48 = v31;
  double v50 = 28800.0;
LABEL_37:
  if (v72) {
    uint64_t v51 = [v72 unsignedIntValue];
  }
  else {
    uint64_t v51 = 22;
  }
  if (v71) {
    char v52 = [v71 BOOLValue];
  }
  else {
    char v52 = 1;
  }
  uint64_t v53 = 0x40AC200000000000;
  uint64_t v54 = 0x40AC200000000000;
  if (v77)
  {
    [v77 doubleValue];
    uint64_t v54 = v55;
  }
  if (v66)
  {
    [v66 doubleValue];
    uint64_t v53 = v56;
  }
  LOBYTE(v59) = v52;
  v57 = -[TADeviceRecordSettings initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:](self, "initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:", v63, v62, v61, v60, v47, v51, v65, v64, v36, v38, v42, v44, v46,
          v50,
          v59,
          v54,
          v53);

  return v57;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TADeviceRecordSettings *)a3;
  if (self == v4)
  {
    BOOL v43 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(TADeviceRecordSettings *)self expiryTimeInterval];
      double v7 = v6;
      [(TADeviceRecordSettings *)v5 expiryTimeInterval];
      if (v7 != v8) {
        goto LABEL_22;
      }
      [(TADeviceRecordSettings *)self purgeTimeInterval];
      double v10 = v9;
      [(TADeviceRecordSettings *)v5 purgeTimeInterval];
      if (v10 != v11) {
        goto LABEL_22;
      }
      [(TADeviceRecordSettings *)self keepAliveInterval];
      double v13 = v12;
      [(TADeviceRecordSettings *)v5 keepAliveInterval];
      if (v13 != v14) {
        goto LABEL_22;
      }
      [(TADeviceRecordSettings *)self minimumStagingInterval];
      double v16 = v15;
      [(TADeviceRecordSettings *)v5 minimumStagingInterval];
      if (v16 != v17) {
        goto LABEL_22;
      }
      int64_t v18 = [(TADeviceRecordSettings *)self stagingBackstopHour];
      if (v18 != [(TADeviceRecordSettings *)v5 stagingBackstopHour]) {
        goto LABEL_22;
      }
      int64_t v19 = [(TADeviceRecordSettings *)self assumedKeyRollHour];
      if (v19 != [(TADeviceRecordSettings *)v5 assumedKeyRollHour]) {
        goto LABEL_22;
      }
      [(TADeviceRecordSettings *)self scanInterval];
      double v21 = v20;
      [(TADeviceRecordSettings *)v5 scanInterval];
      if (v21 != v22) {
        goto LABEL_22;
      }
      BOOL v23 = [(TADeviceRecordSettings *)self surfaceImmediatelyBeepOnMove];
      if (v23 != [(TADeviceRecordSettings *)v5 surfaceImmediatelyBeepOnMove]) {
        goto LABEL_22;
      }
      BOOL v24 = [(TADeviceRecordSettings *)self surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll];
      if (v24 != [(TADeviceRecordSettings *)v5 surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll])goto LABEL_22; {
      [(TADeviceRecordSettings *)self maxExpectedHELEWildInterval];
      }
      double v26 = v25;
      [(TADeviceRecordSettings *)v5 maxExpectedHELEWildInterval];
      if (v26 != v27) {
        goto LABEL_22;
      }
      [(TADeviceRecordSettings *)self maxExpectedDurianWildInterval];
      double v29 = v28;
      [(TADeviceRecordSettings *)v5 maxExpectedDurianWildInterval];
      if (v29 != v30) {
        goto LABEL_22;
      }
      BOOL v31 = [(TADeviceRecordSettings *)self shouldAlertHELEImmediatelyForImmediateTypes];
      if (v31 != [(TADeviceRecordSettings *)v5 shouldAlertHELEImmediatelyForImmediateTypes])goto LABEL_22; {
      [(TADeviceRecordSettings *)self minimumHELEStagingInterval];
      }
      double v33 = v32;
      [(TADeviceRecordSettings *)v5 minimumHELEStagingInterval];
      if (v33 != v34) {
        goto LABEL_22;
      }
      int64_t v35 = [(TADeviceRecordSettings *)self stagingHELEBackstopHour];
      if (v35 == [(TADeviceRecordSettings *)v5 stagingHELEBackstopHour]
        && (BOOL v36 = [(TADeviceRecordSettings *)self surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll], v36 == [(TADeviceRecordSettings *)v5 surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll])&& ([(TADeviceRecordSettings *)self hyperHELEStagingInterval], v38 = v37, [(TADeviceRecordSettings *)v5 hyperHELEStagingInterval], v38 == v39))
      {
        [(TADeviceRecordSettings *)self hyperStagingInterval];
        double v41 = v40;
        [(TADeviceRecordSettings *)v5 hyperStagingInterval];
        BOOL v43 = v41 == v42;
      }
      else
      {
LABEL_22:
        BOOL v43 = 0;
      }
    }
    else
    {
      BOOL v43 = 0;
    }
  }

  return v43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TADeviceRecordSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"ExpiryInterval"];
  double v33 = v5;
  [v4 decodeDoubleForKey:@"PurgeInterval"];
  double v32 = v6;
  [v4 decodeDoubleForKey:@"KeepAliveInterval"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"MinStagingInterval"];
  double v10 = v9;
  uint64_t v11 = [v4 decodeIntegerForKey:@"BackstopHour"];
  uint64_t v12 = [v4 decodeIntegerForKey:@"KeyRollHour"];
  [v4 decodeDoubleForKey:@"ScanInterval"];
  double v14 = v13;
  BOOL v15 = [v4 decodeIntegerForKey:@"SurfaceImmediatelyBeepOnMove"] != 0;
  BOOL v16 = [v4 decodeIntegerForKey:@"surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"] != 0;
  [v4 decodeDoubleForKey:@"MaxExpectedHELEWildInterval"];
  double v18 = v17;
  [v4 decodeDoubleForKey:@"MaxExpectedDurianWildInterval"];
  double v20 = v19;
  uint64_t v21 = [v4 decodeBoolForKey:@"HELEImmediate"];
  [v4 decodeDoubleForKey:@"MinHELEStagingInterval"];
  double v23 = v22;
  uint64_t v24 = [v4 decodeIntegerForKey:@"HELEBackstopHour"];
  BOOL v25 = [v4 decodeIntegerForKey:@"surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"] != 0;
  [v4 decodeDoubleForKey:@"HyperHELEStagingInterval"];
  uint64_t v27 = v26;
  [v4 decodeDoubleForKey:@"HyperStagingInterval"];
  uint64_t v29 = v28;

  LOBYTE(v31) = v25;
  return -[TADeviceRecordSettings initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:](self, "initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:", v11, v12, v15, v16, v21, v24, v33, v32, v8, v10, v14, v18, v20,
           v23,
           v31,
           v27,
           v29);
}

- (void)encodeWithCoder:(id)a3
{
  double expiryTimeInterval = self->_expiryTimeInterval;
  id v5 = a3;
  [v5 encodeDouble:@"ExpiryInterval" forKey:expiryTimeInterval];
  [v5 encodeDouble:@"PurgeInterval" forKey:self->_purgeTimeInterval];
  [v5 encodeDouble:@"KeepAliveInterval" forKey:self->_keepAliveInterval];
  [v5 encodeDouble:@"MinStagingInterval" forKey:self->_minimumStagingInterval];
  [v5 encodeInteger:self->_stagingBackstopHour forKey:@"BackstopHour"];
  [v5 encodeInteger:self->_assumedKeyRollHour forKey:@"KeyRollHour"];
  [v5 encodeDouble:@"ScanInterval" forKey:self->_scanInterval];
  [v5 encodeInteger:self->_surfaceImmediatelyBeepOnMove forKey:@"SurfaceImmediatelyBeepOnMove"];
  [v5 encodeInteger:self->_surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll forKey:@"surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"];
  [v5 encodeDouble:@"MaxExpectedHELEWildInterval" forKey:self->_maxExpectedHELEWildInterval];
  [v5 encodeDouble:@"MaxExpectedDurianWildInterval" forKey:self->_maxExpectedDurianWildInterval];
  [v5 encodeBool:self->_shouldAlertHELEImmediatelyForImmediateTypes forKey:@"HELEImmediate"];
  [v5 encodeDouble:@"MinHELEStagingInterval" forKey:self->_minimumHELEStagingInterval];
  [v5 encodeInteger:self->_stagingHELEBackstopHour forKey:@"HELEBackstopHour"];
  [v5 encodeInteger:self->_surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll forKey:@"surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"];
  [v5 encodeDouble:@"HyperHELEStagingInterval" forKey:self->_hyperHELEStagingInterval];
  [v5 encodeDouble:@"HyperStagingInterval" forKey:self->_hyperStagingInterval];
}

- (double)expiryTimeInterval
{
  return self->_expiryTimeInterval;
}

- (void)setExpiryTimeInterval:(double)a3
{
  self->_double expiryTimeInterval = a3;
}

- (void)setPurgeTimeInterval:(double)a3
{
  self->_purgeTimeInterval = a3;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (double)minimumStagingInterval
{
  return self->_minimumStagingInterval;
}

- (int64_t)stagingBackstopHour
{
  return self->_stagingBackstopHour;
}

- (int64_t)assumedKeyRollHour
{
  return self->_assumedKeyRollHour;
}

- (BOOL)surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll
{
  return self->_surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll;
}

- (BOOL)surfaceImmediatelyBeepOnMove
{
  return self->_surfaceImmediatelyBeepOnMove;
}

- (double)maxExpectedHELEWildInterval
{
  return self->_maxExpectedHELEWildInterval;
}

- (double)maxExpectedDurianWildInterval
{
  return self->_maxExpectedDurianWildInterval;
}

- (BOOL)shouldAlertHELEImmediatelyForImmediateTypes
{
  return self->_shouldAlertHELEImmediatelyForImmediateTypes;
}

- (double)minimumHELEStagingInterval
{
  return self->_minimumHELEStagingInterval;
}

- (int64_t)stagingHELEBackstopHour
{
  return self->_stagingHELEBackstopHour;
}

- (BOOL)surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll
{
  return self->_surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll;
}

- (double)hyperHELEStagingInterval
{
  return self->_hyperHELEStagingInterval;
}

- (double)hyperStagingInterval
{
  return self->_hyperStagingInterval;
}

@end