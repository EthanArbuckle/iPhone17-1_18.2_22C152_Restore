@interface MTLToolsSamplerState
- (MTLDevice)device;
- (MTLResourceID)gpuResourceID;
- (MTLToolsSamplerState)initWithSamplerState:(id)a3 descriptor:(id)a4 device:(id)a5;
- (NSString)label;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)pixelFormat;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
@end

@implementation MTLToolsSamplerState

- (MTLToolsSamplerState)initWithSamplerState:(id)a3 descriptor:(id)a4 device:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MTLToolsSamplerState;
  return [(MTLToolsObject *)&v6 initWithBaseObject:a3 parent:a5];
}

- (void)dealloc
{
  [(MTLToolsObjectCache *)self->super._device->samplerObjectCache removeKey:self->super._baseObject];
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsSamplerState;
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

- (unint64_t)resourceIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceIndex];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (unint64_t)uniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 uniqueIdentifier];
}

- (unint64_t)pixelFormat
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 pixelFormat];
}

- (unint64_t)gpuHandle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuHandle];
}

- (MTLResourceID)gpuResourceID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLResourceID)[v2 gpuResourceID];
}

@end