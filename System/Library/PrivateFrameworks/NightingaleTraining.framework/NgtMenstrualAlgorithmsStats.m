@interface NgtMenstrualAlgorithmsStats
+ (BOOL)supportsSecureCoding;
- (NSNumber)julianDayOfFirstCycleStart;
- (NSNumber)julianDayOfLastCycleStart;
- (NSNumber)lowerCycleLengthPercentile;
- (NSNumber)lowerMenstruationLengthPercentile;
- (NSNumber)medianCycleLength;
- (NSNumber)medianMenstruationLength;
- (NSNumber)numberOfCyclesFound;
- (NSNumber)upperCycleLengthPercentile;
- (NSNumber)upperMenstruationLengthPercentile;
- (NgtMenstrualAlgorithmsStats)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setJulianDayOfFirstCycleStart:(id)a3;
- (void)setJulianDayOfLastCycleStart:(id)a3;
- (void)setLowerCycleLengthPercentile:(id)a3;
- (void)setLowerMenstruationLengthPercentile:(id)a3;
- (void)setMedianCycleLength:(id)a3;
- (void)setMedianMenstruationLength:(id)a3;
- (void)setNumberOfCyclesFound:(id)a3;
- (void)setUpperCycleLengthPercentile:(id)a3;
- (void)setUpperMenstruationLengthPercentile:(id)a3;
@end

@implementation NgtMenstrualAlgorithmsStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  medianCycleLength = self->_medianCycleLength;
  v5 = NSStringFromSelector(sel_medianCycleLength);
  [v22 encodeObject:medianCycleLength forKey:v5];

  medianMenstruationLength = self->_medianMenstruationLength;
  v7 = NSStringFromSelector(sel_medianMenstruationLength);
  [v22 encodeObject:medianMenstruationLength forKey:v7];

  lowerCycleLengthPercentile = self->_lowerCycleLengthPercentile;
  v9 = NSStringFromSelector(sel_lowerCycleLengthPercentile);
  [v22 encodeObject:lowerCycleLengthPercentile forKey:v9];

  lowerMenstruationLengthPercentile = self->_lowerMenstruationLengthPercentile;
  v11 = NSStringFromSelector(sel_lowerMenstruationLengthPercentile);
  [v22 encodeObject:lowerMenstruationLengthPercentile forKey:v11];

  upperCycleLengthPercentile = self->_upperCycleLengthPercentile;
  v13 = NSStringFromSelector(sel_upperCycleLengthPercentile);
  [v22 encodeObject:upperCycleLengthPercentile forKey:v13];

  upperMenstruationLengthPercentile = self->_upperMenstruationLengthPercentile;
  v15 = NSStringFromSelector(sel_upperMenstruationLengthPercentile);
  [v22 encodeObject:upperMenstruationLengthPercentile forKey:v15];

  numberOfCyclesFound = self->_numberOfCyclesFound;
  v17 = NSStringFromSelector(sel_numberOfCyclesFound);
  [v22 encodeObject:numberOfCyclesFound forKey:v17];

  julianDayOfFirstCycleStart = self->_julianDayOfFirstCycleStart;
  v19 = NSStringFromSelector(sel_julianDayOfFirstCycleStart);
  [v22 encodeObject:julianDayOfFirstCycleStart forKey:v19];

  julianDayOfLastCycleStart = self->_julianDayOfLastCycleStart;
  v21 = NSStringFromSelector(sel_julianDayOfLastCycleStart);
  [v22 encodeObject:julianDayOfLastCycleStart forKey:v21];
}

- (NgtMenstrualAlgorithmsStats)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NgtMenstrualAlgorithmsStats *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_medianCycleLength);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    medianCycleLength = v5->_medianCycleLength;
    v5->_medianCycleLength = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_medianMenstruationLength);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    medianMenstruationLength = v5->_medianMenstruationLength;
    v5->_medianMenstruationLength = (NSNumber *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_lowerCycleLengthPercentile);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    lowerCycleLengthPercentile = v5->_lowerCycleLengthPercentile;
    v5->_lowerCycleLengthPercentile = (NSNumber *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_lowerMenstruationLengthPercentile);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    lowerMenstruationLengthPercentile = v5->_lowerMenstruationLengthPercentile;
    v5->_lowerMenstruationLengthPercentile = (NSNumber *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_upperCycleLengthPercentile);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    upperCycleLengthPercentile = v5->_upperCycleLengthPercentile;
    v5->_upperCycleLengthPercentile = (NSNumber *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_upperMenstruationLengthPercentile);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    upperMenstruationLengthPercentile = v5->_upperMenstruationLengthPercentile;
    v5->_upperMenstruationLengthPercentile = (NSNumber *)v28;

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector(sel_numberOfCyclesFound);
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    numberOfCyclesFound = v5->_numberOfCyclesFound;
    v5->_numberOfCyclesFound = (NSNumber *)v32;

    uint64_t v34 = objc_opt_class();
    v35 = NSStringFromSelector(sel_julianDayOfFirstCycleStart);
    uint64_t v36 = [v4 decodeObjectOfClass:v34 forKey:v35];
    julianDayOfFirstCycleStart = v5->_julianDayOfFirstCycleStart;
    v5->_julianDayOfFirstCycleStart = (NSNumber *)v36;

    uint64_t v38 = objc_opt_class();
    v39 = NSStringFromSelector(sel_julianDayOfLastCycleStart);
    uint64_t v40 = [v4 decodeObjectOfClass:v38 forKey:v39];
    julianDayOfLastCycleStart = v5->_julianDayOfLastCycleStart;
    v5->_julianDayOfLastCycleStart = (NSNumber *)v40;

    v42 = v5;
  }

  return v5;
}

- (NSNumber)medianCycleLength
{
  return self->_medianCycleLength;
}

- (void)setMedianCycleLength:(id)a3
{
}

- (NSNumber)medianMenstruationLength
{
  return self->_medianMenstruationLength;
}

- (void)setMedianMenstruationLength:(id)a3
{
}

- (NSNumber)lowerCycleLengthPercentile
{
  return self->_lowerCycleLengthPercentile;
}

- (void)setLowerCycleLengthPercentile:(id)a3
{
}

- (NSNumber)lowerMenstruationLengthPercentile
{
  return self->_lowerMenstruationLengthPercentile;
}

- (void)setLowerMenstruationLengthPercentile:(id)a3
{
}

- (NSNumber)upperCycleLengthPercentile
{
  return self->_upperCycleLengthPercentile;
}

- (void)setUpperCycleLengthPercentile:(id)a3
{
}

- (NSNumber)upperMenstruationLengthPercentile
{
  return self->_upperMenstruationLengthPercentile;
}

- (void)setUpperMenstruationLengthPercentile:(id)a3
{
}

- (NSNumber)numberOfCyclesFound
{
  return self->_numberOfCyclesFound;
}

- (void)setNumberOfCyclesFound:(id)a3
{
}

- (NSNumber)julianDayOfFirstCycleStart
{
  return self->_julianDayOfFirstCycleStart;
}

- (void)setJulianDayOfFirstCycleStart:(id)a3
{
}

- (NSNumber)julianDayOfLastCycleStart
{
  return self->_julianDayOfLastCycleStart;
}

- (void)setJulianDayOfLastCycleStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_julianDayOfLastCycleStart, 0);
  objc_storeStrong((id *)&self->_julianDayOfFirstCycleStart, 0);
  objc_storeStrong((id *)&self->_numberOfCyclesFound, 0);
  objc_storeStrong((id *)&self->_upperMenstruationLengthPercentile, 0);
  objc_storeStrong((id *)&self->_upperCycleLengthPercentile, 0);
  objc_storeStrong((id *)&self->_lowerMenstruationLengthPercentile, 0);
  objc_storeStrong((id *)&self->_lowerCycleLengthPercentile, 0);
  objc_storeStrong((id *)&self->_medianMenstruationLength, 0);
  objc_storeStrong((id *)&self->_medianCycleLength, 0);
}

@end