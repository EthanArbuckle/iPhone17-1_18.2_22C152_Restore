@interface VFXPrefabUpdateOperation
- (VFXNode)destination;
- (VFXNode)source;
- (int64_t)operation;
- (void)setDestination:(id)a3;
- (void)setOperation:(int64_t)a3;
- (void)setSource:(id)a3;
@end

@implementation VFXPrefabUpdateOperation

- (int64_t)operation
{
  return self->operation;
}

- (void)setOperation:(int64_t)a3
{
  self->operation = a3;
}

- (VFXNode)source
{
  return self->source;
}

- (void)setSource:(id)a3
{
}

- (VFXNode)destination
{
  return self->destination;
}

- (void)setDestination:(id)a3
{
}

@end