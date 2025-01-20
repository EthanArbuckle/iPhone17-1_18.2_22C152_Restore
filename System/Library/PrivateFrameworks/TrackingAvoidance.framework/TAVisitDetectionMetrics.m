@interface TAVisitDetectionMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TAVisitDetectionMetrics)initWithCoder:(id)a3;
- (TAVisitDetectionMetrics)initWithDistance:(double)a3 residualDistance:(double)a4 nSigma:(unint64_t)a5;
- (double)distanceToPreviousVisit;
- (double)residualDistanceToPreviousVisit;
- (unint64_t)nSigmaBetweenVisits;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TAVisitDetectionMetrics

- (TAVisitDetectionMetrics)initWithDistance:(double)a3 residualDistance:(double)a4 nSigma:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TAVisitDetectionMetrics;
  result = [(TAVisitDetectionMetrics *)&v9 init];
  result->_distanceToPreviousVisit = a3;
  result->_residualDistanceToPreviousVisit = a4;
  result->_nSigmaBetweenVisits = a5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TAVisitDetectionMetrics *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(TAVisitDetectionMetrics *)self distanceToPreviousVisit];
      double v7 = v6;
      [(TAVisitDetectionMetrics *)v5 distanceToPreviousVisit];
      if (v7 == v8
        && ([(TAVisitDetectionMetrics *)self residualDistanceToPreviousVisit],
            double v10 = v9,
            [(TAVisitDetectionMetrics *)v5 residualDistanceToPreviousVisit],
            v10 == v11))
      {
        unint64_t v12 = [(TAVisitDetectionMetrics *)self nSigmaBetweenVisits];
        BOOL v13 = v12 == [(TAVisitDetectionMetrics *)v5 nSigmaBetweenVisits];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitDetectionMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"VDistancePrevVisit"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"VResidualDistance"];
  double v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"VNSigma"];

  return [(TAVisitDetectionMetrics *)self initWithDistance:v9 residualDistance:v6 nSigma:v8];
}

- (void)encodeWithCoder:(id)a3
{
  double distanceToPreviousVisit = self->_distanceToPreviousVisit;
  id v5 = a3;
  [v5 encodeDouble:@"VDistancePrevVisit" forKey:distanceToPreviousVisit];
  [v5 encodeDouble:@"VResidualDistance" forKey:self->_residualDistanceToPreviousVisit];
  [v5 encodeInteger:self->_nSigmaBetweenVisits forKey:@"VNSigma"];
}

- (double)distanceToPreviousVisit
{
  return self->_distanceToPreviousVisit;
}

- (double)residualDistanceToPreviousVisit
{
  return self->_residualDistanceToPreviousVisit;
}

- (unint64_t)nSigmaBetweenVisits
{
  return self->_nSigmaBetweenVisits;
}

@end