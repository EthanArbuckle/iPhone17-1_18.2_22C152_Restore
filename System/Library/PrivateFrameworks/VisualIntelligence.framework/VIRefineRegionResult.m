@interface VIRefineRegionResult
- (NSArray)refinedRegions;
- (VIRefineRegionResult)initWithRefinedRegions:(id)a3 version:(unint64_t)a4;
- (unint64_t)version;
@end

@implementation VIRefineRegionResult

- (VIRefineRegionResult)initWithRefinedRegions:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VIRefineRegionResult;
  v7 = [(VIRefineRegionResult *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    refinedRegions = v7->_refinedRegions;
    v7->_refinedRegions = (NSArray *)v8;

    v7->_version = a4;
  }

  return v7;
}

- (NSArray)refinedRegions
{
  return self->_refinedRegions;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end