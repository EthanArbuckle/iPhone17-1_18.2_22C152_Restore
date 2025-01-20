@interface PXStoryMomentRecipeState
- (PXStoryMomentRecipeState)init;
- (PXStoryMomentRecipeState)initWithRandomNumberGenerator:(id)a3;
- (int64_t)nextEmptySpaceStrategy;
- (unint64_t)_nextModuleRecipeWithModuleClipRange:(_NSRange)a3 clipCatalog:(id)a4;
- (unint64_t)next2UpPanRelativeMotion;
- (unint64_t)next3UpPanRelativeMotion;
- (unint64_t)nextBaseMomentRecipe;
- (unint64_t)nextNUpPanRelativeMotionWithN:(int64_t)a3;
- (unint64_t)nextPanDirection;
- (unint64_t)nextRotateDirection;
- (unint64_t)nextScaleDirection;
- (unint64_t)nextSingleAssetMomentRecipe;
@end

@implementation PXStoryMomentRecipeState

- (void).cxx_destruct
{
}

- (int64_t)nextEmptySpaceStrategy
{
  int64_t v2 = 1;
  if (self->_previousEmptySpaceStrategy == 1) {
    int64_t v2 = 2;
  }
  self->_previousEmptySpaceStrategy = v2;
  return v2;
}

- (unint64_t)nextSingleAssetMomentRecipe
{
  unint64_t v2 = 7;
  if (self->_previousSingleAssetMomentRecipe == 7) {
    unint64_t v2 = 8;
  }
  self->_previousSingleAssetMomentRecipe = v2;
  return v2;
}

- (unint64_t)_nextModuleRecipeWithModuleClipRange:(_NSRange)a3 clipCatalog:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  if (!length)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXStoryMomentRecipeProvider.m", 133, @"Invalid parameter not satisfying: %@", @"moduleClipRange.length != 0" object file lineNumber description];
  }
  v9 = [v8 clipAtIndex:location];
  uint64_t v10 = [v9 moduleInfo];
  if ((unint64_t)(v10 - 1) > 1)
  {
    if (v10 != 3)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PXStoryMomentRecipeProvider.m" lineNumber:154 description:@"Unhandled module type"];

      abort();
    }
    unint64_t v11 = 6;
  }
  else
  {
    if (self->_previousPortraitMomentRecipe == 2
      || !+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", location, length, v8, 0))
    {
      unint64_t v11 = 6;
    }
    else
    {
      unint64_t v11 = 2;
    }
    self->_previousPortraitMomentRecipe = v11;
  }

  return v11;
}

- (unint64_t)nextBaseMomentRecipe
{
  basicRecipeFrequencyTable = self->_basicRecipeFrequencyTable;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PXStoryMomentRecipeState_nextBaseMomentRecipe__block_invoke;
  v7[3] = &unk_1E5DCC3E0;
  v7[4] = self;
  v4 = [(PFStoryAutoEditFrequencyTable *)basicRecipeFrequencyTable nextValuePassingTest:v7];
  unint64_t v5 = [v4 integerValue];
  self->_previousBaseMomentRecipe = v5;

  return v5;
}

BOOL __48__PXStoryMomentRecipeState_nextBaseMomentRecipe__block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] != *(void *)(*(void *)(a1 + 32) + 48);
}

- (unint64_t)nextRotateDirection
{
  unint64_t v2 = 1;
  if (self->_previousRotateDirection == 1) {
    unint64_t v2 = 2;
  }
  self->_previousRotateDirection = v2;
  return v2;
}

- (unint64_t)nextScaleDirection
{
  unint64_t v2 = 1;
  if (self->_previousScaleDirection != 2) {
    unint64_t v2 = 2;
  }
  self->_previousScaleDirection = v2;
  return v2;
}

- (unint64_t)nextNUpPanRelativeMotionWithN:(int64_t)a3
{
  if (a3 == 3)
  {
    return [(PXStoryMomentRecipeState *)self next3UpPanRelativeMotion];
  }
  else
  {
    if (a3 != 2)
    {
      uint64_t v13 = v4;
      uint64_t v14 = v3;
      v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v6, v5, v13, v14, v7, v8);
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryMomentRecipeProvider.m" lineNumber:104 description:@"N should be 2 or 3"];

      abort();
    }
    return [(PXStoryMomentRecipeState *)self next2UpPanRelativeMotion];
  }
}

- (unint64_t)next3UpPanRelativeMotion
{
  unint64_t v2 = 1;
  if (self->_previous3UpPanRelativeMotion != 2) {
    unint64_t v2 = 2;
  }
  self->_previous3UpPanRelativeMotion = v2;
  return v2;
}

- (unint64_t)next2UpPanRelativeMotion
{
  unint64_t v2 = 1;
  if (self->_previous2UpPanRelativeMotion != 2) {
    unint64_t v2 = 2;
  }
  self->_previous2UpPanRelativeMotion = v2;
  return v2;
}

- (unint64_t)nextPanDirection
{
  unint64_t v2 = 1;
  if (self->_previousPanDirection != 2) {
    unint64_t v2 = 2;
  }
  self->_previousPanDirection = v2;
  return v2;
}

- (PXStoryMomentRecipeState)initWithRandomNumberGenerator:(id)a3
{
  v22[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryMomentRecipeState;
  uint64_t v5 = [(PXStoryMomentRecipeState *)&v21 init];
  uint64_t v6 = (PXStoryMomentRecipeState *)v5;
  if (v5)
  {
    *((void *)v5 + 9) = 0;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    uint64_t v7 = +[PXStorySettings sharedInstance];
    [v7 scaleRecipeRelativeFrequency];
    uint64_t v9 = (uint64_t)(v8 * 10.0);
    [v7 panRecipeRelativeFrequency];
    uint64_t v11 = (uint64_t)(v10 * 10.0);
    [v7 exposeToBlackRecipeRelativeFrequency];
    uint64_t v13 = (uint64_t)(v12 * 10.0);
    v22[0] = &unk_1F02D6460;
    uint64_t v14 = [NSNumber numberWithInteger:v9];
    v22[1] = v14;
    v22[2] = &unk_1F02D6460;
    v15 = [NSNumber numberWithInteger:v11];
    v22[3] = v15;
    v16 = [NSNumber numberWithInteger:v13];
    v22[4] = v16;
    v22[5] = &unk_1F02D6460;
    v22[6] = &unk_1F02D6460;
    v22[7] = &unk_1F02D6460;
    v22[8] = &unk_1F02D6460;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:9];

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v17 randomNumberGenerator:v4 fallbackValue:&unk_1F02D6478];
    basicRecipeFrequencyTable = v6->_basicRecipeFrequencyTable;
    v6->_basicRecipeFrequencyTable = (PFStoryAutoEditFrequencyTable *)v18;
  }
  return v6;
}

- (PXStoryMomentRecipeState)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMomentRecipeProvider.m", 43, @"%s is not available as initializer", "-[PXStoryMomentRecipeState init]");

  abort();
}

@end