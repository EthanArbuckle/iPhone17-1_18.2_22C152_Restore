@interface PXGMetalRenderSnapshot
- (MTLTexture)texture;
- (PXGMetalRenderSnapshot)initWithTexture:(id)a3;
@end

@implementation PXGMetalRenderSnapshot

- (void).cxx_destruct
{
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (PXGMetalRenderSnapshot)initWithTexture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGMetalRenderSnapshot;
  v6 = [(PXGMetalRenderSnapshot *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_texture, a3);
  }

  return v7;
}

@end