@interface PXTimeAnimateValue
- (BOOL)hasPercentTime;
- (PXTimeAnimateValue)init;
- (double)percentTime;
- (id)formula;
- (id)variant;
- (void)setFormula:(id)a3;
- (void)setPercentTime:(double)a3;
- (void)setVariant:(id)a3;
@end

@implementation PXTimeAnimateValue

- (PXTimeAnimateValue)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXTimeAnimateValue;
  return [(PXTimeAnimateValue *)&v3 init];
}

- (id)variant
{
  return self->mVariant;
}

- (void)setVariant:(id)a3
{
}

- (BOOL)hasPercentTime
{
  return self->mHasPercentTime;
}

- (double)percentTime
{
  return self->mPercentTime;
}

- (void)setPercentTime:(double)a3
{
  self->mHasPercentTime = 1;
  self->mPercentTime = a3;
}

- (id)formula
{
  return self->mFormula;
}

- (void)setFormula:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFormula, 0);
  objc_storeStrong(&self->mVariant, 0);
}

@end