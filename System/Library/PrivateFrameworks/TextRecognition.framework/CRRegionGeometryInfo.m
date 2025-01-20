@interface CRRegionGeometryInfo
- (CGSize)cachedSize;
- (CGVector)baselineVector;
- (double)estimatedLineHeight;
- (id)initFromRegion:(id)a3 layoutDirection:(unint64_t)a4;
- (id)mutualGeometryInfoWith:(id)a3;
- (unint64_t)layoutDirection;
- (void)setCachedSize:(CGSize)a3;
- (void)setEstimatedLineHeight:(double)a3;
- (void)setLayoutDirection:(unint64_t)a3;
@end

@implementation CRRegionGeometryInfo

- (id)initFromRegion:(id)a3 layoutDirection:(unint64_t)a4
{
  id v5 = a3;
  v6 = [v5 boundingQuad];
  v7 = [v6 denormalizedQuad];
  [v7 topLeft];
  double v9 = v8;
  double v11 = v10;
  v12 = [v5 boundingQuad];
  v13 = [v12 denormalizedQuad];
  [v13 topRight];
  double v15 = v14;
  double v17 = v16;
  v18 = [v5 boundingQuad];
  v19 = [v18 denormalizedQuad];
  [v19 bottomRight];
  double v21 = v20;
  double v23 = v22;
  v24 = [v5 boundingQuad];

  v25 = [v24 denormalizedQuad];
  [v25 bottomLeft];
  v40.receiver = self;
  v40.super_class = (Class)CRRegionGeometryInfo;
  v28 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](&v40, sel_initWithTopLeft_topRight_bottomRight_bottomLeft_, v9, v11, v15, v17, v21, v23, v26, v27);

  if (v28)
  {
    [(CRRegionGeometryInfo *)v28 setLayoutDirection:a4];
    v39.receiver = v28;
    v39.super_class = (Class)CRRegionGeometryInfo;
    [(CRImageSpaceQuad *)&v39 size];
    -[CRRegionGeometryInfo setCachedSize:](v28, "setCachedSize:");
    [(CRRegionGeometryInfo *)v28 size];
    [(CRRegionGeometryInfo *)v28 setEstimatedLineHeight:v29];
    [(CRImageSpaceQuad *)v28 bottomRight];
    double v31 = v30;
    [(CRImageSpaceQuad *)v28 bottomLeft];
    CGFloat v33 = v31 - v32;
    [(CRImageSpaceQuad *)v28 bottomRight];
    double v35 = v34;
    [(CRImageSpaceQuad *)v28 bottomLeft];
    v28->_baselineVector.dx = v33;
    v28->_baselineVector.dy = v35 - v36;
  }
  return v28;
}

- (id)mutualGeometryInfoWith:(id)a3
{
  id v4 = a3;
  id v5 = [[CRPairedRegionMutualGeometryInfo alloc] initFromGeometryInfo1:self geometryInfo2:v4];

  return v5;
}

- (CGSize)cachedSize
{
  objc_copyStruct(v4, &self->cachedSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCachedSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->cachedSize, &v3, 16, 1, 0);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (double)estimatedLineHeight
{
  return self->_estimatedLineHeight;
}

- (void)setEstimatedLineHeight:(double)a3
{
  self->_estimatedLineHeight = a3;
}

- (CGVector)baselineVector
{
  objc_copyStruct(v4, &self->_baselineVector, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

@end