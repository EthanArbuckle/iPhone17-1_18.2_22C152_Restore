@interface SBTouchTemplate
- (unint64_t)matchesPolygon:(id)a3 matchTransformsAllowed:(unint64_t)a4 acceptanceFactor:(double)a5 outMorphedCandidate:(id *)a6;
@end

@implementation SBTouchTemplate

- (unint64_t)matchesPolygon:(id)a3 matchTransformsAllowed:(unint64_t)a4 acceptanceFactor:(double)a5 outMorphedCandidate:(id *)a6
{
  char v8 = a4;
  id v10 = a3;
  unint64_t v11 = [(SBPolygon *)self pointCount];
  if (v11 > [v10 pointCount])
  {
    unint64_t v12 = 0;
    goto LABEL_29;
  }
  unint64_t v13 = [(SBPolygon *)self pointCount];
  if (v13 < [v10 pointCount])
  {
    unint64_t v12 = 2;
    goto LABEL_29;
  }
  v14 = [SBPolygon alloc];
  v15 = [v10 _points];
  v16 = [(SBPolygon *)v14 initWithPoints:v15];

  if ((v8 & 8) != 0)
  {
    BOOL v17 = [(SBPolygon *)self _isLeftHanded];
    if (v17 != [(SBPolygon *)v16 _isLeftHanded]) {
      [(SBPolygon *)v16 _flipHorizontally];
    }
  }
  if (v8)
  {
    [(SBPolygon *)self _meanFingertipRowAngle];
    double v36 = v35;
    [(SBPolygon *)v16 _meanFingertipRowAngle];
    [(SBPolygon *)v16 _rotate:v36 - v37];
    if ((v8 & 2) == 0)
    {
LABEL_10:
      if ((v8 & 4) == 0) {
        goto LABEL_11;
      }
LABEL_22:
      [(SBPolygon *)self _weightedCentroid];
      double v44 = v43;
      double v46 = v45;
      [(SBPolygon *)v16 _weightedCentroid];
      -[SBPolygon _translate:](v16, "_translate:", v44 - v47, v46 - v48);
      if (!a6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_10;
  }
  [(SBPolygon *)self _meanRadius];
  double v39 = v38;
  [(SBPolygon *)v16 _meanRadius];
  double v41 = v39 / v40;
  double v42 = 1.5;
  if (v41 <= 1.5)
  {
    double v42 = v41;
    if (v41 < 0.444444444) {
      double v42 = 0.444444444;
    }
  }
  [(SBPolygon *)v16 _scale:v42];
  if ((v8 & 4) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if (a6) {
LABEL_12:
  }
    *a6 = v16;
LABEL_13:
  uint64_t v18 = [v10 pointCount];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    float v21 = 0.0;
    float v22 = 0.0;
    do
    {
      [(SBPolygon *)self _pointAtIndex:v20];
      double v24 = v23;
      double v26 = v25;
      [(SBPolygon *)v16 _pointAtIndex:v20];
      double v28 = v27;
      double v30 = v29;
      [(SBPolygon *)self _weightAtIndex:v20];
      *(float *)&double v31 = v31;
      *(float *)&double v31 = *(float *)&v31 * *(float *)&v31;
      float v32 = v28 - v24;
      float v33 = v30 - v26;
      float v22 = v22 + *(float *)&v31 * (float)((float)(v32 * v32) + (float)(v33 * v33));
      float v21 = v21 + *(float *)&v31;
      ++v20;
    }
    while (v19 != v20);
    float v34 = v22 / v21;
  }
  else
  {
    float v34 = NAN;
  }
  if (a5 * 55.0 > sqrtf(v34)) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = 2;
  }

LABEL_29:
  return v12;
}

@end