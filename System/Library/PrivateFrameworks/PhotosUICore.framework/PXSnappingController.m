@interface PXSnappingController
- (BOOL)_hasEnteredAttractionThreshold;
- (BOOL)_hasEnteredRetentionThreshold;
- (BOOL)_isOffset:(double)a3 inThreshold:(double)a4;
- (BOOL)_isPreviousOffsetInvalid;
- (BOOL)accumulateOffsetWhileSnapped;
- (BOOL)isSnappedToTarget;
- (PXSnappingController)init;
- (PXSnappingController)initWithSnappingTarget:(double)a3;
- (double)_accumulatedOffset;
- (double)_previousOffset;
- (double)attractionOffsetThreshold;
- (double)attractionVelocityThreshold;
- (double)retentionOffsetThreshold;
- (double)snappingTarget;
- (void)_reset;
- (void)_setAccumulatedOffset:(double)a3;
- (void)_setBoolPointer:(BOOL *)a3 toValue:(BOOL)a4;
- (void)_setHasEnteredAttractionThreshold:(BOOL)a3;
- (void)_setHasEnteredRetentionThreshold:(BOOL)a3;
- (void)_setPreviousOffset:(double)a3;
- (void)_setPreviousOffsetInvalid:(BOOL)a3;
- (void)setAccumulateOffsetWhileSnapped:(BOOL)a3;
- (void)setAttractionOffsetThreshold:(double)a3;
- (void)setAttractionVelocityThreshold:(double)a3;
- (void)setRetentionOffsetThreshold:(double)a3;
- (void)updateOffset:(double *)a3 withVelocity:(double)a4 shouldSnap:(BOOL *)a5 shouldBreak:(BOOL *)a6;
@end

@implementation PXSnappingController

- (void)_setAccumulatedOffset:(double)a3
{
  self->__accumulatedOffset = a3;
}

- (double)_accumulatedOffset
{
  return self->__accumulatedOffset;
}

- (void)_setPreviousOffsetInvalid:(BOOL)a3
{
  self->__previousOffsetInvalid = a3;
}

- (BOOL)_isPreviousOffsetInvalid
{
  return self->__previousOffsetInvalid;
}

- (void)_setPreviousOffset:(double)a3
{
  self->__previousOffset = a3;
}

- (double)_previousOffset
{
  return self->__previousOffset;
}

- (void)_setHasEnteredRetentionThreshold:(BOOL)a3
{
  self->__hasEnteredRetentionThreshold = a3;
}

- (BOOL)_hasEnteredRetentionThreshold
{
  return self->__hasEnteredRetentionThreshold;
}

- (void)_setHasEnteredAttractionThreshold:(BOOL)a3
{
  self->__hasEnteredAttractionThreshold = a3;
}

- (BOOL)_hasEnteredAttractionThreshold
{
  return self->__hasEnteredAttractionThreshold;
}

- (BOOL)isSnappedToTarget
{
  return self->_snappedToTarget;
}

- (void)setAccumulateOffsetWhileSnapped:(BOOL)a3
{
  self->_accumulateOffsetWhileSnapped = a3;
}

- (BOOL)accumulateOffsetWhileSnapped
{
  return self->_accumulateOffsetWhileSnapped;
}

- (double)attractionVelocityThreshold
{
  return self->_attractionVelocityThreshold;
}

- (double)attractionOffsetThreshold
{
  return self->_attractionOffsetThreshold;
}

- (double)retentionOffsetThreshold
{
  return self->_retentionOffsetThreshold;
}

- (double)snappingTarget
{
  return self->_snappingTarget;
}

- (void)updateOffset:(double *)a3 withVelocity:(double)a4 shouldSnap:(BOOL *)a5 shouldBreak:(BOOL *)a6
{
  if ([(PXSnappingController *)self _isPreviousOffsetInvalid])
  {
    double v11 = *a3;
    double v12 = *a3;
  }
  else
  {
    [(PXSnappingController *)self _previousOffset];
    double v12 = v13;
    double v11 = *a3;
  }
  [(PXSnappingController *)self _accumulatedOffset];
  double v15 = v14;
  [(PXSnappingController *)self retentionOffsetThreshold];
  int v17 = [(PXSnappingController *)self _isOffset:v12 inThreshold:v16];
  [(PXSnappingController *)self attractionOffsetThreshold];
  int v19 = [(PXSnappingController *)self _isOffset:v12 inThreshold:v18];
  [(PXSnappingController *)self retentionOffsetThreshold];
  int v21 = [(PXSnappingController *)self _isOffset:v11 + v15 inThreshold:v20];
  [(PXSnappingController *)self attractionOffsetThreshold];
  int v23 = [(PXSnappingController *)self _isOffset:v11 inThreshold:v22];
  if (v19 != v23) {
    [(PXSnappingController *)self _setHasEnteredAttractionThreshold:v23 & (v19 ^ 1u)];
  }
  if (v17 != v21) {
    [(PXSnappingController *)self _setHasEnteredRetentionThreshold:v21 & ~v17];
  }
  BOOL v24 = ![(PXSnappingController *)self _hasEnteredRetentionThreshold]
     && [(PXSnappingController *)self isSnappedToTarget];
  if ([(PXSnappingController *)self _hasEnteredRetentionThreshold]) {
    BOOL v25 = [(PXSnappingController *)self isSnappedToTarget];
  }
  else {
    BOOL v25 = 0;
  }
  if (![(PXSnappingController *)self _hasEnteredAttractionThreshold]) {
    goto LABEL_27;
  }
  BOOL v26 = [(PXSnappingController *)self isSnappedToTarget];
  if (v26) {
    goto LABEL_27;
  }
  BOOL v27 = v26;
  [(PXSnappingController *)self attractionVelocityThreshold];
  if (v28 <= 0.0) {
    goto LABEL_26;
  }
  [(PXSnappingController *)self attractionVelocityThreshold];
  double v30 = v29;
  if (a4 >= 0.0)
  {
    BOOL v32 = 0;
  }
  else
  {
    [(PXSnappingController *)self snappingTarget];
    BOOL v32 = v11 > v31;
  }
  int v33 = !v27;
  double v34 = fabs(a4);
  if (a4 <= 0.0)
  {
    BOOL v36 = 0;
  }
  else
  {
    [(PXSnappingController *)self snappingTarget];
    BOOL v36 = v11 < v35;
  }
  int v37 = v32 || v36;
  if (v34 > v30) {
    int v37 = 0;
  }
  if ((v37 & v33) == 1)
  {
LABEL_26:
    [(PXSnappingController *)self didSnapByAttraction];
  }
  else
  {
LABEL_27:
    if (!v25) {
      goto LABEL_31;
    }
  }
  [(PXSnappingController *)self snappingTarget];
  double v11 = v38;
  self->_snappedToTarget = 1;
  [(PXSnappingController *)self _setBoolPointer:a5 toValue:1];
  [(PXSnappingController *)self _setHasEnteredRetentionThreshold:1];
  [(PXSnappingController *)self _setHasEnteredAttractionThreshold:1];
  if (v25 && [(PXSnappingController *)self accumulateOffsetWhileSnapped])
  {
    double v39 = *a3;
    [(PXSnappingController *)self snappingTarget];
    double v41 = v39 - v40;
    [(PXSnappingController *)self _accumulatedOffset];
    [(PXSnappingController *)self _setAccumulatedOffset:v42 + v41];
  }
LABEL_31:
  if (v24)
  {
    [(PXSnappingController *)self _setBoolPointer:a6 toValue:1];
    [(PXSnappingController *)self _reset];
  }
  else
  {
    [(PXSnappingController *)self _setPreviousOffset:*a3];
    [(PXSnappingController *)self _setPreviousOffsetInvalid:0];
  }
  *a3 = v11;
}

- (void)_reset
{
  self->_snappedToTarget = 0;
  [(PXSnappingController *)self _setAccumulatedOffset:0.0];
  [(PXSnappingController *)self _setPreviousOffsetInvalid:1];
  [(PXSnappingController *)self _setHasEnteredRetentionThreshold:0];
  [(PXSnappingController *)self _setHasEnteredAttractionThreshold:0];
}

- (void)_setBoolPointer:(BOOL *)a3 toValue:(BOOL)a4
{
  if (a3) {
    *a3 = a4;
  }
}

- (BOOL)_isOffset:(double)a3 inThreshold:(double)a4
{
  [(PXSnappingController *)self snappingTarget];
  return vabdd_f64(a3, v6) < a4;
}

- (void)setAttractionVelocityThreshold:(double)a3
{
  if (a3 < 0.0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSnappingController.m", 46, @"Invalid parameter not satisfying: %@", @"attractionVelocityThreshold >= 0" object file lineNumber description];
  }
  self->_attractionVelocityThreshold = a3;
}

- (void)setAttractionOffsetThreshold:(double)a3
{
  if (a3 < 0.0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSnappingController.m", 41, @"Invalid parameter not satisfying: %@", @"attractionOffsetThreshold >= 0" object file lineNumber description];
  }
  self->_attractionOffsetThreshold = a3;
}

- (void)setRetentionOffsetThreshold:(double)a3
{
  if (a3 < 0.0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSnappingController.m", 36, @"Invalid parameter not satisfying: %@", @"retentionOffsetThreshold >= 0" object file lineNumber description];
  }
  self->_retentionOffsetThreshold = a3;
}

- (PXSnappingController)initWithSnappingTarget:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSnappingController;
  result = [(PXSnappingController *)&v5 init];
  if (result)
  {
    result->__previousOffsetInvalid = 1;
    result->_snappingTarget = a3;
  }
  return result;
}

- (PXSnappingController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSnappingController.m", 24, @"%s is not available as initializer", "-[PXSnappingController init]");

  abort();
}

@end