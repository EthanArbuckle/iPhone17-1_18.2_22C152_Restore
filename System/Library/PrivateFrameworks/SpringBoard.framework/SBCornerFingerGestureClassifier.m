@interface SBCornerFingerGestureClassifier
- (BOOL)classifySwipeWithOffsettedAngle:(double)a3 distanceToCorner:(double)a4 portrait:(BOOL)a5;
- (SBCornerFingerGestureClassifier)initWithSettings:(id)a3;
@end

@implementation SBCornerFingerGestureClassifier

- (SBCornerFingerGestureClassifier)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCornerFingerGestureClassifier;
  v6 = [(SBCornerFingerGestureClassifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (BOOL)classifySwipeWithOffsettedAngle:(double)a3 distanceToCorner:(double)a4 portrait:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3 < -180.0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBCornerFingerGestureClassifier.m", 79, @"Invalid parameter not satisfying: %@", @"offsettedAngleDeg >= -180" object file lineNumber description];
  }
  if (a3 > 180.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBCornerFingerGestureClassifier.m", 80, @"Invalid parameter not satisfying: %@", @"offsettedAngleDeg <= 180" object file lineNumber description];
  }
  v10 = [(SBCornerFingerPanGestureSettings *)self->_settings angleDegreesAscendingLUT:v5];
  v11 = [(SBCornerFingerPanGestureSettings *)self->_settings distanceMillimetersValues:v5];
  uint64_t v12 = [(SBCornerFingerPanGestureSettings *)self->_settings vectorCount:v5];
  if (v10)
  {
    if (v11) {
      goto LABEL_7;
    }
LABEL_13:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBCornerFingerGestureClassifier.m" lineNumber:85 description:@"null distVals"];

    if (v12) {
      goto LABEL_8;
    }
LABEL_14:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBCornerFingerGestureClassifier.m" lineNumber:86 description:@"invalid vectorCount"];

    goto LABEL_8;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2 object:self file:@"SBCornerFingerGestureClassifier.m" lineNumber:84 description:@"null angleLUT"];

  if (!v11) {
    goto LABEL_13;
  }
LABEL_7:
  if (!v12) {
    goto LABEL_14;
  }
LABEL_8:
  if (*v10 >= a3 || v10[v12 - 1] <= a3) {
    return 0;
  }
  indexingAscendingLUT(v10, v12, a3);
  return resampleLinearInterpolation((uint64_t)v11, v12, v13) > a4;
}

- (void).cxx_destruct
{
}

@end