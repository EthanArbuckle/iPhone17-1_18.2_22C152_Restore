@interface NTKSiderealData
+ (BOOL)supportsSecureCoding;
+ (id)loadCached;
- ($E2C29196C7A5C696474C6955C5A9CE06)altitudeForProgress:(double)a3;
- (BOOL)_computeIsConstantSunUpOrDown;
- (BOOL)_computeSunsetFollowsSunrise;
- (BOOL)isConstantSunUpOrDown;
- (BOOL)isDateInReferenceDate:(id)a3;
- (BOOL)sunsetFollowsSunrise;
- (BOOL)useXR;
- (CLKUIAlmanacTransitInfo)sunriseSunsetInfo;
- (CLLocation)referenceLocation;
- (NSArray)waypoints;
- (NSData)gradientData;
- (NSDate)referenceDate;
- (NSDate)sunriseTime;
- (NSDate)sunsetTime;
- (NSOrderedSet)daytimeEvents;
- (NSOrderedSet)sectors;
- (NSOrderedSet)solarEvents;
- (NTKSiderealData)initWithCoder:(id)a3;
- (NTKSiderealData)initWithReferenceDate:(id)a3 referenceLocation:(id)a4 sunriseSunsetInfo:(id)a5 solarEvents:(id)a6 daytimeEvents:(id)a7 sectors:(id)a8 waypoints:(id)a9 altitudes:(float *)a10 useXR:(BOOL)a11;
- (id)_findSunriseTime;
- (id)_findSunsetTime;
- (id)_generateGradientDataForXR:(BOOL)a3;
- (id)applySunsetFilterToColor:(id)a3;
- (id)gradientWithSunsetFilterForDayProgress:(float)a3;
- (id)interpolateBetweenCalendricalMidnights:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setSolarDayProgress:(double)a3;
- (void)updateSunsetFilter;
@end

@implementation NTKSiderealData

- (NTKSiderealData)initWithReferenceDate:(id)a3 referenceLocation:(id)a4 sunriseSunsetInfo:(id)a5 solarEvents:(id)a6 daytimeEvents:(id)a7 sectors:(id)a8 waypoints:(id)a9 altitudes:(float *)a10 useXR:(BOOL)a11
{
  id v18 = a3;
  id v19 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  id v30 = a9;
  v35.receiver = self;
  v35.super_class = (Class)NTKSiderealData;
  v20 = [(NTKSiderealData *)&v35 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_referenceDate, a3);
    objc_storeStrong((id *)&v21->_daytimeEvents, a7);
    objc_storeStrong((id *)&v21->_sunriseSunsetInfo, a5);
    objc_storeStrong((id *)&v21->_sectors, a8);
    objc_storeStrong((id *)&v21->_waypoints, a9);
    objc_storeStrong((id *)&v21->_referenceLocation, a4);
    objc_storeStrong((id *)&v21->_solarEvents, a6);
    uint64_t v22 = 0;
    v21->_useXR = a11;
    do
    {
      v21->_altitudes[v22] = a10[v22];
      ++v22;
    }
    while (v22 != 361);
    uint64_t v23 = [(NTKSiderealData *)v21 _generateGradientDataForXR:a11];
    gradientData = v21->_gradientData;
    v21->_gradientData = (NSData *)v23;

    uint64_t v25 = [(NTKSiderealData *)v21 _findSunsetTime];
    sunsetTime = v21->_sunsetTime;
    v21->_sunsetTime = (NSDate *)v25;

    uint64_t v27 = [(NTKSiderealData *)v21 _findSunriseTime];
    sunriseTime = v21->_sunriseTime;
    v21->_sunriseTime = (NSDate *)v27;

    v21->_sunsetFollowsSunrise = [(NTKSiderealData *)v21 _computeSunsetFollowsSunrise];
    v21->_isConstantSunUpOrDown = [(NTKSiderealData *)v21 _computeIsConstantSunUpOrDown];
    v21->_currentSolarDayProgress = -1.0;
  }

  return v21;
}

- (NTKSiderealData)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NTKSiderealData;
  v5 = [(NTKSiderealData *)&v40 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v8 = [v6 setWithArray:v7];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v11 = [v9 setWithArray:v10];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    v14 = [v12 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceDate"];
    referenceDate = v5->_referenceDate;
    v5->_referenceDate = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v8 forKey:@"daytimeEvents"];
    daytimeEvents = v5->_daytimeEvents;
    v5->_daytimeEvents = (NSOrderedSet *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sunriseSunsetInfo"];
    sunriseSunsetInfo = v5->_sunriseSunsetInfo;
    v5->_sunriseSunsetInfo = (CLKUIAlmanacTransitInfo *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v11 forKey:@"sectors"];
    sectors = v5->_sectors;
    v5->_sectors = (NSOrderedSet *)v21;

    uint64_t v23 = [v4 decodeObjectOfClasses:v14 forKey:@"waypoints"];
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceLocation"];
    referenceLocation = v5->_referenceLocation;
    v5->_referenceLocation = (CLLocation *)v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v8 forKey:@"solarEvents"];
    solarEvents = v5->_solarEvents;
    v5->_solarEvents = (NSOrderedSet *)v27;

    id v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altitudes"];
    id v30 = (const void *)[v29 bytes];
    unint64_t v31 = [v29 length];
    if (v31 >= 0x5A4) {
      size_t v32 = 1444;
    }
    else {
      size_t v32 = v31;
    }
    memcpy(v5->_altitudes, v30, v32);
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradientData"];
    gradientData = v5->_gradientData;
    v5->_gradientData = (NSData *)v33;

    v5->_useXR = [v4 decodeBoolForKey:@"useXR"];
    uint64_t v35 = [(NTKSiderealData *)v5 _findSunsetTime];
    sunsetTime = v5->_sunsetTime;
    v5->_sunsetTime = (NSDate *)v35;

    uint64_t v37 = [(NTKSiderealData *)v5 _findSunriseTime];
    sunriseTime = v5->_sunriseTime;
    v5->_sunriseTime = (NSDate *)v37;

    v5->_sunsetFollowsSunrise = [(NTKSiderealData *)v5 _computeSunsetFollowsSunrise];
    v5->_isConstantSunUpOrDown = [(NTKSiderealData *)v5 _computeIsConstantSunUpOrDown];
    v5->_currentSolarDayProgress = -1.0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  referenceDate = self->_referenceDate;
  id v6 = a3;
  [v6 encodeObject:referenceDate forKey:@"referenceDate"];
  [v6 encodeObject:self->_daytimeEvents forKey:@"daytimeEvents"];
  [v6 encodeObject:self->_sunriseSunsetInfo forKey:@"sunriseSunsetInfo"];
  [v6 encodeObject:self->_sectors forKey:@"sectors"];
  [v6 encodeObject:self->_waypoints forKey:@"waypoints"];
  [v6 encodeObject:self->_referenceLocation forKey:@"referenceLocation"];
  [v6 encodeObject:self->_solarEvents forKey:@"solarEvents"];
  v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_altitudes length:1444];
  [v6 encodeObject:v5 forKey:@"altitudes"];

  [v6 encodeObject:self->_gradientData forKey:@"gradientData"];
  [v6 encodeBool:self->_useXR forKey:@"useXR"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)save
{
  uint64_t v4 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v4];
  if (!v4)
  {
    v3 = _NTKSiderealDataCacheArchivePath();
    [v2 writeToFile:v3 atomically:0];
  }
}

+ (id)loadCached
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v3 = _NTKSiderealDataCacheArchivePath();
  uint64_t v4 = (void *)[v2 initWithContentsOfFile:v3 options:1 error:0];

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
    [v5 setDecodingFailurePolicy:0];
    id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)altitudeForProgress:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (v3 >= 1.0) {
    double v4 = 360.0;
  }
  else {
    double v4 = v3 * 360.0;
  }
  uint64_t v5 = (uint64_t)v4;
  if ((uint64_t)v4 > 359)
  {
    float v10 = self->_altitudes[v5];
    float v11 = 1.0;
    float v9 = v10;
  }
  else
  {
    float v6 = v4;
    double v7 = v4 - truncf(v6);
    v8 = (float *)((char *)self + 4 * v5);
    float v9 = v8[2];
    float v10 = v8[3];
    float v11 = v7;
  }
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (BOOL)isDateInReferenceDate:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  float v6 = [v4 currentCalendar];
  LOBYTE(self) = [v6 isDate:v5 inSameDayAsDate:self->_referenceDate];

  return (char)self;
}

- (id)interpolateBetweenCalendricalMidnights:(double)a3
{
  id v5 = NTKStartOfDayForDate(self->_referenceDate);
  float v6 = NTKEndOfDayForDate(self->_referenceDate);
  double v7 = NTKInterpolateBetweenDates(v5, v6, a3);

  return v7;
}

- (id)_findSunsetTime
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSOrderedSet *)self->_solarEvents reverseObjectEnumerator];
  double v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        float v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v6 type] == 6)
        {
          double v7 = [v6 time];

          if (v7)
          {
            double v3 = [v6 time];
            goto LABEL_12;
          }
        }
      }
      double v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)_findSunriseTime
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_solarEvents;
  double v3 = (void *)[(NSOrderedSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        float v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (void)v9) == 4)
        {
          double v7 = [v6 time];

          if (v7)
          {
            double v3 = [v6 time];
            goto LABEL_12;
          }
        }
      }
      double v3 = (void *)[(NSOrderedSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)_computeSunsetFollowsSunrise
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = self->_solarEvents;
  uint64_t v3 = [(NSOrderedSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = 0;
    id v5 = 0;
    uint64_t v6 = *(void *)v15;
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v14) == 4)
        {
          long long v9 = v4;
          uint64_t v4 = v8;
          long long v10 = v5;
        }
        else
        {
          long long v9 = v5;
          long long v10 = v8;
          if ([v8 type] != 6) {
            continue;
          }
        }
        id v11 = v8;

        id v5 = v10;
      }
      uint64_t v3 = [(NSOrderedSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v3)
      {

        if (v4 && v5)
        {
          id v2 = [v4 time];
          long long v12 = [v5 time];
          LOBYTE(v3) = [(NSOrderedSet *)v2 compare:v12] == -1;

          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
  }
  id v5 = 0;
  uint64_t v4 = 0;
LABEL_16:

LABEL_17:
  return v3;
}

- (BOOL)_computeIsConstantSunUpOrDown
{
  return [(CLKUIAlmanacTransitInfo *)self->_sunriseSunsetInfo constantSun] != 0;
}

- (id)_generateGradientDataForXR:(BOOL)a3
{
  uint64_t v3 = MEMORY[0x1F4188790](self, a2, a3);
  int v5 = v4;
  uint64_t v6 = (void *)v3;
  v79[2] = *MEMORY[0x1E4F143B8];
  double v7 = objc_opt_new();
  v8 = +[NTKSiderealColorManager sharedInstance];
  long long v9 = v8;
  if (v5)
  {
    long long v10 = [v8 dayGradientCurveP3];

    uint64_t v11 = *MEMORY[0x1E4F3A4A0];
    long long v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    v79[0] = v12;
    v13 = [MEMORY[0x1E4F39C10] functionWithName:v11];
    v79[1] = v13;
    long long v14 = v79;
  }
  else
  {
    long long v10 = [v8 dayGradientColorCurves];

    LODWORD(v15) = 1041865114;
    LODWORD(v16) = 0.25;
    LODWORD(v17) = 0.5;
    LODWORD(v18) = 1.0;
    long long v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v16 :v15 :v17 :v18];
    v78[0] = v12;
    LODWORD(v19) = 0.5;
    LODWORD(v20) = 1.0;
    LODWORD(v21) = 1.0;
    v13 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v19 :0.0 :v20 :v21];
    v78[1] = v13;
    long long v14 = v78;
  }
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  uint64_t v23 = 0;
  v24 = v77;
  do
  {
    [v6 altitudeForProgress:(float)((float)(int)v23 / 127.0)];
    int v26 = v25;
    int v28 = v27;
    int v30 = v29;
    unint64_t v31 = [v10 objectAtIndexedSubscript:0];
    LODWORD(v32) = v26;
    LODWORD(v33) = v28;
    LODWORD(v34) = v30;
    objc_msgSend(v31, "rgbfColorForAltitude:", v32, v33, v34);
    _OWORD *v24 = v35;

    v36 = [v10 objectAtIndexedSubscript:1];
    LODWORD(v37) = v26;
    LODWORD(v38) = v28;
    LODWORD(v39) = v30;
    objc_msgSend(v36, "rgbfColorForAltitude:", v37, v38, v39);
    v24[128] = v40;

    v41 = [v10 objectAtIndexedSubscript:2];
    LODWORD(v42) = v26;
    LODWORD(v43) = v28;
    LODWORD(v44) = v30;
    objc_msgSend(v41, "rgbfColorForAltitude:", v42, v43, v44);
    v24[256] = v45;

    ++v23;
    ++v24;
  }
  while (v23 != 128);
  int v46 = 0;
  __asm { FMOV            V0.4S, #1.0 }
  float32x4_t v71 = _Q0;
  float32x4_t v72 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
  do
  {
    uint64_t v52 = 0;
    float v53 = (float)((float)v46 / -63.0) + 1.0;
    BOOL v54 = v53 > 0.5 || v53 <= 0.05;
    BOOL v55 = v53 < 0.9 && v53 > 0.5;
    do
    {
      v56 = (float32x4_t *)&v77[v52];
      float32x4_t v57 = *(float32x4_t *)&v77[v52];
      if (v53 <= 0.05) {
        goto LABEL_19;
      }
      if (v54)
      {
        float32x4_t v57 = v56[256];
        if (!v55) {
          goto LABEL_19;
        }
        float32x4_t v70 = v56[128];
        float32x4_t v73 = v56[256];
        CLKMapFractionIntoRange();
        float v59 = v58;
        v60 = [v22 objectAtIndexedSubscript:1];
        *(float *)&double v61 = v59;
        [v60 _solveForInput:v61];
        float32x4_t v63 = v70;
        float32x4_t v64 = v73;
      }
      else
      {
        float32x4_t v74 = *(float32x4_t *)&v77[v52];
        float32x4_t v70 = v56[128];
        CLKMapFractionIntoRange();
        float v66 = v65;
        v60 = [v22 objectAtIndexedSubscript:0];
        *(float *)&double v67 = v66;
        [v60 _solveForInput:v67];
        float32x4_t v63 = v74;
        float32x4_t v64 = v70;
      }
      float32x4_t v75 = vmlaq_n_f32(v63, vsubq_f32(v64, v63), v62);

      float32x4_t v57 = v75;
LABEL_19:
      v57.i32[3] = 1.0;
      int16x4_t v76 = vmovn_s32((int32x4_t)vcvtq_u32_f32(vmulq_f32(vminnmq_f32(vmaxnmq_f32(v57, (float32x4_t)0), v71), v72)));
      objc_msgSend(v7, "appendBytes:length:", &v76, 8, *(_OWORD *)&v70);
      v52 += 16;
    }
    while (v52 != 2048);
    ++v46;
  }
  while (v46 != 64);
  v68 = (void *)[v7 copy];

  return v68;
}

- (BOOL)useXR
{
  return self->_useXR;
}

- (void)updateSunsetFilter
{
  id v22 = [(NTKSiderealData *)self sunriseSunsetInfo];
  uint64_t v3 = [(NTKSiderealData *)self sunriseTime];
  int v4 = [(NTKSiderealData *)self sunsetTime];
  int v5 = [(NTKSiderealData *)self referenceDate];
  uint64_t v6 = NTKEndOfDayForDate(v5);

  [v4 timeIntervalSinceDate:v3];
  double v8 = v7;
  [v6 timeIntervalSinceDate:v4];
  double v10 = v9;
  if (![(NTKSiderealData *)self sunsetFollowsSunrise])
  {
    self->_sunsetFilterEnabled = 0;
    goto LABEL_14;
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v12 = [(NTKSiderealData *)self referenceDate];
  v13 = [v11 components:160 fromDate:v12];

  [v13 setSecond:0];
  [v13 setHour:22];
  long long v14 = [(NTKSiderealData *)self referenceDate];
  double v15 = [v11 nextDateAfterDate:v14 matchingComponents:v13 options:2];

  if (v8 < 14400.0) {
    goto LABEL_3;
  }
  if (v8 < 28800.0)
  {
    self->_sunsetFilterEnabled = 1;
    uint64_t v16 = [v22 solarNoon];
LABEL_9:
    double v17 = (void *)v16;
    if (v10 >= 7200.0) {
      double v18 = v4;
    }
    else {
      double v18 = v15;
    }
    id v19 = v18;
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v17];
    *(float *)&double v20 = v20;
    self->_sunsetFilterRampUpStartProgress = *(float *)&v20;
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v19];
    *(float *)&double v21 = v21;
    self->_sunsetFilterRampDownStartProgress = *(float *)&v21;

    goto LABEL_13;
  }
  if (v8 < 72000.0)
  {
    self->_sunsetFilterEnabled = 1;
    uint64_t v16 = [v4 dateByAddingTimeInterval:-14400.0];
    goto LABEL_9;
  }
LABEL_3:
  self->_sunsetFilterEnabled = 0;
LABEL_13:

LABEL_14:
}

- (void)setSolarDayProgress:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_currentSolarDayProgress = a3;
    float v5 = 0.0;
    if (self->_sunsetFilterEnabled && self->_useXR)
    {
      float v6 = a3;
      float sunsetFilterRampUpStartProgress = self->_sunsetFilterRampUpStartProgress;
      float v8 = (float)((float)(self->_sunsetFilterRampDownStartProgress - sunsetFilterRampUpStartProgress) + -0.083333)
         * 0.5;
      float v9 = (float)((float)(v8 + 0.083333) / 0.083333)
         - fabsf((float)((float)((float)(v6 + -0.083333) - sunsetFilterRampUpStartProgress) - v8) / 0.083333);
      if (v9 < 0.0) {
        float v9 = 0.0;
      }
      float v5 = fminf(v9, 1.0);
    }
    self->_sunsetFilter = v5;
  }
}

- (id)applySunsetFilterToColor:(id)a3
{
  double v3 = self->_sunsetFilter * -0.08 * 0.745;
  double v8 = 0.0;
  double v9 = 0.0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [a3 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  double v8 = v8 + v3;
  int v4 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", v9);
  return v4;
}

- (id)gradientWithSunsetFilterForDayProgress:(float)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(NTKSiderealData *)self updateSunsetFilter];
  double v5 = a3;
  [(NTKSiderealData *)self setSolarDayProgress:v5];
  BOOL useXR = self->_useXR;
  uint64_t v7 = +[NTKSiderealColorManager sharedInstance];
  double v8 = v7;
  if (useXR) {
    [v7 dayGradientCurveP3];
  }
  else {
  double v9 = [v7 dayGradientColorCurves];
  }

  [(NTKSiderealData *)self altitudeForProgress:v5];
  int v11 = v10;
  int v13 = v12;
  int v15 = v14;
  uint64_t v16 = [v9 objectAtIndexedSubscript:0];
  LODWORD(v17) = v11;
  LODWORD(v18) = v13;
  LODWORD(v19) = v15;
  objc_msgSend(v16, "rgbfColorForAltitude:", v17, v18, v19);
  CLKUIConvertToXRSRGBfFromRGBf();
}

- (CLKUIAlmanacTransitInfo)sunriseSunsetInfo
{
  return self->_sunriseSunsetInfo;
}

- (NSOrderedSet)sectors
{
  return self->_sectors;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (BOOL)sunsetFollowsSunrise
{
  return self->_sunsetFollowsSunrise;
}

- (BOOL)isConstantSunUpOrDown
{
  return self->_isConstantSunUpOrDown;
}

- (NSDate)sunsetTime
{
  return self->_sunsetTime;
}

- (NSDate)sunriseTime
{
  return self->_sunriseTime;
}

- (NSOrderedSet)daytimeEvents
{
  return self->_daytimeEvents;
}

- (NSData)gradientData
{
  return self->_gradientData;
}

- (NSOrderedSet)solarEvents
{
  return self->_solarEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarEvents, 0);
  objc_storeStrong((id *)&self->_gradientData, 0);
  objc_storeStrong((id *)&self->_daytimeEvents, 0);
  objc_storeStrong((id *)&self->_sunriseTime, 0);
  objc_storeStrong((id *)&self->_sunsetTime, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_sectors, 0);
  objc_storeStrong((id *)&self->_sunriseSunsetInfo, 0);
}

@end