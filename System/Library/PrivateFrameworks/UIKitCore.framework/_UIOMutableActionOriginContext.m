@interface _UIOMutableActionOriginContext
- (void)setContextId:(unsigned int)a3;
- (void)setLayerId:(unint64_t)a3;
- (void)setLayerReferencePoint:(CGPoint)a3;
- (void)setSceneIdentity:(id)a3;
- (void)setSpaceIdentifier:(id)a3;
@end

@implementation _UIOMutableActionOriginContext

- (void)setSceneIdentity:(id)a3
{
}

- (void)setSpaceIdentifier:(id)a3
{
}

- (void)setContextId:(unsigned int)a3
{
  self->super._contextId = a3;
}

- (void)setLayerId:(unint64_t)a3
{
  self->super._layerId = a3;
}

- (void)setLayerReferencePoint:(CGPoint)a3
{
  self->super._layerReferencePoint = a3;
}

@end