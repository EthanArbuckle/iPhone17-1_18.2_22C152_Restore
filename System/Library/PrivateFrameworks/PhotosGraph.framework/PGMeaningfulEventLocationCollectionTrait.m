@interface PGMeaningfulEventLocationCollectionTrait
- (BOOL)skipNegativeRequirementForMissingLocation;
- (BOOL)useStrictNegativeNodesMatching;
- (PGMeaningfulEventLocationCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4;
- (void)setSkipNegativeRequirementForMissingLocation:(BOOL)a3;
- (void)setUseStrictNegativeNodesMatching:(BOOL)a3;
@end

@implementation PGMeaningfulEventLocationCollectionTrait

- (void)setSkipNegativeRequirementForMissingLocation:(BOOL)a3
{
  self->_skipNegativeRequirementForMissingLocation = a3;
}

- (BOOL)skipNegativeRequirementForMissingLocation
{
  return self->_skipNegativeRequirementForMissingLocation;
}

- (void)setUseStrictNegativeNodesMatching:(BOOL)a3
{
  self->_useStrictNegativeNodesMatching = a3;
}

- (BOOL)useStrictNegativeNodesMatching
{
  return self->_useStrictNegativeNodesMatching;
}

- (PGMeaningfulEventLocationCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventLocationCollectionTrait;
  result = [(PGMeaningfulEventCollectionTrait *)&v5 initWithNodes:a3 negativeNodes:a4];
  if (result)
  {
    result->_useStrictNegativeNodesMatching = 1;
    result->_skipNegativeRequirementForMissingLocation = 0;
  }
  return result;
}

@end