@interface CRPairedRegionMutualGeometryInfo
- (BOOL)isCenterJustified;
- (CGVector)leadingOffsetAlongBaseline;
- (CGVector)leftOffsetAlongBaseline;
- (CGVector)rightOffsetAlongBaseline;
- (CGVector)trailingOffsetAlongBaseline;
- (double)inlineSpacingAlongBaseline;
- (id)initFromGeometryInfo1:(id)a3 geometryInfo2:(id)a4;
@end

@implementation CRPairedRegionMutualGeometryInfo

- (id)initFromGeometryInfo1:(id)a3 geometryInfo2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)CRPairedRegionMutualGeometryInfo;
  v8 = [(CRPairedRegionMutualGeometryInfo *)&v59 init];
  if (v8)
  {
    [v7 topLeft];
    double v10 = v9;
    [v6 topLeft];
    double v12 = v10 - v11;
    [v7 topLeft];
    double v14 = v13;
    [v6 topLeft];
    double v16 = v14 - v15;
    [v7 topRight];
    double v18 = v17;
    [v6 topRight];
    double v20 = v18 - v19;
    [v7 topRight];
    double v22 = v21;
    [v6 topRight];
    double v24 = v22 - v23;
    [v6 baselineVector];
    double v27 = sqrt(v25 * v25 + v26 * v26);
    [v6 baselineVector];
    double v29 = v28;
    [v6 baselineVector];
    double v31 = (v16 * v30 + v12 * v29) / v27;
    [v6 baselineVector];
    double v33 = v32;
    [v6 baselineVector];
    double v35 = (v24 * v34 + v20 * v33) / v27;
    *((double *)v8 + 5) = v35;
    *((double *)v8 + 3) = v31;
    *((double *)v8 + 4) = sqrt(round(v16 * v16 + v12 * v12) - round(v31 * v31));
    *((double *)v8 + 6) = sqrt(round(v24 * v24 + v20 * v20) - round(v35 * v35));
    if ([v6 layoutDirection] == 2 && objc_msgSend(v7, "layoutDirection") == 2)
    {
      *(float64x2_t *)(v8 + 56) = vnegq_f64(*(float64x2_t *)(v8 + 40));
      float64x2_t v36 = vnegq_f64(*(float64x2_t *)(v8 + 24));
    }
    else
    {
      *(_OWORD *)(v8 + 56) = *(_OWORD *)(v8 + 24);
      float64x2_t v36 = *(float64x2_t *)(v8 + 40);
    }
    *(float64x2_t *)(v8 + 72) = v36;
    [v6 size];
    double v38 = v31 - v37;
    [v7 size];
    *((double *)v8 + 2) = fmin(v38, fabs(v31) - v39);
    [v6 estimatedLineHeight];
    double v41 = v40;
    [v7 estimatedLineHeight];
    double v43 = (v41 + v42) * 0.5;
    [v6 midPoint];
    double v45 = v44;
    double v47 = v46;
    [v7 midPoint];
    double v50 = *MEMORY[0x1E4F1DB30];
    if (*MEMORY[0x1E4F1DB30] > 0.0)
    {
      double v51 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (v51 > 0.0)
      {
        double v45 = v45 * v50;
        double v47 = v47 * v51;
        double v48 = v48 * v50;
        double v49 = v49 * v51;
      }
    }
    double v52 = sqrt((v47 - v49) * (v47 - v49) + (v45 - v48) * (v45 - v48));
    [v6 size];
    double v54 = v53;
    [v7 size];
    double v56 = vabdd_f64(v54, v55);
    BOOL v57 = v56 / v43 > fmin((v52 + v52) / v43, 1.5);
    if (v52 >= v43 * 1.5 && (vabdd_f64(v31, v35) - v56 * 0.5) * 0.5 >= v43 * 0.5) {
      BOOL v57 = 0;
    }
    v8[8] = v57;
  }

  return v8;
}

- (CGVector)leftOffsetAlongBaseline
{
  objc_copyStruct(v4, &self->_leftOffsetAlongBaseline, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)rightOffsetAlongBaseline
{
  objc_copyStruct(v4, &self->_rightOffsetAlongBaseline, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)leadingOffsetAlongBaseline
{
  objc_copyStruct(v4, &self->_leadingOffsetAlongBaseline, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)trailingOffsetAlongBaseline
{
  objc_copyStruct(v4, &self->_trailingOffsetAlongBaseline, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (double)inlineSpacingAlongBaseline
{
  return self->_inlineSpacingAlongBaseline;
}

- (BOOL)isCenterJustified
{
  return self->_isCenterJustified;
}

@end