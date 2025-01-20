@interface _NUVisionInstanceSegmentationResult
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)fullExtentForInstance:(SEL)a3;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)fullExtentForInstances:(SEL)a3;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)tightBoundsForInstance:(SEL)a3;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)tightBoundsForInstances:(SEL)a3;
- (BOOL)usingTargetPoints;
- (CGSize)observationScale;
- (NSDictionary)perInstanceProperties;
- (NSIndexSet)backgroundInstances;
- (NSIndexSet)foregroundInstances;
- (NSIndexSet)gatedInstances;
- (NSIndexSet)instances;
- (VNInstanceMaskObservation)observation;
- (_NUVisionInstanceSegmentationResult)initWithObservation:(id)a3 usingTargetPoints:(BOOL)a4 observationOrientation:(int64_t)a5 observationScale:(CGSize)a6 perInstanceProperties:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)instancesForCategory:(id)a3;
- (id)newMaskForInstance:(unint64_t)a3 error:(id *)a4;
- (id)newMaskForInstances:(id)a3 error:(id *)a4;
- (int64_t)observationOrientation;
- (void)setObservationOrientation:(int64_t)a3;
- (void)setObservationScale:(CGSize)a3;
- (void)setUsingTargetPoints:(BOOL)a3;
@end

@implementation _NUVisionInstanceSegmentationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatedInstances, 0);
  objc_storeStrong((id *)&self->_perInstanceProperties, 0);

  objc_storeStrong((id *)&self->_observation, 0);
}

- (NSIndexSet)gatedInstances
{
  return self->_gatedInstances;
}

- (NSDictionary)perInstanceProperties
{
  return self->_perInstanceProperties;
}

- (void)setObservationScale:(CGSize)a3
{
  self->_observationScale = a3;
}

- (CGSize)observationScale
{
  double width = self->_observationScale.width;
  double height = self->_observationScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setObservationOrientation:(int64_t)a3
{
  self->_observationOrientation = a3;
}

- (int64_t)observationOrientation
{
  return self->_observationOrientation;
}

- (void)setUsingTargetPoints:(BOOL)a3
{
  self->_usingTargetPoints = a3;
}

- (BOOL)usingTargetPoints
{
  return self->_usingTargetPoints;
}

- (VNInstanceMaskObservation)observation
{
  return self->_observation;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)fullExtentForInstance:(SEL)a3
{
  id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
  [(_NUVisionInstanceSegmentationResult *)self fullExtentForInstances:v6];

  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)tightBoundsForInstance:(SEL)a3
{
  id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
  [(_NUVisionInstanceSegmentationResult *)self tightBoundsForInstances:v6];

  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)fullExtentForInstances:(SEL)a3
{
  id v6 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x4010000000;
  v13 = &unk_1A9AA79AF;
  long long v14 = NUPixelRectNull;
  long long v15 = unk_1A9A743E8;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62___NUVisionInstanceSegmentationResult_fullExtentForInstances___block_invoke;
  v9[3] = &unk_1E5D944D0;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateIndexesUsingBlock:v9];
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = ($0AC6E346AE4835514AAA8AC86D8F4844)*((_OWORD *)v11 + 3);
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)*((_OWORD *)v11 + 2);
  retstr->var1 = v7;
  _Block_object_dispose(&v10, 8);

  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)tightBoundsForInstances:(SEL)a3
{
  id v6 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x4010000000;
  v13 = &unk_1A9AA79AF;
  long long v14 = NUPixelRectNull;
  long long v15 = unk_1A9A743E8;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63___NUVisionInstanceSegmentationResult_tightBoundsForInstances___block_invoke;
  v9[3] = &unk_1E5D944D0;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateIndexesUsingBlock:v9];
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = ($0AC6E346AE4835514AAA8AC86D8F4844)*((_OWORD *)v11 + 3);
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)*((_OWORD *)v11 + 2);
  retstr->var1 = v7;
  _Block_object_dispose(&v10, 8);

  return result;
}

- (id)newMaskForInstance:(unint64_t)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  id v7 = [(_NUVisionInstanceSegmentationResult *)self newMaskForInstances:v6 error:a4];

  return v7;
}

- (id)newMaskForInstances:(id)a3 error:(id *)a4
{
  observation = self->_observation;
  id v7 = a3;
  uint64_t v8 = [(_NUVisionInstanceSegmentationResult *)self observationOrientation];
  [(_NUVisionInstanceSegmentationResult *)self observationScale];
  v11 = GenerateMaskForInstances(v7, observation, v8, a4, v9, v10);

  return v11;
}

- (NSIndexSet)backgroundInstances
{
  observation = self->_observation;
  uint64_t v3 = *MEMORY[0x1E4F45CA8];
  uint64_t v6 = 0;
  v4 = [(VNInstanceMaskObservation *)observation instancesForFeature:v3 error:&v6];
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return (NSIndexSet *)v4;
}

- (id)instancesForCategory:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    observation = self->_observation;
    id v9 = 0;
    uint64_t v6 = [(VNInstanceMaskObservation *)observation instancesForCategory:v4 error:&v9];
    id v7 = v9;
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F28D60] indexSet];
LABEL_6:

  return v6;
}

- (NSIndexSet)foregroundInstances
{
  observation = self->_observation;
  uint64_t v3 = *MEMORY[0x1E4F45CB0];
  uint64_t v6 = 0;
  id v4 = [(VNInstanceMaskObservation *)observation instancesForFeature:v3 error:&v6];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return (NSIndexSet *)v4;
}

- (NSIndexSet)instances
{
  if ([(_NUVisionInstanceSegmentationResult *)self usingTargetPoints])
  {
    uint64_t v3 = [(VNInstanceMaskObservation *)self->_observation allInstances];
  }
  else
  {
    id v4 = [(_NUVisionInstanceSegmentationResult *)self backgroundInstances];
    v5 = (void *)[v4 mutableCopy];

    uint64_t v6 = [(_NUVisionInstanceSegmentationResult *)self foregroundInstances];
    [v5 addIndexes:v6];

    uint64_t v3 = (void *)[v5 copy];
  }

  return (NSIndexSet *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = (void *)[(VNInstanceMaskObservation *)self->_observation copyWithZone:a3];
  BOOL usingTargetPoints = self->_usingTargetPoints;
  int64_t v8 = [(_NUVisionInstanceSegmentationResult *)self observationOrientation];
  [(_NUVisionInstanceSegmentationResult *)self observationScale];
  double v10 = v9;
  double v12 = v11;
  v13 = [(_NUVisionInstanceSegmentationResult *)self perInstanceProperties];
  long long v14 = objc_msgSend(v5, "initWithObservation:usingTargetPoints:observationOrientation:observationScale:perInstanceProperties:", v6, usingTargetPoints, v8, v13, v10, v12);

  uint64_t v15 = [(NSIndexSet *)self->_gatedInstances copyWithZone:a3];
  v16 = (void *)v14[6];
  v14[6] = v15;

  return v14;
}

- (_NUVisionInstanceSegmentationResult)initWithObservation:(id)a3 usingTargetPoints:(BOOL)a4 observationOrientation:(int64_t)a5 observationScale:(CGSize)a6 perInstanceProperties:(id)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  v13 = (VNInstanceMaskObservation *)a3;
  id v14 = a7;
  v33.receiver = self;
  v33.super_class = (Class)_NUVisionInstanceSegmentationResult;
  uint64_t v15 = [(_NUVisionInstanceSegmentationResult *)&v33 init];
  observation = v15->_observation;
  v15->_observation = v13;
  v17 = v13;

  v15->_BOOL usingTargetPoints = a4;
  v15->_observationOrientation = a5;
  v15->_observationScale.CGFloat width = width;
  v15->_observationScale.CGFloat height = height;
  uint64_t v18 = [v14 copy];
  perInstanceProperties = v15->_perInstanceProperties;
  v15->_perInstanceProperties = (NSDictionary *)v18;

  +[NUGlobalSettings inpaintMinimumArea];
  uint64_t v21 = v20;
  +[NUGlobalSettings inpaintMaximumArea];
  uint64_t v23 = v22;
  v24 = [(VNInstanceMaskObservation *)v17 allInstances];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __139___NUVisionInstanceSegmentationResult_initWithObservation_usingTargetPoints_observationOrientation_observationScale_perInstanceProperties___block_invoke;
  v29[3] = &unk_1E5D944A8;
  id v30 = v14;
  uint64_t v31 = v21;
  uint64_t v32 = v23;
  id v25 = v14;
  uint64_t v26 = [v24 indexesPassingTest:v29];
  gatedInstances = v15->_gatedInstances;
  v15->_gatedInstances = (NSIndexSet *)v26;

  return v15;
}

@end