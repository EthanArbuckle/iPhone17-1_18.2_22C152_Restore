@interface _UIHyperInteractor
- (BOOL)_isInteractive;
- (BOOL)_isOverridingPresentationPoint;
- (BOOL)_isRubberBanding;
- (_UIHyperAnimator)_animator;
- (_UIHyperExtender)_extender;
- (_UIHyperInteractor)initWithDimensions:(unint64_t)a3;
- (_UIHyperInteractorBroadcaster)_broadcaster;
- (_UIHyperInteractorDelegate)_delegate;
- (_UIHyperregion)_region;
- (const)_closestPoint;
- (const)_constrainedPoint;
- (const)_constrainedVelocity;
- (const)_effectiveVelocity;
- (const)_extentVector;
- (const)_initialTranslation;
- (const)_lastConstrainedPoint;
- (const)_overridePresentationPoint;
- (const)_presentationPoint;
- (const)_projectedPoint;
- (const)_translatedUnconstrainedPoint;
- (const)_translation;
- (const)_unconstrainedExtentVector;
- (const)_unconstrainedPoint;
- (const)_unconstrainedVector;
- (const)_velocity;
- (double)_constrainedFraction;
- (double)_decelerationRate;
- (double)_extent;
- (double)_minimumSpeed;
- (double)_rubberBandCoefficient;
- (double)_unconstrainedExtent;
- (id)_extenderGetter;
- (id)_presentationPointWasInvalidated;
- (id)_regionGetter;
- (id)_unconstrainedPointGetter;
- (id)description;
- (unint64_t)_dimensions;
- (void)_commitTranslation;
- (void)_copyInitialTranslation:(const double *)a3;
- (void)_copyOverridePresentationPoint:(const double *)a3;
- (void)_copyTranslation:(const double *)a3;
- (void)_copyUnconstrainedPoint:(const double *)a3;
- (void)_copyVelocity:(const double *)a3;
- (void)_getUnconstrainedPoint:(double *)a3 forConstrainedPoint:(const double *)a4;
- (void)_interactionBegan;
- (void)_interactionChangedCopyingTranslation:(const double *)a3 velocity:(const double *)a4;
- (void)_interactionChangedCopyingTranslation:(const double *)a3 velocity:(const double *)a4 mutatingState:(id)a5;
- (void)_interactionChangedMutatingTranslation:(id)a3 velocity:(id)a4;
- (void)_interactionChangedMutatingTranslation:(id)a3 velocity:(id)a4 mutatingState:(id)a5;
- (void)_interactionEnded;
- (void)_interactionEndedMutatingState:(id)a3;
- (void)_invalidateExtender;
- (void)_invalidateRegion;
- (void)_invalidateUnconstrainedPoint;
- (void)_mutateInitialTranslation:(id)a3;
- (void)_mutateInternalUnconstrainedPoint:(id)a3;
- (void)_mutateOverridePresentationPoint:(id)a3;
- (void)_mutateTranslation:(id)a3;
- (void)_mutateUnconstrainedPoint:(id)a3;
- (void)_mutateVelocity:(id)a3;
- (void)_setAnimator:(id)a3;
- (void)_setBroadcaster:(id)a3;
- (void)_setDecelerationRate:(double)a3;
- (void)_setDelegate:(id)a3;
- (void)_setExtender:(id)a3;
- (void)_setExtenderGetter:(id)a3;
- (void)_setInteractive:(BOOL)a3;
- (void)_setInternalExtender:(id)a3;
- (void)_setInternalRegion:(id)a3;
- (void)_setMinimumSpeed:(double)a3;
- (void)_setOverridingPresentationPoint:(BOOL)a3;
- (void)_setPresentationPointWasInvalidated:(id)a3;
- (void)_setRegion:(id)a3;
- (void)_setRegionGetter:(id)a3;
- (void)_setRubberBandCoefficient:(double)a3;
- (void)_setUnconstrainedPointGetter:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _UIHyperInteractor

- (_UIHyperInteractor)initWithDimensions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHyperInteractor;
  v4 = [(_UIHyperInteractor *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    *(_OWORD *)&v4->__minimumSpeed = xmmword_186B92D10;
    v4->__rubberBandCoefficient = _UIScrollViewRubberBandCoefficient(0);
    v5->__unconstrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__initialTranslation = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__translation = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__translatedUnconstrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__velocity = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__effectiveVelocity = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__projectedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__closestPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__unconstrainedVector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__extentVector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__unconstrainedExtentVector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__constrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__constrainedVelocity = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__overridePresentationPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__lastConstrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (_UIHyperExtender)_extender
{
  if ((*(unsigned char *)&self->_clean & 2) == 0)
  {
    extenderGetter = (void (**)(id, SEL))self->__extenderGetter;
    if (extenderGetter)
    {
      v4 = extenderGetter[2](extenderGetter, a2);
      [(_UIHyperInteractor *)self _setInternalExtender:v4];
    }
    if (!self->__extender)
    {
      v5 = [[_UIHyperConstantExtender alloc] initWithDimensions:self->__dimensions];
      [(_UIHyperInteractor *)self _setInternalExtender:v5];
    }
    *(_DWORD *)&self->_clean |= 2u;
  }
  extender = self->__extender;
  return extender;
}

- (void)_setRegion:(id)a3
{
  v4 = (_UIHyperregion *)a3;
  if (self->__region != v4)
  {
    v6 = v4;
    [(_UIHyperInteractor *)self _setInternalRegion:v4];
    v4 = v6;
    $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
    if (*(unsigned char *)&clean)
    {
      self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFE);
      _UIHyperInteractorDirtyClosestPoint(self);
      v4 = v6;
    }
  }
}

- (void)_setExtender:(id)a3
{
  v4 = (_UIHyperExtender *)a3;
  if (self->__extender != v4)
  {
    v6 = v4;
    [(_UIHyperInteractor *)self _setInternalExtender:v4];
    v4 = v6;
    $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
    if ((*(unsigned char *)&clean & 2) != 0)
    {
      self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFD);
      _UIHyperInteractorDirtyExtentVector(self);
      v4 = v6;
    }
  }
}

- (const)_presentationPoint
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
  if ((*(_DWORD *)&clean & 0x10000) != 0) {
    return self->__presentationPoint;
  }
  if (self->__overridingPresentationPoint)
  {
    result = self->__overridePresentationPoint;
  }
  else
  {
    result = [(_UIHyperInteractor *)self _constrainedPoint];
    $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
  }
  self->__presentationPoint = result;
  self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean | 0x10000);
  return result;
}

- (void)_invalidateUnconstrainedPoint
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
  if ((*(unsigned char *)&clean & 4) != 0)
  {
    self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFB);
    _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
  }
}

- (void)_invalidateRegion
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
  if (*(unsigned char *)&clean)
  {
    self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFE);
    _UIHyperInteractorDirtyClosestPoint(self);
  }
}

- (void)dealloc
{
  [(_UIHyperregion *)self->__region removeObserver:self forKeyPath:@"self" context:_MergedGlobals_896];
  [(_UIHyperExtender *)self->__extender removeObserver:self forKeyPath:@"self" context:off_1EB256D30];
  free(self->__unconstrainedPoint);
  free(self->__initialTranslation);
  free(self->__translation);
  free(self->__translatedUnconstrainedPoint);
  free(self->__velocity);
  free(self->__effectiveVelocity);
  free(self->__projectedPoint);
  free(self->__closestPoint);
  free(self->__unconstrainedVector);
  free(self->__extentVector);
  free(self->__unconstrainedExtentVector);
  free(self->__constrainedPoint);
  free(self->__constrainedVelocity);
  free(self->__overridePresentationPoint);
  free(self->__lastConstrainedPoint);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperInteractor;
  [(_UIHyperInteractor *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (_MergedGlobals_896 == a6)
  {
    $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
    if (*(unsigned char *)&clean)
    {
      self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFE);
      _UIHyperInteractorDirtyClosestPoint(self);
    }
  }
  else if (off_1EB256D30 == a6)
  {
    $2EBF6573070EC26E3189A7B4CB61B0F7 v14 = self->_clean;
    if ((*(unsigned char *)&v14 & 2) != 0)
    {
      self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&v14 & 0xFFFFFFFD);
      _UIHyperInteractorDirtyExtentVector(self);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIHyperInteractor;
    [(_UIHyperInteractor *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_setInternalRegion:(id)a3
{
  id v5 = a3;
  if ([v5 _dimensions] != self->__dimensions)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIHyperInteractor.m", 186, @"Tried to set _region %@ (%lu) with unequal dimensions to %@ (%lu)", v5, objc_msgSend(v5, "_dimensions"), self, self->__dimensions object file lineNumber description];
  }
  [(_UIHyperregion *)self->__region removeObserver:self forKeyPath:@"self" context:_MergedGlobals_896];
  region = self->__region;
  self->__region = (_UIHyperregion *)v5;
  id v7 = v5;

  [(_UIHyperregion *)self->__region addObserver:self forKeyPath:@"self" options:0 context:_MergedGlobals_896];
  id v9 = [(_UIHyperInteractor *)self _broadcaster];
  [v9 _broadcastIfPossible];
}

- (void)_setInternalExtender:(id)a3
{
  id v5 = a3;
  if ([v5 _dimensions] != self->__dimensions)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIHyperInteractor.m", 226, @"Tried to set _extender %@ (%lu) with unequal dimensions to %@ (%lu)", v5, objc_msgSend(v5, "_dimensions"), self, self->__dimensions object file lineNumber description];
  }
  [(_UIHyperExtender *)self->__extender removeObserver:self forKeyPath:@"self" context:off_1EB256D30];
  extender = self->__extender;
  self->__extender = (_UIHyperExtender *)v5;
  id v7 = v5;

  [(_UIHyperExtender *)self->__extender addObserver:self forKeyPath:@"self" options:0 context:off_1EB256D30];
  id v9 = [(_UIHyperInteractor *)self _broadcaster];
  [v9 _broadcastIfPossible];
}

- (void)_copyUnconstrainedPoint:(const double *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46___UIHyperInteractor__copyUnconstrainedPoint___block_invoke;
  v3[3] = &unk_1E52DC2B8;
  v3[4] = self;
  v3[5] = a3;
  [(_UIHyperInteractor *)self _mutateUnconstrainedPoint:v3];
}

- (void)_mutateUnconstrainedPoint:(id)a3
{
  [(_UIHyperInteractor *)self _mutateInternalUnconstrainedPoint:a3];
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
  if ((*(unsigned char *)&clean & 4) != 0)
  {
    self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFB);
    _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
  }
}

- (void)_mutateInternalUnconstrainedPoint:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__unconstrainedPoint);
  id v4 = [(_UIHyperInteractor *)self _broadcaster];
  [v4 _broadcastIfPossible];
}

- (_UIHyperInteractorBroadcaster)_broadcaster
{
  return self->__broadcaster;
}

- (const)_constrainedPoint
{
  if ((*((unsigned char *)&self->_clean + 1) & 0x40) == 0)
  {
    constrainedPoint = self->__constrainedPoint;
    id v4 = [(_UIHyperInteractor *)self _unconstrainedExtentVector];
    [(_UIHyperInteractor *)self _constrainedFraction];
    double v6 = v5;
    id v7 = [(_UIHyperInteractor *)self _closestPoint];
    vDSP_Length dimensions = self->__dimensions;
    double __B = v6;
    vDSP_vsmaD(v4, 1, &__B, v7, 1, constrainedPoint, 1, dimensions);
    *(_DWORD *)&self->_clean |= 0x4000u;
  }
  return self->__constrainedPoint;
}

- (const)_unconstrainedExtentVector
{
  if ((*((unsigned char *)&self->_clean + 1) & 8) == 0)
  {
    [(_UIHyperInteractor *)self _extent];
    unconstrainedExtentVector = self->__unconstrainedExtentVector;
    if (v4 == 0.0)
    {
      catlas_dset_NEWLAPACK();
    }
    else
    {
      double v5 = [(_UIHyperInteractor *)self _unconstrainedVector];
      double v6 = [(_UIHyperInteractor *)self _extentVector];
      vDSP_Length dimensions = self->__dimensions;
      double __B = _UIHyperFractionOfProjectionOnto(v5, v6, dimensions);
      vDSP_vsmulD(v6, 1, &__B, unconstrainedExtentVector, 1, dimensions);
    }
    *(_DWORD *)&self->_clean |= 0x800u;
  }
  return self->__unconstrainedExtentVector;
}

- (const)_extentVector
{
  if ((*((unsigned char *)&self->_clean + 1) & 2) == 0)
  {
    if (!memcmp([(_UIHyperInteractor *)self _translatedUnconstrainedPoint], [(_UIHyperInteractor *)self _closestPoint], 8 * self->__dimensions))
    {
      catlas_dset_NEWLAPACK();
    }
    else
    {
      objc_super v3 = [(_UIHyperInteractor *)self _extender];
      objc_msgSend(v3, "_getExtentVector:forUnconstrainedPoint:closestPoint:", self->__extentVector, -[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint"), -[_UIHyperInteractor _closestPoint](self, "_closestPoint"));
    }
    *(_DWORD *)&self->_clean |= 0x200u;
  }
  return self->__extentVector;
}

- (const)_closestPoint
{
  if ((*(unsigned char *)&self->_clean & 0x40) == 0)
  {
    objc_super v3 = [(_UIHyperInteractor *)self _region];
    objc_msgSend(v3, "_closestPoint:toPoint:", self->__closestPoint, -[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint"));

    *(_DWORD *)&self->_clean |= 0x40u;
  }
  return self->__closestPoint;
}

- (const)_translatedUnconstrainedPoint
{
  if ((*(unsigned char *)&self->_clean & 8) == 0)
  {
    vDSP_vaddD([(_UIHyperInteractor *)self _unconstrainedPoint], 1, self->__initialTranslation, 1, self->__translatedUnconstrainedPoint, 1, self->__dimensions);
    vDSP_vaddD(self->__translatedUnconstrainedPoint, 1, self->__translation, 1, self->__translatedUnconstrainedPoint, 1, self->__dimensions);
    *(_DWORD *)&self->_clean |= 8u;
  }
  return self->__translatedUnconstrainedPoint;
}

- (_UIHyperregion)_region
{
  if ((*(unsigned char *)&self->_clean & 1) == 0)
  {
    regionGetter = (void (**)(id, SEL))self->__regionGetter;
    if (regionGetter)
    {
      double v4 = regionGetter[2](regionGetter, a2);
      [(_UIHyperInteractor *)self _setInternalRegion:v4];
    }
    if (!self->__region)
    {
      double v5 = [[_UIHyperspace alloc] initWithDimensions:self->__dimensions];
      [(_UIHyperInteractor *)self _setInternalRegion:v5];
    }
    *(_DWORD *)&self->_clean |= 1u;
  }
  region = self->__region;
  return region;
}

- (const)_unconstrainedPoint
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
  if ((*(unsigned char *)&clean & 4) == 0)
  {
    if (self->__unconstrainedPointGetter)
    {
      -[_UIHyperInteractor _mutateInternalUnconstrainedPoint:](self, "_mutateInternalUnconstrainedPoint:");
      $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
    }
    self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean | 4);
  }
  return self->__unconstrainedPoint;
}

- (double)_constrainedFraction
{
  if ((*((unsigned char *)&self->_clean + 1) & 0x20) != 0) {
    return self->__constrainedFraction;
  }
  [(_UIHyperInteractor *)self _extent];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(_UIHyperInteractor *)self _unconstrainedExtent];
    double v7 = v6;
    double v8 = v6 / v4;
    [(_UIHyperInteractor *)self _rubberBandCoefficient];
    double result = v4 * (1.0 - 1.0 / (v8 * v9 + 1.0)) / v7;
  }
  self->__constrainedFraction = result;
  *(_DWORD *)&self->_clean |= 0x2000u;
  return result;
}

- (double)_extent
{
  if ((*((unsigned char *)&self->_clean + 1) & 4) != 0) {
    return self->__extent;
  }
  [(_UIHyperInteractor *)self _extentVector];
  cblas_dnrm2_NEWLAPACK();
  self->__extent = result;
  *(_DWORD *)&self->_clean |= 0x400u;
  return result;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (void)_setUnconstrainedPointGetter:(id)a3
{
}

- (void)_setRegionGetter:(id)a3
{
}

- (void)_setExtenderGetter:(id)a3
{
}

- (void)_setDelegate:(id)a3
{
}

- (void)_setDecelerationRate:(double)a3
{
  if (self->__decelerationRate != a3)
  {
    self->__decelerationRate = a3;
    $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
    if ((*(unsigned char *)&clean & 0x20) != 0) {
      self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFDF);
    }
    id v4 = [(_UIHyperInteractor *)self _broadcaster];
    [v4 _broadcastIfPossible];
  }
}

- (void)_setAnimator:(id)a3
{
  double v6 = (_UIHyperAnimator *)a3;
  if (self->__animator != v6)
  {
    id v12 = v6;
    if ([(_UIHyperAnimator *)v6 _dimensions] != self->__dimensions)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"_UIHyperInteractor.m", 250, @"Tried to set _animator %@ (%lu) with unequal dimensions to %@ (%lu)", v12, -[_UIHyperAnimator _dimensions](v12, "_dimensions"), self, self->__dimensions object file lineNumber description];
    }
    double v7 = [(_UIHyperAnimator *)v12 _interactor];

    if (v7)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = [(_UIHyperAnimator *)v12 _interactor];
      [v10 handleFailureInMethod:a2, self, @"_UIHyperInteractor.m", 251, @"Cannot set _animator %@ on %@ that is already assigned to %@.", v12, self, v11 object file lineNumber description];
    }
    [(_UIHyperAnimator *)self->__animator _setInteractor:0];
    objc_storeStrong((id *)&self->__animator, a3);
    [(_UIHyperAnimator *)self->__animator _setInteractor:self];
    double v8 = [(_UIHyperInteractor *)self _broadcaster];
    [v8 _broadcastIfPossible];

    double v6 = v12;
  }
}

- (void)_setPresentationPointWasInvalidated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__broadcaster, 0);
  objc_storeStrong(&self->__presentationPointWasInvalidated, 0);
  objc_storeStrong(&self->__unconstrainedPointGetter, 0);
  objc_storeStrong(&self->__extenderGetter, 0);
  objc_storeStrong(&self->__regionGetter, 0);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__extender, 0);
  objc_storeStrong((id *)&self->__region, 0);
}

- (id)description
{
  v23 = NSString;
  uint64_t v22 = objc_opt_class();
  v21 = [(_UIHyperInteractor *)self _region];
  v20 = [(_UIHyperInteractor *)self _extender];
  v19 = [(_UIHyperInteractor *)self _animator];
  [(_UIHyperInteractor *)self _minimumSpeed];
  uint64_t v4 = v3;
  [(_UIHyperInteractor *)self _decelerationRate];
  uint64_t v6 = v5;
  [(_UIHyperInteractor *)self _rubberBandCoefficient];
  uint64_t v8 = v7;
  v24 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _unconstrainedPoint], self->__dimensions);
  v18 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _initialTranslation], self->__dimensions);
  v17 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _translation], self->__dimensions);
  double v9 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _velocity], self->__dimensions);
  id v10 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _effectiveVelocity], self->__dimensions);
  id v11 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _projectedPoint], self->__dimensions);
  id v12 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _closestPoint], self->__dimensions);
  v13 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _constrainedPoint], self->__dimensions);
  $2EBF6573070EC26E3189A7B4CB61B0F7 v14 = _UIVectorDescription((uint64_t)[(_UIHyperInteractor *)self _constrainedVelocity], self->__dimensions);
  objc_msgSend(v23, "stringWithFormat:", @"<%@: %p; region = %@; extender = %@; animator = %@; minimumSpeed = %g; decelerationRate = %g; rubberBandCoefficient = %g; unconstrainedPoint = %@; initialTranslation = %@; translation = %@; velocity = %@; effectiveVelocity = %@; projectedPoint = %@; closestPoint = %@; constrainedPoint = %@; constrainedVelocity = %@>",
    v22,
    self,
    v21,
    v20,
    v19,
    v4,
    v6,
    v8,
    v24,
    v18,
    v17,
    v9,
    v10,
    v11,
    v12,
    v13,
  objc_super v15 = v14);

  return v15;
}

- (void)_invalidateExtender
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean = self->_clean;
  if ((*(unsigned char *)&clean & 2) != 0)
  {
    self->_$2EBF6573070EC26E3189A7B4CB61B0F7 clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFD);
    _UIHyperInteractorDirtyExtentVector(self);
  }
}

- (_UIHyperAnimator)_animator
{
  animator = self->__animator;
  if (!animator)
  {
    uint64_t v4 = [[_UIHyperOutOfProcessViewAnimator alloc] initWithDimensions:self->__dimensions];
    [(_UIHyperInteractor *)self _setAnimator:v4];

    animator = self->__animator;
  }
  return animator;
}

- (void)_setBroadcaster:(id)a3
{
  uint64_t v5 = (_UIHyperInteractorBroadcaster *)a3;
  broadcaster = self->__broadcaster;
  if (broadcaster != v5)
  {
    id v11 = v5;
    p_broadcaster = &self->__broadcaster;
    uint64_t v8 = [(_UIHyperInteractorBroadcaster *)broadcaster _interactor];

    if (v8 == self) {
      [(_UIHyperInteractorBroadcaster *)*p_broadcaster _setInteractor:0];
    }
    objc_storeStrong((id *)&self->__broadcaster, a3);
    double v9 = [(_UIHyperInteractorBroadcaster *)*p_broadcaster _interactor];

    if (v9)
    {
      id v10 = [(_UIHyperInteractorBroadcaster *)*p_broadcaster _interactor];
      [v10 _setBroadcaster:0];
    }
    [(_UIHyperInteractorBroadcaster *)self->__broadcaster _setInteractor:self];
    uint64_t v5 = v11;
  }
}

- (void)_setMinimumSpeed:(double)a3
{
  if (self->__minimumSpeed != a3)
  {
    self->__minimumSpeed = a3;
    _UIHyperInteractorDirtyEffectiveVelocity(self);
    id v4 = [(_UIHyperInteractor *)self _broadcaster];
    [v4 _broadcastIfPossible];
  }
}

- (void)_setRubberBandCoefficient:(double)a3
{
  if (self->__rubberBandCoefficient != a3)
  {
    self->__rubberBandCoefficient = a3;
    _UIHyperInteractorDirtyConstrainedFraction(self);
    id v4 = [(_UIHyperInteractor *)self _broadcaster];
    [v4 _broadcastIfPossible];
  }
}

- (void)_copyInitialTranslation:(const double *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46___UIHyperInteractor__copyInitialTranslation___block_invoke;
  v3[3] = &unk_1E52DC2B8;
  v3[4] = self;
  v3[5] = a3;
  [(_UIHyperInteractor *)self _mutateInitialTranslation:v3];
}

- (void)_mutateInitialTranslation:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__initialTranslation);
  _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
}

- (void)_copyTranslation:(const double *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39___UIHyperInteractor__copyTranslation___block_invoke;
  v3[3] = &unk_1E52DC2B8;
  v3[4] = self;
  v3[5] = a3;
  [(_UIHyperInteractor *)self _mutateTranslation:v3];
}

- (void)_mutateTranslation:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__translation);
  _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
}

- (void)_commitTranslation
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___UIHyperInteractor__commitTranslation__block_invoke;
  v5[3] = &unk_1E52DB3A0;
  v5[4] = self;
  [(_UIHyperInteractor *)self _mutateUnconstrainedPoint:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___UIHyperInteractor__commitTranslation__block_invoke_2;
  v4[3] = &unk_1E52DB3A0;
  v4[4] = self;
  [(_UIHyperInteractor *)self _mutateInitialTranslation:v4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40___UIHyperInteractor__commitTranslation__block_invoke_3;
  v3[3] = &unk_1E52DB3A0;
  v3[4] = self;
  [(_UIHyperInteractor *)self _mutateTranslation:v3];
}

- (const)_velocity
{
  return self->__velocity;
}

- (void)_copyVelocity:(const double *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36___UIHyperInteractor__copyVelocity___block_invoke;
  v3[3] = &unk_1E52DC2B8;
  v3[4] = self;
  void v3[5] = a3;
  [(_UIHyperInteractor *)self _mutateVelocity:v3];
}

- (void)_mutateVelocity:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__velocity);
  _UIHyperInteractorDirtyEffectiveVelocity(self);
}

- (void)_copyOverridePresentationPoint:(const double *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___UIHyperInteractor__copyOverridePresentationPoint___block_invoke;
  v3[3] = &unk_1E52DC2B8;
  v3[4] = self;
  void v3[5] = a3;
  [(_UIHyperInteractor *)self _mutateOverridePresentationPoint:v3];
}

- (void)_mutateOverridePresentationPoint:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__overridePresentationPoint);
  _UIHyperInteractorDirtyPresentationPoint(self);
}

- (void)_setOverridingPresentationPoint:(BOOL)a3
{
  if (self->__overridingPresentationPoint != a3)
  {
    self->__overridingPresentationPoint = a3;
    _UIHyperInteractorDirtyPresentationPoint(self);
  }
}

- (void)_interactionBegan
{
  [(_UIHyperInteractor *)self _setInteractive:1];
  uint64_t v3 = [(_UIHyperInteractor *)self _animator];
  [v3 _interactionBegan];

  id v4 = [(_UIHyperInteractor *)self _broadcaster];
  [v4 _interactionDidBegin];
}

- (void)_interactionChangedCopyingTranslation:(const double *)a3 velocity:(const double *)a4
{
}

- (void)_interactionChangedCopyingTranslation:(const double *)a3 velocity:(const double *)a4 mutatingState:(id)a5
{
  void v5[5] = a4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83___UIHyperInteractor__interactionChangedCopyingTranslation_velocity_mutatingState___block_invoke;
  v6[3] = &unk_1E52DC2B8;
  v6[4] = self;
  v6[5] = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83___UIHyperInteractor__interactionChangedCopyingTranslation_velocity_mutatingState___block_invoke_2;
  v5[3] = &unk_1E52DC2B8;
  v5[4] = self;
  [(_UIHyperInteractor *)self _interactionChangedMutatingTranslation:v6 velocity:v5 mutatingState:a5];
}

- (void)_interactionChangedMutatingTranslation:(id)a3 velocity:(id)a4
{
}

- (void)_interactionChangedMutatingTranslation:(id)a3 velocity:(id)a4 mutatingState:(id)a5
{
  id v12 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = a3;
  [(_UIHyperInteractor *)self _constrainedPoint];
  cblas_dcopy_NEWLAPACK();
  [(_UIHyperInteractor *)self _mutateTranslation:v9];

  [(_UIHyperInteractor *)self _mutateVelocity:v8];
  if (v12) {
    v12[2]();
  }
  id v10 = [(_UIHyperInteractor *)self _animator];
  [v10 _interactionChanged];

  id v11 = [(_UIHyperInteractor *)self _broadcaster];
  [v11 _interactionDidChange];
}

- (void)_interactionEnded
{
}

- (void)_interactionEndedMutatingState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIHyperInteractor *)self _broadcaster];
  [v5 _interactionWillEnd];

  uint64_t v6 = [(_UIHyperInteractor *)self _animator];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __53___UIHyperInteractor__interactionEndedMutatingState___block_invoke;
  id v12 = &unk_1E52DB330;
  v13 = self;
  id v14 = v4;
  id v7 = v4;
  [v6 _interactionEndedMutatingState:&v9];

  id v8 = [(_UIHyperInteractor *)self _broadcaster];
  [v8 _interactionDidEnd];
}

- (void)_setInteractive:(BOOL)a3
{
  if (self->__interactive != a3) {
    self->__interactive = a3;
  }
}

- (const)_effectiveVelocity
{
  if ((*(unsigned char *)&self->_clean & 0x10) == 0)
  {
    [(_UIHyperInteractor *)self _velocity];
    cblas_dnrm2_NEWLAPACK();
    double v4 = v3;
    [(_UIHyperInteractor *)self _minimumSpeed];
    if (v4 >= v5) {
      cblas_dcopy_NEWLAPACK();
    }
    else {
      catlas_dset_NEWLAPACK();
    }
    *(_DWORD *)&self->_clean |= 0x10u;
  }
  return self->__effectiveVelocity;
}

- (const)_projectedPoint
{
  if ((*(unsigned char *)&self->_clean & 0x20) == 0)
  {
    [(_UIHyperInteractor *)self _decelerationRate];
    double v4 = v3;
    projectedPoint = self->__projectedPoint;
    uint64_t v6 = [(_UIHyperInteractor *)self _effectiveVelocity];
    id v7 = [(_UIHyperInteractor *)self _translatedUnconstrainedPoint];
    vDSP_Length dimensions = self->__dimensions;
    double __B = v4 / (1.0 - v4) / 1000.0;
    vDSP_vsmaD(v6, 1, &__B, v7, 1, projectedPoint, 1, dimensions);
    *(_DWORD *)&self->_clean |= 0x20u;
  }
  return self->__projectedPoint;
}

- (BOOL)_isRubberBanding
{
  if ((*(unsigned char *)&self->_clean & 0x80) != 0) {
    return self->__rubberBanding;
  }
  BOOL result = memcmp([(_UIHyperInteractor *)self _translatedUnconstrainedPoint], [(_UIHyperInteractor *)self _closestPoint], 8 * self->__dimensions) != 0;
  self->__rubberBanding = result;
  *(_DWORD *)&self->_clean |= 0x80u;
  return result;
}

- (const)_unconstrainedVector
{
  if ((*((unsigned char *)&self->_clean + 1) & 1) == 0)
  {
    vDSP_vsubD([(_UIHyperInteractor *)self _closestPoint], 1, [(_UIHyperInteractor *)self _translatedUnconstrainedPoint], 1, self->__unconstrainedVector, 1, self->__dimensions);
    *(_DWORD *)&self->_clean |= 0x100u;
  }
  return self->__unconstrainedVector;
}

- (double)_unconstrainedExtent
{
  if ((*((unsigned char *)&self->_clean + 1) & 0x10) != 0) {
    return self->__unconstrainedExtent;
  }
  [(_UIHyperInteractor *)self _unconstrainedExtentVector];
  cblas_dnrm2_NEWLAPACK();
  self->__unconstrainedExtent = result;
  *(_DWORD *)&self->_clean |= 0x1000u;
  return result;
}

- (const)_constrainedVelocity
{
  if ((*((unsigned char *)&self->_clean + 1) & 0x80) == 0)
  {
    vDSP_vsubD([(_UIHyperInteractor *)self _unconstrainedExtentVector], 1, [(_UIHyperInteractor *)self _unconstrainedVector], 1, self->__constrainedVelocity, 1, self->__dimensions);
    cblas_dnrm2_NEWLAPACK();
    double v4 = v3;
    constrainedVelocity = self->__constrainedVelocity;
    uint64_t v6 = [(_UIHyperInteractor *)self _effectiveVelocity];
    if (v4 == 0.0) {
      cblas_dcopy_NEWLAPACK();
    }
    else {
      _UIHyperFractionalProjectionOntoHyperplane(constrainedVelocity, v6, self->__constrainedVelocity, self->__dimensions, 1.0);
    }
    [(_UIHyperInteractor *)self _unconstrainedExtent];
    if (v7 != 0.0)
    {
      id v8 = self->__constrainedVelocity;
      uint64_t v9 = [(_UIHyperInteractor *)self _unconstrainedExtentVector];
      [(_UIHyperInteractor *)self _constrainedFraction];
      _UIHyperFractionalProjectionOntoHyperplane(v8, v8, v9, self->__dimensions, 1.0 - v10);
    }
    *(_DWORD *)&self->_clean |= 0x8000u;
  }
  return self->__constrainedVelocity;
}

- (const)_overridePresentationPoint
{
  return self->__overridePresentationPoint;
}

- (void)_getUnconstrainedPoint:(double *)a3 forConstrainedPoint:(const double *)a4
{
  __B[1] = *(double *)MEMORY[0x1E4F143B8];
  double v7 = [(_UIHyperInteractor *)self _region];
  [v7 _closestPoint:a3 toPoint:a4];

  size_t v8 = 8 * self->__dimensions;
  uint64_t v9 = memcmp(a3, a4, v8);
  if (v9)
  {
    double v10 = (double *)((char *)__B - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    id v11 = [(_UIHyperInteractor *)self _extender];
    [v11 _getExtentVector:v10 forUnconstrainedPoint:a4 closestPoint:a3];

    uint64_t v12 = cblas_dnrm2_NEWLAPACK();
    if (v13 == 0.0) {
      goto LABEL_5;
    }
    double v14 = v13;
    MEMORY[0x1F4188790](v12);
    v16 = (double *)((char *)__B - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    vDSP_vsubD(a3, 1, a4, 1, v16, 1, v17);
    vDSP_Length dimensions = self->__dimensions;
    __B[0] = _UIHyperFractionOfProjectionOnto(v16, v10, dimensions);
    vDSP_vsmulD(v10, 1, __B, v16, 1, dimensions);
    cblas_dnrm2_NEWLAPACK();
    double v20 = v19;
    double v21 = v19 / v14;
    if (v19 / v14 >= 1.0)
    {
LABEL_5:
      cblas_dcopy_NEWLAPACK();
    }
    else
    {
      [(_UIHyperInteractor *)self _rubberBandCoefficient];
      vDSP_Length v23 = self->__dimensions;
      __B[0] = v14 * ((-1.0 / (v21 + -1.0) + -1.0) / v22) / v20;
      vDSP_vsmaD(v16, 1, __B, a3, 1, a3, 1, v23);
    }
  }
}

- (double)_minimumSpeed
{
  return self->__minimumSpeed;
}

- (double)_decelerationRate
{
  return self->__decelerationRate;
}

- (double)_rubberBandCoefficient
{
  return self->__rubberBandCoefficient;
}

- (BOOL)_isInteractive
{
  return self->__interactive;
}

- (_UIHyperInteractorDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);
  return (_UIHyperInteractorDelegate *)WeakRetained;
}

- (const)_initialTranslation
{
  return self->__initialTranslation;
}

- (BOOL)_isOverridingPresentationPoint
{
  return self->__overridingPresentationPoint;
}

- (const)_lastConstrainedPoint
{
  return self->__lastConstrainedPoint;
}

- (id)_regionGetter
{
  return self->__regionGetter;
}

- (id)_extenderGetter
{
  return self->__extenderGetter;
}

- (id)_unconstrainedPointGetter
{
  return self->__unconstrainedPointGetter;
}

- (id)_presentationPointWasInvalidated
{
  return self->__presentationPointWasInvalidated;
}

- (const)_translation
{
  return self->__translation;
}

@end