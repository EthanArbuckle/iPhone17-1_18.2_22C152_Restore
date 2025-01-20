@interface PLUtilityAssetClassification
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingBox;
- (double)confidence;
- (int64_t)classificationType;
- (int64_t)packedBoundingBox;
- (unint64_t)extendedSceneIdentifier;
- (unint64_t)hash;
- (void)_prepareForRecycle;
- (void)setClassificationType:(int64_t)a3;
- (void)setConfidence:(double)a3;
- (void)setExtendedSceneIdentifier:(unint64_t)a3;
- (void)setPackedBoundingBox:(int64_t)a3;
@end

@implementation PLUtilityAssetClassification

- (void)setClassificationType:(int64_t)a3
{
  self->_classificationType = a3;
}

- (int64_t)classificationType
{
  return self->_classificationType;
}

- (void)setExtendedSceneIdentifier:(unint64_t)a3
{
  self->_extendedSceneIdentifier = a3;
}

- (unint64_t)extendedSceneIdentifier
{
  return self->_extendedSceneIdentifier;
}

- (void)setPackedBoundingBox:(int64_t)a3
{
  self->_packedBoundingBox = a3;
}

- (int64_t)packedBoundingBox
{
  return self->_packedBoundingBox;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (CGRect)boundingBox
{
  long long v6 = *MEMORY[0x1E4F1DB28];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  [(PLUtilityAssetClassification *)self packedBoundingBox];
  PLSplitToCGRectFromInt64();
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = *((double *)&v7 + 1);
  double v4 = *(double *)&v7;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUtilityAssetClassification *)self extendedSceneIdentifier];
  [(PLUtilityAssetClassification *)self confidence];
  unint64_t v5 = (unint64_t)v4;
  int64_t v6 = v3 ^ [(PLUtilityAssetClassification *)self classificationType];
  return v6 ^ [(PLUtilityAssetClassification *)self packedBoundingBox] ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PLUtilityAssetClassification *)a3;
  if (v4 == self)
  {
    BOOL v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(PLUtilityAssetClassification *)self extendedSceneIdentifier];
      if (v6 == [(PLUtilityAssetClassification *)v5 extendedSceneIdentifier]
        && ([(PLUtilityAssetClassification *)self confidence],
            double v8 = v7,
            [(PLUtilityAssetClassification *)v5 confidence],
            v8 == v9)
        && (int64_t v10 = [(PLUtilityAssetClassification *)self classificationType],
            v10 == [(PLUtilityAssetClassification *)v5 classificationType]))
      {
        [(PLUtilityAssetClassification *)self boundingBox];
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        [(PLUtilityAssetClassification *)v5 boundingBox];
        v26.origin.x = v19;
        v26.origin.y = v20;
        v26.size.width = v21;
        v26.size.height = v22;
        v25.origin.x = v12;
        v25.origin.y = v14;
        v25.size.width = v16;
        v25.size.height = v18;
        BOOL v23 = CGRectEqualToRect(v25, v26);
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (void)_prepareForRecycle
{
  *(_OWORD *)&self->_extendedSceneIdentifier = 0u;
  *(_OWORD *)&self->_confidence = 0u;
}

@end