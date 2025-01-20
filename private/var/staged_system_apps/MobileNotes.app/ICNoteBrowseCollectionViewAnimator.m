@interface ICNoteBrowseCollectionViewAnimator
+ (id)animator;
+ (id)springAnimation;
- (ICNoteBrowseCollectionViewAnimator)initWithCoder:(id)a3;
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)springTimingParameters;
- (id)commonInit;
- (int64_t)timingCurveType;
@end

@implementation ICNoteBrowseCollectionViewAnimator

+ (id)animator
{
  id v2 = objc_alloc((Class)a1);
  v3 = [v2 commonInit];

  return v3;
}

- (id)commonInit
{
  id v2 = self;
  v3 = [(id)objc_opt_class() springAnimation];
  [v3 settlingDuration];
  v4 = -[ICNoteBrowseCollectionViewAnimator initWithDuration:timingParameters:](v2, "initWithDuration:timingParameters:", v2);

  return v4;
}

- (ICNoteBrowseCollectionViewAnimator)initWithCoder:(id)a3
{
  v4 = [(ICNoteBrowseCollectionViewAnimator *)self commonInit];

  return v4;
}

- (int64_t)timingCurveType
{
  return 2;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return 0;
}

- (UISpringTimingParameters)springTimingParameters
{
  id v2 = [(id)objc_opt_class() springAnimation];
  id v3 = objc_alloc((Class)UISpringTimingParameters);
  [v2 mass];
  double v5 = v4;
  [v2 stiffness];
  double v7 = v6;
  [v2 damping];
  double v9 = v8;
  [v2 initialVelocity];
  double v11 = v10;
  [v2 initialVelocity];
  id v13 = [v3 initWithMass:v5 stiffness:v7 damping:v9 initialVelocity:v11];

  return (UISpringTimingParameters *)v13;
}

+ (id)springAnimation
{
  id v2 = objc_alloc_init((Class)CASpringAnimation);
  [v2 setStiffness:350.0];
  [v2 setDamping:31.0];

  return v2;
}

@end