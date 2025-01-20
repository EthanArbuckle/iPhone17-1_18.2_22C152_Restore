@interface _UIHyperInProcessPointAnimator
+ (BOOL)supportsSecureCoding;
- (BOOL)_generatesFeedbackWhenBoundaryIsCrossed;
- (BOOL)_regionChangedDiscontinuouslyOnChange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (UISelectionFeedbackGenerator)_feedbackGenerator;
- (UIViewSpringAnimationBehavior)_springAnimationBehavior;
- (UIViewVectorAnimatableProperty)_animatableProperty;
- (_UIHyperInProcessPointAnimator)initWithCoder:(id)a3;
- (_UIHyperInProcessPointAnimator)initWithDimensions:(unint64_t)a3;
- (_UIHyperInteractor)_interactor;
- (_UISpringParameters)_nonTrackingSpringParameters;
- (_UISpringParameters)_trackingSpringParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_animateWithParameters:(id)a3 animations:(id)a4;
- (void)_animateWithPrelude:(id)a3 animations:(id)a4;
- (void)_interactionBegan;
- (void)_interactionChanged;
- (void)_interactionEndedMutatingState:(id)a3;
- (void)_setGeneratesFeedbackWhenBoundaryIsCrossed:(BOOL)a3;
- (void)_setInteractor:(id)a3;
- (void)_setNonTrackingSpringParameters:(id)a3;
- (void)_setRegionChangedDiscontinuouslyOnChange:(BOOL)a3;
- (void)_setTrackingSpringParameters:(id)a3;
- (void)_updateAnimatablePropertyValuesToConstrainedPoint;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperInProcessPointAnimator

- (_UIHyperInProcessPointAnimator)initWithDimensions:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_UIHyperInProcessPointAnimator;
  v4 = [(_UIHyperInProcessPointAnimator *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v6 = [[UIViewVectorAnimatableProperty alloc] initWithLength:a3];
    animatableProperty = v5->__animatableProperty;
    v5->__animatableProperty = v6;

    objc_initWeak(&location, v5);
    v14[0] = v5->__animatableProperty;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53___UIHyperInProcessPointAnimator_initWithDimensions___block_invoke;
    v10[3] = &unk_1E52DC308;
    objc_copyWeak(&v11, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v8 presentationValueChangedCallback:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (NSString)description
{
  void v10[4] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel__dimensions);
  v10[0] = v3;
  v4 = NSStringFromSelector(sel__trackingSpringParameters);
  v10[1] = v4;
  v5 = NSStringFromSelector(sel__nonTrackingSpringParameters);
  v10[2] = v5;
  v6 = NSStringFromSelector(sel__generatesFeedbackWhenBoundaryIsCrossed);
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = +[UIDescriptionBuilder descriptionForObject:self keys:v7];

  return (NSString *)v8;
}

- (_UISpringParameters)_trackingSpringParameters
{
  trackingSpringParameters = self->__trackingSpringParameters;
  if (!trackingSpringParameters)
  {
    v4 = +[_UISpringParameters parametersWithDampingRatio:1.0 response:0.1];
    v5 = self->__trackingSpringParameters;
    self->__trackingSpringParameters = v4;

    trackingSpringParameters = self->__trackingSpringParameters;
  }
  return trackingSpringParameters;
}

- (void)_setTrackingSpringParameters:(id)a3
{
  id v4 = a3;
  v5 = self->__trackingSpringParameters;
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
    [(_UIHyperInProcessPointAnimator *)self willChangeValueForKey:@"_trackingSpringParameters"];
    v10 = (_UISpringParameters *)[(_UISpringParameters *)v15 copy];
    trackingSpringParameters = self->__trackingSpringParameters;
    self->__trackingSpringParameters = v10;

    [(_UIHyperInProcessPointAnimator *)self didChangeValueForKey:@"_trackingSpringParameters"];
    v9 = [(_UIHyperInProcessPointAnimator *)self _springAnimationBehavior];
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
    v5 = self->__nonTrackingSpringParameters;
    self->__nonTrackingSpringParameters = v4;

    nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
  }
  return nonTrackingSpringParameters;
}

- (void)_setNonTrackingSpringParameters:(id)a3
{
  id v4 = a3;
  v5 = self->__nonTrackingSpringParameters;
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
    [(_UIHyperInProcessPointAnimator *)self willChangeValueForKey:@"_nonTrackingSpringParameters"];
    v10 = (_UISpringParameters *)[(_UISpringParameters *)v15 copy];
    nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
    self->__nonTrackingSpringParameters = v10;

    [(_UIHyperInProcessPointAnimator *)self didChangeValueForKey:@"_nonTrackingSpringParameters"];
    v9 = [(_UIHyperInProcessPointAnimator *)self _springAnimationBehavior];
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
    v5 = self->__springAnimationBehavior;
    self->__springAnimationBehavior = v4;

    [(UIViewSpringAnimationBehavior *)self->__springAnimationBehavior setInertialTargetSmoothing:0.08];
    [(UIViewSpringAnimationBehavior *)self->__springAnimationBehavior setInertialProjectionDeceleration:0.995];
    v6 = [(_UIHyperInProcessPointAnimator *)self _trackingSpringParameters];
    BOOL v7 = [(_UIHyperInProcessPointAnimator *)self _nonTrackingSpringParameters];
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

- (UISelectionFeedbackGenerator)_feedbackGenerator
{
  feedbackGenerator = self->__feedbackGenerator;
  if (!feedbackGenerator)
  {
    id v4 = objc_alloc_init(UISelectionFeedbackGenerator);
    v5 = self->__feedbackGenerator;
    self->__feedbackGenerator = v4;

    feedbackGenerator = self->__feedbackGenerator;
  }
  return feedbackGenerator;
}

- (void)_updateAnimatablePropertyValuesToConstrainedPoint
{
  id v4 = [(_UIHyperInProcessPointAnimator *)self _animatableProperty];
  v3 = [(_UIHyperInProcessPointAnimator *)self _interactor];
  objc_msgSend(v4, "_copyValue:", objc_msgSend(v3, "_constrainedPoint"));
}

- (void)_interactionBegan
{
  if ([(_UIHyperInProcessPointAnimator *)self _generatesFeedbackWhenBoundaryIsCrossed])
  {
    v3 = [(_UIHyperInProcessPointAnimator *)self _feedbackGenerator];
    [v3 prepare];
  }
  id v4 = [(_UIHyperInProcessPointAnimator *)self _interactor];
  v5 = [v4 _delegate];
  v6 = [(_UIHyperInProcessPointAnimator *)self _interactor];
  [v5 _hyperInteractorApplyPresentationPoint:v6];

  [(_UIHyperInProcessPointAnimator *)self _updateAnimatablePropertyValuesToConstrainedPoint];
}

- (void)_interactionChanged
{
  v2[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke_2;
  v2[3] = &unk_1E52D9F70;
  [(_UIHyperInProcessPointAnimator *)self _animateWithPrelude:v3 animations:v2];
}

- (void)_interactionEndedMutatingState:(id)a3
{
  id v4 = a3;
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke;
  v7[3] = &unk_1E52DB330;
  v7[4] = self;
  id v8 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke_2;
  v6[3] = &unk_1E52D9F70;
  id v5 = v4;
  [(_UIHyperInProcessPointAnimator *)self _animateWithPrelude:v7 animations:v6];
}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [[UISpringTimingParameters alloc] initWithParameters:v6];

  BOOL v7 = [[UIViewPropertyAnimator alloc] initWithDuration:v8 timingParameters:0.0];
  [(UIViewPropertyAnimator *)v7 addAnimations:v5];

  [(UIViewPropertyAnimator *)v7 startAnimation];
}

- (void)_animateWithPrelude:(id)a3 animations:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  id v8 = [(_UIHyperInProcessPointAnimator *)self _interactor];
  char v9 = [v8 _isOverridingPresentationPoint];

  if ((v9 & 1) == 0)
  {
    double v10 = [(_UIHyperInProcessPointAnimator *)self _interactor];
    double v11 = [(_UIHyperInProcessPointAnimator *)self _animatableProperty];
    objc_msgSend(v10, "_copyOverridePresentationPoint:", objc_msgSend(v11, "_presentationValue"));

    double v12 = [(_UIHyperInProcessPointAnimator *)self _interactor];
    [v12 _setOverridingPresentationPoint:1];
  }
  v6[2](v6);
  double v13 = [(_UIHyperInProcessPointAnimator *)self _springAnimationBehavior];
  double v14 = [(_UIHyperInProcessPointAnimator *)self _interactor];
  uint64_t v15 = [v14 _isInteractive];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65___UIHyperInProcessPointAnimator__animateWithPrelude_animations___block_invoke;
  v16[3] = &unk_1E52DA9D0;
  v16[4] = self;
  +[UIView _animateUsingSpringBehavior:v13 tracking:v15 animations:v7 completion:v16];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperInProcessPointAnimator)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[_UIHyperInProcessPointAnimator initWithDimensions:](self, "initWithDimensions:", [v4 decodeIntegerForKey:@"_dimensions"]);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_trackingSpringParameters"];
  [(_UIHyperInProcessPointAnimator *)v5 _setTrackingSpringParameters:v6];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nonTrackingSpringParameters"];
  [(_UIHyperInProcessPointAnimator *)v5 _setNonTrackingSpringParameters:v7];

  uint64_t v8 = [v4 decodeBoolForKey:@"_generatesFeedbackWhenBoundaryIsCrossed"];
  [(_UIHyperInProcessPointAnimator *)v5 _setGeneratesFeedbackWhenBoundaryIsCrossed:v8];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[_UIHyperInProcessPointAnimator _dimensions](self, "_dimensions"), @"_dimensions");
  id v4 = [(_UIHyperInProcessPointAnimator *)self _trackingSpringParameters];
  [v6 encodeObject:v4 forKey:@"_trackingSpringParameters"];

  id v5 = [(_UIHyperInProcessPointAnimator *)self _nonTrackingSpringParameters];
  [v6 encodeObject:v5 forKey:@"_nonTrackingSpringParameters"];

  objc_msgSend(v6, "encodeBool:forKey:", -[_UIHyperInProcessPointAnimator _generatesFeedbackWhenBoundaryIsCrossed](self, "_generatesFeedbackWhenBoundaryIsCrossed"), @"_generatesFeedbackWhenBoundaryIsCrossed");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[_UIHyperInProcessPointAnimator alloc] initWithDimensions:[(_UIHyperInProcessPointAnimator *)self _dimensions]];
  id v5 = [(_UIHyperInProcessPointAnimator *)self _trackingSpringParameters];
  [(_UIHyperInProcessPointAnimator *)v4 _setTrackingSpringParameters:v5];

  id v6 = [(_UIHyperInProcessPointAnimator *)self _nonTrackingSpringParameters];
  [(_UIHyperInProcessPointAnimator *)v4 _setNonTrackingSpringParameters:v6];

  [(_UIHyperInProcessPointAnimator *)v4 _setGeneratesFeedbackWhenBoundaryIsCrossed:[(_UIHyperInProcessPointAnimator *)self _generatesFeedbackWhenBoundaryIsCrossed]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperInProcessPointAnimator *)self _dimensions];
    if (v6 != [v5 _dimensions])
    {
      LOBYTE(v12) = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v7 = [(_UIHyperInProcessPointAnimator *)self _trackingSpringParameters];
    uint64_t v8 = [v5 _trackingSpringParameters];
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
      if (!v9 || !v10) {
        goto LABEL_19;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    v16 = [(_UIHyperInProcessPointAnimator *)self _nonTrackingSpringParameters];
    v17 = [v5 _nonTrackingSpringParameters];
    id v14 = v16;
    id v18 = v17;
    double v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      if (!v14 || !v18)
      {

        LOBYTE(v12) = 0;
        goto LABEL_19;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_19;
      }
    }
    BOOL v19 = [(_UIHyperInProcessPointAnimator *)self _generatesFeedbackWhenBoundaryIsCrossed];
    int v12 = v19 ^ [v5 _generatesFeedbackWhenBoundaryIsCrossed] ^ 1;
LABEL_19:

    goto LABEL_20;
  }
  LOBYTE(v12) = 0;
LABEL_22:

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

- (BOOL)_generatesFeedbackWhenBoundaryIsCrossed
{
  return self->__generatesFeedbackWhenBoundaryIsCrossed;
}

- (void)_setGeneratesFeedbackWhenBoundaryIsCrossed:(BOOL)a3
{
  self->__generatesFeedbackWhenBoundaryIsCrossed = a3;
}

- (UIViewVectorAnimatableProperty)_animatableProperty
{
  return self->__animatableProperty;
}

- (BOOL)_regionChangedDiscontinuouslyOnChange
{
  return self->__regionChangedDiscontinuouslyOnChange;
}

- (void)_setRegionChangedDiscontinuouslyOnChange:(BOOL)a3
{
  self->__regionChangedDiscontinuouslyOnChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animatableProperty, 0);
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__springAnimationBehavior, 0);
  objc_storeStrong((id *)&self->__nonTrackingSpringParameters, 0);
  objc_storeStrong((id *)&self->__trackingSpringParameters, 0);
  objc_destroyWeak((id *)&self->__interactor);
}

@end