@interface CMNormalGammaBin
+ (BOOL)supportsSecureCoding;
- (BOOL)isConverged;
- (BOOL)isMeanGreaterThan:(const double *)a3 isMeanLessThan:(const double *)a4 isVarianceLessThan:(const double *)a5;
- (CMNormalGammaBin)initWithCoder:(id)a3;
- (CMNormalGammaBin)initWithNormalGamma:(const CMNormalGamma *)a3 speedLB:(double)a4 speedUB:(double)a5;
- (CMNormalGammaBin)initWithSpeedLB:(double)a3 speedUB:(double)a4 mean:(double)a5 variance:(double)a6 maxMean:(double)a7 minMean:(double)a8 meanN:(unsigned int)a9 varianceN:(unsigned int)a10 updateN:(unsigned int)a11;
- (double)maxMean;
- (double)mean;
- (double)minMean;
- (double)speedLB;
- (double)speedUB;
- (double)variance;
- (unsigned)meanN;
- (unsigned)updateN;
- (unsigned)varianceN;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxMean:(double)a3;
- (void)setMean:(double)a3;
- (void)setMeanN:(unsigned int)a3;
- (void)setMinMean:(double)a3;
- (void)setSpeedLB:(double)a3;
- (void)setSpeedUB:(double)a3;
- (void)setUpdateN:(unsigned int)a3;
- (void)setVariance:(double)a3;
- (void)setVarianceN:(unsigned int)a3;
@end

@implementation CMNormalGammaBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMNormalGammaBin)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CMNormalGammaBin;
  v4 = [(CMNormalGammaBin *)&v12 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"speedLB"];
    v4->_speedLB = v5;
    [a3 decodeDoubleForKey:@"speedUB"];
    v4->_speedUB = v6;
    [a3 decodeDoubleForKey:@"maxMean"];
    v4->_maxMean = v7;
    [a3 decodeDoubleForKey:@"minMean"];
    v4->_minMean = v8;
    [a3 decodeDoubleForKey:@"mean"];
    v4->_mean = v9;
    [a3 decodeDoubleForKey:@"variance"];
    v4->_variance = v10;
    v4->_meanN = [a3 decodeInt32ForKey:@"meanN"];
    v4->_varianceN = [a3 decodeInt32ForKey:@"varianceN"];
    v4->_updateN = [a3 decodeInt32ForKey:@"updateN"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"speedLB" forKey:self->_speedLB];
  [a3 encodeDouble:@"speedUB" forKey:self->_speedUB];
  [a3 encodeDouble:@"maxMean" forKey:self->_maxMean];
  [a3 encodeDouble:@"minMean" forKey:self->_minMean];
  [a3 encodeDouble:@"mean" forKey:self->_mean];
  [a3 encodeDouble:@"variance" forKey:self->_variance];
  [a3 encodeInt32:self->_meanN forKey:@"meanN"];
  [a3 encodeInt32:self->_varianceN forKey:@"varianceN"];
  uint64_t updateN = self->_updateN;

  [a3 encodeInt32:updateN forKey:@"updateN"];
}

- (CMNormalGammaBin)initWithSpeedLB:(double)a3 speedUB:(double)a4 mean:(double)a5 variance:(double)a6 maxMean:(double)a7 minMean:(double)a8 meanN:(unsigned int)a9 varianceN:(unsigned int)a10 updateN:(unsigned int)a11
{
  v21.receiver = self;
  v21.super_class = (Class)CMNormalGammaBin;
  result = [(CMNormalGammaBin *)&v21 init];
  if (result)
  {
    result->_speedLB = a3;
    result->_speedUB = a4;
    result->_mean = a5;
    result->_variance = a6;
    result->_meanN = a9;
    result->_varianceN = a10;
    result->_uint64_t updateN = a11;
    result->_maxMean = a7;
    result->_minMean = a8;
  }
  return result;
}

- (CMNormalGammaBin)initWithNormalGamma:(const CMNormalGamma *)a3 speedLB:(double)a4 speedUB:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CMNormalGammaBin;
  result = [(CMNormalGammaBin *)&v9 init];
  if (result)
  {
    result->_speedLB = a4;
    result->_speedUB = a5;
    result->_mean = a3->var0;
    result->_variance = a3->var1;
    result->_meanN = a3->var2;
    result->_varianceN = a3->var3;
    result->_uint64_t updateN = a3->var4;
    *(_OWORD *)&result->_maxMean = xmmword_101DB5900;
  }
  return result;
}

- (BOOL)isConverged
{
  return self->_meanN >= 0x32 && self->_varianceN > 0x31;
}

- (BOOL)isMeanGreaterThan:(const double *)a3 isMeanLessThan:(const double *)a4 isVarianceLessThan:(const double *)a5
{
  double mean = self->_mean;
  double v6 = *a4;
  if (mean >= *a3)
  {
    BOOL v8 = mean == v6;
    BOOL v7 = mean >= v6;
  }
  else
  {
    BOOL v7 = 1;
    BOOL v8 = 0;
  }
  return (v8 || !v7) && self->_variance <= *a5;
}

- (double)speedLB
{
  return self->_speedLB;
}

- (void)setSpeedLB:(double)a3
{
  self->_speedLB = a3;
}

- (double)speedUB
{
  return self->_speedUB;
}

- (void)setSpeedUB:(double)a3
{
  self->_speedUB = a3;
}

- (double)mean
{
  return self->_mean;
}

- (void)setMean:(double)a3
{
  self->_double mean = a3;
}

- (double)variance
{
  return self->_variance;
}

- (void)setVariance:(double)a3
{
  self->_variance = a3;
}

- (double)maxMean
{
  return self->_maxMean;
}

- (void)setMaxMean:(double)a3
{
  self->_maxMean = a3;
}

- (double)minMean
{
  return self->_minMean;
}

- (void)setMinMean:(double)a3
{
  self->_minMean = a3;
}

- (unsigned)meanN
{
  return self->_meanN;
}

- (void)setMeanN:(unsigned int)a3
{
  self->_meanN = a3;
}

- (unsigned)varianceN
{
  return self->_varianceN;
}

- (void)setVarianceN:(unsigned int)a3
{
  self->_varianceN = a3;
}

- (unsigned)updateN
{
  return self->_updateN;
}

- (void)setUpdateN:(unsigned int)a3
{
  self->_uint64_t updateN = a3;
}

@end