@interface PBUIImageTreatmentOptions
+ (PBUIImageTreatmentOptions)identity;
- (double)initWithFixedScale:(double *)result;
- (double)initWithOriginalScale:(double)a3 reducedScale:;
- (double)originalScale;
- (double)reducedScale;
- (double)scaleReductionFactor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PBUIImageTreatmentOptions

- (double)initWithOriginalScale:(double)a3 reducedScale:
{
  if (result)
  {
    result = (double *)[result init];
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

- (double)initWithFixedScale:(double *)result
{
  if (result)
  {
    result = (double *)[result init];
    if (result)
    {
      result[1] = a2;
      result[2] = a2;
    }
  }
  return result;
}

+ (PBUIImageTreatmentOptions)identity
{
  self;
  v0 = [PBUIImageTreatmentOptions alloc];
  if (v0)
  {
    v0 = [(PBUIImageTreatmentOptions *)v0 init];
    if (v0)
    {
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&v0->_originalScale = _Q0;
    }
  }
  return v0;
}

- (double)scaleReductionFactor
{
  return self->_originalScale / self->_reducedScale;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = +[PBUIImageTreatmentOptions allocWithZone:a3];
  if (result)
  {
    long long v5 = *(_OWORD *)&self->_originalScale;
    id result = (id)[result init];
    if (result) {
      *(_OWORD *)((char *)result + 8) = v5;
    }
  }
  return result;
}

- (double)originalScale
{
  return self->_originalScale;
}

- (double)reducedScale
{
  return self->_reducedScale;
}

@end