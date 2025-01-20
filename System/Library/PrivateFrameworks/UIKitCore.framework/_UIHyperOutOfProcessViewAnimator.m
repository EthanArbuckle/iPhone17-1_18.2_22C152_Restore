@interface _UIHyperOutOfProcessViewAnimator
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)_isAnimating;
- (BOOL)isEqual:(id)a3;
- (CAFrameRateRange)_preferredFrameRateRange;
- (NSMutableSet)_propertyAnimators;
- (NSString)description;
- (_UIHyperInteractor)_interactor;
- (_UIHyperOutOfProcessViewAnimator)initWithCoder:(id)a3;
- (_UIHyperOutOfProcessViewAnimator)initWithDimensions:(unint64_t)a3;
- (_UIHyperOutOfProcessViewAnimatorDelegate)_delegate;
- (_UISpringParameters)_boundaryCrossedSpringParameters;
- (_UISpringParameters)_interactionEndedSpringParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (unsigned)_updateReason;
- (void)_animateWithParameters:(id)a3 animations:(id)a4;
- (void)_animateWithParameters:(id)a3 velocity:(double)a4 animations:(id)a5;
- (void)_interactionBegan;
- (void)_interactionChanged;
- (void)_interactionEndedMutatingState:(id)a3;
- (void)_setBoundaryCrossedSpringParameters:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setInteractionEndedSpringParameters:(id)a3;
- (void)_setInteractor:(id)a3;
- (void)_setPreferredFrameRateRange:(CAFrameRateRange)a3;
- (void)_setUpdateReason:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperOutOfProcessViewAnimator

- (_UIHyperOutOfProcessViewAnimator)initWithDimensions:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIHyperOutOfProcessViewAnimator;
  v4 = [(_UIHyperOutOfProcessViewAnimator *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    propertyAnimators = v5->__propertyAnimators;
    v5->__propertyAnimators = v6;
  }
  return v5;
}

- (void)_setUpdateReason:(unsigned int)a3
{
  self->__updateReason = a3;
}

- (void)_setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  self->__preferredFrameRateRange = a3;
}

- (void)_setDelegate:(id)a3
{
}

- (void)_setInteractor:(id)a3
{
}

- (_UIHyperInteractor)_interactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);
  return (_UIHyperInteractor *)WeakRetained;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (NSString)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel__dimensions);
  objc_super v9 = v3;
  v4 = NSStringFromSelector(sel__boundaryCrossedSpringParameters);
  v10 = v4;
  v5 = NSStringFromSelector(sel__interactionEndedSpringParameters);
  v11 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  v7 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);

  return (NSString *)v7;
}

- (_UISpringParameters)_boundaryCrossedSpringParameters
{
  boundaryCrossedSpringParameters = self->__boundaryCrossedSpringParameters;
  if (!boundaryCrossedSpringParameters)
  {
    v4 = +[_UISpringParameters parametersWithDampingRatio:1.0 response:0.1];
    v5 = self->__boundaryCrossedSpringParameters;
    self->__boundaryCrossedSpringParameters = v4;

    boundaryCrossedSpringParameters = self->__boundaryCrossedSpringParameters;
  }
  return boundaryCrossedSpringParameters;
}

- (void)_setBoundaryCrossedSpringParameters:(id)a3
{
  id v4 = a3;
  v5 = self->__boundaryCrossedSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(_UISpringParameters *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    [(_UIHyperOutOfProcessViewAnimator *)self willChangeValueForKey:@"_boundaryCrossedSpringParameters"];
    v8 = (_UISpringParameters *)[(_UISpringParameters *)v10 copy];
    boundaryCrossedSpringParameters = self->__boundaryCrossedSpringParameters;
    self->__boundaryCrossedSpringParameters = v8;

    [(_UIHyperOutOfProcessViewAnimator *)self didChangeValueForKey:@"_boundaryCrossedSpringParameters"];
  }
LABEL_9:
}

- (_UISpringParameters)_interactionEndedSpringParameters
{
  interactionEndedSpringParameters = self->__interactionEndedSpringParameters;
  if (!interactionEndedSpringParameters)
  {
    id v4 = +[_UISpringParameters parametersWithDampingRatio:1.0 response:0.3];
    v5 = self->__interactionEndedSpringParameters;
    self->__interactionEndedSpringParameters = v4;

    interactionEndedSpringParameters = self->__interactionEndedSpringParameters;
  }
  return interactionEndedSpringParameters;
}

- (void)_setInteractionEndedSpringParameters:(id)a3
{
  id v4 = a3;
  v5 = self->__interactionEndedSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(_UISpringParameters *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    [(_UIHyperOutOfProcessViewAnimator *)self willChangeValueForKey:@"_interactionEndedSpringParameters"];
    v8 = (_UISpringParameters *)[(_UISpringParameters *)v10 copy];
    interactionEndedSpringParameters = self->__interactionEndedSpringParameters;
    self->__interactionEndedSpringParameters = v8;

    [(_UIHyperOutOfProcessViewAnimator *)self didChangeValueForKey:@"_interactionEndedSpringParameters"];
  }
LABEL_9:
}

- (void)_interactionBegan
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIHyperOutOfProcessViewAnimator *)self _delegate];
  if ([(_UIHyperOutOfProcessViewAnimator *)self _isAnimating]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    v5 = [v4 _delegate];
    v6 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    [v5 _hyperInteractorApplyPresentationPoint:v6];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    long long v26 = 0u;
    BOOL v7 = [(_UIHyperOutOfProcessViewAnimator *)self _propertyAnimators];
    v8 = (void *)[v7 copy];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v13 stopAnimation:0];
          [v13 finishAnimationAtPosition:2];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }

    double v15 = MEMORY[0x1F4188790](v14);
    v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = [(_UIHyperOutOfProcessViewAnimator *)self _delegate];
    [v18 _hyperOutOfProcessViewAnimator:self getPresentationPointForInterruptedAnimation:v17];

    double v20 = MEMORY[0x1F4188790](v19);
    v22 = (double *)((char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
    v23 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    [v23 _getUnconstrainedPoint:v22 forConstrainedPoint:v17];

    v24 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    vDSP_vsubD((const double *)[v24 _unconstrainedPoint], 1, v22, 1, v22, 1, self->__dimensions);

    v25 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    [v25 _copyInitialTranslation:v22];
  }
}

- (void)_interactionChanged
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v3 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  id v4 = [v3 _region];
  v5 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  uint64_t v6 = [v5 _lastConstrainedPoint];
  BOOL v7 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  LOBYTE(v6) = _UIHyperregionIsBoundaryCrossedFromPointToPoint(v4, v6, [v7 _constrainedPoint]);

  double v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v12 _closestPoint];
  cblas_dcopy_NEWLAPACK();

  v13 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  uint64_t v14 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  objc_msgSend(v13, "_copyOverridePresentationPoint:", objc_msgSend(v14, "_lastConstrainedPoint"));

  double v15 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v15 _setOverridingPresentationPoint:1];

  uint64_t v16 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  v17 = [v16 _delegate];
  v18 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v17 _hyperInteractorApplyPresentationPoint:v18];

  uint64_t v19 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v19 _setOverridingPresentationPoint:0];

  double v20 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  int v21 = memcmp(v11, (const void *)[v20 _closestPoint], 8 * self->__dimensions);

  if ((v6 & 1) != 0 || v21)
  {
    v22 = [(_UIHyperOutOfProcessViewAnimator *)self _boundaryCrossedSpringParameters];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55___UIHyperOutOfProcessViewAnimator__interactionChanged__block_invoke;
    v25[3] = &unk_1E52D9F70;
    v25[4] = self;
    [(_UIHyperOutOfProcessViewAnimator *)self _animateWithParameters:v22 animations:v25];
  }
  else
  {
    v22 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    v23 = [v22 _delegate];
    v24 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    [v23 _hyperInteractorApplyPresentationPoint:v24];
  }
}

- (void)_interactionEndedMutatingState:(id)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v30 = (uint64_t)&v30;
  double v5 = MEMORY[0x1F4188790](v4);
  BOOL v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v8 _constrainedVelocity];
  cblas_dcopy_NEWLAPACK();

  double v9 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  uint64_t v10 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  objc_msgSend(v9, "_copyOverridePresentationPoint:", objc_msgSend(v10, "_constrainedPoint"));

  uint64_t v11 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v11 _setOverridingPresentationPoint:1];

  uint64_t v12 = (void (*)(void *))v4[2];
  id v31 = v4;
  v12(v4);
  v13 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  uint64_t v14 = [v13 _delegate];
  double v15 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v14 _hyperInteractorApplyPresentationPoint:v15];

  if (self->__dimensions)
  {
    uint64_t v16 = 0;
    v32 = v36;
    while (1)
    {
      v17 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
      double v18 = *(double *)([v17 _constrainedPoint] + 8 * v16);
      uint64_t v19 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
      double v20 = v18 - *(double *)([v19 _presentationPoint] + 8 * v16);

      if (v20 != 0.0) {
        goto LABEL_6;
      }
      double v21 = *(double *)&v7[8 * v16];
      if (v21 != 0.0) {
        break;
      }
LABEL_7:
      if (++v16 >= self->__dimensions) {
        goto LABEL_8;
      }
    }
    v22 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v36[0] = __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke;
    v36[1] = &__block_descriptor_48_e9_v16__0_d8l;
    v36[2] = v16;
    *(double *)&v36[3] = v21 * 0.001;
    [v22 _mutateOverridePresentationPoint:v35];

    double v20 = -(v21 * 0.001);
    v23 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    v24 = [v23 _delegate];
    v25 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    [v24 _hyperInteractorApplyPresentationPoint:v25];

LABEL_6:
    long long v26 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_2;
    v34[3] = &unk_1E52DC2B8;
    v34[4] = self;
    v34[5] = v16;
    [v26 _mutateOverridePresentationPoint:v34];

    double v27 = *(double *)&v7[8 * v16] / v20;
    long long v28 = [(_UIHyperOutOfProcessViewAnimator *)self _interactionEndedSpringParameters];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_3;
    v33[3] = &unk_1E52D9F70;
    v33[4] = self;
    [(_UIHyperOutOfProcessViewAnimator *)self _animateWithParameters:v28 velocity:v33 animations:v27];

    goto LABEL_7;
  }
LABEL_8:
  long long v29 = [(_UIHyperOutOfProcessViewAnimator *)self _interactor];
  [v29 _setOverridingPresentationPoint:0];
}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
}

- (void)_animateWithParameters:(id)a3 velocity:(double)a4 animations:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = -[UISpringTimingParameters initWithParameters:initialVelocity:]([UISpringTimingParameters alloc], "initWithParameters:initialVelocity:", v8, a4, a4);
  uint64_t v11 = [[UIViewPropertyAnimator alloc] initWithDuration:v10 timingParameters:0.0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke;
  v22[3] = &unk_1E52DA160;
  v22[4] = self;
  id v12 = v9;
  id v23 = v12;
  [(UIViewPropertyAnimator *)v11 addAnimations:v22];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke_2;
  v17 = &unk_1E52DC2E0;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  [(UIViewPropertyAnimator *)v11 addCompletion:&v14];
  v13 = [(_UIHyperOutOfProcessViewAnimator *)self _propertyAnimators];
  [v13 addObject:v11];

  [(UIViewPropertyAnimator *)v11 startAnimation];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (BOOL)_isAnimating
{
  v2 = [(_UIHyperOutOfProcessViewAnimator *)self _propertyAnimators];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperOutOfProcessViewAnimator)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = -[_UIHyperOutOfProcessViewAnimator initWithDimensions:](self, "initWithDimensions:", [v4 decodeIntegerForKey:@"_dimensions"]);
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_boundaryCrossedSpringParameters"];
  [(_UIHyperOutOfProcessViewAnimator *)v5 _setBoundaryCrossedSpringParameters:v6];

  BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interactionEndedSpringParameters"];

  [(_UIHyperOutOfProcessViewAnimator *)v5 _setInteractionEndedSpringParameters:v7];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIHyperOutOfProcessViewAnimator _dimensions](self, "_dimensions"), @"_dimensions");
  double v5 = [(_UIHyperOutOfProcessViewAnimator *)self _boundaryCrossedSpringParameters];
  [v4 encodeObject:v5 forKey:@"_boundaryCrossedSpringParameters"];

  id v6 = [(_UIHyperOutOfProcessViewAnimator *)self _interactionEndedSpringParameters];
  [v4 encodeObject:v6 forKey:@"_interactionEndedSpringParameters"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[_UIHyperOutOfProcessViewAnimator alloc] initWithDimensions:[(_UIHyperOutOfProcessViewAnimator *)self _dimensions]];
  double v5 = [(_UIHyperOutOfProcessViewAnimator *)self _boundaryCrossedSpringParameters];
  [(_UIHyperOutOfProcessViewAnimator *)v4 _setBoundaryCrossedSpringParameters:v5];

  id v6 = [(_UIHyperOutOfProcessViewAnimator *)self _interactionEndedSpringParameters];
  [(_UIHyperOutOfProcessViewAnimator *)v4 _setInteractionEndedSpringParameters:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperOutOfProcessViewAnimator *)self _dimensions];
    if (v6 != [v5 _dimensions])
    {
      LOBYTE(v12) = 0;
LABEL_19:

      goto LABEL_20;
    }
    BOOL v7 = [(_UIHyperOutOfProcessViewAnimator *)self _boundaryCrossedSpringParameters];
    id v8 = [v5 _boundaryCrossedSpringParameters];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
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
    uint64_t v15 = [(_UIHyperOutOfProcessViewAnimator *)self _interactionEndedSpringParameters];
    uint64_t v16 = [v5 _interactionEndedSpringParameters];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
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

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_boundaryCrossedSpringParameters", @"_interactionEndedSpringParameters", 0);
}

- (NSMutableSet)_propertyAnimators
{
  return self->__propertyAnimators;
}

- (CAFrameRateRange)_preferredFrameRateRange
{
  float minimum = self->__preferredFrameRateRange.minimum;
  float maximum = self->__preferredFrameRateRange.maximum;
  float preferred = self->__preferredFrameRateRange.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (unsigned)_updateReason
{
  return self->__updateReason;
}

- (_UIHyperOutOfProcessViewAnimatorDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);
  return (_UIHyperOutOfProcessViewAnimatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__propertyAnimators, 0);
  objc_storeStrong((id *)&self->__interactionEndedSpringParameters, 0);
  objc_storeStrong((id *)&self->__boundaryCrossedSpringParameters, 0);
  objc_destroyWeak((id *)&self->__interactor);
}

@end