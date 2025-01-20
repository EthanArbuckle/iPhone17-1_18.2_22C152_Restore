@interface _UIHyperInProcessViewAnimator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (UIViewSpringAnimationBehavior)_springAnimationBehavior;
- (UIViewSpringAnimationBehaviorDescribing)_overrideSpringAnimationBehavior;
- (_UIHyperInProcessViewAnimator)initWithCoder:(id)a3;
- (_UIHyperInProcessViewAnimator)initWithDimensions:(unint64_t)a3;
- (_UIHyperInteractor)_interactor;
- (_UISpringParameters)_nonTrackingSpringParameters;
- (_UISpringParameters)_trackingSpringParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_animateInteractive:(BOOL)a3 animations:(id)a4;
- (void)_animateWithParameters:(id)a3 animations:(id)a4;
- (void)_interactionChanged;
- (void)_interactionEndedMutatingState:(id)a3;
- (void)_setInteractor:(id)a3;
- (void)_setNonTrackingSpringParameters:(id)a3;
- (void)_setOverrideSpringAnimationBehavior:(id)a3;
- (void)_setTrackingSpringParameters:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperInProcessViewAnimator

- (_UIHyperInProcessViewAnimator)initWithDimensions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIHyperInProcessViewAnimator;
  result = [(_UIHyperInProcessViewAnimator *)&v5 init];
  if (result) {
    result->__dimensions = a3;
  }
  return result;
}

- (NSString)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel__dimensions);
  v9 = v3;
  v4 = NSStringFromSelector(sel__trackingSpringParameters);
  v10 = v4;
  objc_super v5 = NSStringFromSelector(sel__nonTrackingSpringParameters);
  v11 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  v7 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);

  return (NSString *)v7;
}

- (_UISpringParameters)_trackingSpringParameters
{
  trackingSpringParameters = self->__trackingSpringParameters;
  if (!trackingSpringParameters)
  {
    v4 = +[_UISpringParameters parametersWithDampingRatio:1.0 response:0.1];
    objc_super v5 = self->__trackingSpringParameters;
    self->__trackingSpringParameters = v4;

    trackingSpringParameters = self->__trackingSpringParameters;
  }
  return trackingSpringParameters;
}

- (void)_setTrackingSpringParameters:(id)a3
{
  id v4 = a3;
  objc_super v5 = self->__trackingSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v15 = v6;
  if (v5 == v6)
  {

    v9 = v15;
LABEL_9:

    v8 = v15;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(_UISpringParameters *)v5 isEqual:v6];

  v8 = v15;
  if (!v7)
  {
LABEL_8:
    [(_UIHyperInProcessViewAnimator *)self willChangeValueForKey:@"_trackingSpringParameters"];
    v10 = (_UISpringParameters *)[(_UISpringParameters *)v15 copy];
    trackingSpringParameters = self->__trackingSpringParameters;
    self->__trackingSpringParameters = v10;

    [(_UIHyperInProcessViewAnimator *)self didChangeValueForKey:@"_trackingSpringParameters"];
    v9 = [(_UIHyperInProcessViewAnimator *)self _springAnimationBehavior];
    [(_UISpringParameters *)v15 _dampingRatio];
    double v13 = v12;
    [(_UISpringParameters *)v15 _response];
    [v9 setTrackingDampingRatio:v13 response:v14 dampingRatioSmoothing:0.0 responseSmoothing:0.0];
    goto LABEL_9;
  }
LABEL_10:
}

- (_UISpringParameters)_nonTrackingSpringParameters
{
  nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
  if (!nonTrackingSpringParameters)
  {
    id v4 = +[_UISpringParameters parametersWithDampingRatio:1.0 response:0.3];
    objc_super v5 = self->__nonTrackingSpringParameters;
    self->__nonTrackingSpringParameters = v4;

    nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
  }
  return nonTrackingSpringParameters;
}

- (void)_setNonTrackingSpringParameters:(id)a3
{
  id v4 = a3;
  objc_super v5 = self->__nonTrackingSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v15 = v6;
  if (v5 == v6)
  {

    v9 = v15;
LABEL_9:

    v8 = v15;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(_UISpringParameters *)v5 isEqual:v6];

  v8 = v15;
  if (!v7)
  {
LABEL_8:
    [(_UIHyperInProcessViewAnimator *)self willChangeValueForKey:@"_nonTrackingSpringParameters"];
    v10 = (_UISpringParameters *)[(_UISpringParameters *)v15 copy];
    nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
    self->__nonTrackingSpringParameters = v10;

    [(_UIHyperInProcessViewAnimator *)self didChangeValueForKey:@"_nonTrackingSpringParameters"];
    v9 = [(_UIHyperInProcessViewAnimator *)self _springAnimationBehavior];
    [(_UISpringParameters *)v15 _dampingRatio];
    double v13 = v12;
    [(_UISpringParameters *)v15 _response];
    [v9 setDampingRatio:v13 response:v14];
    goto LABEL_9;
  }
LABEL_10:
}

- (UIViewSpringAnimationBehavior)_springAnimationBehavior
{
  springAnimationBehavior = self->__springAnimationBehavior;
  if (!springAnimationBehavior)
  {
    id v4 = objc_alloc_init(UIViewSpringAnimationBehavior);
    objc_super v5 = self->__springAnimationBehavior;
    self->__springAnimationBehavior = v4;

    [(UIViewSpringAnimationBehavior *)self->__springAnimationBehavior setInertialTargetSmoothing:0.08];
    [(UIViewSpringAnimationBehavior *)self->__springAnimationBehavior setInertialProjectionDeceleration:0.995];
    v6 = [(_UIHyperInProcessViewAnimator *)self _trackingSpringParameters];
    BOOL v7 = [(_UIHyperInProcessViewAnimator *)self _nonTrackingSpringParameters];
    v8 = self->__springAnimationBehavior;
    [v6 _dampingRatio];
    double v10 = v9;
    [v6 _response];
    [(UIViewSpringAnimationBehavior *)v8 setTrackingDampingRatio:v10 response:v11 dampingRatioSmoothing:0.0 responseSmoothing:0.0];
    double v12 = self->__springAnimationBehavior;
    [v7 _dampingRatio];
    double v14 = v13;
    [v7 _response];
    [(UIViewSpringAnimationBehavior *)v12 setDampingRatio:v14 response:v15];

    springAnimationBehavior = self->__springAnimationBehavior;
  }
  return springAnimationBehavior;
}

- (void)_interactionChanged
{
  v3 = [(_UIHyperInProcessViewAnimator *)self _interactor];
  uint64_t v4 = [v3 _isInteractive];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52___UIHyperInProcessViewAnimator__interactionChanged__block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  [(_UIHyperInProcessViewAnimator *)self _animateInteractive:v4 animations:v5];
}

- (void)_interactionEndedMutatingState:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  uint64_t v4 = [(_UIHyperInProcessViewAnimator *)self _interactor];
  uint64_t v5 = [v4 _isInteractive];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___UIHyperInProcessViewAnimator__interactionEndedMutatingState___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  [(_UIHyperInProcessViewAnimator *)self _animateInteractive:v5 animations:v6];
}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
}

- (void)_animateInteractive:(BOOL)a3 animations:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  v6 = [(_UIHyperInProcessViewAnimator *)self _overrideSpringAnimationBehavior];
  if (v6)
  {
    +[UIView _animateUsingSpringBehavior:v6 tracking:v4 animations:v8 completion:0];
  }
  else
  {
    BOOL v7 = [(_UIHyperInProcessViewAnimator *)self _springAnimationBehavior];
    +[UIView _animateUsingSpringBehavior:v7 tracking:v4 animations:v8 completion:0];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperInProcessViewAnimator)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[_UIHyperInProcessViewAnimator initWithDimensions:](self, "initWithDimensions:", [v4 decodeIntegerForKey:@"_dimensions"]);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_trackingSpringParameters"];
  [(_UIHyperInProcessViewAnimator *)v5 _setTrackingSpringParameters:v6];

  BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nonTrackingSpringParameters"];

  [(_UIHyperInProcessViewAnimator *)v5 _setNonTrackingSpringParameters:v7];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIHyperInProcessViewAnimator _dimensions](self, "_dimensions"), @"_dimensions");
  uint64_t v5 = [(_UIHyperInProcessViewAnimator *)self _trackingSpringParameters];
  [v4 encodeObject:v5 forKey:@"_trackingSpringParameters"];

  id v6 = [(_UIHyperInProcessViewAnimator *)self _nonTrackingSpringParameters];
  [v4 encodeObject:v6 forKey:@"_nonTrackingSpringParameters"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[_UIHyperInProcessViewAnimator alloc] initWithDimensions:[(_UIHyperInProcessViewAnimator *)self _dimensions]];
  uint64_t v5 = [(_UIHyperInProcessViewAnimator *)self _trackingSpringParameters];
  [(_UIHyperInProcessViewAnimator *)v4 _setTrackingSpringParameters:v5];

  id v6 = [(_UIHyperInProcessViewAnimator *)self _nonTrackingSpringParameters];
  [(_UIHyperInProcessViewAnimator *)v4 _setNonTrackingSpringParameters:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperInProcessViewAnimator *)self _dimensions];
    if (v6 != [v5 _dimensions])
    {
      LOBYTE(v12) = 0;
LABEL_19:

      goto LABEL_20;
    }
    BOOL v7 = [(_UIHyperInProcessViewAnimator *)self _trackingSpringParameters];
    id v8 = [v5 _trackingSpringParameters];
    id v9 = v7;
    id v10 = v8;
    double v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      double v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_18;
      }
    }
    double v15 = [(_UIHyperInProcessViewAnimator *)self _nonTrackingSpringParameters];
    v16 = [v5 _nonTrackingSpringParameters];
    id v14 = v15;
    id v17 = v16;
    double v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_17;
  }
  LOBYTE(v12) = 0;
LABEL_20:

  return v12;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (_UIHyperInteractor)_interactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);
  return (_UIHyperInteractor *)WeakRetained;
}

- (void)_setInteractor:(id)a3
{
}

- (UIViewSpringAnimationBehaviorDescribing)_overrideSpringAnimationBehavior
{
  return self->__overrideSpringAnimationBehavior;
}

- (void)_setOverrideSpringAnimationBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__overrideSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->__springAnimationBehavior, 0);
  objc_storeStrong((id *)&self->__nonTrackingSpringParameters, 0);
  objc_storeStrong((id *)&self->__trackingSpringParameters, 0);
  objc_destroyWeak((id *)&self->__interactor);
}

@end