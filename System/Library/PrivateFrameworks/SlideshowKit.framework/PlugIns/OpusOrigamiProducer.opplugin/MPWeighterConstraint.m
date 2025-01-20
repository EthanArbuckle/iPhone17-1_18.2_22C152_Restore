@interface MPWeighterConstraint
- (MPWeighterConstraint)init;
- (NSArray)maxAspectRatios;
- (NSArray)minAspectRatios;
- (NSArray)tags;
- (NSDictionary)nextConstraints;
- (NSString)presetID;
- (void)dealloc;
- (void)setMaxAspectRatios:(id)a3;
- (void)setMinAspectRatios:(id)a3;
- (void)setNextConstraints:(id)a3;
- (void)setPresetID:(id)a3;
- (void)setTags:(id)a3;
@end

@implementation MPWeighterConstraint

- (MPWeighterConstraint)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPWeighterConstraint;
  result = [(MPWeighterConstraint *)&v3 init];
  if (result)
  {
    result->allPanoramas = 0;
    result->hasPanorama = 0;
    *(_OWORD *)&result->numOfImages = 0u;
    *(_OWORD *)&result->presetID = 0u;
    *(_WORD *)&result->moviesOnly = 0;
    *(_OWORD *)&result->wideLandscape = 0u;
    *(_OWORD *)&result->landscape = 0u;
    *(_OWORD *)&result->hPanoramas = 0u;
    result->minAspectRatios = 0;
    result->tags = 0;
    result->maxAspectRatios = 0;
    *(_WORD *)&result->tagsOnSourceOnly = 0;
  }
  return result;
}

- (void)dealloc
{
  self->nextConstraints = 0;
  self->presetID = 0;

  self->maxAspectRatios = 0;
  self->minAspectRatios = 0;

  self->tags = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPWeighterConstraint;
  [(MPWeighterConstraint *)&v3 dealloc];
}

- (NSDictionary)nextConstraints
{
  return self->nextConstraints;
}

- (void)setNextConstraints:(id)a3
{
}

- (NSString)presetID
{
  return self->presetID;
}

- (void)setPresetID:(id)a3
{
}

- (NSArray)maxAspectRatios
{
  return self->maxAspectRatios;
}

- (void)setMaxAspectRatios:(id)a3
{
}

- (NSArray)minAspectRatios
{
  return self->minAspectRatios;
}

- (void)setMinAspectRatios:(id)a3
{
}

- (NSArray)tags
{
  return self->tags;
}

- (void)setTags:(id)a3
{
}

@end