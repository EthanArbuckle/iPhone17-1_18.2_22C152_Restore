@interface PKDashboardPresentationTimingCurveProvider
- (PKDashboardPresentationTimingCurveProvider)initWithCoder:(id)a3;
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)springTimingParameters;
- (double)fractionComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)timingCurveType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setFractionComplete:(double)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKDashboardPresentationTimingCurveProvider

- (int64_t)timingCurveType
{
  uint64_t v2 = *(void *)(self + 16);
  if (!v2) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  __break(1u);
  return self;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  Class isa = self[2].super.isa;
  if (isa == (Class)1)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:2];
  }
  else
  {
    if (isa)
    {
      __break(1u);
      return self;
    }
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.4, 0.0, 0.6, 1.0);
  }

  return (UICubicTimingParameters *)v3;
}

- (UISpringTimingParameters)springTimingParameters
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKDashboardPresentationTimingCurveProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardPresentationTimingCurveProvider;
  v5 = [(PKDashboardPresentationTimingCurveProvider *)&v7 init];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKDashboardPresentationTimingCurveProvider allocWithZone:a3] init];
  *((void *)result + 2) = self->_type;
  return result;
}

- (double)fractionComplete
{
  return self->_fractionComplete;
}

- (void)setFractionComplete:(double)a3
{
  self->_fractionComplete = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end