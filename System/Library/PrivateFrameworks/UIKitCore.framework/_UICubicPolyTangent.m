@interface _UICubicPolyTangent
+ (id)keyboardTrackpadCurve;
- (BOOL)isEmpty;
- (_UICubicPolyTangent)init;
- (double)clipForIOFixedMath:(double)a3 polynomialPower:(int)a4 tangencyStartingAt:(double)a5;
- (double)cubicGain;
- (double)gainForPower:(int)a3;
- (double)initialLinearGain;
- (double)parabolicGain;
- (double)piecewiseCubicAcceleratedSpeed:(double)a3;
- (double)quarticDerivative:(double)a3;
- (double)quarticFunction:(double)a3;
- (double)quarticGain;
- (double)quarticTangentFunction:(double)a3 powerOfEarliestTangent:(int)a4;
- (double)tangentCbrtSpeed;
- (double)tangentHyperCbrtSpeed;
- (double)tangentLineSpeed;
- (double)tangentSpeedForPower:(int)a3;
- (double)tangentSqrtSpeed;
- (int)RootPowerOfEarliestTangent:(int)a3;
- (void)clipGainsForIOFixedMathWithTangency;
- (void)setCubicGain:(double)a3;
- (void)setInitialLinearGain:(double)a3;
- (void)setParabolicGain:(double)a3;
- (void)setQuarticGain:(double)a3;
- (void)setTangentCbrtSpeed:(double)a3;
- (void)setTangentHyperCbrtSpeed:(double)a3;
- (void)setTangentLineSpeed:(double)a3;
- (void)setTangentSqrtSpeed:(double)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation _UICubicPolyTangent

- (_UICubicPolyTangent)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UICubicPolyTangent;
  result = [(_UICubicPolyTangent *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_cubicGain = 0u;
    *(_OWORD *)&result->_initialLinearGain = 0u;
    *(_OWORD *)&result->_tangentLineSpeed = xmmword_186B9DB10;
    result->_tangentCbrtSpeed = 0.0;
    result->_tangentHyperCbrtSpeed = 0.0;
  }
  return result;
}

- (BOOL)isEmpty
{
  return self->_initialLinearGain == 0.0
      && self->_parabolicGain == 0.0
      && self->_cubicGain == 0.0
      && self->_quarticGain == 0.0;
}

- (double)clipForIOFixedMath:(double)a3 polynomialPower:(int)a4 tangencyStartingAt:(double)a5
{
  double result = pow(a5 * 0.0078125 * 16383.0, 1.0 / (double)a4) / a5;
  if (result >= a3) {
    double result = a3;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (void)clipGainsForIOFixedMathWithTangency
{
  [(_UICubicPolyTangent *)self tangentSpeedForPower:[(_UICubicPolyTangent *)self RootPowerOfEarliestTangent:1]];
  if (v3 <= 128.0 && v3 > 0.0) {
    double v5 = v3;
  }
  else {
    double v5 = 128.0;
  }
  [(_UICubicPolyTangent *)self clipForIOFixedMath:1 polynomialPower:self->_initialLinearGain tangencyStartingAt:v5];
  self->_initialLinearGain = v6;
  [(_UICubicPolyTangent *)self clipForIOFixedMath:2 polynomialPower:self->_parabolicGain tangencyStartingAt:v5];
  self->_parabolicGain = v7;
  [(_UICubicPolyTangent *)self clipForIOFixedMath:3 polynomialPower:self->_cubicGain tangencyStartingAt:v5];
  self->_cubicGain = v8;
  [(_UICubicPolyTangent *)self clipForIOFixedMath:4 polynomialPower:self->_quarticGain tangencyStartingAt:v5];
  self->_quarticGain = v9;
}

- (void)setInitialLinearGain:(double)a3
{
  self->_initialLinearGain = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (void)setParabolicGain:(double)a3
{
  self->_parabolicGain = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (void)setCubicGain:(double)a3
{
  self->_cubicGain = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (void)setQuarticGain:(double)a3
{
  self->_quarticGain = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (void)setTangentLineSpeed:(double)a3
{
  self->_tangentLineSpeed = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (void)setTangentSqrtSpeed:(double)a3
{
  self->_tangentSqrtSpeed = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (void)setTangentCbrtSpeed:(double)a3
{
  self->_tangentCbrtSpeed = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (void)setTangentHyperCbrtSpeed:(double)a3
{
  self->_tangentHyperCbrtSpeed = a3;
  [(_UICubicPolyTangent *)self clipGainsForIOFixedMathWithTangency];
}

- (double)tangentSpeedForPower:(int)a3
{
  if (a3 < 1) {
    return 0.0;
  }
  uint64_t v3 = 8 * (a3 - 1) + 40;
  if (a3 >= 4) {
    uint64_t v3 = 64;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (double)gainForPower:(int)a3
{
  if (a3 < 1) {
    return 0.0;
  }
  uint64_t v3 = 8 * (a3 - 1) + 8;
  if (a3 >= 4) {
    uint64_t v3 = 32;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (int)RootPowerOfEarliestTangent:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  uint64_t v3 = *(void *)&a3;
  int v5 = 0;
  double v6 = 0.0;
  do
  {
    [(_UICubicPolyTangent *)self tangentSpeedForPower:v3];
    if (v7 != 0.0 && (v7 < v6 || v6 <= 0.0))
    {
      double v6 = v7;
      int v5 = v3;
    }
    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 5);
  return v5;
}

- (double)quarticDerivative:(double)a3
{
  double quarticGain = self->_quarticGain;
  return self->_initialLinearGain
       + (self->_parabolicGain + self->_parabolicGain) * (self->_parabolicGain * a3)
       + self->_cubicGain * a3 * (self->_cubicGain * 3.0 * (self->_cubicGain * a3))
       + quarticGain * a3 * (quarticGain * a3 * (quarticGain * 4.0 * (quarticGain * a3)));
}

- (double)quarticFunction:(double)a3
{
  return self->_initialLinearGain * a3
       + self->_parabolicGain * a3 * (self->_parabolicGain * a3)
       + self->_cubicGain * a3 * (self->_cubicGain * a3 * (self->_cubicGain * a3))
       + self->_quarticGain * a3 * (self->_quarticGain * a3 * (self->_quarticGain * a3 * (self->_quarticGain * a3)));
}

- (double)quarticTangentFunction:(double)a3 powerOfEarliestTangent:(int)a4
{
  uint64_t v7 = [(_UICubicPolyTangent *)self RootPowerOfEarliestTangent:2];
  [(_UICubicPolyTangent *)self tangentSpeedForPower:v7];
  double v9 = v8;
  if (a4 == 1)
  {
    [(_UICubicPolyTangent *)self quarticDerivative:self->_tangentLineSpeed];
    double v11 = v10;
    [(_UICubicPolyTangent *)self quarticFunction:self->_tangentLineSpeed];
    double v13 = v12 - v11 * self->_tangentLineSpeed;
    if (v9 >= a3 || v9 == 0.0) {
      return v11 * a3 + v13;
    }
    double v14 = v9 * v11 + v13;
  }
  else
  {
    [(_UICubicPolyTangent *)self quarticFunction:v8];
    double v14 = v15;
    [(_UICubicPolyTangent *)self quarticDerivative:v9];
    double v11 = v16;
  }
  if (v7 == 3)
  {
    double v18 = v14 * (v14 * (v11 * 3.0)) * a3 + v14 * (v14 * v14) - v14 * (v14 * (v11 * 3.0)) * self->_tangentCbrtSpeed;
    long double v19 = 0.33333;
  }
  else
  {
    if (v7 == 2) {
      return sqrt(v14 * (v11 + v11) * a3 + v14 * v14 - v14 * (v11 + v11) * self->_tangentSqrtSpeed);
    }
    double v18 = v14 * (v14 * (v14 * (v11 * 4.0))) * a3
        + v14 * (v14 * (v14 * v14))
        - v14 * (v14 * (v14 * (v11 * 4.0))) * self->_tangentHyperCbrtSpeed;
    long double v19 = 0.25;
  }
  return pow(v18, v19);
}

- (double)piecewiseCubicAcceleratedSpeed:(double)a3
{
  uint64_t v5 = [(_UICubicPolyTangent *)self RootPowerOfEarliestTangent:1];
  [(_UICubicPolyTangent *)self tangentSpeedForPower:v5];
  if (v6 >= a3 || v6 == 0.0)
  {
    [(_UICubicPolyTangent *)self quarticFunction:a3];
  }
  else
  {
    [(_UICubicPolyTangent *)self quarticTangentFunction:v5 powerOfEarliestTangent:a3];
  }
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"linear"])
  {
    [v7 linear];
    -[_UICubicPolyTangent setTangentLineSpeed:](self, "setTangentLineSpeed:");
  }
  else if ([v6 isEqualToString:@"parabolic"])
  {
    [v7 parabolic];
    -[_UICubicPolyTangent setTangentSqrtSpeed:](self, "setTangentSqrtSpeed:");
  }
  else if ([v6 isEqualToString:@"gain"])
  {
    [v7 gain];
    -[_UICubicPolyTangent setParabolicGain:](self, "setParabolicGain:");
  }
}

+ (id)keyboardTrackpadCurve
{
  if (qword_1EB264BB0 != -1) {
    dispatch_once(&qword_1EB264BB0, &__block_literal_global_609);
  }
  v2 = (void *)_MergedGlobals_1294;
  return v2;
}

- (double)initialLinearGain
{
  return self->_initialLinearGain;
}

- (double)parabolicGain
{
  return self->_parabolicGain;
}

- (double)cubicGain
{
  return self->_cubicGain;
}

- (double)quarticGain
{
  return self->_quarticGain;
}

- (double)tangentLineSpeed
{
  return self->_tangentLineSpeed;
}

- (double)tangentSqrtSpeed
{
  return self->_tangentSqrtSpeed;
}

- (double)tangentCbrtSpeed
{
  return self->_tangentCbrtSpeed;
}

- (double)tangentHyperCbrtSpeed
{
  return self->_tangentHyperCbrtSpeed;
}

@end