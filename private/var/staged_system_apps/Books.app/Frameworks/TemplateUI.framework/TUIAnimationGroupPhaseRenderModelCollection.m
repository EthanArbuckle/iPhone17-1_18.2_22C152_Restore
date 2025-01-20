@interface TUIAnimationGroupPhaseRenderModelCollection
- (NSDictionary)phaseRenderModels;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPhaseRenderModels:(id)a3;
@end

@implementation TUIAnimationGroupPhaseRenderModelCollection

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimationGroupPhaseRenderModelCollection allocWithZone:a3] init];
  if (v4)
  {
    v5 = (NSDictionary *)[(NSDictionary *)self->_phaseRenderModels copy];
    phaseRenderModels = v4->_phaseRenderModels;
    v4->_phaseRenderModels = v5;
  }
  return v4;
}

- (NSDictionary)phaseRenderModels
{
  return self->_phaseRenderModels;
}

- (void)setPhaseRenderModels:(id)a3
{
}

- (void).cxx_destruct
{
}

@end