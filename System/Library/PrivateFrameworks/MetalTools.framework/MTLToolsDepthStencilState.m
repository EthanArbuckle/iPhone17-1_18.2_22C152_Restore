@interface MTLToolsDepthStencilState
- (BOOL)readsDepth;
- (BOOL)readsStencil;
- (BOOL)writesDepth;
- (BOOL)writesStencil;
- (MTLDevice)device;
- (MTLToolsDepthStencilState)initWithDepthStencilState:(id)a3 descriptor:(id)a4 device:(id)a5;
- (NSString)label;
- (void)dealloc;
@end

@implementation MTLToolsDepthStencilState

- (MTLToolsDepthStencilState)initWithDepthStencilState:(id)a3 descriptor:(id)a4 device:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MTLToolsDepthStencilState;
  return [(MTLToolsObject *)&v6 initWithBaseObject:a3 parent:a5];
}

- (void)dealloc
{
  [(MTLToolsObjectCache *)self->super._device->depthStencilObjectCache removeKey:self->super._baseObject];
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsDepthStencilState;
  [(MTLToolsObject *)&v3 dealloc];
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (BOOL)readsDepth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 readsDepth];
}

- (BOOL)writesDepth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 writesDepth];
}

- (BOOL)readsStencil
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 readsStencil];
}

- (BOOL)writesStencil
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 writesStencil];
}

@end