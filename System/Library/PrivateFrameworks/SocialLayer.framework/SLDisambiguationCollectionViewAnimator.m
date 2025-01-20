@interface SLDisambiguationCollectionViewAnimator
+ (id)init;
+ (id)springAnimation;
- (SLDisambiguationCollectionViewAnimator)initWithCoder:(id)a3;
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)springTimingParameters;
- (id)commonInit;
- (int64_t)timingCurveType;
@end

@implementation SLDisambiguationCollectionViewAnimator

+ (id)init
{
  id v2 = objc_alloc((Class)a1);
  v3 = [v2 commonInit];

  return v3;
}

- (id)commonInit
{
  id v2 = self;
  v3 = [(UIViewPropertyAnimator *)v2 initWithDuration:v2 timingParameters:0.3];
  return v3;
}

- (SLDisambiguationCollectionViewAnimator)initWithCoder:(id)a3
{
  v4 = [(SLDisambiguationCollectionViewAnimator *)self commonInit];

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
  id v3 = objc_alloc(MEMORY[0x1E4FB1C58]);
  [v2 mass];
  double v5 = v4;
  [v2 stiffness];
  double v7 = v6;
  [v2 damping];
  v9 = objc_msgSend(v3, "initWithMass:stiffness:damping:initialVelocity:", v5, v7, v8, 10.0, 10.0);

  return (UISpringTimingParameters *)v9;
}

+ (id)springAnimation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F39C90]);
  [v2 setStiffness:982.0];
  [v2 setDamping:46.0];
  return v2;
}

@end